Return-Path: <valentin.popa@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E33036D092
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 12:49:32 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Oct 2013 05:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="314222367"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.58])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Oct 2013 05:49:32 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2013 14:50:44 +0200
Message-Id: <1383051044-26924-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1383050658-26633-1-git-send-email-valentin.popa@intel.com>
References: <1383050658-26633-1-git-send-email-valentin.popa@intel.com>
Subject: [PATCH v2] libx11: upgrade to 1.6.2
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
X-List-Received-Date: Tue, 29 Oct 2013 12:49:33 -0000

Adapted X18NCMSstubs.diff to correctly apply.

Tested on core-image-sato (for both libx11 and
libx11-diet)

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../xorg-lib/{libx11-diet_1.6.1.bb => libx11-diet_1.6.2.bb}           | 4 ++--
 meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff               | 3 +--
 meta/recipes-graphics/xorg-lib/{libx11_1.6.1.bb => libx11_1.6.2.bb}   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.6.1.bb => libx11-diet_1.6.2.bb} (73%)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.6.1.bb => libx11_1.6.2.bb} (47%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.1.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.2.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/libx11-diet_1.6.1.bb
rename to meta/recipes-graphics/xorg-lib/libx11-diet_1.6.2.bb
index 3c3b8e7..89b0716 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.6.2.bb
@@ -11,8 +11,8 @@ SRC_URI += "file://X18NCMSstubs.diff \
 RPROVIDES_${PN}-dev = "libx11-dev"
 RPROVIDES_${PN}-locale = "libx11-locale"
 
-SRC_URI[md5sum] = "bc5fc459ec25a50c5a7e27035b89e579"
-SRC_URI[sha256sum] = "10a54fc16b58b4f5a5eed4d080c357a82fd2f42d09af625c1f5df50650701892"
+SRC_URI[md5sum] = "c35d6ad95b06635a524579e88622fdb5"
+SRC_URI[sha256sum] = "2aa027e837231d2eeea90f3a4afe19948a6eb4c8b2bec0241eba7dbc8106bd16"
 
 EXTRA_OECONF += "--disable-xlocale"
 
diff --git a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
index 9e91a8b..744cedc 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
+++ b/meta/recipes-graphics/xorg-lib/libx11/X18NCMSstubs.diff
@@ -483,10 +483,9 @@ Index: libX11-1.3/src/Makefile.am
  x11datadir = @X11_DATADIR@
  x11data_DATA = XKeysymDB XErrorDB
  
-@@ -342,7 +344,8 @@ EXTRA_DIST = \
+@@ -342,6 +344,7 @@ EXTRA_DIST = \
  	$(x11data_DATA) \
  	os2Stubs.c \
- 	udcInf.c \
 -	UIThrStubs.c 
 +	UIThrStubs.c \
 +	X18NCMSstubs.c
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb
similarity index 47%
rename from meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb
index b9fb832..2377d61 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.2.bb
@@ -6,5 +6,5 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI += "file://disable_tests.patch \
            "
 
-SRC_URI[md5sum] = "bc5fc459ec25a50c5a7e27035b89e579"
-SRC_URI[sha256sum] = "10a54fc16b58b4f5a5eed4d080c357a82fd2f42d09af625c1f5df50650701892"
+SRC_URI[md5sum] = "c35d6ad95b06635a524579e88622fdb5"
+SRC_URI[sha256sum] = "2aa027e837231d2eeea90f3a4afe19948a6eb4c8b2bec0241eba7dbc8106bd16"
-- 
1.8.3.2


