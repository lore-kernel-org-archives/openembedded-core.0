Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 425EB77D3C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 10:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491908135; x=1523444135;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=N14AwzT5cRC7j3nEliojFhWOW8djhlNhvtj7B8/Zduc=;
	b=V6fM7NRQC97z0DDV7R4ECdPXabr6QgaZd4j/RnlpBGmabB7gHhxRBBpR
	Ua2i7mcnpTVTJ/iI63edHliUzoQDrw==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2017 03:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,185,1488873600"; d="scan'208";a="87356896"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2017 03:55:34 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id E058A6A4006;
	Tue, 11 Apr 2017 03:55:23 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 13:55:23 +0300
Message-Id: <84f209c5b50bfc13fa70a294f75059be3362aee6.1491907553.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1491907553.git.jussi.kukkonen@intel.com>
References: <cover.1491907553.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 3/4] xorg-font-common.inc: Remove x11 requirement for -native
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
X-List-Received-Date: Tue, 11 Apr 2017 10:55:33 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/xorg-font/xorg-font-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
index cdbebcf..520c88a 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -18,6 +18,7 @@ inherit autotools pkgconfig distro_features_check
 
 # The mkfontscale-native requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES_class-native = ""
 
 EXTRA_OEMAKE += "FCCACHE=/bin/true UTIL_DIR=${STAGING_DIR_TARGET}\$\(MAPFILES_PATH\)"
 
-- 
2.1.4


