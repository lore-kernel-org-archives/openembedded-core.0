Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415B7CAC58D
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.13151.1757495822205357857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V9sHWJNx;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495827; x=1789031827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2D4ATkboLBPpCmIdF7R/npaZnL+WNWMg49rf3b/OPb0=;
  b=V9sHWJNxMZHOSEkcprq2A91ObtOjKnXxsxWNKA2DWA5hITTlx7fcYvRx
   /kGBJNpZzoO0WtFeOByoYHYvH0hyMtT/fzsN99TJUm+aAEFf9lg1FjGyX
   /0bg1/mObyqfg5ua5u2Y2VrtKCpZ69ANhf62t1SCiFMvX7A1GbVHs0GkR
   xeOWivzkRB1l4ZAA/k6VE/V1+0hMGk+OWkMzJ/ERS78CvSNTUwgF6bkMW
   +odc4DgQX3tjEugx7Ge0ScSP6RLD/twJ2UUxwG4N81288jGHYAFjHqcKj
   mgvM77L0ypB1FDbqhCrkOo1jYS9V8N6ijmVdh5ae5QCH+qp9ZCzUnwpvh
   Q==;
X-CSE-ConnectionGUID: cwbtN7FdTTmu7lVYEc6eaQ==
X-CSE-MsgGUID: aGb7EGE0TR+hYBe8dv/6+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="212404337"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="212404337"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:06 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id B7EEE100035D
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:06 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 71DF6C00D4C
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:06 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id DA55D82C0C8
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DE79E1A0086;
	Wed, 10 Sep 2025 17:17:01 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/40] libjpeg-turbo: upgrade 3.1.1 -> 3.1.2
Date: Wed, 10 Sep 2025 17:16:20 +0800
Message-ID: <20250910091646.998-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223165

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 3.1.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jpeg/{libjpeg-turbo_3.1.1.bb => libjpeg-turbo_3.1.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_3.1.1.bb => libjpeg-turbo_3.1.2.bb} (94%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
similarity index 94%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
index 2b39a4c1d9..d4877bb92b 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD instructi
 HOMEPAGE = "http://libjpeg-turbo.org/"
 
 LICENSE = "IJG & BSD-3-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=023c2e8942020502d6ea709e2a5453f7"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=52fddabc7e8e79233150ebda95c3fc1f"
 
 DEPENDS:append:x86-64:class-target = " nasm-native"
 DEPENDS:append:x86:class-target = " nasm-native"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "aadc97ea91f6ef078b0ae3a62bba69e008d9a7db19b34e4ac973b19b71b4217c"
+SRC_URI[sha256sum] = "8f0012234b464ce50890c490f18194f913a7b1f4e6a03d6644179fa0f867d0cf"
 
 PE = "1"
 
-- 
2.43.0


