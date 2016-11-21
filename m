Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7F76612C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:22:25 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP; 21 Nov 2016 04:22:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,675,1473145200"; d="scan'208";a="33963631"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 21 Nov 2016 04:22:27 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 3DAAE6A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 04:21:46 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 14:22:50 +0200
Message-Id: <1479730971-23120-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1479730971-23120-1-git-send-email-maxin.john@intel.com>
References: <1479730971-23120-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/5] iw: upgrade to 4.9
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
X-List-Received-Date: Mon, 21 Nov 2016 12:22:27 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-connectivity/iw/{iw_4.7.bb => iw_4.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iw/{iw_4.7.bb => iw_4.9.bb} (86%)

diff --git a/meta/recipes-connectivity/iw/iw_4.7.bb b/meta/recipes-connectivity/iw/iw_4.9.bb
similarity index 86%
rename from meta/recipes-connectivity/iw/iw_4.7.bb
rename to meta/recipes-connectivity/iw/iw_4.9.bb
index e9f4141..6daeb07 100644
--- a/meta/recipes-connectivity/iw/iw_4.7.bb
+++ b/meta/recipes-connectivity/iw/iw_4.9.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[md5sum] = "19d1edd276b2ac0c6cccfc7ae8d2b732"
-SRC_URI[sha256sum] = "758092229f13d691968060a0ad41364ba8eb8da4503626c20233a5b1eb33b4d9"
+SRC_URI[md5sum] = "06e96ab7a5c652f8eaed6f71533a9e0f"
+SRC_URI[sha256sum] = "12f921f3dbe0f33c309f5f2891cccf5325c94bd48dceeb102de183f5f048a9e2"
 
 inherit pkgconfig
 
-- 
2.4.0


