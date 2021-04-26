Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3AXz86ras9IGFEABFFF4oiT/T9wo+eJVp4a6OvzO8dNYb6o8bTGkh/K6hFm8TjQqtBaOAmaR1U
 Lw05+3VE4Fxw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818200"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818200"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:40 -0700
IronPort-SDR: CUVqlpI5R5/bIE2XOKpGxPPIvYpgZ5Jict20hi8G+SJncZyaJyEs8QnuNbsFFYCqQs9rBy0vV+
 uUuslAADzmuQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067420"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:39 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 33/64] systemd: upgrade 247.4 -> 247.6
Date: Mon, 26 Apr 2021 08:53:04 +0800
Message-Id: <7580c864a4afdf72b34c94c694e590f087bf5298.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony Bagwell <aj.bagwell@gmail.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 63fbf39b8aa3d94ca2db719d1a53190045dbb86d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../systemd/{systemd-boot_247.4.bb => systemd-boot_247.6.bb}    | 0
 .../systemd/{systemd-conf_247.3.bb => systemd-conf_247.6.bb}    | 0
 meta/recipes-core/systemd/systemd.inc                           | 2 +-
 .../recipes-core/systemd/{systemd_247.4.bb => systemd_247.6.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd-boot_247.4.bb => systemd-boot_247.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd-conf_247.3.bb => systemd-conf_247.6.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_247.4.bb => systemd_247.6.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_247.4.bb b/meta/recipes-core/systemd/systemd-boot_247.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_247.4.bb
rename to meta/recipes-core/systemd/systemd-boot_247.6.bb
diff --git a/meta/recipes-core/systemd/systemd-conf_247.3.bb b/meta/recipes-core/systemd/systemd-conf_247.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf_247.3.bb
rename to meta/recipes-core/systemd/systemd-conf_247.6.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 098bca98f1..7d3b3064ba 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "069525e84a67375e27429cb490e8d28af78e673a"
+SRCREV = "17472dca0160cbe7b807ca648475fd70d0d62fe5"
 SRCBRANCH = "v247-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
diff --git a/meta/recipes-core/systemd/systemd_247.4.bb b/meta/recipes-core/systemd/systemd_247.6.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_247.4.bb
rename to meta/recipes-core/systemd/systemd_247.6.bb
-- 
2.30.2

