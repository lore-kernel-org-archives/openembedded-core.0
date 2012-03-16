Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LEk-0001MN-1C
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Mar 2012 17:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119574751"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2012 17:32:37 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:13 +0800
Message-Id: <2efd09763d5006f72474267c4b77c738bebfcae3.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 16/60] gstreamer: upgrade to 0.10.36
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
X-List-Received-Date: Fri, 16 Mar 2012 00:41:42 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../check_fix.patch                                |    0
 .../gst-inspect-check-error.patch                  |    0
 .../gstregistrybinary.c                            |    0
 .../gstregistrybinary.h                            |    0
 .../{gstreamer_0.10.35.bb => gstreamer_0.10.36.bb} |    6 +++---
 5 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.35 => gstreamer-0.10.36}/check_fix.patch (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.35 => gstreamer-0.10.36}/gst-inspect-check-error.patch (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.35 => gstreamer-0.10.36}/gstregistrybinary.c (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.35 => gstreamer-0.10.36}/gstregistrybinary.h (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer_0.10.35.bb => gstreamer_0.10.36.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/check_fix.patch b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/check_fix.patch
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/check_fix.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/check_fix.patch
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/gst-inspect-check-error.patch b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gst-inspect-check-error.patch
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/gst-inspect-check-error.patch
rename to meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gst-inspect-check-error.patch
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/gstregistrybinary.c b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregistrybinary.c
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/gstregistrybinary.c
rename to meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregistrybinary.c
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/gstregistrybinary.h b/meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregistrybinary.h
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gstreamer-0.10.35/gstregistrybinary.h
rename to meta/recipes-multimedia/gstreamer/gstreamer-0.10.36/gstregistrybinary.h
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
index 8d3bc75..3c03c0d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.35.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
@@ -9,14 +9,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/gst.h;beginline=1;endline=21;md5=8e5fe5e87d33a04479fde862e238eaa4"
 DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
 
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz2 \
            file://check_fix.patch \
            file://gst-inspect-check-error.patch"
 
-SRC_URI[md5sum] = "4a0a00edad7a2c83de5211ca679dfaf9"
-SRC_URI[sha256sum] = "817bfea2cd46e2487b97e2ed9218f0299b32a3de1e5e80b4c7868d17e9089786"
+SRC_URI[md5sum] = "a0cf7d6877f694a1a2ad2b4d1ecb890b"
+SRC_URI[sha256sum] = "e556a529e0a8cf1cd0afd0cab2af5488c9524e7c3f409de29b5d82bb41ae7a30"
 
 inherit autotools pkgconfig gettext
 
-- 
1.7.6



