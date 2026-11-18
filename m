Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14971.1795015264024505490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 07:21:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=b0HNRNw/;
 spf=pass (domain: est.tech, ip: 40.107.159.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMhwNRHDwNkXNgbLGux0s6ckZkKMbEnFxbQF0C3hq5j4HstVdr/n6LWunLGTjd6M6gT1GEVKAnQuySG4jintIUs69V/TZf/D8GYp0PGTHR3EnSPZJ8bGs5qPvnbi0HMWXGwGl/5poCh6see5otA5JSC3lh8it1Ht7Kve0X0KNNHate61wiZe8JLZPROd8JtI2AG4wDin2Y+gxhBWwsAuyGoN9zEd61vyvLt1gKiCDvGNgvUQVusg8KsgJXeKB/8PJc43KteRUMhsQvfQd9kAU1ZmUvsEmUhoszMdqtaw3iTIAdEt4BhgI52PmSLuxZN3Dsofzx0GEBlOgsxPPd68Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGec8tXNuhV6q1eJEPbn3EDtWGPw4AZ3tLJ3d0BGB4w=;
 b=fIhLrsK/Uka+/vy7kUmohZBBcCmEpyROX188/5eJOFu8YItNKddMer68tyjQxpZXWFmc+93iUZtu81TkdpaWbQtlgCJq4105txIKXztR30s7ZCpcJPy2jm19hBOICPdxjDFGWZ3YUpQeU57qqOYfRzwGYVAMzXDbRgjuY5uz6vjqJPEJ61MupmTLTe8tpGHH2hH6VwDW4K/jetPgpjPTMy5H7cgt589rVcf58+7Nbu8kQBknJ+QpmZxRBYbqgBiy8XEoUBlhiIPdlSrOG4PW30SdlPaIfXiBOtW+NJldqdUmqdT7MFCaywrfM5kpCaN3QopJuHFbdysGq1DdL+i2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGec8tXNuhV6q1eJEPbn3EDtWGPw4AZ3tLJ3d0BGB4w=;
 b=b0HNRNw/xy2/J7IEdmoXzksLMzSkj5nWw6EXnB4R0tJwPqGHq25qT40nozS6s+Lj+ImefAUDog/OLGrgOZkZfhRHP/5un1GoZd5IBHYgCZcFwfNwE4WO/G/FuanWx59VQPH0cNAnGxhjmK5sHETJJLGoALpWjaFbX/mUra0s0x5tw2zFZA6E52rCoF8ek37LWBIASoPYXBi8VxKCxpHht9GSsYiFeur1bNnEj0MClZZzzisfYpSLc8M+5pqfjLCuHEgkdRL+rOxdMJZqgsJUrm8bHcm7ARkW6u1yYvWchjxIBpiy7hje6adyXdW2LVxERZRY1iwWJ4qtcga3nTpurg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI6PPF8FC981689.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::19f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:21:03 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:21:03 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 2/3] binutils: Patch for CVE-2026-90828
Date: Wed, 18 Nov 2026 16:20:57 +0100
Message-ID: <20261118152058.24250-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261118152058.24250-1-jaipaul.cheernam@est.tech>
References: <20261118152058.24250-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI6PPF8FC981689:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a1e3896-ec76-4c0c-a811-08df45878f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|6133799003|261009223027099003|18002099003|260925021311599003|260925022911599003|260925021911599003|22082099003|3023799007|13003099007|261026121527099003|261021123027099003|261021121427099003|261028144727099003|261022105027099003|261102123227099003|56012099006|261026140227099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: t2L2LxoTKv55tpbmFYlSJGOAHJeg4GhURNomQw7ZPee0ALqUi4cMCNSMlzZcO4j46AycrTrmQ8zeS3RTtZxJrNGFfCJ/l9mGx7z65REAM74Jy1pHLfnPUUC/ZicWYWGX6j9eaDjQL08teNyQ7jsexAKFljSoKZGnZKu7fe1ucR1QtkAwhaqFJsH00yf/4Vr/dUoWZ7UdP8w6bxbsLYQ4UyUvkEtLW2b9IqYo1G8A8QEYaihR49V3cR+ZTfQY0XE1INWTRzn8VkJeIdFZCpanH/ACSvx/3AWPJoPc4rATgWcjabNCUFhbx7VwQ8Hyo19a6gw/fv3C7ZPEJn8Tc1TIWIOeGuYLQw3wM07f1YfSrZQdT5GqTCSGtLIDZaD3iowWgLbHoKHHH26MgZGtKixxcZVS9eGAyaMHTeVx9wpVWgmx0eDLmV0qjTUxU9OBdEOHdRjnV6cl/1ABIljVf7kKCD+8QePbzaTnrv7CmXzicM7I8vtEqp4aLK9VhwfOCiTLbG41DYm7X4sF2Okejkti77qsJHzBOFrs2ZFQxFTEuiMmOPb0r9ry4oxUAk+omQt9Lgo86BZ99KMGHVP4S4KnrHE6LuEmhKGhiHbXd2/FBb8eyhDkVsC7ywfSEyHgdG/p
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(261009223027099003)(18002099003)(260925021311599003)(260925022911599003)(260925021911599003)(22082099003)(3023799007)(13003099007)(261026121527099003)(261021123027099003)(261021121427099003)(261028144727099003)(261022105027099003)(261102123227099003)(56012099006)(261026140227099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1G5xmuo8QZaBsTSeMeewJZwA+jMs8wlFgxw/s17LMrRlV/LJVTRStSo6rLKd?=
 =?us-ascii?Q?R1kZqn8Ve6Kf74tgr5kfoCA/DaF2NcudLEcM5hvWachjjAF4GltkEWRtLLW5?=
 =?us-ascii?Q?Sw/RCZZsJjfcnTLR7KYJlRUheQHQj5wNk6sH0amk3KpFyT8MVwdyrNw81gWv?=
 =?us-ascii?Q?ip0ZpWPUDVGOjdHsp+ElJPdteBYeXl8Q3WuGdIk0mO7FHI47y9vZHLLNvwtU?=
 =?us-ascii?Q?Z+ZNDGkOK1kqdLQp2c+qDLNwa6XNuI2cxKsKRerOAKqVam3S/kjbWF+b8qEm?=
 =?us-ascii?Q?RPpvI6ROk4R4g4uQdyWLqj8fcvJKsTPjPXr8Y2A8IVifyx6xMZuknDFfhCUP?=
 =?us-ascii?Q?6WgN1F6oK0urSxT2dIaspoF47AIgBTb2gKoVwNEWJQf2z2+Ctxroq3OrtJgA?=
 =?us-ascii?Q?8Mlk1kJhsTXxFFUqMn/rG7Et8aVmmULKYFBFDYmsT4nZ6KOxH1wGQ+fznNuP?=
 =?us-ascii?Q?jTEUhXy8EBeTC5o2Qp/HGbuVQstQnjPdkexBD4qI83PS8YSmcaSQ8pEcWgcn?=
 =?us-ascii?Q?RjO3E74c4dK7x+JeqfOKH/bQ7NArknOMpO4wfa5mVqjwwzQ9mQfAOM908p8x?=
 =?us-ascii?Q?LrIWozxil4WbSEQnT6OYEqCKbyRvs4wWdy2OCfciUpQqb0sFoE1jKDRXrK/0?=
 =?us-ascii?Q?NqtdpliJAS9CVWqvI2VH7fxHb86GFyAaNmToN4/7qmkZWHPLIYM6XhgomJfV?=
 =?us-ascii?Q?ZKCuZ/2jo/kXyWM6Q0FeGNyBRaJ+5Vt8ex+Jmb2W0BtKxEkglKH0c+mJ0rPh?=
 =?us-ascii?Q?efTLsqb0Zkb81pFmmh73mM7hX7dZDAV/dID6LIO0WKTWx/L/ZjMbWLMjjyuC?=
 =?us-ascii?Q?8B0VoZtnkv9DuiqK0ukNXuoencTYD1BiievLvhffc7E1Zdq/7NELLpb53H/A?=
 =?us-ascii?Q?1FWGsG0NQ6xLef1yHUAsT5wkW6eE4l65SC9r1tS2DVVFuLhsdJiZbC3oENL8?=
 =?us-ascii?Q?pPEqdi/s1c7S+8Cdq1gSLcAaqgAGz6kJ/xWAO3gCT9S8CIU2xD70XvPfTGta?=
 =?us-ascii?Q?HtYZsts6eCvY6zWPDhu5CpUbIkSJsLXQURWAOP+nGRxg1ra0wE7xvjnKdPvf?=
 =?us-ascii?Q?cXRx2puFSPzq6/CxZgnZ5H++jRzc+eNKxuPko7lNm47gRCqPdUvgvNCc+0iu?=
 =?us-ascii?Q?9u0tdvO16SL6EbD/rXa3uBVsygdVH2cGuGd5aMyr5aP8T1FaDOJhl3yKOMjO?=
 =?us-ascii?Q?ZUG+08MptawkllKiplsHu0+K9hWEfCLjmwv+ebbPo5X60/TPFf9HarxcCSLJ?=
 =?us-ascii?Q?X2RHAXY5ZxXyg4Dy6ZZQ0oPu3rEhzliBWzuFJpiXWVCbBCBOJS8vCyQKyNiZ?=
 =?us-ascii?Q?NIjBazwiAVUCUyHxo9WBMMIgLlacZikiZWTg5rIH+NPwjaJlZkOTas++iRV1?=
 =?us-ascii?Q?gmoZTmwcb9k79yqScx8j+AR7lwy6LwNihRGhZgeTcqAT69zl6NhWrf3Qki4B?=
 =?us-ascii?Q?YFmUTEmkRbUBVqCOf8oWwKU31amzZatrnobclzZZvK35V+y7QkYKTxCFemV9?=
 =?us-ascii?Q?9b2GdWyKHeDiZCKewiOr5ZAAx2l1uGRfvyKSsK+8VqYLWrHcCv3j01Hk5YvS?=
 =?us-ascii?Q?CcIEGnvV4BfIaeuFFrKvX/YN/E0eseuLGTjV9W2Km9r8uBfKS9cJlDLWMrJE?=
 =?us-ascii?Q?zXQa0tqRtKjomkE8KDsM3NLqTMikKufV0CVjBZVg/aQYSuz6dvFHT5yPvNRq?=
 =?us-ascii?Q?RYVdPDeEZE52cE8s4EKY+9atBun4nz36S1gKHkQyou4HMUw9sMqXX37+e+ra?=
 =?us-ascii?Q?aqW1LPAVFA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a1e3896-ec76-4c0c-a811-08df45878f12
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:21:03.5153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoMgBAilXv0G4kVze+HaE+UXXwEFj7+C2COhuaEJIR7EBeTneCthGHvdR519nyCV9anXIS4l4lBsdIbLXqi5Jnq14Fdk7T4PoOat0xyT3q0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF8FC981689
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250563
Content-Type: text/plain; charset="utf-8"

backport [3] fix mentioned in [2] for CVE [1]

References:
[1] https://nvd.nist.gov/vuln/detail/cve-2026-90828
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D34450
[3] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D123e4a5e=
ab2db300b44288dcc1a29c903f9622f9

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.46.inc                |  1 +
 .../binutils/binutils/CVE-2026-90828.patch    | 29 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-90828.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipe=
s-devtools/binutils/binutils-2.46.inc
index 10a15f564a..2f63c8d8a5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -44,4 +44,5 @@ SRC_URI =3D "\
      file://CVE-2026-18220.patch \
      file://CVE-2026-3441_CVE-2026-3442.patch \
      file://CVE-2026-91781.patch \
+     file://CVE-2026-90828.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-90828.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2026-90828.patch
new file mode 100644
index 0000000000..a84e1fb847
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-90828.patch
@@ -0,0 +1,29 @@
+From a8d25ed8b1ac9d8e47fcce90cb901bacf863074c Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 22 Sep 2026 21:27:03 +0930
+Subject: [PATCH] PR 34450 SEGV in elf_orphan_compatible
+
+Don't trust that SHF_LINK_ORDER set means linked_to is non-NULL.
+
+	* ldelf.c (elf_orphan_compatible): Sanity check linked_to before
+	dereferencing.
+
+CVE: CVE-2026-90828
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D123e4a5eab2db300b44288dcc1a29c903f9622f9]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ ld/ldelf.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ld/ldelf.c b/ld/ldelf.c
+index 3d36e033b0c..50eb8d18799 100644
+--- a/ld/ldelf.c
++++ b/ld/ldelf.c
+@@ -2087,6 +2087,7 @@ elf_orphan_compatible (asection *in, asection *out)
+ 	  || ((elf_section_flags (in) & SHF_LINK_ORDER) !=3D 0
+ 	      && (elf_section_flags (out) & SHF_LINK_ORDER) !=3D 0
+ 	      && elf_linked_to_section (in) !=3D NULL
++	      && elf_linked_to_section (out) !=3D NULL
+ 	      && (elf_linked_to_section (in)->output_section
+ 		  !=3D elf_linked_to_section (out)->output_section))
+ 	  || ((elf_section_flags (out) ^ elf_section_flags (in))
