Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.24792.1611128477823315504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 23:41:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Z+m0xEdu14urBOBw0Yqdnq0RRL4k+/fUewkuES9X91tJ8hHr/eEGdzGhK8JfVPqf51ul4kpPkO
 yRhY8DbGhmEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="158240453"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="158240453"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:20 -0800
IronPort-SDR: iupcJs8vOtbKcjpqSGfQSy3QLp8JpTUs8B9NuC6eog5tD1VQEBnQhft+lDlGb9W8Nd7dqMc7ef
 7v9MudHgbevg==
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="350958513"
Received: from mrengasa-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.144.190])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:19 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] python3-hypothesis: upgrade 5.43.3 -> 6.0.2
Date: Wed, 20 Jan 2021 15:40:52 +0800
Message-Id: <20210120074058.252462-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120074058.252462-1-anuj.mittal@intel.com>
References: <20210120074058.252462-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...python3-hypothesis_5.43.3.bb => python3-hypothesis_6.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_5.43.3.bb => python3-hypothesis_6.0.2.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_5.43.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.0.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_5.43.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.0.2.bb
index 4d93cba868..fd163401a3 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_5.43.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.0.2.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d97ba7ae2cfe7096b0c045fdb611ee9850ccdd6050a9b36cb96812242062c2cc"
+SRC_URI[sha256sum] = "ae616551c8ebe897454e2de5183e325f6a109f70d45b7380154ed974ce8d4772"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
-- 
2.29.2

