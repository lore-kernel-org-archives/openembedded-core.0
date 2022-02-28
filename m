Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8BDC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:11 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19884.1646056854267710663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=IF8jLcIM;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056871; x=1677592871;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5pRPezs2SqPLZygEEdalSpnKFomm+XR9ULAlwet/eAQ=;
  b=IF8jLcIM0bbiO8dOpuOybzYw5DvPuBDYnD7pkPQTy4ub8k6snrZuU8ed
   cbhPS5USaTcC9vweP7KScKzZ4gQP3R7rP8vhuSiXoB+ZRXmg0TH9esPW0
   8VjNulRhpemt8fDQXDwgJdVv6Ep75rjDTWzRrcVPlZbZfC3EXS7G8Isqo
   4E08NBatzUbJWErO8A7CEQWHBVXVcd+uY+erfqrWApubPpT0qUG5QDx0i
   MgSaEr51Yan29tWDaEH7PVjUfEfcgF6+zXPSYZBsAeY7YFgcGQxGj+bJU
   871s1//lw3ezmvYrhepejaNsgX+D1VzYA5GRenmom8gPfaxpmoNxIVn+h
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857181"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857181"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:07 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092485"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:06 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 18/39] gstreamer1.0-plugins-good: 1.18.5 -> 1.18.6
Date: Mon, 28 Feb 2022 22:00:08 +0800
Message-Id: 
 <9faccf79c3400f3d9664d1d9a0660a9db1f9472e.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162474

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ugins-good_1.18.5.bb => gstreamer1.0-plugins-good_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.5.bb => gstreamer1.0-plugins-good_1.18.6.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.6.bb
index 6f642d01ef..72ad8eff08 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "3aaeeea7765fbf8801acce4a503a9b05f73f04e8a35352e9d00232cfd555796b"
+SRC_URI[sha256sum] = "26723ac01fcb360ade1f41d168c7c322d8af4ceb7e55c8c12ed2690d06a76eed"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.35.1


