Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWnc-0001zq-VG
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:09:17 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 15:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720804"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:15 -0800
Message-Id: <c3dbce57812344c0c13051ba3bdc4a8c4dafd179.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 15/26] xserver-xorg*: Update to 1.11.2
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
X-List-Received-Date: Tue, 29 Nov 2011 23:09:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...ver-xorg-1.11.1.inc => xserver-xorg-1.11.2.inc} |    4 +---
 .../crosscompile.patch                             |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    0
 ...-lite_1.11.1.bb => xserver-xorg-lite_1.11.2.bb} |    0
 ...erver-xorg_1.11.1.bb => xserver-xorg_1.11.2.bb} |    0
 6 files changed, 1 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1.inc => xserver-xorg-1.11.2.inc} (47%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1 => xserver-xorg-1.11.2}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1 => xserver-xorg-1.11.2}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1 => xserver-xorg-1.11.2}/macro_tweak.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-lite_1.11.1.bb => xserver-xorg-lite_1.11.2.bb} (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.11.1.bb => xserver-xorg_1.11.2.bb} (100%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
similarity index 47%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index 8b0808d..8eba932 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -3,7 +3,5 @@ SRC_URI += "file://crosscompile.patch"
 # Misc build failure for master HEAD
 SRC_URI += "file://fix_open_max_preprocessor_error.patch"
 
-PR = "r2"
+PR = "r0"
 
-SRC_URI[md5sum] = "4cdf54dc569b6a5548257c93a45dcd3d"
-SRC_URI[sha256sum] = "c069c177d9a80bca2ee1d49aa1af6d9f996c83e4ff12393cab2ca3f8817276f6"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/crosscompile.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/crosscompile.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/crosscompile.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/fix_open_max_preprocessor_error.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/fix_open_max_preprocessor_error.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/fix_open_max_preprocessor_error.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/macro_tweak.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1/macro_tweak.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/macro_tweak.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.2.bb
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.2.bb
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
-- 
1.7.6.4



