Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD555C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 09:07:29 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19860.1644224834864333556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 01:07:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Boy7vbwl;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644224849; x=1675760849;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=C/BofeSh+PM2NlrL2aYAbNe6ejzfi1NKnnji3CirvOg=;
  b=Boy7vbwlNz4SLWmI6tqLFY/9/utK7BOY3281b4TKSsJ9Dm5wwF5hbfxv
   WGIV0phd3XlKr7AduasbMsjtyiwydGBVUnOkDUMOWFvM9ZHgjz63+Qc8Q
   hEyz3EB+LoLdeE132PNUEaxCl4l5I/Y3xyIGKV6a7kUvoS2azdGw57Bzu
   MXQB9SZ7mdLyQQR1buKzCPL6CIO7ZAZI7U80+bdZ/owd4ZUeM3U9V/VsQ
   rPKKSmUfPoXstU7HhSd78eT2/wf6UHAa4CPYDSsUVj/7ltyo4Zu8hUEEI
   aOvh2U78BZ9HTv62JS7n54EkJrKGaHlasswGumaLtcN128BKYF5O4n+06
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="309420861"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="309420861"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="499140479"
Received: from xgoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.138.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:26 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/12] expat: add missing Upstream-status,
 CVE tag and sign-off to CVE-2021-46143.patch
Date: Mon,  7 Feb 2022 17:07:02 +0800
Message-Id: 
 <a32cee6c9e1ff53e424b8386c36555e6cf3bf3af.1644224643.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644224643.git.anuj.mittal@intel.com>
References: <cover.1644224643.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 09:07:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161454

From: Steve Sakoman <steve@sakoman.com>

Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 7e33aa25acc0c29b8f5e78757c6557e614eb1434)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/expat/expat/CVE-2021-46143.patch | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/expat/expat/CVE-2021-46143.patch b/meta/recipes-core/expat/expat/CVE-2021-46143.patch
index d6bafba0ff..b1a726d9a8 100644
--- a/meta/recipes-core/expat/expat/CVE-2021-46143.patch
+++ b/meta/recipes-core/expat/expat/CVE-2021-46143.patch
@@ -4,6 +4,12 @@ Date: Sat, 25 Dec 2021 20:52:08 +0100
 Subject: [PATCH] lib: Prevent integer overflow on m_groupSize in function
  doProlog (CVE-2021-46143)
 
+Upstream-Status: Backport:
+https://github.com/libexpat/libexpat/pull/538/commits/85ae9a2d7d0e9358f356b33977b842df8ebaec2b
+
+CVE: CVE-2021-46143
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
 ---
  expat/lib/xmlparse.c | 15 +++++++++++++++
  1 file changed, 15 insertions(+)
-- 
2.34.1


