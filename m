Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4D242731B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 12:55:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jul 2016 05:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,357,1464678000"; d="scan'208";a="994378815"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 13 Jul 2016 05:54:19 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2016 15:54:09 +0300
Message-Id: <e7157cd84fe6e95295c9f856b7a079c826fb9853.1468414127.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1713be02079bf9785e79492a1d81554e7cbcb372.1468414127.git.jussi.kukkonen@intel.com>
References: <1713be02079bf9785e79492a1d81554e7cbcb372.1468414127.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468414126.git.jussi.kukkonen@intel.com>
References: <cover.1468414126.git.jussi.kukkonen@intel.com>
Subject: [PATCH 7/7] libevdev: Upgrade 1.5.1 -> 1.5.2
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
X-List-Received-Date: Wed, 13 Jul 2016 12:55:15 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-support/libevdev/{libevdev_1.5.1.bb => libevdev_1.5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.5.1.bb => libevdev_1.5.2.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.5.1.bb b/meta/recipes-support/libevdev/libevdev_1.5.2.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.5.1.bb
rename to meta/recipes-support/libevdev/libevdev_1.5.2.bb
index 8d6d340..c76e1d7 100644
--- a/meta/recipes-support/libevdev/libevdev_1.5.1.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.5.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "c8a85eef889754bb77282554b6761873"
-SRC_URI[sha256sum] = "17630821a57e6e3f02e01ade836f24068df9bd530067091152b0d468c3a86f40"
+SRC_URI[md5sum] = "96ad6edb5ce5c4428f1b183cc180ff8c"
+SRC_URI[sha256sum] = "5ee2163656a61f5703cb5c08a05c9471ffb7b640bfbe2c55194ea50d908f629b"
 
 inherit autotools pkgconfig
-- 
2.1.4


