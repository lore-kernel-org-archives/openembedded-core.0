Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAlZ-0001oi-KB
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Apr 2011 00:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="423747767"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by azsmga001.ch.intel.com with ESMTP; 22 Apr 2011 00:24:35 -0700
Message-Id: <8b39a25a418671c83a2a3d5a183632bcfcbbe879.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 13:32:55 +0800
Date: Fri, 22 Apr 2011  0:24:34 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 06/33] libgpg-error: Upgrade to 1.10 (from 1.9)
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
X-List-Received-Date: Fri, 22 Apr 2011 07:27:01 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../pkgconfig.patch                                |    2 ++
 .../{libgpg-error_1.9.bb => libgpg-error_1.10.bb}  |    6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error-1.9 => libgpg-error-1.10}/pkgconfig.patch (98%)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.9.bb => libgpg-error_1.10.bb} (82%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error-1.9/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error-1.10/pkgconfig.patch
similarity index 98%
rename from meta/recipes-support/libgpg-error/libgpg-error-1.9/pkgconfig.patch
rename to meta/recipes-support/libgpg-error/libgpg-error-1.10/pkgconfig.patch
index 49e47d8..2764012 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error-1.9/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error-1.10/pkgconfig.patch
@@ -3,6 +3,8 @@
 # Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
 #
 
+Upstream-Status: Pending
+
 Index: libgpg-error-1.8/configure.ac
 ===================================================================
 --- libgpg-error-1.8.orig/configure.ac	2010-05-06 06:01:08.000000000 -0700
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
similarity index 82%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
index 560340b..6dea084 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.9.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
@@ -13,10 +13,10 @@ SECTION = "libs"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
-           file://pkgconfig.patch;"
+           file://pkgconfig.patch"
 
-SRC_URI[md5sum] = "521b98aa9395e7eaf0ef2236233a0796"
-SRC_URI[sha256sum] = "54d9326bfbd46c705963c507953f65a40576d04b374e131008dc5b732ff1e3c3"
+SRC_URI[md5sum] = "736a03daa9dc5873047d4eb4a9c22a16"
+SRC_URI[sha256sum] = "520629b4568b5c29b1991c8ffc267c8bdee5f223c7333c42a651b56f9b1c5431"
 
 # move libgpg-error-config into -dev package
 FILES_${PN} = "${libdir}/lib*.so.*"
-- 
1.7.1



