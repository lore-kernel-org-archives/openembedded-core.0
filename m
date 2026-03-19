Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1D8108E1DC
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:25:56 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7873.1773915947167019113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XR04KaPM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915948; x=1805451948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KdzqBK7joE0Inly8OLHMz2o6l0EnLGQEw0hnZM+TZ3g=;
  b=XR04KaPMkG5eHl13u78GmZYgxNm7cRhgg+OgEE7XtgCnMDIscsa4JN7l
   jua8S8DjkadEd7L9S537Sp8ad0D5lYOt8ZYshsrVZSZi7NMrAwk8W/Ip9
   SWpUfOLx3M3I1F9R7gPdffpCQfSGIcylacjHGuLNkRdI5y/HqDX7cl0P3
   yhl/B0p5ZMCgPJRnXU5vMy7Ic8qPOKNhdFKCVqhwmpejFFYe+Y6bBy5Ai
   rC6gXOoZLYy9hqETW+PaHQRsKsyy8Pod8pmIL8Yfp2l6jHH56Fn4zNZuq
   o93frpkoW94c580rceCMpbDPMl2Y8EpL4JPEz4+MoCqbzqLUGuEFVEig4
   g==;
X-CSE-ConnectionGUID: +ddeEoKSQVGak1BnNG4Qpw==
X-CSE-MsgGUID: 7YqWgIClRJ68rJOua1TGfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="221829634"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="221829634"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:07 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1DAC11C0018F
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:08 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C68F5100595C
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E0658101E52F;
	Thu, 19 Mar 2026 10:15:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/40] openssl: upgrade 3.5.5 -> 3.6.1
Date: Thu, 19 Mar 2026 18:13:16 +0800
Message-ID: <20260319101332.2067-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233509

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openssl/{openssl_3.5.5.bb => openssl_3.6.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.5.bb => openssl_3.6.1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/recipes-connectivity/openssl/openssl_3.6.1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.5.bb
rename to meta/recipes-connectivity/openssl/openssl_3.6.1.bb
index 7799647415..849bfe0874 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.6.1.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69bd789f28bc2a89"
+SRC_URI[sha256sum] = "b1bfedcd5b289ff22aee87c9d600f515767ebf45f77168cb6d64f231f518a82e"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.43.0


