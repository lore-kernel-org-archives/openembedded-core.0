Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F99C4332F
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 06:23:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.33539.1653891808460596298
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 23:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U9mpGHkj;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653891806; i=@fujitsu.com;
	bh=wBZ48eNzeYjroojlYA85hbPXWzkwCibzyQlHjrj5r/g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=U9mpGHkjKB2PaoW7bX3x4Wn3kmVfYfuFfhY5kGBe3tlpUCByrVqraWVGu3f+IKJb1
	 DKDBFK2booRsTNv+ZGfzF4LEOH6Jaqkd1TEm6RDC/0fKr5Qevqi2NbhOE/geFrTZsH
	 welPddmWnb10Lq8E1nx8QrNN8IUFLwvPCtMH6v8FfB92CvfTYHuQTFsbpGKh6/hHg1
	 XFT7JOEaASpkL4FkN/vf7XtGmFtVi4oIvWT2LY60qsECQaCTXCDsv975q8ptedNKpY
	 5VlgAQFQVcysqPyS2wC0AZat+5DzQ0mMYmr6X3oiOcWolr0GDselmvAHvZIssmNUq/
	 GeJjTgROOmkWw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqHsvaUq
  SwZOLvBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a+jhWsBYu4KuZPmsDWwLiFs4uRi0NI4DGj
  xIS9b1ggnPNMEq+O/YZy9jBKXHrzjb2LkZODTUBNYvqtG6xdjBwcIgJ6Elf/iYKEmQVUJF787
  gErERbwkmg9/JERpIRFQFVi8ywPkDCvgJPEu4PL2UBsCQEFiSkP3zODlHAKOEs8+Z4OEhYCKt
  nU1MQIUS4ocXLmExaI6RISB1+8YIZoVZSYfbmZBcKukJgxYxvUSDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGK2SijLTM0pyEzNzdA0NDHQNDU11jS11LYz0Eqt0E/VSS3XLU4tLdIHc8mK91OJiveLK
  3OScFL281JJNjMAATilWD9rB+G3FT71DjJIcTEqivGdVJycJ8SXlp1RmJBZnxBeV5qQWH2KU4
  eBQkuD1jJ+SJCRYlJqeWpGWmQOMJpi0BAePkgjvkgSgNG9xQWJucWY6ROoUo6KUOO/5RKCEAE
  giozQPrg0WwZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfPeAZnCk5lXAjf9FdBiJqDF3Ew
  TQRaXJCKkpBqY8hZfX+gZb3ptwwKdJpZvPWyNBv3ZjRtX8f444S/x1vXfLj6b24La+fXT6hcz
  yMb6x2mfdo7U04tMSO96rsx9y9hxYfcfmWKjS6dPJk3wLX6xq+Tkz84Tz5Itz6mFzTCsXst7Y
  cOFPg2rc3PZ18wqdTRe9oXTqUiu3/vnQ8Fs/ShZvfnPTosYX6ptOrYkgMtrwbesY81KzDcT+N
  i5jf+ffuH1LrT0/Ebh2w6Xz/eelUxUnqOysLHueu26Z1rOWpfTPYLM/vJdKt2WIVX4eL2Uu27
  1/bAlhSnPFr8IWnFo9rnnbtyMAgeLO1QXcjtHLM1MyDIO1stVWZAo039Jlakv8LTesry45BNd
  a/pndSuxFGckGmoxFxUnAgAwjxKXWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1653891806!111241!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9497 invoked from network); 30 May 2022 06:23:26 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 06:23:26 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C0C30100194
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:23:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A8D0C100190
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:23:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 07:23:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest-subtests: upgrade 0.7.0 -> 0.8.0
Date: Mon, 30 May 2022 14:22:53 +0800
Message-ID: <1653891773-23292-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653891773-23292-1-git-send-email-wangmy@fujitsu.com>
References: <1653891773-23292-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 06:23:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166260

Changelog:
=========
Now passing subtests are shown in the test run summary at the end
(for example: 10 failed, 1 passed, 10 subtests passed in 0.10s) 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ytest-subtests_0.7.0.bb => python3-pytest-subtests_0.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-subtests_0.7.0.bb => python3-pytest-subtests_0.8.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb
rename to meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb
index 060a6ff6cf..b092912b32 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.7.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.8.0.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://github.com/pytest-dev/pytest-subtests/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=242b4e17fa287dcf7aef372f6bc3dcb1"
 
-SRC_URI[sha256sum] = "95c44c77e3fbede9848bb88ca90b384815fcba8090ef9a9f55659ab163b1681c"
+SRC_URI[sha256sum] = "46eb376022e926950816ccc23502de3277adcc1396652ddb3328ce0289052c4d"
 
 inherit pypi setuptools3
 
-- 
2.25.1


