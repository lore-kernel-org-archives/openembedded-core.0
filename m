Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD476FF69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 21:07:39 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2017 13:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,187,1484035200"; d="scan'208";a="826508381"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Feb 2017 13:07:40 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 21:04:26 +0000
Message-Id: <83d230d7da03b762bf71928b3bf9f6844b24768b.1487624625.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1487624625.git.alejandro.hernandez@linux.intel.com>
References: <cover.1487624625.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] eudev: Upgrade to 3.2.1
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
X-List-Received-Date: Mon, 20 Feb 2017 21:07:42 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-core/udev/{eudev_3.2.bb => eudev_3.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/udev/{eudev_3.2.bb => eudev_3.2.1.bb} (95%)

diff --git a/meta/recipes-core/udev/eudev_3.2.bb b/meta/recipes-core/udev/eudev_3.2.1.bb
similarity index 95%
rename from meta/recipes-core/udev/eudev_3.2.bb
rename to meta/recipes-core/udev/eudev_3.2.1.bb
index 11931bc..5e14cad 100644
--- a/meta/recipes-core/udev/eudev_3.2.bb
+++ b/meta/recipes-core/udev/eudev_3.2.1.bb
@@ -20,8 +20,8 @@ SRC_URI = "https://github.com/gentoo/${BPN}/archive/v${PV}.tar.gz \
 "
 UPSTREAM_CHECK_URI = "https://github.com/gentoo/eudev/releases"
 
-SRC_URI[md5sum] = "9eb477cc8718db272b5d24dff1126b04"
-SRC_URI[sha256sum] = "37829d37f4beb7e358ca33abc1ad0907d87f917ce157777aeaeebeacae24efdc"
+SRC_URI[md5sum] = "a2aae16bc432eac0e71c1267c384e295"
+SRC_URI[sha256sum] = "88f530c1540750e6daa91b5eaeebf88e761e6f0c86515c1c28eedfd871f027c6"
 
 inherit autotools update-rc.d qemu pkgconfig
 
-- 
2.6.6


