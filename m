Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.447.1795018919893809780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 08:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=F3DJk/Vc;
 spf=pass (domain: est.tech, ip: 52.101.66.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvH+BT08f1mRslPlZMNLuW/cQuuJ2OQko7Uxyj6HWUnnqur+iR2VQ5pVqkk7Jqmfzqkl5DPWn/LkgjxpoB2RNpV2ZmTeFvIcyKRL+uChLyfQ/r8/0idkaHl0eAz4g9JuOyzoihAbHob0xlVOOquUNtjJ92kLM543VaiahvVlBQZtBKrl6ZVkEnkdHZMNHjv4oyQZdQJXP7aL51vpFmxkYErtfoGZ/igHoy2xJPaPqHtsk2vRE+z1Rd3cFVeuY5HSXt1Cxpp8ypv8cf3EMogBqDU3Z/hYiuI20fV077QrEh+RzMY0WcNaMKGm52dCHnYL9SMXiU5tMQUqWpI/QoVqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxGP5cP0jLcJhyx6lEOpRsM9c1czO/gQ4bw1SZClrJ4=;
 b=JgJ14V7jeUj4wi1IzkxzUPXZF73tglMbep5m/wUC/oyRCed7P53vS8mLtnRR8zNQwYgA9gYs//CVf1UXH/DaDF8ZqHB7Z/IrOqHXBvl4AjWLTUiQKSpehiP5ncfWd6kiGEW/pdq8JSlBpZqRnBH5rALrEGcrKnBK2cFBdZlGxkdrS3HDoQn/dsgI7l+yPY5RZVI02PQypoNhL08PGx8f5mtutisw34DD4WUbWXAu18zCu7KsFe4bcd4J/z+bSVIez+PZRdBsOmMkClCl/qq/mxuAix6Na8MbbvYs3Ly4j93LiXGvD0vCztcBc35DvNLLke58sS4XVfyCUb7KQNySAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxGP5cP0jLcJhyx6lEOpRsM9c1czO/gQ4bw1SZClrJ4=;
 b=F3DJk/VcVjm68xhEiEZKH8OeYeK/+GV0EpViI4QmLXEcWDUWdIFYtDzMcIVZJG/vnDHi2SBAYPIJA6isY5ikEst8bg7yCaKydBulV5+PDBmOYDOw0yZKctfo9zq6k6l+Ru5xJhDTP8F6MgQ4dDgufbUwzKuEBXQF+sgz4dCuj8VW0tc5oblVgLfS2QkJ0ueuWL5/p1TAcI7R5T5e9yZ9bcD19B/NiZa0q/Em2tyPmeLzPLzjJne6ZgMN6iK1vBZ3lYlthkCX0KcmlGZT9xrFlvAMnPv0+ShROHhzVUgrFMoBvnEYbAPLevmg+ThUNootrp/6nm44f0M0EGafzGbxWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0935.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:165::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 16:21:58 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 16:21:57 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 2/3] binutils: Patch for CVE-2026-90828
Date: Wed, 18 Nov 2026 17:21:52 +0100
Message-ID: <20261118162153.25025-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261118162153.25025-1-jaipaul.cheernam@est.tech>
References: <20261118162153.25025-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO3P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0935:EE_
X-MS-Office365-Filtering-Correlation-Id: a978ce8e-bd41-480d-d591-08df45901140
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|6133799003|261009223027099003|3023799007|13003099007|260925022911599003|11063799006|260925021911599003|56012099006|10067099003|260925021311599003|261026121527099003|261102123227099003|261026140227099003|261028144727099003|261021135927099003|261021121427099003|261022105027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: 7UYRc/g0KHx8tw0wizBQYnizdiZO9gqN/Lh6W7AxdKt9N5R5OkyHK0I0gHqOLvLI3Bx9s5yiVf7+XmNXYNymE3S6m3UvJgHajtSmUsRaKGjhNVBz7ju8zRl4u/CrtZypyN5AHQUcfDfUrk8cJt1cwZYSr3t1Sy/2iIZFdCaPp6eH8BZyfxTDxy6GyCsvmb8CcTA4W3tPf9tScrjMIf2j5PNjOHFY6yR4BTO5TqVc93nJzEn8AXugJWAMpxDJ9ukDjCih5WYn7EBbx7XcuJUshp7K7D4JaWk3qPhoqIJOf0YW9QQx6bNwx4EtYhfO4YUhIDoMF5538EjUqssybfptC40H48kZ/5iupIB40AWGmiQU2Ys7jOQIUQR6ydvPb584r+71ZDsC7RFgy1CWvvxp66Q302MGptjqhD2L/CPkl/mr7EGwKz4a4Mti8Aj/HTLn+XrD08Byy+sSaP6AfXyyNQJ72acRcSKrdQ18oZYC/GiGhdYzlaV3/b48EtMTjAJRX3n0ahzGCcC6bsqwjxINtsB1bWgNR7hupglFaYti76gGigy7CEqRJNqIIXzzO9dHPi+ha3OCeeKqHXZevXZhKA1oWV/NymygHsWeAFWlCMvACj5vKhx3D7jLyUbZD3i8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(13003099007)(260925022911599003)(11063799006)(260925021911599003)(56012099006)(10067099003)(260925021311599003)(261026121527099003)(261102123227099003)(261026140227099003)(261028144727099003)(261021135927099003)(261021121427099003)(261022105027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RBt0Eur8fod6PZi0IHFbBrz1f5P1QzFJ4DrM1CyCefELJ2ZxfBER1y1awDHT?=
 =?us-ascii?Q?qFlKRsxMmOam7IP8hru4istkUws47yLe6WsOxSKm9mHNUgLi2KGx7IbhQ7t6?=
 =?us-ascii?Q?YzNVz3oa+ge8mhDodgCDJRQpyt8PZXKOYBTPJL8lAmhRrZpZbgdkysk4CYLD?=
 =?us-ascii?Q?MtaOw1jT3zjmAmtZIcSVVZKFMC82gMBrXQMUXDMNydmFFolhazWpmLIKoyk+?=
 =?us-ascii?Q?C0TXW0GZHlFc9hhm38iDX3VWQ72hOtBa5jTUZ8hnJneRd2MNDFXfNv+t8IVy?=
 =?us-ascii?Q?0VvDWNEjlrRm3VAR5nGB3rlQTW7BSioEay8Dd3TtgJe4rlV7QayfovThgTQD?=
 =?us-ascii?Q?UBmao9MTaFPWNybruELl0w4hysRofCOsCLq4aw4mSbmTjlu5btB9ndAJRBmc?=
 =?us-ascii?Q?9kn0NhoeXlK9HNqCgo6fzVf5+uYXpqiBVvw12UNcJuA8Z54DiIDkA438286f?=
 =?us-ascii?Q?wQ76ViNohaP+Zy9E8doJHzcnC/2jZc/+d4KvcBmL1tAlojhVWc3rfJW1v79e?=
 =?us-ascii?Q?abnkDzHCp9Tv+vhB2v3Xg5+uy1q2iaDyQsC2CaAvZ+NhwtViI/DC2WAN9IOi?=
 =?us-ascii?Q?RHOXFoO0TSJJoIvxFHVHNaJyLOHzgcLL9SxXpd7Qjz0vleo0gCW6wZj4Zp/Y?=
 =?us-ascii?Q?DDiAi6Gz65TV8htcvU7VauD09ChFyZJuemrobBiXQmsaDZRjbte/DSEoc6ua?=
 =?us-ascii?Q?3FQeYNX4KnD1AMcL/29UwnhZ2oHyNFvFma+0BYZ2i0cUA02GZxbnuCbeBeVO?=
 =?us-ascii?Q?IaK95I3I8mVqyGN2vuvXwrtsusutDhRkGa9wxMwmPaZ6tBD4R4peQw5kZwxy?=
 =?us-ascii?Q?g1bYRD7jO2zhe2alrtl1bIwmyCNDQpKxA4rKsaXdpTFb+YERa2i+1eKFmP/v?=
 =?us-ascii?Q?rweKA3HbaTrKbpsUsgQD94fN47NC9cEHcdrdHJkEwxC06D31SEvujt75q2Yi?=
 =?us-ascii?Q?bJVkGZILCOI2FTMPWQraIurbleCjFGIuyhT3c2dxHH9uR5U9FFu/x9kk86N7?=
 =?us-ascii?Q?vOpmhEZE4zQJBzKP3xxBzowab7EBttZuPLhq3ZNqrBIhn8NTwWAlPoDEWNXl?=
 =?us-ascii?Q?ddVm0I4Qd0KhXHTSFV9rpJOXURWO7PEFoxr+bUTO+HwIf7HESyZKnPUHD7lY?=
 =?us-ascii?Q?cqXvxM2q9hPDYKgvhaIaa2oEjkydXm3uW7tYffninCFh6Q2ny7mq7Uw09q3U?=
 =?us-ascii?Q?fQwcRoZXnEnBRTCjpvCekgkA17cs0JQvN5RxNbqflxhDquUvLe3MjYe1QQnJ?=
 =?us-ascii?Q?UaKPG7QlagOvs6+lJglp76ytxf0LRLtg57OM2NJeael3da8SLAZRCSkXJZfD?=
 =?us-ascii?Q?i8TmiVFqgqPKQfXKHphUo9U3kt63gJeYq2XjYbaK8u2ulYd3ZaS8T8EDzLgS?=
 =?us-ascii?Q?N9OleHoKaCz5PwsycAKGi7ripmMcQ2A1DgGbmvj/piSsRLFxN0ODhfqkmkOP?=
 =?us-ascii?Q?UOF41fLfFJJ3ZU6GCMILMzBX/Kzm4Rz9KjvZ3/+1NH1SIIssP3hiHGF1Ed7Q?=
 =?us-ascii?Q?+nBIeR7TTqEY46OQ5299WyiPyuzbtfL1Fa9BCF5EXTGGVirQYIxV3Bb9hvby?=
 =?us-ascii?Q?ken9wS+b0upBXKOwdsUxDyF1jmBnyrCbaXLukvJc4MSK3ydJs8I35E6NTto1?=
 =?us-ascii?Q?tU43IKkYxp51RR6twJdYYtj5RGhJYaAKBTddEJqeZXKHbdPPVx5C0u2BtjvZ?=
 =?us-ascii?Q?Pbjxs1J8tS+WcvAeo6JFq4Lt/1AdRnGS05/oDEVv3v2ntC5QrTbWn80ujV+x?=
 =?us-ascii?Q?3XXxtLel8w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a978ce8e-bd41-480d-d591-08df45901140
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:21:57.8856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8lkTI1HbmlFE4CJ4t43ziAVp4HDQAXhgQrP+C9RJObNq79Pbs82RvCI7QvJFX/ozPSwzaDbb3YxD3of2P8YIfyjzfEQfA3d93IZsLGTR7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0935
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 16:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250572
Content-Type: text/plain; charset="utf-8"

backport fix mentioned in [2] for CVE [1]

Actual fix need a prerequisite commit [4] CVE-2026-90828-pre.patch

References:
[1] https://nvd.nist.gov/vuln/detail/cve-2026-90828
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=3D34450
[3] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D123e4a5e=
ab2db300b44288dcc1a29c903f9622f9
[4] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D6be6e5b=
8ee95eda6f12f5bb0fbc2a17a42265ffb

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.42.inc                |  2 ++
 .../binutils/CVE-2026-90828-pre.patch         | 30 +++++++++++++++++++
 .../binutils/binutils/CVE-2026-90828.patch    | 29 ++++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-90828-=
pre.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-90828.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 7e91b7fe57..93576817f5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -85,5 +85,7 @@ SRC_URI =3D "\
      file://CVE-2026-3441_CVE-2026-3442.patch \
      file://CVE-2026-4647.patch \
      file://CVE-2026-91781.patch \
+     file://CVE-2026-90828-pre.patch \
+     file://CVE-2026-90828.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-90828-pre.pat=
ch b/meta/recipes-devtools/binutils/binutils/CVE-2026-90828-pre.patch
new file mode 100644
index 0000000000..afccce2b24
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-90828-pre.patch
@@ -0,0 +1,30 @@
+From b7c4d0bb673d8d53367e085999f5303d63025e8b Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 6 Feb 2025 09:55:03 +0000
+Subject: [PATCH] Fix illegal memory access when linking a corrupt input fi=
le.
+
+PR 32647
+
+CVE: CVE-2026-90828
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommit;h=3D6be6e5b8ee95eda6f12f5bb0fbc2a17a42265ffb]
+
+Note: NVD didn't mark this as prerequisite but while cherry-picking the fi=
x to resolve this commit is needed
+my analysis this check is needed
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ ld/ldelf.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/ld/ldelf.c b/ld/ldelf.c
+index d8c0817b..314e72a9 100644
+--- a/ld/ldelf.c
++++ b/ld/ldelf.c
+@@ -2089,6 +2089,7 @@ elf_orphan_compatible (asection *in, asection *out)
+       && (elf_next_in_group (out) !=3D NULL
+ 	  || ((elf_section_flags (in) & SHF_LINK_ORDER) !=3D 0
+ 	      && (elf_section_flags (out) & SHF_LINK_ORDER) !=3D 0
++	      && elf_linked_to_section (in) !=3D NULL
+ 	      && (elf_linked_to_section (in)->output_section
+ 		  !=3D elf_linked_to_section (out)->output_section))
+ 	  || ((elf_section_flags (out) ^ elf_section_flags (in))
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-90828.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2026-90828.patch
new file mode 100644
index 0000000000..96127003e8
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-90828.patch
@@ -0,0 +1,29 @@
+From f6c82e420be28ae30caa49bfb095b576924f1f95 Mon Sep 17 00:00:00 2001
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
+index 314e72a9..7529cf47 100644
+--- a/ld/ldelf.c
++++ b/ld/ldelf.c
+@@ -2090,6 +2090,7 @@ elf_orphan_compatible (asection *in, asection *out)
+ 	  || ((elf_section_flags (in) & SHF_LINK_ORDER) !=3D 0
+ 	      && (elf_section_flags (out) & SHF_LINK_ORDER) !=3D 0
+ 	      && elf_linked_to_section (in) !=3D NULL
++	      && elf_linked_to_section (out) !=3D NULL
+ 	      && (elf_linked_to_section (in)->output_section
+ 		  !=3D elf_linked_to_section (out)->output_section))
+ 	  || ((elf_section_flags (out) ^ elf_section_flags (in))
