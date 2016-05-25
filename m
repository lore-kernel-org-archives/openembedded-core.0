Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D5E1570034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:29:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2016 06:29:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,364,1459839600"; d="scan'208";a="988474070"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2016 06:29:52 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 16:29:38 +0300
Message-Id: <12cc3be4f7ef27fccf7d3bbc9c746fe074b26355.1464176988.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ade23f378a1dc2d3153dd71e6a00c65c6c56e8f0.1464176988.git.jussi.kukkonen@intel.com>
References: <ade23f378a1dc2d3153dd71e6a00c65c6c56e8f0.1464176988.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1464176988.git.jussi.kukkonen@intel.com>
References: <cover.1464176988.git.jussi.kukkonen@intel.com>
Subject: [PATCH 5/7] libevdev: Upgrade 1.4.6 -> 1.5.1
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
X-List-Received-Date: Wed, 25 May 2016 13:29:51 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-support/libevdev/{libevdev_1.4.6.bb => libevdev_1.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.4.6.bb => libevdev_1.5.1.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.4.6.bb b/meta/recipes-support/libevdev/libevdev_1.5.1.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.4.6.bb
rename to meta/recipes-support/libevdev/libevdev_1.5.1.bb
index c8163e3..8d6d340 100644
--- a/meta/recipes-support/libevdev/libevdev_1.4.6.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.5.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "9b3f25bd8fb0f8efa4944d34668dddc0"
-SRC_URI[sha256sum] = "7b2ae1a0c7f9f7a96198ddc8fd167f090f233d6cbd8168b847e4f968445132d3"
+SRC_URI[md5sum] = "c8a85eef889754bb77282554b6761873"
+SRC_URI[sha256sum] = "17630821a57e6e3f02e01ade836f24068df9bd530067091152b0d468c3a86f40"
 
 inherit autotools pkgconfig
-- 
2.1.4


