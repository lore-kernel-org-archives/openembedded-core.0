Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DE7F8DFF2
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:16 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28570.1776378792134605084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=e+3AtNsQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488ba840146so418735e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378790; x=1776983590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szp4dFfHWgjV6v2/N/AVo3ctLJaHSGVnwRidzPVQiO0=;
        b=e+3AtNsQRza2RqDY4qgB+Nyp8mLHx7a9WfFHBKAJmHIjRgnS8uw5oTlbZWyAd76cmr
         gchTe2kgoBAIzenAVLlF2P5YT68zuL/HaOdpLGKeLM4EhTZlEfXgJJioiN+p1V880s6e
         54e0UGxFYyR3dbxYlK+xfQ7rgy1dw7R3vCdS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378790; x=1776983590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=szp4dFfHWgjV6v2/N/AVo3ctLJaHSGVnwRidzPVQiO0=;
        b=W/mjN/1P96X0YH7V/GjFCBdxBufUCW3K4YOOkEBkYHf3nAvUsYVGkocjnoA0HayPDq
         DhoTyJN1li3C8MsxBCF/6Drl88fDAlxt7UrM8K6oSfN49NbOiH/d+gaq7tikqVvfEiTR
         LibKiy9/Sw3d+RL/4rle6jPYdcWyJVurB1WQytkpUW+7sg1oBQaXJNlnAxH1w2wlBFGw
         TNGIEw4Cn6Cw8//+YDzOv2P1VrshShGcqD4jRkZdtTd2vq1HI2dt6JNwtbbzfAVMBtoM
         6ihKUL2JL3AVN1+e8AqnUn2JFrP69z93AwY3g7S5DQYD5U1br7OtCs9MkQIlVhQZiQ10
         OAPA==
X-Gm-Message-State: AOJu0YxhTzPQMEIgt9u7tyk8Cl1qZFUM4MQIH5oH97aiWkjbhIOO4OV+
	SLUznT1lm+dc+F0msgZFJt+NdATMfm574tsJHQn3PIDxIhL2dUw3I9y4U12bwF+j9Dhl8yll5Sm
	81OzTB4RuTk6h
X-Gm-Gg: AeBDieugyLQgDKBenMLIBI5+3i2XvIMmrI1sezCVxhP9EN00M0eg3El/4FYD9c2ROK3
	fnuOC/9DFPiynXFIwFUlwhE6Ndx1wNM8E+95Hx+7Jvs3EFiFux+9QjswgqB9sEt+LDv48wxk6vj
	K1GiuChn0KdzsYxVVRi8QaCrLGKiUoaoFo2HCZ3CRNFiJbSBNaHZtJ2CnePINcO29sTI2ghmt5v
	C0JDgWbRFhKFYmHMKVJ3MMwzpol5VIKthVMCLmPfgICq8MTnijE51aeH9Uh6/gyUZkM6CYUfZc3
	8IQCW4GV7r/HO7GEMTqnIhB4e103Kw3+L+XQZty3aFE+KWnaOj43xdD0iXXDBXv5DocGZop0ezB
	X2Iciv0ycsT6z8l4/2zpoorY3J0r+4NkARVeWoVLw3qrmRdgzs86L6M7ftWg8FSiUfja4PHk4iI
	85Eri0pUfY+6SeCOk6m/Gd5qRwYv+y3FWg1L6uigFc1Z0/Se4MeuNHryDmQ4VD7Hx6AJnZq3WtK
	tpPTFSIAp/pjuMIXfLeRDeh2LbeCV88Tquuog==
X-Received: by 2002:a05:600c:46cb:b0:488:a723:ea53 with SMTP id 5b1f17b1804b1-488fb744fbemr5778465e9.7.1776378790239;
        Thu, 16 Apr 2026 15:33:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 18/51] dtc: backport fix for build with glibc-2.43
Date: Fri, 17 Apr 2026 00:30:01 +0200
Message-ID: <47668754cd6829c8687d1ceebce35ba4442fd40f.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235447

From: Martin Jansa <martin.jansa@gmail.com>

glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
https://errors.yoctoproject.org/Errors/Details/903983/

../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function ‘overlay_fixup_phandle’:
../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
  424 |                 sep = memchr(fixup_str, ':', fixup_len);
      |                     ^
../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
  434 |                 sep = memchr(name, ':', fixup_len);
      |                     ^
cc1: all warnings being treated as errors

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28552a7b6c94060c7ab3899619ab8afb74124d02)
[YC: fixed the Upstream-Status Backport URL]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-Fix-discarded-const-qualifiers.patch | 83 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.7.2.bb          |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
new file mode 100644
index 00000000000..de06ab37231
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
@@ -0,0 +1,83 @@
+From c58beee7bec0774f12202511c97beb741ff2b534 Mon Sep 17 00:00:00 2001
+From: Stephen Gallagher <sgallagh@redhat.com>
+Date: Tue, 6 Jan 2026 14:19:30 -0500
+Subject: [PATCH] Fix discarded const qualifiers
+
+It's unsafe to implicitly discard the const qualifier on a pointer. In
+overlay_fixup_phandle(), this was probably just an oversight, and making
+the "sep" variable a const char * is sufficient to fix it.
+
+In create_node(), however, the "p" variable is directly modifying the
+buffer pointed to by "const char* node_name". To fix this, we need to
+actually make a duplicate of the buffer and operate on that instead.
+
+This introduces a malloc()/free()  and an unbounded strdup() into the
+operation, but fdtput isn't a long-running service and the node_name
+argument comes directly from argv, so this shouldn't introduce a
+significant performance impact.
+
+Signed-off-by: Stephen Gallagher <sgallagh@redhat.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/?h=main&id=9a1c801a1a3c102bf95c5339c9e985b26b823a21]
+---
+ fdtput.c             | 8 +++++---
+ libfdt/fdt_overlay.c | 3 ++-
+ meson.build          | 1 +
+ 3 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/fdtput.c b/fdtput.c
+index c2fecf4..8deec7e 100644
+--- a/fdtput.c
++++ b/fdtput.c
+@@ -230,19 +230,21 @@ static int create_paths(char **blob, const char *in_path)
+ static int create_node(char **blob, const char *node_name)
+ {
+ 	int node = 0;
+-	char *p;
++	const char *p;
++	char *path = NULL;
+ 
+ 	p = strrchr(node_name, '/');
+ 	if (!p) {
+ 		report_error(node_name, -1, -FDT_ERR_BADPATH);
+ 		return -1;
+ 	}
+-	*p = '\0';
+ 
+ 	*blob = realloc_node(*blob, p + 1);
+ 
+ 	if (p > node_name) {
+-		node = fdt_path_offset(*blob, node_name);
++		path = xstrndup(node_name, (size_t)(p - node_name));
++		node = fdt_path_offset(*blob, path);
++		free(path);
+ 		if (node < 0) {
+ 			report_error(node_name, -1, node);
+ 			return -1;
+diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
+index 28b667f..5f8aa62 100644
+--- a/libfdt/fdt_overlay.c
++++ b/libfdt/fdt_overlay.c
+@@ -409,7 +409,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
+ 		const char *fixup_str = value;
+ 		uint32_t path_len, name_len;
+ 		uint32_t fixup_len;
+-		char *sep, *endptr;
++		const char *sep;
++		char *endptr;
+ 		int poffset, ret;
+ 
+ 		fixup_end = memchr(value, '\0', len);
+diff --git a/meson.build b/meson.build
+index 310699f..2966b06 100644
+--- a/meson.build
++++ b/meson.build
+@@ -18,6 +18,7 @@ add_project_arguments(
+     '-Wshadow',
+     '-Wsuggest-attribute=format',
+     '-Wwrite-strings',
++    '-Wdiscarded-qualifiers',
+   ]),
+   language: 'c'
+ )
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.2.bb b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
index 92e83a94044..b8b79542c5d 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.2.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = " \
     git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
+    file://0001-Fix-discarded-const-qualifiers.patch \
 "
 SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
 

