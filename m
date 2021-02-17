Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: MjyQaS8GeRqWvnsy5d8k9NR6b/UchNkv6c7/+01zXnWqvaxRSEeaWF4EqPUEPn+PyCyDlpZc9a
 M21SVFP5wxZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247135"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247135"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:35 -0800
IronPort-SDR: 5XdSBj8lV4O4jQtwmZ1tn/HMOjkPJnlQ96vUujMoABdpKUcv0r9jWf6yno0WHRJCcpLEJJ/l8z
 Q3mRxwdUdWrg==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825437"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:34 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/27] python3-hypothesis: upgrade 6.0.2 -> 6.2.0
Date: Wed, 17 Feb 2021 13:51:58 +0800
Message-Id: <20210217055210.22019-15-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...{python3-hypothesis_6.0.2.bb => python3-hypothesis_6.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.0.2.bb => python3-hypothesis_6.2.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.0.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hypothesis_6.0.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb
index fd163401a3..be9418386f 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.2.0.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "hypothesis"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ae616551c8ebe897454e2de5183e325f6a109f70d45b7380154ed974ce8d4772"
+SRC_URI[sha256sum] = "c16fbde26b65c98a2464c48209b066c2f6dab5e8e38acd9d959021eb8d58b6c0"
 
 RDEPENDS_${PN} += "python3-attrs python3-core python3-sortedcontainers"
 
-- 
2.29.2

