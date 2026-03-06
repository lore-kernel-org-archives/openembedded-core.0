Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E6FFCC07A
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 21:09:29 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4871.1772831357809827450
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 13:09:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=MJh6ZKuv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-20260306210915d028115d2d00020715-j_yaj1@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260306210915d028115d2d00020715
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Mar 2026 22:09:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=20ZB+HpuJPNJ9lwLSPz4CuIg9DJ+JvcoI0BUWis7B8E=;
 b=MJh6ZKuvnyWIZd11NZ7noqo/wbWGzOUyZ9Ef7kopw3cgh3OjwbnBCDqAoQHOUW96uHiigx
 RlZxnTMFfvduF28t+Huc0wI0D6JW7Sipbq1sJuVWNzMlbGlG+D4ToyjjsWDUzEolXD6lxS5J
 bJiogNZhlHQ+Yqdpvek2HPWZbVDvFAT+t4Bo1r7yf6NiXxix+iBYcMaQXjncVbp8Xu4n9gFW
 vP6mjooZgM8Ds4R9Yz4bPkVyy24F+aMxaOQBZo0yQqyFBLfc9IARNO2CI4VKHfgNJf/FRAiC
 Fd6wfo1xP5EULF/MueUmDZ0vqiqh9AxKJE5B+bwaVX7o4UfzIQ7VGC7Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] kernel_module.py: add missing license header
Date: Fri,  6 Mar 2026 22:08:35 +0100
Message-ID: <20260306210835.141999-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 21:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232599

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This is a fixup for commit 570dd06a703c9346672055d52a2461f2715a515b
module.bbclass: move environment setup to kernel_module.py

Copy also the MIT SPDX license header from the file where this lines
were copied from.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oe/kernel_module.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oe/kernel_module.py b/meta/lib/oe/kernel_module.py
index 678f7de03b..0d27fbaa57 100644
--- a/meta/lib/oe/kernel_module.py
+++ b/meta/lib/oe/kernel_module.py
@@ -1,3 +1,8 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
 
 # Set up the environment for building kernel modules
 def kernel_module_os_env(d, env_dict):
-- 
2.53.0


