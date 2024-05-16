Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09E6C41513
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 10:51:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web10.10459.1715856700667342611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 03:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ZKIUUCMZ;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715856701; x=1747392701;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NxmZuvmgt6bCUgndUkAAN9FuARbqtq9W2TxK6YIeIB8=;
  b=ZKIUUCMZq0DXmSpOK13eitjsPlOPgTdvNlUgsH8hf914Letsd7nwrqDj
   iv/nwVFGtxPRMw+2eZvO1zib6z4M6mYuaBPZK/hB2Tc5UINNQRknSa/Li
   xsL3Y1vlsuJ1enLhVNHvUeoDvpR4zaXoaz0eBRNU3D2gCIwt4UjFUSua5
   4zXzPsN/IPNLETPKZvdDePzq8dJ7LxQt5hr9XQkHKDj05o1T8+xIumNhw
   24PhuQGfrpbn6mHrdJvNsnCJv0z09xN6/7wqTv1WbLCAZmX9NgHf+ATGs
   mASdV2ejxTc8a04Ayp1K8IFIYOCWF1PhcW3V0JYClPoGbO2lsnMZGtolu
   g==;
X-CSE-ConnectionGUID: xrUYUivLRwm/5YdVADGMnQ==
X-CSE-MsgGUID: 2DjPVyh0SvGAhT42HS0dkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22561968"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="22561968"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:51:41 -0700
X-CSE-ConnectionGUID: T11yJTiCTrWda4UGc33uLQ==
X-CSE-MsgGUID: p/6VZ+mBRZ2SHcUBEM3K4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; 
   d="scan'208";a="31516339"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.118.165])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 03:51:41 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] stress-ng: upgrade 0.17.07 -> 0.17.08
Date: Thu, 16 May 2024 18:51:27 +0800
Message-ID: <20240516105129.35869-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240516105129.35869-1-anuj.mittal@intel.com>
References: <20240516105129.35869-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 10:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199455

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.17.07.bb => stress-ng_0.17.08.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.17.07.bb => stress-ng_0.17.08.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.17.07.bb b/meta/recipes-extended/stress-ng/stress-ng_0.17.08.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.17.07.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.17.08.bb
index fb88e06a7f5..fffe6a1823b 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.17.07.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.17.08.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "519151f460738cd62b69b84f8096cd218131e0a2"
+SRCREV = "b7c7a5877501679a3b0a67d877e6274a801d1e4e"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.45.0


