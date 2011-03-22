Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q29lt-0005ah-H6
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 23:09:49 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q29k8-0003Bj-P2 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 15:08:00 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 22 Mar 2011 15:08:00 -0700
Received: from localhost.localdomain ([172.30.80.248]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Mar 2011 16:07:58 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2011 15:07:34 -0700
Message-Id: <44c400f651202c7a05862439d58ab9e77c2da41d.1300831551.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1300831551.git.tom_rini@mentor.com>
References: <cover.1300831551.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 22 Mar 2011 22:07:59.0106 (UTC)
	FILETIME=[9AB37620:01CBE8DD]
Subject: [PATCH 3/7] Various: Switch to using GNU_MIRROR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Mar 2011 22:09:49 -0000

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb    |    2 +-
 meta/recipes-core/coreutils/coreutils_8.9.bb    |    2 +-
 meta/recipes-core/glibc/glibc_2.10.1.bb         |    6 +++---
 meta/recipes-extended/bash/bash_3.2.48.bb       |    6 +++---
 meta/recipes-extended/bash/bash_4.1.bb          |   14 +++++++-------
 meta/recipes-extended/groff/groff_1.18.1.4.bb   |    2 +-
 meta/recipes-extended/libidn/libidn_1.19.bb     |    2 +-
 meta/recipes-extended/which/which_2.20.bb       |    2 +-
 meta/recipes-support/aspell/aspell_0.60.6.bb    |    2 +-
 meta/recipes-support/gmp/gmp.inc                |    2 +-
 meta/recipes-support/gmp/gmp_4.2.1.bb           |    2 +-
 meta/recipes-support/libiconv/libiconv_1.9.2.bb |    2 +-
 12 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 2d7fded..d8ea8cd 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -14,7 +14,7 @@ DEPENDS_virtclass-native = "perl-native gettext-native"
 
 inherit autotools gettext
 
-SRC_URI_BASE = "http://ftp.gnu.org/gnu/coreutils/${BP}.tar.bz2 \
+SRC_URI_BASE = "${GNU_MIRROR}/coreutils/${BP}.tar.bz2 \
            file://gnulib_m4.patch \
            file://futimens.patch \
            file://coreutils-ls-x.patch \
diff --git a/meta/recipes-core/coreutils/coreutils_8.9.bb b/meta/recipes-core/coreutils/coreutils_8.9.bb
index 4b9a655..33422d1 100644
--- a/meta/recipes-core/coreutils/coreutils_8.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.9.bb
@@ -13,7 +13,7 @@ DEPENDS_virtclass-native = "perl-native gmp-native"
 
 inherit autotools gettext
 
-SRC_URI = "http://ftp.gnu.org/gnu/coreutils/${BP}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "36909ae68840d73a800120cf74af794a"
 SRC_URI[sha256sum] = "aa991fa4296b22ff929a31a5cb5528bb783c84cdef4503c4ff311cfbeaebf50a"
diff --git a/meta/recipes-core/glibc/glibc_2.10.1.bb b/meta/recipes-core/glibc/glibc_2.10.1.bb
index 8cb97d5..02d485e 100644
--- a/meta/recipes-core/glibc/glibc_2.10.1.bb
+++ b/meta/recipes-core/glibc/glibc_2.10.1.bb
@@ -40,9 +40,9 @@ RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 #	   file://arm-machine-gmon.patch;patch=1;pnum=0
 #	   file://arm-ioperm.patch;patch=1;pnum=0
 #	   file://ldd.patch;patch=1;pnum=0
-SRC_URI = "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
-           ftp://ftp.gnu.org/pub/gnu/glibc/glibc-ports-${PV}.tar.bz2 \
-           ftp://ftp.gnu.org/pub/gnu/glibc/glibc-libidn-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/glibc/glibc-${PV}.tar.bz2 \
+           ${GNU_MIRROR}/glibc/glibc-ports-${PV}.tar.bz2 \
+           ${GNU_MIRROR}/glibc/glibc-libidn-${PV}.tar.bz2 \
            file://nscd-init.patch;striplevel=0 \
            file://arm-memcpy.patch \
            file://arm-longlong.patch \
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 0912ad6..1520c4e 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -9,9 +9,9 @@ DEPENDS = "ncurses"
 PR = "r7"
 
 SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0 \
-           http://ftp.gnu.org/gnu/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0"
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-extended/bash/bash_4.1.bb b/meta/recipes-extended/bash/bash_4.1.bb
index cea4042..bf8cdad 100644
--- a/meta/recipes-extended/bash/bash_4.1.bb
+++ b/meta/recipes-extended/bash/bash_4.1.bb
@@ -3,13 +3,13 @@ require bash.inc
 PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
-           http://ftp.gnu.org/gnu/bash/bash-4.1-patches/bash41-001;apply=yes;striplevel=0;name=patch001 \
-           http://ftp.gnu.org/gnu/bash/bash-4.1-patches/bash41-002;apply=yes;striplevel=0;name=patch002 \
-           http://ftp.gnu.org/gnu/bash/bash-4.1-patches/bash41-003;apply=yes;striplevel=0;name=patch003 \
-           http://ftp.gnu.org/gnu/bash/bash-4.1-patches/bash41-004;apply=yes;striplevel=0;name=patch004 \
-           http://ftp.gnu.org/gnu/bash/bash-4.1-patches/bash41-005;apply=yes;striplevel=0;name=patch005 \
-           http://ftp.gnu.org/gnu/bash/bash-4.1-patches/bash41-006;apply=yes;striplevel=0;name=patch006 \
-           http://ftp.gnu.org/gnu/bash/bash-4.1-patches/bash41-007;apply=yes;striplevel=0;name=patch007 \
+           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-001;apply=yes;striplevel=0;name=patch001 \
+           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-002;apply=yes;striplevel=0;name=patch002 \
+           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-003;apply=yes;striplevel=0;name=patch003 \
+           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-004;apply=yes;striplevel=0;name=patch004 \
+           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-005;apply=yes;striplevel=0;name=patch005 \
+           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-006;apply=yes;striplevel=0;name=patch006 \
+           ${GNU_MIRROR}/bash/bash-4.1-patches/bash41-007;apply=yes;striplevel=0;name=patch007 \
            "
 
 SRC_URI[tarball.md5sum] = "9800d8724815fd84994d9be65ab5e7b8"
diff --git a/meta/recipes-extended/groff/groff_1.18.1.4.bb b/meta/recipes-extended/groff/groff_1.18.1.4.bb
index 66a6632..cf3adea 100644
--- a/meta/recipes-extended/groff/groff_1.18.1.4.bb
+++ b/meta/recipes-extended/groff/groff_1.18.1.4.bb
@@ -9,7 +9,7 @@ PR = "r1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e43fc16fccd8519fba405f0a0ff6e8a3"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/groff/groff-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
           file://groff-1.18.1.4-remove-mom.patch;striplevel=1 \
           file://man-local.patch \
           file://mdoc-local.patch" 
diff --git a/meta/recipes-extended/libidn/libidn_1.19.bb b/meta/recipes-extended/libidn/libidn_1.19.bb
index 65a8692..a90a739 100644
--- a/meta/recipes-extended/libidn/libidn_1.19.bb
+++ b/meta/recipes-extended/libidn/libidn_1.19.bb
@@ -11,7 +11,7 @@ PR = "r0"
 
 inherit pkgconfig autotools gettext
 
-SRC_URI = "http://ftp.gnu.org/gnu/libidn/${P}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libidn/${P}.tar.gz"
 
 SRC_URI[md5sum] = "a45142126d28162014c995f969bdb5a8"
 SRC_URI[sha256sum] = "8ed2e936b1ae3e30b45b54ca3672deaa83ee0f4d20db5ad83dc1af7222d39f41"
diff --git a/meta/recipes-extended/which/which_2.20.bb b/meta/recipes-extended/which/which_2.20.bb
index f8c9bf4..07a5d31 100644
--- a/meta/recipes-extended/which/which_2.20.bb
+++ b/meta/recipes-extended/which/which_2.20.bb
@@ -10,7 +10,7 @@ inherit autotools update-alternatives
 
 PR = "r1"
 
-SRC_URI = "http://ftp.gnu.org/gnu/which/which-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/which/which-${PV}.tar.gz \
            file://remove-declaration.patch"
 
 SRC_URI[md5sum] = "95be0501a466e515422cde4af46b2744"
diff --git a/meta/recipes-support/aspell/aspell_0.60.6.bb b/meta/recipes-support/aspell/aspell_0.60.6.bb
index 696d5b4..455ea35 100644
--- a/meta/recipes-support/aspell/aspell_0.60.6.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.6.bb
@@ -1,4 +1,4 @@
-SRC_URI = "ftp://ftp.gnu.org/gnu/aspell/aspell-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "bc80f0198773d5c05086522be67334eb"
 SRC_URI[sha256sum] = "4f5b1520e26cf6bbb1b5ca8a2f9f22948c3ca38ac4c2dd9e02df042fee7c0e36"
diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index 6b56f7e..66349e6 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "GNU multiprecision arithmetic library"
 HOMEPAGE = "http://www.swox.com/gmp/"
 LICENSE = "GPLv3 LGPLv3"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/gmp/gmp-${PV}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gmp/gmp-${PV}.tar.bz2 \
 	   file://configure.patch \
 	   file://amd64.patch "
 
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
index d70dcf2..74da6b8 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a \
                     file://gmp-h.in;startline=6;endline=21;md5=5e25ffd16996faba8c1cd27b04b16099"
 PR = "r0"
 
-SRC_URI = "ftp://ftp.gnu.org/gnu/gmp/${BP}.tar.bz2 \
+SRC_URI = "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
            file://disable-stdc.patch"
 
 inherit autotools
diff --git a/meta/recipes-support/libiconv/libiconv_1.9.2.bb b/meta/recipes-support/libiconv/libiconv_1.9.2.bb
index d427dce..dac9e3c 100644
--- a/meta/recipes-support/libiconv/libiconv_1.9.2.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.9.2.bb
@@ -7,7 +7,7 @@ NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
 PROVIDES = "virtual/libiconv"
 PR = "r4"
 LICENSE = "LGPL"
-SRC_URI = "ftp://ftp.gnu.org/pub/gnu/libiconv/libiconv-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libiconv/libiconv-${PV}.tar.gz"
 
 S = "${WORKDIR}/libiconv-${PV}"
 
-- 
1.7.0.4



