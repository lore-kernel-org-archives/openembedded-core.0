Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 12285772BD
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 10:42:27 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP; 24 Jan 2017 02:42:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="56847444"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 24 Jan 2017 02:42:27 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 5C64C6A4006;
	Tue, 24 Jan 2017 02:41:30 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: Openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 12:42:16 +0200
Message-Id: <416fde0bf85d6e35f72985bb59dba34540339be2.1485249527.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485249527.git.jussi.kukkonen@intel.com>
References: <cover.1485249527.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/9] libevdev: Upgrade 1.5.4 -> 1.5.6
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
X-List-Received-Date: Tue, 24 Jan 2017 10:42:27 -0000

Only changes in helper tools and a header (to support new keycodes in
linux 4.9 headers).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-support/libevdev/{libevdev_1.5.4.bb => libevdev_1.5.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.5.4.bb => libevdev_1.5.6.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.5.4.bb b/meta/recipes-support/libevdev/libevdev_1.5.6.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.5.4.bb
rename to meta/recipes-support/libevdev/libevdev_1.5.6.bb
index 9cae859..2f84554 100644
--- a/meta/recipes-support/libevdev/libevdev_1.5.4.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.5.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "8f22027bd7a7ba19e6f2695f78e672b6"
-SRC_URI[sha256sum] = "11fe76d62cc76fbc9dbf8e94696a80eee63780139161e5cf54c55ec21a8173a4"
+SRC_URI[md5sum] = "d4ce9f061f8f954bea7adba0cb768a53"
+SRC_URI[sha256sum] = "ecec7e9d66b1d3692f10b3b20aa97fb25e874a784c5552a7b1698091fef5a688"
 
 inherit autotools pkgconfig
-- 
2.1.4


