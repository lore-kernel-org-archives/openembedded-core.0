Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4991C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:06:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.4732.1665475588597831678
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xpoxGJVb;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665475586; i=@fujitsu.com;
	bh=ui8FbiFSFHadD7LpebYoCM05LvHvRSSrb0X25o2+5iY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xpoxGJVbOAKrorua6FQRdpPF5MHZve85T0qIJ7E3YvcbrqeVdAtOnA8qrusTfGGwI
	 wwmZWdwq9slmdOLmigDtqvncItAGVcaTDmOUZB4EET7WScZCDSr12YSz2d0XmJMEpc
	 a7M0jqkV/9YjebJZb+I002aury5aczdHQYLXQRbrCExKyW47zFaKYRoerNu+CKxxPR
	 ANvL4Vq8QfQJcukgD+TSgghKSLj3NdJzFw0rILgFqvaO4sdm4zMQto5fTHyjHwCZEs
	 cbn01W2ze5Lexu+zQr4qPlP0UPXe8ThI1H0ZO0RV8MmffktJO2Ish1OUcWy37HuLPa
	 qxAL2+dp2otYQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8ORqMuk4pp
  scGKjsMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvHkx1OmgttcFW9mvWVpYLzH2cXIySEk8JhR
  4mSPZxcjF5B9jUli+5ZLjBDOHkaJdx9WMYJUsQmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgIPEoTXvwWwWAVWJqVcuM4HYvAJOEo/P3QKLSwgoSEx5+J4ZxOYUcJZ40nOJBeIIJ4
  nNLeuZIeoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCT
  tCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhqa6hrqGuklVukm6qWW6panFpfoGuollhfrpRYX6xVX
  5ibnpOjlpZZsYgSGb0oxI9MOxmV9P/UOMUpyMCmJ8l597pIsxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYL3l5JrspBgUWp6akVaZg4wlmDSEhw8SiK8PVJAad7igsTc4sx0iNQpRmOOD4eu7GXmuH
  oFSAqx5OXnpUqJ8+YqA5UKgJRmlObBDYLF+CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrz
  KIFN4MvNK4Pa9AjqFCeiUk1edQE4pSURISTUwOd3/X8+45YTAMsl4icUd02oW7XyUVDy/rcSS
  c8o9fRc/D9VY09dRsn1tJn/EFA5PZRAL0cybPSsjPyPGRfZU/teMrK779o//Xtlxe9pNzVzeO
  B9+j3uBmr9WS7492P8m/t7Fue82R3MlTjsWsmHbZnOR5llpltqFG5ke3fydyW9y62Fo67Y7EX
  rNwrsv97SdCA5/N1mx1d1gpnDkp2W7A9cfObFSIdT1qNi/Zw99bmlvMBA+Y7N0V2CJhS13qLj
  z8z9zP87st+57zcCx/VL4kh2c27f2us5eL2Ns0rj4gHtb+zu5fJa9K73rb//d5hM0cbvOvx/p
  wqa7+ZniTx08/kwioqrqw8L3LOkT5BmjlViKMxINtZiLihMBF8oi1WwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-587.messagelabs.com!1665475586!290356!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13142 invoked from network); 11 Oct 2022 08:06:26 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:06:26 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E1471100191
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:06:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D542D10018D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:06:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:06:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libva-utils: upgrade 2.15.0 -> 2.16.0
Date: Tue, 11 Oct 2022 16:05:56 +0800
Message-ID: <1665475558-16409-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
References: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:06:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171602

Changelog:
===========
* trace: print the display being attempted
* ci: upgrade FreeBSD to 13.1
* meson: Search for threads in top-level meson.build
* meson: produce summary() when 0.53.0 is present

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libva/{libva-utils_2.15.0.bb => libva-utils_2.16.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libva/{libva-utils_2.15.0.bb => libva-utils_2.16.0.bb} (90%)

diff --git a/meta/recipes-graphics/libva/libva-utils_2.15.0.bb b/meta/recipes-graphics/libva/libva-utils_2.16.0.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.15.0.bb
rename to meta/recipes-graphics/libva/libva-utils_2.16.0.bb
index 4c46c386ec..cdf4d79dc1 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.15.0.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.16.0.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.15-branch;protocol=https"
-SRCREV = "be203c8b85b07e1f7a3faedd13057b0a8cabd3c3"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.16-branch;protocol=https"
+SRCREV = "cdf39e1e3da85a91ef53438c3b6a97e77dda96aa"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
-- 
2.25.1


