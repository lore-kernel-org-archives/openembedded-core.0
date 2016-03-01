Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 111097319C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 02:53:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 29 Feb 2016 18:53:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="914041432"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2016 18:53:03 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 02:53:00 +0000
Message-Id: <be31dc4a1a173b68cbea64d9db4f8271b6ba3a32.1456800675.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1456800675.git.alejandro.hernandez@linux.intel.com>
References: <cover.1456800675.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 2/4] libgudev: Fix for new eudev implementation
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
X-List-Received-Date: Tue, 01 Mar 2016 02:53:03 -0000

systemd is not a necessary feature for libgudev anymore since we are
providing eudev as an alternative to udev

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-gnome/libgudev/libgudev_230.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/libgudev/libgudev_230.bb b/meta/recipes-gnome/libgudev/libgudev_230.bb
index ea8e82c..c61316b 100644
--- a/meta/recipes-gnome/libgudev/libgudev_230.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_230.bb
@@ -10,6 +10,5 @@ RCONFLICTS_${PN} = "systemd (<= 220)"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-inherit gnomebase distro_features_check
+inherit gnomebase
 
-REQUIRED_DISTRO_FEATURES = "systemd"
-- 
2.6.2


