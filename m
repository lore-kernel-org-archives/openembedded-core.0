Return-Path: <roxana.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 40C6970EE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 15:55:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Aug 2014 08:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,405,1406617200"; d="scan'208";a="563662602"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.66])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2014 08:54:52 -0700
From: Ciobanu Roxana <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 18:54:45 +0300
Message-Id: <b368cdff795e4c6ee8a9face716c62cadf8e4f7e.1409068268.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409068268.git.roxana.ciobanu@intel.com>
References: <cover.1409068268.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1409068268.git.roxana.ciobanu@intel.com>
References: <cover.1409068268.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] xf86-input-synaptics: upgrade to 1.8.0
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
X-List-Received-Date: Tue, 26 Aug 2014 15:55:07 -0000

    The two main changes in this release:
    - the eventcomm backend uses libevdev, we recommend libevdev 1.2 or newer
    - support for a secondary software button area for the Lenovo *40 series
    (T440, T540, X240, Helix, Yoga, ...).

Signed-off-by: Ciobanu Roxana <roxana.ciobanu@intel.com>
---
 ...{xf86-input-synaptics_1.7.4.bb => xf86-input-synaptics_1.8.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.7.4.bb => xf86-input-synaptics_1.8.0.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.4.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.0.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.4.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.0.bb
index 8045790..dc3b6b5 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.7.4.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.8.0.bb
@@ -12,9 +12,9 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
-SRC_URI[md5sum] = "deaa740072c19fef8e2fb1d7787392b7"
-SRC_URI[sha256sum] = "56a2d2df7bd39e29f56102c62f153e023f3e9b2f5e255309d33fab8e81945af7"
+SRC_URI[md5sum] = "27a3f2b31606a13dd6b58d419978d64f"
+SRC_URI[sha256sum] = "9bf27632aaa6c5e62621ca9c2ca00f9b309c85b039ee33cd592b189fc872c37a"
 
-DEPENDS += "libxi mtdev libxtst"
+DEPENDS += "libxi mtdev libxtst libevdev"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
1.9.1


