Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.1168.1631666301813287561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 17:38:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=biUMpuFb;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id x5so792896qtq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 17:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DSjbSihYTZbh1RHf5kGtmd1MuEEdlHaDfmnyw7W1wJ8=;
        b=biUMpuFb+/yZl/Iwlv49GVg1oHJIewI8D3CaA4OFmS98GesgGluCIDGuup6VFgMUT5
         CkGOrfztm8YjsLtKkYNUPPNk3+Ht9QVEEcl5T3Uu9CByomPd8HUUu7Vz4PW2h4zyuxD2
         O2WQkHxn012v5df8WY0+vT3PT1B/TiT0CHS1aeRdnlmf4B9/wXY43oWe32QODJhnewJj
         rWzWBqTWpodEQQcpPHIETj4VugIOBTa5WhGDTto3+6kQf8g+thyv0HsXTVP+YQ9QY+hv
         8wFdNP6PS9KJg0dTl+0OA2e2rvzuVL3T/YKGfcTxrHaVYAu429q1c0MxyZAhQdIJ8xa6
         Rj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DSjbSihYTZbh1RHf5kGtmd1MuEEdlHaDfmnyw7W1wJ8=;
        b=PzSXv5rpJWW48f8nkxhqVcZzG8Z5xOUyLcZIb7v1NM9cwwrhUfUrRuos0Yp1EO6eoT
         gTs1FoE/ra9+GhZBMZtxwTCAjjeayhYtdGztY0QzwAc2eR/2TnbclyTwm2VIn1BMxgWO
         WSL9+mAW/q9LjjUZgD0t2UvVOkj5JRZzqyP+vuoeiy9iL/VnViyf1+0I8bXtWh3yqhNe
         cS5NFqWmjFGDqPtO+JPu10Xlk8gBqfj3M41x7ph2xIJCwbS3G9ztYstD4xm+l1xEQC9A
         LL2zhB+QE6kuSSjknT/8npCTkYwheXIhkoyWHFVkJ3dczl88J8aH8lP3+q9XpXsb8FCp
         PwJQ==
X-Gm-Message-State: AOAM533D1W35grlxmbsXkH6ezI9UwjmsxM0Jb8MBd1LwGMjOnKsOpSBZ
	XB+P8bTM5ZSPcJ/hz5mNlejK6mT6gCU=
X-Google-Smtp-Source: ABdhPJwNG03Fqaeo1yE4gr+p4WwTaZsUWit9uD6giyiv9aIPQbCgGN6MGVmjSilgqgjnbDEdP9NI3w==
X-Received: by 2002:ac8:4744:: with SMTP id k4mr7385031qtp.247.1631666300627;
        Tue, 14 Sep 2021 17:38:20 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id h70sm9072677qke.54.2021.09.14.17.38.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 17:38:20 -0700 (PDT)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-skeleton][PATCH 2/2] hello-mod/hello.c: convert printk to pr_xxx
Date: Tue, 14 Sep 2021 20:38:04 -0400
Message-Id: <20210915003804.34746-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
In-Reply-To: <20210915003804.34746-1-twoerner@gmail.com>
References: <20210915003804.34746-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to the newer pr_xxx aliases for logging, which embed the log level in
the macro names.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-skeleton/recipes-kernel/hello-mod/files/hello.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/hello-mod/files/hello.c b/meta-skeleton/recipes-kernel/hello-mod/files/hello.c
index b68b0c348e..6b73a79524 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/files/hello.c
+++ b/meta-skeleton/recipes-kernel/hello-mod/files/hello.c
@@ -21,13 +21,13 @@
 
 static int __init hello_init(void)
 {
-	printk("Hello World!\n");
+	pr_info("Hello World!\n");
 	return 0;
 }
 
 static void __exit hello_exit(void)
 {
-	printk("Goodbye Cruel World!\n");
+	pr_info("Goodbye Cruel World!\n");
 }
 
 module_init(hello_init);
-- 
2.30.0.rc0

