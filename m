Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9921C6370A
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:09:02 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.6879.1670479736502556027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=r91cRRif;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479734; i=@fujitsu.com;
	bh=/CnCnAMiZofYjj7kKYf9QU0fMiUt2MQD+uGQ3/VKJog=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=r91cRRifk5MrKDtZjAxYwRKtAMQNgWOYBiFsGz+wov37a4L8WpkPg/+yPeWOUdTR9
	 TOUfJ9pEjJMgxV4Pw7lJx+qo/pJLlfqxrvOef7WcJcmzA0lbRaJcAuEaY7aBkAWYWz
	 lC6vRXl9AOionBUOqtF+clQPbw8sYD5649CtXy4gjP2s0GVm9/TzTblUgYEUGOe4at
	 i6da7wz2qZSqDyu4kL1LQhQYpmUZLaQsbpQqtotevCN3DeGulIUsvYP8zlOcByEXfw
	 vPyI/chPbkfhtNpKKRsstQdHQ3YtL2Y6x42aIL/4sauqXgAk4ssNDL5U6Eloe8vyoi
	 oVHhhq67QfFtQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8OxWbe0fmK
  ywf2f1hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bLztssBU84K7ZsmcDawPiPo4uRi0NI4AGj
  xL/WP+wQzmUmiXWf7rBCOLsZJU7ffcTWxcjJwSYgJXHj/n8gm4NDREBP4uo/UZAws4CKxIvfP
  ewgtrCAp0Tz8jMsIDYLUHzh5cWMIDavgKPE5wnNzCC2hICCxJSH78FsTgEniYN35zOB2EJANd
  uv7GWCqBeUODnzCQvEfAmJgy9eQPUqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFqcWlSWWqRrqZdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGLopxWy/dzCeX/ZH7xCjJAeTkijvi+r+ZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  BcqJyYLCRalpqdWpGXmAOMIJi3BwaMkwutbC5TmLS5IzC3OTIdInWK05Jg6+99+Zo7lYHLm17
  YDzEIsefl5qVLivLtBGgRAGjJK8+DGwWL9EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXo4
  6oCk8mXklcFtfAR3EBHTQvf+9IAeVJCKkpBqY1r7hN5vGIP7knuR539gPBffvTLp/6Yrgxtlm
  qyZonZgU+6riREOKk+eHB1sczm9iNIi1/Zl36ru5gNbaSZfK67x/iGgzFiRcq1PbcC/lHvO9t
  oUuR/n2bj3P83zf1i8Ts2NKOE6x7Hs+1fyz+mSH8Mj0kOVhVt+1HcKEgnRO/vos5J4vcbLCt+
  ZnScrixVcPuk3K/Xlg6qr7gdolP0pMzDN6/ilkRlxPN5j7jefvCpHk2Zml63mTp6Z+tzx/+J/
  3AfbXCVwe4sG8blMsrnHP36ffbn/9fm+uA9djWyvVtenrFS73iT39s9SUZ/+ThRsuH58mun99
  uHPqZG+G4Cfyl4RYFBy9+/ayfu4Mvf78lBJLcUaioRZzUXEiAN8bRrNwAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-587.messagelabs.com!1670479733!9558!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22916 invoked from network); 8 Dec 2022 06:08:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:08:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 99648156
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:08:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8D57D154
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:08:53 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:08:51 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-twine: upgrade 4.0.1 -> 4.0.2
Date: Thu, 8 Dec 2022 14:08:13 +0800
Message-ID: <1670479695-1183-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670479695-1183-1-git-send-email-wangmy@fujitsu.com>
References: <1670479695-1183-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 06:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174374

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Remove deprecated function to fix twine check with pkginfo 1.9.0. (#941)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-twine_4.0.1.bb => python3-twine_4.0.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_4.0.1.bb => python3-twine_4.0.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_4.0.1.bb b/meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-twine_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
index 0178dde73..161b4b221 100644
--- a/meta-python/recipes-devtools/python/python3-twine_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "96b1cf12f7ae611a4a40b6ae8e9570215daff0611828f5fe1f37a16255ab24a0"
+SRC_URI[sha256sum] = "9e102ef5fdd5a20661eb88fad46338806c3bd32cf1db729603fe3697b1bc83c8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


