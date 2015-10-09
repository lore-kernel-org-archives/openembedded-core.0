Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 26A1073CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 12:18:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Oct 2015 05:18:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,657,1437462000"; d="scan'208";a="823103628"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2015 05:18:15 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Oct 2015 15:20:55 +0300
Message-Id: <d055ab4f07f6696d82582a0d5b5d300bb7dd1c7f.1444392901.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444392901.git.jussi.kukkonen@intel.com>
References: <cover.1444392901.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/1] gtk+3: gtk3-demo needs libgl
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
X-List-Received-Date: Fri, 09 Oct 2015 12:18:17 -0000

The demo app uses OpenGL (within a GtkGLArea): it needs a runtime
dependency on a GL library. Current GTK+ can only handle
full GL (libGL.so.1) so RDEPEND on libgl.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 558cdd7..54f84fc 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -57,7 +57,7 @@ FILES_${PN}-demo = "${bindir}/gtk3-demo \
 
 # The demo uses PNG files and mime type sniffing, so ensure that these
 # dependencies are present.
-RDEPENDS_${PN}-demo += "gdk-pixbuf-loader-png shared-mime-info"
+RDEPENDS_${PN}-demo += "gdk-pixbuf-loader-png shared-mime-info libgl"
 
 FILES_${PN} = "${bindir}/gtk-update-icon-cache-3.0 \
                ${bindir}/gtk-query-immodules-3.0 \
-- 
2.1.4


