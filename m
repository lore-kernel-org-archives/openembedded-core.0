Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8717.1793357086430159205
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 03:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=GEXxkbcS;
 spf=pass (domain: est.tech, ip: 40.107.159.63, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGd4xVHp84HE8gbPtGoruaAPZK6K1JMRBzmMiN7jawogdDFSJIPaFUhD266STzNRYsF6NNuNjGk5DY5F7lQFidjSKsIeI1i1F220pOkfm4tr+BoRef/WBPcp/knFdmyhSCkZNrZ13SQeiky+e1GSHCqZ336I4jsgPOb85xdIR+62REwGLCKOOoHSWxuuyU8cX1VudNMJCzyN7fFHfGfBLnQQ4saxYRd4yx/bvUYUgozE/EO+sO0hYIRyqoTsseuGSGbJDQqUJM95OlTRRpfww6Gyu7Gdw0uevHpXNnT+a1e6mQVfTzF1Ikc3vcRop1+lz03A+i3wGzZiRKD9/0GVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Z192O3hg8yuR1oQAnPG2g9XmT6HHbYtagoq9u6+hlM=;
 b=vbFxoPuQlgZWOTr0oKdv5T0kmAJZVCdzJwl+F9ZBiVwxPpTh3exd0ltIDpom60bOGhgyYc98op7J6JJRcJ//YuoXm9f9iFYZ7beDM7Td8uU2SxnFJXKivR57K7f8oIDcPvklhC8fM+mNxDOzejzDj/+UAccxOqKiq2d3IYMZcNcuT7Lyh3cbrT/pVR+4ubnKtk/7oatE74QDSkMnyekTyj2+tFuLwaNW0eFiXGTT+R+IzZuQGTeZIeGu1qtHLQzOdspJdBRddIz1aeJBz+z1C2HYmo2dlGY3uN/I30dgKY78uP4F0FCkdrNxTT9HvbUalDLwMIpfU4JGYIA9p81KkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Z192O3hg8yuR1oQAnPG2g9XmT6HHbYtagoq9u6+hlM=;
 b=GEXxkbcS7Knk3TXd36WEwa6d0bp41SmuKjwfxd2eTlDJqAJbhUw4m1ci3JZe85Hn6dfunYAgrdgyO6Np8lQ1aKlhEEVH/RDbB/7NI31oTNnuD3uy8IQCBQpwRjEduJ0VPO3pKog1DQeRWF0FT2ty0BAtZJkRDBxhCXL2BR4czgMHII46TX6qypGFTmxn3UGhBczATRsYysopW1SLIs/3oOdRJa6HwsPcriZavRRuMRr1UIHmgl+mrEzvK3q78kIgwG2EYuHjkZ8MswZSAsFTVvdtSxVvTIQm72EHREjVZwyq9lJoP5LZribGxc8tukS7wxbZJ02PSMbpBZeJtXtqnQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2606.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:44:43 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:44:43 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] debugedit: upgrade 5.3 -> 5.4
Date: Fri, 30 Oct 2026 11:44:31 +0100
Message-ID: <20261030104439.18901-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
References: <20261030104439.18901-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0213.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::27) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dad8e38-4cf6-424a-899a-08df3672cea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|260925022911599003|260925021311599003|260925021911599003|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261021121427099003|261022105027099003|261021123027099003|10067099003|25016099003|12006099003|22082099003|18002099003|29003799003|6133799003;
X-Microsoft-Antispam-Message-Info: 4O5gfus7A0iJB+ok0dJvIps2M+HTv2RpxJiSGir2uAw72BHfpOoZO9T6mdgzR12gwIb9PU1mF7i7kT66SBsnYSgUNFlEE9VsXZkE+lwR8Sp3K6PKja8ts1E9geQoLMCOhG+nPgsCa+7T3/c0y0TwQH2dvOYoVRfhv+EnY5EMUc2+O/yJSIpQ0Iy65mVQ15sFEl4oK58MO7RDGpWKoyfSpOLzZUtZS6c2+AjPDi6kM6vnqDO3kMdaCkYySwu+3s9ibOpsNZGbmBf7IAs2ZoYAbHKNXDkCHlZto4A0/zhcwsYNL1cn9nt52IxtPtHt+lofusjs6rwJY3fujlolDgnShtOdKepddE382OXw+0L4OnrsDEUQ7/MmkhKgSs3FuCfUlMXRDQvyqGvyUcWTeReLAXTFHYG0ynksYDpRcfe323drLkj/Qriko1Au5v07G27gOkB2nceGVJRUI/5ZKwIaubixhLmy0e6+XDY+CmpjsUngquqU2iezGA5eWZa4dIEXfC+YDN5/nADU1TgeXthdt5iqp/Az42kY4Z+BZyh0WUXJV3zO9FYmPckH7+YeymyCf4cfAJblRKXIxJdkYn7CkTw3vthhf4uOfu/cmFcnIj0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261022105027099003)(261021123027099003)(10067099003)(25016099003)(12006099003)(22082099003)(18002099003)(29003799003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pW6XjtuWt+kN/xuj1gW4h6xn4kNnvsc10RLSpDlqksA0TUVeonFexDqAfcOo?=
 =?us-ascii?Q?VFgU5ETJuhcW7DQPGUXM0HLi6LRT2wIVY2/dRY7S0mvY+C2h8MdInBmpQ5uS?=
 =?us-ascii?Q?ys8Q4Tphvx72fsOXopA3XK0fDuPwFa+JioD+KyMg6EEvSCTrnwJF4uqeinUR?=
 =?us-ascii?Q?Snnp38PWRhizr4mZ0+kOHnugmRTBchgoR5XBe8mXl2qKUmlPU1sd6/zFWpHt?=
 =?us-ascii?Q?uqDSpnXYXmTKcWymX3sts8Q6MV/nwb6XmZWL1LcKvxS8CLZbxxhfjcd9kMNe?=
 =?us-ascii?Q?nI/W15CUDAjjC0RshJm5Tc54oxeIzaxb6PDdJ17xO0AdrbFpslsQUzjJcRCc?=
 =?us-ascii?Q?Qt28kV3wvWIbynRfiLEhuGKg0N39UrANvXonAGqOTNiLs7Iz1S+62KJVQFTz?=
 =?us-ascii?Q?BXm3S5DDAuYccDY4byAmGfgpgHDEtOBM2Fbc//vWDiks7AHdU3MsyiSLaVLE?=
 =?us-ascii?Q?tUDDrtQ7jGXTjAZ4M1Tp2yOYUpaAByedfbS4LbGlgzUWBu3Y5ato1rekV12K?=
 =?us-ascii?Q?nZopTcdz4sOLhOAW4WHq7OxRxThpbZNHz+2UgnIISmjPX9wIet+05aGnrXQC?=
 =?us-ascii?Q?+RmGc+mLY7R1JB+o5JuYXPgXtI5j57WByvG2saRNeyBnKbEsmf+1tYY3zpih?=
 =?us-ascii?Q?ESvhagjVgetWctN9VkTIbs9zyRDC66jfhyOsNP0UvwfS+aoYmtKs1Nl3zTDw?=
 =?us-ascii?Q?KWju2EZtRyS9TuGx9283ULubH5JPrb+ZjBxvj2/1rCluV108yqJYv2Ka0Bmd?=
 =?us-ascii?Q?9+Z3NEaoWTBkvbZXNRtkNLDvV+C7+1+CajdEuf9bGot6fsD4SGqeTx6M3QO+?=
 =?us-ascii?Q?LOEVxM8RkvhDi1oH81X5geheUHhrUO88Tz75pWT04rM5kmhAO2brdwpSIBbF?=
 =?us-ascii?Q?fQ93+d73gXEAXi9d9/AcnUB1trRt6FektCu1Py1T53pcvofl2K9Oo/aRbr1v?=
 =?us-ascii?Q?+juIeFXzkCrcd9MW9e2p8cJNuauZgy/5Car7f+ZS6wjhfn4QdtCWjV24wR6O?=
 =?us-ascii?Q?Fy4Mvhbqt8BVZIEcB6XsEdIgOEzenm/hSAlnMEqllbwyZrrzuHHIKi+mbxU4?=
 =?us-ascii?Q?uufaX/th0CzRF0c7N0T65XGfUwto/6IWAOZH731EnwyWrHlE6D8Ja3Zw5lag?=
 =?us-ascii?Q?v9V/FrVimxGb+Uwd35W1WfNCCFqQaZGIJCTvvqq9ZCxaBghDlqMBsdDJudAc?=
 =?us-ascii?Q?DRO42MIMj1D9iKBOnntEhMp0xEYIA9aho/W2RNPAZX9/HXRgg3I9p4AsS3Qk?=
 =?us-ascii?Q?KSIeGHndf8piw2XZLIkMXlav/RtlCYmsVqCiFKySAWwjA+yNcBqUDZgtjGQx?=
 =?us-ascii?Q?278t4bTCj1HfmkJSfDD048fZFLSY+VLnJcL9AefHL3wDINh4CZ8D0FOSIbdi?=
 =?us-ascii?Q?Ok0ZIIYeOWD0G/fn39ISMgF/Q8roOIKf06GJieKUn+jd4Z32Y7fM/RL4Y6RX?=
 =?us-ascii?Q?zZFqD4zoZazv8+qkWUh4xoN6ZzbhS4yospejWtOcLU6dBb+mFKDhUuxbO1Il?=
 =?us-ascii?Q?hSN9lpETQ4JwGprRdojfDuJbI6eIgq5Ne7DMfeKd1Rny0lqlw8wf7yQKtWeV?=
 =?us-ascii?Q?ZP+/jRHq3X4H7/s3p3SD2noMV3NsywPnpNcAEP3TPN8ZiYQ0ZxNibvL4aGoP?=
 =?us-ascii?Q?AI9fePM3x9yiR7J9mNxBZuI33arxOw0/j4mjlcJFYPnD1cRv8JeiDJjQ08IG?=
 =?us-ascii?Q?QXjdRMFnwdh+p2B4P3T9Z40bC+VeqLGNFj3L9SjusrtFibeW2TtQenHq0TI4?=
 =?us-ascii?Q?f12NgxKsXA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dad8e38-4cf6-424a-899a-08df3672cea2
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:44:43.1998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVLT82f0jI74SzT2UgFkht6WhDssU40U9+mbwxibM1igVWyfFjAMk8eKn/cBzeD2eI7Ke3b3dvPD3ZuL/62BedXDdMlLoRXhYUx5v2XlEoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249018
Content-Type: text/plain; charset="utf-8"

git log --oneline debugedit-5.3..debugedit-5.4
14f5719 (HEAD -> main, tag: debugedit-5.4, origin/main, origin/HEAD) config=
ure: Set version to 5.4
2682b77 debugedit: Update section headers if section headers are not at end=
 of ELF
09d391a debugedit: correct spelling mistake of encoding
655aba6 debugedit: Handle CUs that aren't zero terminated
405d97d debugedit: Guard that .debug_abbrev ends in a zero byte
bb0fb31 debugedit: Sanity check .debug_str_offsets index
1daafec debugedit: Add terminator checks for .debug_str and .debug_line_str
07a6fae debugedit: Don't use alloca and sanity check line table dir/file co=
unts
e683355 debugedit: Add CU sanity check to edit_info
140f2d6 debugedit: Use ELF_F_PERMISSIVE when using ELF_F_LAYOUT
2fe958a debugedit-classify-ar: Check while elf_begin loop failed or succeed=
ed
f09ecfd debugedit-classify-ar: Use strtol to parse -m argument
c0db16f debugedit-classify-ar: Close elf after elf_getarhdr fail in classif=
y_ar_elf
33b0de4 debugedit-classify-ar: Break early for found_debug
2a1acc6 tests: check eu-elflint works before testing --check-elf

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../debugedit/{debugedit_5.3.bb =3D> debugedit_5.4.bb}          | 2 +-
 ...configure.ac-do-not-check-for-executables-needed-onl.patch | 4 ++--
 .../files/0003-Makefile.am-do-not-update-manual.patch         | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/debugedit/{debugedit_5.3.bb =3D> debugedit_5.=
4.bb} (93%)

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.3.bb b/meta/recipe=
s-devtools/debugedit/debugedit_5.4.bb
similarity index 93%
rename from meta/recipes-devtools/debugedit/debugedit_5.3.bb
rename to meta/recipes-devtools/debugedit/debugedit_5.4.bb
index 6b5f2aa99e6..d80462500a9 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.3.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.4.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "https://sourceware.org/ftp/debugedit/${PV}/d=
ebugedit-${PV}.tar.xz \
            file://0001-configure.ac-do-not-check-for-executables-needed-on=
l.patch \
            "
=20
-SRC_URI[sha256sum] =3D "3b8c6396fe235e0270c9b9c0d244cfd0e86c284fc27e820acc=
58360e7cfa08c2"
+SRC_URI[sha256sum] =3D "00e1d74d31df9012913975b76ab0d864f0e2569d29e3127131=
7161187803813a"
=20
 DEPENDS =3D "elfutils xxhash"
 DEPENDS:append:libc-musl =3D " musl-legacy-error"
diff --git a/meta/recipes-devtools/debugedit/files/0001-configure.ac-do-not=
-check-for-executables-needed-onl.patch b/meta/recipes-devtools/debugedit/f=
iles/0001-configure.ac-do-not-check-for-executables-needed-onl.patch
index a241972efa1..ce22819c967 100644
--- a/meta/recipes-devtools/debugedit/files/0001-configure.ac-do-not-check-=
for-executables-needed-onl.patch
+++ b/meta/recipes-devtools/debugedit/files/0001-configure.ac-do-not-check-=
for-executables-needed-onl.patch
@@ -1,4 +1,4 @@
-From bb64eddf41794ca5fd85dc3fecd29246d4d9ad23 Mon Sep 17 00:00:00 2001
+From 8e96d0537ef99fb0fd6e12c647cdc279737ac808 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 17 Jun 2026 18:59:57 +0200
 Subject: [PATCH] configure.ac: do not check for executables needed only in
@@ -17,7 +17,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 26 deletions(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 4868844..8d74463 100644
+index f9ca877..0782036 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -51,31 +51,6 @@ AC_CHECK_TOOL([NM], [nm])
diff --git a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-=
update-manual.patch b/meta/recipes-devtools/debugedit/files/0003-Makefile.a=
m-do-not-update-manual.patch
index 50be95696d6..607e8849574 100644
--- a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-=
manual.patch
+++ b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-=
manual.patch
@@ -1,4 +1,4 @@
-From f9e6f9cadedc94323e8878e60aaa684be7c52d97 Mon Sep 17 00:00:00 2001
+From 84cabce9acfecfd5d07aaed3a007abe8782feca6 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 23 Mar 2023 13:09:23 +0800
 Subject: [PATCH] Makefile.am: do not update manual
