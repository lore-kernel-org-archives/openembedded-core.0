Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.928.1619398501109409766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ql40nn8Zv2XSCji4NFAtf39Qm6Fo3vJ495FQOJepphPxlalahuhL0lJwycj/9UkDN5Z1xF0Rfb
 cF/KBa86Omnw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818284"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818284"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:07 -0700
IronPort-SDR: sq4MW2zjdtZsCUkiu2yUbSJ3YggXsr0y1JNekUJiIHUTc+NkN7zfoavuOBibG8wW5Aub8Sf5si
 gOXHXseMNSdg==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067559"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:06 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 52/64] lttng-tools: Fix path for test_python_looging
Date: Mon, 26 Apr 2021 08:53:23 +0800
Message-Id: <73bc035151760ce6d07bb3541607544f71adae7e.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anders Wallin <wallinux@gmail.com>

" was missing

Signed-off-by: Anders Wallin <anders.wallin@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e1780ccfc89e9ff4e260276f28ffa0bb8e9b44e1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
index 281107db2c..6132daf1a1 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
@@ -155,7 +155,7 @@ do_install_ptest () {
         -i ${D}${PTEST_PATH}/tests/unit/Makefile
 
     # Fix hardcoded build path
-    sed -e 's#TESTAPP_PATH=.*/tests/regression/#TESTAPP_PATH=${PTEST_PATH}/tests/regression/#' \
+    sed -e 's#TESTAPP_PATH=.*/tests/regression/#TESTAPP_PATH="${PTEST_PATH}/tests/regression/#' \
         -i ${D}${PTEST_PATH}/tests/regression/ust/python-logging/test_python_logging
 
     # Substitute links to installed binaries.
-- 
2.30.2

