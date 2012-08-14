Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T1Hcr-00050h-UP
	for openembedded-core@lists.linuxtogo.org;
	Tue, 14 Aug 2012 15:57:42 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Aug 2012 06:45:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="208191235"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by fmsmga002.fm.intel.com with ESMTP; 14 Aug 2012 06:45:47 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:50:26 +0300
Message-Id: <1344948628-15705-2-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1344948628-15705-1-git-send-email-constantinx.musca@intel.com>
References: <1344948628-15705-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.linuxtogo.org,
	Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 1/3] pciutils: upgrade to 3.1.10
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
X-List-Received-Date: Tue, 14 Aug 2012 13:57:42 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../configure.patch                                |    0
 .../guess-fix.patch                                |    0
 .../lib-build-fix.patch                            |    0
 .../makefile.patch                                 |    0
 .../pcimodules-pciutils.diff                       |    0
 .../{pciutils_3.1.9.bb => pciutils_3.1.10.bb}      |    4 ++--
 6 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/configure.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/guess-fix.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/lib-build-fix.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/makefile.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.9 => pciutils-3.1.10}/pcimodules-pciutils.diff (100%)
 rename meta/recipes-bsp/pciutils/{pciutils_3.1.9.bb => pciutils_3.1.10.bb} (92%)

diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.9/configure.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.10/configure.patch
similarity index 100%
rename from meta/recipes-bsp/pciutils/pciutils-3.1.9/configure.patch
rename to meta/recipes-bsp/pciutils/pciutils-3.1.10/configure.patch
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.9/guess-fix.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.10/guess-fix.patch
similarity index 100%
rename from meta/recipes-bsp/pciutils/pciutils-3.1.9/guess-fix.patch
rename to meta/recipes-bsp/pciutils/pciutils-3.1.10/guess-fix.patch
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.9/lib-build-fix.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.10/lib-build-fix.patch
similarity index 100%
rename from meta/recipes-bsp/pciutils/pciutils-3.1.9/lib-build-fix.patch
rename to meta/recipes-bsp/pciutils/pciutils-3.1.10/lib-build-fix.patch
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.9/makefile.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.10/makefile.patch
similarity index 100%
rename from meta/recipes-bsp/pciutils/pciutils-3.1.9/makefile.patch
rename to meta/recipes-bsp/pciutils/pciutils-3.1.10/makefile.patch
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.9/pcimodules-pciutils.diff b/meta/recipes-bsp/pciutils/pciutils-3.1.10/pcimodules-pciutils.diff
similarity index 100%
rename from meta/recipes-bsp/pciutils/pciutils-3.1.9/pcimodules-pciutils.diff
rename to meta/recipes-bsp/pciutils/pciutils-3.1.10/pcimodules-pciutils.diff
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb b/meta/recipes-bsp/pciutils/pciutils_3.1.10.bb
similarity index 92%
rename from meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.1.10.bb
index 2c969d9..e405101 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.1.10.bb
@@ -18,8 +18,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
            file://guess-fix.patch \
            file://makefile.patch"
 
-SRC_URI[md5sum] = "79cc1d0bff8603d3a550fa63802cd1db"
-SRC_URI[sha256sum] = "e4ce5d56ae4a9611d51ba0cc2ea45806f9539a18aceb4aa70b8ded50f6923c4f"
+SRC_URI[md5sum] = "3a5d8b2784c8571dc5557efda4a8c157"
+SRC_URI[sha256sum] = "f402c2051d9b027799a36f17c5e1750dcb4f07070ec46e79108901d03a83aa75"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.9.5



