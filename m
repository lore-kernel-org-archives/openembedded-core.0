Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QW9R7-0004yk-NV
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:52:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Jun 2011 08:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,359,1304319600"; d="scan'208";a="11944448"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 13 Jun 2011 08:48:55 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2011 23:48:33 +0800
Message-Id: <4248dd920b503b4981310e925ce7238dfbbe3660.1307979545.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
References: <d4faff15427f5ece20d771f086358c167de0776a.1307979545.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1307979545.git.dexuan.cui@intel.com>
References: <cover.1307979545.git.dexuan.cui@intel.com>
Subject: [PATCH 08/13] glproto: upgrade from 1.4.12 to the latest version 1.4.13
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
X-List-Received-Date: Mon, 13 Jun 2011 15:52:22 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{glproto_1.4.12.bb => glproto_1.4.13.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-proto/{glproto_1.4.12.bb => glproto_1.4.13.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-proto/glproto_1.4.12.bb b/meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-proto/glproto_1.4.12.bb
rename to meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb
index 7b32e70..38b17b6 100644
--- a/meta/recipes-graphics/xorg-proto/glproto_1.4.12.bb
+++ b/meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb
@@ -15,5 +15,5 @@ PE = "1"
 
 BBCLASSEXTEND = "nativesdk"
 
-SRC_URI[md5sum] = "55edc5ff2efb734215c868f72f7cf27e"
-SRC_URI[sha256sum] = "48be7a9d190b600210e5ad08b4e8862a6b08e72dc52dbdf324716a888eb457de"
+SRC_URI[md5sum] = "9542f2d36751a8ad7eae9d8e176f70d4"
+SRC_URI[sha256sum] = "fc0a94d4df003cb6b6953173e6498d9c4c3268ee24bcc46a1172a1e1dbd3d742"
-- 
1.7.1



