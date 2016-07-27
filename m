Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F13A660746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:03:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2016 06:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,429,1464678000"; d="scan'208";a="1024872047"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 27 Jul 2016 06:03:44 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 7F6226A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 06:03:31 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 16:02:52 +0300
Message-Id: <1469624577-24972-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
References: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/9] wayland-protocols : upgrade to 1.5
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
X-List-Received-Date: Wed, 27 Jul 2016 13:03:42 -0000

1.4 -> 1.5

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../wayland/{wayland-protocols_1.4.bb => wayland-protocols_1.5.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.4.bb => wayland-protocols_1.5.bb} (85%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.4.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.5.bb
similarity index 85%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.4.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.5.bb
index fcc156f..3a40fb2 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.4.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.5.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "fd8089abf13a1d04e4baa6509ee72baf"
-SRC_URI[sha256sum] = "014a9a23c21ed14f49b1005b3e8efa66d6337d4ceafc97f7b0d6707e7e3df572"
+SRC_URI[md5sum] = "e4279fec1283067706373d4d975be333"
+SRC_URI[sha256sum] = "7d0b426ccaeafc084fc579bb2a139f8ad4ea3492d54b7b0210d124c61fbeb2bf"
 
 inherit allarch autotools pkgconfig
 
-- 
2.4.0


