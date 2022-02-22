Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F1CC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:29 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web09.13888.1645542508274562070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=KMT7K2Jg;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542508; x=1677078508;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=e7sqA8GIzLnBHIiRCtVF1ggxpoK4lHVjG0lqz2jw2AI=;
  b=KMT7K2JgexgegDmkdWLaCI69LWStQAhtawKjF1KTjEHjVZZzZ14/yb5x
   lsf1O3YeONDan+kvn/8iFP7+MGj1h3ielbYCLosrKX3NZzTuUA1OeYyU4
   1YTIAAoHyQz3moBK2UKY9EsxAjreL6Qwm7V5gsP1WbsyVx2GAI6mI1yqT
   e1oxU9dwBN/2XN72WQl8jn2Z8pdBkge6x9F/aVG7CcxsbB0mEV15VKGwg
   krGjFgvYi/QrZXuLWfaMuKweSTfdpnxr4GFa+rcJ1SrnUG4PDceioVqGs
   hPY1JjHV2i2kwS+ItO+3TNZJ+dJj1lw7r+Rs0Oe5CyKu7BbvUG64ZlZ5/
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305061"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305061"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258566"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:06 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 11/38] gst-devtools: 1.18.5 -> 1.18.6
Date: Tue, 22 Feb 2022 23:07:12 +0800
Message-Id: 
 <39a1043f7d6cf96e3a11750de4816b69e66469be.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162146

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gst-devtools_1.18.5.bb => gst-devtools_1.18.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.5.bb => gst-devtools_1.18.6.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.6.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.18.6.bb
index 1b46b89cb9..4f4ded8d24 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "fecffc86447daf5c2a06843c757a991d745caa2069446a0d746e99b13f7cb079"
+SRC_URI[sha256sum] = "3725622c740a635452e54b79d065f963ab7706ca2403de6c43072ae7610a0de4"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.35.1


