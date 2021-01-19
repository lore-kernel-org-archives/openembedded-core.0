Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.8245.1611038800307577894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: bvRmSda7LT+IROdHV0lSAnZGRHcvxNKcQ4lgzLhH7xyBCEvNTgqciSuDj/QTrOBGBPgsmw+xzy
 oEN2Wf42WnMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035656"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035656"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:29 -0800
IronPort-SDR: BmqS3ebkjUZdSSwEpXvapxThWTR2xnYXKWjYf/RrOoqssHurR7WkD8dH7jH4FI5U/VLXFMgbrQ
 ANU4NAvLLtdQ==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441824"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:28 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/30] lzip: upgrade 1.21 -> 1.22
Date: Tue, 19 Jan 2021 14:45:47 +0800
Message-Id: <20210119064552.115692-25-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years, formatting changes

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/lzip/{lzip_1.21.bb => lzip_1.22.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lzip/{lzip_1.21.bb => lzip_1.22.bb} (85%)

diff --git a/meta/recipes-extended/lzip/lzip_1.21.bb b/meta/recipes-extended/lzip/lzip_1.22.bb
similarity index 85%
rename from meta/recipes-extended/lzip/lzip_1.21.bb
rename to meta/recipes-extended/lzip/lzip_1.22.bb
index bb3d2a6fe3..d21c36a3f4 100644
--- a/meta/recipes-extended/lzip/lzip_1.21.bb
+++ b/meta/recipes-extended/lzip/lzip_1.22.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "http://lzip.nongnu.org/lzip.html"
 SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
-                    file://decoder.cc;beginline=3;endline=16;md5=db09fe3f9573f94d0076f7f07959e6e1"
+                    file://decoder.cc;beginline=3;endline=16;md5=18c279060cd0be128188404b45837f88 \
+                    "
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
-SRC_URI[md5sum] = "c0061730d017ea593a09308edc547128"
-SRC_URI[sha256sum] = "e48b5039d3164d670791f9c5dbaa832bf2df080cb1fbb4f33aa7b3300b670d8b"
+SRC_URI[sha256sum] = "c3342d42e67139c165b8b128d033b5c96893a13ac5f25933190315214e87a948"
 
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
-- 
2.29.2

