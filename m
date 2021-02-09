Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12270.1612885959329511791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3a+QGP5a42xgerBDzc5w9WsgodSmRJN5SSwAliG3TcQpjglaAn0weg0HGfB2yI/C5pNDiWqpD1
 zq6NoVTyeuGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968639"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968639"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:57 -0800
IronPort-SDR: ej5dXHThXPKM66eU/Y43fQ5Tw7q3z+nISj2R3VHEqSxnFcoQ8V/lq9HJ7Ulm/VXak6mh5VVU3K
 S6l1ySCbEolw==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215469"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:56 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/35] openssl: set CVE_VERSION_SUFFIX
Date: Tue,  9 Feb 2021 23:51:59 +0800
Message-Id: <cadaa2d1265f4e855aa813ed8f4cafea17c6909e.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 17df664a32a74f17baaef8c31ac23adec2d6255f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
index c2db596f03..5d22c511aa 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -210,6 +210,8 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
 
+CVE_VERSION_SUFFIX = "alphabetical"
+
 # Only affects OpenSSL >= 1.1.1 in combination with Apache < 2.4.37
 # Apache in meta-webserver is already recent enough
 CVE_CHECK_WHITELIST += "CVE-2019-0190"
-- 
2.29.2

