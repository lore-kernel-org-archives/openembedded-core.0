Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.5679.1623232707981965597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 02:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: ITZlNaIaE0xOQ86/7lTyeA6QQfYoaCG2I9+TFR0G2+cgPC6lWlWmF4Ba76GaNJuFfW/1P8Y8j5
 Unmcg0ZjFbRg==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="290671766"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="290671766"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 02:58:27 -0700
IronPort-SDR: n2Yt2i4yVo9zyfocRUqOSmu2YQMak2mT4+1Zs44fhwUmzl1Y+W4oBDkg7uNPghbVozqz5SYE5L
 dyP8QJh5aS/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="485668323"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2021 02:58:26 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][hardknott 1/2] python3: 3.9.4 -> 3.9.5
Date: Wed,  9 Jun 2021 17:58:24 +0800
Message-Id: <20210609095825.23472-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

This fifth maintenance release of Python 3.9 include fix for CVE-2021-29921.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../python/{python3_3.9.4.bb => python3_3.9.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.9.4.bb => python3_3.9.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.9.4.bb b/meta/recipes-devtools/python/python3_3.9.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.9.4.bb
rename to meta/recipes-devtools/python/python3_3.9.5.bb
index cb371ceed7..82177f4a18 100644
--- a/meta/recipes-devtools/python/python3_3.9.4.bb
+++ b/meta/recipes-devtools/python/python3_3.9.5.bb
@@ -38,7 +38,7 @@ SRC_URI_append_class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "4b0e6644a76f8df864ae24ac500a51bbf68bd098f6a173e27d3b61cdca9aa134"
+SRC_URI[sha256sum] = "0c5a140665436ec3dbfbb79e2dfb6d192655f26ef4a29aeffcb6d1820d716d83"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1

