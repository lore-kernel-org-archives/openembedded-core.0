Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 76AB1762B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:23:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2016 05:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,559,1464678000"; d="scan'208";a="751984595"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2016 05:23:27 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 15:23:14 +0300
Message-Id: <067cc55b177901feebd3981cba16d50cef380e52.1471868237.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
References: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1471868237.git.jussi.kukkonen@intel.com>
References: <cover.1471868237.git.jussi.kukkonen@intel.com>
Subject: [PATCH 8/9] wayland-protocols: 1.5 -> 1.7
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
X-List-Received-Date: Mon, 22 Aug 2016 12:23:26 -0000

* xdg-shell unstable v6 (backwards incompatible)
* new unstable protocols xdg-foreign, idle-inhibit

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../wayland/{wayland-protocols_1.5.bb => wayland-protocols_1.7.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.5.bb => wayland-protocols_1.7.bb} (85%)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.5.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.7.bb
similarity index 85%
rename from meta/recipes-graphics/wayland/wayland-protocols_1.5.bb
rename to meta/recipes-graphics/wayland/wayland-protocols_1.7.bb
index 3a40fb2..1d2f0db 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.5.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.7.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "e4279fec1283067706373d4d975be333"
-SRC_URI[sha256sum] = "7d0b426ccaeafc084fc579bb2a139f8ad4ea3492d54b7b0210d124c61fbeb2bf"
+SRC_URI[md5sum] = "9acfc9556f7cfedc44d97af60da66a5f"
+SRC_URI[sha256sum] = "635f2a937d318f1fecb97b54074ca211486e38af943868dd0fa82ea38d091c1f"
 
 inherit allarch autotools pkgconfig
 
-- 
2.1.4


