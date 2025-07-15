Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B72C83F37
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:36 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2989.1752566909382267487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AYwjS9Ky;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566909; x=1784102909;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QfNfVnHZLv/c8xNEQzOXQ+wRUTBpxXJRfzgNWd5mWTk=;
  b=AYwjS9KyUplF5RXIwXFU0bBNDzLv8UpwAgtbzVC/IxoUki7lZrQFw6ai
   Bz62OAP7ovwKFAYkmEY0BANQ4pO2EIGqpVgx8VnTMG+qqgdTQQn08u9qb
   nDmasj+MJrmf5pLza6Wog6XbnUsYAW1jCx1OxqwQ/+X/uvtBVln4MboT/
   xj/553X+wahB4o/gjp46AZt6MlRPIIY5JngGawONKiTofNcrH/WBxj5h2
   NiFpLW7CPdPACzkix4/YKKQXOm7vfd4wP5121lXAb6yeGfxLbLTLzZceX
   m7qJ5TXXjmtDSuWJrnGUS2bFriP0uXive3+fR/WdGPyLe0HraSEGTj3Lr
   w==;
X-CSE-ConnectionGUID: k6GpJINYTZqOzNG+JIMfLg==
X-CSE-MsgGUID: kSPcYG8TT6e5XXbZbR4s8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="194341504"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="194341504"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:27 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 6E8871002B96
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:27 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C6F5C8D65EA
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5DB2D1A0074;
	Tue, 15 Jul 2025 16:08:23 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/19] git: upgrade 2.50.0 -> 2.50.1
Date: Tue, 15 Jul 2025 16:08:03 +0800
Message-ID: <20250715080819.622-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220272

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.50.0.bb => git_2.50.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.50.0.bb => git_2.50.1.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.50.0.bb b/meta/recipes-devtools/git/git_2.50.1.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.50.0.bb
rename to meta/recipes-devtools/git/git_2.50.1.bb
index 2d28fd05fc..36401c58f1 100644
--- a/meta/recipes-devtools/git/git_2.50.0.bb
+++ b/meta/recipes-devtools/git/git_2.50.1.bb
@@ -170,4 +170,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "920f8ca563d16a7d4fdecb44349cbffbc5cb814a8b36c96028463478197050da"
+SRC_URI[tarball.sha256sum] = "522d1635f8b62b484b0ce24993818aad3cab8e11ebb57e196bda38a3140ea915"
-- 
2.43.0


