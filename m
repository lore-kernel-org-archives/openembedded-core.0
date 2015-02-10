Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D324B732C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 18:32:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2015 10:32:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,551,1418112000"; d="scan'208";a="683814261"
Received: from flopezex-desk.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.zpn.intel.com) ([10.219.4.140])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2015 10:32:03 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Feb 2015 12:32:13 -0600
Message-Id: <0b67980bdb95ea9c29f5fc14190ac227c01058a5.1423593058.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423593058.git.anibal.limon@linux.intel.com>
References: <cover.1423593058.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1423593058.git.anibal.limon@linux.intel.com>
References: <cover.1423593058.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] xserver-xorg: Update to 1.16.3
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
X-List-Received-Date: Tue, 10 Feb 2015 18:32:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../xorg-xserver/{xserver-xorg_1.16.2.bb => xserver-xorg_1.16.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.16.2.bb => xserver-xorg_1.16.3.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
index 7d7d83e..347ce3b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
@@ -7,8 +7,8 @@ SRC_URI += "file://fix_open_max_preprocessor_error.patch \
             file://Fix-subwindow-in-Xi-emulated-events.patch \
            "
 
-SRC_URI[md5sum] = "89620960b13515db8d0a8dbb92a1378a"
-SRC_URI[sha256sum] = "446e0c3ebd556aced78ec0000ba9ae73f1e5317117d497f827afba48b787ce64"
+SRC_URI[md5sum] = "afd93977235584a9caa7528a737c1b52"
+SRC_URI[sha256sum] = "5e0f443238af1078b48f6eea98a382861b59187da221c2cf714d31c1d560b0fb"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
1.9.1


