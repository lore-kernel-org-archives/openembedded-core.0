Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B28C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:00:58 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=je9zeiVW;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056857; x=1677592857;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tvdx+oiuDs1qupqG5yjvM18E7VHYT4ISMOBL7SYp190=;
  b=je9zeiVWm7zhzMpE/rfnRKFUY9jeo2ntpDNSAPXwumr3+0y8SHD/z29P
   vXNnuXAafr3xz03k3v0cRK0v4IFrydRgSNSuSY/mvUytwJux2R6rcfUFl
   9FnBY+He7wQNKuuMf6fTcD4B0LRsGeU9d+CfY1Zzt88T3lCwnTn/fQJsR
   ZBs5i4LJvgWlSJiC9M+HKkmh+iXunLi2IoYlRmeeCFbpZv0NEVv0aoIUX
   n03M6g3+f4joihrd4+BvNKD1xrQYh3/l3kiEMY3+APt3cUhYkEdEuMaBH
   h0TlKfnQhbhEKXnZoMJKdaydK6XGkrCV6OqDkFFvfjlOsILJ4XLAyDNKM
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857050"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857050"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:57 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092332"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:55 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/39] gstreamer1.0-omx: 1.18.4 -> 1.18.5
Date: Mon, 28 Feb 2022 22:00:01 +0800
Message-Id: 
 <4abf16486d64275e55b619b0fca37b0fc192ac11.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:00:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162467

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 65ed3c4e6c0fbade647ec31a6a77f06ed4e97e7a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0-omx_1.18.4.bb => gstreamer1.0-omx_1.18.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.4.bb => gstreamer1.0-omx_1.18.5.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
index d38be035f9..dc2d23ebad 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "e35051cf891eb2f31d6fcf176ff37d985f97f33874ac31b0b3ad3b5b95035043"
+SRC_URI[sha256sum] = "2cd457c1e8deb1a9b39608048fb36a44f6c9a864a6b6115b1453a32e7be93b42"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.35.1


