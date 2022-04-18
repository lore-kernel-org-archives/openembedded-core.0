Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7121C64EBC
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.38694.1650283889140701492
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jBKo7+B+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650283887; i=@fujitsu.com;
	bh=jr23cxMTGr0GUM5AYcIZTXiajWEdTDJa3LEV4wkUtcw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jBKo7+B+za6+bIZNNNQkI22a0accr4iszjIuX9YXKtVKey0HlPBouEXAq3Tm5jTYr
	 YMZJ8GrGNmBYSHmVoT+tINbL1B7fCUhoRr7EzTRO3OjCnR0ZKDa9xeS03I43CdaYWd
	 wrg/k9Cv7cUrozatQVK3d300YZGSwasgZak/VV62eP5p3F7h8+3RcKSH4gnli4w2Iz
	 NHQ1deLY91T2ZJFNB8qj1y/NYHnGye8OO2YQCykVuap4/ZOYho3PPnq1QwEbWeAH8W
	 MPdHBOJrv/8e+YkGn9nuxafTTII9/q06YUdRe/A2LSkaxiDkE0dG/s2pXfRgktPRAq
	 rzTLg8AuN1Ltw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8MxSTcvNDb
  JYMsVC4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWNZ61PWgl7uioU7L7A2MH7j7GLk4hASeMwo
  8X59NxOEc55J4lLzWUYIZw+jRPfKvSxdjJwcbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHid
  w87iC0sYC1x8P89MJtFQFWi/d4usFZeASeJH5ses4LYEgIKElMevmcGsTkFnCUO75sDViMEVL
  Po1CI2iHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYx2SUWZ6RkluYmZObqGBga6hoamumZmuoYWZnqJVbqJeqmlusmpeSVFiUBpvcTyYr3U
  4mK94src5JwUvbzUkk2MwGBOKXbatYPxYN9PvUOMkhxMSqK8/31jk4T4kvJTKjMSizPii0pzU
  osPMcpwcChJ8LYEAOUEi1LTUyvSMnOAkQWTluDgURLh5QgESvMWFyTmFmemQ6ROMSpKifM+CQ
  ZKCIAkMkrz4Npg0XyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvaAjQFJ7MvBK46a+AFjM
  BLd4+PxJkcUkiQkqqgemEQPZar+s7W3aWmMUbPH/BF3ObY91UmzCLE2am/M+CP7tcyan09Eiq
  qS/Ys6PUak6/yf6jMlF/Hk0/uf9/4ZmsH2GLHZNUhScf/TfbvMT10s41Ilu0et5yTThmu0ckW
  UbzvGWkk8V7gwkSBxoM7Lc2xUilB/odqlw9je3EjbPdYXyPHnB7eVg+eJcabtez5mbWoT8+F+
  7JmbO4RIsvl5k6q+qZx8tL6pNuJ/y3DYrbZqGU0+03pbRN4Hzx+mf22++ESqkVms8I/7GwLnx
  +RKPExav5zCuVZnz6FyTilnqs1Ka999zl9gePbi2Ji/r0SW1eypqzh6q2n/1qnJ10za+x1/zC
  2oUpj7bfEdtvcVqJpTgj0VCLuag4EQB1Bk7IYQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-545.messagelabs.com!1650283886!198387!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9027 invoked from network); 18 Apr 2022 12:11:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:11:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 74ABE10046C
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:11:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 682C3100359
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:11:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:11:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] enchant2: upgrade 2.3.2 -> 2.3.3
Date: Mon, 18 Apr 2022 20:10:53 +0800
Message-ID: <1650283855-16427-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650283855-16427-1-git-send-email-wangmy@fujitsu.com>
References: <1650283855-16427-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164587

Changelog:
==========
Update Nuspell provider, requiring Nuspell 5.1.0. The new provider takes
advantage of recently-added Nuspell APIs to be smaller and simpler.

Fix the C++ API is_added() method to return a boolean rather than void.

Require C99 and POSIX 2008, and as a result use fewer gnulib modules,
which gives a modest build time reduction.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.3.2.bb => enchant2_2.3.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.3.2.bb => enchant2_2.3.3.bb} (92%)

diff --git a/meta/recipes-support/enchant/enchant2_2.3.2.bb b/meta/recipes-support/enchant/enchant2_2.3.3.bb
similarity index 92%
rename from meta/recipes-support/enchant/enchant2_2.3.2.bb
rename to meta/recipes-support/enchant/enchant2_2.3.3.bb
index 101a42b59d..96d56c2ea4 100644
--- a/meta/recipes-support/enchant/enchant2_2.3.2.bb
+++ b/meta/recipes-support/enchant/enchant2_2.3.3.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "ce9ba47fd4d34031bd69445598a698a6611602b2b0e91d705e91a6f5099ead6e"
+SRC_URI[sha256sum] = "3da12103f11cf49c3cf2fd2ce3017575c5321a489e5b9bfa81dd91ec413f3891"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.25.1


