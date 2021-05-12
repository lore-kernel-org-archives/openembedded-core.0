Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.77])
 by mx.groups.io with SMTP id smtpd.web11.1105.1620840923576784287
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 10:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=K3cgoIpo;
 spf=pass (domain: windriver.com, ip: 40.107.243.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxpHPsHjDj4I4A6RkUkRWRzWfYS/XDL/WNL5IICyaGqMO/vR+GVRZkA8uD10B+35p8CeS27jC+Wq7IZ3ilg8XzulJ/vR+0nSX7nt9EuxbLWmTjJkwnOh51c6jmGYmr4KLYipvnDc7bY5zuT+Ma/3z6sVM+md8yNWgauV7StGHACkhsnentu1rZn53xCvpIUJS8qeP1wMzFzVCunC7uhqNQVZKw6Dff5lJTG8TeiTT7i6tFrgtsEcy4me+YFL3ngnVqHZIjVHYsDbtsG7rdPLUXgWATDAFybhtnAckeKYaw+eNtsdJ+CKX/NZtNVhJQSYyTqix/DVlRY0uncEqIIQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9chC50UMwObckj1whFTcAyxryKk4dCc9hGOayWZYEJ4=;
 b=P4WufJVwZGHNuZrIu7HkgJ2Q75787Oxt3a74m2Rdg0txSC8XN4y1cjH+j23CkJsoU5mzoUtmWjq95iFCib14hEu9Skv+q9TS/MizG0omeO/jLZNwRr9x8b6SBGDpk2nseA3O/NL4fMHfzatkwdKGOxdFL6W7ojNbY532cIKWINyyd98y+LQWiwgIdLor2nlAqAP54/Jc0F8nLM1vVtoLiI8D0FVbsNjInb28M51CgdrJwX2s260fLoy6apAmLVEAFoHTY/OBYOHmYDfSzMb5dyyc03PD85fMJX4urb3sclHsMiSXEFKGr+wCJAQnBc5rDSrkGs+vJt2C6I8fYkEmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9chC50UMwObckj1whFTcAyxryKk4dCc9hGOayWZYEJ4=;
 b=K3cgoIpoD2/BJqwqzvFryWouEj+JNBhBYE3hfb8PE8bTPbJUh8hF+FtDWI9UZqQaT87bR3lFD6TpkgrQJWsCW83otjZBND/TBQOh/7Jg7leIMzT/gUsLTfKD9p7nt2GPmtf6JFR9F4YmqnrhwJPgSjy469noPR9ERCBlg0HH3lI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3029.namprd11.prod.outlook.com (2603:10b6:a03:8e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 12 May
 2021 17:35:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 17:35:21 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: upgrade 3.9.4 -> 3.9.5
Date: Wed, 12 May 2021 13:35:13 -0400
Message-ID: <20210512173513.837481-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by SJ0PR03CA0149.namprd03.prod.outlook.com (2603:10b6:a03:33c::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Wed, 12 May 2021 17:35:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9ad03df-09dd-4a57-3480-08d9156c5109
X-MS-TrafficTypeDiagnostic: BYAPR11MB3029:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3029661F05B3055C13B2B9479F529@BYAPR11MB3029.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bxSpyZYKzPCN2nTi18ekHafXlALpIU48CLuV+Snpn4SttAWGA3gz2uIb+E3vO2Z2DXeZt2nHUfLqH7CE2DD0rmwp6fWaH0FlNGGaDcuTLu33gdwCdpmQ1gPuWdPvMHSq8MAangF9HvN//JoC38QFxdaeomeZULqAISzpzx1htGaGJRWlOeuL8HuXlD/BR3a1hVBk1qnQUsSDepVEkIzcMc/mHnoAf/yvroZAZMlPGBSkaSKGTwLQotyPc5rsi/yd7NdgG+O8Jiuvrm0WxHyJkpLT12O7vcjRoxowmC9GzyryHTBEsxrapZRz3ih0SVyFpHSoaxj/EBeKUVzDIm4swzhC8cbi7fi60eURq/zoarYN3ehXpdSj7TEJ5EJ6h/A9m75xwQtJDJku6PKosqBFXIbS5CV4byQUa7DJ+hXlVgO7m4oZnDdY9ckD9mluGEUcMBQTg/+agS1ymL/C75M3LNJs3FT4I3Pv5fgf7DcsaW2QbzQyVA2Nfi0wvWrFBTVtcKEcn/1SOEvrj4ggcX39A6GQVnoABUhPIHt7UHrbgguBIlWhU+p3BvJns+PudO1GNBtLdvExuv0EvqlYi0I2yQzbcFK2ToWEGdJfRD8KbpHQWgZELfue93vQp8xfH9RWGVwI53/t+kY/mhSxqLAqj6e7Yjo2bJ9kfulG0IZ3vTs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(86362001)(8676002)(26005)(36756003)(83380400001)(16526019)(956004)(186003)(498600001)(2906002)(2616005)(6506007)(66556008)(66946007)(6512007)(52116002)(5660300002)(6666004)(44832011)(6486002)(38350700002)(6916009)(38100700002)(66476007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?btA3fOWvkjlKa0aBV1rrtqsCg5MP30XxGW053awb2pFsYTrSJ5RxAZRj2rl8?=
 =?us-ascii?Q?ADa4bLGTcm5aqwmPGbxWFZsIc2SEz2tEm+lpL2VRSuB344JM06zUqhWBFO8+?=
 =?us-ascii?Q?OI4TIa4Dorz/or/U/a/iASSs7lua1114g4hi3+fcOQzg7iBjs4y13NXM/LQ8?=
 =?us-ascii?Q?pllAuD6C7GYZWRDlUHm2yRMJvVAh0ZtH0NcDZoLJe6/WUCz5CoW5nCr5V/+s?=
 =?us-ascii?Q?mWxlua1/60Oc8g9disQxNiAkloikpQVt8oXRNyTiNOVbAkLCjUqfjgPwtaEJ?=
 =?us-ascii?Q?6Iv6JnkU0MNkBKlx7p/PogfPfND5Juecy6f8BuSAQp5Yrv7vFg7++twUQau2?=
 =?us-ascii?Q?S8+o/N+DlBkS0fd5AoCn4+7AeEqSSJSb//WNk0jcVnn7uTLZ9GaC/nUj4Ny5?=
 =?us-ascii?Q?ZdlF3oPHPuadEj52dMeDqrZWaSjLPsoBA5tZVcJxcs2zYlcYwwyUMIt3BNpm?=
 =?us-ascii?Q?3nqEalKXAtssIDuP3WsNPA0E0XoJFr78Fyo8tDwkjumzT1c3rYn8sUrIC8bV?=
 =?us-ascii?Q?ugvvyGuqEUewoL43lKX5P9HwcNWAW7a6xjDSCvnS61fFcONNfhqusjOLRtxc?=
 =?us-ascii?Q?hFRerRmomiTHeSIZSRHiSwR4FUZMK2VQcVhob4EM7YfoEjecO6nkIF/dd3XV?=
 =?us-ascii?Q?E+0L5nKad2BxzPuUKYlrAXVhIuT1YAxuaBR4UX8PE3IOA0SKj52N+qliTOwz?=
 =?us-ascii?Q?JxvztO0aXXQyfONHlV6t6FmHcQLgAaDuUw6wq4ufX5TWgJ2J24yKFnHsWu1n?=
 =?us-ascii?Q?dbSU48/82amtdstQBHaVJkai4z050fdZqhrPrLJHEvb+pEbdl92q1iDptxDv?=
 =?us-ascii?Q?JNzhNq9YYx+o6lh80RWrQr59/kCSkkQNKrczO3I2olB7okdLaq1EHAE7+v9q?=
 =?us-ascii?Q?zNvKCXgTlvjWFO4JnT2QPSu/CFtkxGCxJOXKqdfVwUe3r3SG9qzjBTUVfxNm?=
 =?us-ascii?Q?gxWxglicfwGujlWi82Bv4TsUosxnRhqEqe17uL6ywyAbpc0xw2fsU2st0t7/?=
 =?us-ascii?Q?WEtRBsiHz/VV6nf0W04bdWDJnh6c+5eQy8AD/FefVpjU7+/k4AikhciKHOBp?=
 =?us-ascii?Q?aSXCO7KcS5IMwI14GErK/wldyYG0TWqi+8DFp045RRMcBLqq2LKupyJCveMP?=
 =?us-ascii?Q?ni2j6aNntCyIdrc9ns9aBhrb5fzlnx2iRjHa1A/no4Gnrp6jNlRSW35Vbq2u?=
 =?us-ascii?Q?MIT9/NsmXImhL7dUz1IJNgnRlcLyX4ln0jb0mchrBT/UA203fiSubvXg32u2?=
 =?us-ascii?Q?s6Bp1R96gxDeEyqc/6jmvICTUr4iIiEr0q0v7zCx8lhK5fCzlURpIqnxP/5B?=
 =?us-ascii?Q?j4JA57p/eZC5BZGv0v0SsMdI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ad03df-09dd-4a57-3480-08d9156c5109
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 17:35:21.1763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pk0O4rrAPMZOzS4/9VOzuBhjMSvx9L49GINtPsymRKXztYafY7cWeoi0rOsel+XKTAxUUdHkP9w3uB8v0qWNYv8/tI13/wUA0xLEshF67z0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3029
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Version 3.9.5 includes a fix for CVE-2021-29921.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/{python3_3.9.4.bb =3D> python3_3.9.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.9.4.bb =3D> python3_3.9.5.b=
b} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.9.4.bb b/meta/recipes-d=
evtools/python/python3_3.9.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.9.4.bb
rename to meta/recipes-devtools/python/python3_3.9.5.bb
index cb371ceed7..82177f4a18 100644
--- a/meta/recipes-devtools/python/python3_3.9.4.bb
+++ b/meta/recipes-devtools/python/python3_3.9.5.bb
@@ -38,7 +38,7 @@ SRC_URI_append_class-native =3D " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] =3D "4b0e6644a76f8df864ae24ac500a51bbf68bd098f6a173e27d=
3b61cdca9aa134"
+SRC_URI[sha256sum] =3D "0c5a140665436ec3dbfbb79e2dfb6d192655f26ef4a29aeffc=
b6d1820d716d83"
=20
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
--=20
2.31.1

