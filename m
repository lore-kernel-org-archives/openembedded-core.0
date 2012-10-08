Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLGKd-0004aC-Gu
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 18:37:27 +0200
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id C65F3D22BA;
	Mon,  8 Oct 2012 18:24:25 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2012 18:24:15 +0200
Message-Id: <1349713455-29760-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1347959319.13596.90.camel@ted>
References: <1347959319.13596.90.camel@ted>
Subject: [PATCH] gnu-config: update to 2012.08.14 to get support for AArch64 architecture
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Oct 2012 16:37:27 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../gnu-config/config-guess-uclibc.patch           |   47 +++++++++++---------
 ...u-config_20111111.bb => gnu-config_20120814.bb} |   10 ++---
 2 files changed, 31 insertions(+), 26 deletions(-)
 rename meta/recipes-devtools/gnu-config/{gnu-config_20111111.bb => gnu-config_20120814.bb} (80%)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch b/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
index dc15d91..2094116 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
+++ b/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
@@ -5,13 +5,18 @@ Patch courtesy gentoo-portage/sys-devel/gnuconfig/files/automake-1.8.5-config-gu
 updated to 20050516 by Marcin 'Hrw' Juszkiewicz (by hand)
 updated to 20080123 by Nitin A Kamble (by hand)
 updated to 20111001 by Saul Wold (by hand)
+updated to 20120818 by Marcin 'Hrw' Juszkiewicz (by hand)
+
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+---
+ config.guess |   67 +++++++++++++++++++++++++++++++++++------------------------
+ 1 file changed, 40 insertions(+), 27 deletions(-)
 
-Index: git/config.guess
-===================================================================
---- git.orig/config.guess	2011-10-20 15:15:25.000000000 -0700
-+++ git/config.guess	2011-10-20 16:56:43.810830229 -0700
-@@ -140,6 +140,19 @@
+--- git.orig/config.guess
++++ git/config.guess
+@@ -138,6 +138,19 @@ UNAME_RELEASE=`(uname -r) 2>/dev/null` |
  UNAME_SYSTEM=`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=unknown
  UNAME_VERSION=`(uname -v) 2>/dev/null` || UNAME_VERSION=unknown
  
@@ -31,7 +36,7 @@ Index: git/config.guess
  # Note: order is significant - the case branches are not exclusive.
  
  case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
-@@ -871,15 +884,15 @@
+@@ -886,15 +899,15 @@ EOF
  	  EV68*) UNAME_MACHINE=alphaev68 ;;
  	esac
  	objdump --private-headers /bin/sh | grep -q ld.so.1
@@ -50,7 +55,7 @@ Index: git/config.guess
  	else
  	    if echo __ARM_PCS_VFP | $CC_FOR_BUILD -E - 2>/dev/null \
  		| grep -q __ARM_PCS_VFP
-@@ -891,19 +904,19 @@
+@@ -906,19 +919,19 @@ EOF
  	fi
  	exit ;;
      avr32*:Linux:*:*)
@@ -58,24 +63,24 @@ Index: git/config.guess
 +	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      cris:Linux:*:*)
--	echo cris-axis-linux-gnu
-+	echo cris-axis-linux-${LIBC}
+-	echo ${UNAME_MACHINE}-axis-linux-gnu
++	echo ${UNAME_MACHINE}-axis-linux-${LIBC}
  	exit ;;
      crisv32:Linux:*:*)
--	echo crisv32-axis-linux-gnu
-+	echo crisv32-axis-linux-${LIBC}
+-	echo ${UNAME_MACHINE}-axis-linux-gnu
++	echo ${UNAME_MACHINE}-axis-linux-${LIBC}
  	exit ;;
      frv:Linux:*:*)
--	echo frv-unknown-linux-gnu
-+	echo frv-unknown-linux-${LIBC}
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      hexagon:Linux:*:*)
--	echo hexagon-unknown-linux-gnu
-+	echo hexagon-unknown-linux-${LIBC}
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      i*86:Linux:*:*)
  	LIBC=gnu
-@@ -917,13 +930,13 @@
+@@ -932,13 +945,13 @@ EOF
  	echo "${UNAME_MACHINE}-pc-linux-${LIBC}"
  	exit ;;
      ia64:Linux:*:*)
@@ -92,7 +97,7 @@ Index: git/config.guess
  	exit ;;
      mips:Linux:*:* | mips64:Linux:*:*)
  	eval $set_cc_for_build
-@@ -942,54 +955,54 @@
+@@ -957,54 +970,54 @@ EOF
  	#endif
  EOF
  	eval `$CC_FOR_BUILD -E $dummy.c 2>/dev/null | grep '^CPU'`
@@ -100,8 +105,8 @@ Index: git/config.guess
 +	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-${LIBC}"; exit; }
  	;;
      or32:Linux:*:*)
--	echo or32-unknown-linux-gnu
-+	echo or32-unknown-linux-${LIBC}
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      padre:Linux:*:*)
 -	echo sparc-unknown-linux-gnu
@@ -154,8 +159,8 @@ Index: git/config.guess
 +	echo ${UNAME_MACHINE}-dec-linux-${LIBC}
  	exit ;;
      x86_64:Linux:*:*)
--	echo x86_64-unknown-linux-gnu
-+	echo x86_64-unknown-linux-${LIBC}
+-	echo ${UNAME_MACHINE}-unknown-linux-gnu
++	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
  	exit ;;
      xtensa*:Linux:*:*)
 -	echo ${UNAME_MACHINE}-unknown-linux-gnu
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
similarity index 80%
rename from meta/recipes-devtools/gnu-config/gnu-config_20111111.bb
rename to meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
index f731360..dd9248f 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
@@ -2,20 +2,20 @@ SUMMARY = "gnu-configize"
 DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a directory tree"
 SECTION = "devel"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=a3669d051b3a8408d69751e53b2e1cc1"
+LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=b79a4663475f4d724846463277817e0d"
 
 DEPENDS_virtclass-native = "perl-native-runtime"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-PR = "r1"
+PR = "r0"
 
-SRC_URI = "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-yocto-${PV}.tgz \
+SRC_URI = "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-${PV}.tar.bz2 \
 	   file://config-guess-uclibc.patch \
            file://gnu-configize.in"
 
-SRC_URI[md5sum] = "30be385c919a25cd9522205ef49e5328"
-SRC_URI[sha256sum] = "0750afa8d8ee988b6ead1c2d02b565597f809e2e3ad14886ed7803d3bbc8b0cd"
+SRC_URI[md5sum] = "bcfca5a2bb39edad4aae5a65efc84094"
+SRC_URI[sha256sum] = "44f99a8e76f3e8e4fec0bb5ad4762f8e44366168554ce66cb85afbe2ed3efd8b"
 
 do_compile() {
 	:
-- 
1.7.10.4



