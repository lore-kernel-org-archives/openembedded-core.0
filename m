Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B6E4A7424A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 11:19:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 25 Jun 2015 04:19:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,675,1427785200"; d="scan'208";a="514055723"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jun 2015 04:19:32 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 14:20:03 +0300
Message-Id: <61907fe9af9c391d205dfd303fa6932730dcf53d.1435228589.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <100fc04eb4b127d562f5d5515a2f2b4b895470de.1435228589.git.jussi.kukkonen@intel.com>
References: <100fc04eb4b127d562f5d5515a2f2b4b895470de.1435228589.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1435228589.git.jussi.kukkonen@intel.com>
References: <cover.1435228589.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/4] xf86-video-vesa: Upgrade 2.3.3 -> 2.3.4
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
X-List-Received-Date: Thu, 25 Jun 2015 11:19:52 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../{xf86-video-vesa_2.3.3.bb => xf86-video-vesa_2.3.4.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.3.3.bb => xf86-video-vesa_2.3.4.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.4.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.4.bb
index 4052f70..fa251b5 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.4.bb
@@ -17,5 +17,5 @@ COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 RRECOMMENDS_${PN} += "xserver-xorg-module-libint10"
 
-SRC_URI[md5sum] = "3690a5356ed121b1a7dfb59a6dcf4bf9"
-SRC_URI[sha256sum] = "ce8b75e5a40e9dae76f2ac9e2880f7f73a848653ca2eed5880f52dc2c0d3aef8"
+SRC_URI[md5sum] = "a893c37c589f7a31cea929a5d896a0e2"
+SRC_URI[sha256sum] = "7bddf4d879dd6f67088ecb203a31e12334aab980174bd0909930a21f32e251c1"
-- 
2.1.4


