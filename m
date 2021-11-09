Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E784AC433FE
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 12:09:41 +0000 (UTC)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web09.11102.1636459780850124097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 04:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=t7JB5L7W;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.84,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636459779; i=@fujitsu.com;
	bh=73+z4H+FvM6CTf0nuY5CZWo0d8RgIxfTucMVvr9bRIo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=t7JB5L7WJ3swRWkDuJ7pZUKWJE1KfddwS0t4FB8mEGJ+sH1qR8WD26z1d1ObIP8Qy
	 PxLzjUhcTA/iJONHnLrfaBl1ol+OZbbKJsm7uC6d2NiykVKJHOQMRXjY4UVHe20EKb
	 EuSmiumV9N26s9sajlMZUWhKoE+t6wH21seLoG5FOp8RZGyynPqIgiWnTfZm1NOkUg
	 PJqgKgsvx9tf3/flH/RXsGVGrHLBQBCdR0iTEqSKJiySLm35+oEu8kCSqNz0aHBcYF
	 LBrsQAfu6fH6p0XS82/pLUufjZjMCIHvuQCLe0Dx4y4ePm17j363/eiBQnKckGZBlG
	 jjrWOucmxHv5Q==
Received: from [100.112.196.47] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id B8/79-08711-2056A816;
 Tue, 09 Nov 2021 12:09:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSZcptSv
  R4MNhUYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePyjhlsBT3cFTvfdzE2MH7j7GLk4hASeMwo
  cXHSC3YI5zyTREPHNSjnOKPErsvn2boYOTnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAUmLC85tMICUsQPFrR4xBwrwCThKfThxjAbElBBQkpjx8zwxicwo4S2yddIcJxBYCql
  k/ZQULRL2gxMmZT1ggxktIHHzxghmiV1Fi9uVmqDkVErNmtTFB2GoSV89tYp7AKDgLSfssJO0
  LGJlWMZonFWWmZ5TkJmbm6BoaGOgaGhrpGlqa6ZqZ6CVW6SbppZbqlqcWl+ga6iWWF+sVV+Ym
  56To5aWWbGIEBm9KwRGHHYz3X3/QO8QoycGkJMp7WawrUYgvKT+lMiOxOCO+qDQntfgQowwHh
  5IEb18SUE6wKDU9tSItMwcYSTBpCQ4eJRFe42SgNG9xQWJucWY6ROoUo6KUOO9PkIQASCKjNA
  +uDRa9lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ865OBJrCk5lXAjf9FdBiJqDFB7+0gyw
  uSURISTUwLdrEXuVRv7TZ6kdUk0zSLK8dHKFNnyIcdV+erPqaotXqcOkwR2nujxQDsZkecTXP
  tu7Vvv+iJv1W8IIrtwXXCvtu//PkuUS130SvS88FPx2YzL9GN9XD9Fk7v8PfYvflS21u6D3J3
  NT/WPKXycrrWyZe0Dprs5uTO+LV/f/7tCoTLERuOU+p8HvmMsmmfU/D/C6TAz4X3wvFvmH75N
  Vc+uiH9Y4dued+FdzxXKEolmXy42GuYNa36UlxjJmyZ6t7/93KtEmVuHmc/wxjzj3/uddnveN
  L0nl9eWmN9WKreXf3vuFboWL9gWtqTL8Eq45nbZbispAUKWETVd+i70zW9Z0NbjrLdi7jORbF
  L5WqxFKckWioxVxUnAgAS0HtNVkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-285.messagelabs.com!1636459778!448807!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31665 invoked from network); 9 Nov 2021 12:09:38 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Nov 2021 12:09:38 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CF10710046E
	for <openembedded-core@lists.openembedded.org>;
 Tue,  9 Nov 2021 12:09:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C2F07100456
	for <openembedded-core@lists.openembedded.org>;
 Tue,  9 Nov 2021 12:09:37 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 9 Nov 2021 12:09:19 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] diffoscope: upgrade 189 -> 190
Date: Tue, 9 Nov 2021 20:09:04 +0800
Message-ID: <1636459745-60491-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636459745-60491-1-git-send-email-wangmy@fujitsu.com>
References: <1636459745-60491-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 12:09:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158016

Changelog:
[Chris Lamb]
Don't raise a traceback if we cannot de-marshal Python bytecode to support
Python 3.7 loading newer .pyc files.
(Closes: reproducible-builds/diffoscope#284)
Fix Python tests under Python 3.7 with file 5.39+.

[Vagrant Cascadian]
Skip Python bytecode testing when "file" is older than 5.39.

[Roland Clobus]
Detect whether the GNU_BUILD_ID field has been modified.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_189.bb => diffoscope_190.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_189.bb => diffoscope_190.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_189.bb b/meta/recipes-support/diffoscope/diffoscope_190.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_189.bb
rename to meta/recipes-support/diffoscope/diffoscope_190.bb
index d3c70b47c5..8303ee4693 100644
--- a/meta/recipes-support/diffoscope/diffoscope_189.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_190.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2ec8d94af13e905ec1a905ebfb2654971cf977b149d296f8bf2aeff6bcab3d8a"
+SRC_URI[sha256sum] = "29e3c5ce764b494771876aef3f587ed4867374a0f4e28afe39d4f0640ddb7744"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.25.1


