Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4F2C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 01:18:49 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.1364.1648516727983628352
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 18:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Q1RajGzq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648516725; i=@fujitsu.com;
	bh=xdaGSOACMgZWw5TKyXaOg1A351dQZGtXbc29hj+PWFc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Q1RajGzqK47ddO+gyVc5yFKmJEUARZrqUMGmfUHa4s4S5yFX8JS2lO0ZG342td2Xi
	 R5O+KgvhpL3O4P3FoBEsAUckVHlr7L3qF+VZmASIEHFlO5iIuvsrP+iiYsNp1KZCdB
	 vslm8KULvP1DeR1ZUPQnS/ReG5ayOlSh0+LAa/YyM0jiuDJygELZlvOX1CWf73ACw6
	 bREjAe5ZUjpbeKFtEie9KqrC3zjLaApl/19XcWqsVy29XIEUqTlmAHhTkKqeXbn3LF
	 SqzwHGAoHCtWRGb9RbWXLb6VCFIcKNQWO0f4Qj63zKJs0V998bZiLLqK2xx/WS0xg4
	 e/GVoEAX+9hvA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNIsWRWlGSWpSXmKPExsViZ8MxRbc0zin
  J4OUDfos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaNjrkTBY56K1ra1rA2MG7m7GLk4hARmMUlM
  XTGPEcLZwygxvWsOcxcjJwebgJrE9Fs3WLsYOThEBPQkrv4TBQkzC6hIvPjdww4SFhbwkFj1L
  QYkzCKgKjF39zewTl4BJ4mbE9ewg9gSAgoSUx6+h4oLSpyc+YQFYoyExMEXL5ghahQlZl9uZo
  GwKyRmzWpjmsDIOwtJyywkLQsYmVYx2iUVZaZnlOQmZuboGhoY6BoamuqamesampnpJVbpJuq
  lluomp+aVFCUCpfUSy4v1UouL9Yorc5NzUvTyUks2MQLDLKXYedkOxnd9P/UOMUpyMCmJ8l7Q
  dEoS4kvKT6nMSCzOiC8qzUktPsQow8GhJMH7JgYoJ1iUmp5akZaZAwx5mLQEB4+SCO+xUKA0b
  3FBYm5xZjpE6hSjopQ4r2wsUEIAJJFRmgfXBouzS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJ
  WEeS1BtvNk5pXATX8FtJgJaHHdY0eQxSWJCCmpBibVpMOcx6RuMZX4VBhPzI7+U2/3+PWMS96
  ZC83vu//m3Jw2W2Cr5I81J09un3zZW+S2s2Vnb1yX442ZzBefyT9of7rtxkyZ1GtRCXYKwmX8
  1peNVz3m1vjTm2OQKeyTf+X/xsvfpnbzBjK9YIo6krrQuTPi7v4erRZPce6Urjlrn52/ozlZy
  4g541udpGzTTIvsmuUJa56Ha26dumuT8/y1p0N2T2PbbjhBz3secw2rTcfqafGVR4vuVkwXiL
  gsMm+z0qedbNpFP8VeZ756x/Fk2jfXqb0fl/WcOrk4KUv/nz2r5OZdZeZ9W9hFnl4v7VI5M83
  fS67kqvH9/atPN1/pv9bGy7euMMI5xMTvxB4lluKMREMt5qLiRAAReTHeLgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-532.messagelabs.com!1648516724!4973!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1980 invoked from network); 29 Mar 2022 01:18:45 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-11.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Mar 2022 01:18:45 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22T1IdLj019831
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 02:18:44 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 29 Mar 2022 02:18:37 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest-runner: upgrade 5.3.1 -> 6.0.0
Date: Tue, 29 Mar 2022 09:18:24 +0800
Message-ID: <1648516704-21148-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 01:18:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163728

Add dependency python3-distutils.

Changelog:
=========
- #49: Dropped workaround for older setuptools versions.
- Require Python 3.7.
- #58: Fixed syntax issue in changelog.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pytest-runner_5.3.1.bb => python3-pytest-runner_6.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pytest-runner_5.3.1.bb => python3-pytest-runner_6.0.0.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb b/meta/recipes-devtools/python/python3-pytest-runner_6.0.0.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
rename to meta/recipes-devtools/python/python3-pytest-runner_6.0.0.bb
index 1020b2be26..f7a2c1bb95 100644
--- a/meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest-runner_6.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/pytest-runner/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "0fce5b8dc68760f353979d99fdd6b3ad46330b6b1837e2077a89ebcf204aac91"
+SRC_URI[sha256sum] = "b4d85362ed29b4c348678de797df438f0f0509497ddb8c647096c02a6d87b685"
 
 inherit pypi python_setuptools_build_meta
 
@@ -11,6 +11,6 @@ DEPENDS += " \
     ${PYTHON_PN}-setuptools-scm-native"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json \
-                  ${PYTHON_PN}-io"
+                  ${PYTHON_PN}-io ${PYTHON_PN}-distutils"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


