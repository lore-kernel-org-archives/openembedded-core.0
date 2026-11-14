Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2537.1794683013144979186
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xFJbj/db;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1988551a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 11:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794683012; x=1795287812; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=La++V+/1F6vpQ34hzTTfNhh0wq+YoEKYGr5StZPDRuE=;
        b=xFJbj/dbWMwUciBdqjuy5x5v130YkyILmJSbCTpQOV0aUztKxPA1UcjrhuEiZ6r/Ad
         NxYSJN2YPy/vwaN0GNHIdA8j3qqlD+morLfp+xWCBKIozaLE7XScAAoSpfpbGip5UYKp
         WZsLlIiM3hHLyCloRXCbZLxRRs16fRufva4VOTSiho+TUYzMpIF8KLNixmNvVGf+66gm
         6uFvI47KL6CG+imP3oYrBcefTaYwp4k8eUxQZPC4Y8gsVeFMAGRUAPn11VmNzUDEqZi6
         LiHsPyaNiuFuEI4yBQLKbfoznFgiVunGxxbzCMwGZFYYIP/gCzPRlOXwPTOm1EKPoemQ
         ubdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794683012; x=1795287812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=La++V+/1F6vpQ34hzTTfNhh0wq+YoEKYGr5StZPDRuE=;
        b=HdElA8qgkgJ1t07hpDjmUFlV0BW5qI5aNLOj7KYxbE7PsIGQotT/7jjV7hxGmMtadO
         SQfFCqMsgudCT6rNZKQzm949h6J9MpYi/jW6U3KLrvMPuScXnzd6RzXb1S09bUmDiehC
         8EaOAiUkLbE17sgmF7TvzHVjsCKOXwJDFGSgNhCadaFqhewhWaQsGo9aUDJHQUArFc+H
         umBBepXzzuKXi+8R3A3MTvc0JDZHIe5+3q9xM1wzVKnnpOl6UNpnKh3YfriMkY3H/mMc
         GCsHgahUllf2h20Gp23Q1d90XGYcgnkmd4yca5yN76etGWqmjWNDIVoxghBUYa8WWqQy
         tM7A==
X-Gm-Message-State: APuU4Z+EQfUNcKrXKSsS40LZz+dt5NMLTO3aEDKmxEIEImxJZL7abl1k
	586QpcEM/ycEddgtZKJwYW1U7+EvesuT/VS/xosn0UgbxYpjdTN3qgwI1o2bzdrknQ8=
X-Gm-Gg: AYBFou00BQNVP9r51eN3GUBLU2xzZA6FEoKyvbwerYkVI9Nc3OexWYzOjWH2OFuTt7x
	pcsOjt8FA0ApL3QExuvpXn4IjQmwh32Cr9Fp7CE3N/pmegAXJTjuGKnJ1+2ehOKALko2kta34Pc
	PqMRLKdHHrIZ7POP1xVh3boS5NQXyEgM9ZcMSY4dQPqFp0wYRstPFlg/yIZgrkqT1JY7gRV7Ahq
	4khqIXQSTdnqWX//99eqFEFtyM02xTnB5bHihkyDw2zlf30PU/Dm+Hgi2g5frBYsDwh3ZwCOk8y
	v9Xfa17EGmKFfCtBeOjpT5pvrkn6gSv90GQYRxQQqj9OEbU1JQfpdqmt9pvB5KG8Hg80ex419x1
	ReFdqaKN+SuCfT5ArAkbhmtrCiZ2V54DlUPdmwiB3amem2FsYafgEHtyPwkvV3itUNkU9qAtVRW
	ZaZoFMmRegBYkjGcUzNM1YKuadMJcQNHiNIFIl/byQR+R5aphBh8amt0S377gVrqcVPg5tGjXCa
	CBD1nECRQ7aBZlUnCPaAgn3PLJ72I+vod8V5lyyi+CZdNudIPb8LjX/DAusvBSKVrGQXrJus64e
	xOsazYADI2334AvfU5y8tcwTG2ro041+SnfbZGdtVh4zl41ZwPiFQeAsZRlEOog=
X-Received: by 2002:a05:6a21:e58b:b0:3fa:6e4a:a31b with SMTP id adf61e73a8af0-3fa6e5a0f03mr133064637.51.1794683012354;
        Sat, 14 Nov 2026 11:03:32 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8114sm2288758b3a.12.2026.11.14.11.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:03:31 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
	Ross Burton <ross.burton@arm.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] python3-pygobject: add ptest support
Date: Sat, 14 Nov 2026 19:03:30 +0000
Message-ID: <20261114190330.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 19:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250207
Content-Type: text/plain; charset="utf-8"

Run the upstream pytest suite under ptest. The test libraries and
typelibs come from the gobject-introspection-tests subproject that
pygobject bundles, built through the 'tests' PACKAGECONFIG when ptest
is enabled.

Tested on qemux86-64 with ptest-runner: 1442 pass, 184 skip, 7 xfail,
0 fail. Most skips are Gtk, Gdk and Pango tests; those are not in the
image.

[YOCTO #15565]

AI-Generated: Uses Claude (claude-fable-5-2)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-pygobject/run-ptest        |  8 ++++++
 .../python/python3-pygobject_3.58.1.bb        | 27 ++++++++++++++++---
 3 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100755 meta/recipes-devtools/python/python3-pygobject/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index bef45bb4d5..77e03b33b1 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -93,6 +93,7 @@ PTESTS_FAST = "\
     python3-pluggy \
     python3-pefile \
     python3-pyasn1 \
+    python3-pygobject \
     python3-pyopenssl \
     python3-pyyaml \
     python3-rpds-py \
diff --git a/meta/recipes-devtools/python/python3-pygobject/run-ptest b/meta/recipes-devtools/python/python3-pygobject/run-ptest
new file mode 100755
index 0000000000..47fab21c9c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pygobject/run-ptest
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+export LD_LIBRARY_PATH=$PWD/../gi-tests
+export GI_TYPELIB_PATH=$PWD/../gi-tests
+export GSETTINGS_SCHEMA_DIR=$PWD/tests
+export GSETTINGS_BACKEND=memory
+
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.58.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.58.1.bb
index 82089c2ad7..069a313735 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.58.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.58.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=91db794c3adc9d824d4eddabb341e816"
 
 GIR_MESON_OPTION = ""
 
-inherit gnomebase setuptools3-base gobject-introspection upstream-version-is-even
+inherit gnomebase setuptools3-base gobject-introspection upstream-version-is-even ptest-python-pytest
 
 python() {
     if d.getVar('CLASSOVERRIDE') == "class-target" and not bb.utils.to_boolean(d.getVar("GI_DATA_ENABLED")):
@@ -19,11 +19,13 @@ DEPENDS += "python3 glib-2.0"
 GNOME_COMPRESS_TYPE = "gz"
 GNOMEBN = "pygobject"
 
+SRC_URI += "file://run-ptest"
 SRC_URI[archive.sha256sum] = "4c80598ade17fbaa7798e01a25d0bf29ce109740786026a074c5c62bb3e79d23"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wayland', 'x11' ], 'cairo', '', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wayland', 'x11' ], 'cairo', '', d)} \
+                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
@@ -35,7 +37,26 @@ RDEPENDS:${PN} += " \
 # python3-pycairo is checked on configuration -> DEPENDS
 # we don't link against python3-pycairo -> RDEPENDS
 PACKAGECONFIG[cairo] = "-Dpycairo=enabled,-Dpycairo=disabled, cairo python3-pycairo, python3-pycairo"
-PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,"
+# do_install_ptest_base cleans PTEST_PATH, so the test libraries go next to it
+PACKAGECONFIG[tests] = "-Dtests=true -Dgobject-introspection-tests:install_dir=${libdir}/${BPN}/gi-tests,-Dtests=false,"
+
+do_install_ptest:append() {
+    rm -f ${D}${PTEST_PATH}/tests/*.c ${D}${PTEST_PATH}/tests/*.h ${D}${PTEST_PATH}/tests/meson.build
+    install -m 0644 ${S}/pyproject.toml ${D}${PTEST_PATH}/
+    install -m 0644 ${B}/tests/gschemas.compiled ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/testhelper*.so ${D}${PTEST_PATH}/tests/
+}
+
+FILES:${PN}-ptest += "${libdir}/${BPN}/gi-tests"
+
+RDEPENDS:${PN}-ptest += " \
+    bash \
+    python3-ctypes \
+    python3-misc \
+    python3-pickle \
+    python3-unittest \
+"
+RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-iso8859-1"
 
 BBCLASSEXTEND = "native"
 PACKAGECONFIG:class-native = ""
-- 
2.43.0

