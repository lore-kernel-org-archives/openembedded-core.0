Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA0EC7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 19:39:06 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.3683.1686253145996265589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 12:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XyJuSSUx;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-75b14216386so82139385a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 12:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686253145; x=1688845145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfugyM/NM5qjZ4u4jjRKEFoKbbZurLN8RpM4+HnB+1E=;
        b=XyJuSSUx5UmEXd8FthX3z3iCinxdJF6erSpkX7HqDyYPnOBTA4Xz1JLmOZKFJcemzs
         Ai4ZEs1u7Aisdbrs2CEjb19wk14nI3EaH18JbLIjecHCEgTAU8Qa41psUdn+wGFgxOc+
         qVT4KNl5NN+sQKvBYt0oKlOtHRcqWqjMz2M61Fh8bknsKPj+hP8Nf92KVL2+b/9+4nBj
         teHXjpf8ZTpFf87DnfeF7lPtW3C2zLMV5jlEN9lSPLw10rN6FwhF8OfkfKVqvcpfzYbW
         Y5RMRTpo52MLiKaN1z1fXy9MQM6wZJpx1EyZvVKBW1zIM4TKQW82rP+XHzqp7NSsadCi
         85UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686253145; x=1688845145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfugyM/NM5qjZ4u4jjRKEFoKbbZurLN8RpM4+HnB+1E=;
        b=BrkIStk4aY3RuklnefY+6FCjdsM4e5ftRKPUDYVqo56GnFPOAqK5Y8uiyUv5/0EueN
         WWVh6SLdIEhZG55cvcM23mQWo8RddMnywAsmT5na7aXKDluinvoknou9BEwB3eAV0zC2
         7yhAopBuVn8riilJMdeyZ6kbMrN8sbl4YRJyy1HlMH7flJ4i7OBAOV3Wp3AoE4HIURtE
         /wq4C1ouVq/qazMF7k9nVV2E9ebr7wYQolXX8pDap18jF99Ackeu3TPR8Dje07wYw+vq
         VgGnB6czXNnGNOm/cTkndPv99Zeyayjfjp6jUY2nM2aUYtt0+hgKCgp8qIuSCU9/kY9P
         F7+g==
X-Gm-Message-State: AC+VfDxS7/HME8irc5EiDpMw79qEuaP7Bhd3IK4jMOAL3S9YiWPKsRQF
	Qk+/2Fa0tAagJ9KmsHAvX7MXOr3N2Smi7A==
X-Google-Smtp-Source: ACHHUZ4sRcKNiONfK8db/ntVUXtK5+1LKihlNeTFUA57w6UFQy0Wc0ghHNuKe9s0mZG7A08q9Gxg6A==
X-Received: by 2002:a05:620a:3e86:b0:75e:da49:a4bb with SMTP id tv6-20020a05620a3e8600b0075eda49a4bbmr5748018qkn.50.1686253144982;
        Thu, 08 Jun 2023 12:39:04 -0700 (PDT)
Received: from build4.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id c24-20020ae9e218000000b0074df2ac52f8sm555893qkc.21.2023.06.08.12.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:39:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemux86*: TEST only set preferred provider to linux-yocto-dev
Date: Thu,  8 Jun 2023 19:39:01 +0000
Message-Id: <20230608193901.363242-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230608193901.363242-1-bruce.ashfield@gmail.com>
References: <20230608193901.363242-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 19:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182521

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We are seeing intermittent boot hangs on x86. To try and determine
if this is a 6.1-stable only issue, set the prferred provider for
qemux86 to linux-yocto-dev.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 0d71bcbbad..121e8474c1 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -21,6 +21,8 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base = ""
 
 # Use a common kernel recipe for all QEMU machines
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel:qemux86 = "linux-yocto-dev"
+PREFERRED_PROVIDER_virtual/kernel:qemux86-64 = "linux-yocto-dev"
 
 EXTRA_IMAGEDEPENDS += "qemu-system-native qemu-helper-native:do_addto_recipe_sysroot"
 
-- 
2.39.2


