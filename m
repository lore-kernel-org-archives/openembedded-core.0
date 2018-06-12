Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B91806FF78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:25:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2018 04:25:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,214,1526367600"; d="scan'208";a="46497197"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga007.fm.intel.com with ESMTP; 12 Jun 2018 04:25:52 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id BB73D5800AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 04:25:51 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 14:18:04 +0300
Message-Id: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 01/12] acpid: upgrade to 2.0.29
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
X-List-Received-Date: Tue, 12 Jun 2018 11:25:51 -0000

2.0.28 -> 2.0.29

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-bsp/acpid/{acpid_2.0.28.bb => acpid_2.0.29.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/acpid/{acpid_2.0.28.bb => acpid_2.0.29.bb} (55%)

diff --git a/meta/recipes-bsp/acpid/acpid_2.0.28.bb b/meta/recipes-bsp/acpid/acpid_2.0.29.bb
similarity index 55%
rename from meta/recipes-bsp/acpid/acpid_2.0.28.bb
rename to meta/recipes-bsp/acpid/acpid_2.0.29.bb
index 686526f..9258486 100644
--- a/meta/recipes-bsp/acpid/acpid_2.0.28.bb
+++ b/meta/recipes-bsp/acpid/acpid_2.0.29.bb
@@ -3,5 +3,5 @@ require acpid.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://acpid.h;endline=24;md5=324a9cf225ae69ddaad1bf9d942115b5"
 
-SRC_URI[md5sum] = "0432407b5ff75ae8e08afb43052fde2b"
-SRC_URI[sha256sum] = "980c3a54b0d3f2fd49fd845a0584c5c2abeaab9e9ac09fcbb68686bbb57a7110"
+SRC_URI[md5sum] = "6dd58a35cac51bd9503d769f5d13d74d"
+SRC_URI[sha256sum] = "58503b27975c466e627eb741c5453dd662f97edef1a3d0aac822fd03a84203ff"
-- 
2.4.0


