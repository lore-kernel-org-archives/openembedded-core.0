Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E0AAE73D41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 14:47:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2015 07:47:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,609,1422950400"; d="scan'208";a="483183554"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Apr 2015 07:47:49 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 17:46:46 +0300
Message-Id: <46509a0a7ff4a7ab3536451b6f02a91df6e0e905.1429540534.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429540534.git.cristian.iorga@intel.com>
References: <cover.1429540534.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1429540534.git.cristian.iorga@intel.com>
References: <cover.1429540534.git.cristian.iorga@intel.com>
Subject: [PATCH v2 4/4] bitbake.conf: backfill bluez5 feature
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
X-List-Received-Date: Mon, 20 Apr 2015 14:48:00 -0000

If bluez4 is not explicitly passed as a
distro feature, bluez5 should be used as
the default, so backfill it.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2b3c110..f544a71 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -733,7 +733,7 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 EXTRA_IMAGE_FEATURES ??= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit"
+DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5"
 MACHINE_FEATURES_BACKFILL = "rtc"
 
 COMBINED_FEATURES = "\
-- 
2.1.0


