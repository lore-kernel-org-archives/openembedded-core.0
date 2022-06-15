Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096BAC43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 08:11:34 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.2017.1655280685035648038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D72unxMe;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655280683; i=@fujitsu.com;
	bh=zatTsBksi82rDLdNgE6WaxetEfHRzraW5BRYyEQOKe4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=D72unxMe9OCnpU7Baj5BueHUk5M+0cCsVQF9/o3KI8XCcoqRB4C0v9n5A1tEah/n+
	 6339Iswr70mJ9u9Us/JoeWfvNeXUgeNv8KJri/et0beRTaXKSzyuvLTAIY4KDMoOf8
	 pr5+W+mqeEGce+u3AJWbleCAX+xQlb4vtddlBYAss923szW2xF+PmqUcWwKd6Uznk+
	 5jfWvzDW6HbQlwM3RLOzKpOXrUCHvsVLMPRknDxYwc1uRCRrOMe85q4BNukop23AG0
	 b/jFXa5dvjmBA8qmpZnlLpdhsOiWy6k/Xcq9hH3ASNDZbbkisW0lkyXLGnYwc3afkv
	 2XOBYLBi8tHbw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8OxWVdryso
  kg+OT9C3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oynHQvZCp6zV3ybENTA+Juti5GLQ0jgAaPE
  5Mnr2CGcM0wSC5bdZYVw9jBK9BzZx9jFyMnBJqAmMf3WDaAEB4eIgJ7E1X+iIGFmARWJF7972
  EHCwgLmEuuXSoOEWQRUJWa+OMsGYvMKOEocm3KRBcSWEFCQmPLwPTOIzSngJHFr6yGw6UJANR
  27rzNC1AtKnJz5hAVivITEwRcvmCF6FSVmX26GmlMhMWPGNjYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRqukosz0jJLcxMwcXUMDA11DQ1NdM11DM0u9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3i
  ytzknBS9vNSSTYzAAE4pZlu5g3Fl30+9Q4ySHExKorzKk1cmCfEl5adUZiQWZ8QXleakFh9il
  OHgUJLgdZ0ElBMsSk1PrUjLzAFGE0xagoNHSYS3HqSVt7ggMbc4Mx0idYpRl2Ntw4G9zEIsef
  l5qVLivDGdQEUCIEUZpXlwI2CRfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG8nyCqezLw
  SuE2vgI5gAjqicd8KkCNKEhFSUg1M+W67z2g8SXzy+ZHZhenf3Nn+zPwzSdxKR/rCL4MLsr83
  K7MfNT319X/6g4kOO8r+H/11rJnlxfqihY/LWxbUCExv+LDkSob9LUZpnQUVsTpvron+dY7g6
  qxynHrXk9V4vucztcjTjQ/2uk86vMfstu+l/+u8t53afDWoQtcrRTtXtLNnh7tRkOFGRcd5P6
  bndWqseSZrYJ8b6CUz/yprlNtXs2Klx+Jrv8qJRG6KYXn88bSLw5tfv1aqydzNTZ9mwPjZdO+
  +mRqxihtmVV8SXr/czMnuoXlT5lOmz2LvrQLd7z8UnPslRTpRZkGEUml6iuemH8euB8ZddrIo
  mdJ97An7OtmoH8EJhizes7QrlViKMxINtZiLihMBoBYaxGcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1655280682!144118!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5378 invoked from network); 15 Jun 2022 08:11:22 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jun 2022 08:11:22 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3D0AC155
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:11:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 08717152
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:11:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 15 Jun 2022 09:11:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libx11: upgrade 1.8 -> 1.8.1
Date: Wed, 15 Jun 2022 16:10:38 +0800
Message-ID: <1655280638-6528-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655280638-6528-1-git-send-email-wangmy@fujitsu.com>
References: <1655280638-6528-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 08:11:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166912

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libx11_1.8.bb => libx11_1.8.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.8.bb => libx11_1.8.1.bb} (94%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb
similarity index 94%
rename from meta/recipes-graphics/xorg-lib/libx11_1.8.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb
index 6d5a8626d6..1dcc3abee9 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb
@@ -16,7 +16,7 @@ SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.xz"
 
 SRC_URI += "file://disable_tests.patch \
            "
-SRC_URI[sha256sum] = "081bf42ebab023aa92cfdb20c7af8c5ae13d13e88a5e22f90f4453ef80bbdde4"
+SRC_URI[sha256sum] = "1bc41aa1bbe01401f330d76dfa19f386b79c51881c7bbfee9eb4e27f22f2d9f7"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.25.1


