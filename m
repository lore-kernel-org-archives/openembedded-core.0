Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB0DC433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 02:54:28 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.1700.1650941656313754698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 19:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=hJvRCup4;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650941656; x=1682477656;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fOXJEgSFmJtSMzL8ZiUbK8d43aI11zrfhDf16L8ZE1E=;
  b=hJvRCup465FWz7kjIGWQdZAks1VmEI1JT4Y7Bh8aVlGRG2xpBK3opWxi
   C5++D33Zzy1+aAj1UZFCXGy8LdDa+0yqQKRpZAAaVVtOdEcNMmg6pJuDc
   Qv3m8aneuljxNMR/rpvGeNweYvGksNM4QmU1wD91AtDdtACzi+uKihPC4
   ukQaz06FTkx9PpADI2mH4O6oCyjC9kQQ72iGK+GCQJzBbUqozRFFowGrS
   1Rm0leAjsgZtEOtLaIn40DECWj7cFeKqwOJRvDDyi3UR2B9R4KTqJ97s7
   rMuca5gYWEZTOEtDa3B6XNHc0wqjZn71ekSqvKfnqZC8m1u25LvsciJmQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="264950963"
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="264950963"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,290,1643702400";
   d="scan'208";a="660439837"
Received: from huiyingn-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.47.238])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 19:54:14 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 3/7] u-boot: Inherit pkgconfig
Date: Tue, 26 Apr 2022 10:54:01 +0800
Message-Id: 
 <3acf518f06afa73ec68556a2ef19db68576144ad.1650941226.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650941226.git.anuj.mittal@intel.com>
References: <cover.1650941226.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 02:54:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164850

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

pkg-config is used by the Makefiles, and thus pkgconfig needs to be
inherited.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6148ac9bc5d3e0d0ffdbbd6695acd96ca1836b78)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 2423e9ca14..9af65e6b27 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -19,4 +19,7 @@ SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
+
+inherit pkgconfig
+
 do_configure[cleandirs] = "${B}"
-- 
2.35.1


