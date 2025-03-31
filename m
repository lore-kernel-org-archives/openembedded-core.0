Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71428C36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 06:49:39 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.45887.1743403771676864184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 23:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jweRv/vg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743403772; x=1774939772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CuzGZg3d1KJv04mgh1GDdpcS8s5Ulj1nnI56twv0y1U=;
  b=jweRv/vgoylREqPdz9n0ALbk27RvXtj6ceO2L0YEivCIvfXfuM46JD2q
   XOrK4KqemYp8hIbnDUToKQriNRd8q41fmrwcJA+CNHe+21JyhPeLfzCUD
   3iPWY94KGyR4zRcDoV2erbq8rSjIWnJzRk7ca/cJRgIC40KhchB4I1+CH
   BCwqkEDm7qwX3EDQ4GxTqZVbeXDLc+TXTB+zT6zUXtprdw3dgX19lzBrG
   cVw54TYW1sXBPBGu5gSZum0UmSe3iT1etNksQQyh5cE6/CZMcmBKmEdz5
   Jep+z+cAMI+htGiPByQcFQX1xR3P9roeSrWVdIIp8KZa28AsjmHgkp5lc
   A==;
X-CSE-ConnectionGUID: fILciKYvQ1S4Es7MEOib+g==
X-CSE-MsgGUID: IIVCiwJWTyKa6Uu3ObvHsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194932167"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194932167"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 15:49:18 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 150B7D4F41
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C2A1610362
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:15 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E49A31A009A;
	Mon, 31 Mar 2025 14:49:14 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [Patch v3 04/10] gstreamer1.0-vaapi: upgrade 1.24.12 -> 1.26.0
Date: Mon, 31 Mar 2025 14:48:38 +0800
Message-Id: <20250331064844.2155-4-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250331064844.2155-1-leimaohui@fujitsu.com>
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 06:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213947

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...treamer1.0-vaapi_1.24.12.bb => gstreamer1.0-vaapi_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.12.bb => gstreamer1.0-vaapi_1.26.0.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.0.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.0.bb
index c634de7c6a..8ed84d0ebe 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "39ab3d2a381c99a9e10f46182ed57c6baaeaa8be810bd2f84f162c8be299753c"
+SRC_URI[sha256sum] = "573931d455f5a96f63db7c8d35d51322b8d287816e8c6a77d84cfbb9fa1351f1"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.43.0


