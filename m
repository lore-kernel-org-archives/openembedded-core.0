Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A9FC433EF
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 15:03:09 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web10.23422.1636988588392821706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 07:03:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tSLJ+Lhj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636988585; i=@fujitsu.com;
	bh=jSUL6WwKpbK3CLeA4Ps5HqbZXI7uE7P3icySkbh8wgA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tSLJ+Lhjq16sweRB6QaDCjQERsX3XiEwQKu25jwygtUR/Rjrmgll1piWKS9qUULtP
	 y61rked3KFl+WC19yaSOWOomKCI7IAjMkjj1/6BnDHORQj09r4yySlZMcdnuD9NOSb
	 8XGjtgSgbbhbbU/aP6COJCW4/ScN/y4ssopjOO5EWqc4yPuvVwQlh6IQtFy3C3hl1k
	 LdBz4f+1rdVwjqLSOOUxMZCwYYQSRkLcH1bqcYfIUFL3njExKQPsMzQN0heh1WxBKV
	 ZMnUvSP+x+QwWSXLIYP9aWQq8tWUfdCxbO41kCgfIRX+vHI6fbcM06+dTcEap0ZqIP
	 8+WOJ3Y3KhgRg==
Received: from [100.112.198.7] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 43/A3-08711-9A672916;
 Mon, 15 Nov 2021 15:03:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqLuybFK
  iQdcqYYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP9qtcsBefYK2beOsDawPiYrYuRi0NI4DGj
  xMKeC0wQznkmiQ07e9ghnBOMEhem/mXsYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  0HqOTmEBWwlHlzpZQOxWQRUJS6tX8gEYvMKOEncnr6VGcSWEFCQmPLwPZjNKeAs8W3SexYQWw
  io5sO0LVD1ghInZz5hgZgvIXHwxQuoXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdA0tzXSNTE31Eqt0k/RSS3XLU4tLdA31EsuL9Yor
  c5NzUvTyUks2MQIDOKXgyP8djMvffNA7xCjJwaQkyvtHf1KiEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQne3aVAOcGi1PTUirTMHGA0waQlOHiURHgNioHSvMUFibnFmekQqVOMilLivNNA+gRAEh
  mleXBtsAi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYNwBkPE9mXgnc9FdAi5mAFtvf6wd
  ZXJKIkJJqYGpg/enr/PjXxiXCrrw/V/0PX3dpIvuX7dNzfpVrr11hlZBen3y5YNP1vbknBRLO
  Wd15d33C5gl2ksF7M1NN1d0eXolVMlbTkbVf/Cl/Vcf/8/9OG685f2nSVDPD+8ZVDvn/f0mb8
  +5Y6xnFtGelZr3pxw/sOqoTdycvVUnZuyyE583xe5Gd11ddSJwzd9L2TTvOOi+ODJ3feMte5p
  3HQVnB8EVmuc/4g67UxT9lyBOX5pXpqLRh+6ttX2Z2/eEj7ve6LHfOckdabG7UdtxcmONSWdB
  8aMLSEIGzcy90Bjqt+qbr+PXfAxmfHdJqeau/bbjKKGJ719W1LUf2plx6sbL5BBO1m+kz/T9K
  nGzdqaPEUpyRaKjFXFScCAAv9WTUWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-291.messagelabs.com!1636988585!416955!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14753 invoked from network); 15 Nov 2021 15:03:05 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Nov 2021 15:03:05 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D3204100237
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:03:04 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C5F55100228
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:03:04 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 15 Nov 2021 15:02:52 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdrm: upgrade 2.4.107 -> 2.4.108
Date: Mon, 15 Nov 2021 23:02:34 +0800
Message-ID: <1636988556-78653-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636988556-78653-1-git-send-email-wangmy@fujitsu.com>
References: <1636988556-78653-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 15:03:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158297

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{libdrm_2.4.107.bb => libdrm_2.4.108.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.107.bb => libdrm_2.4.108.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.107.bb b/meta/recipes-graphics/drm/libdrm_2.4.108.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.107.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.108.bb
index b645898481..66b2c9f54f 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.107.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.108.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "c554cef03b033636a975543eab363cc19081cb464595d3da1ec129f87370f888"
+SRC_URI[sha256sum] = "a1d7948cbc536763fde14b4beb5e4da7867607966d4cf46301087e8b8fe3d6a0"
 
 inherit meson pkgconfig manpages
 
-- 
2.25.1


