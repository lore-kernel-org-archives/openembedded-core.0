Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RFnK6-0007Cj-Gu
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 15:33:47 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Oct 2011 06:27:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,359,1315206000"; d="scan'208";a="78842656"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.43])
	by fmsmga002.fm.intel.com with ESMTP; 17 Oct 2011 06:27:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2011 14:27:52 +0100
Message-Id: <6c65391c90f39be66453bd7b236aa84ea06aabda.1318852098.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1318852098.git.paul.eggleton@linux.intel.com>
References: <cover.1318852098.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1318852098.git.paul.eggleton@linux.intel.com>
References: <cover.1318852098.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] gst-plugins-base: update to 0.10.35
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
X-List-Received-Date: Mon, 17 Oct 2011 13:33:47 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../gst-plugins-base-tremor.patch                  |    0
 ...base_0.10.32.bb => gst-plugins-base_0.10.35.bb} |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-base-0.10.32 => gst-plugins-base-0.10.35}/gst-plugins-base-tremor.patch (100%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-base_0.10.32.bb => gst-plugins-base_0.10.35.bb} (84%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.32/gst-plugins-base-tremor.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.35/gst-plugins-base-tremor.patch
similarity index 100%
rename from meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.32/gst-plugins-base-tremor.patch
rename to meta/recipes-multimedia/gstreamer/gst-plugins-base-0.10.35/gst-plugins-base-tremor.patch
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
similarity index 84%
rename from meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
rename to meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
index 82d9afc..e49a00c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
@@ -10,10 +10,10 @@ DEPENDS += "virtual/libx11 alsa-lib freetype liboil libogg libvorbis libxv libth
 
 SRC_URI += " file://gst-plugins-base-tremor.patch"
 
-SRC_URI[md5sum] = "2920af2b3162f3d9fbaa7fabc8ed4d38"
-SRC_URI[sha256sum] = "e9aabfac83f6480896da0686e9c911989f896fbad634821b7771ed84a446172b"
+SRC_URI[md5sum] = "1d300983525f4f09030eb3ba47cb04b0"
+SRC_URI[sha256sum] = "cd24f01bb5258a1f400bc4f2c212bb7cee9ee23c9ffb80d537a24ef366d17103"
 
-PR = "r1"
+PR = "r0"
 
 inherit gettext
 
-- 
1.7.4.1



