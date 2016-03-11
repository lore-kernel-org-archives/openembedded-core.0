Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4C373218
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:07:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 11 Mar 2016 05:07:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="907975046"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2016 05:06:56 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 15:12:21 +0200
Message-Id: <4b057ea89e8c68fb6de0fccfd102358d0a5435b7.1457698804.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
References: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1457698804.git.jussi.kukkonen@intel.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
Subject: [RFC PATCH 02/12] packagegroup-core-x11-sato: Update for GTK3 changes
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
X-List-Received-Date: Fri, 11 Mar 2016 13:07:08 -0000

The keyboard/IM is not yet ported, not including it in packagegroup.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 8ba4923..3dfe55c 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -26,14 +26,10 @@ SUMMARY_${PN}-base = "Sato desktop - base packages"
 RDEPENDS_${PN}-base = "\
     matchbox-desktop \
     matchbox-session-sato \
-    matchbox-keyboard \
-    matchbox-keyboard-applet \
-    matchbox-keyboard-im \
-    matchbox-config-gtk \
     xcursor-transparent-theme \
     sato-icon-theme \
+    gnome-theme-adwaita \
     settings-daemon \
-    gtk-sato-engine \
     shutdown-desktop \
     libsdl \
     ${NETWORK_MANAGER} \
-- 
2.1.4


