Return-Path: <max.eliaser@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9B23D65D7F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 20:12:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 May 2014 12:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,966,1389772800"; d="scan'208";a="504543094"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.155])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2014 13:02:06 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 May 2014 13:00:28 -0700
Message-Id: <6177a117981e4bb67a4a74a992bc407a5665b1bf.1398973767.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1398973767.git.max.eliaser@intel.com>
References: <cover.1398973767.git.max.eliaser@intel.com>
In-Reply-To: <cover.1398973767.git.max.eliaser@intel.com>
References: <cover.1398973767.git.max.eliaser@intel.com>
Subject: [PATCH 1/1] Add texinfo.bbclass; recipes that use texinfo utils at build-time inherit it.
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
X-List-Received-Date: Thu, 01 May 2014 20:12:15 -0000

The class itself currently does nothing. The idea is to mark all recipes that
make use of the texinfo utilities. In the future, this class could be used to
suppress the generation/formatting of documentation for performance,
explicitly track dependencies on these utilities, and eliminate Yocto's
current dependency on the host system's texinfo utilities.

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 meta/classes/texinfo.bbclass                            | 2 ++
 meta/recipes-bsp/grub/grub-efi_2.00.bb                  | 4 +---
 meta/recipes-bsp/grub/grub_0.97.bb                      | 2 +-
 meta/recipes-bsp/grub/grub_2.00.bb                      | 3 +--
 meta/recipes-bsp/grub/grub_git.bb                       | 3 +--
 meta/recipes-core/coreutils/coreutils_6.9.bb            | 2 +-
 meta/recipes-core/coreutils/coreutils_8.22.bb           | 2 +-
 meta/recipes-core/eglibc/eglibc.inc                     | 2 +-
 meta/recipes-core/gettext/gettext_0.16.1.bb             | 2 +-
 meta/recipes-core/gettext/gettext_0.18.3.2.bb           | 2 +-
 meta/recipes-core/readline/readline.inc                 | 2 +-
 meta/recipes-devtools/autoconf/autoconf.inc             | 2 +-
 meta/recipes-devtools/autogen/autogen-native_5.18.2.bb  | 2 +-
 meta/recipes-devtools/automake/automake.inc             | 2 +-
 meta/recipes-devtools/binutils/binutils.inc             | 2 +-
 meta/recipes-devtools/bison/bison_2.3.bb                | 2 +-
 meta/recipes-devtools/bison/bison_2.7.1.bb              | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc           | 2 +-
 meta/recipes-devtools/flex/flex.inc                     | 2 +-
 meta/recipes-devtools/gcc/gcc-common.inc                | 2 +-
 meta/recipes-devtools/gdb/gdb-common.inc                | 2 +-
 meta/recipes-devtools/guile/guile_2.0.9.bb              | 2 +-
 meta/recipes-devtools/libtool/libtool-2.4.2.inc         | 2 +-
 meta/recipes-devtools/m4/m4.inc                         | 2 +-
 meta/recipes-devtools/make/make.inc                     | 2 +-
 meta/recipes-devtools/mtools/mtools_3.9.9.bb            | 2 +-
 meta/recipes-devtools/mtools/mtools_4.0.18.bb           | 2 +-
 meta/recipes-extended/bash/bash.inc                     | 2 +-
 meta/recipes-extended/bc/bc_1.06.bb                     | 2 +-
 meta/recipes-extended/cpio/cpio_v2.inc                  | 2 +-
 meta/recipes-extended/diffutils/diffutils.inc           | 2 +-
 meta/recipes-extended/ed/ed_0.5.bb                      | 2 +-
 meta/recipes-extended/ed/ed_1.9.bb                      | 2 ++
 meta/recipes-extended/findutils/findutils.inc           | 2 +-
 meta/recipes-extended/gawk/gawk_3.1.5.bb                | 2 +-
 meta/recipes-extended/gawk/gawk_4.0.2.bb                | 2 +-
 meta/recipes-extended/grep/grep_2.18.bb                 | 2 +-
 meta/recipes-extended/grep/grep_2.5.1a.bb               | 2 +-
 meta/recipes-extended/groff/groff_1.18.1.4.bb           | 2 +-
 meta/recipes-extended/groff/groff_1.22.2.bb             | 2 +-
 meta/recipes-extended/gzip/gzip.inc                     | 2 +-
 meta/recipes-extended/libidn/libidn_0.6.14.bb           | 2 +-
 meta/recipes-extended/libidn/libidn_1.28.bb             | 2 +-
 meta/recipes-extended/parted/parted_3.1.bb              | 2 +-
 meta/recipes-extended/screen/screen_4.0.3.bb            | 2 +-
 meta/recipes-extended/sed/sed_4.1.2.bb                  | 2 +-
 meta/recipes-extended/sed/sed_4.2.2.bb                  | 2 +-
 meta/recipes-extended/tar/tar.inc                       | 2 +-
 meta/recipes-extended/texi2html/texi2html_5.0.bb        | 2 +-
 meta/recipes-extended/time/time.inc                     | 2 +-
 meta/recipes-extended/wget/wget.inc                     | 2 +-
 meta/recipes-extended/which/which_2.18.bb               | 2 +-
 meta/recipes-extended/which/which_2.20.bb               | 2 +-
 meta/recipes-gnome/libffi/libffi_3.0.13.bb              | 2 +-
 meta/recipes-support/aspell/aspell_0.60.6.1.bb          | 2 +-
 meta/recipes-support/gdbm/gdbm_1.11.bb                  | 2 +-
 meta/recipes-support/gdbm/gdbm_1.8.3.bb                 | 2 +-
 meta/recipes-support/gmp/gmp.inc                        | 2 +-
 meta/recipes-support/gmp/gmp_4.2.1.bb                   | 2 +-
 meta/recipes-support/gnupg/gnupg_1.4.7.bb               | 2 +-
 meta/recipes-support/gnupg/gnupg_2.0.22.bb              | 2 +-
 meta/recipes-support/gnutls/gnutls.inc                  | 2 +-
 meta/recipes-support/gnutls/libtasn1_3.4.bb             | 2 +-
 meta/recipes-support/gpgme/gpgme_1.4.3.bb               | 2 +-
 meta/recipes-support/libassuan/libassuan_2.1.1.bb       | 2 +-
 meta/recipes-support/libcheck/libcheck_0.9.12.bb        | 2 +-
 meta/recipes-support/libgcrypt/libgcrypt.inc            | 2 +-
 meta/recipes-support/libksba/libksba_1.3.0.bb           | 2 +-
 meta/recipes-support/libmpc/libmpc.inc                  | 2 +-
 meta/recipes-support/libunistring/libunistring_0.9.3.bb | 2 +-
 meta/recipes-support/mpfr/mpfr.inc                      | 2 +-
 71 files changed, 73 insertions(+), 73 deletions(-)
 create mode 100644 meta/classes/texinfo.bbclass

diff --git a/meta/classes/texinfo.bbclass b/meta/classes/texinfo.bbclass
new file mode 100644
index 0000000..60cba0f
--- /dev/null
+++ b/meta/classes/texinfo.bbclass
@@ -0,0 +1,2 @@
+# This class is inherited by recipes whose upstream packages invoke the
+# texinfo utilities at build-time. This class currently does nothing.
diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 4b43749..7b49493 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -52,9 +52,7 @@ python __anonymous () {
     d.setVar("GRUB_IMAGE", grubimage)
 }
 
-inherit autotools-brokensep
-inherit gettext
-inherit deploy
+inherit autotools-brokensep gettext texinfo deploy
 
 CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
 EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
diff --git a/meta/recipes-bsp/grub/grub_0.97.bb b/meta/recipes-bsp/grub/grub_0.97.bb
index 376244e..997a045 100644
--- a/meta/recipes-bsp/grub/grub_0.97.bb
+++ b/meta/recipes-bsp/grub/grub_0.97.bb
@@ -23,7 +23,7 @@ SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz; \
 SRC_URI[md5sum] = "cd3f3eb54446be6003156158d51f4884"
 SRC_URI[sha256sum] = "4e1d15d12dbd3e9208111d6b806ad5a9857ca8850c47877d36575b904559260b"
 
-inherit autotools
+inherit autotools texinfo
 
 COMPATIBLE_HOST = "i.86.*-linux"
 
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index c21031b..6075b20 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -33,8 +33,7 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
 FILES_${PN}-dbg += "${libdir}/${BPN}/i386-pc/.debug"
 
 
-inherit autotools
-inherit gettext
+inherit autotools gettext texinfo
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 114cf77d..7db3ffd 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -28,8 +28,7 @@ S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
 
-inherit autotools
-inherit gettext
+inherit autotools gettext texinfo
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index b924914..debd2a1 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 PR = "r5"
 DEPENDS_class-native = "gettext-native"
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 
 SRC_URI_BASE = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
            file://gnulib_m4.patch \
diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.22.bb
index 8f37814..d5373ae 100644
--- a/meta/recipes-core/coreutils/coreutils_8.22.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
 DEPENDS = "gmp libcap"
 DEPENDS_class-native = ""
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 30654f6..3a623bb 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -38,7 +38,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial linux-libc-headers
 #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES += "virtual/libintl virtual/libiconv"
-inherit autotools
+inherit autotools texinfo
 require eglibc-options.inc
 
 LEAD_SONAME = "libc.so"
diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 5725e7f..892194c 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -30,7 +30,7 @@ SRC_URI[sha256sum] = "0bf850d1a079fb5a61f0a47b1a9efd35eb44032255375e1cedb0253bc2
 
 PARALLEL_MAKE = ""
 
-inherit autotools
+inherit autotools texinfo
 
 EXTRA_OECONF += "--without-lisp --disable-csharp --disable-openmp --without-emacs"
 acpaths = '-I ${S}/autoconf-lib-link/m4/ \
diff --git a/meta/recipes-core/gettext/gettext_0.18.3.2.bb b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
index 553d522..65d4103 100644
--- a/meta/recipes-core/gettext/gettext_0.18.3.2.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
@@ -21,7 +21,7 @@ LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
 SRC_URI[md5sum] = "241aba309d07aa428252c74b40a818ef"
 SRC_URI[sha256sum] = "d1a4e452d60eb407ab0305976529a45c18124bd518d976971ac6dc7aa8b4c5d7"
 
-inherit autotools
+inherit autotools texinfo
 
 EXTRA_OECONF += "--without-lispdir \
                  --disable-csharp \
diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 6c43e2d..9d78aa9 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -18,7 +18,7 @@ SRC_URI = "${GNU_MIRROR}/readline/${BPN}-${PV}.tar.gz;name=archive \
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-inherit autotools
+inherit autotools texinfo
 
 LEAD_SONAME = "libreadline.so"
 
diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 222106a..8ed4b13 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -29,7 +29,7 @@ RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
 	   file://program_prefix.patch"
 
-inherit autotools
+inherit autotools texinfo
 
 do_configure() {
 	oe_runconf
diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
index 98bdb59..92e7099 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "cc2702dec21ba5b01144865163f6d1a54268d2b72aafc5520ad0e0cb57
 
 DEPENDS = "guile-native libtool-native libxml2-native"
 
-inherit autotools native
+inherit autotools texinfo native
 
 # autogen-native links against libguile which may have been relocated with sstate
 # these environment variables ensure there isn't a relocation issue
diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index b73cdeb..a1debd8 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -7,7 +7,7 @@ SECTION = "devel"
 
 SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.gz"
 
-inherit autotools
+inherit autotools texinfo
 
 do_configure() {
 	oe_runconf
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 5ab2b92..afb582a 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -13,7 +13,7 @@ LICENSE = "GPLv3"
 
 DEPENDS = "flex-native bison-native zlib-native gnu-config-native autoconf-native"
 
-inherit autotools gettext multilib_header
+inherit autotools gettext multilib_header texinfo
 
 FILES_${PN} = " \
 	${bindir}/${TARGET_PREFIX}* \
diff --git a/meta/recipes-devtools/bison/bison_2.3.bb b/meta/recipes-devtools/bison/bison_2.3.bb
index a135451..174916b 100644
--- a/meta/recipes-devtools/bison/bison_2.3.bb
+++ b/meta/recipes-devtools/bison/bison_2.3.bb
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "52f78aa4761a74ceb7fdf770f3554dd84308c3b93c4255e3a5c17558ec
 DEPENDS_class-native = "gettext-native"
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 acpaths = "-I ${S}/m4"
 
 do_configure_prepend () {
diff --git a/meta/recipes-devtools/bison/bison_2.7.1.bb b/meta/recipes-devtools/bison/bison_2.7.1.bb
index 1df750a..4a3ad15 100644
--- a/meta/recipes-devtools/bison/bison_2.7.1.bb
+++ b/meta/recipes-devtools/bison/bison_2.7.1.bb
@@ -28,7 +28,7 @@ LDFLAGS_prepend_libc-uclibc = " -lrt "
 DEPENDS_class-native = "gettext-minimal-native"
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 acpaths = "-I ${S}/m4"
 
 do_install_append_class-native() {
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 99447c1..bcd9ba7 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -22,4 +22,4 @@ DEPENDS = "util-linux"
 SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-${PV}.tar.gz \
            file://mkdir.patch"
 
-inherit autotools gettext pkgconfig multilib_header
+inherit autotools gettext texinfo pkgconfig multilib_header
diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
index 75c10ef..54e4ec3 100644
--- a/meta/recipes-devtools/flex/flex.inc
+++ b/meta/recipes-devtools/flex/flex.inc
@@ -10,7 +10,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
            file://run-ptest \
 "
 
-inherit autotools gettext ptest
+inherit autotools gettext texinfo ptest
 
 
 M4 = "${bindir}/m4"
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 0408e65..61467a4 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 
 NATIVEDEPS = ""
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 
 BPN = "gcc"
 
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 60f03e7..b4d4880 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
 		file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
 		file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
-inherit autotools
+inherit autotools texinfo
 
 SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
           "
diff --git a/meta/recipes-devtools/guile/guile_2.0.9.bb b/meta/recipes-devtools/guile/guile_2.0.9.bb
index 60318e7..b35d54e 100644
--- a/meta/recipes-devtools/guile/guile_2.0.9.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.9.bb
@@ -29,7 +29,7 @@ SRC_URI[md5sum] = "a69b575d4a633bdd9118f3a4a1e97766"
 SRC_URI[sha256sum] = "f70a38c8d9751f442679bfe61852bba8545af4d4355d037630997c2f37f2895b"
 
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 BBCLASSEXTEND = "native"
 
 DEPENDS = "libunistring bdwgc gmp libtool libffi"
diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index d26982d..9c50d46 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -33,7 +33,7 @@ do_compile_prepend () {
 	./config.status
 }
 
-inherit autotools
+inherit autotools texinfo
 EXTRA_AUTORECONF = "--exclude=libtoolize"
 
 DEPENDS = "libtool-native"
diff --git a/meta/recipes-devtools/m4/m4.inc b/meta/recipes-devtools/m4/m4.inc
index ae101c2..4a83929 100644
--- a/meta/recipes-devtools/m4/m4.inc
+++ b/meta/recipes-devtools/m4/m4.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro process
 compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
 GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
 
-inherit autotools
+inherit autotools texinfo
 
 EXTRA_OEMAKE += "'infodir=${infodir}'"
 LDFLAGS_prepend_libc-uclibc = " -lrt "
diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/make/make.inc
index 4036345..57ea605 100644
--- a/meta/recipes-devtools/make/make.inc
+++ b/meta/recipes-devtools/make/make.inc
@@ -7,4 +7,4 @@ SECTION = "devel"
 
 SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2"
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig texinfo
diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
index 38f09de..d995c8f 100644
--- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
+++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
@@ -38,7 +38,7 @@ SRC_URI[sha256sum] = "af083a73425d664d4607ef6c6564fd9319a0e47ee7c105259a45356cb8
 
 S = "${WORKDIR}/mtools-${PV}"
 
-inherit autotools
+inherit autotools texinfo
 
 EXTRA_OECONF = "--without-x"
 
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index 0cc7f6c..6c71f0a 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://no-x11.gplv3.patch"
 
 
-inherit autotools
+inherit autotools texinfo
 
 EXTRA_OECONF = "--without-x"
 
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 2bb2df9..2fe0c6b 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -4,7 +4,7 @@ SECTION = "base/shell"
 
 DEPENDS = "ncurses bison-native"
 
-inherit autotools-brokensep gettext update-alternatives ptest
+inherit autotools-brokensep gettext texinfo update-alternatives ptest
 
 PARALLEL_MAKE = ""
 
diff --git a/meta/recipes-extended/bc/bc_1.06.bb b/meta/recipes-extended/bc/bc_1.06.bb
index 89d8bee..b116052 100644
--- a/meta/recipes-extended/bc/bc_1.06.bb
+++ b/meta/recipes-extended/bc/bc_1.06.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GNU_MIRROR}/bc/bc-${PV}.tar.gz \
 SRC_URI[md5sum] = "d44b5dddebd8a7a7309aea6c36fda117"
 SRC_URI[sha256sum] = "4ef6d9f17c3c0d92d8798e35666175ecd3d8efac4009d6457b5c99cea72c0e33"
 
-inherit autotools-brokensep update-alternatives
+inherit autotools-brokensep texinfo update-alternatives
 
 ALTERNATIVE_${PN} = "dc"
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/cpio/cpio_v2.inc b/meta/recipes-extended/cpio/cpio_v2.inc
index 30446b0..93de4bb 100644
--- a/meta/recipes-extended/cpio/cpio_v2.inc
+++ b/meta/recipes-extended/cpio/cpio_v2.inc
@@ -10,7 +10,7 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
     file://statdef.patch \
     "
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 
 S = "${WORKDIR}/cpio-${PV}"
 
diff --git a/meta/recipes-extended/diffutils/diffutils.inc b/meta/recipes-extended/diffutils/diffutils.inc
index 613b538..243341a 100644
--- a/meta/recipes-extended/diffutils/diffutils.inc
+++ b/meta/recipes-extended/diffutils/diffutils.inc
@@ -4,7 +4,7 @@ sdiff, and cmp utilities. These programs are usually \
 used for creating patch files."
 SECTION = "base"
 
-inherit autotools update-alternatives gettext
+inherit autotools texinfo update-alternatives gettext
 
 # diffutils assumes non-glibc compilation with uclibc and
 # this causes it to generate its own implementations of
diff --git a/meta/recipes-extended/ed/ed_0.5.bb b/meta/recipes-extended/ed/ed_0.5.bb
index a696c0c..a075780 100644
--- a/meta/recipes-extended/ed/ed_0.5.bb
+++ b/meta/recipes-extended/ed/ed_0.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://download.savannah.gnu.org/releases-noredirect/ed/ed-${PV}.tar.
 SRC_URI[md5sum] = "4ee21e9dcc9b5b6012c23038734e1632"
 SRC_URI[sha256sum] = "edef2bbde0fbf0d88232782a0eded323f483a0519d6fde9a3b1809056fd35f3e"
 
-inherit autotools
+inherit autotools texinfo
 
 EXTRA_OECONF = "'CC=${CC}' 'CXX=${CXX}' 'CFLAGS=${CFLAGS}' 'CXXFLAGS=${CXXFLAGS}' 'CPPFLAGS=${CPPFLAGS}' 'LDFLAGS=${LDFLAGS}'"
 
diff --git a/meta/recipes-extended/ed/ed_1.9.bb b/meta/recipes-extended/ed/ed_1.9.bb
index d162154..8e94eed 100644
--- a/meta/recipes-extended/ed/ed_1.9.bb
+++ b/meta/recipes-extended/ed/ed_1.9.bb
@@ -16,6 +16,8 @@ SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.gz"
 SRC_URI[md5sum] = "565b6d1d5a9a8816b9b304fc4ed9405d"
 SRC_URI[sha256sum] = "d5b372cfadf073001823772272fceac2cfa87552c5cd5a8efc1c8aae61f45a88"
 
+inherit texinfo
+
 do_configure() {
 	${S}/configure
 }
diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
index 4edb127..4f4068a 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -9,7 +9,7 @@ SECTION = "console/utils"
 
 SRC_URI = "${GNU_MIRROR}/findutils/findutils-${PV}.tar.gz"
 
-inherit autotools gettext update-alternatives
+inherit autotools gettext texinfo update-alternatives
 
 ALTERNATIVE_${PN} = "find xargs"
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/gawk/gawk_3.1.5.bb b/meta/recipes-extended/gawk/gawk_3.1.5.bb
index 4d9d6e4..48e8939 100644
--- a/meta/recipes-extended/gawk/gawk_3.1.5.bb
+++ b/meta/recipes-extended/gawk/gawk_3.1.5.bb
@@ -21,7 +21,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
 SRC_URI[md5sum] = "4760325489479cac17fe0114b8f62f30"
 SRC_URI[sha256sum] = "463dcb9d0ca398b1d4f5a332f6cd9cec56441265fca616f2ea1b44d459e9f0f8"
 
-inherit autotools gettext update-alternatives
+inherit autotools gettext texinfo update-alternatives
 
 PACKAGES += "gawk-common pgawk"
 
diff --git a/meta/recipes-extended/gawk/gawk_4.0.2.bb b/meta/recipes-extended/gawk/gawk_4.0.2.bb
index eb86af3..cb2f9c0 100644
--- a/meta/recipes-extended/gawk/gawk_4.0.2.bb
+++ b/meta/recipes-extended/gawk/gawk_4.0.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
 SRC_URI[md5sum] = "4d505dc2c9f1eb3e9f8d6cac87d4bd1a"
 SRC_URI[sha256sum] = "6e0de117c3713aa8d7fa347fc9fd645b10038ae49d8cf947d8c1d51cbb76141a"
 
-inherit autotools gettext update-alternatives
+inherit autotools gettext texinfo update-alternatives
 
 PACKAGES += "gawk-common pgawk dgawk"
 
diff --git a/meta/recipes-extended/grep/grep_2.18.bb b/meta/recipes-extended/grep/grep_2.18.bb
index 5ffeaf0..99337f7 100644
--- a/meta/recipes-extended/grep/grep_2.18.bb
+++ b/meta/recipes-extended/grep/grep_2.18.bb
@@ -10,7 +10,7 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 SRC_URI[md5sum] = "7439f8266f50844b56cc3e2721606541"
 SRC_URI[sha256sum] = "e6436e5077fa1497feccc8feaabd3f507b172369bf120fbc9e4874bba81be720"
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 
 EXTRA_OECONF = "--disable-perl-regexp"
 
diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb b/meta/recipes-extended/grep/grep_2.5.1a.bb
index 088959c..79842ba 100644
--- a/meta/recipes-extended/grep/grep_2.5.1a.bb
+++ b/meta/recipes-extended/grep/grep_2.5.1a.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "52202fe462770fa6be1bb667bd6cf30c"
 SRC_URI[sha256sum] = "38c8a2bb9223d1fb1b10bdd607cf44830afc92fd451ac4cd07619bf92bdd3132"
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 
 EXTRA_OECONF = "--disable-perl-regexp --disable-ncurses"
 
diff --git a/meta/recipes-extended/groff/groff_1.18.1.4.bb b/meta/recipes-extended/groff/groff_1.18.1.4.bb
index 28105f8..85357c5 100644
--- a/meta/recipes-extended/groff/groff_1.18.1.4.bb
+++ b/meta/recipes-extended/groff/groff_1.18.1.4.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
           file://man-local.patch \
           file://mdoc-local.patch" 
 
-inherit autotools
+inherit autotools texinfo
 
 EXTRA_OECONF="--without-x --prefix=${D} --exec-prefix=${D} --bindir=${D}${bindir} --datadir=${D}${datadir} --mandir=${D}${datadir}/man --infodir=${D}${datadir}info --with-appresdir=${D}${datadir}"
 
diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb b/meta/recipes-extended/groff/groff_1.22.2.bb
index 9d2a3c7..227f9fa 100644
--- a/meta/recipes-extended/groff/groff_1.22.2.bb
+++ b/meta/recipes-extended/groff/groff_1.22.2.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "380864dac4772e0c0d7b1282d25d0c5fd7f63baf45c87c4657afed22a1
 DEPENDS = "groff-native"
 DEPENDS_class-native = ""
 
-inherit autotools
+inherit autotools texinfo
 
 EXTRA_OECONF = "--without-x"
 PARALLEL_MAKE = ""
diff --git a/meta/recipes-extended/gzip/gzip.inc b/meta/recipes-extended/gzip/gzip.inc
index 6ec1dae..920b256 100644
--- a/meta/recipes-extended/gzip/gzip.inc
+++ b/meta/recipes-extended/gzip/gzip.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
 
-inherit autotools
+inherit autotools texinfo
 
 do_install_append () {
 	# Rename and move files into /bin (FHS), which is typical place for gzip
diff --git a/meta/recipes-extended/libidn/libidn_0.6.14.bb b/meta/recipes-extended/libidn/libidn_0.6.14.bb
index a13ed27..ff8d345 100644
--- a/meta/recipes-extended/libidn/libidn_0.6.14.bb
+++ b/meta/recipes-extended/libidn/libidn_0.6.14.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://src/idn.c;beginline=6;endline=18;md5=56c89e359652a71cda128d75f0ffdac4"
 PR = "r1"
 
-inherit pkgconfig autotools gettext
+inherit pkgconfig autotools gettext texinfo
 
 SRC_URI = "http://alpha.gnu.org/gnu/libidn/${BPN}-${PV}.tar.gz"
 
diff --git a/meta/recipes-extended/libidn/libidn_1.28.bb b/meta/recipes-extended/libidn/libidn_1.28.bb
index effd5ea..bd079c1 100644
--- a/meta/recipes-extended/libidn/libidn_1.28.bb
+++ b/meta/recipes-extended/libidn/libidn_1.28.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3231f57e8fce0f62f81b03107e788888 \
                     file://lib/idna.h;endline=21;md5=f73089b7f52dd2cb3540e274bd76106d \
                     file://src/idn.c;endline=20;md5=d7797e6cc3a7b48e6050fc0d27104595"
 
-inherit pkgconfig autotools gettext
+inherit pkgconfig autotools gettext texinfo
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://libidn_fix_for_automake-1.12.patch \
diff --git a/meta/recipes-extended/parted/parted_3.1.bb b/meta/recipes-extended/parted/parted_3.1.bb
index 8344ea8..9057463 100644
--- a/meta/recipes-extended/parted/parted_3.1.bb
+++ b/meta/recipes-extended/parted/parted_3.1.bb
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "5e9cc1f91eaf016e5033d85b9b893fd6d3ffaca532a48de1082df9b942
 
 EXTRA_OECONF = "--disable-device-mapper"
 
-inherit autotools pkgconfig gettext ptest
+inherit autotools pkgconfig gettext texinfo ptest
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index 6fd02a0..5850560 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -30,7 +30,7 @@ SRC_URI[tarball.sha256sum] = "78f0d5b1496084a5902586304d4a73954b2bfe33ea13edceec
 SRC_URI[patch.md5sum] = "5960bdae6782ee9356b7e0e0a1fa7c19"
 SRC_URI[patch.sha256sum] = "10acb274b2fb0bb7137a0d66e52fa0f18125bc5198c7a8d5af381b4b30636316"
 
-inherit autotools
+inherit autotools texinfo
 
 EXTRA_OECONF = "--with-pty-mode=0620 --with-pty-group=5 \
                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
diff --git a/meta/recipes-extended/sed/sed_4.1.2.bb b/meta/recipes-extended/sed/sed_4.1.2.bb
index 5607b0a..fe242e1 100644
--- a/meta/recipes-extended/sed/sed_4.1.2.bb
+++ b/meta/recipes-extended/sed/sed_4.1.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz \
 SRC_URI[md5sum] = "928f0e06422f414091917401f1a834d0"
 SRC_URI[sha256sum] = "638e837ba765d5da0a30c98b57c2953cecea96827882f594612acace93ceeeab"
 
-inherit autotools update-alternatives gettext
+inherit autotools texinfo update-alternatives gettext
 
 do_configure_prepend () {
 	cp ${WORKDIR}/Makevars ${S}/po/
diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
index cf8347c..47c8b5b 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz"
 SRC_URI[md5sum] = "4111de4faa3b9848a0686b2f260c5056"
 SRC_URI[sha256sum] = "fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff"
 
-inherit autotools update-alternatives gettext
+inherit autotools texinfo update-alternatives gettext
 
 EXTRA_OECONF = "--disable-acl"
 
diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
index 30a1373..51d4934 100644
--- a/meta/recipes-extended/tar/tar.inc
+++ b/meta/recipes-extended/tar/tar.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 
 SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
 
diff --git a/meta/recipes-extended/texi2html/texi2html_5.0.bb b/meta/recipes-extended/texi2html/texi2html_5.0.bb
index a22b981..d488465 100644
--- a/meta/recipes-extended/texi2html/texi2html_5.0.bb
+++ b/meta/recipes-extended/texi2html/texi2html_5.0.bb
@@ -12,7 +12,7 @@ SRC_URI     = "http://download.savannah.gnu.org/releases/texi2html/${BPN}-${PV}.
 SRC_URI[md5sum] = "f15ac876fcdc8be865b16535f480aa54"
 SRC_URI[sha256sum] = "e8a98b0ee20c495a6ab894398a065ef580272dbd5a15b1b19e8bd1bc89d9f9fa"
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 
 do_configure_prepend() {
 	# Make a directory for the old gettext setup
diff --git a/meta/recipes-extended/time/time.inc b/meta/recipes-extended/time/time.inc
index 028da7c..8586217 100644
--- a/meta/recipes-extended/time/time.inc
+++ b/meta/recipes-extended/time/time.inc
@@ -6,7 +6,7 @@ SECTION = "utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-inherit update-alternatives
+inherit texinfo update-alternatives
 
 ALTERNATIVE_${PN} = "time"
 ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 4eeef70..a778bca 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -7,7 +7,7 @@ DEPENDS = "openssl zlib libpcre"
 
 INC_PR = "r16"
 
-inherit autotools gettext update-alternatives
+inherit autotools gettext texinfo update-alternatives
 
 EXTRA_OECONF = "--enable-ipv6 --with-libssl-prefix=${STAGING_DIR_HOST} \
                 --with-ssl=openssl --disable-rpath --disable-iri \
diff --git a/meta/recipes-extended/which/which_2.18.bb b/meta/recipes-extended/which/which_2.18.bb
index 4f78010..5fa5d9e 100644
--- a/meta/recipes-extended/which/which_2.18.bb
+++ b/meta/recipes-extended/which/which_2.18.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "9445cd7e02ec0c26a44fd56098464ded064ba5d93dd2e15ec12410ba56
 
 DEPENDS = "cwautomacros-native"
 
-inherit autotools update-alternatives
+inherit autotools texinfo update-alternatives
 
 do_configure_prepend() {
 	OLD="@ACLOCAL_CWFLAGS@"
diff --git a/meta/recipes-extended/which/which_2.20.bb b/meta/recipes-extended/which/which_2.20.bb
index f4e87de..f3c6037 100644
--- a/meta/recipes-extended/which/which_2.20.bb
+++ b/meta/recipes-extended/which/which_2.20.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://which.c;beginline=1;endline=17;md5=a9963693af2272e7a8df6f231164e7a2"
 DEPENDS     = "cwautomacros-native"
 
-inherit autotools update-alternatives
+inherit autotools texinfo update-alternatives
 
 PR = "r3"
 
diff --git a/meta/recipes-gnome/libffi/libffi_3.0.13.bb b/meta/recipes-gnome/libffi/libffi_3.0.13.bb
index db0841e..9897ca8 100644
--- a/meta/recipes-gnome/libffi/libffi_3.0.13.bb
+++ b/meta/recipes-gnome/libffi/libffi_3.0.13.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "1dddde1400c3bcb7749d398071af88c3e4754058d2d4c0b3696c2f82dc
 
 EXTRA_OECONF += "--disable-builddir"
 
-inherit autotools
+inherit autotools texinfo
 
 FILES_${PN}-dev += "${libdir}/libffi-${PV}"
 
diff --git a/meta/recipes-support/aspell/aspell_0.60.6.1.bb b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
index 8ac8809..56dabd3 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.1.bb
@@ -23,4 +23,4 @@ FILES_libpspell = "${libdir}/libpspell.so.*"
 FILES_libpspell-dev = "${libdir}/libpspell* ${bindir}/pspell-config ${includedir}/pspell"
 
 ARM_INSTRUCTION_SET = "arm"
-inherit autotools-brokensep gettext
+inherit autotools-brokensep gettext texinfo
diff --git a/meta/recipes-support/gdbm/gdbm_1.11.bb b/meta/recipes-support/gdbm/gdbm_1.11.bb
index de32e87..3d02594 100644
--- a/meta/recipes-support/gdbm/gdbm_1.11.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.11.bb
@@ -10,7 +10,7 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
 SRC_URI[md5sum] = "72c832680cf0999caedbe5b265c8c1bd"
 SRC_URI[sha256sum] = "8d912f44f05d0b15a4a5d96a76f852e905d051bb88022fcdfd98b43be093e3c3"
 
-inherit autotools gettext lib_package
+inherit autotools gettext texinfo lib_package
 
 # Needed for dbm python module
 EXTRA_OECONF = "-enable-libgdbm-compat"
diff --git a/meta/recipes-support/gdbm/gdbm_1.8.3.bb b/meta/recipes-support/gdbm/gdbm_1.8.3.bb
index bcf6b99..aecf47a 100644
--- a/meta/recipes-support/gdbm/gdbm_1.8.3.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.8.3.bb
@@ -13,6 +13,6 @@ SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz \
 SRC_URI[md5sum] = "1d1b1d5c0245b1c00aff92da751e9aa1"
 SRC_URI[sha256sum] = "cc340338a2e28b40058ab9eb5354a21d53f88a1582ea21ba0bb185c37a281dc9"
 
-inherit autotools
+inherit autotools texinfo
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index be2983f..d025e072 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -10,7 +10,7 @@ SRC_URI = "ftp://ftp.gmplib.org/pub/gmp-${PV}/gmp-${PV}${REVISION}.tar.bz2 \
 	   file://configure.patch \
 	   file://amd64.patch "
 
-inherit autotools
+inherit autotools texinfo
 
 ARM_INSTRUCTION_SET = "arm"
 
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
index 362aacf..5c93925 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -17,4 +17,4 @@ SRC_URI = "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "091c56e0e1cca6b09b17b69d47ef18e3"
 SRC_URI[sha256sum] = "d07ffcb37eecec35c5ec72516d10b35fdf6e6fef1fcf1dcd37e30b8cbf8bf941"
 
-inherit autotools
+inherit autotools texinfo
diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
index e8f797d..031eaf3 100644
--- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -22,7 +22,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "b06a141cca5cd1a55bbdd25ab833303c"
 SRC_URI[sha256sum] = "69d18b7d193f62ca27ed4febcb4c9044aa0c95305d3258fe902e2fae5fc6468d"
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 
 #   --with-egd-socket=NAME  use NAME for the EGD socket
 #   --with-photo-viewer=FIXED_VIEWER  set a fixed photo ID viewer
diff --git a/meta/recipes-support/gnupg/gnupg_2.0.22.bb b/meta/recipes-support/gnupg/gnupg_2.0.22.bb
index 7f36df5..c1ed28c 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.22.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.22.bb
@@ -8,7 +8,7 @@ DEPENDS = "${PTH} libassuan libksba zlib bzip2 readline libgcrypt"
 PTH = "pth"
 PTH_libc-uclibc = "npth"
 
-inherit autotools gettext
+inherit autotools gettext texinfo
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
 
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 25ec3a6..206ba4b 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -19,7 +19,7 @@ SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]
 
 SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.bz2"
 
-inherit autotools-brokensep binconfig pkgconfig gettext lib_package
+inherit autotools-brokensep texinfo binconfig pkgconfig gettext lib_package
 
 EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
               --with-libtasn1-prefix=${STAGING_DIR_HOST}${prefix} \
diff --git a/meta/recipes-support/gnutls/libtasn1_3.4.bb b/meta/recipes-support/gnutls/libtasn1_3.4.bb
index 590987e..174eddf 100644
--- a/meta/recipes-support/gnutls/libtasn1_3.4.bb
+++ b/meta/recipes-support/gnutls/libtasn1_3.4.bb
@@ -16,6 +16,6 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
 SRC_URI[md5sum] = "21ec021c534b0f30b2834ce233c70f15"
 SRC_URI[sha256sum] = "f353507a458fe2372b791016a056c95946eebfc7256b49013851f134a5e6acc8"
 
-inherit autotools binconfig lib_package
+inherit autotools texinfo binconfig lib_package
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/gpgme/gpgme_1.4.3.bb b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
index 78182c0..bb53e38 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.3.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
@@ -19,7 +19,7 @@ DEPENDS = "libgpg-error libassuan"
 
 EXTRA_OECONF = "--with-gpg=${bindir}/gpg --without-gpgsm"
 
-inherit autotools binconfig
+inherit autotools texinfo binconfig
 
 PACKAGES =+ "${PN}-pthread"
 FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
diff --git a/meta/recipes-support/libassuan/libassuan_2.1.1.bb b/meta/recipes-support/libassuan/libassuan_2.1.1.bb
index 4e6b4f8..60b3f92 100644
--- a/meta/recipes-support/libassuan/libassuan_2.1.1.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.1.1.bb
@@ -16,4 +16,4 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "757243cc4a71b30ed8d8dbe784035d36"
 SRC_URI[sha256sum] = "23e2d67779b88e90d29fe1df6b157109f1c2a647d0f1b2a0f4295bb3c0b2039d"
 
-inherit autotools binconfig pkgconfig
+inherit autotools texinfo binconfig pkgconfig
diff --git a/meta/recipes-support/libcheck/libcheck_0.9.12.bb b/meta/recipes-support/libcheck/libcheck_0.9.12.bb
index 12ef1d4..2a83031 100644
--- a/meta/recipes-support/libcheck/libcheck_0.9.12.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.9.12.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "c7d47e55e133a0ca19a52e08a99333ac55cb22618b53719b7f4117a187
 
 S = "${WORKDIR}/check-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig texinfo
 
 CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
 
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index e7fcc62..724bf3d 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -14,7 +14,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://add-pkgconfig-support.patch \
            file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch"
 
-inherit autotools-brokensep binconfig pkgconfig
+inherit autotools-brokensep texinfo binconfig pkgconfig
 
 EXTRA_OECONF = "--disable-asm --with-capabilities"
 
diff --git a/meta/recipes-support/libksba/libksba_1.3.0.bb b/meta/recipes-support/libksba/libksba_1.3.0.bb
index 4690ba9..7486bef 100644
--- a/meta/recipes-support/libksba/libksba_1.3.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.0.bb
@@ -10,7 +10,7 @@ PR = "r1"
 
 DEPENDS = "libgpg-error"
 
-inherit autotools binconfig pkgconfig
+inherit autotools binconfig pkgconfig texinfo
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
diff --git a/meta/recipes-support/libmpc/libmpc.inc b/meta/recipes-support/libmpc/libmpc.inc
index 61b71c6..b374254 100644
--- a/meta/recipes-support/libmpc/libmpc.inc
+++ b/meta/recipes-support/libmpc/libmpc.inc
@@ -4,4 +4,4 @@ HOMEPAGE = "http://www.multiprecision.org/"
 LICENSE = "LGPLv3"
 SECTION = "libs"
 
-inherit autotools
+inherit autotools texinfo
diff --git a/meta/recipes-support/libunistring/libunistring_0.9.3.bb b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
index faabe03..db1651b 100644
--- a/meta/recipes-support/libunistring/libunistring_0.9.3.bb
+++ b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
@@ -28,5 +28,5 @@ SRC_URI[sha256sum] = "610d3ec724fbdaa654afe3cff20b9f4d504be3fd296fded2e0f7f76404
 
 PR = "r3"
 
-inherit autotools
+inherit autotools texinfo
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/mpfr/mpfr.inc b/meta/recipes-support/mpfr/mpfr.inc
index ecee731..7f3f917 100644
--- a/meta/recipes-support/mpfr/mpfr.inc
+++ b/meta/recipes-support/mpfr/mpfr.inc
@@ -3,4 +3,4 @@ HOMEPAGE = "http://www.mpfr.org/"
 LICENSE = "LGPLv3+"
 SECTION = "devel"
 
-inherit autotools
+inherit autotools texinfo
-- 
1.8.3.2


