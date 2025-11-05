Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A95CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2995.1762386444481806598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ti9ggbt2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386444; x=1793922444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FbGSAIo/n9KIqiVGGO4AaIKHWDpyLd1USeq8lxU9U2o=;
  b=ti9ggbt2Jz7AJiNZDOF7qHr4htHut+5Vz9ZuFFOttEFIi6Y1T6vQCZ2g
   lpiiQSYAwH3pbW8juU8mB/frkj8x3JmcRs+jvzb78pfEkU8ICBieIy/Op
   Zto9uOxZFTPXiwS6flhf7koYkDG1NPScifg6rc6rkPi6Ezd7VsWq4CTkT
   QWTHd2om9phGYpEylSVP7CW5gVCGfq6XSAMEGEsXGP2krLozd7e0pbhph
   7R6JtRyDeZ2ssgdONwqIZ/3hAPuarnGY5EGKUTzsZkJC0IVZmqbvppAQ+
   v+WuH8+L4KOWGHhBmTyqx9EfzxYXxhwhJ7mMaCOByimIsJt3wvbdX1rVn
   g==;
X-CSE-ConnectionGUID: ExZsDCprQDa6IlCsDZahmg==
X-CSE-MsgGUID: sRfz3oJUTeySJ1EhapijbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="217613107"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="217613107"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:23 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 12B5F42A338
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:23 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BCC23C026D0
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 31B4D140008B;
	Wed,  5 Nov 2025 23:47:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/29] bash-completion: upgrade 2.16.0 -> 2.17.0
Date: Thu,  6 Nov 2025 07:46:46 +0800
Message-ID: <20251105234712.446-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225933

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{bash-completion_2.16.0.bb => bash-completion_2.17.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.16.0.bb => bash-completion_2.17.0.bb} (92%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb b/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb
similarity index 92%
rename from meta/recipes-support/bash-completion/bash-completion_2.16.0.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.17.0.bb
index d1a8f5e0cc..843b5b831d 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb
@@ -14,7 +14,7 @@ SECTION = "console/utils"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "3369bd5e418a75fb990863925aed5b420398acebb320ec4c0306b3eae23f107a"
+SRC_URI[sha256sum] = "dd9d825e496435fb3beba3ae7bea9f77e821e894667d07431d1d4c8c570b9e58"
 GITHUB_BASE_URI = "https://github.com/scop/bash-completion/releases"
 
 PARALLEL_MAKE = ""
-- 
2.43.0


