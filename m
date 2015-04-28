Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BD56573D36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 09:03:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 28 Apr 2015 02:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,662,1422950400"; d="scan'208";a="686749302"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga001.jf.intel.com with ESMTP; 28 Apr 2015 02:03:28 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 12:03:18 +0300
Message-Id: <901c691f39cb416949a1a3524ad3237918968770.1430211653.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430211653.git.cristian.iorga@intel.com>
References: <cover.1430211653.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1430211653.git.cristian.iorga@intel.com>
References: <cover.1430211653.git.cristian.iorga@intel.com>
Subject: [PATCH v6 3/3] bitbake.conf: backfill bluez5 feature
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
X-List-Received-Date: Tue, 28 Apr 2015 09:03:28 -0000

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


