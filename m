Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RcfVQ-0003em-9f
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 16:52:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2011 07:44:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97940385"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.37])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2011 07:44:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 15:44:01 +0000
Message-Id: <4e7a70808e1d0adb52994cdd5ba5147814620841.1324309317.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324309317.git.paul.eggleton@linux.intel.com>
References: <cover.1324309317.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1324309317.git.paul.eggleton@linux.intel.com>
References: <cover.1324309317.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/8] matchbox-desktop: fix SRC_URI
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
X-List-Received-Date: Mon, 19 Dec 2011 15:52:00 -0000

* projects.o-hand.com downloads have moved to downloads.yoctoproject.org
* Add missing SRC_URI checksums

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../matchbox-desktop/matchbox-desktop_0.9.1.bb     |    5 ++++-
 .../matchbox-desktop/matchbox-desktop_2.0.bb       |    5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
index 0a02bb9..e12b101 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
@@ -3,7 +3,10 @@ LICENSE = "GPL"
 DEPENDS = "libmatchbox startup-notification"
 SECTION = "x11/wm"
 
-SRC_URI = "http://projects.o-hand.com/matchbox/sources/matchbox-desktop/0.9/matchbox-desktop-${PV}.tar.bz2"
+SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/matchbox-desktop/0.9/matchbox-desktop-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "3335a30b1a1aacfb39f23b505254765c"
+SRC_URI[sha256sum] = "ecb025d3660d80a9850973111b4fdfffaa50b47cbf0c5467b508d28d65146793"
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dnotify"
 
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
index 2943e4d..a9e400d 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
@@ -4,9 +4,12 @@ DEPENDS = "gtk+ startup-notification"
 SECTION = "x11/wm"
 PR = "r2"
 
-SRC_URI = "http://projects.o-hand.com/matchbox/sources/matchbox-desktop/2.0/matchbox-desktop-${PV}.tar.bz2 \
+SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/matchbox-desktop/2.0/matchbox-desktop-${PV}.tar.bz2 \
 	file://dso_linking_change_build_fix.patch"
 
+SRC_URI[md5sum] = "b0a4a47130272e2adab4e9feb43a6c9c"
+SRC_URI[sha256sum] = "be33ff0bc8a9b1eee6af360a5118e470e69a6292ecc9e154ec6f349fce5c5f75"
+
 EXTRA_OECONF = "--enable-startup-notification"
 
 inherit autotools pkgconfig
-- 
1.7.5.4



