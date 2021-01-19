Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.8244.1611038799087798389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: gvWNapCz6ybTAxaG6QX2b+LL3DkMAapVOHD74drpRJCb0F+RHuO3mNG5simhHn0YFBQIBQtizl
 3/MsCN5McSRg==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035655"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035655"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:28 -0800
IronPort-SDR: uWrBDLAwEsNXnXKHO/8+vPwCn47iZek1TSAFfCzLkro0NkO9TJa/oCS0s1YU6PnKqC9z6bo39W
 fAf/6d4ojeAA==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441821"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:27 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 24/30] logrotate: upgrade 3.17.0 -> 3.18.0
Date: Tue, 19 Jan 2021 14:45:46 +0800
Message-Id: <20210119064552.115692-24-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../logrotate/{logrotate_3.17.0.bb => logrotate_3.18.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/logrotate/{logrotate_3.17.0.bb => logrotate_3.18.0.bb} (97%)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.17.0.bb b/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
similarity index 97%
rename from meta/recipes-extended/logrotate/logrotate_3.17.0.bb
rename to meta/recipes-extended/logrotate/logrotate_3.18.0.bb
index 08001f38e5..270052f46f 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.17.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.18.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz
             file://disable-check-different-filesystems.patch \
             "
 
-SRC_URI[sha256sum] = "58cc2178ff57faa3c0490181cce041345aeca6cff18dba1c5cd1398bf1c19294"
+SRC_URI[sha256sum] = "841f81bf09d0014e4a2e11af166bb33fcd8429cc0c2d4a7d3d9ceb3858cfccc5"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
 
-- 
2.29.2

