Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63C8C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:23 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=dklVcIyN;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056883; x=1677592883;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Kh7CU1ZP37Dm1Lh+OdSwRvx8JHDMV16agjuU3mbtLZU=;
  b=dklVcIyNz2gV6CIZH4S07OfBMh7BTmOjVILBCx6f2fcKmXEGCfOJsYzg
   cRbmSfIDoxGZoN5bK5tcTUyqDZDXsV7/6Gp/doRbH6bPHruaGegciSxG6
   dc07lNjexBgl5p/4rCG/GlbaMKW8DN7X3VsVcuXvCn/Vu1tUjUK6oMhBJ
   CTynbP3m4hNglX22qwXD5ovQ5CS+hNKDpf2wZnAXtfZ34dUyswqscjc16
   9BsQUZsn5r0tWSY2H9avVY9WY7+uD9DxkC4k1zoTpB+fQiSkqrbWYi/Ff
   zblWni56ADAmRlbSCTYK89p43efK/jRfos0epQyaxCjaGckHdCpceuwNv
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857321"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857321"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:20 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092665"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:19 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 27/39] gst-devtools: 1.18.5 -> 1.18.6
Date: Mon, 28 Feb 2022 22:00:17 +0800
Message-Id: 
 <1233bc8cb88b5722e97dd19a06b7e7737f1263bd.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162483

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
index d6372b0691..258a0e899c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "fecffc86447daf5c2a06843c757a991d745caa2069446a0d746e99b13f7cb079"
+SRC_URI[sha256sum] = "3725622c740a635452e54b79d065f963ab7706ca2403de6c43072ae7610a0de4"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.35.1


