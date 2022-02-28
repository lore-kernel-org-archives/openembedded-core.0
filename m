Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC48C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:20 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ILiGkNQv;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056879; x=1677592879;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=S7yRWoU4g+giPVV0AH+QXbL0vUonRyA3c3/x69cLvkY=;
  b=ILiGkNQv3juTa3yn28ZZ8cEGvriAXNSNX1XvwEK7A1rjPpKqe1kJa0xa
   bZPaJln1LEBoR8HpO/b2HxPuVk3Vo07Ztu2CxlKnBEK/eVJS19/llZ01h
   A2SVwf0F1/JypVUCt8xhJrLppe+3J6RACAFGf0e/tkjs6FSAe36WdPvPA
   x+v+jQ4HcVvx9iGc4Bf9leBe7w5MdHtZtfWc97XNAOXIqW7lENDcxKBie
   Qm9PG6aJOvtDJtU53vHYbNjrDz1ULbztlkMmEZMdBdtdU1hSkoYPrSQaP
   iJehKa0XZ8YI/0TIxJzk1fgzjzrtJYGB2Op5fwE66FS3MI8Nz41MzWCEU
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857286"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857286"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:17 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092617"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:16 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 25/39] gst-examples: 1.18.5 -> 1.18.6
Date: Mon, 28 Feb 2022 22:00:15 +0800
Message-Id: 
 <f72a3ab5455df01610d643de55e00dd53de272f7.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162481

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gst-examples_1.18.5.bb => gst-examples_1.18.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.5.bb => gst-examples_1.18.6.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
index 7b11cd228d..5af43d1eda 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.18.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
            file://gst-player.desktop \
            "
 
-SRCREV = "fe9a365dc0f1ff632abcfe3322ac5527a2cf30a0"
+SRCREV = "70e4fcf4fc8ae19641aa990de5f37d758cdfcea4"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.1


