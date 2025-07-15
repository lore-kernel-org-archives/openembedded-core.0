Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F130BC83F34
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2949.1752566907680646826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eu0WFH8+;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566911; x=1784102911;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dftdif1MWcrNm0edXtmNymAWoadHa42ZeZ2BBI/LELI=;
  b=eu0WFH8+bkLwfyfh6YS9z61arHn+cWIEqCj92+6FSeB9i2nLBgsApD6F
   E9n0X6IEal+41/VMee+XomCJYLJqw626xjq3UfAR4qQCLA8pm1xPLOdaH
   PP+VazM8wULSvBoFqdFvo3vBzB1Sg0PBBZPnz3rUeRxWcjpZ5V+qmy1Yu
   HcEAHqF+tmqnT4UK/BB5EhIhQvY7BAzDqYTf3EjGdQmAN096MlCnqRRa8
   qYGmd91ck+4hKR3UR3+zMj7g0dQourvs5UVc9zQl6LT1faohVbaqKool9
   usX6OuIK09etod/Z7pywlKUucM4IFtKjM3WNawHnH+woYfLAX3yicnIFm
   A==;
X-CSE-ConnectionGUID: SpCmPHrsQFOny5jC0MgWUw==
X-CSE-MsgGUID: UMbgDOgbTjazlb9LTzvQfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="185309328"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="185309328"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:31 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 3275742A308
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:31 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7EE80C00214
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ED5D11A0073;
	Tue, 15 Jul 2025 16:08:26 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/19] libsolv: upgrade 0.7.33 -> 0.7.34
Date: Tue, 15 Jul 2025 16:08:08 +0800
Message-ID: <20250715080819.622-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220276

From: Wang Mingyu <wangmy@fujitsu.com>

- new features:
  * support product-obsoletes() provides in the product autopackage
    generation code

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.33.bb => libsolv_0.7.34.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.33.bb => libsolv_0.7.34.bb} (93%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.33.bb b/meta/recipes-extended/libsolv/libsolv_0.7.34.bb
similarity index 93%
rename from meta/recipes-extended/libsolv/libsolv_0.7.33.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.34.bb
index 13a6df2290..7e2bd686d4 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.33.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.34.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib zstd"
 
-SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https;tag=${PV} \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "9fb855d872139fb1ebebec4c892b338fccda69ba"
+SRCREV = "262e8efa0239a78770910fde1579158725cc6ffa"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


