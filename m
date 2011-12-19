Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RcfVS-0003em-4D
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 16:52:02 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2011 07:44:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97940397"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.37])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2011 07:44:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 15:44:02 +0000
Message-Id: <c59f8be6de7e3245822680c75715d388dd6674ac.1324309317.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324309317.git.paul.eggleton@linux.intel.com>
References: <cover.1324309317.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1324309317.git.paul.eggleton@linux.intel.com>
References: <cover.1324309317.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/8] matchbox-themes-extra: fix SRC_URI
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
X-List-Received-Date: Mon, 19 Dec 2011 15:52:02 -0000

* projects.o-hand.com downloads have moved to downloads.yoctoproject.org
* Add missing SRC_URI checksums

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../matchbox-themes-extra_0.3.bb                   |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_0.3.bb b/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_0.3.bb
index fb91f03..1ba7b0a 100644
--- a/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_0.3.bb
+++ b/meta-demoapps/recipes-sato/matchbox-themes-extra/matchbox-themes-extra_0.3.bb
@@ -3,9 +3,12 @@ LICENSE = "GPL"
 DEPENDS = "matchbox-wm"
 SECTION = "x11/wm"
 
-SRC_URI = "http://projects.o-hand.com/matchbox/sources/matchbox-themes-extra/${PV}/matchbox-themes-extra-${PV}.tar.bz2"
+SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/matchbox-themes-extra/${PV}/matchbox-themes-extra-${PV}.tar.bz2"
 S = "${WORKDIR}/matchbox-themes-extra-${PV}"
 
+SRC_URI[md5sum] = "04312628f4a21f4105bce1251ea08035"
+SRC_URI[sha256sum] = "98a1c8695842b0cd7f32e67b0ef9118fd0f32db5297f3f08706c706dee8fc6be"
+
 inherit autotools  pkgconfig
 
 # split into several packages plus one meta package
-- 
1.7.5.4



