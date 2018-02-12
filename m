Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4717260670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 14:13:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 06:14:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="17046244"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga007.jf.intel.com with ESMTP; 12 Feb 2018 06:14:00 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 3B34F5802A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 06:14:00 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 16:16:23 +0200
Message-Id: <1518444986-25886-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/4] libevdev: upgrade to version 1.5.8
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
X-List-Received-Date: Mon, 12 Feb 2018 14:14:00 -0000

Bug fix release. Supports new keycodes in linux 4.15 headers

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../recipes-support/libevdev/{libevdev_1.5.7.bb => libevdev_1.5.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.5.7.bb => libevdev_1.5.8.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.5.7.bb b/meta/recipes-support/libevdev/libevdev_1.5.8.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.5.7.bb
rename to meta/recipes-support/libevdev/libevdev_1.5.8.bb
index f740da2..c138014 100644
--- a/meta/recipes-support/libevdev/libevdev_1.5.7.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.5.8.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "4f1cfaee8d75ea3fbbfeb99a98730952"
-SRC_URI[sha256sum] = "a1e59e37a2f0d397ffd7e83b73af0e638db83b8dd08902ef0f651a21cc1dd422"
+SRC_URI[md5sum] = "c25a8c3939e4ad59a5e9e5e1e354832d"
+SRC_URI[sha256sum] = "6083d81e46609da8ba80cb826c02d9080764a6dec33c8267ccb7e158833d4c6d"
 
 inherit autotools pkgconfig
-- 
2.4.0


