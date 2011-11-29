Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWnC-0001hN-HX
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:08:50 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720791"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:29 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:09 -0800
Message-Id: <f7b5c538c964fbfab491fdd977d1397f8a4e567e.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 09/26] xrandr: Update to 1.3.5
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
X-List-Received-Date: Tue, 29 Nov 2011 23:08:51 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xorg-app/{xrandr_1.3.4.bb => xrandr_1.3.5.bb}  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.3.4.bb => xrandr_1.3.5.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-app/xrandr_1.3.4.bb b/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-app/xrandr_1.3.4.bb
rename to meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
index ab29874..afb45cb 100644
--- a/meta/recipes-graphics/xorg-app/xrandr_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-app/xrandr_1.3.5.bb
@@ -12,5 +12,5 @@ DEPENDS += "libxrandr libxrender"
 PE = "1"
 PR = "r0"
 
-SRC_URI[md5sum] = "d6d20038257eba5178b523e10239d51c"
-SRC_URI[sha256sum] = "5e4a2492e6cc51345aa571b95283c43c2771c4f444837dbce2699d62f76b4adb"
+SRC_URI[md5sum] = "9735173a84dca9b05e06fd4686196b07"
+SRC_URI[sha256sum] = "1059ff7a9ad0df8e00a765ffa4e08a505304c02663112da370ac7082030b980e"
-- 
1.7.6.4



