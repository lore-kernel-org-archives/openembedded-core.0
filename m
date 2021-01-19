Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.8245.1611038800307577894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: MJEl2mDAZtsWlp+FpjvV70J09Uwa4oKwc0mInkMTCnwUvxcTj+hNGiO3HAyxmJ9YMtLc9M47wo
 q+v3dZ2JJS0A==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035662"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035662"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:31 -0800
IronPort-SDR: 8aPbGAiy3AQrhnA9vZIXhsgX5COSGlOX+tQByxuDJ1w1zCRczISAP4s81SSIZ9Z0Y39mSKj1Qa
 YCycqt156zBA==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441831"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:30 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 27/30] wget: upgrade 1.20.3 -> 1.21.1
Date: Tue, 19 Jan 2021 14:45:49 +0800
Message-Id: <20210119064552.115692-27-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/wget/wget_1.20.3.bb | 8 --------
 meta/recipes-extended/wget/wget_1.21.1.bb | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 100644 meta/recipes-extended/wget/wget_1.20.3.bb
 create mode 100644 meta/recipes-extended/wget/wget_1.21.1.bb

diff --git a/meta/recipes-extended/wget/wget_1.20.3.bb b/meta/recipes-extended/wget/wget_1.20.3.bb
deleted file mode 100644
index 4fa273d093..0000000000
--- a/meta/recipes-extended/wget/wget_1.20.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
-           file://0002-improve-reproducibility.patch \
-          "
-
-SRC_URI[md5sum] = "db4e6dc7977cbddcd543b240079a4899"
-SRC_URI[sha256sum] = "31cccfc6630528db1c8e3a06f6decf2a370060b982841cfab2b8677400a5092e"
-
-require wget.inc
diff --git a/meta/recipes-extended/wget/wget_1.21.1.bb b/meta/recipes-extended/wget/wget_1.21.1.bb
new file mode 100644
index 0000000000..21385bbfb2
--- /dev/null
+++ b/meta/recipes-extended/wget/wget_1.21.1.bb
@@ -0,0 +1,7 @@
+SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
+           file://0002-improve-reproducibility.patch \
+          "
+
+SRC_URI[sha256sum] = "59ba0bdade9ad135eda581ae4e59a7a9f25e3a4bde6a5419632b31906120e26e"
+
+require wget.inc
-- 
2.29.2

