Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TkzcG-0004iw-PW
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 17:02:01 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Dec 2012 07:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,309,1355126400"; d="scan'208";a="233311039"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.212])
	by azsmga001.ch.intel.com with ESMTP; 18 Dec 2012 07:47:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 07:47:13 -0800
Message-Id: <1355845633-16899-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] packagegroup-toolset-native: should not have mesa-dri-glsl-native in this toolset since there are no providers
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
X-List-Received-Date: Tue, 18 Dec 2012 16:02:01 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
index 584271d..5c544ec 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
@@ -154,7 +154,6 @@ DEPENDS = "\
     makedepend-native \
     makedevs-native \
     make-native \
-    mesa-dri-glsl-native \
     mkelfimage-native \
     mkfontdir-native \
     mkfontscale-native \
-- 
1.8.0.2



