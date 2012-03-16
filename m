Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LUQ-0002PO-Jt
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:57:55 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:49:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129568367"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga001.fm.intel.com with ESMTP; 15 Mar 2012 17:49:06 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:44 +0800
Message-Id: <365fd681e91bd9e2fb1a031695ca5e41db659f7f.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 47/60] libxau: upgrade to 1.0.7
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
X-List-Received-Date: Fri, 16 Mar 2012 00:57:55 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../xorg-lib/{libxau_1.0.6.bb => libxau_1.0.7.bb}  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxau_1.0.6.bb => libxau_1.0.7.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.7.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
rename to meta/recipes-graphics/xorg-lib/libxau_1.0.7.bb
index 793008b..9fa9045 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.7.bb
@@ -21,5 +21,5 @@ XORG_PN = "libXau"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "4a2cbd83727682f9ee1c1e719bac6adb"
-SRC_URI[sha256sum] = "ee84415ffedcc1c0d39b3a39c35d0596c89907bba93d22bf85e24d21f90170fc"
+SRC_URI[md5sum] = "2d241521df40d27034413436d1a1465c"
+SRC_URI[sha256sum] = "7153ba503e2362d552612d9dc2e7d7ad3106d5055e310a26ecf28addf471a489"
-- 
1.7.6



