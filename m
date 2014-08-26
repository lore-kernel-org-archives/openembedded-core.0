Return-Path: <roxana.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 79C7665D56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 15:59:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Aug 2014 08:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,405,1406617200"; d="scan'208";a="563664790"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.66])
	by orsmga001.jf.intel.com with ESMTP; 26 Aug 2014 08:59:47 -0700
From: Ciobanu Roxana <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 18:59:22 +0300
Message-Id: <2881afbe6a97ccf33d169e444ad4aa54c81b477b.1409068604.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409068604.git.roxana.ciobanu@intel.com>
References: <cover.1409068604.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1409068604.git.roxana.ciobanu@intel.com>
References: <cover.1409068604.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] xf86-input-mouse: upgrade to 1.9.1
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
X-List-Received-Date: Tue, 26 Aug 2014 15:59:49 -0000

From: Roxana Ciobanu <roxana.ciobanu@intel.com>

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 .../{xf86-input-mouse_1.9.0.bb => xf86-input-mouse_1.9.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-mouse_1.9.0.bb => xf86-input-mouse_1.9.1.bb} (76%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.1.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.1.bb
index aca958c..1f0b78a 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.1.bb
@@ -10,6 +10,6 @@ driver."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=90ea9f90d72b6d9327dede5ffdb2a510"
 
-SRC_URI[md5sum] = "36b5b92000c4644f648b58a535e4ee73"
-SRC_URI[sha256sum] = "5d601e4bae53d5e9ead4ecd700f1beb5aeaf78b79e634c4aa381a9ce00276488"
+SRC_URI[md5sum] = "77085b649c5c0b333565ba562f573951"
+SRC_URI[sha256sum] = "3485d375779c08406f0789feedde15933dc703158a086ddac638598f479fc5ce"
 
-- 
1.9.1


