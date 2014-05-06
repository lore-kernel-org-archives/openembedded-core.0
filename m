Return-Path: <cristiana.voicu@intel.com>
X-Greylist: delayed 591 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 May 2014 08:34:32 UTC
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C34B365F89
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 08:34:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 May 2014 01:24:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,995,1389772800"; d="scan'208";a="535335974"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.143])
	by orsmga002.jf.intel.com with ESMTP; 06 May 2014 01:24:43 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 May 2014 11:26:16 +0300
Message-Id: <4222ac3be6a78b9e9eb4ff9f523838d1327cb9da.1399364699.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399364698.git.cristiana.voicu@intel.com>
References: <cover.1399364698.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1399364698.git.cristiana.voicu@intel.com>
References: <cover.1399364698.git.cristiana.voicu@intel.com>
Subject: [PATCH 2/2] rxvt-unicode: upgrade to 9.20
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
X-List-Received-Date: Tue, 06 May 2014 08:34:35 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../rxvt.desktop                                   |    0
 .../{rxvt-unicode-9.19 => rxvt-unicode}/rxvt.png   |  Bin 2847 -> 2847 bytes
 .../{rxvt-unicode-9.19 => rxvt-unicode}/xwc.patch  |    0
 .../{rxvt-unicode_9.19.bb => rxvt-unicode_9.20.bb} |    4 ++--
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.19 => rxvt-unicode}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.19 => rxvt-unicode}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.19 => rxvt-unicode}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.19.bb => rxvt-unicode_9.20.bb} (93%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.19/rxvt.desktop b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.19/rxvt.desktop
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.desktop
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.19/rxvt.png b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.png
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.19/rxvt.png
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt.png
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.19/xwc.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/xwc.patch
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.19/xwc.patch
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode/xwc.patch
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.19.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb
similarity index 93%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.19.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb
index 72eca6d..3a1ea66 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.19.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.20.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2
 	   file://rxvt.desktop \
 	   file://rxvt.png"
 
-SRC_URI[md5sum] = "45ad197eb9b5a840c0f65e3a8131921c"
-SRC_URI[sha256sum] = "d9237cf1973af461ecbeeb708e4d00893294771558e8338b4f33418ed52d3241"
+SRC_URI[md5sum] = "4a5b823f08d21036f94a6c51e94d025b"
+SRC_URI[sha256sum] = "e73e13fe64b59fd3c8e6e20c00f149d388741f141b8155e4700d3ed40aa94b4e"
 
 inherit autotools update-alternatives
 
-- 
1.7.9.5


