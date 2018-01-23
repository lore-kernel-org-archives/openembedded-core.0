Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCA67875B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:04:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 06:04:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,401,1511856000"; d="scan'208";a="25668488"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2018 06:04:10 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 05B9C5800D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:04:09 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 16:05:42 +0200
Message-Id: <1516716352-32735-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 02/12] libsoup-2.4: upgrade to version 2.61.2
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
X-List-Received-Date: Tue, 23 Jan 2018 14:04:09 -0000

2.60.2 -> 2.61.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libsoup/{libsoup-2.4_2.60.2.bb => libsoup-2.4_2.61.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.60.2.bb => libsoup-2.4_2.61.2.bb} (89%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.61.2.bb
similarity index 89%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.61.2.bb
index abc7bdb..9414278 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.60.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.61.2.bb
@@ -11,8 +11,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "9c49831b62c4bf18cdb81c86ac6516fd"
-SRC_URI[sha256sum] = "7263cfe18872e2e652c196f5667e514616d9c97c861dfca82a65a55f45f0da01"
+SRC_URI[md5sum] = "cf70001a73925a0f12b5b34b91c68923"
+SRC_URI[sha256sum] = "fe786a9d0a59454bd59f5d3198b9aea5f6518adda36561e7d31461bf7f791785"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.4.0


