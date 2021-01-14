Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.53])
 by mx.groups.io with SMTP id smtpd.web09.668.1610627400634589624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 04:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=smyr3tWg;
 spf=pass (domain: kpit.com, ip: 40.107.138.53, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9P62ahPqNy+ZiZloRhwWfkbVqBKo21P7Zrex7ggx6Rs2umDdt+Fqf1Fs+PnzjsGDGRvAWC7F+QFKL9Yn4ncLxBBuyZ8QGCsF7zfixT1iFDVlGP3AxRyKszRZLapCih5U3jo+2FIncHTsrF1fvcxmbCOkZaUDCe8YM5e+k0vZejY36FcUCWXDBVVq00+eW7+hACSzPprVjPp3lQyY1iUMp4kpc6izPXW4MJZlh5+X2QsW2ulIuZTsuuk8aqWpdBQ2xQvxh3s943cSuCIOwlrihoD1cUIcO2fnuCKErOBYQe/VT2IbT7Kd4BZJoNX2wXAHWdZbZBOmyGCmwAeaPp3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WfPRucYSND1FDQFO5Iq835aH5LeZ6Oxh3aeqLxiAM4=;
 b=J3J1kjjd/j6C3499KqsNCZwnu3WBT9SEX9ckWWLruacGWFbY6rx0LfC7NBagpT2eQOwP9qZnvykFe/GDQN5f+6Y2ejt3SVcOoFSapl+1Nv/2vhTZ+mtspEFWHCobMle6+jT7xoUkW92RsEm5+336qEWNGWRw/RpHHGPuzgDWtPADqVtkCHAaP06mgJoVFiBn57FTgZAqE2dRLdyLVO575KznGN5ndL4yxnNJAhR6gIr3VI3Atra/CJdSIXALE63xf4P5IvgL2hT2GjWghE4nn2yWHakhftTQStmE2ZuiNZsCNwsFFYCRyU67D1ydVx9hJpbzc05br4AgmEMFt2ZH3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WfPRucYSND1FDQFO5Iq835aH5LeZ6Oxh3aeqLxiAM4=;
 b=smyr3tWgDBEytzqaHrdH5gGISWat5QxMaENys324EopzDPqAx1pzEfAx9si97NCiEtdCote3m4IrpDapE1wvDFJ/GDV0Emm6rLQ9RlO+cpjfeQU5Pvk2vL9xBQ9Z9cxGefbOHmk/a5TLmGApoULSBYMYY/QgebAjUzTrVCO21ZM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PNZPR01MB4494.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 12:29:55 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1%7]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 12:29:54 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	=aditya.tayade@kpit.com
Subject: [meta-oe][dunfell][PATCH] rapidjson: Upgrade SRCREV to latest
Date: Thu, 14 Jan 2021 17:59:44 +0530
Message-Id: <1610627384-11461-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [182.48.232.78]
X-ClientProxiedBy: BMXPR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::22) To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (182.48.232.78) by BMXPR01CA0082.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:54::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Thu, 14 Jan 2021 12:29:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c6d74b82-7bef-4a06-df8e-08d8b8881921
X-MS-TrafficTypeDiagnostic: PNZPR01MB4494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PNZPR01MB4494437B652375CE633D8B41EFA80@PNZPR01MB4494.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OCqzxbMP72tjtZ5GH/y7zDM7pQAh4ZvkGhHrx7Bi6ujx5hktHov1zDdLG0TKDTP1lJgPBkBny64yMvGVq/okWk5cggtrMTAITVNW9899LBE2wL2Bm2uvtYtQ95f+Gp3E1TldzoXgy/mfhZwPZTmrxRwxyv0m36fNiYFmFiewUENAXgni1fft86SqIkXQHpgfVtEriBWOjbWmcakcWR1MOirmDGSTO1zJTGHg3RkkUi7jylND5iNQf+bC6Z62AE83fNwOTRLkXCRhBpS0XYCdlMM6RROar/m/Cu/CYADNI+AMRj8dnRo2h7zYPA8vs6g+x4NwjvtAayc5U7S4zwKWIL50VHDKwk5qRDyHQV0pXyTSAoYlbxeW91Q6cms/3eMZZ3Pd8eCdzHWOGbv88P8NsZq5ubBZdH+iSNdPmv4EXeSgCIvE43sLwQEBk0hMcBNP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(86362001)(186003)(316002)(6506007)(5660300002)(16526019)(26005)(2616005)(69590400011)(6486002)(36756003)(478600001)(107886003)(66946007)(52116002)(6512007)(4326008)(83380400001)(66556008)(66574015)(8936002)(66476007)(6666004)(8676002)(2906002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?fEHZ9PdvXgtaxkcXxT6IZ1a1qLe+6XajUMhhnbvpJcaJcxojX16b2fIuPbus?=
 =?us-ascii?Q?AviThQurPE+EoxD883U3sdKTdegGFxiA257CS8H2OOXMJuuxdbps/F1kjEge?=
 =?us-ascii?Q?lUsMo/KTjqtIwwlQWeM0fnFtLOno1Vd2MBrRpuv77tKiJb+taDWqD7f0Swup?=
 =?us-ascii?Q?ezJ+VWh9KJtBhtfUJksB5qRpycOSpJ1WEd1dxpre9BKcgNZBMT/ndVvLRUVh?=
 =?us-ascii?Q?TGEhlDvnJL6plcxsbKWn1QVVNmg9rvneqzSLElqH+yPZfDSGPoCwclzMZCwr?=
 =?us-ascii?Q?ajLTeT0odF48of2DuEqbHCPuJ2M0pP80opB4HLQVza6QmcnHNn5hgdRrxXVd?=
 =?us-ascii?Q?lUb3CY8ItcHKE/kpc8NlndXvHoYsO+gPN6d6zsJh7FCgKrgVCaLGusFdXqHT?=
 =?us-ascii?Q?65WxudxaWbblhKYlvVn4yRJ2RJJyQTYa0szBOcEGKTl8NP2GrBByNqD/o4ZJ?=
 =?us-ascii?Q?MUZg42nMaI14adlRIShCVP1OyfjNb8ZS0cWVIIcWUSWrjo9Lj6ZQkTotuRFR?=
 =?us-ascii?Q?OnArkKOQmADk+Pjqy7ApiAgJR3cBsiBbdY5OiBxiC0hH6InGSLkrWaEN6LwP?=
 =?us-ascii?Q?npj58bEsgMG3Mo0lObSPcllbBhwicc9rRn/zR+EXpoW1JB3jYDJuznM8QaeC?=
 =?us-ascii?Q?KNkCwKIrCWDrhplc5EfjtZNPAkSxWKAJb+hVGpGSWvf2keRngPF8D07SmTQv?=
 =?us-ascii?Q?p1ENBew8K8+pAWa04Wq9HouE4Y8d/kXv+yH+umSmoLq6VwSmPmuQIaahUTkl?=
 =?us-ascii?Q?1N2vRzgOA+LeZW/poNw3hXP9J/Wb5JaGnlHtou4ChqMugXuZC7WyPDfiqFY+?=
 =?us-ascii?Q?aCqgFWIEc0DUYxQVECp1PmDq7NkNfhJG9XI4fB6n4+L/1nnD22twnBLfFZlm?=
 =?us-ascii?Q?4c9qUop1Dpt0QNPCRA9h/IrRBVaWshr2GCIYvyWH3W9FAsKgzLxs2l/bwx3N?=
 =?us-ascii?Q?+FxDzc417kcHrv8Ag+HLJnOm/NCnExNLGVI+eLAsyNZ3e9PpBWTLVmAusmES?=
 =?us-ascii?Q?BQHU?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 12:29:54.7169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d74b82-7bef-4a06-df8e-08d8b8881921
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/HJmeUKnIjStRr0YmPUWtKBQFON6qTKy5dnaiFlYV4o/oZhkGmszkTIx70NJH6eAstgShBpYAbgfoXKbSfeXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4494
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Upgrade SRCREV to latest as it fixes the below issue:
Running UndefinedBehaviorSanitizer on projects that use
rapidjson triggers 'applying non-zero offset <NN> to null
pointer' findings in 'internal/stack.h' which are hard
to suppress by library users.
Removed "0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
as the changes are already incorporated in the latest
codebase.
As per abi-compliance-checker report the source compatibility
and binary compatibility between previous SRCREV
6a905f9311f82d306da77bd963ec5aa5da07da9c and current
SRCREV 0ccdbf364c577803e2a751f5aededce935314313
is 100% and this patch is already tested on 64bit
ARM (aarch64) in a product with on target CI tests.

Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/=
recipes-devtools/rapidjson/rapidjson_git.bb
index e3ed9c6..5b5c8b2 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,10 +4,9 @@ SECTION =3D "libs"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://license.txt;md5=3Dba04aa8f65de1396a7e59d1d746=
c2125"

-SRC_URI =3D "git://github.com/miloyip/rapidjson.git;nobranch=3D1 \
-           file://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path=
.patch"
+SRC_URI =3D "git://github.com/miloyip/rapidjson.git;nobranch=3D1"

-SRCREV =3D "6a905f9311f82d306da77bd963ec5aa5da07da9c"
+SRCREV =3D "0ccdbf364c577803e2a751f5aededce935314313"

 PV =3D "1.1.0+git${SRCPV}"

--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
