Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A9F80770C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 14:30:42 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2016 07:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,581,1464678000"; 
   d="scan'208";a="1525586"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 26 Aug 2016 07:30:42 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 17:28:33 +0300
Message-Id: <deffea5772b2e5a8b1145d74d88ef1b0ec383787.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 18/28] gnome-desktop3: enable gtk-doc
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
X-List-Received-Date: Fri, 26 Aug 2016 14:30:43 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.20.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.20.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.20.2.bb
index a58585b..eb061b2 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.20.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.20.2.bb
@@ -12,7 +12,7 @@ SRC_URI[archive.sha256sum] = "492c2da7aa8c3a8b65796e8171fc8f0dfb5d322dd2799c0d76
 
 DEPENDS += "intltool-native gsettings-desktop-schemas gconf libxrandr virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes"
 
-inherit distro_features_check
+inherit distro_features_check gtk-doc
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = "--disable-desktop-docs"
-- 
2.9.3


