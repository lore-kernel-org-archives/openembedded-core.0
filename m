Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWnE-0001hN-H6
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:08:52 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720792"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:29 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:10 -0800
Message-Id: <51ea458d2be3a0ea51cb5a5d9b2ee1d8f81e6eb4.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 10/26] xset: Update to 1.2.2
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
X-List-Received-Date: Tue, 29 Nov 2011 23:08:53 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-app/{xset_1.2.1.bb => xset_1.2.2.bb}      |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.1.bb => xset_1.2.2.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-app/xset_1.2.1.bb b/meta/recipes-graphics/xorg-app/xset_1.2.2.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-app/xset_1.2.1.bb
rename to meta/recipes-graphics/xorg-app/xset_1.2.2.bb
index b5d63bc..7d5ac49 100644
--- a/meta/recipes-graphics/xorg-app/xset_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-app/xset_1.2.2.bb
@@ -13,8 +13,8 @@ PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
 
-SRC_URI[md5sum] = "4e0ce390394416c9e2c5cd4d7413ba87"
-SRC_URI[sha256sum] = "ec995f7d23109cfa6420ae87c38158f29a2a6f9d0b7df0a1be34e69e165292a1"
+SRC_URI[md5sum] = "d44e0057d6722b25d5a314e82e0b7e7c"
+SRC_URI[sha256sum] = "61371c140030b8b05075a1378b34a4d7c438ed9159496a95f10782c6f4aec1e8"
 
 CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--disable-xkb"
-- 
1.7.6.4



