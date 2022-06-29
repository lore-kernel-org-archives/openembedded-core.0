Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B517C43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 03:27:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.7214.1656473213359128466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 20:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oIrMX7gy;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656473211; i=@fujitsu.com;
	bh=VOAEYOfatjKD/EsBHh+u7NMOAotXAj27Nn7IYj0eXTA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oIrMX7gyDKX9fyiU+Rxw2go6P7GHDlbyGqHv7fKqvRr7azoj7YLz8qFvNoaJLU563
	 NRsbMcicqGvwqPGhu3cI9xys78xd36AZPFRCEkkvOll0S/QSQMiwRG59DXllBK2h0f
	 +pDmISe9SChzu76l763k8Vyeb0d42pur1vW1P2vUtim01m0Dj3DNCkRf4w3nRUGGX1
	 2VhKtcP5YsS6G27Gqvz2eIX9XHpshNIHBKYqHrq3ax2MP84sSegq0uVsEDrU6+J+6G
	 j+1fHfyWvJJCBLGOI1uhDT/IFTXrXg+fKuuTYMvM06ExSqF6n45hvdM+S9yDELtrl3
	 4ByBuqYi2WffQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORpFt9bHe
  Swb5ePos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP+4quMBbN4Kx6v6mdvYLzK3cXIxSEk8IBR
  4urdDWwQzmUmifend7F3MXICOXsYJZ58SAax2QTUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7
  x6wcmEBJ4kpn66xgtgsAqoSXfPOMoHYvAKOEn+mNIDVSAgoSEx5+J4ZIi4ocXLmExaIORISB1
  +8YIaoUZSYfbmZBcKukJgxYxsbhK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNVUlFmekZJbmJmjq6
  hgYGuoaGprrGlroWRXmKVbqJeaqlueWpxiS6QW16sl1pcrFdcmZuck6KXl1qyiREYkinF6kE7
  GL+t+Kl3iFGSg0lJlNdx2u4kIb6k/JTKjMTijPii0pzU4kOMMhwcShK8kUeAcoJFqempFWmZO
  cD4gElLcPAoifAWgaR5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKiXOOwGkSACkKKM0D24ELF
  YvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm5T0MNIUnM68EbtMroCOYgI7wm7gD5IiSRIS
  UVANT7omZbY8XiEVusC092CGY41H5L5JzXk7OpSsfQkVN4l+0/b9+aT+vts9njVKHf9EFbz1b
  DY5FzuXyOKhgXZdp610dLBF8a9PLtC0axhvLBPy0Fd7cmO7n2Oq5RLGFy/nJgWMTc5Ncu2fd2
  FbDu/P9lIdH37g8LenbqRrwRW1tyq22Lxsf3XulkXiH+7e90pEq6yctZ406FSKmbKgu6bv99J
  dr5yO194xN3/ezynr/uHdQ94W4+tSlgj39at3TP6fPXa4lf+VPeY5NxK8qIR1P1qMm1YK7bt6
  MEdQu/fLo4dOJys3zQm0Fz665bGL2IWFzieWHZTcCXqc9uujlYDpdVDSSOfGauDhPicTBGxJK
  LMUZiYZazEXFiQB6BAp6UAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1656473211!73159!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28782 invoked from network); 29 Jun 2022 03:26:51 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Jun 2022 03:26:51 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E04C71B0
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:26:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D510A1AC
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:26:50 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 29 Jun 2022 04:26:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.22.4 -> 1.23.0
Date: Wed, 29 Jun 2022 11:26:37 +0800
Message-ID: <1656473198-4226-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 03:27:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167364

Changelog:
==========
The NumPy 1.23.0 release continues the ongoing work to improve the
handling and promotion of dtypes, increase the execution speed, clarify
the documentation, and expire old deprecations. The highlights are:

    Implementation of loadtxt in C, greatly improving its performance.
    Exposing DLPack at the Python level for easy data exchange.
    Changes to the promotion and comparisons of structured dtypes.
    Improvements to f2py.


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-numpy_1.22.4.bb => python3-numpy_1.23.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.22.4.bb => python3-numpy_1.23.0.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.22.4.bb b/meta/recipes-devtools/python/python3-numpy_1.23.0.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.22.4.bb
rename to meta/recipes-devtools/python/python3-numpy_1.23.0.bb
index 8ad3442413..5457b7d34b 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.22.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.23.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${S
            file://run-ptest \
            file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch \
            "
-SRC_URI[sha256sum] = "b4308198d0e41efaa108e57d69973398439c7299a9d551680cdd603cf6d20709"
+SRC_URI[sha256sum] = "bd3fa4fe2e38533d5336e1272fc4e765cabbbde144309ccee8675509d5cd7b05"
 
 UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1


