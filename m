Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B05C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:01 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=a/Sq7Me0;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056860; x=1677592860;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lB5V2TYMkLRBdiHOSti8YbGixBja+jGzewo9cTh5TqA=;
  b=a/Sq7Me09euGKhiv9S9JSh8azbsJs1cwf0anXzVTD/ye+XdLTChzVciH
   QKGJvFE4yO2kl8UpKImX7tn251y5s1dyOlkQz+86hSDSl9iV7xnwGkaYE
   wPjuRYtKq31MUqe64tgMpbTW/+l6PHwl5zf5DFTWWL2fs8wuLDUSQmJJQ
   24sjNp1a1MQQ3D+SqIHUbZZTlE7VFv75fx25N/N9IgQYgPaSgkxe+nqGP
   xYL6c2D5H7PlUmefXMDEXB3hwOr9Sl9D69U5SCLoCNEdGCL8b5hH2fbFu
   QgLjpi9lyUZ3soumwR/+gE1tpHaB6o3vmWWVDWYoyTbXojExmHU5TkkoC
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857070"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857070"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:00 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092362"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:58 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/39] gst-devtools: 1.18.4 -> 1.18.5
Date: Mon, 28 Feb 2022 22:00:03 +0800
Message-Id: 
 <9d3b427a53c49347c0164406860bb2eb161e599d.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162469

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit fe1345f72e41fe0fd0a8c69ac8e7cb7551666fcb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gst-devtools_1.18.4.bb => gst-devtools_1.18.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.4.bb => gst-devtools_1.18.5.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
index 2a56967f7b..d6372b0691 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.18.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "ffbd194c40912cb5e7fca2863648bf9dd8257b7af97d3a60c4fcd4efd8526ccf"
+SRC_URI[sha256sum] = "fecffc86447daf5c2a06843c757a991d745caa2069446a0d746e99b13f7cb079"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.35.1


