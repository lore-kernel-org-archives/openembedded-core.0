Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.20723.1621847651542252663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L7uNQR8K;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id o5so22084975edc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IRExYSlIYmknqhKK7emgh7F8KCbCWoo1DD5ztHRB2sA=;
        b=L7uNQR8KIQtWRk6iGeK0IpkoHkHu1FEUCEuJe6UqfxzkO+YcVnVUkEonuZZAN3ywVi
         DJNVZZ5vs4n6fv6MjrsPDpt2exjNsRwOoaRac/rRvjyMF87Hl1WqI9QBc8fZwfjP0szi
         C2S7YGVVHrT+spcdqM2c4vPU+kkW2Fss+EWxmQaS1FCHjP9KwZfzRGfAKPuU6Gm+KS5n
         M77pg5AeSOFi1ZdWa02w4fo3fMSQo3HmKTWgnJc52ArVOCK/5/J9ZNy3sEm+cltCOteN
         VAciaxGTXPSd/UX056cm7f9MPLv5+oyMz5P/mXuxM9gTE6f5nW2gmAlfZagtiAoGgmhm
         JGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IRExYSlIYmknqhKK7emgh7F8KCbCWoo1DD5ztHRB2sA=;
        b=ekug8Rpho5RNNTGx6J9cI7xcjzZgVpqGJvrO9iBQWOdcxzbnm1Hhfgulwz6B1+CHKq
         Jf/Swk8qgzipSXpUb9xAo4uMOv1RThRIsiavG1q8nCejjHENoT7imOB3l3+SJN8Xg7dL
         YCKkUXxdvqXL8mRxUzC0zyX5qkccfJlXeyoQVkyb3VOvkazgixTc5JOLEKCth30DSCYU
         wlTg0rDHeOIJNN9RxXtYn4bzjkd0WX2mrJtlPPhxOA1VcymVTi8PMkcvkW+gLJH+KGKl
         N18ZKDFJIKXr0OHrUyp0K8BqMWllGlOMFjlbYe9xTl6aaBDi086IVFsKgY1c35tmlAF5
         Y26Q==
X-Gm-Message-State: AOAM5331sM/zQGaoeYUtNVKBC4KyKItUIsQS+0+wyoYpAgdlFGqlW4fQ
	ldKwr63pwgE02sbU8pTQRXW5d5mktvk=
X-Google-Smtp-Source: ABdhPJyf/8Nj+C/J392lkQfoeK+PBz0Mkuo6QTEvm9eojk5gGRzKdb4EGfDmof5s1b9Jo/d2xGJRIg==
X-Received: by 2002:a05:6402:da:: with SMTP id i26mr25057728edu.379.1621847650137;
        Mon, 24 May 2021 02:14:10 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/21] igt-gpu-tools: upgrade 1.25 -> 1.26
Date: Mon, 24 May 2021 11:13:36 +0200
Message-Id: <20210524091347.419253-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop patches merged upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...t_edid-Allocate-raw-8-bytes-for-VSDB.patch | 42 -------------------
 .../igt-gpu-tools/reproducibility.patch       | 38 -----------------
 .../igt-gpu-tools/igt-gpu-tools_git.bb        |  8 ++--
 3 files changed, 3 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_edid-Allocate-raw-8-bytes-for-VSDB.patch
 delete mode 100644 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/reproducibility.patch

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_edid-Allocate-raw-8-bytes-for-VSDB.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_edid-Allocate-raw-8-bytes-for-VSDB.patch
deleted file mode 100644
index 38bd4550a3..0000000000
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-igt_edid-Allocate-raw-8-bytes-for-VSDB.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 606349860d27492c328752dca5a3784c0e9a6d24 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Feb 2021 11:05:45 -0800
-Subject: [PATCH i-g-t] lib/igt_edid: Allocate raw 8-bytes for VSDB
-
-hdmi_vsdb is an element of cea_vsdb which makes the size of cea_vsdb to
-be 8 ( 3bytes ieee_oui ) + ( 5bytes hdmi_vsdb struct), its true that we
-only use 7 bytes technically we can only allocate 7byte array but since
-we are writing to elements of hdmi_vsdb struct which is sitting at offet
-4-8 in cea_vsdb, compiler thinks we have an element which is out of
-array bounds since out allocated size is 7bytes
-
-This errors out
-../git/lib/igt_edid.c:365:13: error: array subscript 'struct hdmi_vsdb[0]' is partly outside array bounds of 'char[7]' [-Werror=array-bounds]
-  365 |         hdmi->src_phy_addr[0] = 0x10;
-      |             ^~
-
-allocating one extra byte matches with size of cea_vsdb and compiler is
-happy
-
-Upstream-Status: Submitted [https://lists.freedesktop.org/archives/igt-dev/2021-February/029446.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/igt_edid.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/igt_edid.c b/lib/igt_edid.c
-index 1c85486d..ce09cc47 100644
---- a/lib/igt_edid.c
-+++ b/lib/igt_edid.c
-@@ -351,7 +351,7 @@ void cea_sad_init_pcm(struct cea_sad *sad, int channels,
- const struct cea_vsdb *cea_vsdb_get_hdmi_default(size_t *size)
- {
- 	/* We'll generate a VSDB with 2 extension fields. */
--	static char raw[CEA_VSDB_HDMI_MIN_SIZE + 2] = {0};
-+	static char raw[CEA_VSDB_HDMI_MIN_SIZE + 3] = {0};
- 	struct cea_vsdb *vsdb;
- 	struct hdmi_vsdb *hdmi;
- 
--- 
-2.30.1
-
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/reproducibility.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/reproducibility.patch
deleted file mode 100644
index 39e36d8737..0000000000
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/reproducibility.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-meson: Allow source location to be configurable
-
-Hardcoding a build source path into a binary when cross compiling isn't
-appropriate and breaks build reproducibility. Allow the srcdir to be
-specified by an optional configuration option to meson.
-
-Signed-off-by: Richard Purdie <richard.purdie at linuxfoundation.org>
-Upstream-Status: Submitted [https://lists.freedesktop.org/archives/igt-dev/2021-February/029443.html]
-
-Index: git/lib/meson.build
-===================================================================
---- git.orig/lib/meson.build
-+++ git/lib/meson.build
-@@ -122,7 +122,11 @@ if chamelium.found()
- 	lib_sources += 'igt_chamelium_stream.c'
- endif
- 
--srcdir = join_paths(meson.source_root(), 'tests')
-+if get_option('srcdir') != ''
-+    srcdir = join_paths(get_option('srcdir'), 'tests')
-+else
-+    srcdir = join_paths(meson.source_root(), 'tests')
-+endif
- 
- lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
- 		      fallback : 'NO-GIT',
-Index: git/meson_options.txt
-===================================================================
---- git.orig/meson_options.txt
-+++ git/meson_options.txt
-@@ -50,3 +50,7 @@ option('use_rpath',
-        type : 'boolean',
-        value : false,
-        description : 'Set runpath on installed executables for libigt.so')
-+
-+option('srcdir',
-+       type : 'string',
-+       description : 'Path to source code to be compiled into binaries (optional)')
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index 1cc94cf993..5ab0498f7a 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -9,12 +9,10 @@ LICENSE = "MIT"
 
 inherit meson
 
-SRCREV = "d16ad07e7f2a028e14d61f570931c87fa5ce404c"
-PV = "1.25+git${SRCPV}"
+SRCREV = "203def046b466fb2da67f9f15552d84e1c0b41f2"
+PV = "1.26"
 
-SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https \
-           file://0001-lib-igt_edid-Allocate-raw-8-bytes-for-VSDB.patch \
-           file://reproducibility.patch"
+SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1

