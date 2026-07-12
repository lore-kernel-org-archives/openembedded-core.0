Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D27C44508
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:37 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9498.1783835492460635052
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=YgEQBsUL;
 spf=pass (domain: underview.tech, ip: 74.125.224.50, mailfrom: vince@underview.tech)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-667971437d6so3413998d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835491; x=1784440291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZa5gp/PMJPhHrKXj8YiZezPTPAiCE4R4REqNFoDSf8=;
        b=YgEQBsULP8vLHW9iQn3wvB1kYj9L7m40/bXseEHRLkk+wi5pIO8wzNckV2iu4ea/oM
         hxrVW+Y4BxwS9tcm1Opn6jUGFjodD6p4YYUqqNtAvB4wTUYnqVrvazgGXhzOGxI5SR6i
         0Xg4DmyRFsE0BbxVdEdvyfbaXnrrdJJBwuCJMHDzxDkDDYkPgq5thS96+Jg3NUGhOR+/
         PsCoxvLQRxT54PhCfJ88FhVkU32a4VvjEyaTnwV5kOBiCMaKarnig+wR9vltteFp/6HQ
         uyD0lrjjLeVSbjWhGAiaiy6hf1QxdI6IxberjwycxHfG7oN6xt7l0E1lapOV03yEiVKi
         d8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835491; x=1784440291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZa5gp/PMJPhHrKXj8YiZezPTPAiCE4R4REqNFoDSf8=;
        b=NKzxN3FrTipvzdlX6TZiSMEXzWD8JqAi0ZnWEz9nnMThw7gXzauJrgaIX/cl8lIkN7
         dk2Ic1KBFH3E9cPpWe1gbMbey2k4aoByK57ddpFo2BOKhigw8TI4YVbbDCpOHtSYR9m5
         OlauK2GleKVvNRGyvIpIrE4ClqiXzhYLbtrUnlJ8chhK7rcEeltZ2REfUoM+Q0tUepSm
         VgVqE1GZ6I6HF7KaAEWtTltkEGdpu/Iv5qkow3pRcfNaqvd3+I470WWdD7WpWcMSDzxY
         bBCXvsDYBvMQIfiQT9nH4z/eMJL3TC43ZRJfP29JPEdI7/XKej0yBry3tWJDA/F8B3zV
         xZeg==
X-Gm-Message-State: AOJu0YxcN+W0RWYHfI8UQwOGti2Fm3uGWtOkR4VaErEngNUYLPbug9uo
	iizV6ubf4Bia3fXnbd0/lIxW/I6gnY0cyIrte5u3GyICKVbi3r9ChQkD+GNdt5C1CDBpFFmNh+J
	KOMaNbc0=
X-Gm-Gg: AfdE7cld1s1xfNHnuRNgs5Y+ay32XVT8DYr56X8tRc9h05awiDU+NBDYvoL/e04pp9m
	44XIfsoi+f3I8Rx25uOhVPqz032ZdbGj6XZLVKZFZGpwxXB+glw6aBjkP2PDJLYlohxM74arHCa
	hDpgE6cvvq004Ec5SKuXmYt6wYXBjE3t/tDLksOrukQn2SJ5E0Ng5ic39J5DcO2S9fxY1b3U1Hr
	L4jKgdJQKPcLXNqp7/RM6zWVIyeudwaUxFtfDgdKUEJvBJ3ute+Ois69aTCZAbgjS8zKiEG1vv2
	Mh+Vf35vXNY7L4U7+LcxB5tBWWNoPEDhtJE1UStxTFjYj6mwbr1DeXk46oGoGsZJgHIOWgvk0pL
	nnSPxx0T+46aRCqe74B27Ay+xVy1AenRpEtZXYpbSzkOO0pzfd1MEINZZ/EgZuhFjOUthqWUME0
	4q8HxUmOFRY2SWlw==
X-Received: by 2002:a53:ca08:0:b0:667:b314:aeb8 with SMTP id 956f58d0204a3-667d7b01fd5mr2446605d50.8.1783835491558;
        Sat, 11 Jul 2026 22:51:31 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:30 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 05/26] core-image-kernel: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:33 -0400
Message-ID: <20260712054954.4063745-5-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240730

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/images/core-image-kernel-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/images/core-image-kernel-dev.bb b/meta/recipes-extended/images/core-image-kernel-dev.bb
index 4018af7a3a..708bd6bc1f 100644
--- a/meta/recipes-extended/images/core-image-kernel-dev.bb
+++ b/meta/recipes-extended/images/core-image-kernel-dev.bb
@@ -6,7 +6,7 @@ require recipes-core/images/core-image-minimal.bb
 
 KERNEL_DEV_UTILS ?= "dropbear connman"
 KERNEL_DEV_TOOLS ?= "packagegroup-core-tools-profile packagegroup-core-buildessential kernel-devsrc"
-KERNEL_DEV_MODULE ?= "kernel-modules"
+KERNEL_DEV_MODULE ?= "${KERNEL_PACKAGE_NAME}-modules"
 
 CORE_IMAGE_EXTRA_INSTALL += "${KERNEL_DEV_MODULE} \
                              ${KERNEL_DEV_UTILS} \
-- 
2.43.0


