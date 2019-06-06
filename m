Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7D17D7E07D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 18:44:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45KZMK0pBMz3L
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 20:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559846669;
	bh=3LoD4vpXqFrTMOcrdpU9bULEa5Oamsp6rT4bD7EtMNw=;
	h=From:To:Subject:Date:From;
	b=IV5336tpJfjl0VVjcI2OY2nVxYjUQm46ysvqTSBGtNl3vK0UdkhFehDA/CyLZ8VLn
	MAWZiyJ7nUw0egcli/TgNWIKu3kE1CI9C5mzeaO1ZBPlzj6JbXjbVsoOU1qNTDcQg+
	uhEVaT3uWpCEU3v+isZNiA++kyywACanxNKump+0J/Dip9tYStQl0ST++QXqcSUnQY
	BfwmjMJsX/eYl1/tu4L39cuUtbWkZfwp1TsNhkE5TsdxSDF5kM17ref8Y4oM/F7die
	ZcWOUe7c6/LWTdIGtjygbFXEymvQ8O4EmeHMZ5Sx0fYQDsBIKKoicKZ9GUhJ7g6ny5
	mF0vCWli/58JnUJ5aqKBsCQL1TZPArUqshe1E0YhxweyYCtuZ6CblR0LEgERV/lIzK
	+xgqGrIUNQdZTUF1CUYxjbe9PIRDJxAiIXEFHFwDsr4joQPca3N2UW8PYrJqVGcuJg
	sMUPLUGtNSFqYydYBKe/4idHYd81YW+ICW9Fm+xVOwpJtdf3A2dKL0Iy+Y7/3LEVY9
	qPeJvDRPDIuGa0fs3bd1LAcv32lR4uzUNUZLRNpifSo3i1ZVwnCMewZuXzaVhmDTPR
	wEoUxaGRnSzZ/L/cndLKc305bcIW1YPQs31qI4zdnbWw2WzFvYRJqjQEpT8jtSFiaF
	JVlQUc3uB948Ubhlj5IA+ct4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2019 21:44:28 +0300
Message-Id: <20190606184428.2325-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] Remove manual RDEPENDS from PN-ptest to PN package
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
X-List-Received-Date: Thu, 06 Jun 2019 18:44:28 -0000

They are now added automatically by the ptest class.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
v2: elfutils RDEPENDS_${PN}-ptest fixed
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb | 2 +-
 meta/recipes-devtools/elfutils/elfutils_0.176.bb    | 2 +-
 meta/recipes-extended/sed/sed_4.2.2.bb              | 2 +-
 meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
index 54b135eaef..ed946159bd 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
@@ -113,7 +113,7 @@ ALTERNATIVE_LINK_NAME[mkfs.ext2] = "${base_sbindir}/mkfs.ext2"
 ALTERNATIVE_${PN}-tune2fs = "tune2fs"
 ALTERNATIVE_LINK_NAME[tune2fs] = "${base_sbindir}/tune2fs"
 
-RDEPENDS_${PN}-ptest += "${PN} coreutils procps bash bzip2 diffutils perl sed"
+RDEPENDS_${PN}-ptest += "coreutils procps bash bzip2 diffutils perl sed"
 RDEPENDS_${PN}-ptest += "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks e2fsprogs-resize2fs"
 
 do_compile_ptest() {
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
index 1a5c70b088..5b8049f531 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
@@ -44,7 +44,7 @@ inherit autotools gettext ptest
 
 EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
 EXTRA_OECONF_append_class-native = " --without-bzlib"
-RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils ${PN}"
+RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"
 
 EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
 
diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
index f10e365ea4..8e436bad80 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb
@@ -15,7 +15,7 @@ SRC_URI[md5sum] = "4111de4faa3b9848a0686b2f260c5056"
 SRC_URI[sha256sum] = "fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff"
 
 inherit autotools texinfo update-alternatives gettext ptest
-RDEPENDS_${PN}-ptest += "make ${PN}"
+RDEPENDS_${PN}-ptest += "make"
 RRECOMMENDS_${PN}-ptest_append_libc-glibc = " locale-base-ru-ru"
 
 EXTRA_OECONF = "--disable-acl \
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
index 7e80bb45d1..9583ee3abb 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 
 DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
-RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules"
+RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"
 # babelstats.pl wants getopt-long
-- 
2.17.1


