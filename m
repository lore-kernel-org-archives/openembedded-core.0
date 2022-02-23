Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442B8C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 07:45:25 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web08.4859.1645602323637996097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:45:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xbPunvZh;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645602322; i=@fujitsu.com;
	bh=LLhhRhcelrVIUdAlswMK2K2DXoWd2vcZAWMc5qyUsy4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xbPunvZhfMZ0hXgAkgpGC0o1Wccm7Brxfm9W0nS7WkULYn0QluUlfyuCSPZZdO+cT
	 tEpFIk5gS9oKi/IvMuFeur/8aP7e/UG1rGRKzErDhCQ8Mfe+bcTsj2zbf0QeoMC5z5
	 xUzkuagqIChfcM4wfVyhnVn9kz7ltMvUlTcpnqfBu+g4oPHpx0WhO6lN79Foe3TFWG
	 2F1wAV7qlWEul/XTzGkCdt+XI4QVOqLFHGrqO/FGrWrhWOuaqXqAO27tHjFs2+i9Wu
	 baBUWz1NJTeUCVPWBY0k/Zfs1vn/CsYYkTNVMA5jhUZEP/Yp9TKwDKunDCzeDKFg8N
	 NRfKS1Y3tn8hA==
Received: from [100.115.36.74] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id F3/67-14616-116E5126;
 Wed, 23 Feb 2022 07:45:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSVfwmWi
  SwYZ9ihZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aln9dYCp5yVnzaFtXA+Iyji5GLQ0jgMaPE
  m8azjBDOeSaJO8u3sUE4JxglDh/fCZTh5GATUJOYfusGaxcjB4eIgJ7E1X+iIGFmARWJF7972
  EHCwgLuEif/84OEWQRUJeZP28UIEuYVcJI4t5kJJCwhoCAx5eF7ZhCbU8BZYkv3YlYQWwioZP
  +dS2CLeAUEJU7OfMICMV1C4uCLF8wQvYoSsy83s0DYFRKzZrVBzVSTuHpuE/MERsFZSNpnIWl
  fwMi0itE6qSgzPaMkNzEzR9fQwEDX0NBU19hI19DCUi+xSjdRL7VUtzy1uETXSC+xvFgvtbhY
  r7gyNzknRS8vtWQTIzCAU4oV9u5gvLzyp94hRkkOJiVR3sIjoklCfEn5KZUZicUZ8UWlOanFh
  xhlODiUJHj7ngDlBItS01Mr0jJzgNEEk5bg4FES4RUBSfMWFyTmFmemQ6ROMSpKifN+vweUEA
  BJZJTmwbXBIvgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHe2IdAU3gy80rgpr8CWswEtHh
  KlhDI4pJEhJRUA1Nvq/n3pdvvad9fEfFe6sfXGdzeDle4z3w2E2iNShQ9FLU9rzkuxet2BN9/
  Fv2mg49ZJS7Nn7p6+VFd+yj+v2/+KUn9P+cfekF6rtqX9YsffJNcmqnz95IIvzrzHL+Gj8mnv
  Z8aXZeP4+3w6z9w73F2etYx1uVmF/9Pf7GlO9agI9KS01i8fafa5RXOFUW7dmjIFHxsf5tUv/
  HA/anlYol+Uc5WM6bfnN/v9eNDu+E/7oKfB0MfrQmQMP+xvFzY/1HwL7vUw34+djPWPA//tft
  8jZj93KlaP/7/S613us5+snzSD7b1D/aUcPDZdl87or4+oE9I8nXmcsNlbq2Tfd+xBR+eZn+R
  76HXycVclwuUWIozEg21mIuKEwE6JaBBWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-571.messagelabs.com!1645602321!34522!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23484 invoked from network); 23 Feb 2022 07:45:21 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 07:45:21 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 241CB10045A
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:45:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1601A100446
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 07:45:21 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 07:45:10 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.36.2 -> 6.37.2
Date: Wed, 23 Feb 2022 15:44:56 +0800
Message-ID: <1645602297-28300-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645602297-28300-1-git-send-email-wangmy@fujitsu.com>
References: <1645602297-28300-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 07:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162243

This patch fixes a bug in stateful testing, where returning a single value
wrapped in :func:'~hypothesis.stateful.multiple' would be printed such that
the assigned variable was a tuple rather than the single element

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.36.2.bb => python3-hypothesis_6.37.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.36.2.bb => python3-hypothesis_6.37.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.36.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.37.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.36.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.37.2.bb
index 8642fb55b9..4deed1e56f 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.36.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.37.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "7202ea05759f591adf6c1887edbd4d53c049821284f630c5ec8ec3f3f57fd46b"
+SRC_URI[sha256sum] = "79321035b9174ffa506d724ca5e8af375d7bf532c80e4f602bd433792c527e6c"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.25.1


