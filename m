Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 31E2477702
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Mar 2017 11:50:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 04 Mar 2017 03:50:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,241,1484035200"; d="scan'208";a="1118356283"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2017 03:50:55 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id C112D6A4080
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Mar 2017 03:50:52 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Mar 2017 13:52:52 +0200
Message-Id: <1488628372-29661-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] screen: update to 4.5.1
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
X-List-Received-Date: Sat, 04 Mar 2017 11:50:55 -0000

4.4.0 -> 4.5.1

Fixes logfile permissions problem (CVE-2017-5618)

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/screen/{screen_4.4.0.bb => screen_4.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/screen/{screen_4.4.0.bb => screen_4.5.1.bb} (93%)

diff --git a/meta/recipes-extended/screen/screen_4.4.0.bb b/meta/recipes-extended/screen/screen_4.5.1.bb
similarity index 93%
rename from meta/recipes-extended/screen/screen_4.4.0.bb
rename to meta/recipes-extended/screen/screen_4.5.1.bb
index f2c57b5..32c1a5a 100644
--- a/meta/recipes-extended/screen/screen_4.4.0.bb
+++ b/meta/recipes-extended/screen/screen_4.5.1.bb
@@ -26,8 +26,8 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0001-fix-for-multijob-build.patch \
           "
 
-SRC_URI[md5sum] = "d26e11a3648c2b11aaefa215a55dfd39"
-SRC_URI[sha256sum] = "ef722a54759a3bf23aad272bbf33c414c1078cad6bcd982fada93c0d7917218b"
+SRC_URI[md5sum] = "a8c5da2f42f8a18fa4dada2419d1549b"
+SRC_URI[sha256sum] = "97db2114dd963b016cd4ded34831955dcbe3251e5eee45ac2606e67e9f097b2d"
 
 inherit autotools texinfo
 
-- 
2.4.0


