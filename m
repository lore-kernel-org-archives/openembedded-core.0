Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CA610723BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 10:45:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 16 Mar 2015 03:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,407,1422950400"; d="scan'208";a="541464617"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by orsmga003.jf.intel.com with ESMTP; 16 Mar 2015 03:44:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 10:45:28 +0000
Message-Id: <e2202b55e901adbb3f2e561394d953d513d02a0c.1426502565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426502565.git.paul.eggleton@linux.intel.com>
References: <cover.1426502565.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426502565.git.paul.eggleton@linux.intel.com>
References: <cover.1426502565.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] waffle: drop unneeded setting of EXTRA_OECMAKE
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
X-List-Received-Date: Mon, 16 Mar 2015 10:45:33 -0000

base.bbclass already sets EXTRA_OECMAKE when cmake.bbclass is inherited.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/waffle/waffle_1.3.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/waffle/waffle_1.3.0.bb b/meta/recipes-graphics/waffle/waffle_1.3.0.bb
index a6d1acd..fe9609c 100644
--- a/meta/recipes-graphics/waffle/waffle_1.3.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.3.0.bb
@@ -26,7 +26,4 @@ PACKAGECONFIG[gbm] = "-Dwaffle_has_wayland=1,,virtual/libgl udev"
 # I say virtual/libgl, actually wants egl.pc
 PACKAGECONFIG[x11-egl] = "-Dwaffle_has_x11_egl=1,,virtual/libgl libxcb"
 
-# Take the flags added by PACKAGECONFIG and pass them to cmake.
-EXTRA_OECMAKE = "${EXTRA_OECONF}"
-
 FILES_${PN}-dev += "${datadir}/cmake/Modules/FindWaffle.cmake"
-- 
1.9.3


