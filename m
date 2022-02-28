Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F72C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:14 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZYRUPuiH;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056874; x=1677592874;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=h5mJSDYXvHv3tsDTcSd1P2H1mFJkDIZ6NHtYUh2z7ag=;
  b=ZYRUPuiHXZ0RD3rEZ4eSG+9doNYJUa2sLITRn94rMBbXZinVGcldQSpx
   klmbdsfkaWjzaiLU1j/jRk8X99ycZHU+go5RqWB0s0Riua2PlBv/JWKCN
   MH+jZ59Uq4ynBiAwiwITaijhWsn7DJoDoLhWSWPoxxFcOdo554SAgo4R8
   NAnGqdafkQW48yo3zHcBZeF0W4aAEDqdOftbPLAGxNoZ4LaXlX1UVz+R+
   VEcoq8QF7PCHjmuKREkvXaThBfRZI/Uc+Jd8JR1JEMRiDtfPQ+8lN1uaF
   a0T2zyZbOScb/rHmWLVnaScPQgJ9mZXD0KPNgTl+ZQ3s+ggW413VcwuiD
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857223"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857223"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:10 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092522"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:09 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 20/39] gstreamer1.0-plugins-ugly: 1.18.5 -> 1.18.6
Date: Mon, 28 Feb 2022 22:00:10 +0800
Message-Id: 
 <fe9825a3d992b2f2edcbef5d9ede5e7fb7f3fecd.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162476

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ugins-ugly_1.18.5.bb => gstreamer1.0-plugins-ugly_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.5.bb => gstreamer1.0-plugins-ugly_1.18.6.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.6.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.6.bb
index eae0c75d15..4774a17c1e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.6.bb
@@ -13,7 +13,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "df32803e98f8a9979373fa2ca7e05e62f977b1097576d3a80619d9f5c69f66d9"
+SRC_URI[sha256sum] = "4969c409cb6a88317d2108b8577108e18623b2333d7b587ae3f39459c70e3a7f"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.35.1


