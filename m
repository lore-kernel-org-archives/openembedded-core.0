Return-Path: <zangruochen@loongson.cn>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D17C61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:59:47 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by mx.groups.io with SMTP id smtpd.web10.15888.1700647181613593958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:59:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: loongson.cn, ip: 114.242.206.163, mailfrom: zangruochen@loongson.cn)
Received: from loongson.cn (unknown [153.35.147.217])
	by gateway (Coremail) with SMTP id _____8BxbOoH0V1l_+U7AA--.25519S3;
	Wed, 22 Nov 2023 17:59:35 +0800 (CST)
Received: from ubuntu.localdomain (unknown [153.35.147.217])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxO9wE0V1lVGVJAA--.30011S2;
	Wed, 22 Nov 2023 17:59:32 +0800 (CST)
From: zangruochen@loongson.cn
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] elfutils: upgrade 0.189 -> 0.190
Date: Wed, 22 Nov 2023 01:59:31 -0800
Message-Id: <20231122095931.1866607-1-zangruochen@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxO9wE0V1lVGVJAA--.30011S2
X-CM-SenderInfo: p2dqw2xxrfxv3q6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3WFy3ZryDGw45CFy8GFyUurX_yoWxGr1rpF
	ZakFyfGw48Ja1Iqr97CF1rXw40qa9Fvas8XFyxCrWj9rWUZw15Wr43tFyIqFZ8XFyDuFW8
	ZrWkGFy5tw4DuagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lw4CEc2x0rV
	AKj4xxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUJVWUXwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUFGYLDUUU
	U
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191048

From: Zang Ruochen <zangruochen@loongson.cn>

The following patches have been fixed:
0001-libasm-may-link-with-libbz2-if-found.patch

Refresh the following patch:
0001-dso-link-change.patch

Signed-off-by: Zang Ruochen <zangruochen@loongson.cn>
---
 .../{elfutils_0.189.bb => elfutils_0.190.bb}  |  3 +-
 .../elfutils/files/0001-dso-link-change.patch | 21 ++++++-----
 ...libasm-may-link-with-libbz2-if-found.patch | 36 -------------------
 3 files changed, 13 insertions(+), 47 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.189.bb => elfutils_0.190.bb} (98%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.190.bb
similarity index 98%
rename from meta/recipes-devtools/elfutils/elfutils_0.189.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.190.bb
index d8bf82b022..8657080830 100644
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
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
index 6acc036406..b719efdf32 100644
--- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
@@ -1,6 +1,6 @@
-From c5fb59ac0819b5b6d8244c613cbcf92cb09840c1 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 15 Aug 2017 17:10:57 +0800
+From a54d70478157f3528c2ed73afd57020b59571fc7 Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangruochen@loongson.cn>
+Date: Wed, 22 Nov 2023 00:52:53 -0800
 Subject: [PATCH] dso link change
 
 Upstream-Status: Pending
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
@@ -48,3 +48,6 @@ index c145720..72afd0e 100644
  libelf = ../libelf/libelf.so
  libasm = ../libasm/libasm.so
  endif
+-- 
+2.25.1
+
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


