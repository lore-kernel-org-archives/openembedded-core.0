Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1SO2yD-0005LI-Fd
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 10:25:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Apr 2012 01:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="136424164"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.11])
	by azsmga001.ch.intel.com with ESMTP; 28 Apr 2012 01:15:54 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Apr 2012 16:12:27 +0800
Message-Id: <0e2699350bc053958cc0cc8a256891624d1ac465.1335600691.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1335600691.git.dongxiao.xu@intel.com>
References: <cover.1335600691.git.dongxiao.xu@intel.com>
Subject: [PATCH 3/8] telepathy-glib: upgrade to version 0.18.1
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
X-List-Received-Date: Sat, 28 Apr 2012 08:25:33 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...thy-glib_0.17.5.bb => telepathy-glib_0.18.1.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.17.5.bb => telepathy-glib_0.18.1.bb} (82%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.5.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb
similarity index 82%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.17.5.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb
index 10dcd8b..81da5f8 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.17.5.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb
@@ -7,8 +7,8 @@ PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d436c47689f2709540d849cf5af5ed03"
-SRC_URI[sha256sum] = "011ad936f1d592dbc685073244750303fe2201246b16f9a7fa495cf9f8a3fe8d"
+SRC_URI[md5sum] = "461732739e3fbf8467991bbe661fb29a"
+SRC_URI[sha256sum] = "3738256689e34c22ddf9c4eb33f44ce7505c18fb1a14c53b8e56dd9c262f4c6d"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.4.1



