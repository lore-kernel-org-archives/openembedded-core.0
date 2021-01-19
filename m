Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.8124.1611038764033174121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: f12YmoY0LiFsZ57FSViev30FeTw8+wc373DnfM/oKsHDH5YpAzXr6dOsT1u+h6z2ro8AY6o5pU
 Ws239oZ/D2hw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035577"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035577"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:45:57 -0800
IronPort-SDR: elroSI/eID41So1NBaoRrOMoRkSRGYx3KpTEKX8oMtYlKLUpunvZafRfeqJ9XuXqJnEe+/apZq
 jYolIDZEAYMA==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441555"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:45:56 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/30] enchant2: upgrade 2.2.14 -> 2.2.15
Date: Tue, 19 Jan 2021 14:45:23 +0800
Message-Id: <20210119064552.115692-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../enchant/{enchant2_2.2.14.bb => enchant2_2.2.15.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.2.14.bb => enchant2_2.2.15.bb} (90%)

diff --git a/meta/recipes-support/enchant/enchant2_2.2.14.bb b/meta/recipes-support/enchant/enchant2_2.2.15.bb
similarity index 90%
rename from meta/recipes-support/enchant/enchant2_2.2.14.bb
rename to meta/recipes-support/enchant/enchant2_2.2.15.bb
index a5080d9c78..05e84fc726 100644
--- a/meta/recipes-support/enchant/enchant2_2.2.14.bb
+++ b/meta/recipes-support/enchant/enchant2_2.2.15.bb
@@ -9,7 +9,7 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "bf7cc9a410b54c29648c7711dc8f210e7b13768508aaf43cc9c4527d5a9c7a8e"
+SRC_URI[sha256sum] = "3b0f2215578115f28e2a6aa549b35128600394304bd79d6f28b0d3b3d6f46c03"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.29.2

