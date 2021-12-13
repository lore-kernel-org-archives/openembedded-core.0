Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5895C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:20:02 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.10980.1639401600538486911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nXBaGzIv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639401598; i=@fujitsu.com;
	bh=bWf7DBPO0oAAm6SAejL3GQ0kLJST0jkGmklxmIIXR/0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nXBaGzIvJvirR9UOKlTI0JzmXMzVKhVETLzolV0NdbkCHEg1Tql3D904zk42sJaTL
	 VDXqczaFTVA7og82VHPmCjj3MVxxRT+1kuswqncfbV8jpZu4uRahWKvHRSZfOP5ElX
	 S5NfQwWlAEBj1273mFkpGVckyAdW9ChTtslkFiaPQkfak2GvQCSblp/8zxWGA2eGIF
	 mnGLbJFeMNHhdLx7USrit3li9kxNvIe+eWReKcGuilSE56B4qKtBZQhmWV1UQwDF9/
	 4+o+bi+UYNFQg6u0/h14K6375jDduIgGj1pR2wd5qECajJvvnPwv2HSs5JFXg9Jw1u
	 upNj8pmJpipjg==
Received: from [100.115.66.58] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 CC/9B-24146-E7847B16; Mon, 13 Dec 2021 13:19:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqFvnsT3
  R4Nk/RYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaPryT2Wgr/cFTv+3WRqYLzG1cXIxSEk8JhR
  out7DxOEc55J4nHzIhYI5wSjxNGndxm7GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7
  x52kLCwgLXEnPMFIGEWAVWJx9e2soHYvAJOEju2PGEBsSUEFCSmPHzPDGJzCjhLPPl5gQnEFg
  Kq+fBxCyNEvaDEyZkQ9cwCEhIHX7xghuhVlJh9uRlqToXErFltTBC2msTVc5uYJzAKzkLSPgt
  J+wJGplWMtklFmekZJbmJmTm6hgYGuoaGprpmFkBKL7FKN1EvtVQ3OTWvpCgRKKuXWF6sl1pc
  rFdcmZuck6KXl1qyiREYyCnFLtw7GO/0/dQ7xCjJwaQkyhvMuj1RiC8pP6UyI7E4I76oNCe1+
  BCjDAeHkgTvb3OgnGBRanpqRVpmDjCqYNISHDxKIrzdjkBp3uKCxNzizHSI1ClGRSlxXkF3oI
  QASCKjNA+uDRbJlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8yaDjOfJzCuBm/4KaDET0GL
  Gys0gi0sSEVJSDUxz2LdJ1r+8KGZgmfTbaY7QhNey8z9lLNS0sbQyr+M+2LSe6aNj3UrZsrOT
  rxi8ULcpl/BvfGyx/kf/TaY6GaH2Mt+1hSZHMvWfslXyamX/3aGhXbjMcMvpA3/mMT3TfJnWl
  pZ/7Kf5ig85m1SurLo68f/Em10dyxz1ZjcZp05J3R2YeOZHc2fAobeZS7N8/CfXmPCYuh+/7V
  Q6J93+4e2zsTv72dMYJJ7a/b6RmfznfNKXbxeWTLjsuLZizfSGyK7C7wuNblTZCSYqTHm069H
  MZ48TuqLFJ81oFzugcLzytUrXkbWLXqkJcaZe0L+wZsnKOVqLnumV6f5nrzsZVP27fIrfgpA5
  /n+y710rUZNQYinOSDTUYi4qTgQAq0sLQ18DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-528.messagelabs.com!1639401598!37744!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10475 invoked from network); 13 Dec 2021 13:19:58 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 13:19:58 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 193D1100239
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:19:58 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E8B8D100252
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:19:57 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 13:19:51 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mpg123: upgrade 1.29.2 -> 1.29.3
Date: Mon, 13 Dec 2021 21:19:38 +0800
Message-ID: <1639401578-27830-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639401578-27830-1-git-send-email-wangmy@fujitsu.com>
References: <1639401578-27830-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:20:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159630

Changelog:
====================
libmpg123: Catch more NULL pointer arguments in LFS wrappers
(most prominently: mpg123_feedseek(), bug 328).

mpg123:
-Fix regression that did _not_ enable --remote-err on -s anymore.
-Fix typos in man page.
-Drop mixed-up value limits on remote control SEQ command.
 It is up to you if you want to distort your sound.
-Add note about equalizer frequency bands to man page.
-build: add BUILD_PROGRAMS option to ports/cmake

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mpg123/{mpg123_1.29.2.bb => mpg123_1.29.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.29.2.bb => mpg123_1.29.3.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.29.2.bb b/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.29.2.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb
index ba09e1c619..6e0dc1beff 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.29.2.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.29.3.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "9071214ebdfc1b6ed0c0a85d530010bbb8ebc044cfe5ae5930e83f7e6b7937e6"
+SRC_URI[sha256sum] = "963885d8cc77262f28b77187c7d189e32195e64244de2530b798ddf32183e847"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


