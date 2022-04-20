Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D42C35295
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.3165.1650419971168400442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=IAKhA5E5;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650419979; x=1681955979;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OSsdb3SE0IIbEZ1J8Wh2+TwMt8uwBOi1kiT4vbZVpww=;
  b=IAKhA5E5b996Ham9rBMrIFBtfyT0cKW0oeayZa/vW6RQXEcXGsdaelM0
   LuQG3pG4BM+zKj3tCwtsqpMxqEAVeIABrRshDqDsHlJrn+2ZfnKgZIhTb
   M82u/Og9Cz3tUJzoG9wDHWp4iMlKejVdY5LA8YO+SUTtOOI8eDP/Pc5KB
   uh1Wl5LAm8nWUwL9FGN5cQ8RvHW88cpZMNgTbqiYsPbr+QhVN8f0BqE9b
   WPY7O+NFpbJnvqUO1B6wIco8FKdu2iYDPpGo29zzONgeSqWf5yQkiG71+
   nV9PFuV5BI5D2Oneaj/MKXsmmS2i2JuWA4POgMkotPvCNkR1+gm4KDFo7
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="350364645"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="350364645"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="531071496"
Received: from kchew4-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.150.151])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:33 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/11] pseudo: Fix handling of absolute links
Date: Wed, 20 Apr 2022 09:59:10 +0800
Message-Id: 
 <ab69b7566f04aa5495c0004064d41784734c9e84.1650378286.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650378286.git.anuj.mittal@intel.com>
References: <cover.1650378286.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164646

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Update to a version of pseudo which has a fix for absolute links,
evaluating them from the chroot path.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 33147b89bc3c9e9bdd53a942a5551d8a1d06130c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index d20136aef9..e7ef6a730c 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "df1d1321fb093283485c387e3c933d2d264e509c"
+SRCREV = "2b4b88eb513335b0ece55fe51854693d9b20de35"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.35.1


