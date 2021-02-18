Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.2597.1613622265608276454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 20:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: N5Dj0jDmg6H3lF5M7HLI0GinLuoyC2q4HsLYRiN0eWnAm88j5kjZDZTRHsV2lzUoLsAVuzgbsp
 LnQbX7RGyO6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="163177956"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="163177956"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:29 -0800
IronPort-SDR: gE+ZJ2GmGUagRVouktuEI71AIDhAyHPGzubqtlwkjTOh8/YkYcGxCXVOE4FYt+MbcUbwlEyrM0
 n7DN/d0mpqCw==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; 
   d="scan'208";a="378269178"
Received: from zaizam-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.203])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2021 20:24:27 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/12] libfm-extra: upgrade 1.3.1 -> 1.3.2
Date: Thu, 18 Feb 2021 12:24:10 +0800
Message-Id: <20210218042418.281245-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210218042418.281245-1-anuj.mittal@intel.com>
References: <20210218042418.281245-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libfm/{libfm-extra_1.3.1.bb => libfm-extra_1.3.2.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libfm/{libfm-extra_1.3.1.bb => libfm-extra_1.3.2.bb} (80%)

diff --git a/meta/recipes-support/libfm/libfm-extra_1.3.1.bb b/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
similarity index 80%
rename from meta/recipes-support/libfm/libfm-extra_1.3.1.bb
rename to meta/recipes-support/libfm/libfm-extra_1.3.2.bb
index 85102a1a3d..de25b19c87 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.3.1.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.3.2.bb
@@ -11,8 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
            file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
           "
 
-SRC_URI[md5sum] = "c15ecd2c9317e2c385cd3f046d0b61ba"
-SRC_URI[sha256sum] = "96b1244bde41ca0eef0332cfb5c67bb16725dfd102128f3e6f74fadc13a1cfe4"
+SRC_URI[sha256sum] = "a5042630304cf8e5d8cff9d565c6bd546f228b48c960153ed366a34e87cad1e5"
 
 S = "${WORKDIR}/libfm-${PV}"
 
-- 
2.29.2

