Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D2A86770CD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 07 Jun 2016 01:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174619"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:30 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:44 +0300
Message-Id: <972f701e81008d5b2802d233a0b9e3c65c580b1e.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 26/37] gtk+: RRECOMMEND adwaita theme
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:31 -0000

Without this a gtk+2 app appended to an image is going to look awful.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 5bbfe6b..c240baa 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -58,7 +58,14 @@ FILES_libgail = " \
 	${libdir}/gtk-2.0/modules/libferret.so \
 	"
 
-GTKBASE_RRECOMMENDS ?= "liberation-fonts gdk-pixbuf-loader-png gdk-pixbuf-loader-jpeg gdk-pixbuf-loader-gif gdk-pixbuf-loader-xpm shared-mime-info"
+GTKBASE_RRECOMMENDS ?= "liberation-fonts \
+                        gdk-pixbuf-loader-png \
+                        gdk-pixbuf-loader-jpeg \
+                        gdk-pixbuf-loader-gif \
+                        gdk-pixbuf-loader-xpm \
+                        shared-mime-info \
+                        gnome-theme-adwaita \
+                        "
 GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
 
 RRECOMMENDS_${PN} = "${GTKBASE_RRECOMMENDS}"
-- 
2.1.4


