Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9595BC46467
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 02:46:34 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.4487.1650332724158494422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 18:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xy7DFQPf;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650332722; i=@fujitsu.com;
	bh=qzANtQvn3w3RaK/OVgq2lo3ygkkf+spGWZ3sXaWYaPA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=xy7DFQPft219u7m+ZVcUpfaryAgwRaAUVpRWvgIeyentmXTMtQVcSQe72YsdfRiZl
	 YGUkvR+IIZWoiWxXEs4+C8AGBSDIqvNdjYODKKEPhqDFykG1cCpC0e3AQXWJL6qq46
	 2kvDTJyJlfxJj/I1m1RvqFIaXATjl+nCUF1ya2LbrQZJ4/2+eV7FHdP0A1DKrL5x/o
	 eaX20FwOuVwUVPTykM5JH1lCRxO7S1Ei+nm7Vfh6EUcz+kMzwgIVN4Kx5CHW+4nwPL
	 FO5QKxFutvxNvheRYppTguU/HK//ieVtmE/7IboXyxh60c0pTzdBod1ZGAgKncGZuH
	 MOMYRlfftR3Xw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MRomsoEpd
  kcL1f1uLOz3fsDowe5zauYAxgjGLNzEvKr0hgzdi+7DJjwU+OisfbfzM2MC7n6GLk4hASmMUk
  MeXmTeYuRk4gZw+jxKyOKBCbTUBNYvqtG6xdjBwcIgJ6Elf/iYKEmQVUJF787mEHsYUFvCUuf
  HvDAmKzCKhKNH+dyQhi8wo4SWy7/RusRkJAQWLKw/fMIGM4BZwlFi3QgtjkJPH/cysrRLmgxM
  mZT1ggxktIHHzxghmiVVFi9uVmFgi7QmLWrDamCYz8s5C0zELSsoCRaRWjdVJRZnpGSW5iZo6
  uoYGBrqGhqa6xpa6RgYFeYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJJkZgQKYU
  q5/Ywfh05U+9Q4ySHExKoryPDsYmCfEl5adUZiQWZ8QXleakFh9ilOHgUJLglRaISxISLEpNT
  61Iy8wBRgdMWoKDR0mEd60gUJq3uCAxtzgzHSJ1ilFRSpx3hRBQQgAkkVGaB9cGi8hLjLJSwr
  yMDAwMQjwFqUW5mSWo8q8YxTkYlYR534GM58nMK4Gb/gpoMRPQ4uopsSCLSxIRUlINTDLfwv1
  tO9OX/L25ckfq86cB24yu/c2Y05rONk352her1itGLWaet36vv1W9Udu/5PmXZT16pifUy5+9
  P3tOyKq65guPwhTG0KecjzbcaDqvkWdnv+mG/Zutt/bpiCVdDkyRmP3b7us+3jNWi5wK1SQEn
  1z+LvLmjM2O+++e7lugcMZowa6+SbzzTD6mP2FcrFX5YecDmY8P248bTzN3Cbyklfx7X0qm/0
  e/7Lw3Zs1/nCfMn/zQPmi5YrQov53iOc41ZfJX28+pnpXx+7zQLyvgf8JDUc5E15uGagyfk7I
  uMOW8OXApsKS06eeE917phZxCNayr1x5geTyl0TmJ78sNhT2rq4zeXdBI3HhmyjwlluKMREMt
  5qLiRACqRbQhQwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1650332721!219973!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30007 invoked from network); 19 Apr 2022 01:45:21 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 01:45:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23J1jFiQ009699
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 02:45:21 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 02:45:18 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-sphinx-rtd-theme: upgrade 0.5.0 -> 1.0.0
Date: Tue, 19 Apr 2022 09:44:46 +0800
Message-ID: <1650332686-20457-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650332686-20457-1-git-send-email-wangmy@fujitsu.com>
References: <1650332686-20457-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 02:46:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164612

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...inx-rtd-theme_0.5.0.bb => python3-sphinx-rtd-theme_1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_0.5.0.bb => python3-sphinx-rtd-theme_1.0.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.0.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.0.0.bb
index fa375055a1..df34e11bb7 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_0.5.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_1.0.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "python3-sphinx"
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "22c795ba2832a169ca301cd0a083f7a434e09c538c70beb42782c073651b707d"
+SRC_URI[sha256sum] = "eec6d497e4c2195fa0e8b2016b337532b8a699a68bcb22a512870e16925c6a5c"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.25.1


