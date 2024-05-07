Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF774C25B76
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 02:23:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web11.2336.1715048594666835286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 19:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=EWD/kE0A;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715048597; x=1746584597;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xJHIQV0IvYjH6rLZUUfrALbFQMD8XLpUqkCRB028N+0=;
  b=EWD/kE0A8A8yJ77KesHPJO1a+Au333MA/Rt9sAd/xIW1/it4uwG/LO3c
   bh0lTHWxAppC+h6IN8UdxDkrAuA+hNS0sOefddFO9V99P6ig8o2ktaGKf
   VYuwuUsQb9Z7eG4Eq0ok9cwYz1SROwcrmksc50u6+VS3L7fjjI59Hs16A
   b+KhCIzNL1h6HR1Fp8fDd7Mik/IZ/PW8SnzdxSFHc2dPR/NoKwH+mv/bq
   bTYkyCOvZeiiCxGDlgaDSnQEYAT9V8T9KhnsqLNYlwkrb3tAr/wm8ExEL
   RYtztjGfBQC4i4upOwc+ub5W0L1wdvLZqpw11V1Qywx8gkm4TR/0dXn24
   g==;
X-CSE-ConnectionGUID: UskEtrKWTzacxoqZWgt5nQ==
X-CSE-MsgGUID: GjqoxC6tTM6YUwOpvjt0WA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21432115"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="21432115"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:23:17 -0700
X-CSE-ConnectionGUID: s9uwl19LRA+aEXd2P6af0Q==
X-CSE-MsgGUID: 50f/WAwqTAiRhImPuxTKRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="28445782"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.119.181])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:23:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] libproxy: upgrade 0.5.4 -> 0.5.6
Date: Tue,  7 May 2024 10:23:05 +0800
Message-ID: <20240507022308.13637-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507022308.13637-1-anuj.mittal@intel.com>
References: <20240507022308.13637-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 02:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199060

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libproxy/{libproxy_0.5.4.bb => libproxy_0.5.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.4.bb => libproxy_0.5.6.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.4.bb b/meta/recipes-support/libproxy/libproxy_0.5.6.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.4.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.6.bb
index b4f4c6d2549..6a705b305f3 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.4.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.6.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "dff9a603d823dcc740ec966cd27960daa6b891b1"
+SRCREV = "e7d18806575e21f94cf2f6024659386b129ca189"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
-- 
2.45.0


