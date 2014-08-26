Return-Path: <roxana.ciobanu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9126E710CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 16:14:18 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Aug 2014 09:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,405,1406617200"; d="scan'208";a="472816505"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.66])
	by azsmga001.ch.intel.com with ESMTP; 26 Aug 2014 09:14:00 -0700
From: Ciobanu Roxana <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 19:13:56 +0300
Message-Id: <488b6881bc5115fb3fb96506b10254964c062486.1409069605.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409069605.git.roxana.ciobanu@intel.com>
References: <cover.1409069605.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1409069605.git.roxana.ciobanu@intel.com>
References: <cover.1409069605.git.roxana.ciobanu@intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pixman: upgrade to 0.32.6
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
X-List-Received-Date: Tue, 26 Aug 2014 16:14:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roxana Ciobanu <roxana.ciobanu@intel.com>

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 meta/recipes-graphics/xorg-lib/{pixman_0.32.4.bb => pixman_0.32.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.4.bb => pixman_0.32.6.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb b/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
index 51cca5d..f9ad814 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.32.4.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
@@ -31,7 +31,7 @@ SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
 "
 
-SRC_URI[md5sum] = "cdb566504fe9daf6728c7b03cc7ea228"
-SRC_URI[sha256sum] = "ae2bd664057e330d41b40336ed296d3512318ce7f2401cc42601f2613d371e4c"
+SRC_URI[md5sum] = "8a9e8f14743a39cf303803f369c1f344"
+SRC_URI[sha256sum] = "201fc0d7d6bc0017496f2bd27b3ca14224aea0df6b624c5ee2dc0307a4ff14a4"
 
 REQUIRED_DISTRO_FEATURES = ""
-- 
1.9.1


