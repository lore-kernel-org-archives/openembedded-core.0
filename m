Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAlf-0001pX-6i
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Apr 2011 00:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="423747789"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by azsmga001.ch.intel.com with ESMTP; 22 Apr 2011 00:24:40 -0700
Message-Id: <687c7278eb836346b65e0a7172b6f23c726b55c8.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 13:17:56 +0800
Date: Fri, 22 Apr 2011  0:24:40 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 11/33] libxfixes: upgrade from 4.0.5 to the latest version 5.0
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
X-List-Received-Date: Fri, 22 Apr 2011 07:27:07 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../{libxfixes_4.0.5.bb => libxfixes_5.0.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_4.0.5.bb => libxfixes_5.0.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_4.0.5.bb b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libxfixes_4.0.5.bb
rename to meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb
index a69d5fd..0883cd1 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_4.0.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb
@@ -19,5 +19,5 @@ XORG_PN = "libXfixes"
 
 BBCLASSEXTEND = "nativesdk"
 
-SRC_URI[md5sum] = "1b4b8386bd5d1751b2c7177223ad4629"
-SRC_URI[sha256sum] = "2e6cd020460e4ef5d5a1d9b5d21143e9f5e580036a79c7de26ae539d7bcb8d74"
+SRC_URI[md5sum] = "678071bd7f9f7467e2fc712d81022318"
+SRC_URI[sha256sum] = "537a2446129242737a35db40081be4bbcc126e56c03bf5f2b142b10a79cda2e3"
-- 
1.7.1



