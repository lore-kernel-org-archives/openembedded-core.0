Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.87])
 by mx.groups.io with SMTP id smtpd.web10.1705.1622055380470675465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 11:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=klGXvnYg;
 spf=pass (domain: kpit.com, ip: 40.107.138.87, mailfrom: nisha.parrakat@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEXtYkXB9Y0WCP26c1zhAPny7MfDSVcKtuTgAuPPF6WP3QLkEYeqmGR/4PQGfqQ4ueEJs5mQPrySBN+oTOLeb8UdJ/mxZs7pbDFErVQAYT6VqpcrzxHcss9qqCTyzQ91c/5+opd2TdzHqsXxsebWXVEe5qxJulHZv6o95Fq+dwPybs6GMptHddyRmNQkJok+bD8Fz+HeQZmv6eBvjc2ONnicF23xw0ZT/f/cpTBs0OociPHnUS9mBePoIdQZJcUvakEDnmqN6v2Vra+YhHfVT1yzcSYJMG1p0HEGBlxRXqJ3ALl+aF69+wFXMl88pO1Tdbbh8L16zQloh3L1SLoY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilwMf+rIuLcsxZQQnd1UZDMFu+tbO3eT6CHXzOIs70E=;
 b=gLGYLCqfQdJmRDlqaedvtV5q59jSyofFWfo7YQXNo+RVjKIcbDUmrHfzYDh8mZ64+aifbyTkDLUjIi8JAKgkkYVFmoZHxhOJ1iB2d7fnFO/1EoCBRDXjCL5qTBroAMUYKdIkdBR7dcPpwZ4YIr/fYFSGIkVwQYk3mQESehD/L0D+fm9Usm8NUB0HvPIkLyNy0am5OquCHs1KFMQr2W6rkTaFcRvGzdXvNdmTc1cplBKCimaaAKFX/KjS64lrmJyyJ+Cy6GlLCXH3nSOks6G74VKtC+1QjgDwH8iybtOV1S13Zgbadr67lLOstVQlM7EA5GMSVe6C/7qtvUNQVd71+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilwMf+rIuLcsxZQQnd1UZDMFu+tbO3eT6CHXzOIs70E=;
 b=klGXvnYgJo0TQn7HtwgzEfJ+QxWQ4STvgT2DfuKaIDqtL+Nn5UW1vZpG/TjkgiJbfAd+bJmY/7+aaPtr+COH8za3nZoWjGDsWNdzNNJO6Ju6Z4NUQNfbGQE7o688t95LaNZZzG2DAphH3bFAzvPmUf5jyYRRdpHBVOh8ZEPThqk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:36::6)
 by PN0PR01MB5140.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:42::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Wed, 26 May
 2021 18:56:10 +0000
Received: from PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8d5b:7904:5e3b:7167]) by PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8d5b:7904:5e3b:7167%3]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 18:56:10 +0000
From: "Nisha Parrakat" <Nisha.Parrakat@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Nisha Parrakat <nisha.parrakat@kpit.com>
Subject: [poky][master][PATCH] squashfs-tools: package squashfs-fs.h
Date: Wed, 26 May 2021 18:55:49 +0000
Message-Id: <20210526185549.15897-1-Nisha.Parrakat@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2003:c0:f3b:b059:3a22:e2ff:fe1a:a816]
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:36::6)
Return-Path: Nisha.Parrakat@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bsys_traas.speedport.ip (2003:c0:f3b:b059:3a22:e2ff:fe1a:a816) by FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.9 via Frontend Transport; Wed, 26 May 2021 18:56:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ed5fbc0-424c-427b-d6c0-08d92077ecae
X-MS-TrafficTypeDiagnostic: PN0PR01MB5140:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN0PR01MB5140A1CEAA45ACB5433FED31EE249@PN0PR01MB5140.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EjIIDqSbWlbwmTGOz2+j//KqBJxXPXTRYISnWj3Lf00b+j703M0kwkSf4acpJ63I9Skts5iBby5efCs65c5QPyukNBxEcQ79TG+eQtjXqco8Kpi3uH5bo4Il6yczlVhgNX3nRrHtldeKY2Cxtd0lTD7a1YZwOtgPf0fJXyZk8TsF59vHsNQ3r33kg7/L02NPBwCw03vR4laSOJPZyiCUmwbDkqq7K12inXGhioxBiWjjsXuZXpvELTE9WMx/zy69F6z0zMaRSQRQ+KLRWT/vurs6oCZ6XGoplUtRm3uTOuSVnoICfw0ujIK5N1NhXQ19bgIwy2gNgBUXmZzgJNrON5OO40eW1GHwYKdMZXWZ9MVbAfGiSUhPhJasfa/eZdCvFq5NGlJcnucAm1ttyiTaMkFXTpa1Au2FxAquCVikGlzZMsMjgmg/uaIROybZAg0zg/QvtLfzcuFTwKdfxG1p909jTZVkW7fTkQTAEXKSYeFKfaqsSTdzucWAuUo33EKG7LIYcuokPldZxajUw1a9UZgfwMJcrGAJkZawZYv+p+agO+H0NcFh+H6rwBJUmjS8E8YwBcI8eVdKt4HEvekD2a2ZeUb04OmH8v+INSe5EQI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(2616005)(83380400001)(1076003)(2906002)(38100700002)(66476007)(5660300002)(16526019)(107886003)(6512007)(6486002)(66574015)(36756003)(86362001)(6666004)(52116002)(186003)(498600001)(66946007)(6506007)(8676002)(8936002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?5cBA9niLi8blSxmrFm7ZRqFzu06/F9xRPhinKP/NomWfzVFJXsZ74yAtEUtc?=
 =?us-ascii?Q?2320ZzjODDvXpF46cnj/bT7OpWuih0eyk+SmxLFvL70smXdai0D0mwXeG4qd?=
 =?us-ascii?Q?gYQT4pNu9pyp1rnYY/BwqxJYbq2axZCAJ7+ejFiqEmgEIteoXRNFgx/uHzHR?=
 =?us-ascii?Q?Ejr/YB2l6M425THwaLw611sLMWxbSUhIgeXpbLLcyWueItr0AJd64rzE48VS?=
 =?us-ascii?Q?Urd1lmm0l/mZlSFGSJo1K14HAJ3KqClly8q8BPCaz7nemhVJ3pM2f+kypaMg?=
 =?us-ascii?Q?TLnkOfBCW3qDtdP30lxZ7VIV4iCFZG2T4EW50nGhz5IprCkmOtJVDLvAbu8d?=
 =?us-ascii?Q?xZ+5DV7OLjDYE8LjnmhovhDKZqxRIfdpxByQouGpvUdZ5dYh312AM8ZPWp1M?=
 =?us-ascii?Q?/ymgvsgWLj5M+AvBMbr8wOkM42TjS/DUG8juATIJVCdX03kLy+Zb8mF9kERv?=
 =?us-ascii?Q?7tKt10aImPrZ/EybCC94L59cL6q+0sliS/QNvRaR5Dvvpj9MeoECj+l2Srbg?=
 =?us-ascii?Q?BvrkISpMbRKfhHhCiGplegTFInKZTGty/ogqNGPC7U2njPsVVel+FcDA86YV?=
 =?us-ascii?Q?JG63TP1DLXcffzNCu5i/zUGs6Wfftu0ZqHRoWZdWy6/ahXF9AidnJ5Pc4j/d?=
 =?us-ascii?Q?a3MGDnoRV+RY7b5BylmbHE53JOjJYje4R7fzhPGf+DnN21DB86abgzx5N9Zp?=
 =?us-ascii?Q?QoPHKQs6RtjpJXGJiMqb/J2BI5IyR9DRUBdySf6NBy2J9+Drt23m4yFV8ybf?=
 =?us-ascii?Q?7OI3HHlPHh7P3gx9Ve2z4MSv0zBhicpLa9SmaPxyT6rNo9Dy3UnrRiX3StgB?=
 =?us-ascii?Q?ZrBsDAk3Y3gNgy6zUfbkPPIkg4s9Y4iSgwWMHVbRSiqaK56o3y5X9KqXl88+?=
 =?us-ascii?Q?Yi8HUKlYoZAFlmhtUsC1UNIfpa6ea1hURlsOLcuLSpDMC+DMGpUHTkzynyrO?=
 =?us-ascii?Q?VccL5d3000Ypa7BfiT2e1HyD24Td6br3lqRsbEJDm6DvoBNMpWiUIrpSvujz?=
 =?us-ascii?Q?k+nHHXK6zZd5R+Mu7ji6nAKJNCm1a36d2OQ3feyPjVHI2O8vG+sANI6am7m+?=
 =?us-ascii?Q?H7i8Rm6ltft0B6oogFe4K9S80EMxSh7QyAdU2eyhlzm2TWPphiEYmilrPvRq?=
 =?us-ascii?Q?XzjlOByG1SFRJDYQZJYR++tCvfA/8v5cBfHwHtCZ6tFyUd3uJ6dbamPHC2Ym?=
 =?us-ascii?Q?RBMjzuutKuf+HbvSIZglsl9lN/7twezWZU25dPGybHBvht/26yZP/maALG02?=
 =?us-ascii?Q?dT7WeXaacOttUV3BJcDInkL11jYAF9TZ7PkxJKCEAK+Ozh4vwe+1pRYU+CSK?=
 =?us-ascii?Q?X8R1DzP6fJt2NvZ7z3fAupWFu4m14qb5mQKR7xIHsm+urfUdJy6kxdfoei3z?=
 =?us-ascii?Q?1wJrSOI2voCuBd/GnqhziwQsCfKh?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed5fbc0-424c-427b-d6c0-08d92077ecae
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB5283.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 18:56:09.8990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ju+iJ7eu+WVg+5Tl7KlqeXfRtrrVol4jLNyUpJY0uRcop+83TLr0QbvW1RJamTZ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5140
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Nisha Parrakat <nisha.parrakat@kpit.com>

Needed to build the latest debian version
of android-tools
Fixes below error while building android-tools libext4_utils.mk
| squashfs_utils/squashfs_utils.c:27:10: fatal error: 'squashfs_fs.h' file =
not found
| #include "squashfs_fs.h"
|          ^~~~~~~~~~~~~~~
| 1 error generated.
| core2-64-poky-linux/android-tools/10.0.0.r36-r0/git/system/extras/debian/=
libext4_utils.mk:29: recipe for target 'build' failed
| make: *** [build] Error 1

Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/m=
eta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 2b1409d78d..137e5097fa 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -32,7 +32,9 @@ do_compile() {
 }

 do_install() {
+       install -d "${D}${includedir}"
        oe_runmake install INSTALL_DIR=3D${D}${sbindir}
+       install -m 0644 "${S}"/squashfs_fs.h "${D}${includedir}"
 }

 ARM_INSTRUCTION_SET_armv4 =3D "arm"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
