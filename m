Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RVXD1-0003Ro-Ig
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 00:35:31 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2011 15:28:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81086463"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 15:28:51 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 07:24:17 +0800
Message-Id: <f08c14e955ff6bd2dbe79a8bde48d1396cf62ee5.1322608823.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
Subject: [PATCH 6/8] x11perf: Upgrade to 1.5.4
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
X-List-Received-Date: Tue, 29 Nov 2011 23:35:32 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../{x11perf_1.5.3.bb => x11perf_1.5.4.bb}         |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{x11perf_1.5.3.bb => x11perf_1.5.4.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-app/x11perf_1.5.3.bb b/meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-app/x11perf_1.5.3.bb
rename to meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb
index 26057d5..15fa314 100644
--- a/meta/recipes-graphics/xorg-app/x11perf_1.5.3.bb
+++ b/meta/recipes-graphics/xorg-app/x11perf_1.5.4.bb
@@ -11,10 +11,10 @@ DEPENDS += "libxmu libxrender libxft libxext fontconfig"
 LIC_FILES_CHKSUM = "file://COPYING;md5=428ca4d67a41fcd4fc3283dce9bbda7e \
                     file://x11perf.h;endline=24;md5=29555066baf406a105ff917ac25b2d01"
 
-PR = "r1"
+PR = "r0"
 PE = "1"
 
 FILES_${PN} += "${libdir}/X11/x11perfcomp/*"
 
-SRC_URI[md5sum] = "c3ac3667a6f5c3cead9847fbf4b5f36e"
-SRC_URI[sha256sum] = "394d7355afe7f3b054ce6f30db78794c6305c6593d48b7fb86a9c89d9d9e21bd"
+SRC_URI[md5sum] = "5c3c7431a38775caaea6051312a49bc9"
+SRC_URI[sha256sum] = "24ee8857a2bf414b360addabf1c27ef797f7f504ee9bc409c151760bfbe53184"
-- 
1.7.1



