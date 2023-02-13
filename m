Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C7FC05027
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 02:42:24 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.5737.1676256137978680704
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 18:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TUonYl7d;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676256136; i=@fujitsu.com;
	bh=Vafs4svzcx7+Kk196UIa9Jv/5MGFG32mnUhHicbgr8I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TUonYl7dG9UoclReG5paAD1TedBq0zZTSINaJtTQ8q7xnZ2Z5Ly9DXLLTmgGqzcGk
	 S1L+kdAn1tw6uporGuHKBZ9AUQo9OqMUXAEsqF592XdBSso0MdvLCy4cuU83kyAyco
	 PEzRnNLIw9bt6fPc1FT1ZPvIyva4nZ1FqBd88Jw+Pg6A4wGq8Befny+NNyB8ZaqPIM
	 gUj2CsfXq7ul7+EF1irm3I+59/DpO36KnurlM+mNGjiFl0KK1Wcc8SCyXczyc5vJiM
	 NCzmIG+xRn8a3cnAs1EuYgyv0/vDOVFlZFNJtgU54xUocrQv/nspduusN/mYawlFd6
	 31ZRcmvxoru6A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8OxWbdt8ct
  kgznzlSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1ozFH+axF3RwVszuusrYwLiSo4uRi0NI4D6j
  xIbfi1ghnMtMEh3fn7FAOHsZJS6sus3UxcjJwSYgJXHj/n+2LkYODhEBPYmr/0RBwswCKhIvf
  vewg4SFBWwlni4Eq2YRUJU49vciI4jNK+Ak0fd2EjuILSGgIDHl4XtmiLigxMmZT1ggxkhIHH
  zxghmiRlFi9uVmFgi7UqL1wy8oW03i6rlNzBMY+WchaZ+FpH0BI9MqRrPi1KKy1CJdc72kosz
  0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OScFL281JJNjMBQTClO5dzBuLLv
  r94hRkkOJiVR3j6Ol8lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHilFgDlBItS01Mr0jJzgHEBk
  5bg4FES4bWYAJTmLS5IzC3OTIdInWLU5VjbcGAvsxBLXn5eqpQ4L/9CoCIBkKKM0jy4EbAYvc
  QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmHf3LKApPJl5JXCbXgEdwQR0xGM+sCNKEhFSUg1
  Mksb6pbavFycGTV15KML9PPPaSaeYistZz39dWtJ0cf7Up58D3Hm3M683Ldf3keVyteI7qKS9
  9UTc5c/9Pm/Ufq/0FHzgtNjkYcHe3+IcLy9vCuy7s6FNavu0N3/ZD2Y/6fNf0/HYU+vSpphJn
  z2USy7si7mb3HLgqjvj8rLc+DLdCNc/y2IUY314TV9tsG110ZRerK5Z1ci+OqPPoWZ/8SPP/M
  VW1pv6Qn+otGwTY5goIrzN6HR+eafuBk3nW0o/3ts/cZq/v/RK6pfIlQ9Zo2IeNjAFrbdbq3k
  hrN+Ra3tVzp1dvzscgxNe7WHZFqtxq1Pi9/1D/sUu99YH1pje5Vh+6wvHXdaXee5PPjIqsRRn
  JBpqMRcVJwIA9Cnff0wDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-732.messagelabs.com!1676256134!738234!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26719 invoked from network); 13 Feb 2023 02:42:14 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Feb 2023 02:42:14 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 0776B7B
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:42:14 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EFC6B73
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:42:13 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 13 Feb 2023 02:42:12 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xwayland: upgrade 22.1.7 -> 22.1.8
Date: Mon, 13 Feb 2023 10:42:01 +0800
Message-ID: <1676256123-19590-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177081

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xwayland/{xwayland_22.1.7.bb => xwayland_22.1.8.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.7.bb => xwayland_22.1.8.bb} (95%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.7.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
similarity index 95%
rename from meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
rename to meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index dd32bd0111..6919ba421b 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.7.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d53afac6c71953f5cf66d03d289dacd8961da5bd309c1dff125d5955d9db5f76"
+SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 
-- 
2.34.1


