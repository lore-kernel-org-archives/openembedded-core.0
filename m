Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 270606A9C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:39:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2013 06:37:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,845,1363158000"; d="scan'208";a="327680060"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2013 06:39:41 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 16:39:30 +0300
Message-Id: <2eaf19ecb6a4685102711a47454ed812cb172c56.1370956136.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1370956136.git.laurentiu.palcu@intel.com>
References: <cover.1370956136.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/7] xdpyinfo: upgrade to 1.3.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2013 13:39:41 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../{xdpyinfo_1.3.0.bb => xdpyinfo_1.3.1.bb}       |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xdpyinfo_1.3.0.bb => xdpyinfo_1.3.1.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb
rename to meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb
index e0b2442..c853926 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.1.bb
@@ -10,12 +10,11 @@ that are available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f3d09e6b9e203a1af489e16c708f4fb3"
 DEPENDS += "libxtst libxext libxxf86vm libxxf86dga libxxf86misc libxi libxrender libxinerama libdmx libxau"
-PR = "${INC_PR}.1"
 PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
 
-SRC_URI[md5sum] = "1ef08f4c8d0e669c2edd49e4a1bf650d"
-SRC_URI[sha256sum] = "23ee4944a32b5701b4379cb420729eb7a4dde54de2b5b006d4747855efd6d73f"
+SRC_URI[md5sum] = "cacc0733f16e4f2a97a5c430fcc4420e"
+SRC_URI[sha256sum] = "aef9285069a517ed870e5d8a02d13f7d8a953d7f7220146da563e04c7f128b94"
 
 EXTRA_OECONF = "--disable-xkb"
-- 
1.7.9.5


