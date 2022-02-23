Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5088EC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 11:04:19 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.6158.1645614257982697452
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 03:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=B2im0wv2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645614256; i=@fujitsu.com;
	bh=oA7+UjjZfftu44u0g96V/Zrg2RpZqHUvTPPrF5wO2Ew=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=B2im0wv2+Y/q2wTUjf6gH2W71IxbWkjE0fU+FjZ/cNdnaGYB3J6jrZWp7iYTcVgr1
	 Nr4MRIDKlgOpux51TxnxqNSFXuUzkv4+u0IQ/jleU59Zj5Z/d1K2kAQ/DLxhd/+x/U
	 bg1BwuygV5QJ0Jv3ODjDNN1c1YDotSCYKAAGgp9iZV1tvzsY9eOJWO0rP7qh+Tcq1B
	 oYYuTUGs8lvvzxRWa3uZlrJuJ2Nniek4nTD0HjleCSmftO/XvVbjEK2CgJRz5qowGw
	 sSfeOj6+S2WpOv71zsACLvLy6c3EeTsUoYFelCZaX4IBQFvYDEp7GtTsKO1JncopjO
	 LcB8FH1Elowxg==
Received: from [100.115.7.114] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 21/C3-12986-0B416126;
 Wed, 23 Feb 2022 11:04:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSXemiFi
  Swf0TjBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8akjbNYC86xV6zd9ZStgfExWxcjJ4eQwGNG
  ibZF3l2MXED2eSaJt4smMUM4JxglOjY+YQepYhNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vASoQFbCXOPPjMCmKzCKhKrF62jRHE5hVwknj08ylYXEJAQWLKw/fMIDangLPEvaddrBBHOE
  n8b37NDFEvKHFy5hMWiPkSEgdfvGCG6FWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyF
  pX8DItIrRKqkoMz2jJDcxM0fX0MBA19DQVNdA18jQVC+xSjdRL7VUtzy1uETXUC+xvFgvtbhY
  r7gyNzknRS8vtWQTIzCEU4oZru9gnNj3U+8QoyQHk5Io7zUesSQhvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKErzOAkA5waLU9NSKtMwcYDzBpCU4eJREeBP4gNK8xQWJucWZ6RCpU4yKUuK8HEJACQ
  GQREZpHlwbLIYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmtQWZwpOZVwI3/RXQYiagxVO
  yhEAWlyQipKQamLLz8/561TrVdE8xszbg8QiJWP+u5Bm/967ImC9T3pamyFs4cmyatzX0b7Yc
  o3GVrrx68vRZaS7zLfRj2GJKP6056DZN7z9rpKNIjyiLY33mA6EPb4M/pOp0B3oFrTozV6lLZ
  fGHdIYbRktuS+vxV0humh/uweg+2zXtZ+2O7nv6MyL1d0Tb+Ru0cOrK6Hj+8Q54pygm9/Thmb
  qahAWvH4lWBARd3t7iXBAyM+f6oq8WJqfmh9RzOhjO3bTfs6pawXq/gPg7/4yD+Q1PF/9vKX9
  dufRey+OPHur+AZNTl67N//xL1OvGGf31oj+TpDr0PtzI8GlZ5LfBx7JzHaOjlqzjlyLvK7s3
  q/D1+SmxFGckGmoxFxUnAgCR1AGBXAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-591.messagelabs.com!1645614232!5510!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21870 invoked from network); 23 Feb 2022 11:03:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 11:03:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 90032100359
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 11:03:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8378810033B
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 11:03:52 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 11:03:28 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdrm: upgrade 2.4.109 -> 2.4.110
Date: Wed, 23 Feb 2022 19:03:12 +0800
Message-ID: <1645614192-28889-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645614192-28889-1-git-send-email-wangmy@fujitsu.com>
References: <1645614192-28889-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 11:04:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162253

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{libdrm_2.4.109.bb => libdrm_2.4.110.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.109.bb => libdrm_2.4.110.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.109.bb b/meta/recipes-graphics/drm/libdrm_2.4.110.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.109.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.110.bb
index fb5ddd82c0..dd775939a5 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.109.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.110.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "629352e08c1fe84862ca046598d8a08ce14d26ab25ee1f4704f993d074cb7f26"
+SRC_URI[sha256sum] = "eecee4c4b47ed6d6ce1a9be3d6d92102548ea35e442282216d47d05293cf9737"
 
 inherit meson pkgconfig manpages
 
-- 
2.25.1


