Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.24792.1611128477823315504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 23:41:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: uWfEMwNCpUsXOeZRJE3CWP0BJLEqXjBkzImX9KkbeWFT649jlxeF64cYBVG9ijbQ1+A5HaBsXs
 91jnJpTAM7nA==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="158240448"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="158240448"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:19 -0800
IronPort-SDR: G6ABYvviXRBaemq1wvcxigeSvOEKtJbTSDRHuHul0cnV8PMirzPgDtAABiTADHgCiLQB7rQuxN
 7VWsCtBO+I/w==
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="350958510"
Received: from mrengasa-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.144.190])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:18 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] python3-dbusmock: upgrade 0.19 -> 0.22.0
Date: Wed, 20 Jan 2021 15:40:51 +0800
Message-Id: <20210120074058.252462-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120074058.252462-1-anuj.mittal@intel.com>
References: <20210120074058.252462-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{python3-dbusmock_0.19.bb => python3-dbusmock_0.22.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.19.bb => python3-dbusmock_0.22.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.19.bb b/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-dbusmock_0.19.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
index d297dbc1df..b1feee8416 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.19.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.22.0.bb
@@ -3,7 +3,7 @@ SUMMARY = "With this program/Python library you can easily create mock objects o
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "497f30eed2fcd5deaa2633b9622e4e99af4bdfba4e972b350ba630bac6fc86c2"
+SRC_URI[sha256sum] = "2191919cc411fb94953b36e46bfd55ee5ad4162432ee0d0892bc2c4770ff5d7c"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.29.2

