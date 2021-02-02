Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.48219.1612244095831924660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 2xkaFEMUicPtR1sUpV7XpykK8jBD0rdoYv/Q+++MYmT+mZZFm/b5C37lRxCmCy1ZJJ5jY69f3n
 Y2xNqVdwZFZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876968"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876968"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:40 -0800
IronPort-SDR: 99G5Am82fpwHnm9QUFBmGUH9y8cOVSYTvgEsVr+fvVh8XmLRiW0H3hFge02cFNmYqLncvd+0Ys
 tm7VyBGujE7A==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370361056"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:39 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 23/25] core-image-sato-sdk-ptest: these images need ptest
Date: Tue,  2 Feb 2021 13:34:06 +0800
Message-Id: <d23af76d3cdc791db8726ca9f9f4a4342589e200.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

As this image isn't buildable without ptest (the packages won't exist),
depend on the ptest DISTRO_FEATURE to ensure we don't try and build it.

(From OE-Core rev: 0fe856d726c6d9c35533e32e70fbe05ef2b88b17)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 72b859aba82de3e5329142439ce0dfc3e41486b3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-sato/images/core-image-sato-ptest-fast.bb | 3 +++
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
index 3641217306..4f08d6eb64 100644
--- a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
+++ b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
@@ -1,3 +1,6 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
 require core-image-sato-sdk.bb
 require conf/distro/include/ptest-packagelists.inc
 
diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index bf749acd79..4d59c9536b 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -1,3 +1,6 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
 require core-image-sato-sdk.bb
 require conf/distro/include/ptest-packagelists.inc
 
-- 
2.29.2

