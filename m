Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6349DC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 03:25:21 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.7204.1656473113667713060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 20:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=TbTqWIFZ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656473111; i=@fujitsu.com;
	bh=w/Re0V/hhZPt9FCrqKabn7zk61FRuCW8QJ9aA9rL0Jw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=TbTqWIFZswciZ3wZc8eLkY2y00qUXqhkIN8U3tXT00WU6y0okQmWrMFKyaQjda+Nj
	 RsaDQ+u6iRGvCRab6VYfwWNtVLXSsRgwIKwFOHdZoag50fKoeJKfLKjU32xEvE+sIS
	 Z3zAiUlOkMa06Uew9kjAVS/ipQG9G0chLPNWfkLvYYeMNIBcZh2IngpO4skp+zxxK5
	 hiP3ucyfnjE9nG4Bms8v8G8vOcjGwuI2cHhbCsVHQl5aX9dPgLHACwmHwqdapX/LiN
	 ZzcunlPJoe8ranWQfGpcUAR6uYCtVvjIFNPWLEsrSRksyfro013F1lkh3PIU0voObg
	 hT4RCqJoSb37w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRWlGSWpSXmKPExsViZ8OxWVf82O4
  kg3+HOCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxDT+ayFBzlrZh35zl7A+NOni5GLg4hgQeM
  Evv3bWSEcC4xSez6cosVwtnDKHH1320gh5ODTUBNYvqtG0A2B4eIgB5QXBQkzCygIvHidw87i
  C0s4C+xdt5bRpASFgFViae3bEHCvAKOEnt2rmIEsSUEFCSmPHzPDFLCKeAk0dUgDhIWAipZfe
  s5E0S5oMTJmU9YIKZrSrRu/80OYctLNG+dzQwxRlFi9uVmFgi7QmLGjG1sELaaxNVzm5gnMAr
  NQjJqFpJRs5CMWsDIvIrRNqkoMz2jJDcxM0fX0MBA19DQFEgb6xoZmuklVukm6qWW6ublF5Vk
  6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEhn1KcfqNHYy79v3SO8QoycGkJMrrOG13khBfUn5KZ
  UZicUZ8UWlOavEhRhkODiUJ3sgjQDnBotT01Iq0zBxgDMKkJTh4lER4i0DSvMUFibnFmekQqV
  OMuhyb9nUdYBZiycvPS5US550AUiQAUpRRmgc3ApYOLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhT
  nYFQS5uU9DDSFJzOvBG7TK6AjmICO8Ju4A+SIkkSElFQDU9WNV7IuHXoRXlkWqc4v0v9nTHmm
  mVradShnou+qXtsPCRI7TtrWnRJ4xv7zVwn3hXgF4fmF8zIPlX5ZdttOtWcG49zyp+ffbFn1m
  y2p8ajFjtXy3Xc4HsV67i1uFDiQzV8fstJ+rpHo7bg/3tZ+bP5BUtbl6wsSzsxZp5m81H7i6c
  w3tSa1yevneR6tmeV6LMDn29JTbM/mHFz+IeWmePJ2mYzFl8qnf2fff3pT6czTBurnr3t7rNo
  R6ZT+5HxpUBjv5V5LFeZVe3lCf2YeOfZfbpeeufurkyoWuorLcrL+Pj6nq7Riu4fH0yS9zE0n
  Xdo/fe/yydr9cPrv1gWJ1tGzd7J7fDtXHnXaaeq2F0osxRmJhlrMRcWJAEDwJneCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-728.messagelabs.com!1656473110!134368!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14639 invoked from network); 29 Jun 2022 03:25:11 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Jun 2022 03:25:11 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8D34F14E
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:25:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8012175
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:25:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 29 Jun 2022 04:25:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-importlib-metadata: upgrade 4.11.4 ->
 4.12.0
Date: Wed, 29 Jun 2022 11:24:03 +0800
Message-ID: <1656473046-4187-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656473046-4187-1-git-send-email-wangmy@fujitsu.com>
References: <1656473046-4187-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 03:25:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167360

License-Update:
  Add text content of =E2=80=9Chttp://www.apache.org/licenses/LICENSE-2.0" to LICENSE

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
py-93259: Now raise ValueError when None or an empty string are passed to
Distribution.from_name (and other callers).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...etadata_4.11.4.bb =3D> python3-importlib-metadata_4.12.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.11.4.bb =3D> python3-importlib-metadata_4.12.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.11.4.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.11.4.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb
index 807a16d6db..c00e42cb1c 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.11.4.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb
@@ -1,14 +1,14 @@
 DESCRIPTION =3D "Read metadata from Python packages"
 HOMEPAGE =3D "https://pypi.org/project/importlib-metadata/"
 LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De88ae122f3925d8bde8319060f2ddb8e"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE =3D "importlib_metadata"
 UPSTREAM_CHECK_REGEX =3D "/importlib-metadata/(=3FP<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] =3D "5d26852efe48c0a32b0509ffbc583fda1a2266545a78d104a6f4aff3db17d700"
+SRC_URI[sha256sum] =3D "637245b8bab2b6502fcbc752cc4b7a6f6243bb02b31c5c26156ad103d3d45670"
 
 S =3D "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.25.1


