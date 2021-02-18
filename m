Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.2597.1613622265608276454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 20:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: EQ14XsaqeeOTT6O6y+Tl0ezUxtGBFIKB4xdIWFwk4I1bnYzhuoc+Dl/G/OLdRCXeomLf2HME58
 fBk6dsidOuRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163177948"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="163177948"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:26 -0800
IronPort-SDR: 6MYU6MPJ9GDih5RI0iTOIq2R0QLG4TdjlxBumMMNC8mvHWWuq3wVkWXjgW+ThGMI7x8m0yUa2b
 jQv6MI16OeMw==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="378269168"
Received: from zaizam-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.203])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:25 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/12] curl: upgrade 7.74.0 -> 7.75.0
Date: Thu, 18 Feb 2021 12:24:08 +0800
Message-Id: <20210218042418.281245-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210218042418.281245-1-anuj.mittal@intel.com>
References: <20210218042418.281245-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years changed

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/curl/{curl_7.74.0.bb => curl_7.75.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.74.0.bb => curl_7.75.0.bb} (95%)

diff --git a/meta/recipes-support/curl/curl_7.74.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_7.74.0.bb
rename to meta/recipes-support/curl/curl_7.75.0.bb
index 873bbe8143..5bbc56085a 100644
--- a/meta/recipes-support/curl/curl_7.74.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "http://curl.haxx.se/"
 BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2e9fb35867314fe31c6a4977ef7dd531"
+LIC_FILES_CHKSUM = "file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"
 
 SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "0f4d63e6681636539dc88fa8e929f934cd3a840c46e0bf28c73be11e521b77a5"
+SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.29.2

