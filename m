Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB2277CD8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 10:37:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 03:37:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,279,1493708400"; d="scan'208";a="863479305"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Jun 2017 03:37:03 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 2E0AF5800D3;
	Thu,  1 Jun 2017 03:37:01 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:36:49 +0300
Message-Id: <c39895598ed6d28cf3cb8dd6e16090af2ad2949b.1496311679.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496311679.git.jussi.kukkonen@intel.com>
References: <cover.1496311679.git.jussi.kukkonen@intel.com>
Subject: [PATCH 04/10] libevdev: Upgrade 1.5.6 -> 1.5.7
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
X-List-Received-Date: Thu, 01 Jun 2017 10:37:02 -0000

Small release with mostly build system fixes.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-support/libevdev/{libevdev_1.5.6.bb => libevdev_1.5.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.5.6.bb => libevdev_1.5.7.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.5.6.bb b/meta/recipes-support/libevdev/libevdev_1.5.7.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.5.6.bb
rename to meta/recipes-support/libevdev/libevdev_1.5.7.bb
index 2f84554..f740da2 100644
--- a/meta/recipes-support/libevdev/libevdev_1.5.6.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.5.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "d4ce9f061f8f954bea7adba0cb768a53"
-SRC_URI[sha256sum] = "ecec7e9d66b1d3692f10b3b20aa97fb25e874a784c5552a7b1698091fef5a688"
+SRC_URI[md5sum] = "4f1cfaee8d75ea3fbbfeb99a98730952"
+SRC_URI[sha256sum] = "a1e59e37a2f0d397ffd7e83b73af0e638db83b8dd08902ef0f651a21cc1dd422"
 
 inherit autotools pkgconfig
-- 
2.1.4


