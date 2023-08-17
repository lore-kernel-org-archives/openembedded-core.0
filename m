Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE4DC27C7A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 07:38:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.181978.1692257922425150253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 00:38:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=hG8jTnne;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692257922; x=1723793922;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Ir5DwCpuirWThJMuN0+hOOh8wWB7aTtIxQ+lL7AT+wQ=;
  b=hG8jTnnemZWQJhxWsWBnUjRRRxbap1cGQg6b1ECmbfr2z/FI+6SsKEqu
   GlDnTGrJIAMWT5nM0jXq/k3dV2pTRvltODfD5T1BAG/g2GgoDVmZlD3BT
   +qkpdU5XrbYhNwrNdtyRsXYEyKtaVNUAUDErzihp0a9quD83LcE7XxZBR
   dBbvd+0+sbLIPpLMe9hT8lSmp4B9jcvruduc3bFCwYn7Fbrvgs1wx0FmB
   b2xJPjPjAwXHwGzK7zq/0XxIo6XizDkSQ1TD5ee2Jx9ytuBKrCk1gJZCA
   7LcHWc3vzUdU7/EeKAe3nMYUMwcqx/Iznd9ycQfKxNn4eLW+pI9bSgyBm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403720049"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="403720049"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:38:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="734569778"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="734569778"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.150.235])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 00:38:40 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] harfbuzz: upgrade 8.0.1 -> 8.1.1
Date: Thu, 17 Aug 2023 15:38:33 +0800
Message-ID: <20230817073834.55471-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817073834.55471-1-anuj.mittal@intel.com>
References: <20230817073834.55471-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:38:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186291

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../harfbuzz/{harfbuzz_8.0.1.bb => harfbuzz_8.1.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_8.0.1.bb => harfbuzz_8.1.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb
index 359272e9347..110248a5cb4 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_8.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c1ce780acd385569f25b9a29603d1d5bc71e6940e55bfdd4f7266fad50e42620"
+SRC_URI[sha256sum] = "0305ad702e11906a5fc0c1ba11c270b7f64a8f5390d676aacfd71db129d6565f"
 
 DEPENDS += "glib-2.0-native"
 
-- 
2.41.0


