Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F50C43217
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.7365.1651727176324934710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SxdCEwQV;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id i27so6532209ejd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0UvcySuIwBBoCdx2heYS1Vlsay209Q6TCVXXUSLTgbI=;
        b=SxdCEwQVhSHxxXMdbOwqZSVQ/MCFcwk8kPOE6ftu45n2IoLV//FcEJY64DcNd/nXRg
         KvXwbnEIQBLVvPlcBMyZKz6q0pI6wdBacYC/oQ+aDKa7K3RUPN3WhrQev9sp9RRmzrVE
         rcU4K43CO424xcETuGuNt+avKK1Sk+HuDEf8tz0ZGjFr0Edopy4nWYHJLuZAAHCHiiv7
         1A98D/nGIPix+cbqEOwdkh6gTmhsqnxzBRHcRAWyUyE6YbP+IhSYx05j3eqYIwXg1FIp
         ld1f+iUJyHXKCI4jCTlICBPYgUzDzG34nNw47lffOuD25d4zUuZC/Xs91Tatk/eNdg7n
         nHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0UvcySuIwBBoCdx2heYS1Vlsay209Q6TCVXXUSLTgbI=;
        b=i73vmDrRXUC3vwXfGbHU1Sr+77fUNyeHojIh0eVUZKjVAPnwiM1qEKZiraM/8FKIqP
         x/QEYFfmO1FvdZIh5vamL652ThKZ3gHnrkaaYMBbrA5ujlMVaSa3RC+q9wNo7wC+LljT
         XBqtcEG7NaK7Dp0IH4ESWpTTllrXQrW6EcWSqmQg+DE+64oRxr6NXLaqYc520pq31WrX
         F5YpyfxGLpNSAWaoHzrpoB0rUS2dFZN3p+tUw7OVHBN7GvhADdGZELYGG41BvWbFxUXU
         eMAnrM6oG762lDq6V6I5ZvJ1lwD+dXBWBM9F8jOGNmjc+iIUF3NTs14s3PSqBum3NoJZ
         9Isg==
X-Gm-Message-State: AOAM530lSQpj1Qyo3ApfQlQ83nbkZnt3casxn0++2VT2WPGpjbrg0833
	Jv72SdeKcoSxRgQ9ZB9YPEmG6AKtvr4=
X-Google-Smtp-Source: 
 ABdhPJyGg8v4iWeoAbqBQlu+d1oInuu0xFMbTbiLVUb3Wk0lFRMVR6Wc760Lqmv5DDGak2+Krnkraw==
X-Received: by 2002:a17:906:4fc3:b0:6e0:66a5:d59c with SMTP id
 i3-20020a1709064fc300b006e066a5d59cmr23761903ejw.131.1651727174955;
        Wed, 04 May 2022 22:06:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/61] python3-cryptography-vectors: upgrade 36.0.2 -> 37.0.1
Date: Thu,  5 May 2022 07:05:18 +0200
Message-Id: <20220505050544.651895-35-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165265

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...vectors_36.0.2.bb => python3-cryptography-vectors_37.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_36.0.2.bb => python3-cryptography-vectors_37.0.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb
index be0eda056e..98740ba95f 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_37.0.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "2a7924449a03025faf7f8754a6f4200001cab210734a6ce6ac1f6bdacd3a68e4"
+SRC_URI[sha256sum] = "66c9a714232be730fe822bd7e4e9da6231ff9e537ee4feb0f092c06b8ea4d94a"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
-- 
2.30.2


