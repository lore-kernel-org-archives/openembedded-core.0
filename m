Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 53FCB6FF78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:25:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2018 04:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,214,1526367600"; d="scan'208";a="46497200"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga007.fm.intel.com with ESMTP; 12 Jun 2018 04:25:54 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id E54DD580116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 04:25:53 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 14:18:06 +0300
Message-Id: <1528802295-11278-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 03/12] libsoup-2.4: upgrade to 2.62.2
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
X-List-Received-Date: Tue, 12 Jun 2018 11:25:53 -0000

2.62.0 -> 2.62.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../libsoup/{libsoup-2.4_2.62.0.bb => libsoup-2.4_2.62.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.62.0.bb => libsoup-2.4_2.62.2.bb} (89%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.62.0.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.62.2.bb
similarity index 89%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.62.0.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.62.2.bb
index 5c9dd19..a9f3554 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.62.0.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.62.2.bb
@@ -11,8 +11,8 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "750b6f6136e5fdd82ac07f60b4aea575"
-SRC_URI[sha256sum] = "ab7c7ae8d19d0a27ab3b6ae21599cec8c7f7b773b3f2b1090c5daf178373aaac"
+SRC_URI[md5sum] = "eaf99b04ac8968ed2b26f2509ba75584"
+SRC_URI[sha256sum] = "9e536fe3da60b25d2c63addb84a9d5072d00b0d8b8cbeabc629a6bcd63f879b6"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
2.4.0


