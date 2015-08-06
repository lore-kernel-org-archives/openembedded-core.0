Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5D72C75C5B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 08:40:40 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 06 Aug 2015 01:40:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="536995321"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Aug 2015 01:40:40 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 11:42:00 +0300
Message-Id: <29f1e0392fbe4325b13dac7e0fca69319825da76.1438849692.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2c93029d78af982ced18f114b4ed6e09ef350b00.1438849692.git.jussi.kukkonen@intel.com>
References: <2c93029d78af982ced18f114b4ed6e09ef350b00.1438849692.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1438849692.git.jussi.kukkonen@intel.com>
References: <cover.1438849692.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/6] vte: Fix LICENSE to LGPL2.0
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
X-List-Received-Date: Thu, 06 Aug 2015 08:40:40 -0000

Current releases of vte are LGPL 2.1+ but the one we have is still
LGPL 2.0.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/vte/vte.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 4081a7f..874062a 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -1,6 +1,6 @@
 SUMMARY = "Virtual terminal emulator GTK+ widget library"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
-LICENSE = "LGPLv2.1+"
+LICENSE = "LGPLv2.0"
 DEPENDS = " glib-2.0 gtk+ intltool-native ncurses gobject-introspection-stub"
 RDEPENDS_libvte = "vte-termcap"
 
-- 
2.1.4


