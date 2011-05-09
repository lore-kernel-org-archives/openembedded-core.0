Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUC-0003hO-9t
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2011 23:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="744305229"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2011 23:59:47 -0700
Message-Id: <913e5234633ce80df250130e44be589cf252a183.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 19:09:05 -0700
Date: Sun, 08 May 2011 23:59:47 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 03/20] gtkhtml2, web: Sync version for API Change
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 May 2011 07:02:32 -0000

From: Saul Wold <sgw@linux.intel.com>

Sync up the css_parser API between web and gtkhtml2

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb |    2 +-
 meta/recipes-sato/web/web_svn.bb            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
index 33b6fea..1e4e012 100644
--- a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
+++ b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
@@ -8,7 +8,7 @@ SRCREV = "1144"
 PV = "2.11.0+svnr${SRCPV}"
 PR = "r1"
 
-SRC_URI = "svn://anonymous@svn.gnome.org/svn/gtkhtml2/;module=trunk \
+SRC_URI = "svn://svn.gnome.org/svn/gtkhtml2/;module=trunk;proto=http \
 	http://svn.o-hand.com/repos/web/trunk/patches/at-import_box-pos.patch;patch=1;pnum=0;maxrev=1157;name=patch1 \
 	http://svn.o-hand.com/repos/web/trunk/patches/css-stylesheet-user.patch;patch=1;pnum=0;maxrev=1157;name=patch2 \
 	http://svn.o-hand.com/repos/web/trunk/patches/css-media.patch;patch=1;pnum=0;maxrev=1157;name=patch3 \
diff --git a/meta/recipes-sato/web/web_svn.bb b/meta/recipes-sato/web/web_svn.bb
index 204532f..0cfe89f 100644
--- a/meta/recipes-sato/web/web_svn.bb
+++ b/meta/recipes-sato/web/web_svn.bb
@@ -4,7 +4,7 @@ DEPENDS = "libxml2 glib-2.0 gtk+ libglade gtkhtml2 curl gconf js libowl"
 DESCRIPTION = "Web is a multi-platform web browsing application."
 PR = "r4"
 
-SRCREV = "129"
+SRCREV = "131"
 PV = "0.0+svnr${SRCPV}"
 
 SRC_URI = 	"svn://svn.o-hand.com/repos/${BPN};module=trunk;proto=http \
-- 
1.7.1.1



