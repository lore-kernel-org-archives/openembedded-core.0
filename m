Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.8878.1599691572747963264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=h1rwv4Bl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f195.google.com with SMTP id g3so3332815qtq.10
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 15:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T9bwVd+QlhkUkiDHlUEJ3IVtH4D8u8zmVl7bUZqbXtI=;
        b=h1rwv4BlWgNSsmTjd+RDRQSgeOxSYv6mtMjXOBKycrbuhgb9/JmVt9gJpq135IJOMk
         dGdLtcL7JelAfTPffdcWrH8ujKQ/8t9FpskPbrBa+BoLN7oP84AmypwR+p2Y81XKD3xT
         thRS2s9sI3/7OFDQymRzWJXFBNu9tbKKNRrc5iYFhCpaWg8lvzUaZviSuTkW1qCXkUso
         eM+AzswYQpcYgm34UyD3HUYgU4D9ZXw7NkzBOi/vWyB9NKJQ45OF+kcxT2mF94BFwNlj
         t1+NWb0cxpsNWbbJukAKf9il3p52vcniuwCWFEKVJiIGUL2dbZdKwJT4O4H+7B3rwb0G
         Mg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T9bwVd+QlhkUkiDHlUEJ3IVtH4D8u8zmVl7bUZqbXtI=;
        b=XHBdsdWOHCMhsoIBMU3uHHTEkKHXXvwr5y+0F0GcIF7Vc5InOV1pdPDqbljzSOIDOq
         Uf+PoyWN2PuH6+hqyyH79heiLwbLyeLadkGJcLs6KJLq0biRJs879PZsvbFjL4TPAM+6
         XlfYGNzfzd0/uejBJGx/IHzwbN+6Pb4+UeIfj9dzv6gvxvfar+pjUo/1zcGLGNCAcLRv
         wGlQPN7Mrfl6Hnmkgc5lXasQ9uTxNOsRCxfrDWEUk4v26RjdvkXDaEP9e43QttWkpLMp
         417SYEMfN3j2TFTjxTWbxIGxLwpDh+OapE1sgA7PsbTDXEc4j+a7qKbqS2talEDqfQm0
         FPcQ==
X-Gm-Message-State: AOAM533DNmI4GjQHMaj4Pu/w1qhQAChTSh2oH/dEx4Eo7jzUBBKPNU8D
	sXr0JB7YLR/wtHVm3s4JwoXBysbVFyOwT6l7
X-Google-Smtp-Source: ABdhPJzfhobGvwI8uViC0WFy6ZYm6a2jvqVbKdBtKccLkZS/8p73x2yACEgO5t4ZHZuQ/RBF8t2N1g==
X-Received: by 2002:ac8:6e90:: with SMTP id c16mr5336276qtv.391.1599691571717;
        Wed, 09 Sep 2020 15:46:11 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id 145sm4218637qkf.18.2020.09.09.15.46.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 15:46:11 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][RFC 4/6] qemuarm64: change tuning
Date: Wed,  9 Sep 2020 18:45:33 -0400
Message-Id: <20200909224535.27164-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200909224535.27164-1-jon.mason@arm.com>
References: <20200909224535.27164-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous patch caused the tuning file referenced here to be removed.
Use the new one with the new DEFAULTTUNE.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/qemuarm64.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index fdd464d708be..9367f6ccb8d0 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -2,7 +2,8 @@
 #@NAME: QEMU ARMv8 machine
 #@DESCRIPTION: Machine configuration for running an ARMv8 system on QEMU
 
-require conf/machine/include/tune-cortexa57.inc
+DEFAULTTUNE ?= "cortexa57"
+require conf/machine/include/arm/arch-armv8a.inc
 require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
-- 
2.20.1

