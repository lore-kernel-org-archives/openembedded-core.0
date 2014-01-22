Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A684E6E7D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 09:02:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2014 00:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,698,1384329600"; d="scan'208";a="442767939"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2014 01:01:50 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 11:04:24 +0200
Message-Id: <114421bbb85da68b4bef4e7c440f61ce3ae1ed04.1390381388.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1390381388.git.cristian.iorga@intel.com>
References: <cover.1390381388.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1390381388.git.cristian.iorga@intel.com>
References: <cover.1390381388.git.cristian.iorga@intel.com>
Subject: [PATCH 3/4] minicom: upgrade to 2.7
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
X-List-Received-Date: Wed, 22 Jan 2014 09:02:14 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../0001-fix-minicom-h-v-return-value-is-not-0.patch                | 0
 .../{minicom-2.6.2 => minicom}/allow.to.disable.lockdev.patch       | 0
 meta/recipes-extended/minicom/{minicom_2.6.2.bb => minicom_2.7.bb}  | 6 +++---
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/minicom/{minicom-2.6.2 => minicom}/0001-fix-minicom-h-v-return-value-is-not-0.patch (100%)
 rename meta/recipes-extended/minicom/{minicom-2.6.2 => minicom}/allow.to.disable.lockdev.patch (100%)
 rename meta/recipes-extended/minicom/{minicom_2.6.2.bb => minicom_2.7.bb} (77%)

diff --git a/meta/recipes-extended/minicom/minicom-2.6.2/0001-fix-minicom-h-v-return-value-is-not-0.patch b/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
similarity index 100%
rename from meta/recipes-extended/minicom/minicom-2.6.2/0001-fix-minicom-h-v-return-value-is-not-0.patch
rename to meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
diff --git a/meta/recipes-extended/minicom/minicom-2.6.2/allow.to.disable.lockdev.patch b/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
similarity index 100%
rename from meta/recipes-extended/minicom/minicom-2.6.2/allow.to.disable.lockdev.patch
rename to meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
diff --git a/meta/recipes-extended/minicom/minicom_2.6.2.bb b/meta/recipes-extended/minicom/minicom_2.7.bb
similarity index 77%
rename from meta/recipes-extended/minicom/minicom_2.6.2.bb
rename to meta/recipes-extended/minicom/minicom_2.7.bb
index 071682d..9f8ebe4 100644
--- a/meta/recipes-extended/minicom/minicom_2.6.2.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
 
-SRC_URI = "http://alioth.debian.org/frs/download.php/3869/minicom-${PV}.tar.gz \
+SRC_URI = "http://alioth.debian.org/frs/download.php/file/3977/${PN}-${PV}.tar.gz \
            file://allow.to.disable.lockdev.patch \
            file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
 "
 
-SRC_URI[md5sum] = "203c56c4b447f45e2301b0cc4e83da3c"
-SRC_URI[sha256sum] = "f3cf215f7914ffa5528e398962176102ad74df27ba38958142f56aa6d15c9168"
+SRC_URI[md5sum] = "7044ca3e291268c33294f171d426dc2d"
+SRC_URI[sha256sum] = "9ac3a663b82f4f5df64114b4792b9926b536c85f59de0f2d2b321c7626a904f4"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
-- 
1.8.3.2


