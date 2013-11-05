Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 944536D092
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 09:25:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2013 01:21:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,638,1378882800"; d="scan'208";a="422417482"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 05 Nov 2013 01:25:25 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2013 11:25:15 +0200
Message-Id: <e53af1c4804a880196d8d176bbe7597e7148335d.1383643350.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
Subject: [PATCH 5/7] xz: upgrade to 5.1.3alpha
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
X-List-Received-Date: Tue, 05 Nov 2013 09:25:26 -0000

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xz/{xz_5.1.2alpha.bb => xz_5.1.3alpha.bb}      |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.1.2alpha.bb => xz_5.1.3alpha.bb} (87%)

diff --git a/meta/recipes-extended/xz/xz_5.1.2alpha.bb b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
similarity index 87%
rename from meta/recipes-extended/xz/xz_5.1.2alpha.bb
rename to meta/recipes-extended/xz/xz_5.1.3alpha.bb
index 92c3dd9..b49fbf7 100644
--- a/meta/recipes-extended/xz/xz_5.1.2alpha.bb
+++ b/meta/recipes-extended/xz/xz_5.1.3alpha.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
 
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[md5sum] = "9bad1e249537ce69b206815cf28ca87b"
-SRC_URI[sha256sum] = "70e792d2a67cfbb8f2dffd0feab6ca6e5a4a618d65070fb44a367629d1ba94e5"
+SRC_URI[md5sum] = "bbb2daa876c87fb2cf9fe4590af9694e"
+SRC_URI[sha256sum] = "9f94506e301d5b6863921bba861a99ba00de384dafb4e5f409679a93e41613d4"
 
 inherit autotools gettext
 
-- 
1.7.9.5


