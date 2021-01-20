Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.24792.1611128477823315504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 23:41:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 8Ojgl7lSj7WI76wmk915GeChPcED5+DtksbOZAM+M0f9LMXZViifJVGrBwGap9nwNPHqq4gJtk
 V9COEM6GOlOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="158240445"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="158240445"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:17 -0800
IronPort-SDR: 4KoqI3Pt/pmafpN92wRZqawkzbWHDTwQqUMU90g0eGyqctl3mHG57No+sWJKEEScC08uemhF3U
 QbzQI51ykS/g==
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="350958507"
Received: from mrengasa-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.144.190])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:16 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] diffstat: upgrade 1.63 -> 1.64
Date: Wed, 20 Jan 2021 15:40:50 +0800
Message-Id: <20210120074058.252462-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120074058.252462-1-anuj.mittal@intel.com>
References: <20210120074058.252462-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years changed

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../diffstat/{diffstat_1.63.bb => diffstat_1.64.bb}          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/diffstat/{diffstat_1.63.bb => diffstat_1.64.bb} (78%)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.63.bb b/meta/recipes-devtools/diffstat/diffstat_1.64.bb
similarity index 78%
rename from meta/recipes-devtools/diffstat/diffstat_1.63.bb
rename to meta/recipes-devtools/diffstat/diffstat_1.64.bb
index 863f924b22..76ca30c20a 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.63.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.64.bb
@@ -5,7 +5,7 @@ reviewing large, complex patch files."
 HOMEPAGE = "http://invisible-island.net/diffstat/"
 SECTION = "devel"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a3d0bb117493e804b0c1a868ddf23321"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f605b1986cc3b808ec0e4fa9d0e0f2d9"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
@@ -13,8 +13,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-aclocal.m4-add-missing-header-defines.patch \
            "
 
-SRC_URI[md5sum] = "b9272ec8af6257103261ec3622692991"
-SRC_URI[sha256sum] = "7eddd53401b99b90bac3f7ebf23dd583d7d99c6106e67a4f1161b7a20110dc6f"
+SRC_URI[sha256sum] = "b8aee38d9d2e1d05926e6b55810a9d2c2dd407f24d6a267387563a4436e3f7fc"
 
 inherit autotools gettext ptest
 
-- 
2.29.2

