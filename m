Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8814910A88FD
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 18:15:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54428.1774548897867350699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 11:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L12U+GYc;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so12015275e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774548896; x=1775153696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OiZo5WZ9XgeMHuOS5qnZXY7aCV3BApaNYeGnZbPIQlk=;
        b=L12U+GYcxSXLdPoGS56UlPqD1gz93gITrARr9sUuQ1JKK30MPwY4vlbiDz4eKlYd9b
         VqDjN2RWYq25tjToS1JOK0fQo7RAjBQPooFb0xZ/oWu+rehZ/0WPeH5YbA6Y6l5l6T2u
         GDbyr9IfkPCvjSoDrZ4FsGOjOil2nGupIjTDdRcBC+i2E76TkJhB4WgXCtOF0gZLk/1V
         LGetzp7WWXCMKsCHmg4kOCchka5pY2+oFVQhpIuSteN5uHHs56KMLQQGnNUHhaQz9+kX
         b0Q9OgYXqj86SqB9230kEg0gNt6f0PiyCI2TyFLqG9xbJ5IwgzaNWTvCp3JqDvxpdK/x
         BfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774548896; x=1775153696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiZo5WZ9XgeMHuOS5qnZXY7aCV3BApaNYeGnZbPIQlk=;
        b=me9o0aR+24gh2DoeRFMAqv61bLYtnDrsCv69cV9DZrLGo7CCoxNErVv9KurfIBsCX3
         1qpYTesN2CHMrO4FxP9vHXfKm0jFIYagEhI82ue/2ziwGN3kHy6cX9G0PGcz54s2KQT2
         qzpzoxB1B9fX2lESIPUAXBk4n5bUNUttv0dnMu7plQ0Nzs+7csh5eYI688JhCJhu8ym8
         5TPDoZZoA7jzkaohxz2OQE+gdQEZmHLhFUBWUHpMgnb5YOg0XgN+lrcxWrGCbxxxBUil
         cVv5FFsLvcJ7ECzBJD13Tpwte2gcJx3BgyOugS6lpRho8O063mvG6RbuMlUk5c68IauT
         VPPQ==
X-Gm-Message-State: AOJu0YwHgC/QkVGmTFWhINzRBKNNx9RsDgfhvZqZN5I5LqLP3iH3ckx8
	Gts+GnFzwSEII/LFSVwRZQuOjD2Plj4Yu4QQoTSvC0UDX2QU4BrIS7Bnmd1EnM4/
X-Gm-Gg: ATEYQzwCC2l4z+mbSERwh1fcf+7DR3WhqgcIJ7U5uswxwFuBo9cTGSWFLKK6AdDYMP0
	d0uOqGIqePd35EQoxdBFeQdoxnysfWauCfstvtCrav27+bz4/+ZbAwhW+xmeKRKI9l1+X/er3zA
	pW9ondHVm6W4+MOanORqUYu63a9a3L7fjZJUl9dsl4LDt82utJI6rQY4MsWiGaI0TgBomA/Q2Mi
	jAD82M0DGDWHkRRJp6r9oIc/oQwYK9s+9tHYU4xwfQWNZ7r49wtEwxU5JVGqmTSVLNgf8w61MA+
	bTrJe7SQLwX8JBv5yepzyFajppg7+zooKOeIhxtLUmVOjbW3WsgQYGNGtHMRexlGmPqYrXdpyFz
	Q0tuLVX2SAUqXZBlvgO3PeQJCUCu/mteeSaywybyOyDus/qrKqfJpmteQOS/Ww9HJ4Vt36chq4s
	m6xOPABgFzwaalU3/e2wriz+q74w==
X-Received: by 2002:a05:600c:a40e:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-48716042b35mr101771135e9.22.1774548895779;
        Thu, 26 Mar 2026 11:14:55 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c84988sm38146165e9.5.2026.03.26.11.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:14:55 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/6] dtc: backport fix for build with glibc-2.43
Date: Thu, 26 Mar 2026 19:14:45 +0100
Message-ID: <20260326181450.1262870-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 18:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234035

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
---
 .../0001-Fix-discarded-const-qualifiers.patch | 85 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.7.0.bb          |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
new file mode 100644
index 0000000000..c643410ae9
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
@@ -0,0 +1,85 @@
+From 861cb43eb53afff83e28ba0e0f88ffa464ebe8ca Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/libfdt/fdt_overlay.c?h=main&id=9a1c801a1a3c102bf95c5339c9e985b26b823a21]
+---
+ fdtput.c             | 8 +++++---
+ libfdt/fdt_overlay.c | 3 ++-
+ meson.build          | 3 ++-
+ 3 files changed, 9 insertions(+), 5 deletions(-)
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
+index 5c0c398..75b0619 100644
+--- a/libfdt/fdt_overlay.c
++++ b/libfdt/fdt_overlay.c
+@@ -431,7 +431,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
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
+index 8952e8a..ecb0ae0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -14,7 +14,8 @@ add_project_arguments(
+     '-Wstrict-prototypes',
+     '-Wmissing-prototypes',
+     '-Wredundant-decls',
+-    '-Wshadow'
++    '-Wshadow',
++    '-Wdiscarded-qualifiers'
+   ]),
+   language: 'c'
+ )
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
index 0702fc16df..a2f41197fd 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
     file://0001-meson.build-bump-version-to-1.7.0.patch \
     file://0002-meson-allow-building-from-shallow-clones.patch \
+    file://0001-Fix-discarded-const-qualifiers.patch \
 "
 SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
 

