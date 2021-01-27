Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.5398.1611738236763953855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 01:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: xHiTNLn+SSGGHkG+IQJ75XfhAIUpQEREHPAzOWX5BtdpXRd9iRiDnfomNDwXqMhX4giU+ih2qw
 8GIQ97blpp8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="159212996"
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="159212996"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2021 01:03:57 -0800
IronPort-SDR: MMpEHq2HQz8DLc0c96mwf+DNc6kqptH3/CTvD/TZ8A8G1J2/8qsXv8WO7/+v04+3/N4K0+WIYB
 AnnBMo6Ccq+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,378,1602572400"; 
   d="scan'208";a="407037712"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2021 01:03:56 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] openssl: set CVE_VERSION_SUFFIX
Date: Wed, 27 Jan 2021 17:03:54 +0800
Message-Id: <20210127090354.25091-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210127090354.25091-1-chee.yang.lee@intel.com>
References: <20210127090354.25091-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index 52e96b7831..9ff80b3d4f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -230,6 +230,8 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
 
+CVE_VERSION_SUFFIX = "alphabetical"
+
 # Only affects OpenSSL >= 1.1.1 in combination with Apache < 2.4.37
 # Apache in meta-webserver is already recent enough
 CVE_CHECK_WHITELIST += "CVE-2019-0190"
-- 
2.17.1

