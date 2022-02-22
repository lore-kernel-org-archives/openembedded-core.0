Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59024C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:20 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.13884.1645542499491252734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nRDJoiPc;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542499; x=1677078499;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=t9HUu+hy2UUTtPNDQ8Hl8EC3zU0OK5+5f3Ufzn++kA4=;
  b=nRDJoiPccIaE4C3MCyDCn4PDvTKdqDc1G6qDnWFFPBcqRFbZkqq9Sloh
   byDG8d0wWbSNF8LBZ+RbfbLldUk/+r8Rfti374RfVRKwDnOAHLsQHh/2B
   +JIRDYk/2gmsbxp3qMKV6mT2xzzn/KHm+AFBBGIXkr92qPutcJWoGdN8t
   1X5wREq5y0wrmiKhI0lpCuMdG+CGkBXJIq7CINXHdPawuM6WfjlpPA+se
   gBoFqYty1IHHeQRpGWAX8zHEd8sVo9taKrOWVYDCR7OPpD6oC8QAZGfCZ
   eN6dGty37Lr9j4ZTowJdJX3YeajCs8k7LVzBm6kXmXNwad6jOCzah9SoK
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="314960784"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="314960784"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:07:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258464"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:07:53 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/38] gstreamer1.0: 1.18.5 -> 1.18.6
Date: Tue, 22 Feb 2022 23:07:02 +0800
Message-Id: 
 <3d027656e9e501db2faf3216c58464fca308ccee.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162137

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{gstreamer1.0_1.18.5.bb => gstreamer1.0_1.18.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.bb => gstreamer1.0_1.18.6.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.6.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.6.bb
index 0d82dd338c..4bf89ed109 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.6.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0006-tests-use-a-dictionaries-for-environment.patch \
            file://0007-tests-install-the-environment-for-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "55862232a63459bbf56abebde3085ca9aec211b478e891dacea4d6df8cafe80a"
+SRC_URI[sha256sum] = "4ec816010dd4d3a93cf470ad0a6f25315f52b204eb1d71dfa70ab8a1c3bd06e6"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.35.1


