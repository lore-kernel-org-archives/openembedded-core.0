Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6F15361302
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 06:45:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Feb 2020 22:45:38 -0800
X-IronPort-AV: E=Sophos;i="5.70,483,1574150400"; d="scan'208";a="226246461"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	24 Feb 2020 22:45:37 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 14:45:26 +0800
Message-Id: <1582613126-37627-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libevdev: fix upstream check
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
X-List-Received-Date: Tue, 25 Feb 2020 06:45:37 -0000

Ignore the ones ending in .90x as they are -rc releases.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libevdev/libevdev_1.8.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libevdev/libevdev_1.8.0.bb b/meta/recipes-support/libevdev/libevdev_1.8.0.bb
index 46ed5d7..3523dc0 100644
--- a/meta/recipes-support/libevdev/libevdev_1.8.0.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.8.0.bb
@@ -12,3 +12,5 @@ SRC_URI[md5sum] = "879631080be18526737e33b63d848039"
 SRC_URI[sha256sum] = "20d3cae4efd277f485abdf8f2a7c46588e539998b5a08c2c4d368218379d4211"
 
 inherit autotools pkgconfig
+
+UPSTREAM_CHECK_REGEX = "libevdev-(?P<pver>(\d+\.)+(?!90\d+)\d+)"
-- 
2.7.4


