Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Bp7SzEcDualcvwTk1TbX28R4UCM/5kWoy1c3YFPrMtZrlPdiDBwedF/Yz5SDlgiwoFkKzh/QIb
 I1HIUfTmVIVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247142"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247142"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:36 -0800
IronPort-SDR: AoetAtnFSNp6WS6dr4QR/5np0nGLqazOen7lscT0goUnvvt570aAkxhG//21FBkiHwiBdqKzXI
 ARMWpVhidKWA==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825440"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:35 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/27] python3-jinja2: upgrade 2.11.2 -> 2.11.3
Date: Wed, 17 Feb 2021 13:51:59 +0800
Message-Id: <20210217055210.22019-16-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{python3-jinja2_2.11.2.bb => python3-jinja2_2.11.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_2.11.2.bb => python3-jinja2_2.11.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
rename to meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
index 89538d2f27..19a4eee11a 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone templ
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
+SRC_URI[sha256sum] = "a6d58433de0ae800347cab1fa3043cebbabe8baa9d29e668f1c768cb87a333c6"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.29.2

