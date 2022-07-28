Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2759AC04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 04:28:05 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.29084.1658982475678564787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 21:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=i62n1xKJ;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658982475; x=1690518475;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OPVYGMGK0QLErJNyC8imZ7ocsw/R1e0PgIBuWus8jlo=;
  b=i62n1xKJDOazqnHySNqsLScibKeQuPJiVGD0b5Q+TPBKw1n3VwIx6Get
   /zus3Lft0J5T+jgfCfBnKdkxiYv7t5ppbC3pBIP0tgWB5IydJit78/doa
   E89w94SCrgAQlQG5Fc8dvS9yHH/95ZR7vqHRrMvg0TesmQb7kfAj7Kkav
   Nr2GtQJiX3lNCcTzK70xzBx5ecYhfU5WkUqg+llacJ8ax/bjC2D2b0aak
   fHIIkpiyF+ERqsUL5XSU+YneJbQ364zaJDaQix2L3Wo8v9G0Mj6NMYMun
   YbcljJoXNnAYIiS13HOoHfu/IrV8rBlQ4MfT91bc0xBGjMmGGhsWrEENV
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="268182031"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200";
   d="scan'208";a="268182031"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 21:27:46 -0700
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200";
   d="scan'208";a="928090015"
Received: from saininav-desk1.png.intel.com ([10.158.87.77])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 21:27:46 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gstreamer1.0-plugins-bad: add PACKAGECONFIG for onevpl
Date: Thu, 28 Jul 2022 12:47:03 +0800
Message-Id: <20220728044703.1598223-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 04:28:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168593

Allow user to build this plugin against MFX version 2.2+ (oneVPL)

https://github.com/GStreamer/gst-plugins-bad/commit/beda9a73339bef878e95798f629a868c647627ce

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb                 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
index 2dd42395f7..6048e17214 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.3.bb
@@ -97,6 +97,7 @@ PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrt
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
 PACKAGECONFIG[x11]             = "-Dx11=enabled,-Dx11=disabled,libxcb libxkbcommon"
 PACKAGECONFIG[x265]            = "-Dx265=enabled,-Dx265=disabled,x265"
+PACKAGECONFIG[onevpl]          = "-Dmsdk=enabled -Dmfx_api=oneVPL,-Dmsdk=disabled,onevpl onevpl-intel-gpu"
 
 GSTREAMER_GPL = "${@bb.utils.filter('PACKAGECONFIG', 'faad resindvd x265', d)}"
 
-- 
2.25.1


