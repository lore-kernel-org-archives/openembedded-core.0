Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: zIQ4I8jdW+3i+RsO9OXzaNHuFn72HD4W0M9X+Qk6s526ClnxzRfK8h6EVRy4PvqBRGtOMDPgyM
 gG5uO8ogDgeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247170"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247170"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:42 -0800
IronPort-SDR: h2r4/OE7z4mNghnTqOTMdzJne4qgNBmYGi1SL0COVthG0pCEMHedC3lx9dx52ty+zvYFrrsJt8
 3f3ZCt4M9Ung==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825461"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:41 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 20/27] python3-pytest: upgrade 6.2.1 -> 6.2.2
Date: Wed, 17 Feb 2021 13:52:03 +0800
Message-Id: <20210217055210.22019-20-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/{python3-pytest_6.2.1.bb => python3-pytest_6.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_6.2.1.bb => python3-pytest_6.2.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pytest_6.2.1.bb b/meta/recipes-devtools/python/python3-pytest_6.2.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pytest_6.2.1.bb
rename to meta/recipes-devtools/python/python3-pytest_6.2.2.bb
index 6843b4da25..392c20d039 100644
--- a/meta/recipes-devtools/python/python3-pytest_6.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_6.2.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
 
-SRC_URI[sha256sum] = "66e419b1899bc27346cb2c993e12c5e5e8daba9073c1fbce33b9807abc95c306"
+SRC_URI[sha256sum] = "9d1edf9e7d0b84d72ea3dbcdfd22b35fb543a5e8f2a60092dd578936bf63d7f9"
 
 inherit update-alternatives pypi setuptools3
 
-- 
2.29.2

