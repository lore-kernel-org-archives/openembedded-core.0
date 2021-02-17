Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: qZHQUtO+6LIPdI2DvUEnArJYmezoDksS9BIhMq1rOOhMpc4t5gjN56vJfTnxvb9iq71Z+7CER9
 C3JDMUV35TGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247162"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247162"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:40 -0800
IronPort-SDR: VUhL67jYX/YwGAl0K9zf7YkaCJ37G5tPDXfasmVV63ntFVANsfMS9s1clpSPkeB8PY2uJDmNzH
 AuP75/U4EuxA==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825457"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:39 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/27] python3-pygments: upgrade 2.7.4 -> 2.8.0
Date: Wed, 17 Feb 2021 13:52:02 +0800
Message-Id: <20210217055210.22019-19-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{python3-pygments_2.7.4.bb => python3-pygments_2.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.7.4.bb => python3-pygments_2.8.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.7.4.bb b/meta/recipes-devtools/python/python3-pygments_2.8.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pygments_2.7.4.bb
rename to meta/recipes-devtools/python/python3-pygments_2.8.0.bb
index 24bbaaf38c..6c8afc5095 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.7.4.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.8.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "df49d09b498e83c1a73128295860250b0b7edd4c723a32e9bc0d295c7c2ec337"
+SRC_URI[sha256sum] = "37a13ba168a02ac54cc5891a42b1caec333e59b66addb7fa633ea8a6d73445c0"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.29.2

