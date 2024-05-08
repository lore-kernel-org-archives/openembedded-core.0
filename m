Return-Path: <jorcrous@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5404EC04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 15:20:13 +0000 (UTC)
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
 by mx.groups.io with SMTP id smtpd.web11.15456.1715181603381434940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 08:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=i2MNus1C;
 spf=pass (domain: amazon.com, ip: 99.78.197.217, mailfrom: prvs=85158e01a=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1715181603; x=1746717603;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=klWIpPX6qewKBdNPa5ltY1+TEa27oc0Fqknf8JcWPCQ=;
  b=i2MNus1Cuz3q+Smnb6JWRjzi2tGkON+0Vx6HlIwlV3lY77CG7aL5y+RK
   KjtTZ/DmooClC566fidSIEE7jqear1xCuKyAxEaVdQ7pVJjniNt2oMrlR
   RpbN/smyTPAetKUgxUq4jApYWhZJryQBxBk0jV3X+O255/YGQR4KzFIL4
   8=;
X-IronPort-AV: E=Sophos;i="6.08,145,1712620800"; 
   d="scan'208";a="293781009"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 15:20:02 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.38.20:59466]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.40:2525] with esmtp (Farcaster)
 id 752de6de-cf39-4374-af98-db1f29430473; Wed, 8 May 2024 15:20:01 +0000 (UTC)
X-Farcaster-Flow-ID: 752de6de-cf39-4374-af98-db1f29430473
Received: from EX19MTAUWB001.ant.amazon.com (10.250.64.248) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 8 May 2024 15:20:01 +0000
Received: from dev-dsk-jorcrous-2c-c0367878.us-west-2.amazon.com
 (10.189.195.130) by mail-relay.amazon.com (10.250.64.254) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Wed, 8 May 2024 15:20:01 +0000
Received: by dev-dsk-jorcrous-2c-c0367878.us-west-2.amazon.com (Postfix, from userid 14178300)
	id 85807E4C9; Wed,  8 May 2024 15:20:01 +0000 (UTC)
From: Jordan Crouse <jorcrous@amazon.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libxcrypt-compat: Rename libcrypto.so.1 -> libcrypt.so.1
Date: Wed, 8 May 2024 15:20:01 +0000
Message-ID: <20240508152001.67054-1-jorcrous@amazon.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 15:20:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199124

The comment in libxcrypt-cmpat incorrectly mentions libcrypto instead of
libcrypt which could be misleading to the unsuspecting grep user.

Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
---

 meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
index d5546ce9ba..30ec6a4674 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.36.bb
@@ -1,5 +1,5 @@
 #
-# This provides libcrypto.so.1 which contains obsolete APIs, needed for uninative in particular
+# This provides libcrypt.so.1 which contains obsolete APIs, needed for uninative in particular
 #
 
 require libxcrypt.inc
-- 
2.40.1


