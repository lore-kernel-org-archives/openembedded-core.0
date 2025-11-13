Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9035CD5BD0
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:15:47 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22415.1763036140699211367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YnvuzpT+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202511131215376f0025814900020786-jpsdgc@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202511131215376f0025814900020786
        for <openembedded-core@lists.openembedded.org>;
        Thu, 13 Nov 2025 13:15:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gCvjQfQ0nTOaiSi5GvJuOe0qhxDztoY9szRf84pL7dY=;
 b=YnvuzpT+YVSEIHP2cj9o1jjkVbLcO5BlqZXhsm1cs1Pk1nVqvrx3HK4vFjM1zbmUid/eoi
 p3RDxx4Zj3Fi0UjRHBR9WLLMKGqF/eFRv2y8svEdCPiHInEOCTEemWHwnzftbviQZ8EnAhfT
 41I7w/s/7p+5evPFbUTxX5D9brGsqJ9n+AWGJifbwGMmOtryoaQBa1VdhIrF7tCA83mhM5O1
 s6al8Jqwd6v9yXU+nltZNhpIKkCaDW8r8dCUFDtlQEx6xX21aG6C6NMu5wcKh0mJhAj2MKoD
 obH6DtRo3PmdZZJrcrA6FBqBe/pL/uIS26I76dTLiIo4iJXs/dH2cSZw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] oeqa: drop unnecessary dependency from go runtime tests
Date: Thu, 13 Nov 2025 13:15:33 +0100
Message-Id: <20251113121533.15763-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 12:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226237

From: Peter Marko <peter.marko@siemens.com>

The tests do not use scp command, so openssh-scp is not needed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oeqa/runtime/cases/go.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/go.py b/meta/lib/oeqa/runtime/cases/go.py
index fc7959b5f4..d4b69438a5 100644
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

