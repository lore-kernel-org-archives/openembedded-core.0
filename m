Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9FUZZoO4obhUJwNNqIxsuwOd0+3WFzdSYSM2oQDJqR7ucWTn8IaXWn71+gStUYqWyLnet0eOTo
 h6ja/8hwC2og==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247056"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247056"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:19 -0800
IronPort-SDR: NeDgMing7CGLkgMAmM6BBpmdF83xZUbh6/6YRaQ88waAQQ30WS0XHoTaaX/xSLMRX/68z3IcYV
 xgtOn6ctRp3w==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825386"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:17 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/27] help2man: upgrade 1.47.16 -> 1.48.1
Date: Wed, 17 Feb 2021 13:51:46 +0800
Message-Id: <20210217055210.22019-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../help2man/{help2man_1.47.16.bb => help2man_1.48.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/help2man/{help2man_1.47.16.bb => help2man_1.48.1.bb} (86%)

diff --git a/meta/recipes-devtools/help2man/help2man_1.47.16.bb b/meta/recipes-devtools/help2man/help2man_1.48.1.bb
similarity index 86%
rename from meta/recipes-devtools/help2man/help2man_1.47.16.bb
rename to meta/recipes-devtools/help2man/help2man_1.48.1.bb
index 27a15eb0e2..8341f2ba39 100644
--- a/meta/recipes-devtools/help2man/help2man_1.47.16.bb
+++ b/meta/recipes-devtools/help2man/help2man_1.48.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3ef8580c5b86e32ca092ce8de43df204f5e6f714b0cd32bc6237e6cd0f34a8f4"
+SRC_URI[sha256sum] = "de8a74740bd058646567b92ab4ecdeb9da9f1a07cc7c4f607a3c14dd38d10799"
 
 inherit autotools
 
-- 
2.29.2

