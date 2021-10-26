Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09544C43217
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:16 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.14241.1635263952829079345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783380"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783380"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:15 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786407"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:14 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 13/37] gst-examples: 1.18.4 -> 1.18.5
Date: Tue, 26 Oct 2021 23:57:44 +0800
Message-Id: 
 <570573718fe34de28709301d9cbc322321e71f5f.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157416

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b1bddc80dc172563b7cd469a8de6b9db2e6ad985)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gst-examples_1.18.4.bb => gst-examples_1.18.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.4.bb => gst-examples_1.18.5.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
index 9d8fef86ed..a720bb73ff 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "959bb246a5b1f5f9c78557da11c3f22b42ff89c0"
+SRCREV = "fe9a365dc0f1ff632abcfe3322ac5527a2cf30a0"
 
 S = "${WORKDIR}/git"
 
-- 
2.31.1


