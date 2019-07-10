Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AB84E7ED76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 02:37:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Jul 2019 19:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,473,1557212400"; d="scan'208";a="170777740"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by orsmga006.jf.intel.com with ESMTP; 09 Jul 2019 19:37:28 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2019 10:37:23 +0800
Message-Id: <20190710023724.12708-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710023724.12708-1-anuj.mittal@intel.com>
References: <20190710023724.12708-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gnupg: upgrade 2.2.16 -> 2.2.17
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
X-List-Received-Date: Wed, 10 Jul 2019 02:37:28 -0000
Content-Transfer-Encoding: 8bit

Also fixes CVE-2019-13050. Announcement:

https://lists.gnupg.org/pipermail/gnupg-announce/2019q3/000439.html

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gnupg/{gnupg_2.2.16.bb => gnupg_2.2.17.bb}               | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.16.bb => gnupg_2.2.17.bb} (92%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.16.bb b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
similarity index 92%
rename from meta/recipes-support/gnupg/gnupg_2.2.16.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.17.bb
index cb7c6c5c62..e5456dd9b9 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.16.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.17.bb
@@ -19,9 +19,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 
-
-SRC_URI[md5sum] = "d90e186df1c06845880ea58a318f070b"
-SRC_URI[sha256sum] = "6cbe8d454bf5dc204621eed3016d721b66298fa95363395bb8eeceb1d2fd14cb"
+SRC_URI[md5sum] = "1ba2d9b70c377f8e967742064c27a19c"
+SRC_URI[sha256sum] = "afa262868e39b651a2db4c071fba90415154243e83a830ca00516f9a807fd514"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.20.1


