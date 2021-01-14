Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.72])
 by mx.groups.io with SMTP id smtpd.web08.769.1610627639266049957
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 04:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=ltYHlN+M;
 spf=pass (domain: kpit.com, ip: 40.107.139.72, mailfrom: harpritkaur.bhandari@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PozYqTocaJdNw0Vw3q5gFOLLkGF+xHfT2w+fRV3E24iyD/nbkAGFIkDoiy6wvx9URB+vPbkem2dsIRKNOdOD1lsLDhB4I2BISB3e2JphYr3DSNapFSSUF7FUyOI7VatWpWRPHemXJ3TpM+6DNL0dE7VOPhMETJlQqL2hycl5uwjCD9XFsej/2yLJx7dizZmMxCDBgr8tSmMENwzdwWbH14Q/A0MYuY12mTLvpwWhgHrLqnE2KbNPSLnBcUKLvqtoXKpuLV2L3M5s2XIFTthQUafnQK7cEKrqK7zcI2ZCbdqPwUbEJhZjfPOz/fpzP+/lbxhPIgAXKR7OzsQfC78JNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WfPRucYSND1FDQFO5Iq835aH5LeZ6Oxh3aeqLxiAM4=;
 b=blLkMD22S/UsdiAlNVkOklBKa4QwubKP0N1wGcLS+1Jc6ynuvRygmT4FJ7sNDwU3eQr/D+gFXDddu7JiW+96qaGBhb9QI0FZo0teWXRheQPP0KTR+D5kUAZRDFywlCawF63AXtjxFJaiuLkEobe8dVOPjrMNBU8rEF7WSSjqT/pEy6hJ1mFq5qDqZH5R+YXoEQTbvE22MCRdalwFMmN42CoePgXL40vJ/dsfXha4O+4hqJvjPjU7gym5heHsnLaluU6SYomcjz4ly1B3e5qeo/XYKdqi4roqsYReX/qiPqUXVi7YgcKAtcLRH4ov8rngDoLPy3iNiXipRnE7TO8u8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WfPRucYSND1FDQFO5Iq835aH5LeZ6Oxh3aeqLxiAM4=;
 b=ltYHlN+M8TQWkutM/77cCklqEuoeOFBO4IcHKXu2vVtCzEV7O/bYIlfV6td2wTOseOCVUSMQPOMOITB2zXsBILolPz6Zoow3e6ZY9psEulTqlsJPnDpC7mOfXhdoPUUoxPoAhN+9GMIMkmve02miE4jb/P8Syto9KnkLcdjyuNo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
 by PNZPR01MB4158.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 12:33:47 +0000
Received: from PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1]) by PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9d4e:7536:7e00:3cd1%7]) with mapi id 15.20.3763.010; Thu, 14 Jan 2021
 12:33:47 +0000
From: "Harpritkaur Bhandari" <harpritkaur.bhandari@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	aditya.tayade@kpit.com
Subject: [meta-oe][master][PATCH] rapidjson: Upgrade SRCREV to latest
Date: Thu, 14 Jan 2021 18:03:31 +0530
Message-Id: <1610627611-12109-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [182.48.232.78]
X-ClientProxiedBy: BM1PR01CA0107.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::23)
 To PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:16::13)
Return-Path: Harpritkaur.Bhandari@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (182.48.232.78) by BM1PR01CA0107.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.10 via Frontend Transport; Thu, 14 Jan 2021 12:33:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a93bf2f4-7809-4c13-fce0-08d8b888a383
X-MS-TrafficTypeDiagnostic: PNZPR01MB4158:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PNZPR01MB415822E2015B7D5D01F46F5CEFA80@PNZPR01MB4158.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8WAAvI34Ec6aAPMiCJvQJeGr/4iYX3PKk5SUrnr3dPGtMZNbeV9khYbQOxGm/kMAGDJaV+4s0Ki86XUtInAIV4WlIsydXVRE2HLEbGHnIbrwmqVCTA1Eh+/QL9o+TlrgJ6/4fziacqBKzv5q1wSdXCVs3RjvjiZhf7nZKPY0hJJYRzFnnA/ymCM7HyTr6SsqdXA1fc1z1966e7wMkElHuEbh5KWM8LxOO8WZO9oHRp6Zp7oB/+hl4T+i9tGvmRnxL6N4BccG0ogZWBMZZ8t8D4t2sAnQ7KSzlRoKtsNRIkY3k43Y727BAjd8pmJOsqSdmcVXjkbsSUzfLErMR7MGwgjU4XaSgvC6WK2iFYroylKiVwKMajVZz0FrxB/ZYBxxFvVlbpUM4hUCQQ0BICTIrKmACoEuTBmpKU4SsZlYY25p/aiLaAC0lounryEy/E6A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(6512007)(8676002)(36756003)(8936002)(2616005)(52116002)(86362001)(107886003)(2906002)(956004)(478600001)(66946007)(5660300002)(66556008)(316002)(66574015)(83380400001)(6666004)(6486002)(66476007)(6506007)(186003)(26005)(16526019)(69590400011)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ZfoWntuSFLYhE1c+zFdXgcV2gQ7O4qmFGDCBxXK5bh5bvEdD+0jfXlSA7EUN?=
 =?us-ascii?Q?Edd3pavFgpZYYw3ZZAuFS3nIaDOYomyP+Kvgqt0r5ls5oZGHhlJ9AUvPiUQe?=
 =?us-ascii?Q?YqyyJ8uGb/ysDwSaKkK7ChFu5obZLAT4hQ1ajaJf2fSs01ZLyOiSJOaCgQkS?=
 =?us-ascii?Q?lGXhpqvjN+eMcaNpeD00onp/vfao9Ep0B6bAHyBbY7uJPCxBfNAkA+GDVVVP?=
 =?us-ascii?Q?/+eSF3aXbgkX5Q7Lll83Ex0OfaliIDiI7O9hqsPVQpjKDhcQrbpUk6HKwfmr?=
 =?us-ascii?Q?2LX7UVcSg/eZsEXS3laC+0nR1RTd1eBfiXARlRL3+CYeAroT9Xy4NRClLOVQ?=
 =?us-ascii?Q?huX7E+MZ3oMRHAGV7PhbAeRIZ1uMnF0ouffJqVH9BQ5LnO4WZkFJAxrSgRWr?=
 =?us-ascii?Q?wymTfRCM8wKCcrF7A5eTpKEImeynpRvG9Bl+LUTNwM7RnrXQJH2/gk0tg02I?=
 =?us-ascii?Q?JkmCFQHBuIgglQPz8GfwjKy9A1V81SbYVkY2ioxKD6f56qLfk7iLoJGG/3tj?=
 =?us-ascii?Q?tBeG3n+wK1cHm5PQLQZdC8Tf7OgOEm47k2yosUBjyXPZ6APmj2qcbF5Bmjg3?=
 =?us-ascii?Q?Vfb83tmU8AD7fDrwlCAHtLYd2ANxm+C7w005xnHEyerRjS+O1fxHA4Sk95RO?=
 =?us-ascii?Q?42GnDdeCkHG35htHbirAtmKstq963WJogUMRqk5sQoN5SUOuqmsbqBfw6I6M?=
 =?us-ascii?Q?51w1CPmyn6vVjRwFKMKqc1b0ywyUST92akak6OxNjQy6pF+vm+Xk0qhqVJMU?=
 =?us-ascii?Q?cs5TW4adHQg9h94N4zZZcCCebqm7+ffZr7g0/jH62JjndREjTMbK5/voi0QP?=
 =?us-ascii?Q?fT1lgb0w7uWqGreNEWrDwnf+gq1S3uLROowHWZ4KUSc7AY95sFr3ByXiDqEI?=
 =?us-ascii?Q?LuYTAjfla7fMOJecXevpJS6RLiUwGAeebLROlJkX71WSc3PIMcYHp1nYMOBt?=
 =?us-ascii?Q?e7GpDV35nbSBwR1W8BgaRcHEV/CVT39WvnIAebWva3crcbXErEPUM7MgXCJk?=
 =?us-ascii?Q?hI1v?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4410.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 12:33:46.9402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: a93bf2f4-7809-4c13-fce0-08d8b888a383
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1Fc5ThjIQcs4+2Id3tslvraXyQHO1qEWAEpMvyFE1S1c7oQRq0nnJTtCEd6l8BXmDnI84PjuYOuG3iyuDclJA==
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
