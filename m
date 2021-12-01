Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C1EC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 07:16:39 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.88631.1638342986688137482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 23:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236344645"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="236344645"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:37 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="459918936"
Received: from mwong12-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.129.81])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:36 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/14] python3: update to 3.9.7
Date: Wed,  1 Dec 2021 15:16:13 +0800
Message-Id: 
 <a61a9cf73baf4020a6dce90acb0edb08364aaded.1638342222.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638342222.git.anuj.mittal@intel.com>
References: <cover.1638342222.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 07:16:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159016

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9612bb0639c13571e661f208aa7b28789953d9ec)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/{python3_3.9.6.bb => python3_3.9.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.9.6.bb => python3_3.9.7.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.9.6.bb b/meta/recipes-devtools/python/python3_3.9.7.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.9.6.bb
rename to meta/recipes-devtools/python/python3_3.9.7.bb
index 7fa6fc62dc..9d26528a96 100644
--- a/meta/recipes-devtools/python/python3_3.9.6.bb
+++ b/meta/recipes-devtools/python/python3_3.9.7.bb
@@ -38,7 +38,7 @@ SRC_URI_append_class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "397920af33efc5b97f2e0b57e91923512ef89fc5b3c1d21dbfc8c4828ce0108a"
+SRC_URI[sha256sum] = "f8145616e68c00041d1a6399b76387390388f8359581abc24432bb969b5e3c57"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.33.1


