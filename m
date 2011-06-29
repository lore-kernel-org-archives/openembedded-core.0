Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QboWN-0005gs-EY
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 08:45:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jun 2011 23:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,442,1304319600"; d="scan'208";a="24130180"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jun 2011 23:41:28 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 14:39:46 +0800
Message-Id: <b97dced399d09fa30685656dbd354fcab65b8ba7.1309329457.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309329457.git.edwin.zhai@intel.com>
References: <cover.1309329457.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1309329457.git.edwin.zhai@intel.com>
References: <cover.1309329457.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] web-webkit: recommends glib-networking to access https web page
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
X-List-Received-Date: Wed, 29 Jun 2011 06:45:11 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

It is required by libsoup for TLS support.

[YOCTO #1037] got fixed

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-sato/web/web-webkit_svn.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-sato/web/web-webkit_svn.bb b/meta/recipes-sato/web/web-webkit_svn.bb
index a625929..2f79e0a 100644
--- a/meta/recipes-sato/web/web-webkit_svn.bb
+++ b/meta/recipes-sato/web/web-webkit_svn.bb
@@ -8,9 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 SECTION = "x11"
 DEPENDS = "libxml2 glib-2.0 gtk+ libglade webkit-gtk curl gconf js libowl"
 
+# To access https web pages
+RRECOMMENDS_${PN} += "glib-networking"
+
 SRCREV = "130"
 PV = "0.0+svnr${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "svn://svn.o-hand.com/repos/web/branches;module=webkit;proto=http \
            file://link-with-g++.patch \
-- 
1.7.1



