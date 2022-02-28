Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEF0C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:13 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=RrlCZogM;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056872; x=1677592872;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nVYxQdriVtfDBDl2wHq/Io8Iy6fqCI4u7pQfbVSJv48=;
  b=RrlCZogMNKUBdeQ81mEPGShdc7Rh6ABjA1YvtmbOXw2t/EQDaD4Ay0fJ
   nns+o9woFFXVe2snwUaCBMOMXTiC/P3HOHrPlnwNp6GufwxTu+V2GBeq5
   Vk78WA3dJt34Ht26QqG94Jqyu3mKJ4dEEJMco1o6vkDpexz2JF8Wf2sIY
   srKGmixjYexTPRh5BkJnt/8mg8ia4audGIYpX+/Zrqfo9INqy+aAzRXri
   9yexXlEW1pjdga/ZO6p9bXhMmzAeMLjkMCkMYBYt/4iTwmR0NepV3nts+
   bv+9mz+OAm52qZ+Gd35i0zwrKi1tVLFCItVaX8nhDckhY+Gh9BbI80z4g
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857207"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857207"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:09 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092505"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:07 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 19/39] gstreamer1.0-plugins-bad: 1.18.5 -> 1.18.6
Date: Mon, 28 Feb 2022 22:00:09 +0800
Message-Id: 
 <49b65ada7207a4a6cf6695ec1a0131647ee081d2.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162475

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...plugins-bad_1.18.5.bb => gstreamer1.0-plugins-bad_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.5.bb => gstreamer1.0-plugins-bad_1.18.6.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.6.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.6.bb
index f71d52fc31..63e3488e9e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-msdk-fix-includedir-path.patch \
            "
-SRC_URI[sha256sum] = "a164923b94f0d08578a6fcaeaac6e0c05da788a46903a1086870e9ca45ad678e"
+SRC_URI[sha256sum] = "0b1b50ac6311f0c510248b6cd64d6d3c94369344828baa602db85ded5bc70ec9"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.35.1


