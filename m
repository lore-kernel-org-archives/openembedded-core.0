Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.8243.1611038795825494015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: GpUDh3RZNMyJJHTkFsZ/Ju4ZD8Siowcs+boKs0MU3QeKtFZ7Nq1y/Zb78w7guudkHiotbwyFGI
 +G+Yra8DQrkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035640"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035640"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:19 -0800
IronPort-SDR: C3D8lbYDa0KfCcHDtd0Tj+lFo28fkkvSFkhNw3/l+wfiAk1TRRqdNOeRvQzXG8HFfrpHmeSL1V
 lAy3GMENFcsw==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441680"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:18 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/30] vulkan-tools: upgrade 1.2.162.0 -> 1.2.162.1
Date: Tue, 19 Jan 2021 14:45:39 +0800
Message-Id: <20210119064552.115692-17-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{vulkan-tools_1.2.162.0.bb => vulkan-tools_1.2.162.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.162.0.bb => vulkan-tools_1.2.162.1.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb
index 972859c934..e571766030 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.162.1.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.162"
-SRCREV = "9e9d7c24ed8b321815f77f31c100bbf9462193b4"
+SRCREV = "8f0c2e40d4134f53f82ce48de72c7be92baa6b3d"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

