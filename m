Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CDEC433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:18 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.14241.1635263952829079345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783398"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783398"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:17 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786412"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 15/37] busybox: 1.34.0 -> 1.34.1
Date: Tue, 26 Oct 2021 23:57:46 +0800
Message-Id: 
 <12930a587dbce9057071f5ea177c649e524d950d.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157418

From: Andrej Valek <andrej.valek@siemens.com>

- update to next stable version 1.34.1

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 84c9bb0796aa4382cc08075ec2908aea81892f64)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{busybox-inittab_1.34.0.bb => busybox-inittab_1.34.1.bb}    | 0
 .../busybox/{busybox_1.34.0.bb => busybox_1.34.1.bb}            | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.34.0.bb => busybox-inittab_1.34.1.bb} (100%)
 rename meta/recipes-core/busybox/{busybox_1.34.0.bb => busybox_1.34.1.bb} (95%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.34.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.34.1.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.34.0.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.34.1.bb
diff --git a/meta/recipes-core/busybox/busybox_1.34.0.bb b/meta/recipes-core/busybox/busybox_1.34.1.bb
similarity index 95%
rename from meta/recipes-core/busybox/busybox_1.34.0.bb
rename to meta/recipes-core/busybox/busybox_1.34.1.bb
index 51df1df05f..6aed0f0476 100644
--- a/meta/recipes-core/busybox/busybox_1.34.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.34.1.bb
@@ -51,4 +51,4 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.sha256sum] = "ec8d1615edb045b83b81966604759c4d4ac921434ab4011da604f629c06074ce"
+SRC_URI[tarball.sha256sum] = "415fbd89e5344c96acf449d94a6f956dbed62e18e835fc83e064db33a34bd549"
-- 
2.31.1


