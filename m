Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2A15771AAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:26 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412234"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:27 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:15 +0200
Message-Id: <a9ff38102f4d26bb7261915ca9f10a3bee1bc07d.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/18] ca-certificates: upgrade to 20161102
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:26 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{ca-certificates_20160104.bb => ca-certificates_20161102.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20160104.bb => ca-certificates_20161102.bb} (98%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb b/meta/recipes-support/ca-certificates/ca-certificates_20161102.bb
similarity index 98%
rename from meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20161102.bb
index 1bea067..350b266 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20161102.bb
@@ -12,7 +12,7 @@ DEPENDS = "ca-certificates-native"
 DEPENDS_class-native = "openssl-native"
 DEPENDS_class-nativesdk = "ca-certificates-native openssl-native"
 
-SRCREV = "f54715702c5c0581c9461f78fd84e2c8d2ec243c"
+SRCREV = "c6a4c8182eda2527eecda90ba0aebc73d8c07d62"
 
 SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
-- 
2.10.2


