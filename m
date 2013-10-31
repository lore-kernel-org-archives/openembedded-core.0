Return-Path: <cristiana.voicu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4D3306D3CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 08:12:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 31 Oct 2013 01:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="427521155"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by orsmga002.jf.intel.com with ESMTP; 31 Oct 2013 01:12:12 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2013 10:17:07 +0200
Message-Id: <8a45529abde30916c46c92e3b6dc153ce456d20b.1383207214.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383207214.git.cristiana.voicu@intel.com>
References: <cover.1383207214.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1383207214.git.cristiana.voicu@intel.com>
References: <cover.1383207214.git.cristiana.voicu@intel.com>
Subject: [PATCH_V2 1/2] rxvt-unicode: upgrade to 9.19
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
X-List-Received-Date: Thu, 31 Oct 2013 08:12:11 -0000

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.18.bb => rxvt-unicode_9.19.bb} |    4 ++--
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.18 => rxvt-unicode-9.19}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.18 => rxvt-unicode-9.19}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.18 => rxvt-unicode-9.19}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.18.bb => rxvt-unicode_9.19.bb} (93%)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.18/rxvt.desktop b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.19/rxvt.desktop
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.18/rxvt.desktop
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.19/rxvt.desktop
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.18/rxvt.png b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.19/rxvt.png
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.18/rxvt.png
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.19/rxvt.png
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.18/xwc.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.19/xwc.patch
similarity index 100%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.18/xwc.patch
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.19/xwc.patch
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.19.bb
similarity index 93%
rename from meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb
rename to meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.19.bb
index c3770ae..fca26ba 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.19.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2
 	   file://rxvt.desktop \
 	   file://rxvt.png"
 
-SRC_URI[md5sum] = "963ccc748fe5bca925e7b92c0404d68b"
-SRC_URI[sha256sum] = "87b72a43cac7c9362a984094c661a632ce1a829ad90f149142ab1953854b433f"
+SRC_URI[md5sum] = "45ad197eb9b5a840c0f65e3a8131921c"
+SRC_URI[sha256sum] = "d9237cf1973af461ecbeeb708e4d00893294771558e8338b4f33418ed52d3241"
 
 inherit autotools update-alternatives
 
-- 
1.7.9.5


