Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B839C719CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:22:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 21 Oct 2016 03:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="182256681"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2016 03:22:19 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:22:00 +0300
Message-Id: <e4867da07844aeffa4efbcff40bc37d676dd69c7.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
References: <e5ffe5ce81bc8eed3714e3e8199c0f977088779f.1477032779.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477032779.git.jussi.kukkonen@intel.com>
References: <cover.1477032779.git.jussi.kukkonen@intel.com>
Subject: [PATCH 02/15] libevdev: Upgrade 1.5.2 -> 1.5.4
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
X-List-Received-Date: Fri, 21 Oct 2016 10:22:16 -0000

Tiny bug fix releases.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-support/libevdev/{libevdev_1.5.2.bb => libevdev_1.5.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.5.2.bb => libevdev_1.5.4.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.5.2.bb b/meta/recipes-support/libevdev/libevdev_1.5.4.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.5.2.bb
rename to meta/recipes-support/libevdev/libevdev_1.5.4.bb
index c76e1d7..9cae859 100644
--- a/meta/recipes-support/libevdev/libevdev_1.5.2.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.5.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "96ad6edb5ce5c4428f1b183cc180ff8c"
-SRC_URI[sha256sum] = "5ee2163656a61f5703cb5c08a05c9471ffb7b640bfbe2c55194ea50d908f629b"
+SRC_URI[md5sum] = "8f22027bd7a7ba19e6f2695f78e672b6"
+SRC_URI[sha256sum] = "11fe76d62cc76fbc9dbf8e94696a80eee63780139161e5cf54c55ec21a8173a4"
 
 inherit autotools pkgconfig
-- 
2.1.4


