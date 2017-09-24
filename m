Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7B871B48
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Sep 2017 20:18:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2017 13:18:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,433,1500966000"; d="scan'208";a="138898079"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 24 Sep 2017 13:18:30 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 2D0EC5803E0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Sep 2017 13:18:29 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Sep 2017 23:21:13 +0300
Message-Id: <1506284473-40990-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] default-providers: set pkgconf as the preferred provider for pkg-config
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
X-List-Received-Date: Sun, 24 Sep 2017 20:18:30 -0000

Replace system pkg-config implementation with pkgconf

[YOCTO #11308]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/conf/distro/include/default-providers.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index f54fdcd..f441d74 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -53,6 +53,6 @@ PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"
 PREFERRED_PROVIDER_openssl ?= "openssl"
 PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
 PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
-PREFERRED_PROVIDER_pkgconfig ?= "pkgconfig"
-PREFERRED_PROVIDER_nativesdk-pkgconfig ?= "nativesdk-pkgconfig"
-PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconfig-native"
+PREFERRED_PROVIDER_pkgconfig ?= "pkgconf"
+PREFERRED_PROVIDER_nativesdk-pkgconfig ?= "nativesdk-pkgconf"
+PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconf-native"
-- 
2.4.0


