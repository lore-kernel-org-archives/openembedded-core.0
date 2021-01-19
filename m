Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.8244.1611038799087798389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: llg6YhIdW4Qcnb1ywTLEhBJXxjVMtvtMrO4kjroX63YRfoP34iSTWIzeh6UiiL27ePzFAx3zkq
 z2t2/RcF85cQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035669"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035669"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:35 -0800
IronPort-SDR: MNQYk6xqBFqGom+dZAWlWdMkhQI03J3qIvZlWBHjtedA4xe18T4eUc4EznIzpPOckR5F54IQHK
 nlAFpVXwxpxg==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441855"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:34 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 30/30] python3-git: upgrade 3.1.11 -> 3.1.12
Date: Tue, 19 Jan 2021 14:45:52 +0800
Message-Id: <20210119064552.115692-30-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/{python3-git_3.1.11.bb => python3-git_3.1.12.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.11.bb => python3-git_3.1.12.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.11.bb b/meta/recipes-devtools/python/python3-git_3.1.12.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.11.bb
rename to meta/recipes-devtools/python/python3-git_3.1.12.bb
index 7c636572f3..c0c460540d 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.11.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.12.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "befa4d101f91bad1b632df4308ec64555db684c360bd7d2130b4807d49ce86b8"
+SRC_URI[sha256sum] = "42dbefd8d9e2576c496ed0059f3103dcef7125b9ce16f9d5f9c834aed44a1dac"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.29.2

