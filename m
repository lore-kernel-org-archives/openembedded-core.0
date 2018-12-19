Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E18BF7BF28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 07:29:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2018 23:29:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,371,1539673200"; d="scan'208";a="119597357"
Received: from anmitta2-mobl1.png.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.221.21.206])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2018 23:29:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 15:29:23 +0800
Message-Id: <20181219072929.5870-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181219072929.5870-1-anuj.mittal@intel.com>
References: <20181219072929.5870-1-anuj.mittal@intel.com>
Subject: [PATCH 3/9] libatomic-ops: upgrade 7.6.6 -> 7.6.8
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
X-List-Received-Date: Wed, 19 Dec 2018 07:29:33 -0000

For changes, see:

https://github.com/ivmai/libatomic_ops/compare/v7.6.6...v7.6.8

Also switch to using tarball release instead.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{libatomic-ops_7.6.6.bb => libatomic-ops_7.6.8.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.6.bb => libatomic-ops_7.6.8.bb} (61%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.6.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.8.bb
similarity index 61%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.6.6.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.6.8.bb
index 32d26a34e9..b40e567142 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.6.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.8.bb
@@ -6,13 +6,13 @@ LICENSE = "GPLv2 & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
                     "
-PV .= "+git${SRCPV}"
-SRCBRANCH ?= "release-7_6"
 
-SRCREV = "76ffb3b87946e4c372d112d8d00786632deab934"
-SRC_URI = "git://github.com/ivmai/libatomic_ops;branch=${SRCBRANCH}"
+SRC_URI = "https://github.com/ivmai/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
 
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "99128f05e3e3f4e0cd39aa23f23bbe0c"
+SRC_URI[sha256sum] = "1d6a279edf81767e74d2ad2c9fce09459bc65f12c6525a40b0cb3e53c089f665"
+
+S = "${WORKDIR}/libatomic_ops-${PV}"
 
 ALLOW_EMPTY_${PN} = "1"
 
-- 
2.17.1


