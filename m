Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 187216D409
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 12:25:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g135so8287857wme.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2019 05:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=8vOxOZme2sbtjwaBp5jnG4KtUifRq8UFXnvGnb4nTZo=;
	b=cGIZ8PhqFqUVFXpoS41mxB0C9vog4R/eI5W2LZIVcS9uIGBvHYKp1kbTz+6EYbuucw
	Eap1yY5QtHjKoPXxba/jkcPQzsQ/X/F9ZezwnrmwsHHl4PjAOfd3XSduUE4vCNe9A9Sw
	UuwKgAjxEQ0OjDfR+jJyT6ChV1GL668g/m/HLO6v2rt/TgsCXz+uzJems2Q2ZjSYF/6g
	x/iVZsJ19Msu5sY91Ba3yHLZBa7GNtzDjoJYcYSws9c7TfHtxGTa2vT/UzqlcuL7HSlJ
	/Py6HOD5ya2i78k2g4J7buYBYu9POBXvSlhd2tFJ9l6YIl6INDc1+fmv7tRZ1s6IGhRo
	vShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8vOxOZme2sbtjwaBp5jnG4KtUifRq8UFXnvGnb4nTZo=;
	b=oTKzZfaEIjaMIBIrMpRyiF3u2AHiQBRiUv0g8lq6PpgyctPQZ5829XZhgHXDKA+uBt
	fGWG3M6lOjWTPcg3C8KDPCfZ7bDl7U9vzldrx7rJqAOBn+DdD8GRWVRFzerXmXZycOpQ
	QRX0NNdVfeDbn/L5Wl9c79noLfjIODbX692u5RLf1ADXRLzEdPmbFrwVyQ4/aGYkJgqT
	CUa2/jGZbQI9IJ6UDZemTEkpS4OvvfcRzjjG4/i7rEoChI/j71LjOaI2L9AKCv2oA/x5
	C7LfsMbtOFg+wwRKjn0/4d379KIwCtUb9UxblsvGF42wazrhXpMJ7UrjBTXjd2gLKSt9
	nzqA==
X-Gm-Message-State: APjAAAWSskBG4XE3sal7PnTcoRwQU+Ntv0obYynqftm6Grc8bZHxAJzQ
	i5VtsRB27QIPtrCjTNN2fJ1j34C5RRw=
X-Google-Smtp-Source: APXvYqzqQvPfxQx0envba0KAqnBAa82ihMjoVa/MHYLgk7HKCDo+sXiffF8x3w5Tz5d9VhERK4xdiA==
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr12956692wmj.94.1560169553335; 
	Mon, 10 Jun 2019 05:25:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	p3sm11795882wrd.47.2019.06.10.05.25.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jun 2019 05:25:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2019 13:25:48 +0100
Message-Id: <20190610122549.2144-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] efivar: add
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jun 2019 12:25:53 -0000

This was in meta-oe but EFI is sufficiently wide spread now that we need it in
core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../efivar/0001-efivar-fix-for-cross-compile.patch | 32 ++++++++++++++++
 .../0004-fix-unknow-option-for-gold-linker.patch   | 35 ++++++++++++++++++
 .../allow-multi-definitions-for-native.patch       | 36 ++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_37.bb               | 43 ++++++++++++++++++++++
 4 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar_37.bb

diff --git a/meta/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch b/meta/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
new file mode 100644
index 00000000000..251e50c902c
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0001-efivar-fix-for-cross-compile.patch
@@ -0,0 +1,32 @@
+From a9115d9e6f0f62d6bb735ce3698858d1f89f8d73 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 25 Sep 2015 18:14:31 +0800
+Subject: [PATCH] efivar: fix for cross compile
+
+It builds and calls elf file makeguids to generate a header file which
+doesn't work for cross compile. Fix it.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Upstream-Status: Pending
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ src/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 0c16597..dcc7fc8 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -40,8 +40,8 @@ abicheck : $(patsubst %.so,%.abicheck,$(LIBTARGETS))
+ ./guid-symbols.c : include/efivar/efivar-guids.h
+ ./guids.bin : include/efivar/efivar-guids.h
+ ./names.bin : include/efivar/efivar-guids.h
+-include/efivar/efivar-guids.h : makeguids guids.txt
+-	./makeguids guids.txt guids.bin names.bin \
++include/efivar/efivar-guids.h : guids.txt
++	makeguids guids.txt guids.bin names.bin \
+ 		guid-symbols.c include/efivar/efivar-guids.h
+ 
+ makeguids : CPPFLAGS+=-DEFIVAR_BUILD_ENVIRONMENT
diff --git a/meta/recipes-bsp/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch b/meta/recipes-bsp/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
new file mode 100644
index 00000000000..96d0c6b3b28
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
@@ -0,0 +1,35 @@
+From b3d35e7dd27a755df5acbe050837885914dbb28b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 10 May 2016 11:34:50 -0400
+Subject: [PATCH]  fix unknow option for gold linker
+
+- Revert the following patch, since oe-core work with gcc 5
+...
+commit 3055a3797f16693dfdd855fa68bc57fd900dc408
+Author: Peter Jones <pjones@redhat.com>
+Date:   Mon Feb 15 14:15:40 2016 -0500
+
+    Make gcc.specs work with gcc 6 / binutils 2.26
+
+    Apparently binutils 2.26 gets real picky about "ld -PIC" vs "ld -fPIC".
+
+    Signed-off-by: Peter Jones <pjones@redhat.com>
+...
+
+- Remove unknown option '--add-needed'
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ gcc.specs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: git/gcc.specs
+===================================================================
+--- git.orig/gcc.specs
++++ git/gcc.specs
+@@ -14,4 +14,4 @@
+ + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now}
+ 
+ *link:
+-+ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined --add-needed -z now --build-id %{!static:%{!shared:-pie}} %{shared:-z relro} %{static:%<pie}
+++ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined -z now --build-id %{!static:%{!shared:-pie}} %{shared:-z relro} %{static:%<pie}
diff --git a/meta/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch b/meta/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
new file mode 100644
index 00000000000..043b07a655c
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/allow-multi-definitions-for-native.patch
@@ -0,0 +1,36 @@
+From c10368b397483a2fc7b493c099d8416d902f8cd8 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 31 Jul 2018 14:18:35 +0800
+Subject: [PATCH] allow multi definitions for native
+
+Upstream-Status: Pending
+
+It fails to create .so file when build efivar-native:
+
+| lib.o:(*IND*+0x0): multiple definition of `efi_set_variable'
+| lib.o:lib.c:(.text+0xa0): first defined here
+
+Add link option '-z muldefs' to fix it.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Make.rules | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Make.rules b/Make.rules
+index 042585b..257ba45 100644
+--- a/Make.rules
++++ b/Make.rules
+@@ -20,6 +20,7 @@ include $(TOPDIR)/Make.version
+ 	$(CCLD) $(ccldflags) $(CPPFLAGS) $(SOFLAGS) \
+ 	  -Wl,-soname,$@.1 \
+ 	  -Wl,--version-script=$(MAP) \
++	  -Wl,-z,muldefs \
+ 	  -o $@ $^ $(LDLIBS)
+ 	ln -vfs $@ $@.1
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-bsp/efivar/efivar_37.bb b/meta/recipes-bsp/efivar/efivar_37.bb
new file mode 100644
index 00000000000..4b458dedd50
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar_37.bb
@@ -0,0 +1,43 @@
+SUMMARY = "Tools to manipulate UEFI variables"
+DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
+HOMEPAGE = "https://github.com/rhinstaller/efivar"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
+
+DEPENDS = "popt"
+DEPENDS_append_class-target = " efivar-native"
+
+inherit pkgconfig
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
+SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
+SRC_URI = "git://github.com/rhinstaller/efivar.git \
+           file://allow-multi-definitions-for-native.patch \
+           "
+SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
+                                ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'file://0004-fix-unknow-option-for-gold-linker.patch', '', d)} \
+                              "
+
+S = "${WORKDIR}/git"
+
+do_compile_prepend() {
+    sed -i -e s:-Werror::g ${S}/gcc.specs
+}
+
+do_compile_class-native() {
+    oe_runmake -C src makeguids CC_FOR_BUILD="${BUILD_CC}"
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+do_install_class-native() {
+    install -D -m 0755 ${B}/src/makeguids ${D}${bindir}/makeguids
+}
+
+BBCLASSEXTEND = "native"
+
+RRECOMMENDS_${PN}_class-target = "kernel-module-efivarfs"
-- 
2.11.0


