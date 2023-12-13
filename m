Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC326C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 01:30:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.13874.1702431033997413954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 17:30:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ES0whMbp;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702431034; x=1733967034;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=DAwEbuU9ovDFmNb9nb0pMauGfTnUCj3jpjvCsKLMAJc=;
  b=ES0whMbpNl90hCuDuymqTip7Ey8XKVe/dGM7+84QkR9xrzrVa05u740r
   +2owz+KEo3wEvDtdw1KlWDNz2ZCqmsQ4Q5MHhcfLMItdQy4rACOi4RaPq
   Hi2Z1S03xVo0eX5/QbQOcTZBfK2O/7shdnXdnWj8NMADJECDhrArH1rEL
   KAgUaUwUsaUmIaKViydGjOZwU2pdTN5Tuos80IkoGsfUZJqajapdt6YEf
   b69Lg6eVRvQrDNEJnbU5nxNdnNTAR52Z1g6fitlOHNvM0veLQie2ABoe6
   k28OEhV0MB41btdBsgtsYsUSUI3DgtPB359U+rXv+uW/GqqjldDkRhNmB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="394649509"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="394649509"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 17:30:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="897142587"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="897142587"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga004.jf.intel.com with ESMTP; 12 Dec 2023 17:30:33 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] perl: 5.38.0 -> 5.38.2
Date: Wed, 13 Dec 2023 09:10:54 +0800
Message-Id: <20231213011054.3411751-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231213011054.3411751-1-chee.yang.lee@intel.com>
References: <20231213011054.3411751-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 01:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192257

From: Lee Chee Yang <chee.yang.lee@intel.com>

update include fix for CVE-2023-47100.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/perl/{perl_5.38.0.bb => perl_5.38.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{perl_5.38.0.bb => perl_5.38.2.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl_5.38.0.bb b/meta/recipes-devtools/perl/perl_5.38.2.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.38.0.bb
rename to meta/recipes-devtools/perl/perl_5.38.2.bb
index 639664e355..a9d684cfc5 100644
--- a/meta/recipes-devtools/perl/perl_5.38.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.2.bb
@@ -26,7 +26,7 @@ SRC_URI:append:class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "213ef58089d2f2c972ea353517dc60ec3656f050dcc027666e118b508423e517"
+SRC_URI[perl.sha256sum] = "a0a31534451eb7b83c7d6594a497543a54d488bc90ca00f5e34762577f40655e"
 
 B = "${WORKDIR}/perl-${PV}-build"
 
-- 
2.37.3


