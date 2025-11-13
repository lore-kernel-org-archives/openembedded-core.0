Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDAECD6E4B
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:29:07 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22654.1763036944139057316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:29:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=D0ftPnSf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20251113122902ca09372b52000207c9-r0hnbk@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251113122902ca09372b52000207c9
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Nov 2025 13:29:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=7cZx9ddmYza++z4N+EN8o98Mh0zCaQ75Y+2CaSHs89c=;
 b=D0ftPnSf6kdBFItFXqrowYi+ZMU6vI4apHpwv5Zvb7cHGSNTxEYZ6784IenZGMXOBY4/f4
 5FD54i6AfKx/BH8SLHwFHrjE6wLNL0VlO0YFKrPwgoUoEHx/bHuXhAaO84CZBqZdOpVkBbyE
 Nec9wOsv+DhteME9peDx194b9WR/Zor1ZdvtvXoklwi9p76Xor8cxEYA2ETJbYd1b79yzlEk
 zuoNPny//eu+lqdkagz0gpRx0f9/ei43dwNE4r1d9cEUeBtdHT1cOkM0Z5JhUAdXrsvLFW5W
 wwrUVstXw3+Gw8ZNDCeB/GB5FUrkgo8+7OVf4lOuwggyNlBu/fPm6dhQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 9/9] oeqa: drop unnecessary dependency from go runtime tests
Date: Thu, 13 Nov 2025 13:28:06 +0100
Message-Id: <20251113122806.16769-10-peter.marko@siemens.com>
In-Reply-To: <20251113122806.16769-1-peter.marko@siemens.com>
References: <20251113122806.16769-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 12:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226247

From: Peter Marko <peter.marko@siemens.com>

The tests do not use scp command, so openssh-scp is not needed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/runtime/cases/go.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/go.py b/meta/lib/oeqa/runtime/cases/go.py
index fc7959b5f4b..d4b69438a56 100644
--- a/meta/lib/oeqa/runtime/cases/go.py
+++ b/meta/lib/oeqa/runtime/cases/go.py
@@ -28,7 +28,6 @@ class GoCompileTest(OERuntimeTestCase):
     @OEHasPackage('go')
     @OEHasPackage('go-runtime')
     @OEHasPackage('go-runtime-dev')
-    @OEHasPackage('openssh-scp')
     def test_go_compile(self):
         # Check if go is available
         status, output = self.target.run('which go')
@@ -49,7 +48,6 @@ class GoCompileTest(OERuntimeTestCase):
     @OEHasPackage('go')
     @OEHasPackage('go-runtime')
     @OEHasPackage('go-runtime-dev')
-    @OEHasPackage('openssh-scp')
     def test_go_module(self):
         # Check if go is available
         status, output = self.target.run('which go')

