Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qu9hg-0006Yw-Mx
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 23:00:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 13:55:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,247,1312182000"; d="scan'208";a="39980201"
Received: from unknown (HELO swold-MOBL.local) ([10.255.13.226])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 13:55:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2011 13:55:23 -0700
Message-Id: <0d883b5df25635fbad45191d297cbdf78a6c1fe0.1313700595.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/32] glib-2.0: explicitly disable dtrace and systemtap for native varaint
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
X-List-Received-Date: Thu, 18 Aug 2011 21:00:41 -0000

From: Joshua Lock <josh@linux.intel.com>

This prevents systemtap and dtrace being picked up from the host as
reported on the Yocto mailing list by Andre Haupt <andre@bitwigglers.org>

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index e25db3d..fdbfa54 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -26,7 +26,7 @@ inherit autotools pkgconfig gettext
 S = "${WORKDIR}/glib-${PV}"
 
 EXTRA_OECONF = "--disable-debug --enable-included-printf=no"
-EXTRA_OECONF_virtclass-native = ""
+EXTRA_OECONF_virtclass-native = "--disable-dtrace --disable-systemtap"
 EXTRA_OECONF_linuxstdbase = "--enable-included-printf=no"
 
 FILES_${PN} = "${libdir}/lib*${SOLIBS} ${sysconfdir}/bash_completion.d ${datadir}/glib-2.0/schemas"
-- 
1.7.6



