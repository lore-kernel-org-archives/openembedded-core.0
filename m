Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpFy-0003uj-B4
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:21 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:41 -0700
Message-Id: <2fecb5512c139862e286443bef85e833394278ad.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Subject: [PATCH 12/30] mklibs-native: Update to 0.1.33
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
X-List-Received-Date: Wed, 18 May 2011 22:30:18 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../mklibs/files/ac_init_fix.patch                 |    2 ++
 .../mklibs/files/fix_STT_GNU_IFUNC.patch           |    3 +++
 ...bs-native_0.1.31.bb => mklibs-native_0.1.33.bb} |    2 +-
 3 files changed, 6 insertions(+), 1 deletions(-)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.31.bb => mklibs-native_0.1.33.bb} (98%)

diff --git a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch b/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
index 7325931..422af10 100644
--- a/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
+++ b/meta/recipes-devtools/mklibs/files/ac_init_fix.patch
@@ -2,6 +2,8 @@ Get the version of mklibs by simpler means. The MKLIBS_VERSION string in the
 configure.ac file is replaced with real version string by the 
 do_configure_prepend() function from the recipe .bb file.
 
+Upstream-Status: Inappropriate [configuration]
+
 Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/01/24
 
diff --git a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch b/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
index 88badde..d27a489 100644
--- a/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
+++ b/meta/recipes-devtools/mklibs/files/fix_STT_GNU_IFUNC.patch
@@ -1,5 +1,8 @@
 The libc6-dev in Ubuntu 9.04 is so old that the elf.h doesn't
 define STT_GNU_IFUNC, so we have to define it ourselves.
+
+Upstream-Status: Inappropriate [other] - old release specific, maybe removable
+
 -- Dexuan Cui (dexuan.cui@intel.com) Feb 16, 2011.
 
 diff --git a/src/mklibs-readelf/main.cpp b/src/mklibs-readelf/main.cpp
diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.31.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.33.bb
similarity index 98%
rename from meta/recipes-devtools/mklibs/mklibs-native_0.1.31.bb
rename to meta/recipes-devtools/mklibs/mklibs-native_0.1.33.bb
index 7f4afc0..cac7b91 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.31.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.33.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
 DEPENDS = "python-native"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.gz \
 	file://ac_init_fix.patch\
-- 
1.7.3.4



