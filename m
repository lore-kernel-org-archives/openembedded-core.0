Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E0D9460796
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 15:28:25 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2017 08:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,343,1498546800"; d="scan'208";a="135077944"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 08 Aug 2017 08:28:24 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Aug 2017 18:25:01 +0300
Message-Id: <20170808152501.20198-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
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
X-List-Received-Date: Tue, 08 Aug 2017 15:28:26 -0000

Upstream lacks a tag for this release, so make it a PR bump.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/ca-certificates/ca-certificates_20161130.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
index 42088b98994..9a80f433711 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
@@ -13,7 +13,8 @@ DEPENDS_class-native = "openssl-native"
 DEPENDS_class-nativesdk = "ca-certificates-native openssl-native"
 PACKAGE_WRITE_DEPS += "ca-certificates-native"
 
-SRCREV = "61b70a1007dc269d56881a0d480fc841daacc77c"
+SRCREV = "adc13592b55ef00450412d61a2145d162a4afb19"
+PR = "r20170717"
 
 SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
-- 
2.13.2


