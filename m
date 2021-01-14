Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.81])
 by mx.groups.io with SMTP id smtpd.web08.785.1610627750107828065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 04:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=eyKOhJWq;
 spf=pass (domain: kpit.com, ip: 40.107.138.81, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pkf6N7jZVKfoTwLY03BFDyBtNrjyRDX3IDn2bNgJfQLy6zunvy8ea3wjuveAsAhVUmP+S4fy8RXugN0m0Z7SN5P+sVFYbimwk8aC9taRx+ybsJnyX95csmpVXGnHktXsCPVe59J8VeVqTO1T5PUBw7iDLRESINLe5c6zfj0WlMEA92JxYctzomJqZClCMsHUTVYHc9xl8+wynn3MisIR0Gceq7JF1Au0oQGMqMv4emE9WuaGaDzcJczPtS2EYBu6c5k5s1iHA7SodFSAX8MxZlFeXvt0Z/nc9M4LhztaN1PMBTt7AWFopmrem3qiksUrhC9A9zttyzHMB7BTQgihAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WfPRucYSND1FDQFO5Iq835aH5LeZ6Oxh3aeqLxiAM4=;
 b=hs/Gh11O5NKE2EAedL72Z8EP/He4VFjZ2hVLSBFYu2+uwudo/5lawulW1xnoAKqEqPwiZbNJR5mEfRIZYFVfHM+9zGbyGxnCba0kmkrsG/6rr8eq+zKKYcGspDRliORRO0/RAqO3UgEpkpPoWpxwrFiF9bsWwNeR09BE69OpiJW4hhM+rX1hSzCkR5UvRMdDQSbSO7I0RQ8d1pgQGGH5lz/AXcRj8K9K8SbzpANkiOimV59zqLZD/JFVkisbtoktLeJk3eBxL5gGEsrE4xAGPkLiHqGwrF+8TlRqv0k90nY3dByqCwoSs80ZjOdxp0gTD64PTSdsJEQi4DBJNE+qOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WfPRucYSND1FDQFO5Iq835aH5LeZ6Oxh3aeqLxiAM4=;
 b=eyKOhJWqbfe61Ws1KjjBWbifEjR8EQroldUqsAsYr2gcaNzMaKJJw5sUz4/+alz+RdaobjxpW6XRFjVnxbXW5DuZdN8AdkXADZzQxkBmi8pa3CA876SkRnrdV1e4ai8HEFlaYcQgdlcC8yJ6nN/orI9T4oo0qToX2ifMznfEhP4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PNZPR01MB4158.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 12:35:45 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1%7]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 12:35:45 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	aditya.tayade@kpit.com
Subject: [meta-oe][dunfell][PATCH] rapidjson: Upgrade SRCREV to latest
Date: Thu, 14 Jan 2021 18:05:37 +0530
Message-Id: <1610627737-12440-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [182.48.232.78]
X-ClientProxiedBy: BMXPR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::21) To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (182.48.232.78) by BMXPR01CA0011.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:d::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 12:35:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5f47f58a-9507-4cc9-f74a-08d8b888ea1e
X-MS-TrafficTypeDiagnostic: PNZPR01MB4158:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PNZPR01MB41583D8BB6DDAB21806C2C24EFA80@PNZPR01MB4158.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0jbSQvVbi8zWHTnNCYA6Rc33LygIqs5DEXHWSKXt6/qQgPbnDs86HeL3NEwiDstmOw17Y83zHveGm2pRFUH0hhSwW+Nhi5E2Xxz80MveIRIrTYxE7s/jXie1LSiUXP0trJ86461Co/reaAn+f13y4XW0wFFnlvnB/9MTKviua3mAGDTxZ1FMRb1PSAMfYbOvPxlhz/lbOeCgLHr8PmQRkVriP7ZmxUOwQQKTgJpiPS/wk8E4sj1zZym66izZIs+lKg4XzWmU92f7Si8ZgS2fChk0TlC4eT4qFqRoUBOpVtU/KyOToSE+rcwm39cK40kjGWJquSsj6ufEb4gIJOidQRiTd0rE3Qoy1nAgqvcwbXHvzKj0k5AxToOtIsyEFC7ukO6594d3klphXgOE8VrqnyqxvY5S0yULv9dC7Cgfl5mRKNSpJ3eagGsXakY/GUD5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(6512007)(8676002)(36756003)(8936002)(2616005)(52116002)(86362001)(107886003)(2906002)(956004)(478600001)(66946007)(5660300002)(66556008)(316002)(66574015)(83380400001)(6666004)(6486002)(66476007)(6506007)(186003)(26005)(16526019)(69590400011)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?uy3sUyJMgpk5eTvcY26NVsrP9gjsR8nW71UT2U3AcBfisZscKbivgG4WZZxX?=
 =?us-ascii?Q?IkwGaYRM6bz9q+RdwUjizvGRJdOEV6ofDVafR8Cd5UcBgoue0SNE4l2MWOpB?=
 =?us-ascii?Q?QGuWW44GE5UKsRJ+Sd5aZhpzNxRoXepmlYA7Hj8MeS+f4wT//WpvBgQsGAuc?=
 =?us-ascii?Q?O23lF3eGuG/ZKDVFeAOaelvqf1E+ZmemBmQpW4ULE8NVssXSEXYSf2sDMCrq?=
 =?us-ascii?Q?0masYtciQskhVky5QkuiryxdyghE7ddBYsZUJ3a2rDwot08zRTptYblMwbzh?=
 =?us-ascii?Q?gllChtUUKqjQpBegyd2BjS7TL0n8VrFXidvcG/hYtJD1cUxNNy6mg4uVpD2e?=
 =?us-ascii?Q?NZmNZtAYO44/Pp7s1IRIG4vggZuwLYizNgvMVyf8P+S38QZFxSPV42rbbUSw?=
 =?us-ascii?Q?x+MxGXPT2v8JaGng3lreEQpGTgYfTMCW+pyg020RBurCG3NJd6M2gOaEGfz0?=
 =?us-ascii?Q?aYbKb+72ahzR20htsekFezsvNkm23q9IMDoERr0bcFCtT/PGXKbliW2/L7NC?=
 =?us-ascii?Q?psHJ+QIIneNbrEDf5Kpa5xXqOBwUv8VrZk17mAnkZ0VFTnb/1GjiiebvHY5i?=
 =?us-ascii?Q?VS1i8Udoi0iNpa1UvlYjR+f13HW3a07+Xid1tNNzJQ41tLJ0+rQaheI6Lw2h?=
 =?us-ascii?Q?tB61oOB+PbSt2ylu4xe+M17twYc5BFXeLszbsIHwpCLTYt6jerIxthIE9LuI?=
 =?us-ascii?Q?IHVjsSTSy07m438FQJT24LnaBezusjLjT5uIQPcgT9AAdcuMW4BPp8klBWhm?=
 =?us-ascii?Q?zyBzW/iKS1gOEAMJgbidxeru/CzgVJ9oPWcwUXybBjNiAXN0onqMhSL31yfa?=
 =?us-ascii?Q?LSo7PPAQgAJdM8pCqINvCvAn3DPaJU4qMZNmEQH5tKgwIErY7XM+eZqq4Uq7?=
 =?us-ascii?Q?hJmdMQGPknByc/9Vo7aOx81k66liPMaUpLlVeedrRlq66iO7oLFXQO7Bt3gp?=
 =?us-ascii?Q?CGMQ8gh/6BjsUITGlZ1k7uXuw4cebcuVp3V0fv4xlcJKR1Yt4DliKBdgb9ks?=
 =?us-ascii?Q?2j7D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 12:35:45.4243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f47f58a-9507-4cc9-f74a-08d8b888ea1e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNmhVogH2Sx5H9HaWqt+xsm3eYuQnIBGl9B3AXSKRBWqySiGjzUYkglXdNbNpfcxH68SMmibCBWaYHUNJui+oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4158
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
