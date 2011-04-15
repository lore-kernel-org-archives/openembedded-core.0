Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QAbkO-0004gl-1x
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 07:39:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2011 22:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,216,1301900400"; d="scan'208";a="679366835"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by fmsmga002.fm.intel.com with ESMTP; 14 Apr 2011 22:36:53 -0700
Message-Id: <b0a4ba101cd4b69bed3cfcbf037597bd865ce3ed.1302846043.git.ke.yu@intel.com>
In-Reply-To: <cover.1302846043.git.ke.yu@intel.com>
References: <cover.1302846043.git.ke.yu@intel.com>
Old-Date: Thu, 7 Apr 2011 16:36:00 +0800
Date: Fri, 15 Apr 2011 13:44:15 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 3/9] xf86-input-vmmouse: upgrade from 12.6.10 to 12.7.0
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
X-List-Received-Date: Fri, 15 Apr 2011 05:39:12 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 ...use_12.6.10.bb => xf86-input-vmmouse_12.7.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-vmmouse_12.6.10.bb => xf86-input-vmmouse_12.7.0.bb} (64%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.6.10.bb b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb
similarity index 64%
rename from meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.6.10.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb
index 6288507..9535a8f 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.6.10.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_12.7.0.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} += "xf86-input-mouse"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=622841c068a9d7625fbfe7acffb1a8fc"
 
-SRC_URI[md5sum] = "49c6e77851e9f7bc5cb7d85f061992f8"
-SRC_URI[sha256sum] = "a6369d5a860627f2a38842d5563045b263a459e534f6ae08df48f330f9a40910"
+SRC_URI[md5sum] = "dc77181330f983c7d0ec1ea1592c2ca7"
+SRC_URI[sha256sum] = "00e5d527a0d97e6b2a6e8c519e1339427e66fa0a43af026858655c7c62bd9e35"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
-- 
1.7.0.4



