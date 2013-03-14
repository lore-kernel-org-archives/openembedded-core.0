Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UGCdZ-0003Yd-4o
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:12:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 10:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,845,1355126400"; d="scan'208";a="214773782"
Received: from unknown (HELO dell-desktop.rb.intel.com) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2013 10:55:25 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 19:55:00 +0200
Message-Id: <7d36792043017ecdbc6a32b3a02ced4b9bf7a174.1363283478.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
Subject: [PATCH 01/17] rxvt-unicode: Upgrade to v9.17
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
X-List-Received-Date: Thu, 14 Mar 2013 18:12:26 -0000
X-List-Received-Date: Thu, 14 Mar 2013 18:12:26 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.15.bb => rxvt-unicode_9.17.bb} |    6 +++---
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.15 => rxvt-unicode-9.17}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.15 => rxvt-unicode-9.17}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.15 => rxvt-unicode-9.17}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.15.bb => rxvt-unicode_9.17.bb} (93%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.15/rxvt.desktop b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.17/rxvt.desktop
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.15/rxvt.desktop
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.17/rxvt.desktop
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.15/rxvt.png b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.17/rxvt.png
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.15/rxvt.png
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.17/rxvt.png
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.15/xwc.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.17/xwc.patch
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.15/xwc.patch
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.17/xwc.patch
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.17.bb
similarity index 93%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.17.bb
index 69ef25d..806e354 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.17.bb
@@ -10,15 +10,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "virtual/libx11 libxt libxft gdk-pixbuf"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2 \
 	   file://xwc.patch \
 	   file://rxvt.desktop \
 	   file://rxvt.png"
 
-SRC_URI[md5sum] = "15595aa326167ac5eb68c28d95432faf"
-SRC_URI[sha256sum] = "ec1aa2932da844979ed8140bd92223defb12042aa5e877e05ac31139ca81f2b1"
+SRC_URI[md5sum] = "1270432bdc7ce17dbb07d41a607081e0"
+SRC_URI[sha256sum] = "de017b2b2a1a7182aeada99f605da33cbee18d450e07a7fdabef48da446521e4"
 
 inherit autotools update-alternatives
 
-- 
1.7.9.5



