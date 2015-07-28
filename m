Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9DAF576420
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 23:21:39 +0000 (UTC)
Received: by ioea135 with SMTP id a135so3817620ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 16:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6wNniXwEDd1X8nQQFYnMSY06s+CY2kV3MGHZ3VEdDPE=;
	b=NKS+dxRtQN68acyTI/Vn6UEMx+RHAYLqRcOkw8whrUqFzwXFHF4VjLLsV4HeRukMyp
	MjFXRIQ/0Huk5MhR1UHtAUuobeccV8Gob+RAxCw+RepKbfDcG/PeedysOyCVo1KO5S4b
	PIGB1qX4utKzMriQUFFX1ct7R/aYELAQMbL28BH7I1Gbzp7nu0kPsKb3mqcJ/bNBbym5
	Olj3mMjcDWJ8g3WC9L117wQSMq3h/AX6imCAgPdI05h6t+c2Iezgzul8ZyJ9B5Ooirz9
	uMmy4zz04u0eIQUNdUj1ncN2IyFln44QAEfK3EHyezeXDVJ0QiO2mLv5fBGVZQGrEZnp
	qVgQ==
X-Received: by 10.107.9.137 with SMTP id 9mr63441757ioj.50.1438125699471;
	Tue, 28 Jul 2015 16:21:39 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id i7sm9668533igt.18.2015.07.28.16.21.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Jul 2015 16:21:39 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2015 16:21:02 -0700
Message-Id: <1438125665-14966-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/8] busybox: disable sha3sum in defconfig
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
X-List-Received-Date: Tue, 28 Jul 2015 23:21:39 -0000

The sha1sum, sha256sum and sha512sum applets are not enabled by
default, so don't enable sha3sum either.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 94c4497..5e87239 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -271,7 +271,7 @@ CONFIG_SEQ=y
 # CONFIG_SHA1SUM is not set
 # CONFIG_SHA256SUM is not set
 # CONFIG_SHA512SUM is not set
-CONFIG_SHA3SUM=y
+# CONFIG_SHA3SUM is not set
 CONFIG_SLEEP=y
 CONFIG_FEATURE_FANCY_SLEEP=y
 # CONFIG_FEATURE_FLOAT_SLEEP is not set
-- 
1.9.1


