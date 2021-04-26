Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.928.1619398501109409766
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ZAhsx1/5/66S8ij/sWjaKGb8byXisGJiXyf/1NuUzoH3LfJBvWitccUAFYnkH9FpQ1qa1bK8XH
 yQrvZga/yDKg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818278"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818278"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:05 -0700
IronPort-SDR: +7xl1zDFjbHlWx9DMKGqP1EcHHuJYxnKHTKQ7FRwOzNitpsRdw5Zq2nFl9Yt1kuZ96HMXHZEp2
 JnsmQ/B6X9ag==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067554"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:05 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 51/64] lttng-tools: Fix missing legacy test files
Date: Mon, 26 Apr 2021 08:53:22 +0800
Message-Id: <4d0e6ff408caeb6e57b5a347aa071d3afef98d4d.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anders Wallin <wallinux@gmail.com>

tests/regression/tools/save-load

Signed-off-by: Anders Wallin <anders.wallin@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e892895e25d148b4c522e3a30bfb1bb4e9a9506)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
index 7074096ee7..281107db2c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.3.bb
@@ -69,7 +69,7 @@ do_install_append () {
 }
 
 do_install_ptest () {
-    for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/load-42*.lttng tests/regression/tools/save-load/configuration/load-42*.lttng tests/regression/tools/health/test_health.sh tests/regression/tools/metadata/utils.sh tests/regression/tools/rotation/rotate_utils.sh; do
+    for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/*.lttng tests/regression/tools/save-load/configuration/load-42*.lttng tests/regression/tools/health/test_health.sh tests/regression/tools/metadata/utils.sh tests/regression/tools/rotation/rotate_utils.sh; do
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-- 
2.30.2

