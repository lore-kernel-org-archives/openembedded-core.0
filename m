Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB743C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:22 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Cg4frK4Y;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056882; x=1677592882;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XC7Cp0SgZR3jNs9trCMusyzBBnPMeBHe1h84dvIEJJM=;
  b=Cg4frK4YNwla82iAfqtdq6AqVIPbYYbNUNfUv6ypKl4GYTD71jYuRbdw
   hrvfefnQcHADrw2txu6TW26eEMUfGOoHr+/szoSrT3vkwkjeCXD44vVKH
   gEqdRqVyFRqsuwWcpj7RGkuw7TKvMHgthcmQaephDUYjMqCGaOTgWV6f3
   +pOSk0kZIyXuF78UBerzJO50EdO5t8+TXfA8dhvKSzJ+/Sz8+j0xYrUA3
   hciK3dS/61zWgzpZr5HI0oR+Gx7VGTSXS7TBOdCVWcyg6GTeOP6+RwiEm
   2pnSTsadj1QzwtZ9LbQfhFktS6Av/0tOej/LTRdnk5E4YV5XcbowNAW+i
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857311"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857311"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:19 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092641"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 26/39] gstreamer1.0-python: 1.18.5 -> 1.18.6
Date: Mon, 28 Feb 2022 22:00:16 +0800
Message-Id: 
 <8cabb662e4298ca786a7e082c91938bc3858b611.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162482

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...reamer1.0-python_1.18.5.bb => gstreamer1.0-python_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.5.bb => gstreamer1.0-python_1.18.6.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.6.bb
index a6ab9589ea..1a3ae5dde6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.6.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "533685871305959d6db89507f3b3aa6c765c2f2b0dacdc32c5a6543e72e5bc52"
+SRC_URI[sha256sum] = "bdc0ea22fbd7335ad9decc151561aacc53c51206a9735b81eac700ce5b0bbd4a"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS_${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.35.1


