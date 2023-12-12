Return-Path: <zangruochen@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C27C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 01:38:23 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.2334.1702345101005811009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 17:38:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zangruochen@loongson.cn)
Received: from loongson.cn (unknown [112.81.42.105])
	by gateway (Coremail) with SMTP id _____8Cx+uiCuXdluzgAAA--.1398S3;
	Tue, 12 Dec 2023 09:38:11 +0800 (CST)
Received: from ubuntu.localdomain (unknown [112.81.42.105])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Axv+F6uXdlCwAAAA--.1S2;
	Tue, 12 Dec 2023 09:38:03 +0800 (CST)
From: zangruochen@loongson.cn
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v3] elfutils: upgrade 0.189 -> 0.190
Date: Mon, 11 Dec 2023 17:38:01 -0800
Message-Id: <20231212013801.3632055-1-zangruochen@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Axv+F6uXdlCwAAAA--.1S2
X-CM-SenderInfo: p2dqw2xxrfxv3q6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxKr4fZFWfKry7JF4DKF1xJFc_yoWxuryrpF
	ZxCFyfGw4UJa1Iqr97CF1rXw4IqanFva45XFy8GFWj9rWUZw15Wr43tFy2qFWqq34DuFWU
	ZrWDGFy5tw4DuagCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4kE6xkIj40Ew7
	xC0wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jr0_JrylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j9aPUUUUU=
	=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 01:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192187

From: Zang Ruochen <zangruochen@loongson.cn>

The following patches have been fixed:
0001-libasm-may-link-with-libbz2-if-found.patch

Refresh the following patch:
0001-dso-link-change.patch

Add srcfiles to TESTFILES because ptest needs it.

NEWS:
libelf: Add RELR support.
libdw: Recognize .debug_[ct]u_index sections
readelf: Support readelf -Ds, --use-dynamic --symbol.
         Support .gdb_index version 9
scrlines: New tool that compiles a list of source files associated
          with a specified dwarf/elf file.
debuginfod: Schema change (reindexing required, sorry!) for a 60%
            compression in filename representation, which was a large
            part of the sqlite index; also, more deliberate sqlite
            -wal management during scanning using the
            --scan-checkpoint option.
backends: Various LoongArch updates.

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 .../{elfutils_0.189.bb => elfutils_0.190.bb}  |  5 ++-
 .../elfutils/files/0001-dso-link-change.patch | 14 ++++----
 ...libasm-may-link-with-libbz2-if-found.patch | 36 -------------------
 3 files changed, 10 insertions(+), 45 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.189.bb => elfutils_0.190.bb} (97%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.190.bb
similarity index 97%
rename from meta/recipes-devtools/elfutils/elfutils_0.189.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.190.bb
index d69828131e..0bd96c1e0f 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.190.bb
@@ -16,7 +16,6 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
            file://0003-fixheadercheck.patch \
            file://0006-Fix-build-on-aarch64-musl.patch \
-           file://0001-libasm-may-link-with-libbz2-if-found.patch \
            file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
            file://0001-skip-the-test-when-gcc-not-deployed.patch \
            file://ptest.patch \
@@ -25,7 +24,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            "
-SRC_URI[sha256sum] = "39bd8f1a338e2b7cd4abc3ff11a0eddc6e690f69578a57478d8179b4148708c8"
+SRC_URI[sha256sum] = "8e00a3a9b5f04bc1dc273ae86281d2d26ed412020b391ffcc23198f10231d692"
 
 inherit autotools gettext ptest pkgconfig
 
@@ -67,7 +66,7 @@ PTEST_PARALLEL_MAKE = ""
 do_install_ptest() {
 	if [ ${PTEST_ENABLED} = "1" ]; then
 		# copy the files which needed by the cases
-		TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint elfcompress elfclassify stack unstrip"
+		TEST_FILES="strip strip.o addr2line elfcmp objdump readelf size.o nm.o nm elflint elfcompress elfclassify stack unstrip srcfiles"
 		install -d -m 755                       ${D}${PTEST_PATH}/src
 		install -d -m 755                       ${D}${PTEST_PATH}/lib
 		install -d -m 755                       ${D}${PTEST_PATH}/libelf
diff --git a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
index 6acc036406..8ccfcb7bd5 100644
--- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
@@ -16,18 +16,18 @@ more details.
 Rebase to 0.170
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
+Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
 ---
  src/Makefile.am   | 2 +-
  tests/Makefile.am | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 88d0ac8..c28d81f 100644
+index d3d9d40..ea61616 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -45,7 +45,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz
+ libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
  else
  libasm = ../libasm/libasm.so
 -libdw = ../libdw/libdw.so
@@ -36,11 +36,11 @@ index 88d0ac8..c28d81f 100644
  endif
  libebl = ../libebl/libebl.a ../backends/libebl_backends.a ../libcpu/libcpu.a
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index c145720..72afd0e 100644
+index 7fb8efb..71c1a61 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -554,7 +554,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz
+@@ -680,7 +680,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
+ libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
  libasm = ../libasm/libasm.a
  else
 -libdw = ../libdw/libdw.so
@@ -48,3 +48,5 @@ index c145720..72afd0e 100644
  libelf = ../libelf/libelf.so
  libasm = ../libasm/libasm.so
  endif
+--
+2.25.1
diff --git a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
deleted file mode 100644
index 09c9d3ea24..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ed1975deeaa47f98d212fd144c8bda075b1a5d36 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 4 Oct 2017 22:30:46 -0700
-Subject: [PATCH] libasm may link with libbz2 if found
-
-This can fail to link binaries like objdump
-where indirect libraries may be not found by linker
-
-| /mnt/a/oe/build/tmp/work/riscv64-bec-linux/elfutils/0.170-r0/recipe-sysroot/usr/lib/libbz2.so.1: error adding symbols: DSO missing from command line
-| collect2: error: ld returned 1 exit status
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- src/Makefile.am | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index c28d81f..951e978 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -40,11 +40,11 @@ EXTRA_DIST += make-debug-archive.in
- CLEANFILES += make-debug-archive
- 
- if BUILD_STATIC
--libasm = ../libasm/libasm.a
-+libasm = ../libasm/libasm.a $(zip_LIBS)
- libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz
- else
--libasm = ../libasm/libasm.so
-+libasm = ../libasm/libasm.so $(zip_LIBS)
- libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
- libelf = ../libelf/libelf.so
- endif
-- 
2.25.1


