Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9FED7772B4
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:42:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 24 Jan 2017 02:42:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="926009118"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 24 Jan 2017 02:42:35 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 079E46A4006;
	Tue, 24 Jan 2017 02:41:37 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 12:42:22 +0200
Message-Id: <2f838dda3c6645d03a86c270770015cb7491dc62.1485249527.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485249527.git.jussi.kukkonen@intel.com>
References: <cover.1485249527.git.jussi.kukkonen@intel.com>
Subject: [PATCH 9/9] xserver-xorg: Upgrade 1.19.0 -> 1.19.1
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
X-List-Received-Date: Tue, 24 Jan 2017 10:42:34 -0000

Point release with bug fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../xorg-xserver/{xserver-xorg_1.19.0.bb => xserver-xorg_1.19.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.19.0.bb => xserver-xorg_1.19.1.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.0.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
index 8725382..987a2be 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.0.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.1.bb
@@ -4,8 +4,8 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch \
             file://0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch \
             "
-SRC_URI[md5sum] = "6a4d01e4e5047ab8f556960424ba1fa9"
-SRC_URI[sha256sum] = "149a708b50befc2d5a40b98d45ddd2ebe0beec018e6d0c663c43bad6210e4da3"
+SRC_URI[md5sum] = "caa8ee7b2950abbf734347d137529fb6"
+SRC_URI[sha256sum] = "79ae2cf39d3f6c4a91201d8dad549d1d774b3420073c5a70d390040aa965a7fb"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.1.4


