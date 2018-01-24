Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3C987786BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 13:50:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jan 2018 05:50:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,407,1511856000"; d="scan'208";a="12823197"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga008.fm.intel.com with ESMTP; 24 Jan 2018 05:50:47 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 68493580385
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 05:50:46 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jan 2018 15:52:31 +0200
Message-Id: <1516801953-19706-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/3] libsoup-2.4: upgrade to version 2.60.3
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
X-List-Received-Date: Wed, 24 Jan 2018 13:50:46 -0000

2.60.2 -> 2.60.3

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libsoup/{libsoup-2.4_2.60.2.bb => libsoup-2.4_2.60.3.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.60.2.bb => libsoup-2.4_2.60.3.bb} (89%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.60.3.bb
similarity index 89%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.60.3.bb
index abc7bdb..e2e7ff4 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.60.3.bb
@@ -11,8 +11,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "9c49831b62c4bf18cdb81c86ac6516fd"
-SRC_URI[sha256sum] = "7263cfe18872e2e652c196f5667e514616d9c97c861dfca82a65a55f45f0da01"
+SRC_URI[md5sum] = "4cf8937d161d3dd71a65f1684e317824"
+SRC_URI[sha256sum] = "1b0dc762f23abe4e0d29b77370e539fd35f31d8e8e0318d6ddccff395be68a22"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.4.0


