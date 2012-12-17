Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Tkc7a-0002Br-8n
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 15:56:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Dec 2012 06:41:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,300,1355126400"; d="scan'208";a="235102410"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 17 Dec 2012 06:42:04 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 16:41:59 +0200
Message-Id: <1355755320-2375-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355755320-2375-1-git-send-email-laurentiu.palcu@intel.com>
References: <1355755320-2375-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] xserver-xorg: upgrade to 1.13.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 14:57:02 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../crosscompile.patch                             |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    0
 .../mips64-compiler.patch                          |    0
 ...erver-xorg_1.13.0.bb => xserver-xorg_1.13.1.bb} |    4 ++--
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.0 => xserver-xorg-1.13.1}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.0 => xserver-xorg-1.13.1}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.0 => xserver-xorg-1.13.1}/macro_tweak.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.13.0 => xserver-xorg-1.13.1}/mips64-compiler.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.13.0.bb => xserver-xorg_1.13.1.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/crosscompile.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/crosscompile.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/crosscompile.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/fix_open_max_preprocessor_error.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/fix_open_max_preprocessor_error.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/fix_open_max_preprocessor_error.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/macro_tweak.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/macro_tweak.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/macro_tweak.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/mips64-compiler.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-compiler.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.1/mips64-compiler.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bb
index 3b102cb..d6c63b9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.1.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://crosscompile.patch \
             file://mips64-compiler.patch \
            "
 
-SRC_URI[md5sum] = "bde3d178b756597d2ec2a19ef60d2e1f"
-SRC_URI[sha256sum] = "548b91cb01087ad4f892428e7ac4955251cf12393e86c70420436b33848ef28a"
+SRC_URI[md5sum] = "a13d8876e3e804189392119638a07a1f"
+SRC_URI[sha256sum] = "c93540e2799df4655c6f1b67dc7d8d6db96df4f08ef1702fffbc5df843a43d00"
 
 PR = "${INC_PR}.0"
 
-- 
1.7.9.5



