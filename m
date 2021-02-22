Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.36807.1614009685491576194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ln5c4Aj/B8euV3txGahnyjj103VJDV1aGBLQU95STOacGhEO94ycgWaxagOkJCZYI6Kj/8ibRy
 sojJ9lDCFhrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706207"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706207"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:19 -0800
IronPort-SDR: vpZRncuQynQyjgYM4po0SySpzqZsj5la7Fw8dQfFtw8WLCD3ehBtyrWFrfBUcX4MOTreBnFqma
 CcK7Y8QgTceQ==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430302122"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:18 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 27/30] local.conf.sample.extended: fix double 'of' typo
Date: Tue, 23 Feb 2021 00:00:30 +0800
Message-Id: <c8f6e0ff5fce8be60b7187c7c3511550db7f96ca.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivien Didelot <vivien.didelot@gmail.com>

Remove the redundant 'of' word in the INITRAMFS_IMAGE comment.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit de9544f4654510ac33821b7f170de3074205a221)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/local.conf.sample.extended | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 420b09b7d7..411717b615 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -331,7 +331,7 @@
 # The INITRAMFS_IMAGE image variable will cause an additional recipe to
 # be built as a dependency to the what ever rootfs recipe you might be
 # using such as core-image-sato.  The initramfs might be needed for
-# the initial boot of of the target system such as to load kernel
+# the initial boot of the target system such as to load kernel
 # modules prior to mounting the root file system.
 #
 # INITRAMFS_IMAGE_BUNDLE variable controls if the image recipe
-- 
2.29.2

