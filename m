Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 752936C10D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 13:05:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 43D3GG056LzKk
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 14:05:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1544447126;
	bh=V0CerlX8BRN/x/51U5/rsi6cF61mQmDgzxbDQXvHlIo=;
	h=From:To:Subject:Date:From;
	b=XomO+N2SUuPdqRpXT/3HqKo2/CVXKmxCLGGhW8Z8ORyl4IfTPqfs/cHPseH5xVMjl
	D3saCMsZjALiHpAzdX1Ya3+RfaByTCCYWVNiFk+TfKak6CMhBhoXeU1aRA08OKsTrF
	OapfjjZR7q3ZgyQZzMpE4oMqBFue4fDk0Shiz9DMo+vrJaogWHbZGlBZEOB1qzsV25
	cwiolQnJHFGbXmh28Ko7vsP8/yEQ2JLZgJ4XPSNIbZ7n3EB70e2UWf0txtfIHD6Sz/
	XSKQBHQu2C2OSNYYncqEEO4AW6kdaCUHhUFsEPIMYVd2KhWdkm8m3vwu0HjW27k8fz
	dSs6f8LGtSuQ2dh3jC856+djzWAGpmCdYI5JLW9zb3w6GZXeYrYZJ9qQk0Vy9cr4b1
	Hb5DP2y9k3Mg90clY8ZXT+7YGEXMOi5eK/IhREsawxdibhfSdQAT+hSeEZajT/cwbz
	bH8dVjgdDPr7jm8fyheZUrNECaGY81Gu91OUloJdwVxxGkO4L9vT5pwMFc+upImI0j
	tb/XFB1EV1GKanWtw/KNdCKP9dYMOynYoWdaoFjxnH+mSeNHIXxxxthmh/blpjsmCs
	bR6ivofP2DD2eI0HDrD9h7lRxfS3NlI/je4xPe5jLrbgnp+SeKZ2YPd/Y4p4NAnzoC
	CeJOTZ+wYIPujBinyuz548aA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2018 15:05:11 +0200
Message-Id: <20181210130511.32200-1-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [thud] [PATCH] archiver.bbclass: Fix COPYLEFT_LICENSE_{IN, EX}CLUDE
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
X-List-Received-Date: Mon, 10 Dec 2018 13:05:26 -0000

Setting them to empty before inheriting copyleft_filter
made them not getting their documented values there.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/classes/archiver.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 0a9fe4fd1d..e321a0e362 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -23,9 +23,6 @@
 #    COPYLEFT_RECIPE_TYPES = 'target'
 #
 
-# Don't filter the license by default
-COPYLEFT_LICENSE_INCLUDE ?= ''
-COPYLEFT_LICENSE_EXCLUDE ?= ''
 # Create archive for all the recipe types
 COPYLEFT_RECIPE_TYPES ?= 'target native nativesdk cross crosssdk cross-canadian'
 inherit copyleft_filter
-- 
2.11.0


