Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90E4C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:02 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=XM1U9nRB;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056862; x=1677592862;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TG++fSBVeszHB4Tso0nLqvFp5INyTMc57IFvgQzRYJk=;
  b=XM1U9nRBqdLRrtnk7QnmY+qZEPemwfF59BtUlyECH9nS0cvO9J7LOwtU
   A89sYuIQJ/C4yRHs+tsDDqav89UgOwZ1Imtg/EGwRMDGway4yB4L5yR8q
   o9qvdhic3b+rqB/d7d6D7hnlktD/7T23AcagJ4o9EqSh6SgyZMUyag+0D
   wOfxNNT4aMbPk+zH3NqMiauJRudCusIYgmGB+pZ7+7bToGLA5JZduL9SG
   elBUiAzw0zhK/MeG6L0F+bqpvOvYZ9XyoChuviQ7JoCB1kUnDvqPADA3g
   0IFIDFO0IP/u8PqqBg4KiaO9yxdSQTwbHzNzhbzKCd4zV1xInFGwVYhPP
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857086"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857086"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:02 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092379"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:00 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/39] gst-examples: 1.18.4 -> 1.18.5
Date: Mon, 28 Feb 2022 22:00:04 +0800
Message-Id: 
 <446273b7abba2be768b566bac1bf8f9713d34373.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162470

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
index 4670ab34db..7b11cd228d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "959bb246a5b1f5f9c78557da11c3f22b42ff89c0"
+SRCREV = "fe9a365dc0f1ff632abcfe3322ac5527a2cf30a0"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.1


