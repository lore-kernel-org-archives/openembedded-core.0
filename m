Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF93CCA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:49 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.13162.1757495859779723064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=prLBIGC6;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495859; x=1789031859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C8DHnDOupwvLIYvqPVN9Nqp5zryfSTLNGmEEeP/5/lg=;
  b=prLBIGC63cCBXNKRYbPBpFq3fc8C4JHnZoFEre201NolY9oQFM9GBfy6
   MrQck5ZBTl7lImusFjwNDetXhEfs/FDkxCySGU2+MWoYRrXMFCFif/ACU
   ex+OeBLqfFvifh/DMTa+BGYrWMo6vi7WwuvTydYBRZeZETTyY7ktOoKM7
   HmV3Iyx6jirgrkUlYdJjBhhtjokptkamkBVcOdPbCuHqYK5aHIFGc05Yi
   StJsdaLIpgWIEiKothfsBd6RcyyFPF9LvMHESmuNirQ08L2vS+V1xCT/9
   OnLI00uXO9/hJo9HwwGwvwFjwI1IDcIM1sE5C3xUJopmIZDLzbZfyClw1
   Q==;
X-CSE-ConnectionGUID: oB6UPQMgRs2sX6ziXNz+Iw==
X-CSE-MsgGUID: FWJoFb85RZe61mfs6Uqrfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="200394412"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="200394412"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:38 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 45A3F42A32F
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:38 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id F33C7180033B
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:37 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 4737382C0DB
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 259181A0086;
	Wed, 10 Sep 2025 17:17:33 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/40] msmtp: upgrade 1.8.30 -> 1.8.31
Date: Wed, 10 Sep 2025 17:16:29 +0800
Message-ID: <20250910091646.998-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223174

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.30.bb => msmtp_1.8.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.30.bb => msmtp_1.8.31.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.30.bb b/meta/recipes-extended/msmtp/msmtp_1.8.31.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.30.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.31.bb
index 83ec83f326..f43dc38bd9 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.30.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.31.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f826a3c500c4dfeed814685097cead9b2b3dca5a2ec3897967cb9032570fa9ab"
+SRC_URI[sha256sum] = "c262b11762d8582a3c6d6ca8d8b2cca2b1605497324ca27cc57fdc145a27119f"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.43.0


