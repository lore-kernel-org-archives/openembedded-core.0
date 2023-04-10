Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7B8C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:56:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.40567.1681117014648786038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tS6cvCiW;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117012; i=@fujitsu.com;
	bh=C8VY5CtiAoYnavr4INJHFuvNNVJ4MKXl4sLu2rcVwj8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tS6cvCiWJ9CuRElJE1AqnPxE27pqBmFdqyb88gemkerkNAZJFxHH/qYrDFft9WxQ/
	 uf9/9IYR4lL3lEUfnJI4kjf5gh2dbiEeyd7t7ugyWpbymBCohqeKDIBQDBcRv9RB6L
	 Rek4+hR9cn9u9INXCkUPCCkP55bY56K6YtuXNYmN4E9tvEjMxZBZ7xDC2aZ1jvCA/D
	 syCv1/bNhnkoF0411aKcIC4No0STU+luVPct3x9oyahSVvRuR0Ot24q0f7bdB5ybNf
	 kA6sdI4CRsi6KxxY3QH3JT4M60mLNAA2qOnzECg1tdiBbsxoPBO57Lb9EcQfpRWNrB
	 lZipk4bCGb3ZQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8ORpBt83jj
  FoOmytsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjFzwmnGgnl8FdfmPWFpYFzA08XIySEk8IBR
  4tu9tC5GLiD7MpNEw51+NghnD6NEw/rpTCBVbAJSEjfu/wdKcHCICOhJXP0nChJmFlCRePG7h
  x0kLCxgJtH2qAwkzCKgKvFw52mwTl4BJ4ljD8+zg9gSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy
  +YIWoUJWZfbmaBsCskGqcfYoKw1SSuntvEPIGRfxaS9llI2hcwMq1iNCtOLSpLLdK10Esqykz
  PKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAzElOLkHzsYd/X9
  1TvEKMnBpCTK28VlnCLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtfgLFBOsCg1PbUiLTMHGBUwa
  QkOHiUR3opjQGne4oLE3OLMdIjUKUZdjm2f9+1lFmLJy89LlRLnlTwHVCQAUpRRmgc3Ahahlx
  hlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8247DDSFJzOvBG7TK6AjmICO4HIxADmiJBEhJdX
  AtFH75V2tHy1ZtoJ2vG/MPZ/pagV/mR7mZ1liXtT6pG3R/pi1xzSmTpl4qSJxBZuiiuUzpR2F
  bfY+3zI+skb7Rm3W1r3UEbm8Jke8kLFFtTtt2Y5sW3uTMzNb59Qu1/M4ZBJettZx6zup4PLlK
  9Y5hUy43TD5opPj60XadiW1Ibt4XnckXKq6uX2hsRJHaI2Q4cRraUdP2/Rsq+I+nVFWc6K8Ma
  1iZ51O9jqLeU+2rZr+sonP/+V8ZR+vuPZ5ckIiyVZT28vn/Wp6/IhP/AHHixCfC6zNUwrnW+k
  1cfJJnOqY8q6P55fxKrvwOsUpoaZW/ocFJGqWV/sw5IiHbny2ZGdcDp+wOkdN2ncvbSWW4oxE
  Qy3mouJEAI9PNkNLAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-745.messagelabs.com!1681117011!190894!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1381 invoked from network); 10 Apr 2023 08:56:51 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-24.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:56:51 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 314161C7
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:56:51 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 260201C8
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:56:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:56:49 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] apr: upgrade 1.7.2 -> 1.7.3
Date: Mon, 10 Apr 2023 16:56:33 +0800
Message-ID: <1681116997-24685-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179843

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  *) apr-1-config: Fix crosscompiling detection in apr-1-config. PR 66510
  *) configure: Add --enable-sysv-shm to use SysV shared memory (shmget) if
     available.
  *) apr_socket_sendfile: Use WSAIoctl() to get TransmitFile function
     pointer on Windows.
  *) apr_dir_read: Do not request short file names on Windows 7
     and later.
  *) apr_file_gets: Optimize for buffered files on Windows.
  *) Fix a deadlock when writing to locked files opened with APR_FOPEN_APPEND
     on Windows. PR 50058.
  *) Don't seek to the end when opening files with APR_FOPEN_APPEND on Windows.
  *) apr_file_write: Optimize large writes to buffered files on Windows.
  *) apr_file_write: Optimize large reads from buffered files on Windows.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/apr/{apr_1.7.2.bb => apr_1.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/apr/{apr_1.7.2.bb => apr_1.7.3.bb} (98%)

diff --git a/meta/recipes-support/apr/apr_1.7.2.bb b/meta/recipes-support/apr/apr_1.7.3.bb
similarity index 98%
rename from meta/recipes-support/apr/apr_1.7.2.bb
rename to meta/recipes-support/apr/apr_1.7.3.bb
index c9059c9921..9a93fe0967 100644
--- a/meta/recipes-support/apr/apr_1.7.2.bb
+++ b/meta/recipes-support/apr/apr_1.7.3.bb
@@ -24,7 +24,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0001-configure-Remove-runtime-test-for-mmap-that-can-map-.patch \
            "
 
-SRC_URI[sha256sum] = "75e77cc86776c030c0a5c408dfbd0bf2a0b75eed5351e52d5439fa1e5509a43e"
+SRC_URI[sha256sum] = "455e218c060c474f2c834816873f6ed69c0cf0e4cfee54282cc93e8e989ee59e"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest multilib_script
 
-- 
2.34.1


