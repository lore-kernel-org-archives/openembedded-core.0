Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11087C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:12 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.26626.1646662450774052538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=VyjB087Q;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662450; x=1678198450;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xzyFOEiw9qAnd9EuXYDhMmDkUtXZjgPbTCE3RzHqR78=;
  b=VyjB087QVGO0vuD0NP/gPZ4jBgNIYk/swc7Tgex0p0ycHQBerfKyEw16
   k3QFMtBQQE1EDMCBtrmlBIZsYNmfvUSOI0yjYeShtuG40txxl54FkbtL3
   khkt32wyJZb8sLMND8mYKFxPqgOvDyxQ3ai1bjwf1kSJifDjt4wp+krVu
   c5cl8FrBYgB2x+BU9y8927opMZhYiKxT46aiyE4M0rPVc3r3NP//Qzwj2
   8/gDfD6S+p9jxZ9idpE92t6ByHmxLf5v1g/fyE2DjlouKA1DyMq3ehv/6
   /oOU8SngcIPhAUN4Vrh7PnfV7popnYWx48gqC2dB5Bx8Itl28I45PvA72
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112618"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112618"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:47 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070963"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:46 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 25/25] expat: Upgrade 2.4.6 -> 2.4.7
Date: Mon,  7 Mar 2022 22:10:01 +0800
Message-Id: 
 <c2ebef2113d05aefb98b41caf380e03ec368934c.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162846

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62a797b863c443f35a5ae9483c12108fcf24b606)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/expat/{expat_2.4.6.bb => expat_2.4.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.6.bb => expat_2.4.7.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.6.bb b/meta/recipes-core/expat/expat_2.4.7.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.6.bb
rename to meta/recipes-core/expat/expat_2.4.7.bb
index 3e779c3dea..0530ece64d 100644
--- a/meta/recipes-core/expat/expat_2.4.6.bb
+++ b/meta/recipes-core/expat/expat_2.4.7.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "ce317706b07cae150f90cddd4253f5b4fba929607488af5ac47bf2bc08e31f09"
+SRC_URI[sha256sum] = "e149bdd8b90254c62b3d195da53a09bd531a4d63a963b0d8a5268d48dd2f6a65"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.35.1


