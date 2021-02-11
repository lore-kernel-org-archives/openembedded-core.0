Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.8218.1613049690847961596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 05:21:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: FWCyWjhRwkqOY2gNMx2iZA8AUGy9CMRFRi2pUWnaU/gdmLObsumy94F5v0tXeIUUWUjTF4yiHv
 XJhRICMGCISA==
X-IronPort-AV: E=McAfee;i="6000,8403,9891"; a="201365938"
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; 
   d="scan'208";a="201365938"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2021 05:21:28 -0800
IronPort-SDR: E/XVAD5yWoOl+6jA+S1PONhHEm4kp5c/y5J+axGQf1XTP/ti/PSXjtN3UI4D2q3XxhAfibw1Fx
 yskKRvATmNyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,170,1610438400"; 
   d="scan'208";a="380637751"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga008.fm.intel.com with ESMTP; 11 Feb 2021 05:21:27 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] sudo: 1.8.31 -> 1.8.32
Date: Thu, 11 Feb 2021 21:21:26 +0800
Message-Id: <20210211132126.83665-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

release notes:
https://www.sudo.ws/legacy.html#1.8.32

updates include fixes for
CVE-2021-23239
CVE-2021-23240

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-extended/sudo/sudo.inc                           | 2 +-
 meta/recipes-extended/sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.31.bb => sudo_1.8.32.bb} (92%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 5d27d46928..aeedfc1a23 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=4d1b44b1576eea036d78b8cc961aa93d \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=07966675feaddba70cc812895b248230 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.8.31.bb b/meta/recipes-extended/sudo/sudo_1.8.32.bb
similarity index 92%
rename from meta/recipes-extended/sudo/sudo_1.8.31.bb
rename to meta/recipes-extended/sudo/sudo_1.8.32.bb
index 39d8817c32..af875f5b4c 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.31.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.32.bb
@@ -7,8 +7,8 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "ce17ff6e72a70f8d5dabba8abf3cd2de"
-SRC_URI[sha256sum] = "7ea8d97a3cee4c844e0887ea7a1bd80eb54cc98fd77966776cb1a80653ad454f"
+SRC_URI[md5sum] = "a7318202ba391079a0e32933f0fb8bd6"
+SRC_URI[sha256sum] = "5ce3c18c5efbecd5437a0945f314f1822423eaf9a2d7eb7ecf80857bc32246c5"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.17.1

