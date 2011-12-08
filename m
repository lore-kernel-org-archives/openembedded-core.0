Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RYWx3-00031R-Rx
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 06:55:26 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Dec 2011 21:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="83495537"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 07 Dec 2011 21:48:35 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org,
	hjl.tools@gmail.com
Date: Wed,  7 Dec 2011 21:48:23 -0800
Message-Id: <664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323323130.git.nitin.a.kamble@intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
Subject: [PATCH 01/11] gst-fluendo.inc: remove unneccessary hack
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
X-List-Received-Date: Thu, 08 Dec 2011 05:55:26 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This fixes bug: [YOCTO #1403]

the custom definition of CC was causing build isuses with x32 toolchain.
And also I found out that the hack is not neccessary anymore. the
affected gst-fluendo-mpegdemux recipe builds fine without the CC hack.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
index 203bdba..8b24cf7 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
@@ -12,7 +12,3 @@ FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
 
 EXTRA_OECONF = "--disable-debug --disable-valgrind"
-
-# Hack to get STAGING_LIBDIR into the linker path when building
-CC = "${CCACHE} ${HOST_PREFIX}gcc -L${STAGING_LIBDIR}"
-
-- 
1.7.6.4



