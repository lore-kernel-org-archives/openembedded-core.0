Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S266C-00027s-B1
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:19:04 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 11:10:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122056449"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2012 11:10:34 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 11:10:26 -0800
Message-Id: <b3cb47c45d1be719831d2add6c2d9a46cfaf5c9d.1330369680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
Subject: [PATCH 08/13] mkfontscale: Update to version 1.1.0
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
X-List-Received-Date: Mon, 27 Feb 2012 19:19:04 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../{mkfontscale_1.0.9.bb => mkfontscale_1.1.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.0.9.bb => mkfontscale_1.1.0.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.0.9.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.0.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.0.9.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.1.0.bb
index 4db3015..49706e5 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.1.0.bb
@@ -14,5 +14,5 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e0d129d05305176d1a790e0ac1acb7f"
 
-SRC_URI[md5sum] = "3d1dc487f3e859f4e5c46540cb49abd3"
-SRC_URI[sha256sum] = "1e911c361c7617aebf2c9bffdc15b7b8956d64a49cef449f533ef1cc418e7e76"
+SRC_URI[md5sum] = "414fcb053418fb1418e3a39f4a37e0f7"
+SRC_URI[sha256sum] = "ce55f862679b8ec127d7f7315ac04a8d64a0d90a0309a70dc56c1ba3f9806994"
-- 
1.7.7.6



