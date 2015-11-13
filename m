Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1DED4772C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:44:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 01:44:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686917"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:44:07 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:59 +0200
Message-Id: <49e9eb9e067080e01e5266f2417f643a6a9970f0.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
References: <b4fe5f127cf4ee60ee730ca6467acb20132f890a.1447405312.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1447405312.git.jussi.kukkonen@intel.com>
References: <cover.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCH 14/19] xf86-input-evdev: Upgrade 2.9.2 -> 2.10.0
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
X-List-Received-Date: Fri, 13 Nov 2015 09:44:07 -0000

This version installs the 10-evdev.conf configuration file
that is no longer included in xserver-xorg.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-evdev_2.9.2.bb => xf86-input-evdev_2.10.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.9.2.bb => xf86-input-evdev_2.10.0.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.9.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.0.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.9.2.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.0.bb
index 66428df..3d06f03 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.9.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.0.bb
@@ -16,5 +16,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
 DEPENDS += "mtdev libevdev"
 
-SRC_URI[md5sum] = "99eebf171e6c7bffc42d4fc430d47454"
-SRC_URI[sha256sum] = "792329b531afc6928ccda94e4b51a5520d4ddf8ef9a00890a5d0d31898acefec"
+SRC_URI[md5sum] = "b1183c55125981d346102d1be704760b"
+SRC_URI[sha256sum] = "d097298eb07b7a9edf4493b5c3c058041458ca52c8c62dbd4f40b84c5086d117"
-- 
2.1.4


