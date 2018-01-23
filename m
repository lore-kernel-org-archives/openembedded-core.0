Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ADF0E7878B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:04:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 06:04:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,401,1511856000"; d="scan'208";a="24037635"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 23 Jan 2018 06:04:16 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 1E3EC5803BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:04:15 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 16:05:48 +0200
Message-Id: <1516716352-32735-9-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 08/12] vte: upgrade to version 0.50.2
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
X-List-Received-Date: Tue, 23 Jan 2018 14:04:16 -0000

0.50.1 -> 0.50.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/vte/{vte_0.50.1.bb => vte_0.50.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.50.1.bb => vte_0.50.2.bb} (91%)

diff --git a/meta/recipes-support/vte/vte_0.50.1.bb b/meta/recipes-support/vte/vte_0.50.2.bb
similarity index 91%
rename from meta/recipes-support/vte/vte_0.50.1.bb
rename to meta/recipes-support/vte/vte_0.50.2.bb
index 1c77c7d..8b9ee33 100644
--- a/meta/recipes-support/vte/vte_0.50.1.bb
+++ b/meta/recipes-support/vte/vte_0.50.2.bb
@@ -11,8 +11,8 @@ inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject
 SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
             ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
             "
-SRC_URI[archive.md5sum] = "a6f8fec3787e3cb72b3b31a8be6751a4"
-SRC_URI[archive.sha256sum] = "cf1708e3e573160e1db107014b3ef70888fefe6b668373fed70e8d1cac45a8c2"
+SRC_URI[archive.md5sum] = "1912cfd1d9cdd30cebeb908507acadc5"
+SRC_URI[archive.sha256sum] = "79dd316bfaff48f2fb74d066baae0d830e1f44436796fe410a57297e5c5f09cf"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.4.0


