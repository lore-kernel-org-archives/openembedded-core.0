Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.34266.1629168135472276180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 19:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="214133341"
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="214133341"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:21 -0700
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="593153075"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.145])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:42:20 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] thermald: upgrade 2.4.4 -> 2.4.6
Date: Tue, 17 Aug 2021 10:42:09 +0800
Message-Id: <20210817024209.114840-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817024209.114840-1-anuj.mittal@intel.com>
References: <20210817024209.114840-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release 2.4.6
- Fix for Ubuntu bug 1930422

Release 2.4.5
- Address low performance with Dell Latitude 5420
with the latest BIOS

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../thermald/{thermald_2.4.4.bb => thermald_2.4.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename dynamic-layers/openembedded-layer/recipes-bsp/thermald/{thermald_2.4.4.bb => thermald_2.4.6.bb} (96%)

diff --git a/dynamic-layers/openembedded-layer/recipes-bsp/thermald/thermald_2.4.4.bb b/dynamic-layers/openembedded-layer/recipes-bsp/thermald/thermald_2.4.6.bb
similarity index 96%
rename from dynamic-layers/openembedded-layer/recipes-bsp/thermald/thermald_2.4.4.bb
rename to dynamic-layers/openembedded-layer/recipes-bsp/thermald/thermald_2.4.6.bb
index 906b85aa..b147a558 100644
--- a/dynamic-layers/openembedded-layer/recipes-bsp/thermald/thermald_2.4.4.bb
+++ b/dynamic-layers/openembedded-layer/recipes-bsp/thermald/thermald_2.4.6.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea8831610e926e2e469075b52bf08848"
 SRC_URI = "git://github.com/intel/thermal_daemon/ \
            "
 
-SRCREV = "d6f89c9e8afdb449a442646da46f3140634175c1"
+SRCREV = "dddba484b23562d421cdaf1703dabc602e1968e7"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools systemd gtk-doc
-- 
2.31.1

