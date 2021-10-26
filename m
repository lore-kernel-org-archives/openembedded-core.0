Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC1BC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:21 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.14241.1635263952829079345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783416"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783416"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:20 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786456"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:18 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 17/37] python3: update to 3.9.7
Date: Tue, 26 Oct 2021 23:57:48 +0800
Message-Id: 
 <5895b6a51b73735f081267ed6e6e2455c1d717ed.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157420

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
index 8a638b142b..772dcb8d9d 100644
--- a/meta/recipes-devtools/python/python3_3.9.6.bb
+++ b/meta/recipes-devtools/python/python3_3.9.7.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "397920af33efc5b97f2e0b57e91923512ef89fc5b3c1d21dbfc8c4828ce0108a"
+SRC_URI[sha256sum] = "f8145616e68c00041d1a6399b76387390388f8359581abc24432bb969b5e3c57"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.31.1


