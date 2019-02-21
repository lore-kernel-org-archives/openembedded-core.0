Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 488547CB0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 08:32:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 444nlg4f05z5p
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 09:32:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1550737951;
	bh=ywK/LWl7YcShmqt5aXhPgEYcKKZzpc+lhKAIvRegmXc=;
	h=From:To:Subject:Date:From;
	b=rwYXgNDF8Lp1Hw8lKOfSvTubH49JkV8pMgkadD4U9O/QFN5A4TlhpaNZVwCSmdhcN
	lJMI9JQmxD6uH611KRNfHiFm1LJTqibMssndfNEEf/H78z7+8fYZvaiW54Btttygt9
	O87fJz8/v1WIeywLP2VMenY2xdVZnWo0V3lSt21TtlhlFK6nfaKFjrhltTx+0u4Kfn
	bxwus8KPc4SQ///Z6d+4dFB1Gp8uwRPhBttjNaZCBW3XiSnMyNLGLvzaWOFui/5LLm
	FQrmuA9yCSkx2XIpmQOT/L1yrrKv35oX7QRzb4IPhcD8jTMKdig4YB+vED0hABurIu
	lpqJ60I4WDm2tmyGzpzTT9ZmHi4qV7eZhwDFa3h0ralejXDT9tDgmwl7bQDsi8Uk4a
	8vCVuiGMz5vzkfqic3Kw1YARcOftwEB+kOjKXfyePVxmSeZPLfGKQ1MbSAvbPSNeAe
	aL5uI4axAgs9Q9nHIKPwFgCqoKIgHXYau1H1HUnItj1ButFUbPh3P0lOI6oknEnB80
	s9I5K27ZOmBvjIPjUIb9LGld/WjhxWr211WlDk6NQOlu05J5N8Fr9SBOS11AXiU9by
	NZI3eZR7n//Uy5ZdRmmVUyyC7vuPSR3uFbwPAi8lLQfq6szDDqD0PZdtAAifJwrcwG
	DDXxNXDKD2pt+7pkZ+zURqjo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 10:32:31 +0200
Message-Id: <20190221083232.29419-1-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] busybox: enable CONFIG_FLOAT_DURATION
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
X-List-Received-Date: Thu, 21 Feb 2019 08:32:32 -0000

The 1.29.3 -> 1.30.1 upgrade lost support for sleep with
float values (e.g. "sleep 0.1") since this replacement for
CONFIG_FEATURE_FLOAT_SLEEP (enabled in thud) was missing.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index a209eea5a1..493db28e86 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -83,7 +83,7 @@ CONFIG_NO_DEBUG_LIB=y
 # Library Tuning
 #
 # CONFIG_FEATURE_USE_BSS_TAIL is not set
-# CONFIG_FLOAT_DURATION is not set
+CONFIG_FLOAT_DURATION=y
 CONFIG_FEATURE_RTMINMAX=y
 # CONFIG_FEATURE_RTMINMAX_USE_LIBC_DEFINITIONS is not set
 CONFIG_FEATURE_BUFFERS_USE_MALLOC=y
-- 
2.11.0


