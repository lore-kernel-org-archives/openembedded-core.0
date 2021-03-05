Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7836.1614918119443975246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: pLqWytiiA60MOtuPRYN5GooXtraoJ6b+Bg/zaVPG51P9Y9uG3h8ftQWJmGK7IAtWiHE7ZstW12
 45Yef00DVb8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187670814"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187670814"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:21:59 -0800
IronPort-SDR: zK563AgaKYzzWGxL23o7ejDvgcJq80nGmsgo2vEZfAPGmykkHaZbw+E2ikeMQX6Po3Zjd4k9uH
 TPbN6o5G5y7w==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128749"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:21:58 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 01/52] local.conf.sample.extended: prefer INIT_MANAGER
Date: Fri,  5 Mar 2021 12:20:37 +0800
Message-Id: <311c60fd791436da256fb63ba3db437e4e9e8d97.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivien Didelot <vdidelot@pbsc.com>

Since the INIT_MANAGER variable has been introduced, there is no need
to append the distro features and set the init manager manually.

Replace the busybox/mdev and systemd examples with the 4 values
currently supported for the INIT_MANAGER variable.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 514454651522f97590d1403c50effd9c79df827a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/local.conf.sample.extended | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 411717b615..5b04be8892 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -371,23 +371,12 @@
 #
 
 #
-# Use busybox/mdev for system initialization
-#
-#VIRTUAL-RUNTIME_dev_manager = "busybox-mdev"
-#VIRTUAL-RUNTIME_login_manager = "busybox"
-#VIRTUAL-RUNTIME_init_manager = "busybox"
-#VIRTUAL-RUNTIME_initscripts = "initscripts"
-#VIRTUAL-RUNTIME_keymaps = "keymaps"
-#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
-
-#
-# Use systemd for system initialization
+# System initialization
 #
-#DISTRO_FEATURES_append = " systemd"
-#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
-#VIRTUAL-RUNTIME_login_manager = "shadow-base"
-#VIRTUAL-RUNTIME_init_manager = "systemd"
-#VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
+#INIT_MANAGER = "none"
+#INIT_MANAGER = "sysvinit"
+#INIT_MANAGER = "systemd"
+#INIT_MANAGER = "mdev-busybox"
 
 #
 # Use a full set of packages instead of busybox for base utils
-- 
2.29.2

