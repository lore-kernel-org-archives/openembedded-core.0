Return-Path: <maxin.john@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 91D637488E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 15:33:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 08:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; d="scan'208";a="39337643"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Apr 2018 08:33:45 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 38BD55801C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 08:33:45 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 18:32:23 +0300
Message-Id: <1522855946-8702-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
References: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 07/10] libusb1: upgrade to version 1.0.22
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
X-List-Received-Date: Wed, 04 Apr 2018 15:33:45 -0000

1.0.21 -> 1.0.22

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/libusb/{libusb1_1.0.21.bb => libusb1_1.0.22.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.21.bb => libusb1_1.0.22.bb} (86%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.21.bb b/meta/recipes-support/libusb/libusb1_1.0.22.bb
similarity index 86%
rename from meta/recipes-support/libusb/libusb1_1.0.21.bb
rename to meta/recipes-support/libusb/libusb1_1.0.22.bb
index 1fefd14..766c1c3 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.21.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
@@ -12,8 +12,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
            file://no-dll.patch \
           "
 
-SRC_URI[md5sum] = "1da9ea3c27b3858fa85c5f4466003e44"
-SRC_URI[sha256sum] = "7dce9cce9a81194b7065ee912bcd55eeffebab694ea403ffb91b67db66b1824b"
+SRC_URI[md5sum] = "466267889daead47674df933cea9cacb"
+SRC_URI[sha256sum] = "75aeb9d59a4fdb800d329a545c2e6799f732362193b465ea198f2aa275518157"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-- 
2.4.0


