Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2BAF97488E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 15:33:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 08:33:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; d="scan'208";a="47921396"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 04 Apr 2018 08:33:49 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 566715801C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 08:33:48 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 18:32:26 +0300
Message-Id: <1522855946-8702-10-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
References: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 10/10] libevdev: upgrade to version 1.5.9
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
X-List-Received-Date: Wed, 04 Apr 2018 15:33:48 -0000

1.5.8 -> 1.5.9

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../recipes-support/libevdev/{libevdev_1.5.8.bb => libevdev_1.5.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.5.8.bb => libevdev_1.5.9.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.5.8.bb b/meta/recipes-support/libevdev/libevdev_1.5.9.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.5.8.bb
rename to meta/recipes-support/libevdev/libevdev_1.5.9.bb
index c138014..f59c60e 100644
--- a/meta/recipes-support/libevdev/libevdev_1.5.8.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.5.9.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "c25a8c3939e4ad59a5e9e5e1e354832d"
-SRC_URI[sha256sum] = "6083d81e46609da8ba80cb826c02d9080764a6dec33c8267ccb7e158833d4c6d"
+SRC_URI[md5sum] = "a1ca11e961c1efed720fac4130881904"
+SRC_URI[sha256sum] = "e1663751443bed9d3e76a4fe2caf6fa866a79705d91cacad815c04e706198a75"
 
 inherit autotools pkgconfig
-- 
2.4.0


