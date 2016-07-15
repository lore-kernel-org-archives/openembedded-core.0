Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0133B606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 10:41:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2016 03:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,367,1464678000"; d="scan'208";a="1017432536"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2016 03:41:52 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 13:41:41 +0300
Message-Id: <25b3f922c187722bc62a57610516064651cf2e1a.1468578590.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <8673f0535cc7b0698e4d900b79f06975dd8670c1.1468578590.git.jussi.kukkonen@intel.com>
References: <8673f0535cc7b0698e4d900b79f06975dd8670c1.1468578590.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468578590.git.jussi.kukkonen@intel.com>
References: <cover.1468578590.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/8] wayland: Upgrade 1.10.0 -> 1.11.0
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
X-List-Received-Date: Fri, 15 Jul 2016 10:41:53 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-graphics/wayland/{wayland_1.10.0.bb => wayland_1.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.10.0.bb => wayland_1.11.0.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.10.0.bb b/meta/recipes-graphics/wayland/wayland_1.11.0.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/wayland_1.10.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.11.0.bb
index 41d08b7..08d2b2c 100644
--- a/meta/recipes-graphics/wayland/wayland_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.11.0.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
                     file://src/wayland-server.c;endline=24;md5=b8e046164a766bb1ede8ba38e9dcd7ce"
 
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "e7751c38807c231afaba9d6b68f2a2b7"
-SRC_URI[sha256sum] = "4bf6e790aa6f50ab3825676282ecd75850ec9c4767af96ecb7127b1f3c3d60dc"
+SRC_URI[md5sum] = "fccf680be066e234729d5b69e0bd0fa9"
+SRC_URI[sha256sum] = "9540925f7928becfdf5e3b84c70757f6589bf1ceef09bea78784d8e4772c0db0"
 
 EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
 
-- 
2.1.4


