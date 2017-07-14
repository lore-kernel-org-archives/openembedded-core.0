Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3590278200
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 12:25:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 14 Jul 2017 05:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,359,1496127600"; d="scan'208";a="1172539123"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2017 05:25:36 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 858035807D9;
	Fri, 14 Jul 2017 05:25:35 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jul 2017 15:25:23 +0300
Message-Id: <d7d5119521edcd1e3ae88eaead817bd6a7a84dd0.1500034432.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1500034432.git.jussi.kukkonen@intel.com>
References: <cover.1500034432.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/4] matchbox-desktop: Upgrade to 2.2
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
X-List-Received-Date: Fri, 14 Jul 2017 12:25:42 -0000

Only change is dropping dependency on gnome-common
(which is deprecated upstream).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{matchbox-desktop_2.1.bb => matchbox-desktop_2.2.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-sato/matchbox-desktop/{matchbox-desktop_2.1.bb => matchbox-desktop_2.2.bb} (87%)

diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
similarity index 87%
rename from meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb
rename to meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
index c9a7b4b..b0cdfa2 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.2.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/desktop.c;endline=20;md5=36c9bf295e6007f3423095f405af5a2d \
                     file://src/main.c;endline=19;md5=2044244f97a195c25b7dc602ac7e9a00"
 
-DEPENDS = "gnome-common-native gtk+3 startup-notification dbus"
+DEPENDS = "gtk+3 startup-notification dbus"
 SECTION = "x11/wm"
 
-# SRCREV tagged 2.1
-SRCREV = "c8473519a0f37488b8b3e839e275b000cdde0b80"
+# SRCREV tagged 2.2
+SRCREV = "6bc67d09da4147e5552fe30011a05a2c59d2f777"
 SRC_URI = "git://git.yoctoproject.org/${BPN}-2 \
            file://vfolders/* \
            "
-- 
2.1.4


