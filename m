Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D17B678DF8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 11:25:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2018 04:26:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,214,1526367600"; d="scan'208";a="58555089"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 12 Jun 2018 04:26:00 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 5EA27580116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 04:25:59 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2018 14:18:11 +0300
Message-Id: <1528802295-11278-8-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 08/12] vte: upgrade to 0.52.2
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
X-List-Received-Date: Tue, 12 Jun 2018 11:26:00 -0000

0.52.0 -> 0.52.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/vte/{vte_0.52.0.bb => vte_0.52.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.52.0.bb => vte_0.52.2.bb} (91%)

diff --git a/meta/recipes-support/vte/vte_0.52.0.bb b/meta/recipes-support/vte/vte_0.52.2.bb
similarity index 91%
rename from meta/recipes-support/vte/vte_0.52.0.bb
rename to meta/recipes-support/vte/vte_0.52.2.bb
index 254d64e..7324c9c 100644
--- a/meta/recipes-support/vte/vte_0.52.0.bb
+++ b/meta/recipes-support/vte/vte_0.52.2.bb
@@ -11,8 +11,8 @@ inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject
 SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
             ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
             "
-SRC_URI[archive.md5sum] = "95b0d12864f7374128da33998e756e75"
-SRC_URI[archive.sha256sum] = "d5ae72dddd57af493afa10ca2a290f284e588021b0bd8aaaa63dbb75de7c0567"
+SRC_URI[archive.md5sum] = "de8181350dccb010e915e366bdd06d18"
+SRC_URI[archive.sha256sum] = "0f2657cef52accbfe56feede553155552d7c1984b1291838af3cb8cfc19b26af"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.4.0


