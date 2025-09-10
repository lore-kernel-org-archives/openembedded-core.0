Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9BA4CAC58E
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:49 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.13234.1757495861422443382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dZd3Gh0a;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495861; x=1789031861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=04M65lO5jxDKgrB1KZTyF36TMny8P1J5wyrkb4x7ETw=;
  b=dZd3Gh0aHldMxJ4Pr8zQc9VJdIfE7RhyiaOuiW0nlvV4XtIhg4deyB5y
   wI23Br111cOGNXcf9QfFCgBhkUiyjNx6tFH480qUaE37MKNBDV95SqMjB
   Ow0ZV7u4vanT0GHbU3321VX6X43913mA+06qjMFInZNGBsv/NpoUJ5fD2
   0LLc8lLLc6tE/VidaxINvOsDbWhqvpteCk4wKy3tjelSaGp8JwDrU9TmK
   8aQW6TtrwyGvyRXpIvf4ZqmbGb3lhD4loS5LYJgNyhxWnPExBxVunQvkY
   4CPtINq8APhhZCXl5FdAYKmMt8tvqDU3XXHd2HmqWRVuybEdy3N6J5+Mk
   w==;
X-CSE-ConnectionGUID: w6P9DaV4RH6E2NcR/WAZBQ==
X-CSE-MsgGUID: wn2ZAgXlQVKeoRy//IaBBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="191384250"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="191384250"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:40 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id F3D61157E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:39 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id AC7A21000100
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:39 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 212BC4076B8
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1ECB91A0071;
	Wed, 10 Sep 2025 17:17:35 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/40] pixman: upgrade 0.46.2 -> 0.46.4
Date: Wed, 10 Sep 2025 17:16:32 +0800
Message-ID: <20250910091646.998-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223177

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{pixman_0.46.2.bb => pixman_0.46.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.46.2.bb => pixman_0.46.4.bb} (95%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
similarity index 95%
rename from meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
index 71c7f9a98d..58c7bf3d03 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.46.2.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb
@@ -8,7 +8,7 @@ SECTION = "x11/libs"
 DEPENDS = "zlib"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz"
-SRC_URI[sha256sum] = "3e0de5ba6e356916946a3d958192f15505dcab85134771bfeab4ce4e29bbd733"
+SRC_URI[sha256sum] = "d09c44ebc3bd5bee7021c79f922fe8fb2fb57f7320f55e97ff9914d2346a591c"
 
 # see http://cairographics.org/releases/ - only even minor versions are stable
 UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
-- 
2.43.0


