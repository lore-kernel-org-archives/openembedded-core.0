Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVL-0001Z9-U0
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:08 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2011 22:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="690502015"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2011 22:26:22 -0700
Message-Id: <3a8cc11fff5607197e37397576a8b5c4b7511b30.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Mon, 9 May 2011 14:03:32 -0700
Date: Mon, 09 May 2011 22:26:21 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 17/30] web-sato: Update for svn -> git transtion
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
X-List-Received-Date: Tue, 10 May 2011 05:29:11 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-sato/web/{web_svn.bb => web_git.bb} |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-sato/web/{web_svn.bb => web_git.bb} (72%)

diff --git a/meta/recipes-sato/web/web_svn.bb b/meta/recipes-sato/web/web_git.bb
similarity index 72%
rename from meta/recipes-sato/web/web_svn.bb
rename to meta/recipes-sato/web/web_git.bb
index 0cfe89f..612a02d 100644
--- a/meta/recipes-sato/web/web_svn.bb
+++ b/meta/recipes-sato/web/web_git.bb
@@ -2,18 +2,18 @@ LICENSE = "GPLv2"
 SECTION = "x11"
 DEPENDS = "libxml2 glib-2.0 gtk+ libglade gtkhtml2 curl gconf js libowl"
 DESCRIPTION = "Web is a multi-platform web browsing application."
-PR = "r4"
+PR = "r0"
 
-SRCREV = "131"
-PV = "0.0+svnr${SRCPV}"
+SRCREV = "96da839f65e17ecc6d5261c1d74accd88423dd7a"
+PV = "0.0+git${SRCPV}"
 
-SRC_URI = 	"svn://svn.o-hand.com/repos/${BPN};module=trunk;proto=http \
+SRC_URI = 	"git://git.yoctoproject.org/web-sato;protocol=git \
 		file://owl-window-menu.patch \
 		"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-S = "${WORKDIR}/trunk"
+S = "${WORKDIR}/git"
 
 do_unpack_append () {
 	bb.build.exec_func('do_remove_patches', d)
-- 
1.7.1.1



