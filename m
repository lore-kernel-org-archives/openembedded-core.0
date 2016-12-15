Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C831D772BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 12:48:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 04:48:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,351,1477983600"; d="scan'208";a="18480805"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 04:48:34 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 14:47:59 +0200
Message-Id: <5bf7943175cac7cf2e134e7e4124d7b7113c8490.1481805889.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
References: <cover.1481805889.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/16] ca-certificates: update to 20161130
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
X-List-Received-Date: Thu, 15 Dec 2016 12:48:33 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{ca-certificates_20161102.bb => ca-certificates_20161130.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20161102.bb => ca-certificates_20161130.bb} (98%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20161102.bb b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
similarity index 98%
rename from meta/recipes-support/ca-certificates/ca-certificates_20161102.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
index 350b266..e0b2e41 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20161102.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
@@ -12,7 +12,7 @@ DEPENDS = "ca-certificates-native"
 DEPENDS_class-native = "openssl-native"
 DEPENDS_class-nativesdk = "ca-certificates-native openssl-native"
 
-SRCREV = "c6a4c8182eda2527eecda90ba0aebc73d8c07d62"
+SRCREV = "61b70a1007dc269d56881a0d480fc841daacc77c"
 
 SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
-- 
2.10.2


