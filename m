Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6787488E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 15:33:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 08:33:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; d="scan'208";a="34246094"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 04 Apr 2018 08:33:44 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 3013A5801FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 08:33:43 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 18:32:22 +0300
Message-Id: <1522855946-8702-6-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
References: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 06/10] vte: upgrade to version 0.52.0
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
X-List-Received-Date: Wed, 04 Apr 2018 15:33:44 -0000

Removed configuration option "--disable-test-application"
[unknown-configure-option]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/vte/{vte_0.50.2.bb => vte_0.52.0.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/vte/{vte_0.50.2.bb => vte_0.52.0.bb} (89%)

diff --git a/meta/recipes-support/vte/vte_0.50.2.bb b/meta/recipes-support/vte/vte_0.52.0.bb
similarity index 89%
rename from meta/recipes-support/vte/vte_0.50.2.bb
rename to meta/recipes-support/vte/vte_0.52.0.bb
index 8b9ee33..254d64e 100644
--- a/meta/recipes-support/vte/vte_0.50.2.bb
+++ b/meta/recipes-support/vte/vte_0.52.0.bb
@@ -11,8 +11,8 @@ inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject
 SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
             ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
             "
-SRC_URI[archive.md5sum] = "1912cfd1d9cdd30cebeb908507acadc5"
-SRC_URI[archive.sha256sum] = "79dd316bfaff48f2fb74d066baae0d830e1f44436796fe410a57297e5c5f09cf"
+SRC_URI[archive.md5sum] = "95b0d12864f7374128da33998e756e75"
+SRC_URI[archive.sha256sum] = "d5ae72dddd57af493afa10ca2a290f284e588021b0bd8aaaa63dbb75de7c0567"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -38,8 +38,6 @@ PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 
 CFLAGS += "-D_GNU_SOURCE"
 
-EXTRA_OECONF = "--disable-test-application"
-
 # libtool adds "-nostdlib" when g++ is used. This breaks PIE builds.
 # Use libtool-cross (which has a hack to prevent that) instead.
 EXTRA_OEMAKE_class-target = "LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
-- 
2.4.0


