Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T8Zth-0001Sa-Sd
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 18:53:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Sep 2012 09:40:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,360,1344236400"; d="scan'208";a="188269402"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.156])
	by azsmga001.ch.intel.com with ESMTP; 03 Sep 2012 09:40:35 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 18:45:24 +0300
Message-Id: <2cb1fef9500e002dce12b7fbc69a66840f39ae1d.1346686600.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1346686600.git.constantinx.musca@intel.com>
References: <cover.1346686600.git.constantinx.musca@intel.com>
Subject: [PATCH 9/9] iproute2: upgrade to 3.5.1
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
X-List-Received-Date: Mon, 03 Sep 2012 16:53:14 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../configure-cross.patch                          |    0
 .../{iproute2_3.5.0.bb => iproute2_3.5.1.bb}       |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2-3.5.0 => iproute2-3.5.1}/configure-cross.patch (100%)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.5.0.bb => iproute2_3.5.1.bb} (51%)

diff --git a/meta/recipes-connectivity/iproute2/iproute2-3.5.0/configure-cross.patch b/meta/recipes-connectivity/iproute2/iproute2-3.5.1/configure-cross.patch
similarity index 100%
rename from meta/recipes-connectivity/iproute2/iproute2-3.5.0/configure-cross.patch
rename to meta/recipes-connectivity/iproute2/iproute2-3.5.1/configure-cross.patch
diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.5.0.bb b/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
similarity index 51%
rename from meta/recipes-connectivity/iproute2/iproute2_3.5.0.bb
rename to meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
index 1e8b073..fc7292e 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_3.5.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
@@ -5,5 +5,5 @@ PR = "r0"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
            file://configure-cross.patch"
 
-SRC_URI[md5sum] = "ab1fc3512c852ba0a929f6e589804e78"
-SRC_URI[sha256sum] = "ea885642b1d9f8c843a325b85926a75bd36fb4801b37c7707cbd397fb120aa3d"
+SRC_URI[md5sum] = "d4425b44edd5eacd6099e672e4baacbf"
+SRC_URI[sha256sum] = "36f2674e5436289f3ccfb0a58707aca9dcfa295d06afc36d2117674508f5ef72"
-- 
1.7.9.5



