Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1536.1795801785687625679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=IKKrAxvR;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3edaso5695844f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801784; x=1796406584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hz2cjnGToR0WoC6wbbRGe5eqPKbaoy3b3n3NdX2czms=;
        b=IKKrAxvRgTm4gqFEZlXUu+wxUGgyQyDVb4OncPH3KEzoG/suqjk+VSTFrGfOBLY7GZ
         1PSWl9HSiZeWW9qmQugiB1a7OMJdArcek2SfFN6kguCNaA4axBycajCFCF2kk5fxRYnG
         NRyMcJNv0ux9d3WQATa+Vi58o62IRssV3G8+1qall7P48ndQX28Hg7kaa2mUzz1ZKsOU
         cATwpl/TDYPtTtH7+vO6D7mgeGCP6kUfPDZ2kwAQxRiQRnMhBzhJhxL6AwREzplo70/u
         Mi2o/3rcTOBweSaoyRAXiEofWpqxnu9h37MfvYBADOAwbZTm012G1ThwhoLN8RhuPRc5
         Q9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801784; x=1796406584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hz2cjnGToR0WoC6wbbRGe5eqPKbaoy3b3n3NdX2czms=;
        b=FBKQKFLir4Sbxh9hpeIsXYdYVkDNtwVUzcklvAxfimPDV71/o42NvlKEGjjHojsoFD
         87g/3kjEkHss57RbUQMaOIzG0GSP0msjNomdDtWY1Y57KAm8nvt+FvsBda9vu3TO8QiX
         rUNRZYKags81hg1+n4juGy9VuNoIGr7Nwf9DK9CGEXz3i1AuHfs8BGhiRylXBRWmYMyF
         yEYOnr4dev9m970/UMReeoPtHM0RsdVb0tiSevGxsguqo4UmXl9q3fZ9IsTV+BbYsp/i
         5w22Cn0Q14DN5xjS9yD4s7VFX7Zk2f8bvqNjZh50ppI0LEdZwS0EaJ13en+yQUsz38vG
         TNPg==
X-Gm-Message-State: APuU4Z+FBPzh+yt7TB93I6mRyrbQlK6Dbp2TrPKUsRU4sigNqJGvhwxw
	++rdOZ/KX11MGRxTGsc3DfL1X1NJ8LQh6JHjjOjzm09XPCLmrg96L0onj5hjYfshk9hHPBNm71I
	dRJOpbPY=
X-Gm-Gg: AZFdTZd3DlnaRbr9CuIzXe3d+agSsi5KWwETUcuLPAUYZPvu87uuMcmmf7AzF2bEwWP
	2Bz5QQ4S8m9KYw12Q64b89aYo0cnDBq4exuaM5eqSJIyoBkBR56mRraf93U70LPYgKIeN3aafB3
	1+OfB/r47Y4UNge+gaRgrQPaMjnC6rDV3nqrfEH5cOHK7ysadyrFF/bw+aEEF/h+SXor5L+BxgG
	ysPXGFPeMMtN/dutTzZTwesJLLdCxNZt1KlB/gSo+UobFA2mbnsfqvXlXLquUt5dnRtukPfPiCt
	29ncP1mexPRv58wtsRh6lCbQmlByQSGukmU6PFrnoDvHHSgR0QIdPlWEhCaFbJnTKaAeO5HOVQJ
	mvawFexUISO5KtMzr2uCIBEF2D0kJoPp9PE01r5M8v/8BcRv/qlcGCeJa9ifc8NKSuuiCjoW2bU
	JRGNz2mTPEgkJ7U7OXI5H3QLlPjcNuffOQvNTeJcARVeulDs6Mb7GX+XrSRJNcAwgerQQVUpWhJ
	ERGhCHdZY6HKuxP/5rCxFYPmCWALNf/GSw4u+940bxObzPiPOek4FVphqPwm17660sZ7ZxIoM+z
	/iHv5VRKQtmFKcd+iRUqvlptgxbXGaLKPeJYBWPimBA+1Q+QarjcqmBrZKV0deEp89g9WglVfKX
	2R5bMww+pqUiLA/WHI5TPZ5CFKHDVfw==
X-Received: by 2002:a05:6000:2382:b0:4a7:1fca:e537 with SMTP id ffacd0b85a97d-4abb0886cbamr51104779f8f.9.1795801783864;
        Fri, 27 Nov 2026 09:49:43 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:43 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/37] dropbear: patch CVE-2026-35385
Date: Fri, 27 Nov 2026 18:49:00 +0100
Message-ID: <3cc206f321ea3aa303092c840647b9e1fafb8a4f.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251423
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2026.90 release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../dropbear/dropbear/CVE-2026-35385.patch    | 42 +++++++++++++++++++
 .../recipes-core/dropbear/dropbear_2022.83.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch

diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch b/meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch
new file mode 100644
index 00000000000..773ed196107
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2026-35385.patch
@@ -0,0 +1,42 @@
+From 443ccc1fd1b9a4e3747f6b5cd644b7af49064308 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Sat, 2 May 2026 08:17:25 +0800
+Subject: [PATCH] scp: clear setuid/setgid bits on received files
+
+From openssh-portable 487e8ac146f7d6616f65c125d5edb210519b833a
+Tracked as CVE-2026-35385
+
+upstream: when downloading files as root in legacy (-O) mode and
+
+without the -p (preserve modes) flag set, clear setuid/setgid bits from
+downloaded files as one might expect.
+
+AFAIK this bug dates back to the original Berkeley rcp program.
+
+Reported by Christos Papakonstantinou of Cantina and Spearbit.
+
+OpenBSD-Commit-ID: 49e902fca8dd933a92a9b547ab31f63e86729fa1
+
+CVE: CVE-2026-35385
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/443ccc1fd1b9a4e3747f6b5cd644b7af49064308]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ scp.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/scp.c b/scp.c
+index 09297a5b..79b0a12d 100644
+--- a/scp.c
++++ b/scp.c
+@@ -1114,8 +1114,10 @@ sink(int argc, char **argv, const char *src)
+ 
+ 	setimes = targisdir = 0;
+ 	mask = umask(0);
+-	if (!pflag)
++	if (!pflag) {
++		mask |= 07000;
+ 		(void) umask(mask);
++	}
+ 	if (argc != 1) {
+ 		run_err("ambiguous target");
+ 		exit(1);
diff --git a/meta/recipes-core/dropbear/dropbear_2022.83.bb b/meta/recipes-core/dropbear/dropbear_2022.83.bb
index d06bbd3a6db..65dfddbca72 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.83.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.83.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://CVE-2019-6111-03.patch \
            file://CVE-2019-6111-04.patch \
            file://CVE-2019-6111-05.patch \
+           file://CVE-2026-35385.patch \
            "
 
 SRC_URI[sha256sum] = "bc5a121ffbc94b5171ad5ebe01be42746d50aa797c9549a4639894a16749443b"
