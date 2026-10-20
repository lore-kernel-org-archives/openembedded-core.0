Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4735.1792538579792962785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 16:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20251104.gappssmtp.com header.s=20251104 header.b=Tc+GayHU;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso60267f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 16:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20251104.gappssmtp.com; s=20251104; t=1792538578; x=1793143378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cbCQp96ESy3XDV3SmB7US7tFK6JCro1p6kX1f/9zG1g=;
        b=Tc+GayHUheml3uEDDiUro+p0GrxiwYG3XBm+lrDtnPxc87XN5vvBUBqnso5WsGd5yl
         +gfh8rPUR2LXHS6SvIUOGfcV9lCCfTEJ+kKqm5vVEHtATYrw8AGLAAcmvBGU30fycSxp
         TGAF1/X8+G/5XrssOxxDGDv0Pm1CGxB619jEiyxnIJmsw1l47TjcncBRzffXnxcysFyB
         +1f1RQFibiiAWsn5WuEOCyd4X6n36dIxMRCCyZZYgX2EYjOQbdtN9P3ZBBaGJ6Ep9AyB
         fa3lLxVtigiIwwPDQCErFqIvsMdnLTlMLmUF5D7TQYWEBZMwXflqVprgxC9lur6/Myfs
         xqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792538578; x=1793143378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cbCQp96ESy3XDV3SmB7US7tFK6JCro1p6kX1f/9zG1g=;
        b=Z6na9i723n1WlbWpX0dqbaQ00F7OnhmFbynIfiuwP4kklrhse5aJpb8x9sresbQMJ8
         kIKgSOfkd6TqXftEZZHZDbGfnmkItgQTeC9Ff5ENaBBzdqn7I20RbaQD1chjl5SrHwsY
         RI9LaNKMBZiucAkLlwwOvKamntPM/hjb14Ia0OnjhPkgM78s0YHEoogL+EIztkwK/DII
         9YSDhaF/+7Z5alZZdBZGJ4PkHBJjgBMphr+tGjowPiFuFIhBZ3fNfNqR3SppzSMsYa7o
         +myWCzrm91LqUAtsp4DBbxdS4aOwrF4sKXPGNwQaYO9tAFxXXDWaLt6xx5E+uBYDxUtv
         Gihg==
X-Gm-Message-State: AFq9FYJfdumC6xqBn+OXYf9ZQM1V/SXMK0oIVFvohC53iaeJGYeJ1Cux
	1JjiXCWqJPEj7Ij541Hm12UAOZh610ECHs+zYLmDKMg4LysWTr8b6d7pA7M/rLntTZ2Q+T5qZHJ
	AnTx4dIQ=
X-Gm-Gg: AYBFou1aXG/q8NNLWN51L9jYkLrCg+sO2lS6rvUIgnmBDV5xXIwjjOyjlC+E6hXXJ3X
	c/lwtAY5enAzXwCZS6e4vTAYcw+KhuHFkN9gCyEURTb7e7bQeMHAftprPIZYZ21hl7Y2erNPTGt
	EuLrQD34uMWTKtYh1q1j/maBm76u3k7zTv8SkD9BWPO/zCkRpLA1N9AV3HHyrBkle3QXn8A0Ld1
	y2U9Lbmvsh3hBFHIrqB+OdZjmaCQ/5hfHa28DTxAKq/V39hBSx2KeOw+WO0K1U1qTVU97EdHJWT
	QHpWEiyIWDR2jdFex4tpSGVLnM2Bo/PEVSsEQKNLoMOWPs8iwqE79rj1Ryp9amuuwcNeJrXurGR
	f1NnqjYzriJPDJx6TgQYTF3zFyMTy6jjuYIl8c4ccvrN2Hsf80sva1lAgT3aD3xysMRnZKFJ2uh
	GB7VjQaD1j0o6TCxu9GPXotEHzyFwbWiNxw6RQvn85kK90F3t4a8Y00IIVEAKzXKfobTHRQNq66
	T+Dw/EX0FbCdwJMtjrCvsrRD1e9QJoIOvqZmihxI65ChACcWDnN9Cz5kLk/pZo5clJw8X/C9g==
X-Received: by 2002:a05:6000:2990:20b0:48a:fba3:d5b1 with SMTP id ffacd0b85a97d-48e264ee716mr201241f8f.55.1792538577795;
        Tue, 20 Oct 2026 16:22:57 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583523asm1436615f8f.37.2026.10.20.16.22.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:22:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/25] nasm: fix CVE-2026-6067
Date: Wed, 21 Oct 2026 01:22:21 +0200
Message-ID: <2c4556d979ad999e4f32987eb24629318ace5de1.1792537664.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792537664.git.yoann.congal@smile.fr>
References: <cover.1792537664.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 23:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248330
Content-Type: text/plain; charset="utf-8"

From: Kris Gavvala <kris.gavvala@windriver.com>

When using obj output format, specifying more than 256 segments in
the GROUP directive of the .asm file causes a heap-buffer-overflow.

This patch applies the upstream fix given by the commit in [1]
to address the issue in [2].

[1] https://github.com/netwide-assembler/nasm/commit/8890d723d0aa9ed1a790e2ce1c55eee8dfa0cf94
[2] https://github.com/netwide-assembler/nasm/issues/203
[3] https://nvd.nist.gov/vuln/detail/cve-2026-6067

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a81d85a8a23fc1a5c8396c8a7cb5cb59e97a9b2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../nasm/nasm/CVE-2026-6067.patch             | 36 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_3.01.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
new file mode 100644
index 00000000000..e43aafc7ee2
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
@@ -0,0 +1,36 @@
+From cc006a1d57bebb6ea49db488539a1613014c062f Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickclifton@github.com>
+Date: Mon, 29 Jun 2026 13:53:14 -0700
+Subject: [PATCH] outobj: fix buffer overflow when too many segments in a group
+
+The number of entries in a group was hard-coded, but not enforced.
+
+CVE: CVE-2026-6067
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/8890d723d0aa9ed1a790e2ce1c55eee8dfa0cf94]
+
+Reported-by: <BreakingBad6@github.com>
+Fixes: https://github.com/netwide-assembler/nasm/issues/203
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ output/outobj.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/output/outobj.c b/output/outobj.c
+index 685c5933e..9d8bf83c5 100644
+--- a/output/outobj.c
++++ b/output/outobj.c
+@@ -1736,6 +1736,10 @@ obj_directive(enum directive directive, char *value)
+                      */
+                     continue;
+                 }
++		if (grp->nentries >= GROUP_MAX) {
++                    nasm_nonfatal("too many segments in a group");
++                    return DIRR_ERROR;
++                }
+                 for (seg = seghead; seg; seg = seg->next)
+                     if (!strcmp(seg->name, p))
+                         break;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm_3.01.bb b/meta/recipes-devtools/nasm/nasm_3.01.bb
index 1e4719000f8..e8079732d43 100644
--- a/meta/recipes-devtools/nasm/nasm_3.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.01.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
            file://0001-compiler.h-Backport-C23-support.patch \
+           file://CVE-2026-6067.patch \
            "
 
 SRC_URI[sha256sum] = "7a7b1ff3b0eef3247862f2fbe4ca605ccef770545d7af7979eba84a9d045c0b1"
