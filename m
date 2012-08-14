Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T1Hcx-00050h-SO
	for openembedded-core@lists.linuxtogo.org;
	Tue, 14 Aug 2012 15:57:48 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Aug 2012 06:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="208191287"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by fmsmga002.fm.intel.com with ESMTP; 14 Aug 2012 06:45:53 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:50:28 +0300
Message-Id: <1344948628-15705-4-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1344948628-15705-1-git-send-email-constantinx.musca@intel.com>
References: <1344948628-15705-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.linuxtogo.org,
	Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 3/3] libxrandr: upgrade to 1.4.0
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
X-List-Received-Date: Tue, 14 Aug 2012 13:57:48 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../{libxrandr_1.3.2.bb => libxrandr_1.4.0.bb}     |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxrandr_1.3.2.bb => libxrandr_1.4.0.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb b/meta/recipes-graphics/xorg-lib/libxrandr_1.4.0.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb
rename to meta/recipes-graphics/xorg-lib/libxrandr_1.4.0.bb
index 6fc3cf5..323c098 100644
--- a/meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxrandr_1.4.0.bb
@@ -9,7 +9,7 @@ specified in the Proceedings of the 2001 Usenix Technical Conference \
 require xorg-lib-common.inc
 
 LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4c5c132d3690478179d78ec3bf064584"
+LIC_FILES_CHKSUM = "file://COPYING;md5=aa33e583cc3e96238a8467b485e62992"
 
 DEPENDS += "virtual/libx11 randrproto libxrender libxext"
 
@@ -20,5 +20,5 @@ XORG_PN = "libXrandr"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "92473da2fccf5fac665be4fa4f2037fa"
-SRC_URI[sha256sum] = "7eaca216ab5233d7396119eb87c1989d350a3efead104d54b55f22cdd1d99b81"
+SRC_URI[md5sum] = "0c843636124cc1494e3d87df16957672"
+SRC_URI[sha256sum] = "033ad0ac2f012afb05268660f6d78705c85f84689f92fa7b47ce12959b15f5c3"
-- 
1.7.9.5



