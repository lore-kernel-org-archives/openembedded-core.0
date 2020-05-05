Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3193.1588661906694787605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 23:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Y3/KE5yNaTzpkpKVAWzsobz4Fpq9ZMqlphPFitUYO8tWABZA6fTBawpLQp+EP8SrZv8TRkIgmD
 3BSMZw4UQzjA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:29 -0700
IronPort-SDR: rFiVyh2cbX5/pEjVW9m159nZEvf66ln1ZcPtrcYTUh4vQG3alBCcdFl4dkrX879dLJYvu3M82i
 KIp3r1T82wRg==
X-IronPort-AV: E=Sophos;i="5.73,354,1583222400"; 
   d="scan'208";a="284144805"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.72.16])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2020 23:58:26 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][zeus 10/18] gnupg: upgrade 2.2.17 -> 2.2.19
Date: Tue,  5 May 2020 14:56:45 +0800
Message-Id: <e0ca79be7d7a5574daea9866d20fdbc668defedc.1588661196.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588661196.git.anuj.mittal@intel.com>
References: <cover.1588661196.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Mingyu <wangmy@cn.fujitsu.com>

(From OE-Core rev: 287de363f80a2f9919b942a1349f58575e8b91d8)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[ includes the fix for CVE-2019-14855 ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gnupg/{gnupg_2.2.17.bb => gnupg_2.2.19.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.17.bb => gnupg_2.2.19.bb} (93%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.17.bb b/meta/recipes-support/gnupg/gnupg_2.2.19.bb
similarity index 93%
rename from meta/recipes-support/gnupg/gnupg_2.2.17.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.19.bb
index 689cf8a75e..a0577d61d3 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.17.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.19.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 
-SRC_URI[md5sum] = "1ba2d9b70c377f8e967742064c27a19c"
-SRC_URI[sha256sum] = "afa262868e39b651a2db4c071fba90415154243e83a830ca00516f9a807fd514"
+SRC_URI[md5sum] = "cb3b373d08ba078c325299945a7f2818"
+SRC_URI[sha256sum] = "242554c0e06f3a83c420b052f750b65ead711cc3fddddb5e7274fcdbb4e9dec0"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.25.4

