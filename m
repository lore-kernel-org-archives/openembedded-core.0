Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 44BEB6E33B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 15:22:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jan 2014 07:22:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,653,1384329600"; d="scan'208";a="465875324"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.149])
	by orsmga002.jf.intel.com with ESMTP; 13 Jan 2014 07:22:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2014 15:22:09 +0000
Message-Id: <73c1c218d0045000ed28344239ab18cef7291f7d.1389626446.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389626446.git.paul.eggleton@linux.intel.com>
References: <cover.1389626446.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389626446.git.paul.eggleton@linux.intel.com>
References: <cover.1389626446.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] libsdl2: upgrade to 2.0.1
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
X-List-Received-Date: Mon, 13 Jan 2014 15:22:41 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/libsdl2/{libsdl2_2.0.0.bb => libsdl2_2.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.0.bb => libsdl2_2.0.1.bb} (94%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.0.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb
similarity index 94%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.0.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb
index f393e33..7958f7b 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.0.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.1.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[md5sum] = "beec89afb6edcc6f0abc4114f2e6bcf7"
-SRC_URI[sha256sum] = "6f6ac8153d90e06a118474d5400624ae82b3d3e080915505db27cebc52b27178"
+SRC_URI[md5sum] = "0eb97039488bf463e775295f7b18b227"
+SRC_URI[sha256sum] = "0ae7e902a26777614a011fe7053ca7e8b14843db3c42ca117564d208cf6732f0"
 
 inherit autotools lib_package binconfig pkgconfig
 
-- 
1.8.1.2


