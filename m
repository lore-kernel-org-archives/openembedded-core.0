Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5L-0004Vi-Bt
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:42:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736789"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:42:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:33 -0700
Message-Id: <cc156badafe1e42653b9eb080c0dffd47d2a6130.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/18] web-webkit: remove unused dependencies (taken from the gecko-based recipe)
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
X-List-Received-Date: Wed, 18 Jul 2012 07:54:15 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-sato/web/web-webkit_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/web/web-webkit_git.bb b/meta/recipes-sato/web/web-webkit_git.bb
index 2af12bc..57cd545 100644
--- a/meta/recipes-sato/web/web-webkit_git.bb
+++ b/meta/recipes-sato/web/web-webkit_git.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 SECTION = "x11"
-DEPENDS = "libxml2 glib-2.0 gtk+ libglade webkit-gtk curl gconf js libowl"
+DEPENDS = "glib-2.0 gtk+ webkit-gtk libowl"
 
 # To access https web pages
 RRECOMMENDS_${PN} += "glib-networking"
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--enable-libowl"
 
-inherit autotools pkgconfig gconf
+inherit autotools pkgconfig
 
 do_configure_prepend() {
     touch ${S}/src/dummy.cpp
-- 
1.7.7.6



