Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5584.1795180501618142653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:15:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=sYYm6RZw;
 spf=pass (domain: est.tech, ip: 52.101.70.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ro5ksSZcv7fJQAV0geMW0xQskqLL4Nz/z1mCB1ma2JAYr8SCkvZHKSTG7xRFdsHins/p/k4eQbN0e327PvAFDkKWV4w1i/6kyiqoy663aRFKCQhxAGlvYQjwu8CAQHC6PsD7GRpdNmf71zf5BXdQOkeCbvJzNNK8pTzW1D2OHfkBNTEo8rq21JxpHmyoh8XNs4huGg+SWg4kT+EuKHbHYYTEHMw3cUuUn0LYWZfWy6cuceKUdoiXQ8oXXDxMIvF9+TDqmQGF6OcwTI5b21rWt1lMrfUw5HnORhmNpUXYite0i3ySQzPw98tVOKnqP+HuB8+FGz0sT87Ug65DTH898g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cynHW+kBLotMLKAigG1iGz4G+nZd4iKmDVWRGAQlJFY=;
 b=qBc/tHoo43MaDWv/6fL1fyVCdmGp41jVzpqBh0w0WnD0x2uV8J7oHAw9ZL2htQd29saVnzghcwWILk9TQLc+Mp0fyNZ0jp5p9fQlzUcEL5+gAwkyafpMDfnEwU6kkY/c7X3wfRj2608TMHtg0MAlsQq1RLauv3WX3SNanE8BqxTEzkRjL6aBdK9Qenvqw9hYfW4FXvIBRjmZ0psNns6AhFKO4/nAZWIDCMARtohiOGwE88wa0p9A5DCv+OqMGpEMNy8tJwpBepwe0K7uv+S3Gnu9wcTv2zfE/JdH5jj8ymTYVYkeGUBwuQIsOvPGppCRyMlciFGpCU3AKfs6zh/yyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cynHW+kBLotMLKAigG1iGz4G+nZd4iKmDVWRGAQlJFY=;
 b=sYYm6RZwXeTzpcjY9009w4hNtSouqzH7wAlpSz+CDkzE2aM2N7o8OIpg5i5rm/vTwMhOzzTAyNXWd8JW9aY9RHgs38Xc0EB6OAEssIRPjcyjxda3yiKfdk4bM8pn2l8oGSXdfWMIXJ0y0mUMNjLxUANvMOJKmP2eBFVxjIb2lbZKtomjUFfrq1UXHXHJdXiuchNzQ9dAR1otai92nAFrH20HRkPXrqy5jp/xopmQbmoUi3yBPT96qS6oTV8ybFlHD3Yh3CW/hLeaNvMmCDI+pEisck2CJVlBMWTh4/CMf/QHR74ZdSI1gBhrijeoqGwjCwBowKsE3TRahiMRAvpy7Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI1P18901MB0815.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:15:02 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 13:15:02 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] ffmpeg: Upgrade 9.0.2 -> 9.1
Date: Fri, 20 Nov 2026 14:14:54 +0100
Message-ID: <20261120131454.45936-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261120131454.45936-1-jaipaul.cheernam@est.tech>
References: <20261120131454.45936-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::8) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI1P18901MB0815:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc876a4-5b43-4434-4b55-08df4708495e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|12006099003|18002099003|22082099003|3023799007|260925022911599003|260925021911599003|260925021311599003|11063799006|56012099006|261026140227099003|261102123227099003|261028144727099003|261022105027099003|261021123027099003|261022075727099003|261009223027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: lXOC2k4m28Toh2VR5t5uu1jozPXoR7Imq2RhjwlAi8JH35IEii7GVrGtsf730WwrOjhH5r/p7tQ6qtdDdyfxlQ6pTzGHBnSTgzg7ZAhizve1ahazCeZk0YNSzQCw3ulJ/6E8uHiDt7P9Tu7PK9QRifQdQeeTa8rosJKbJXsSUakxBgzFFA+DitmMOElHnNBHbuobp3R8CuwFkwLMIxD+FC8wLgKtkjC+gEbM6kZdjkCnTR7jbeb5MCQGaXbQjItZ7xecC89tf/O6hwIaeKNMQq/7wTvj8067VZH8JW+FPizwLgPqGNE/2IVNCR4VND929dCKm8RiHsEk5FbRec67h0hfyT5TjFEkVwiTUsBZUM+8B52YvkTQf22GCqWBkCCSZm5rc0qbTSdELnsFkcI2Ah0IjgwZyn4x8z5uQURFzxIZfe5xstF5pWfhZ1ZR06LFJ40v28qoOzhVcrdOV7I306WIC48LXLDIwutAcYeT23h1Xs/UiFrmt3dlVkTCzm45ESu5B8WoxJrzjZdTxMQdcuu8Ispvw/qToYEbE3Rl6cenU+uoeWnTLjQiDSHVGpR86KebW9vrfeK7EtPbn5e/Uqw+JHk3fCzuuOJa+2bQTUI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(12006099003)(18002099003)(22082099003)(3023799007)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(56012099006)(261026140227099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261022075727099003)(261009223027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sQuBREMB4DiE1nANDUosvUnnQRQw7e0LOXlHH5cgPEoHXPJ/T2jYv++7slSZ?=
 =?us-ascii?Q?AJOGzrpQfpwq3qlSmOIN1JtfoWJ8rPyUce+lRlo5Lwams9DzUkmTL4TnRTA8?=
 =?us-ascii?Q?TEkjWZWAwFETEQq66QSCtnXl4qVtFsnWD6K73PyD537+it/8CK8ZsuGFrO6i?=
 =?us-ascii?Q?NMrnmawelDo7ixU4oybParWGO+UOCsVlDnJk5AbkcyF8W+KewAxeCGvSRKOO?=
 =?us-ascii?Q?RXMdWxjoCZrSMi6KLZZQeHOPL1PMdM7BjUAVbaiuj3vSpTLnDznjGnggzXk5?=
 =?us-ascii?Q?g3jHeoCqztJ8oPw9kvmE+YlciJN56E2RBgkhjnBVJhH38Z7jySXlQREaRc5+?=
 =?us-ascii?Q?pZ0XuvHJ/gFxsd4ylAxmx+tD+ZQiJ/UAthuuKtU7Cxy6P8ix8O0p6LLrlt8E?=
 =?us-ascii?Q?x452PpWlgaTV+9Xi4uLD6XJTJiXv57v67WPBAJJZHDTa7V5ivooJu+QC0km4?=
 =?us-ascii?Q?vM6piLYHwPRVNhmQwb1vOM6PicAqpc0OD2R3Q8tyIJf5qDMEnvPZXsAOEpPq?=
 =?us-ascii?Q?DZxlTAdBE7UlVqbCaIzZBzqWQ2MEt5qU0fGiAIxK48sqqSDglsvZvO4cFZ0C?=
 =?us-ascii?Q?gsDFNenVPk1Kg9elYBA813m9NKrAivUFsLE31bnCOTjHG87q/bZhN1cRJxC2?=
 =?us-ascii?Q?YFIJNSYN7e7clz0fe10AFK5I7ZXLzuvifebuKou07CIiLR0LQ2+WQ/NgR0nX?=
 =?us-ascii?Q?tsSbqyzWbapz1PMZiNjFEzPVN8qb9v+YcuF9voX1I7nTa2upWdOI1dGJecAs?=
 =?us-ascii?Q?s8FawWC/3mhUlmnKDRNmnZ6iDUBRz3pHkRx5tRwcFK5mQn9I7aj/4nqe8F0h?=
 =?us-ascii?Q?0rykriMwP4rEHyWTQc3btQ8cOJHhQJejArTvUdxZC1517+4YhRsUXvmdh5XO?=
 =?us-ascii?Q?cHVp3hLL9mRZmBqfggTg1A+nV9kX63Y4Ki6kv/E9jN5g1UXwIZNg6VEi9Kgh?=
 =?us-ascii?Q?gdOE0eoc0dxpnlVHM+f9DFXuoDQfqBaLjMgvrDaD4kaGg+25ZaiyRFsnmAgs?=
 =?us-ascii?Q?JQ+2pKaQfzEYgzPhDEaENj2G26xcxLEeylVJ5imf5mQUjiX6sE+Q7kpxFZjU?=
 =?us-ascii?Q?+LLQne6h8+pJYR6qX5wThkUrD4IaYnt4rfYMya6HRkIoiKhkcdJ+QSGKEyOp?=
 =?us-ascii?Q?IxmI34qAw3a8xOV+JKMb3SWyhXrc8022H+CO4vNFnVLzjeBuONe+mQ/9kxHp?=
 =?us-ascii?Q?W1yLKXTxhC9ehmix0RngKS/zaHgqPjwoMM/yIG1kgEknYIe5/fpSTcM2ZZ0f?=
 =?us-ascii?Q?HNlB2peY7Rcx0RACBEk2YefP2za3EFnacfOSr/bucyTAkdse38YvekSHyejw?=
 =?us-ascii?Q?w9EK0afNFdGX8j6RgondK4yJLvPPUcr+awOkaMpq84MY/2d5JLEWs2Aa0TnT?=
 =?us-ascii?Q?DT8RM+XY9/aA8PdnFYucGpR7Up5BjLr2SpkqXqTnKR9IVG3r9WnuPT5pkqSE?=
 =?us-ascii?Q?207HYMaBISwQ+0sAtSULGVrCT9Cp0y3/qZwRUU1ASaci7tAVERGJC7+3R+1l?=
 =?us-ascii?Q?bpezE23gqJS34GbXGyflBPs73n4mth9PqGhMcBK/Df+jFBT6aPHDoXPDh034?=
 =?us-ascii?Q?EUOOFOcHjji92Gu7I3kbDE694opTw8B3tLg3iYxLBbe4DaPWYyRNeXDMPgt0?=
 =?us-ascii?Q?ZqpPoYEvcV/NZ7BTGL7YeNUYOKgMRfyRM3KB/VrJPc1MSBoXNT1Zf50v9iaV?=
 =?us-ascii?Q?gXRBG93VGvfby787pZkqHNwjLAlwmWlcWEoPQgCA/+e3PvZWV2NH7cfbPC8s?=
 =?us-ascii?Q?idt+8oyz3g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc876a4-5b43-4434-4b55-08df4708495e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:15:02.7662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8Y1rwaAcyTMtPA1WI3RiTCxrhxUA6K7+knx6b34Pio86oEnnwXx8QPKOu/mtgB9CpkdiWQF5SBAGF2NtZAU3z0wxyPk+1NS6D2brvdiC7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0815
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250789
Content-Type: text/plain; charset="utf-8"

ChangeLog: https://github.com/FFmpeg/FFmpeg/blob/release/9.1/Changelog

- Drop 0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
  upstream handles it now
- Refresh makerace.patch and rebase to 9.1

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ak-ensure-target-directories-are-cre.patch | 45 -------------------
 .../ffmpeg/ffmpeg/makerace.patch              | 11 ++---
 .../ffmpeg/{ffmpeg_9.0.2.bb =3D> ffmpeg_9.1.bb} |  3 +-
 3 files changed, 7 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-comm=
on.mak-ensure-target-directories-are-cre.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_9.0.2.bb =3D> ffmpeg_9.1.bb}=
 (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-=
ensure-target-directories-are-cre.patch b/meta/recipes-multimedia/ffmpeg/ff=
mpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
deleted file mode 100644
index a9c54971e42..00000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-=
target-directories-are-cre.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 01b4d2e905e79a6858078927c111ce96bd03b314 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 11 Dec 2025 19:55:46 +0100
-Subject: [PATCH] ffbuild/common.mak: ensure target directories are created
- before running shell redirects into them
-
-Otherwise, occasional build races have been observed:
-https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3001/st=
eps/13/logs/stdio
-
-/bin/sh: 4: cannot create fftools/resources/graph.css.min: Directory nonex=
istent
-mkdir -p fftools/graph
-/bin/sh: 1: cannot create fftools/resources/graph.html.gz: Directory nonex=
istent
-make: *** [/srv/pokybuild/.../ffmpeg-8.0.1/ffbuild/common.mak:165: fftools=
/resources/graph.html.gz] Error 2
-make: *** Waiting for unfinished jobs....
-make: *** [/srv/pokybuild/.../ffmpeg-8.0.1/ffbuild/common.mak:145: fftools=
/resources/graph.css.min] Error 2
-
-There's a separate rule for making those directories, but unfortunately
-it's racing with the rules that expect the directories to exist. Rather
-than add a Makefile dependency, I've injected the dir creation directly
-in front of commands that can otherwise fail - a proper fix would probably
-add the rule rather.
-
-Upstream-Status: Submitted
-    [by email to ffmpeg-devel@ffmpeg.org,softworkz@hotmail.com,kasper93@gm=
ail.com,
-    https://lists.ffmpeg.org/archives/list/ffmpeg-devel@ffmpeg.org/message=
/6QKXQGZKGDNDQXH2XO5IO4LAQKVHHWZG/ ]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- ffbuild/common.mak | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ffbuild/common.mak b/ffbuild/common.mak
-index 059de5a..9ca7219 100644
---- a/ffbuild/common.mak
-+++ b/ffbuild/common.mak
-@@ -114,8 +114,8 @@ $(BIN2CEXE): ffbuild/bin2c_host.o
- 	$(HOSTLD) $(HOSTLDFLAGS) $(HOSTLD_O) $^ $(HOSTEXTRALIBS)
-=20
- RUN_BIN2C =3D $(BIN2C) $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) $@ $(su=
bst .,_,$(basename $(notdir $@)))
--RUN_GZIP  =3D $(M)gzip -nc9 $(patsubst $(SRC_PATH)/%,$(SRC_LINK)/%,$<) >$=
@
--RUN_MINIFY =3D $(M)sed 's!/\\*.*\\*/!!g' $< | tr '\n' ' ' | tr -s ' ' | s=
ed 's/^ //; s/ $$//' > $@
-+RUN_GZIP  =3D mkdir -p $(dir $@) && $(M)gzip -nc9 $(patsubst $(SRC_PATH)/=
%,$(SRC_LINK)/%,$<) >$@
-+RUN_MINIFY =3D mkdir -p $(dir $@) && $(M)sed 's!/\\*.*\\*/!!g' $< | tr '\=
n' ' ' | tr -s ' ' | sed 's/^ //; s/ $$//' > $@
- %.gz: TAG =3D GZIP
- %.min: TAG =3D MINIFY
-=20
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch b/meta/re=
cipes-multimedia/ffmpeg/ffmpeg/makerace.patch
index 1788e8b98fc..49bd3233d73 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/makerace.patch
@@ -11,12 +11,13 @@ It needs the missing directory creation dependency addi=
ng.
=20
 Upstream-Status: Submitted [Sent to https://lists.ffmpeg.org/archives/list=
/ffmpeg-devel@ffmpeg.org/ 2026/9/11]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+[Rebase on 9.1]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
  libswscale/x86/Makefile | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/libswscale/x86/Makefile b/libswscale/x86/Makefile
-index 0f7a3db..f56a5a4 100644
 --- a/libswscale/x86/Makefile
 +++ b/libswscale/x86/Makefile
 @@ -1,3 +1,5 @@
@@ -25,11 +26,11 @@ index 0f7a3db..f56a5a4 100644
  OBJS                            +=3D x86/rgb2rgb.o                       =
 \
                                     x86/swscale.o                        \
                                     x86/yuv2rgb.o                        \
-@@ -31,6 +33,6 @@ $(SUBDIR)x86/ops_common.o: $(SUBDIR)x86/uops_macros.gen.=
asm
+@@ -31,6 +33,6 @@
  $(SUBDIR)x86/ops_int.o: $(SUBDIR)x86/uops_macros.gen.asm
  $(SUBDIR)x86/ops_float.o: $(SUBDIR)x86/uops_macros.gen.asm
  $(SUBDIR)x86/uops_macros.gen.asm: $(SRC_PATH)/libswscale/x86/uops_macros.=
asm.h \
--                                  $(SRC_PATH)/libswscale/uops_macros.h
-+                                  $(SRC_PATH)/libswscale/uops_macros.h | =
$(SUBDIR)x86
- 	$(HOSTCC) $(HOSTCC_E) $(CPPFLAGS) $<
+-                                  $(SRC_PATH)/libswscale/uops_macros.h | =
$(MSCL)
++                                  $(SRC_PATH)/libswscale/uops_macros.h | =
$(MSCL) $(SUBDIR)x86
+ 	$(HOSTCC) $(HOSTCC_E) $(HOSTCPPFLAGS) $<
  endif
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_9.1.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_9.1.bb
index af92a0b0df8..8413b16c251 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_9.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_9.1.bb
@@ -23,11 +23,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234ee=
4d69f5fce4486a80fdaf4a4263 \
                     "
=20
 SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz \
-           file://0002-ffbuild-common.mak-ensure-target-directories-are-cr=
e.patch \
            file://makerace.patch \
            "
=20
-SRC_URI[sha256sum] =3D "8c3850283eb25fa026482078a04051e0be17347b09ef81a084=
9bec15a96e002e"
+SRC_URI[sha256sum] =3D "1a4d394ae63d190a526cd052eb4415c156b5c5e2df37efab41=
a7de0b8fde2433"
=20
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/sho=
w_bug.cgi?id=3D7717
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
