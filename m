Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 15CB778E08
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:26:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2018 04:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,214,1526367600"; d="scan'208";a="46497221"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga007.fm.intel.com with ESMTP; 12 Jun 2018 04:26:04 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id B2D9C580116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 04:26:03 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 14:18:15 +0300
Message-Id: <1528802295-11278-12-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 12/12] xdg-utils: upgrade to 1.1.3
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
X-List-Received-Date: Tue, 12 Jun 2018 11:26:03 -0000

1.1.2 -> 1.1.3

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../xdg-utils/{xdg-utils_1.1.2.bb => xdg-utils_1.1.3.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xdg-utils/{xdg-utils_1.1.2.bb => xdg-utils_1.1.3.bb} (89%)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.2.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
similarity index 89%
rename from meta/recipes-extended/xdg-utils/xdg-utils_1.1.2.bb
rename to meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index 7339289..8e46638 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.2.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://0001-Don-t-build-the-in-script-manual.patch \
           "
 
-SRC_URI[md5sum] = "361e75eb76c94d19f6f4f330d8ee626b"
-SRC_URI[sha256sum] = "951952e2c6bb21214e0bb54e0dffa057d30f5563300225c24c16fba846258bcc"
+SRC_URI[md5sum] = "902042508b626027a3709d105f0b63ff"
+SRC_URI[sha256sum] = "d798b08af8a8e2063ddde6c9fa3398ca81484f27dec642c5627ffcaa0d4051d9"
 
 UPSTREAM_CHECK_REGEX = "xdg-utils-(?P<pver>((\d+[\.\-_]*)+)((rc|alpha|beta)\d+)?)\.(tar\.gz|tgz)"
 
-- 
2.4.0


