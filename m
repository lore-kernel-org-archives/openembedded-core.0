Return-Path: <tylerwhall@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 57C3C65F81
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 22:44:14 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rp18so7820478iec.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 15:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9B3wJGx/s8nO6GRGrkHipmB0I81ooZGoEcnDcGl7x0Q=;
	b=oDnU53FSPYHC/OhsVP6s0p0weYhbUGnWettuPJ3lq3yvwGkeND47dtOPIcs1mGEIzd
	dzE1yMHd8dU1KwZ8TfLea5b//a/FN4uoC0zqx0Cc/IFnyzy1JSuap4680Z18ICBig6XI
	8GeCDGLh2yH5r2JIlCjkBCfzy19QwDiw5Wu1L6nGcT2ASp2pejWSDTU00c+yW3CzOy8+
	XToDyeEVmfBD1WvNqXvl5u7vt0ZKO1RL1JUsW7C2mXsvPkzFlntLDCXqW4uYUawX/8JX
	j9SOasVvtDGAOb8ZEci6Wfd7P3lA2UeWjgXbdwDAdeKm9YwSNiBqXn5YIAJHqodkw0so
	4Ccg==
X-Received: by 10.50.66.229 with SMTP id i5mr16859605igt.44.1407624254803;
	Sat, 09 Aug 2014 15:44:14 -0700 (PDT)
Received: from localhost.localdomain (CPE-76-177-97-210.natcky.res.rr.com.
	[76.177.97.210])
	by mx.google.com with ESMTPSA id x3sm27287087igl.7.2014.08.09.15.44.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Aug 2014 15:44:14 -0700 (PDT)
From: Tyler Hall <tylerwhall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:43:57 -0400
Message-Id: <1407624237-21625-2-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 2.0.3
In-Reply-To: <1407624237-21625-1-git-send-email-tylerwhall@gmail.com>
References: <1407624237-21625-1-git-send-email-tylerwhall@gmail.com>
Subject: [PATCH 1/1] lib/oeqa/selftest: Don't match log level in output
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Aug 2014 22:44:19 -0000

To facilitate changing the log level of the "Fetcher failure" message,
search only for the message without the "Error:" prefix.
---
 meta/lib/oeqa/selftest/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index e765e36..68f97bd 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -102,7 +102,7 @@ class BitbakeTests(oeSelfTest):
         bitbake('-ccleanall man')
         self.delete_recipeinc('man')
         self.assertEqual(result.status, 1, msg='Command succeded when it should have failed')
-        self.assertTrue('ERROR: Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:' in result.output)
+        self.assertTrue('Fetcher failure: Unable to find file file://invalid anywhere. The paths that were searched were:' in result.output)
         self.assertTrue('ERROR: Function failed: Fetcher failure for URL: \'file://invalid\'. Unable to fetch URL from any source.' in result.output)
 
     @testcase(171)
-- 
2.0.3


