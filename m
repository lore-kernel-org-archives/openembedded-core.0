Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T1Hcu-00050h-40
	for openembedded-core@lists.linuxtogo.org;
	Tue, 14 Aug 2012 15:57:44 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Aug 2012 06:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="208191262"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by fmsmga002.fm.intel.com with ESMTP; 14 Aug 2012 06:45:49 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:50:27 +0300
Message-Id: <1344948628-15705-3-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1344948628-15705-1-git-send-email-constantinx.musca@intel.com>
References: <1344948628-15705-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.linuxtogo.org,
	Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 2/3] randrproto: upgrade to 1.4.0
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
X-List-Received-Date: Tue, 14 Aug 2012 13:57:44 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../{randrproto_1.3.2.bb => randrproto_1.4.0.bb}   |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{randrproto_1.3.2.bb => randrproto_1.4.0.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-proto/randrproto_1.3.2.bb b/meta/recipes-graphics/xorg-proto/randrproto_1.4.0.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-proto/randrproto_1.3.2.bb
rename to meta/recipes-graphics/xorg-proto/randrproto_1.4.0.bb
index 17b709f..4129030 100644
--- a/meta/recipes-graphics/xorg-proto/randrproto_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-proto/randrproto_1.4.0.bb
@@ -7,14 +7,14 @@ Rotate and Reflect extension.  This extension provides the ability to \
 resize, rotate and reflect the root window of a screen."
 
 LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5fa3f85d9eefaa3a945071485be11343 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=00426d41bd3d9267cf9bbb2df9323a5e \
                     file://randrproto.h;endline=30;md5=3885957c6048fdf3310ac8ba54ca2c3f"
 
 RCONFLICTS_${PN} = "randrext"
-PR = "r1"
+PR = "r0"
 PE = "1"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "597491c0d8055e2a66f11350c4985775"
-SRC_URI[sha256sum] = "d90d00612cc49292bd8d9dc19efb1c9187385fbe87590d7279a02e5e1066dc71"
+SRC_URI[md5sum] = "ce4d0b05675968e4c83e003cc809660d"
+SRC_URI[sha256sum] = "85c42e8c66a55318ddaf2ce5727beacb25cb1f8555229f778cd1da86478209cf"
-- 
1.7.9.5



