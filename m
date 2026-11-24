Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24302.1795540706967714861
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IZX1qGWR;
 spf=pass (domain: est.tech, ip: 52.101.72.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgV1ifr49h6GCigOqCoaxFBB+TRu22VTbOYQVNueKzi/65M7rV0f99XKcWmOp1Yc29w0oZDiLUuhlxOKY4DAeD5FRZZLB/0yrpXgwxfD9Jad8rZVvcg5exP3VxjEnQMYph6wUsN8uUOXya8Wh0QUztLxiSldcyanuYhQ2v/f8nyqm8Uw699luo+3+iMIxj/DvzCvxZ7N78E+kZRLQmLH+ndKJB93xiUPrY9nkbzMAkgAw7996XZ5lfvLpHCcjncuChJJZkadLtGrKCGaTP4adUBJwCSaV9D84PCsnfr4ypDnFOduNcSq77Y4ViV6eHydc7NlV4ZMrx92UVLbf/l0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoajsntiF6iWTWap0+Gaut7xYCvrfgnJ1ifHsIUHZOQ=;
 b=sIGAzELHtchLwunVqPjcHpzochXxj5f1rTqas5oFhjMc1J8bUx/McEqtXqyh37iCZeayemxvfKgxFRR6Au22A7g8db3+q51bJ5e41kUAP297P6MLn9Lo/HIqs36wDo4osmhf8/gl2Fhdnzlswr+LQy+sKV+nldXKxqEh1NzvuwLvnsZJjxjHaw4JicqS2VGsj10yEYch8eCkBswNqJZ/3VlTdZETvpGeyvz3JqLIfpp2U2zfvnIR/mVlfBmdM2C+iTy7WqHEe6bXIffLUY3D2tb/itoxyWM2PgJsDheSpRn0HsFZ7NP9u/3TXwjGQp0xcqbbUviPQsVBe8VbjWZ/nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoajsntiF6iWTWap0+Gaut7xYCvrfgnJ1ifHsIUHZOQ=;
 b=IZX1qGWRzgo0So2u8mNm+regUrQqLtTFQbVfBJppUNy1QQJJkmGnJiNmdr6lj6PwQvQTS8SGH0lXFuDBWCVYIYDk/4i8hG9niEDQb2xGI3EOdD8OpVBkUqifv8aHXFNRe9cKT9HDwrHaNTFe6TgbtaEo/vx56UAFNglQyHp5gj6ZhxGvXxlfbQDri+qzL5IBA4Pll+vE9oyg2eqYf3GJ8M4d+OwWJwgo6shnvCCqF9QKVKIOweJBwTgndmWDpe0Gel8Sf5PzkAvxsLPNLO+j/7NuqIp0XmzO0MAJ/KQfhf81BIhTtJgJJYjvwTy4voa2ObmRLMc2ZesqTE/LNwjf3Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM4P189MB3668.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6e2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 17:18:26 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 17:18:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/11] rxvt-unicode: upgrade 9.31 -> 9.32
Date: Tue, 24 Nov 2026 18:18:06 +0100
Message-ID: <20261124171807.74394-11-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB9PR06CA0018.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::23) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM4P189MB3668:EE_
X-MS-Office365-Filtering-Correlation-Id: 217b0322-c274-4e91-df0f-08df4a4ef36c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|6133799003|56012099006|11063799006|5023799004|261009223027099003|261102123227099003|261026140227099003|261021123027099003|261022075727099003|261026121527099003|261022105027099003|261021135927099003|261028144727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: j8EHJTfZvfnwbRoVrro4RCLURb7YahUFDn1gKO9ierOkenFrPMpqZ+4rzdVJp6ZcCNfh4hsOe0mbr+61tfk9XByGw9RI1ExVOYwBCMJ00ky00Y4omKRBK0qXb6yD7hSW8jj7ZowgcVtR3ae00xNq/fktgA+krG37y95IbChLP+DOUP9gZcN6ZNKIRhsePDQ/yrzz/6TCp1Gyfz7mbgLpY1ipLK0YX3muJMCEzdo11xSO2aHujongDKZZI/BzWPF5xlEAkjH76dzkOm1vJ7tokF5412IeOgqEEAAGQqO2TyIttHWKkFjCm6XlI2tMuz3yNA3U++2rtBi6zypU2V4kHKRt7HOzrcWQ6YokbcFTXlNpVIA0yo0mC9jN5SbpohU5qXl9uqhT964VQK7vJDbFt6oxuV4bceQDdV8hnNRgBNE94OUjA2h7pqZj4mDbm0J7o0Fy2B6KSc3MNfCSiFimpS9SEF6tpm+2zQ8F0I5fnNuhJAgQhRQnWhxqXPLTLF9BwlrDdMPt5xLo2iKEZjGSYehLBUUNQnV8YfdKEbKbEMoozpO9QaH0mqSVsz6j3DyllC68iX6+cOJyIFEBFKCeBqbswTxmYLT1d4zsbDi2qMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(5023799004)(261009223027099003)(261102123227099003)(261026140227099003)(261021123027099003)(261022075727099003)(261026121527099003)(261022105027099003)(261021135927099003)(261028144727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+TlsAyksgwWYZ6n40nGlITpE6mY8/XYwdB4sVvkJTibmr/1Tfa4iygJ67Dhh?=
 =?us-ascii?Q?YGDcQSqUradYV4PAcSfuNzN+0GGlgtV6WJn7OHqOkLhc/U27kE4rx5EImzXv?=
 =?us-ascii?Q?4jIkBe2EejDVVwrRkiuQDICv3dR67uJnbZD8zH3Ptitoh3DaJ0sUxCnB/1xa?=
 =?us-ascii?Q?UzTBCsUBAJyUlEknxFvUImScUAPDfp7rBqmnL4AYFYJBgNteMhuSqxbxQAPN?=
 =?us-ascii?Q?IGNKfuFsXdMb2rWjoXpde7Z3OxcxP20M7+n9VqGHqpO7CcOXmM1fsYNQKY/Q?=
 =?us-ascii?Q?eOVktj5A8b7aKj2E7B78QvVw5PQTy3rTG/Qw9OD1kFOZ4fBplW82q0/AM42h?=
 =?us-ascii?Q?Kmsb86Qn9nq3fJ55eBzip9ksHqKhkt+mAr/tgy0dZd8KSDH5Mb1uZ6YSOAz1?=
 =?us-ascii?Q?0g3oufVQJi96oHowCXUFHG5jmmtuOI8UR2Eu36j4BiW0kpKQ5AlVCvlk4K3F?=
 =?us-ascii?Q?tPrdFI6sT0IKiK3gJgIGBeMOuhbhHGGPoGe/l/gSUZ0nxS/4El88yCXq3VT7?=
 =?us-ascii?Q?khdTCIKRI5Ry7rD66TtAL80iKWHTV0n7z10szVKusf1fthHMhg5FNgjhL2oK?=
 =?us-ascii?Q?AMLaCnVb7jQZ1+ZltsHmCngVTRBRnev6i/ZF6UC5JHHEaoXw/Smmo4MQiXjT?=
 =?us-ascii?Q?LGSM2RBSv6YU6aDtq8Fv/nRDfM6sJkcnjKF9YBSpXQty96g5+DK6um4mO6Q3?=
 =?us-ascii?Q?p74KMN4Js9WT7hz05e4RfJOVdyPOP8FMPF2Kt7GQJO0242de3ZNAl7WW4XZW?=
 =?us-ascii?Q?lJ6MwZaH4I5d9vNXvrV7pKrkfNghDqKM615uTe2s2OvK50RNrdmVlwQXTwRt?=
 =?us-ascii?Q?VMd7VtnNGzITYnqfj33MGBZHICIr0pA9eOs3hs+jvcXD8ENHvvSAcDdNKQSM?=
 =?us-ascii?Q?EWefyIdk9siJEHLym5bpONnbG9EiBHWk0cMonEKiVAjIN2pyWewn93rE+NGd?=
 =?us-ascii?Q?46DQcd9i0PxxfPuIxIuIARnGhjkwnNcE90KfUyzQoYCDyAxCfCwuwexURjJl?=
 =?us-ascii?Q?XLKNnyArB5koObG+6TyI/dbJUZnXEu2BtZkCgy0h7unK4ZVLSudaLBY7f0a/?=
 =?us-ascii?Q?FcJMIeA5CER8Yzp7DSqxPHK+mbFF36UExTm1rNLW20QqC3AR2nVaJfSmtBdl?=
 =?us-ascii?Q?b7nPrHXq/6fw0AMbMkoImiVqMTJwQ1nouiY32DJfJ5i/rcHTBAyfwiYrDGda?=
 =?us-ascii?Q?05NiIsng1k5aknilnqMA7RT8W7wO3KVk+qtFStXTjD6oaAu5KgTuHD4u6aVV?=
 =?us-ascii?Q?G2w0zXadwxYQ6i/94B71aRWei35EpILmbvw61i/SH++lHtBP2/DQskd5x3OX?=
 =?us-ascii?Q?b1rz99yXkiz8Y3zaHQM/tbc3HdIYxUjfy3RVJJDnZn+CgEkHeg6/2PaIsQGm?=
 =?us-ascii?Q?bJYNQ5HiR11+8WSxFfYQg/ZjgXvDJHjCUKnUKWPBDAwu/J7koJkyfJa0r8Ju?=
 =?us-ascii?Q?YP1Ty4MKpPHyaJBEHMIDo5erNfvqWszdC5fJndhkj09MHzv+tmGLzLmd6r5U?=
 =?us-ascii?Q?/O+KYSX9P8KF2FlfriqizUEt0tnxipbrFQNUVdJi5dvyEC8GvQwZY3EMZrS7?=
 =?us-ascii?Q?HqB8bO9R5j8+6Lx4OFq4MZQ22/e/gFYWXZ8eWVPRQAbevby01Aj5fAXfxcjR?=
 =?us-ascii?Q?ASf0X4ZJwjmjiZwvTgDMVcPyIfbRuSOsh6BLTklDNGuKFKxKpCYC+E/WZgwO?=
 =?us-ascii?Q?DOP6TsnExZu2SCieCOEfAtfm9ZwopC42gycB4kfy0iQMGm2BuMegmOHseDIb?=
 =?us-ascii?Q?AyrSVpIwTw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 217b0322-c274-4e91-df0f-08df4a4ef36c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 17:18:26.3246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urDfUcOOw2yOxdAEt4FiSJaWnP2pjRJl+KDHd1qs1ElUWuGtgJvsZB3k78wYwJA3EwM5dWFd0vEW+80Bku6d4GTss5Z7J9xFTqH1cKYkOow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P189MB3668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251062
Content-Type: text/plain; charset="utf-8"

Changes: https://cvs.schmorp.de/rxvt-unicode/Changes

9.32 Tue 10 Nov 2026 04:56:52 CET
- NOTICE: due to unforseen circumstances, we could not get a proper fix for
          the cursor positon on resize issues, but decided to release anywa=
y for
          the
          other bugfixes.
- fix incorrect array bounds check when parsing OSC/DCS (reported by Trista=
n).
        - add DECSCUSR 7 for the "power-up" configuration, similar to xterm=
.
        - mbrtowc can decode NOCHAR, which collides with urxvt's internal u=
se,
          potentially freezing the terminal (Mikachu).
        - fix memory leak when a background expression uses the muladd
          or focus_fade operators (reported by Erik-Jan).
        - fix reference counting of values returned by some perl bindings.
        - fix OSC responses with 7-bit ST (reported by Stuart Henderson).
        - fix mouse reporting of motion notify events to report 3 as
          the button number when no button is pressed, same as xterm.
          Previously urxvt reported the number of the last button
          pressed or an invalid value, before the first button press
          (reported by Uli Schlachter).
        - change the encoding of buttons 8-11 in mouse reporting
          sequences to match xterm's and enable reporting of release
          events for them (patch by Pierre-Marc Fournier).
        - clamp coordinates in mouse reporting sequences to the number
          of rows and columns (patch by Nick Hanley).
- added Alt_L/ALt_R and updated some keys in iso 14755 5.2 mode.
        - perl 5.38 does not handle empty locale names, use "C" instead
          (patch by sxzzsf).
        - add emoji test character, so that emoji-only fonts can be used wi=
thout
          any tricks.
        - urxvt assumes every font has space, but the built-in font did not=
 have
          one,
          causing occasional rectangles in tetriscurses (analyzed by Mikach=
u's
          LLM
          website).
        - the confirm-paste extension now offers a choice between pasting t=
he
          original
        - this version has been verified to work with perl 5.8.3.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-rxvt-unicode-fix-gcc16-c-20.patch    |  5 +----
 .../rxvt-unicode/rxvt-unicode/xwc.patch       | 19 ++++++++++++++-----
 ...t-unicode_9.31.bb =3D> rxvt-unicode_9.32.bb} |  2 +-
 3 files changed, 16 insertions(+), 10 deletions(-)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.31.bb =3D> rxvt-unic=
ode_9.32.bb} (71%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-=
fix-gcc16-c-20.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxv=
t-unicode-fix-gcc16-c-20.patch
index facb574a2b..2c463ecc28 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc=
16-c-20.patch
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc=
16-c-20.patch
@@ -1,4 +1,4 @@
-From 4ff364c3df99b02e658ac2b3d2eec7139c494612 Mon Sep 17 00:00:00 2001
+From 9d292205d6966d19ceaae10fe021145ca6ee8116 Mon Sep 17 00:00:00 2001
 From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
 Date: Tue, 28 Apr 2026 03:22:40 -0700
 Subject: [PATCH] rxvt-unicode: fix gcc16/c++20
@@ -56,6 +56,3 @@ index d08b1bb..ec69cc1 100644
  {
    return (long(a) * long(100 - p) + long(b) * long(p) + 50) / 100;
  }
---=20
-2.49.0
-
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/xwc.patch b/meta/r=
ecipes-sato/rxvt-unicode/rxvt-unicode/xwc.patch
index 16efeef49f..dd11db6a2c 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/xwc.patch
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/xwc.patch
@@ -1,9 +1,18 @@
+From 74481f4ed205ab215f8dd467263776ca4f9531c0 Mon Sep 17 00:00:00 2001
+From: Dongxiao Xu <dongxiao.xu@intel.com>
+Date: Tue, 19 Apr 2011 14:58:37 +0800
+Subject: [PATCH] rxvt-unicode: upgrade to version 9.10
+
 Upstream-Status: Pending
+---
+ src/screen.C | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
=20
-diff -ruN rxvt-unicode-9.10-orig//src/screen.C rxvt-unicode-9.10/src/scree=
n.C
---- rxvt-unicode-9.10-orig//src/screen.C	2011-04-19 13:34:01.327664984 +08=
00
-+++ rxvt-unicode-9.10/src/screen.C	2011-04-19 13:34:47.037665001 +0800
-@@ -3152,7 +3152,7 @@
+diff --git a/src/screen.C b/src/screen.C
+index 8fdfad9..9a9e3b5 100644
+--- a/src/screen.C
++++ b/src/screen.C
+@@ -2941,7 +2941,7 @@ rxvt_term::selection_grab (Time tm, bool clipboard) =
noexcept
        return false;
      }
 =20
@@ -12,7 +21,7 @@ diff -ruN rxvt-unicode-9.10-orig//src/screen.C rxvt-unico=
de-9.10/src/screen.C
    XTextProperty ct;
 =20
    if (XwcTextListToTextProperty (dpy, &selection.text, 1, XStringStyle, &=
ct) >=3D 0)
-@@ -3734,9 +3734,11 @@
+@@ -3524,9 +3524,11 @@ rxvt_term::selection_send (const XSelectionRequestE=
vent &rq) noexcept
          }
        else
  #endif
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.31.bb b/meta/rec=
ipes-sato/rxvt-unicode/rxvt-unicode_9.32.bb
similarity index 71%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.31.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.32.bb
index c127b9bbe3..42b480c4cb 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.31.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.32.bb
@@ -4,5 +4,5 @@ LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae50=
4 \
                     file://src/main.C;beginline=3D1;endline=3D31;md5=3Dd36=
00d7ee1062667fcd1193fbe6485f6"
=20
-SRC_URI[sha256sum] =3D "aaa13fcbc149fe0f3f391f933279580f74a96fd312d6ed06b8=
ff03c2d46672e8"
+SRC_URI[sha256sum] =3D "2f81c16bffb16f97c4633032e08a7ef08c000f81eb05853e95=
0febc6c33328dd"
=20
