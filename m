Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB589C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 01:23:00 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web12.3520.1634174579978230621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 18:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FpRK2TFV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634174577; i=@fujitsu.com;
	bh=hhn1LMNLbnmcANQOR3JlmsnVKLRHvJqqp4CIZULjLAU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FpRK2TFVFB8LjJO4UvbebFd2r9jHt6VtYxOMHUmkf9xbs1BR26HJeCL6Cx1Dtw8Qk
	 RCangvYVr6cdwzT67dXBNlOufiA/V+joVk5orFuDgvBrUHWcV9myEqbUpgaUs+2WWh
	 6ZEFCYD20w+gnTcmapa6WqU/VXu9/GHr4ujNBr1+fr6//ZD5vdOAkb8dmn9yi0ccg4
	 n706OudZlRfvN9vIYA2wWNahw1y+POHJ/WeXrEQTtqUHUZNXIFF9H9+Pd0kNrmqqv8
	 HzAk9F2oQzH09kkwDu3nqfsmVaE+gPGIMtp9dWsPEHrFnJWYoN1JAgE9aiY31DQB8B
	 8lsicdmEJ2hBw==
Received: from [100.113.0.18] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id B8/1A-09980-17687616;
 Thu, 14 Oct 2021 01:22:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxSbewLT3
  R4Ot9Zos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPfZYOC7RwVR2bcZ25gfMjexcjFISTwmFFi
  57zDTBDOeSaJeU/vs0I4exglHuzoA8pwcrAJ6Eqce7wWqIWDQ0RAT+LqP1GQsLCAvUTXyzPMI
  DaLgKrEvalLwWxeAXeJI12XwWwJAQWJKQ/fQ8UFJU7OfMICYjMLSEgcfPGCGWSkhICixOzp8h
  DlFRKvD1+CalWTuHpuE/MERr5ZSLpnIelewMi0itEyqSgzPaMkNzEzR9fQwEDX0NBY11DXyMh
  ML7FKN1EvtVQ3OTWvpCgRKKuXWF6sV1yZm5yTopeXWrKJERh2KYWMj3Ywnn79Qe8QoyQHk5Io
  r3pReqIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV73FqCcYFFqempFWmYOMAZg0hIcPEoivN4ga
  d7igsTc4sx0iNQpRkUpcd6MVqCEAEgiozQPrg0Wd5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKcz
  AqCfPygUzhycwrgZv+CmgxE9DiwKgUkMUliQgpqQamaQk9Nns3Pbg3ZdWCEmX+hRvM+zbdC59
  8XPlYwRfZ1yYPjBhzePed9LWuXRfYNv/GYqm5RpVPpAp098coiW7jVWWae3uNlt37nbWaC8X5
  RbOdQ9OzZCcKOYXzfsv7f26bw2Y+rxWNX/4dmv90nefy8jmhfxyaODqv7GF8+yL435GinRu9N
  oa8u87w/VJeCfefCz1z2ZjuSKd1iiq6dV/wuMvZ2z592pfdkj9ursqW0msTLTd3kiqL6DrlxF
  Z+O+GMK2/0xLhj+779X5uzu7hmumm+i4ZKwooDj/oCeHfe5VafdGJKsfLKncdK3H6/V2/99vj
  uhklVa9aGpk3z3jvrjmfZ4QNPTK6vbCjuEtkhosRSnJFoqMVcVJwIAMIUck42AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-232.messagelabs.com!1634174576!2364938!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10653 invoked from network); 14 Oct 2021 01:22:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Oct 2021 01:22:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9762A1012CF
	for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 02:22:56 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8A6761012B8
	for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 02:22:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 14 Oct 2021 02:22:52 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-zipp: upgrade 3.5.0 -> 3.6.0
Date: Thu, 14 Oct 2021 18:22:44 +0800
Message-ID: <1634206964-7722-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 01:23:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156926

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-zipp_3.5.0.bb => python3-zipp_3.6.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.5.0.bb => python3-zipp_3.6.0.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.5.0.bb b/meta/recipes-devtools/python/python3-zipp_3.6.0.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-zipp_3.5.0.bb
rename to meta/recipes-devtools/python/python3-zipp_3.6.0.bb
index d6f4676542..c98bc7a3a4 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.5.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "f5812b1e007e48cff63449a5e9f4e7ebea716b4111f9c4f9a645f91d579bf0c4"
+SRC_URI[sha256sum] = "71c644c5369f4a6e07636f0aa966270449561fcea2e3d6747b8d23efaa9d7832"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.25.1


