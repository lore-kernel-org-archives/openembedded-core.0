Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53248C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:48:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.4221.1665391685511087145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q4jHtLbm;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391684; i=@fujitsu.com;
	bh=o1OTxdMPSgwoSbF9u3QwKnCYxNcXbQ9DWcEZZZsdzDs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=q4jHtLbmtoKPTd1tDmeoB165c+LhiOI5G1CMII2S0BsN6VfKhmPHY5cDRsxKvoV8A
	 0BCZyJYQGfTyZyUYRE4DLsJvS+JiJokwJtO5HLvh6Q3JZDwgnZf5mqXJBUTbhH8vfO
	 +eJJ/A8d9OKxJoH/5FDPyyF8boM6UbHpUS0BHyxaimKxYhwKnoZDdjz72XZ1KxH9gg
	 GWxZ+u+atDRxQzhOpAbRzr7vo2hRwTUaOWbi1cSLEh1igNKiAiLAq4ioaANtaVb1lt
	 dfLDgVpA23SLB1FRu2ut0I6/TC23Sb0cZHnoUWjggoQ74XGjgbFAr+XS846mx8JGuO
	 TsX+wezuhd0ZQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8OxWdf5jnO
  ywaaDmhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bvwj0sBU/YK162/2FqYOxn72Lk4hASeMAo
  cefZdCjnEpPE5W/X2SCcPYwSPZNXsnQxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAg8SCO4+ZQGwWAVWJ/gc/wOK8Ao4SR/6tB7MlBBQkpjx8zwxicwo4SfyasAfMFgKqmT
  W9hRmiXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1VSUWZ6RkluYmaOrqGBga6hoamusZGuoYleYpVuol5qqW55anGJrpFeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgEKcUK/DtYGxe9VPvEKMkB5OSKK/BIedkIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8T24A5QSLUtNTK9Iyc4ARBZOW4OBREuF9cBEozVtckJhbnJkOkTrFqMsx82vbAWYhlr
  z8vFQpcd66W0BFAiBFGaV5cCNg0X2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDve5ApPJl
  5JXCbXgEdwQR0xMmrTiBHlCQipKQamHaY/ebwf73NzuaZf3XII/aYrG4t+/zXbPxnZMxlxU/7
  CV3T/VUiv6Cg/q+h3dWv06f6dfJutQ9dLjjndjvb5/N8e3j+qAT5bs982PZcfaO/V8BC9sJWz
  szNV8TzVyTpXcl6zxnFmtiivdf3/s75p/fP5Ci8prPQYUWh/dTZAXOO+FxzaJpZzflzl9FFJS
  PJlJ38WX69Zxd+D1FkuBmsE5/MfNjL8ZBA/blZix8cXN94Yl/lpCy+1Nhq63uS+sdlDv6fcEr
  juE5i8S3BSR3uRR8vXxG8GnXpSt3+C52xux2D9jLGy9b+rzlzRUSwdaN/sC9DTox93L9VHQeX
  r3N58/PrWeljIY9WaWZr3zx+TomlOCPRUIu5qDgRAM3LVSJpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-565.messagelabs.com!1665391683!81207!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13776 invoked from network); 10 Oct 2022 08:48:03 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:48:03 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 56675152
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:48:03 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 49C337B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:48:03 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:48:01 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-git: upgrade 3.1.27 -> 3.1.28
Date: Mon, 10 Oct 2022 16:47:34 +0800
Message-ID: <1665391655-8162-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665391655-8162-1-git-send-email-wangmy@fujitsu.com>
References: <1665391655-8162-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:48:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171568

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-git_3.1.27.bb => python3-git_3.1.28.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-git_3.1.27.bb => python3-git_3.1.28.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-git_3.1.27.bb b/meta/recipes-devtools/python/python3-git_3.1.28.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-git_3.1.27.bb
rename to meta/recipes-devtools/python/python3-git_3.1.28.bb
index fb1bae8f8e..cdcd862be2 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.27.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.28.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1c885ce809e8ba2d88a29befeb385fcea06338d3640712b59ca623c220bb5704"
+SRC_URI[sha256sum] = "6bd3451b8271132f099ceeaf581392eaf6c274af74bb06144307870479d0697c"
 
 DEPENDS += " ${PYTHON_PN}-gitdb"
 
-- 
2.25.1


