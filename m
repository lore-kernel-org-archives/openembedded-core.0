Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7cLD-0006ne-I1
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 01:45:23 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Mar 2012 17:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77188041"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.185])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 17:36:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 00:36:29 +0000
Message-Id: <fd8dfc3e275ac1672509b9d941af13d6f2cb6091.1331685330.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331685330.git.paul.eggleton@linux.intel.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1331685330.git.paul.eggleton@linux.intel.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] gst-plugins-bad: disable directfb in configure
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
X-List-Received-Date: Wed, 14 Mar 2012 00:45:23 -0000

Disable directfb output (as we do with SDL) so that it does not get
auto-detected resulting in a race condition.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../gstreamer/gst-plugins-bad_0.10.22.bb           |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
index b99d453..2c97a10 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg"
 
-PR = "r2"
+PR = "r3"
 
 inherit gettext
 
-EXTRA_OECONF += "--disable-examples --disable-experimental --disable-sdl --disable-cdaudio \
+EXTRA_OECONF += "--disable-examples --disable-experimental --disable-sdl --disable-cdaudio --disable-directfb \
                  --with-plugins=musicbrainz,wavpack,ivorbis,mpegvideoparse --disable-vdpau --disable-apexsink"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.5.4



