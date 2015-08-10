Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D973C76894
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 14:22:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 10 Aug 2015 07:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,645,1432623600"; d="scan'208";a="745684073"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2015 07:22:25 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 17:23:23 +0300
Message-Id: <5fa8df27d790fc058dc78fff35ca9b04150cd229.1439216269.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
References: <cover.1439216269.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/8] bluez5: update to 5.33
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
X-List-Received-Date: Mon, 10 Aug 2015 14:22:24 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-connectivity/bluez5/{bluez5_5.32.bb => bluez5_5.33.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.32.bb => bluez5_5.33.bb} (88%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.32.bb b/meta/recipes-connectivity/bluez5/bluez5_5.33.bb
similarity index 88%
rename from meta/recipes-connectivity/bluez5/bluez5_5.32.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.33.bb
index db02be4..23c7397 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.32.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.33.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
-SRC_URI[md5sum] = "432b1f292c0b78771818c67140baf3d9"
-SRC_URI[sha256sum] = "fe4f35e701cbec04478818adf014ed9bbd1f7d11e2603370f1b70a78106f57f7"
+SRC_URI[md5sum] = "78782dc33d9a8b6344c4cc1af70c8a98"
+SRC_URI[sha256sum] = "1801807a13506678cbfeb15c6a4b89ecb5739efe1067eb464da6641d731436d3"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.1.4


