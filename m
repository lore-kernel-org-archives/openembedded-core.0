Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EC40677D70
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 06:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491545384; x=1523081384;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=hiJmdZWB15C7cJXUM3023Ols4XQRvNVWzrIxdavg64A=;
	b=c7Q5iMO+v/3v5ATLs03c6j7C2tiVO+zliab5Z11hsNU7TIjWFZ3cj4Vo
	YE60cNTNCwSaGxFt/vz37WUdHbiWDw==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 23:09:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,163,1488873600"; d="scan'208";a="245702696"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 06 Apr 2017 23:09:43 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 9BA106A4080;
	Thu,  6 Apr 2017 23:09:34 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 09:09:35 +0300
Message-Id: <2e4108bd2b3cde928d797323dd62cdde4f9de4a6.1491483222.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1491483222.git.jussi.kukkonen@intel.com>
References: <cover.1491483222.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/4] xorg-font-common.inc: Remove x11 requirement
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
X-List-Received-Date: Fri, 07 Apr 2017 06:09:43 -0000

Remove the fake news about mkfontscale-native needing x11.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-font/xorg-font-common.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
index cdbebcf..82a8487 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -16,9 +16,6 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig distro_features_check
 
-# The mkfontscale-native requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
-
 EXTRA_OEMAKE += "FCCACHE=/bin/true UTIL_DIR=${STAGING_DIR_TARGET}\$\(MAPFILES_PATH\)"
 
 do_install_append() {
-- 
2.1.4


