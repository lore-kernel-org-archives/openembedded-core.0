Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1133978397
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 13:38:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 06:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,448,1498546800"; d="scan'208";a="1189802856"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2017 06:38:40 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Aug 2017 16:35:42 +0300
Message-Id: <20170830133542.35850-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] ca-certificates: update to 20170717
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
X-List-Received-Date: Wed, 30 Aug 2017 13:38:53 -0000

This is actually the same version as previously; upstream didn't have
a tag for it before and now it does, so we can reduce confusion. The SRCREV
change is due to a few added commits which modify upstream's debian
packaging (not used by us).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../{ca-certificates_20161130.bb => ca-certificates_20170717.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20161130.bb => ca-certificates_20170717.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
similarity index 97%
rename from meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
index fa72f71af91..59e7d514373 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
@@ -14,8 +14,7 @@ DEPENDS_class-nativesdk = "openssl-native"
 # Need c_rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRCREV = "adc13592b55ef00450412d61a2145d162a4afb19"
-PR = "r20170717"
+SRCREV = "34b8e19e541b8af4076616b2e170c7a70cdaded0"
 
 SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
-- 
2.14.1


