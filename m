Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RWZh9-0002KL-JY
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 21:26:55 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 12:20:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,285,1320652800"; d="scan'208";a="43396278"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2011 12:20:11 -0800
From: nitin.a.kamble@intel.com
To: hjl.tools@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:19:59 -0800
Message-Id: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322856805.git.nitin.a.kamble@intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
Subject: [PATCH 01/11] gst-fluendo-mpegdemux: rework the CC hack
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
X-List-Received-Date: Fri, 02 Dec 2011 20:26:55 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This fixes bug: [YOCTO #1403]

Earlier hack was breaking compiler parameters set by tune settings. And that caused x32
build failure. Now previous CC parameters are kept intact while adding new -L parameter.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
index 203bdba..9615454 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
@@ -14,5 +14,5 @@ FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
 EXTRA_OECONF = "--disable-debug --disable-valgrind"
 
 # Hack to get STAGING_LIBDIR into the linker path when building
-CC = "${CCACHE} ${HOST_PREFIX}gcc -L${STAGING_LIBDIR}"
+CC += "-L${STAGING_LIBDIR}"
 
-- 
1.7.6.4



