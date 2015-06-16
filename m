Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 025A4759F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 11:38:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 16 Jun 2015 04:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,626,1427785200"; d="scan'208";a="744346892"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2015 04:38:49 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 14:39:23 +0300
Message-Id: <f12cbbbda5c1068a6885be099982d0e54f3b859f.1434454325.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0ae4e21c9217c8bb9e0cad43473317b0ab8335a3.1434454325.git.jussi.kukkonen@intel.com>
References: <0ae4e21c9217c8bb9e0cad43473317b0ab8335a3.1434454325.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1434454325.git.jussi.kukkonen@intel.com>
References: <cover.1434454325.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] dbus-test: Upgrade 1.8.10 -> 1.8.18
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
X-List-Received-Date: Tue, 16 Jun 2015 11:38:48 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-core/dbus/{dbus-test_1.8.10.bb => dbus-test_1.8.18.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.8.10.bb => dbus-test_1.8.18.bb} (93%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.8.10.bb b/meta/recipes-core/dbus/dbus-test_1.8.18.bb
similarity index 93%
rename from meta/recipes-core/dbus/dbus-test_1.8.10.bb
rename to meta/recipes-core/dbus/dbus-test_1.8.18.bb
index 719c1f9..e138f6e 100644
--- a/meta/recipes-core/dbus/dbus-test_1.8.10.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.8.18.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
            "
 
-SRC_URI[md5sum] = "6be5ef99ae784de9d04589eb067fe038"
-SRC_URI[sha256sum] = "10bf87fdb68815edd01d53885101dbcdd80dacad7198912cca61a4fa22dfaf8e"
+SRC_URI[md5sum] = "83e607e9ccb1c921d5b6bbea2376a36c"
+SRC_URI[sha256sum] = "36f2eb9c777a3c71562573da36a147e900a642afcd44d2b0470d992a4898c4f2"
 
 S="${WORKDIR}/dbus-${PV}"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
-- 
2.1.4


