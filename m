Return-Path: <valentin.popa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5753A6D681
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 10:43:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Nov 2013 02:39:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,773,1378882800"; d="scan'208";a="442099965"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.58])
	by orsmga002.jf.intel.com with ESMTP; 26 Nov 2013 02:43:09 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 12:44:05 +0200
Message-Id: <5db64562654d5cedc02f0c6885ec7b0d3893a783.1385462586.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1385462586.git.valentin.popa@intel.com>
References: <cover.1385462586.git.valentin.popa@intel.com>
In-Reply-To: <cover.1385462586.git.valentin.popa@intel.com>
References: <cover.1385462586.git.valentin.popa@intel.com>
Subject: [PATCH 1/1] libpng: upgrade to 1.6.7
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
X-List-Received-Date: Tue, 26 Nov 2013 10:43:10 -0000

License is the same.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../0001-configure-lower-automake-requirement.patch       | 15 ++++++++-------
 .../libpng/{libpng_1.6.6.bb => libpng_1.6.7.bb}           | 10 +++++-----
 2 files changed, 13 insertions(+), 12 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.6.bb => libpng_1.6.7.bb} (62%)

diff --git a/meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch b/meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
index e38e0a8..bbbca89 100644
--- a/meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
+++ b/meta/recipes-multimedia/libpng/libpng/0001-configure-lower-automake-requirement.patch
@@ -1,10 +1,11 @@
-From a4fd84bdc69e9929a1040f20ea291ee3115bf5b2 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Mon, 15 Apr 2013 11:16:20 +0200
+From fff7cbc01e061a235852f385866fe75fb17867e3 Mon Sep 17 00:00:00 2001
+From: Valentin Popa <valentin.popa@intel.com>
+Date: Tue, 26 Nov 2013 12:06:55 +0200
 Subject: [PATCH] configure: lower automake requirement
 
 We're not using parallel tests in OE-core yet
 
+Signed-off-by: Valentin Popa <valentin.popa@intel.com>
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 
 Upstream-Status: Inapropriate [OE specific build hack]
@@ -13,18 +14,18 @@ Upstream-Status: Inapropriate [OE specific build hack]
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 1745d31..7f015fe 100644
+index 28200c3..fab2515 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -27,7 +27,7 @@ AC_CONFIG_MACRO_DIR([scripts])
  # dist-xz requires automake 1.11 or later
  # 1.12.2 fixes a security issue in 1.11.2 and 1.12.1
  # 1.13 is required for parallel tests
--AM_INIT_AUTOMAKE([1.13 foreign dist-xz color-tests silent-rules])
-+AM_INIT_AUTOMAKE([1.12.2 foreign dist-xz color-tests silent-rules])
+-AM_INIT_AUTOMAKE([1.13 foreign dist-xz color-tests silent-rules subdir-objects])
++AM_INIT_AUTOMAKE([1.12.2 foreign dist-xz color-tests silent-rules subdir-objects])
  # The following line causes --disable-maintainer-mode to be the default to
  # configure, this is necessary because libpng distributions cannot rely on the
  # time stamps of the autotools generated files being correct
 -- 
-1.8.1.4
+1.8.3.2
 
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.6.bb b/meta/recipes-multimedia/libpng/libpng_1.6.7.bb
similarity index 62%
rename from meta/recipes-multimedia/libpng/libpng_1.6.6.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.7.bb
index 376dd53..0f5ae5d 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.6.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.7.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "PNG Library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2ebec5fb1db10234542f80fdd7117e25 \
-                    file://png.h;endline=15;md5=41143e20c803af0a376888699ce0980e \
-                    file://png.h;beginline=209;endline=323;md5=d30ef0b1dd12d869cb3c6bdb3678e5f4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=243135ddedf702158f9170807cbcfb66 \
+                    file://png.h;endline=15;md5=cb4981447519fe0bb87fbda5e8cd50be \
+                    file://png.h;beginline=209;endline=323;md5=f6b7821e0ddefaa4d71fdfa1f5a91fb7"
 DEPENDS = "zlib"
 LIBV = "16"
 
@@ -13,8 +13,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}
            file://0001-configure-lower-automake-requirement.patch \
           "
 
-SRC_URI[md5sum] = "3a41dcd58bcac7cc191c2ec80c7fb2ac"
-SRC_URI[sha256sum] = "0407965a0057af7a9e4cefe27c062f517d9ad701cdfd20aa91afb6a84f214e70"
+SRC_URI[md5sum] = "7023a9eacd7b6a3eb95761a2f574d456"
+SRC_URI[sha256sum] = "13c9c853a9a600218fff9961658dc4f485ad2ef9b862315b434dd2fdbbe1f945"
 
 inherit autotools binconfig pkgconfig
 
-- 
1.8.3.2


