Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0378DECAAD1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:25:22 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.7754.1661833517879201057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fz0ql7Kv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661833516; i=@fujitsu.com;
	bh=Ue0xdVoGjzIE/7IrOnOvwHczcx6GuWL5cZUk/8SH4/I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fz0ql7KvQ+j+OZW1PUJzyiJIG+OXfglQEmCHfvwOCblXqxcY1Zrzq3Y5TuaHrEOip
	 PN/AONW+pcjV9Qj65xFNo49R4pEAVu2BM4ZmEDdAjkIEDlb9UDeT+cUczqbG4YsaWo
	 SrZWvl9amFVXgdy8MEsjvrF8mlw2gt8aD0VbyT9m3dH3NpTmysmEyby4CyxpL9L3xh
	 UXnaT4ptbviKdU3urIje/JABwThYauKdtU0559So2pT60iqDO5wu/ZT8mOICE/BkN9
	 /IvkguN7Rrdo0UwUQtss4JKPl8aJ7/hhIGGP42Wi71Iq90wE/MDiAJlW/rrZvjj3LB
	 1Qgu/9wMjl+VA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORpKs9kTf
  ZYMMheYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP1s28sBWs4Kp5c/cbewHiZvYuRi0NI4AGj
  xNNz89kgnCtMEpvPd7BCOHsZJbb/fgiU4eRgE1CTmH7rBlCCg0NEQE/i6j9RkDCzgIrEi9897
  CC2sICrxPtpF8HKWQRUJc5uPwQW5xVwktj76hYziC0hoCAx5eF7MJtTwFli0rUrYDVCQDVX17
  xlhagXlDg58wkLxHwJiYMvXkD1KkrMvtzMAmFXSuyZ1c8EYatJXD23iXkCo+AsJO2zkLQvYGR
  axWiTVJSZnlGSm5iZo2toYKBraGiqa2mma2hprJdYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYyCnFCQd3MK7Y90vvEKMkB5OSKO/CVt5kIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8l7uBcoJFqempFWmZOcCogklLcPAoifB6dwGleYsLEnOLM9MhUqcYdTlmfm07wCzEkp
  eflyolzruuD6hIAKQoozQPbgQswi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubd0AM0hSc
  zrwRu0yugI5iAjni4hBvkiJJEhJRUA5Oui7F+2lXpJJ3l/7Yf1xCYFV/4Xvdgxc/MpeXRP84o
  Xli+8b6JfHVAPIO6kkaJcvqjeSvzFnJFLPoQ+JklSC/+IG+arDn//EOva4WOHM+qs2AO+7q5d
  uHF+eusi9R+1mfybY6W67rbEm/06XTV/faE82siwwT2tgZ5TtH3XNXV27TVWScqYv7bq6tWLp
  ucaXqT3zD6+vdVGiy59XtTS/87CuycuOe76HODKU7b6589d4vwT9P6fViiY6JtXWX2ArsWfUG
  ZT4mOi4xkDirvW/958rTHx5Ov7wpYEKN0S4q9ecrr+VH9HL+zApUihHlkJ3upsb6PX7348oyK
  bb5FPGZC29eatU88UvJ2Ks/FMiWW4oxEQy3mouJEACUMYDVrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1661833515!208877!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3113 invoked from network); 30 Aug 2022 04:25:15 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:25:15 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D95C61AD
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:25:14 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id CD9F31AC
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:25:14 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:25:12 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] vulkan-tools: upgrade 1.3.216.0 -> 1.3.225
Date: Tue, 30 Aug 2022 12:24:53 +0800
Message-ID: <1661833494-12657-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661833494-12657-1-git-send-email-wangmy@fujitsu.com>
References: <1661833494-12657-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:25:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170060

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-tools_1.3.216.0.bb => vulkan-tools_1.3.225.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.216.0.bb => vulkan-tools_1.3.225.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.225.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.225.bb
index e26f4504f1..e212d8986d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.225.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=master;protocol=https"
-SRCREV = "ef9db7a8ec52f6c56158d83f5d57ef388c1abec1"
+SRCREV = "439026106ac98679e5961a499790327a8bf8f1d6"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


