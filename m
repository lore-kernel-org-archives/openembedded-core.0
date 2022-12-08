Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17D1C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:09:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.6947.1670479739679723882
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=G7zcdS/n;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479740; i=@fujitsu.com;
	bh=Nt+RU4bpqm2l3ytTl5FeiU5yJDeCC4TlWnGTG6Giiy4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=G7zcdS/nLJDsF7zxeMp/qa9rKUuvCFeLR2EMiIN10je/JgEZrUgsXrT2cWJRaF/26
	 GyU9JQDtcBMtU/Jr2r1cl0U+LpoWvsaT7rJiY77E1Z4g8RRq9VEn+cLYrHceYW3285
	 7szR7d0hUHoboQN00H1NjO66afX8kHnqnTm+cXboJY34oFDA9pyM9CmmQ6K9EB+XfK
	 r2lGJQmTZ6nsKnHpIaHCnEt7xKSfwnUEvfh2w7/UtSL1VrAyhSl2S08/9rDE4THGKJ
	 kLWF/K5Bw0TqPl9/ZRGiyDXBX6bIE4suZYqNSXcMT9eHpn/Mv8ljYhnaaPaiJ/HxeP
	 SL9zv81/GZfRA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8MxSbe6fmK
  ywckbBhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bLdR3MBU85Kg7ufMzYwNjD0cXIxSEk8JhR
  4sX0G8xdjJxAzjUmiVcLHSASuxklTrxqZgJJsAlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgJfE/69HWEBsFqD41/2TGEFsXgFHies/HoGNkRBQkJjy8D3YLk4BJ4mDd+czQex1lN
  h+ZS8TRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLWrDaomWoSV89tYp7AKDgLSfssJO0
  LGJlWMZoVpxaVpRbpmuslFWWmZ5TkJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibn
  pOjlpZZsYgSGbkpxws8djBuX/dE7xCjJwaQkyvuiuj9ZiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvhcqJyUKCRanpqRVpmTnAOIJJS3DwKInw+tYCpXmLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5
  cqJc5rUgdUJABSlFGaBzcCFtOXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnz1oFM4cnMK4H
  b9AroCCagI+797wU5oiQRISXVwLSWKeeNr3/rF52JYvv/H7i7K3zr0YZ0YZGPh416DDP5t7u0
  HOHrs4o+65G9wOTa8cjw27/sqv2uzfrAJP8wa8MKRxt1pj1ZOddXv6zdoxsut+XB+fK5/h/PM
  9iu8ZTyKbcIEeMtY5u9ZdKqNbG/Xr0LOx3SMOdfuqJt2DG7rokrVfRv6y1wbTgyXedHoNnJiP
  rC/X2irfuEMx2WXOjQnG/N+65nzoMt7DtbztS9ntF34YbwbeN1mziZtsl93mN2d7mRCv/22i/
  P7uVJf/XSEouYfdKtNm9mZrGv+E0H5s12IS/lf5fFcJmfY2Z/OffR/dcGOl8lz/VnF9WoPy3R
  ZZ8SoXaIcWXq8+aWJaqN6UosxRmJhlrMRcWJAEnRwyNkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-728.messagelabs.com!1670479739!137409!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5262 invoked from network); 8 Dec 2022 06:08:59 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:08:59 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 447361000DB
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:08:59 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 367831000EE
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:08:59 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:08:57 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 5.31.1 -> 5.31.2
Date: Thu, 8 Dec 2022 14:08:15 +0800
Message-ID: <1670479695-1183-5-git-send-email-wangmy@fujitsu.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174376

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_5.31.1.bb => python3-web3_5.31.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_5.31.1.bb => python3-web3_5.31.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_5.31.1.bb b/meta-python/recipes-devtools/python/python3-web3_5.31.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_5.31.1.bb
rename to meta-python/recipes-devtools/python/python3-web3_5.31.2.bb
index 587d34f00..486cf08b8 100644
--- a/meta-python/recipes-devtools/python/python3-web3_5.31.1.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_5.31.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "74732fbd4b2e2baff9d0ac61f268b3e7b25b09ca6572d619390a9d782c2289f2"
+SRC_URI[sha256sum] = "fc27ef2acacb9375e1d486ce7b0f4188c5e543d65f7bb8692f8b969f408bfa9b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


