Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.10843.1620730753710592003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 03:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: UoDdvnM5lhUKY2mQelCH11knliFHfrjf5iZYQwtzOAmtDDxYt/o2Hnaqv331q0w0tPcfghOI2Z
 A7sTQ4EoxHMw==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179006555"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="179006555"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 03:59:12 -0700
IronPort-SDR: rwZjHumJdyHCYr3mk+JlEvF9X4WSMWEFxVxFpCoR6zxMvyKIuPcTrHfu/dXjV+H7snJhP+7Da0
 QgQm+zcXCLfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="430252127"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga007.jf.intel.com with ESMTP; 11 May 2021 03:59:11 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 1/4] python3-jinja2: 2.11.2 -> 2.11.3
Date: Tue, 11 May 2021 18:59:07 +0800
Message-Id: <20210511105910.3052-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

updates include fix for CVE-2020-28493

changelog:
https://jinja.palletsprojects.com/en/2.11.x/changelog/#version-2-11-3

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../{python3-jinja2_2.11.2.bb => python3-jinja2_2.11.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_2.11.2.bb => python3-jinja2_2.11.3.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
rename to meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
index 45167d52a2..dbdf563f87 100644
--- a/meta/recipes-devtools/python/python3-jinja2_2.11.2.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_2.11.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "89aab215427ef59c34ad58735269eb58b1a5808103067f7bb9d5836c651b3bb0"
+SRC_URI[sha256sum] = "a6d58433de0ae800347cab1fa3043cebbabe8baa9d29e668f1c768cb87a333c6"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.17.1

