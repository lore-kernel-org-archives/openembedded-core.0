Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1062778889
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:34:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:34:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="29064558"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 19 Feb 2018 00:34:53 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 813625802D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:34:52 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:36:53 +0200
Message-Id: <1519029438-11092-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 02/27] default-providers.inc: set pkgconf as default pkg-config provider
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
X-List-Received-Date: Mon, 19 Feb 2018 08:34:53 -0000

Move from freedesktop.org's pkg-config to pkgconf

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/conf/distro/include/default-providers.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index e65c1ed..95a7dfc 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -50,7 +50,7 @@ PREFERRED_PROVIDER_getopt ?= "util-linux-getopt"
 PREFERRED_PROVIDER_openssl ?= "openssl"
 PREFERRED_PROVIDER_openssl-native ?= "openssl-native"
 PREFERRED_PROVIDER_nativesdk-openssl ?= "nativesdk-openssl"
-PREFERRED_PROVIDER_pkgconfig ?= "pkgconfig"
-PREFERRED_PROVIDER_nativesdk-pkgconfig ?= "nativesdk-pkgconfig"
-PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconfig-native"
+PREFERRED_PROVIDER_pkgconfig ?= "pkgconf"
+PREFERRED_PROVIDER_nativesdk-pkgconfig ?= "nativesdk-pkgconf"
+PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconf-native"
 PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
-- 
2.4.0


