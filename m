Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: gHQtbDUdUJjrl9uw98IGXc3NPn6h2SJ+DOIU6rPJtkrwu6RejMSx10VXJyxutC3V8Y5yZm96nw
 DEZNrwa5COZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211603"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211603"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:51 -0700
IronPort-SDR: hIMf62GejUwOdkW2s5glQeidWfCdhWI5mHjRxrGT9jnefbMKDDKVveeQPOmFPNdhK5yScaHAUI
 3zmZ/TU28AgA==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295169"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:50 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 09/25] python3-jinja2: set CVE_PRODUCT
Date: Mon, 22 Mar 2021 09:41:11 +0800
Message-Id: <1e3638352ed8dcf1cba274693db8410cc9a6ec3d.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

Set CVE_PRODUCT for more accurate CVE scanning.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aefcc7a7dd012530ed846292caaed70d20589a3a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python3-jinja2_2.11.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
index 89538d2f27..9d0666a5c1 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c65
 
 PYPI_PACKAGE = "Jinja2"
 
+CVE_PRODUCT = "jinja2 jinja"
+
 CLEANBROKEN = "1"
 
 inherit pypi setuptools3
-- 
2.30.2

