Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q5eoM-0002oM-36
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 15:54:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Apr 2011 06:52:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,282,1299484800"; d="scan'208";a="904497872"
Received: from unknown (HELO localhost) ([10.255.12.172])
	by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2011 06:52:39 -0700
Message-Id: <b136a1104b381dca04f7fa41f0caedc33d90a4f2.1301665368.git.josh@linux.intel.com>
In-Reply-To: <cover.1301665368.git.josh@linux.intel.com>
References: <cover.1301665368.git.josh@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 01:05:01 +0100
Date: Fri, 01 Apr 2011 14:52:17 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 3/7] libx11: add missing SRC_URI hashes
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
X-List-Received-Date: Fri, 01 Apr 2011 13:54:57 -0000

From: Joshua Lock <josh@linux.intel.com>

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
index aaeb38e..c572d5e 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
@@ -10,6 +10,9 @@ SRC_URI += "file://x11_disable_makekeys.patch \
             file://nodolt.patch \
             file://include_fix.patch"
 
+SRC_URI[md5sum] = "f65c9c7ecbfb64c19dbd7927160d63fd"
+SRC_URI[sha256sum] = "88d7238ce5f7cd123450567de7a3b56a43556e4ccc45df38b8324147c889a844"
+
 DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native gettext"
 
-- 
1.7.4.1



