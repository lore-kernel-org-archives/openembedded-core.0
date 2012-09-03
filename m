Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T8ZtK-0001A9-9z
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 18:52:51 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Sep 2012 09:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,360,1344236400"; d="scan'208";a="188269383"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by azsmga001.ch.intel.com with ESMTP; 03 Sep 2012 09:40:30 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 18:45:21 +0300
Message-Id: <4a7720964338b9ec7d88db45616a34e4ddc65b56.1346686600.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
Subject: [PATCH 6/9] telepathy-glib: upgrade to 0.19.8
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
X-List-Received-Date: Mon, 03 Sep 2012 16:52:51 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 ...thy-glib_0.19.6.bb => telepathy-glib_0.19.8.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.6.bb => telepathy-glib_0.19.8.bb} (80%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.6.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb
similarity index 80%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.19.6.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb
index 37be67c..2b072bb 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.6.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.8.bb
@@ -7,8 +7,8 @@ PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5fa6ecdb3f2b2a18d9a707e5d09fa8c7"
-SRC_URI[sha256sum] = "9fdb1260f4df7a89ff5245ffa72c0331f77affd2cd58cca3714bcfaa5bf473a8"
+SRC_URI[md5sum] = "ffd0953953981473fcd9c373ccb9e882"
+SRC_URI[sha256sum] = "581682a937ee33bd4ce01e17d09b338155a79dff44925b988b0701fdbee50b20"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.9.5



