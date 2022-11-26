Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2E3C4167B
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:15:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.70819.1669472114167656773
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=B2MYmN5m;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id p12so6307737plq.4
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTb7plS9/SnX28edIHxynh12BSJ1nEG+C1EHUU0FbcU=;
        b=B2MYmN5m316vto3IWTnt7yB4uPJwyhq3sADw1yzGAXhcP2ylNcQHUy1vY+K2yBhXi/
         h5tvguRl05svdjigZK3i+3M2JPsF0OOzo78XQ5EGg37uwVdAmxe4aZztnHA21XV65Bz4
         JroI2n2lx/IsuogFklNO12m81Z2pgFd+E1exbt7lp8cHUdSpT3pf3PdAaTo03QOTfzLN
         3frbOdhXHuAWf9V2GStuYRU9wk4GWzNCqFdR9so3k2VgOia6eqfAKXg9b36PisxdbuIf
         ZosH9Pfq5RTJ7xR2XK4np64EaqeTxpG9E2nxDBQHZpe9g2vnLr9ohC6hBgJrJPcyC2Ut
         pRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTb7plS9/SnX28edIHxynh12BSJ1nEG+C1EHUU0FbcU=;
        b=Pa+ZpB7WGEsI97h4T/Rsx5+zmqMe7odamaI7KhO/4YVKJ9RL9dBI8gorJwsQb7nJgb
         0plJSh6PKL/hop1nkwQJ3saDF+ti+uN+bg7qJi6A9GOnD9dsRitFG3HpQEUETBZOLE6l
         yzzEV1v0HkfZDM7x8sINXNwRmfaHOGIj4qwJSCJLTJ5UDSXR1UK5WBpvemmKd4kSwWPJ
         4Pw9NPO6Gupyc5UBmDuNXde8fzlbFpS/cwYTkKxzbS3lNiPTK8PJ1U/eQwph6ryQ3meA
         vr+xwoGPMjUqmiPKP373lgs5sesMf4s/LM84UbqAD7auK3DAJQd6u4/Lo4FJuSG4fAe7
         K+mw==
X-Gm-Message-State: ANoB5pnXYIIrHLcu/ekAtUM4fTS9AN5MAbIOJasfyfDl5/GILPWgcCDW
	zXyNyuVX9SH3ilNfIci2W3jUulkeuKIhxBdS4X0=
X-Google-Smtp-Source: AA0mqf6yMYLTsrtwlOT6nju5bLFj3ZKxRi+BmRltN982ypbhbaRNEv+Mb3yq+lKbmB0PzBB6QRIpKQ==
X-Received: by 2002:a17:90b:1d45:b0:218:6db5:fd98 with SMTP id ok5-20020a17090b1d4500b002186db5fd98mr47019957pjb.164.1669472113117;
        Sat, 26 Nov 2022 06:15:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.15.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:15:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/37] selftest: add a copy of previous mtd-utils version to meta-selftest
Date: Sat, 26 Nov 2022 04:14:12 -1000
Message-Id: <fd70a508b75d403822448907033ed6f655fcbe9b.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173801

From: Alexander Kanavin <alex.kanavin@gmail.com>

The latest version update eliminated all custom patches, and the selftest
expects them.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 95298a7f1ad29c0fc0d02772d646116709ac355f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...used-linux-fs.h-header-from-includes.patch | 31 ++++++++
 .../mtd/mtd-utils-selftest_git.bb             | 77 +++++++++++++++++++
 meta/lib/oeqa/selftest/cases/devtool.py       |  4 +-
 3 files changed, 110 insertions(+), 2 deletions(-)
 create mode 100644 meta-selftest/recipes-devtools/mtd/mtd-utils-selftest/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
 create mode 100644 meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb

diff --git a/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
new file mode 100644
index 0000000000..73d4a8475f
--- /dev/null
+++ b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
@@ -0,0 +1,31 @@
+From 6fb10bd18488ed84776675bc1b2982800a51d839 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2022 20:14:38 -0700
+Subject: [mtd-utils][PATCH] tests: Remove unused linux/fs.h header from includes
+
+This header is not needed, moreover it includes linux/mount.h which is
+now in conflict[1] with glibc provided sys/mount.h from glibc 2.36 onwards
+
+[1] https://sourceware.org/glibc/wiki/Release/2.36
+
+Upstream-Status: Submitted [https://lists.infradead.org/pipermail/linux-mtd/2022-August/094667.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/fs-tests/lib/tests.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tests/fs-tests/lib/tests.c b/tests/fs-tests/lib/tests.c
+index d1a2e0c..3db0426 100644
+--- a/tests/fs-tests/lib/tests.c
++++ b/tests/fs-tests/lib/tests.c
+@@ -35,7 +35,6 @@
+ #include <sys/vfs.h>
+ #include <sys/mount.h>
+ #include <sys/statvfs.h>
+-#include <linux/fs.h>
+ #include <linux/jffs2.h>
+ 
+ #include "tests.h"
+-- 
+2.37.1
+
diff --git a/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
new file mode 100644
index 0000000000..ca2141c972
--- /dev/null
+++ b/meta-selftest/recipes-devtools/mtd/mtd-utils-selftest_git.bb
@@ -0,0 +1,77 @@
+SUMMARY = "Tools for managing memory technology devices"
+HOMEPAGE = "http://www.linux-mtd.infradead.org/"
+DESCRIPTION = "mtd-utils tool is a generic Linux subsystem for memory devices, especially Flash devices."
+SECTION = "base"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
+
+inherit autotools pkgconfig update-alternatives
+
+DEPENDS = "zlib e2fsprogs util-linux"
+RDEPENDS:mtd-utils-tests += "bash"
+
+PV = "2.1.4"
+
+SRCREV = "c7f1bfa44a84d02061787e2f6093df5cc40b9f5c"
+SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
+           file://0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch \
+           "
+
+S = "${WORKDIR}/git"
+
+# xattr support creates an additional compile-time dependency on acl because
+# the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
+# regardless whether acl is enabled or disabled in the distro should be okay.
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)} lzo jffs ubifs"
+PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
+PACKAGECONFIG[xattr] = "--with-xattr,--without-xattr,acl"
+PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,openssl"
+PACKAGECONFIG[jffs] = "--with-jffs,--without-jffs"
+PACKAGECONFIG[ubifs] = "--with-ubifs,--without-ubifs"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
+
+CPPFLAGS:append:riscv64  = " -pthread -D_REENTRANT"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
+
+# Use higher priority than corresponding BusyBox-provided applets
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE:${PN} = "flashcp flash_eraseall flash_lock flash_unlock nanddump nandwrite"
+ALTERNATIVE:${PN}-ubifs = "ubiattach ubidetach ubimkvol ubirename ubirmvol ubirsvol ubiupdatevol"
+
+ALTERNATIVE_LINK_NAME[nandwrite] = "${sbindir}/nandwrite"
+ALTERNATIVE_LINK_NAME[nanddump] = "${sbindir}/nanddump"
+ALTERNATIVE_LINK_NAME[ubiattach] = "${sbindir}/ubiattach"
+ALTERNATIVE_LINK_NAME[ubidetach] = "${sbindir}/ubidetach"
+ALTERNATIVE_LINK_NAME[ubimkvol] = "${sbindir}/ubimkvol"
+ALTERNATIVE_LINK_NAME[ubirename] = "${sbindir}/ubirename"
+ALTERNATIVE_LINK_NAME[ubirmvol] = "${sbindir}/ubirmvol"
+ALTERNATIVE_LINK_NAME[ubirsvol] = "${sbindir}/ubirsvol"
+ALTERNATIVE_LINK_NAME[ubiupdatevol] = "${sbindir}/ubiupdatevol"
+ALTERNATIVE_LINK_NAME[flash_eraseall] = "${sbindir}/flash_eraseall"
+ALTERNATIVE_LINK_NAME[flash_lock] = "${sbindir}/flash_lock"
+ALTERNATIVE_LINK_NAME[flash_unlock] = "${sbindir}/flash_unlock"
+ALTERNATIVE_LINK_NAME[flashcp] = "${sbindir}/flashcp"
+
+do_install () {
+	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
+}
+
+PACKAGES =+ "mtd-utils-misc mtd-utils-tests"
+PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "jffs", "mtd-utils-jffs2", "", d)}"
+PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "ubifs", "mtd-utils-ubifs", "", d)}"
+
+FILES:mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
+FILES:mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
+FILES:mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
+FILES:mtd-utils-tests = "${libexecdir}/mtd-utils/*"
+
+BBCLASSEXTEND = "native nativesdk"
+
+# git/.compr.c.dep:46: warning: NUL character seen; rest of line ignored
+# git/.compr.c.dep:47: *** missing separator.  Stop.
+PARALLEL_MAKE = ""
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 142932e12f..0cb7403f16 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -954,7 +954,7 @@ class DevtoolUpdateTests(DevtoolBase):
 
     def test_devtool_update_recipe_git(self):
         # Check preconditions
-        testrecipe = 'mtd-utils'
+        testrecipe = 'mtd-utils-selftest'
         bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
@@ -1075,7 +1075,7 @@ class DevtoolUpdateTests(DevtoolBase):
 
     def test_devtool_update_recipe_append_git(self):
         # Check preconditions
-        testrecipe = 'mtd-utils'
+        testrecipe = 'mtd-utils-selftest'
         bb_vars = get_bb_vars(['FILE', 'SRC_URI'], testrecipe)
         recipefile = bb_vars['FILE']
         src_uri = bb_vars['SRC_URI']
-- 
2.25.1


