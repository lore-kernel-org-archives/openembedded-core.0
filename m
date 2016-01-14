Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E9751731BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:23:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 14 Jan 2016 05:23:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="893103314"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2016 05:23:38 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:27:57 +0200
Message-Id: <5ea9869ac7f8f359773f8862a358237ba0cc482d.1452777133.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
References: <b5b7c6947b4c54966087ad6c21b9fab79da1fa1e.1452777133.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1452777133.git.jussi.kukkonen@intel.com>
References: <cover.1452777133.git.jussi.kukkonen@intel.com>
Subject: [PATCH 9/9] xf86-input-evdev: upgrade to 2.10.1
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
X-List-Received-Date: Thu, 14 Jan 2016 13:23:41 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-input-evdev_2.10.0.bb => xf86-input-evdev_2.10.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.10.0.bb => xf86-input-evdev_2.10.1.bb} (83%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.1.bb
similarity index 83%
rename from meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.1.bb
index 3d06f03..cf77ad2 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.10.1.bb
@@ -16,5 +16,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
 DEPENDS += "mtdev libevdev"
 
-SRC_URI[md5sum] = "b1183c55125981d346102d1be704760b"
-SRC_URI[sha256sum] = "d097298eb07b7a9edf4493b5c3c058041458ca52c8c62dbd4f40b84c5086d117"
+SRC_URI[md5sum] = "96d89d9406a02f5e36bdaa4edd9a243a"
+SRC_URI[sha256sum] = "af9c2b47f5b272ae56b45da6bd84610fc9a3d80a4b32c8215842a39d862de017"
-- 
2.1.4


