Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWn3-0001el-GI
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:08:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720784"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:28 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:04 -0800
Message-Id: <e3a8ef74b4ebb8ec131d18960552b52865626d1e.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 04/26] mkfontscale: Update to 1.0.9
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
X-List-Received-Date: Tue, 29 Nov 2011 23:08:41 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{mkfontscale_1.0.8.bb => mkfontscale_1.0.9.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.0.8.bb => mkfontscale_1.0.9.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.0.8.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.0.9.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.0.8.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.0.9.bb
index 3b21c1e..4db3015 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.0.8.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.0.9.bb
@@ -14,5 +14,5 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e0d129d05305176d1a790e0ac1acb7f"
 
-SRC_URI[md5sum] = "5210c9385c6cc4a00ce829d8dc9c819b"
-SRC_URI[sha256sum] = "6eb57786cd79eebfbaca386fe24dcfe50689dbf433d052e58291c2925f2050f9"
+SRC_URI[md5sum] = "3d1dc487f3e859f4e5c46540cb49abd3"
+SRC_URI[sha256sum] = "1e911c361c7617aebf2c9bffdc15b7b8956d64a49cef449f533ef1cc418e7e76"
-- 
1.7.6.4



