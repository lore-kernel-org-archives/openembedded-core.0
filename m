Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: kY+MRnY/gAv1OKRbPlhKstBrYSfh+ZJIIfBGy5rVTPa4010/64rylIP1rl9sTEx4A850VURGnT
 8Vk93FG+shTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247148"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247148"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:37 -0800
IronPort-SDR: jk4zgfIL6Luu21pUeh2oQ/L/HWQFnvuhkKQwK/5aKf3LPrsVL5KhewN7t4k/8wEMm7hOxNmtMA
 ThFLlV0A48/w==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825442"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:36 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/27] python3-more-itertools: upgrade 8.6.0 -> 8.7.0
Date: Wed, 17 Feb 2021 13:52:00 +0800
Message-Id: <20210217055210.22019-17-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-more-itertools_8.6.0.bb => python3-more-itertools_8.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_8.6.0.bb => python3-more-itertools_8.7.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.6.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-more-itertools_8.6.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb
index ee5ce7ba9c..0cb61915bf 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.6.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "b3a9005928e5bed54076e6e549c792b306fddfe72b2d1d22dd63d42d5d3899cf"
+SRC_URI[sha256sum] = "c5d6da9ca3ff65220c3bfd2a8db06d698f05d4d2b9be57e1deb2be5a45019713"
 
 inherit pypi setuptools3 ptest
 
-- 
2.29.2

