Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 507C078643
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 13:46:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Nov 2017 05:46:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,374,1505804400"; 
   d="scan'208";a="558790"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Nov 2017 05:46:37 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id D6CFA5801AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:46:36 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Nov 2017 15:46:55 +0200
Message-Id: <1510321615-24099-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] libsoup-2.4: upgrade to 2.60.2
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
X-List-Received-Date: Fri, 10 Nov 2017 13:46:39 -0000

2.60.1 -> 2.60.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libsoup/{libsoup-2.4_2.60.1.bb => libsoup-2.4_2.60.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.60.1.bb => libsoup-2.4_2.60.2.bb} (89%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.60.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb
similarity index 89%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.60.1.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb
index 7229a93..abc7bdb 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.60.1.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb
@@ -11,8 +11,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "4b3fb98f742d81f1850c0846a40470e2"
-SRC_URI[sha256sum] = "023930032b20e6b14764feb847ea80d9e170622dee7370215d6feb9967b6aa9d"
+SRC_URI[md5sum] = "9c49831b62c4bf18cdb81c86ac6516fd"
+SRC_URI[sha256sum] = "7263cfe18872e2e652c196f5667e514616d9c97c861dfca82a65a55f45f0da01"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.4.0


