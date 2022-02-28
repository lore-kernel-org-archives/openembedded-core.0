Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC061C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:00:55 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:00:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=BYmtNVv+;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056854; x=1677592854;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2OOCZFNeP6q+xEhZiqx7Oh0KNgOH5fmGHxV7NsgoTsA=;
  b=BYmtNVv+nfSVZ0c5IySS5N7bq784Nl2am+jnaNd/lCjAX8gdtlc1l9Qj
   6LsFOwAAitjk5AuZtYuLL6x2tL/h6NC2lISA+Fa96Q39AnkOerSrco6ZY
   QKNU0MTZJStdH165TSOaKgimJVRVMN7OeFO76qibbF3W3OdrxkSDrJVwJ
   sIZQQRGK/zFQSdDFD1HNuo5hgYUQ+nnwkF68yL34NecYVOQxzAjk4yMa7
   XypT2aDY7TtX8TzltBL9cAcBylv3u2bBNZEkF3CZFaajLvpq+agCUveJ/
   rKIlFvNG4I9L+sy5v2gQgjDLgBBzBQhK78SO/2OrYza/Clqqsay83zK6l
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857021"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857021"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:53 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092297"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:52 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/39] gstreamer1.0-libav: 1.18.4 -> 1.18.5
Date: Mon, 28 Feb 2022 21:59:59 +0800
Message-Id: 
 <f4898a69ba2510ab55809e52063589caa50f2052.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:00:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162465

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6a52088c1938c197d8e89e10d8e6622fa4b41465)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...streamer1.0-libav_1.18.4.bb => gstreamer1.0-libav_1.18.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.4.bb => gstreamer1.0-libav_1.18.5.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
index 6a84f92f31..bf1401975c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "344a463badca216c2cef6ee36f9510c190862bdee48dc4591c0a430df7e8c396"
+SRC_URI[sha256sum] = "822e008a910e9dd13aedbdd8dc63fedef4040c0ee2e927bab3112e9de693a548"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.35.1


