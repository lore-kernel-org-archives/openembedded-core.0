Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qtizt-0007RR-5f
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 18:29:41 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Aug 2011 09:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,240,1312182000"; d="scan'208";a="40645783"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.14.198])
	by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2011 09:25:01 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 09:24:54 -0700
Message-Id: <8a6b8c22284a2be2f05070ff5059edeff94e8f44.1313598136.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313598136.git.josh@linux.intel.com>
References: <cover.1313598136.git.josh@linux.intel.com>
In-Reply-To: <cover.1313598136.git.josh@linux.intel.com>
References: <cover.1313598136.git.josh@linux.intel.com>
Subject: [PATCH 1/1] glib-2.0: explicitly disable dtrace and systemtap for native varaint
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
X-List-Received-Date: Wed, 17 Aug 2011 16:29:41 -0000

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



