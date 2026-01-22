Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D58C44536
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 09:05:47 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33183.1769072744367514422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 01:05:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FapyJFqy;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769072744; x=1800608744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KaPYtQvehnIgV/j4OQATyATKX7aq8s4fbCFtaCyqBBc=;
  b=FapyJFqytCamb+FDcw7wiEB8vsn1Fv4CUng3uURC4RfT0HOMkZm8jy8q
   ziV/3Fm7D54Eu8RKLsrwbeI76hD1gQVV6zy7zmynUv7sNB6dp30dCqP26
   aExNmrVOinAUyibKjHjrxgUABeJDnJ14Ia6RGWQPKTjd2Eor5q3XlG8Yv
   8h62Ef2ePnh1zwmNjVte+pEGIGBTLqPBJUPcMHJTy3lxLp3hZrh2Z6dn9
   +2fXkhwuYHIZT8Cwja4FAJDG8uV1lEQW7Pr3vNQu+CawqA86CthQ6w6aF
   yfdH+CSDjkRotcfOwKRVQiGqgwviNE9B3Dbjwtn5Ejxuxs1JDDHgGRgaI
   A==;
X-CSE-ConnectionGUID: g1BvH5GAQM6l9bULt6VgEg==
X-CSE-MsgGUID: 3DF1C431Tz6pdLnoR8k22w==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="215292079"
X-IronPort-AV: E=Sophos;i="6.21,245,1763391600"; 
   d="scan'208";a="215292079"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 18:05:42 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D30728204CC
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:05:42 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8777A1809C20
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:05:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id D5CC820044DF;
	Thu, 22 Jan 2026 09:05:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 5/5] less: upgrade 685 -> 691
Date: Thu, 22 Jan 2026 17:05:13 +0800
Message-ID: <20260122090513.888-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260122090513.888-1-wangmy@fujitsu.com>
References: <20260122090513.888-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229838

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/less/{less_685.bb => less_691.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_685.bb => less_691.bb} (95%)

diff --git a/meta/recipes-extended/less/less_685.bb b/meta/recipes-extended/less/less_691.bb
similarity index 95%
rename from meta/recipes-extended/less/less_685.bb
rename to meta/recipes-extended/less/less_691.bb
index 904980a72f..8354dc4486 100644
--- a/meta/recipes-extended/less/less_685.bb
+++ b/meta/recipes-extended/less/less_691.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "2701041e767e697ee420ce0825641cedc8f20b51576abe99d92c1666d332e9dc"
+SRC_URI[sha256sum] = "88b480eda1bb4f92009f7968b23189eaf1329211f5a3515869e133d286154d25"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.43.0


