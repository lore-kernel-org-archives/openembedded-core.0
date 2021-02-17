Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: lCCvspYpDrsJnzBmo5R2vE9xCej1+aikYL04y8cWTmqN6g3UqX4YQKLemBAVzIoduK7ehx/FXJ
 jiae9/z0C2zQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247110"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247110"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:31 -0800
IronPort-SDR: ILRsqJ3dAxNqbyV0VJTPzlzqbW/rGQAyadOAlb/JqPg4Eiw+NVIhE4dgG5Ws7KdoZzHnR0cqul
 yDfOGlcnzZEA==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825426"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:30 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/27] python3-git: upgrade 3.1.12 -> 3.1.13
Date: Wed, 17 Feb 2021 13:51:55 +0800
Message-Id: <20210217055210.22019-12-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/{python3-git_3.1.12.bb => python3-git_3.1.13.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.12.bb => python3-git_3.1.13.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.12.bb b/meta/recipes-devtools/python/python3-git_3.1.13.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.12.bb
rename to meta/recipes-devtools/python/python3-git_3.1.13.bb
index c0c460540d..807767e569 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.12.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.13.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "42dbefd8d9e2576c496ed0059f3103dcef7125b9ce16f9d5f9c834aed44a1dac"
+SRC_URI[sha256sum] = "8621a7e777e276a5ec838b59280ba5272dd144a18169c36c903d8b38b99f750a"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.29.2

