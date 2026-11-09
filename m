Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3761.1794253690075745992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 11:48:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fWkvgYHg;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-716ea2598eeso727638eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 11:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253689; x=1794858489; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQGYr8GCQvUsr05n7h4ns23NXlVBlfSkuZZYFiRn/H0=;
        b=fWkvgYHgOGa5umfjYVV78QPIdOpH2lFaUELq2tP3rn4pjtLFof47WICnw5iGcrIeFX
         M4kUNGrNgsgQIlNFGFy62tuJgeiygL9jpp0YvSZs/G6kkzsq6MJearMz9YmZSUr6S2KY
         TH8iME/+NmDyAt3mwlXdBvidaMxAGKEzHIggRswvF+ZYacGAMsCb5mPpyWkFmoj9IikV
         MAWmzDlt3ivJeUrg8dMHIP/Kg8MJCEd5DKJNETuWjhoI8uXww0CV1EbEFL4nNzhP6gWv
         jLXl6Jmr87dPJXQLSI/Lj4gbnZ4eGHlMgd8WC6LH5s9iwZJLOm6Ues4eGzA5+rVfMooW
         mkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253689; x=1794858489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eQGYr8GCQvUsr05n7h4ns23NXlVBlfSkuZZYFiRn/H0=;
        b=V51dcCBpxUGyFhS63LOWdLoeMjBYmStPIBtmnDSUgEIE/D737UnkIFbnJQCp4db3lc
         g90AsgZQnGVC+tWBFLQtGJWKAW+R7yz82X9FcOPokM+wCJ40bfylk5mo8ws6pd5I32A1
         BgOW8O7p3lfnbiOJSvKnm2M0c7BuqMEAIJdRozy2cyBDW1L+ys73el7QiytvYSdTvcVR
         bLalStNew3F8StshiYSpJCKg+G0VoMKC86dPQz3MV7Z9kg35zADjJgeryYwkPwwMJQfJ
         rKPT9dYSEKTv36F0++syvot6FTHdOCwCFmmKVup56lVcHamDqwPtS+Jh0s+OEkDTkSgv
         Liow==
X-Gm-Message-State: APuU4Z9sYInylO4WzQNoa7Ri3SRBKPjYcD668OqMEK8ejSsaKPqL2Vi7
	WkCvKwEDFACRUEC2rQVDJssZIHJ4k4DDjKICgOW8MPREc/IqQVyIz3qCRs4NFw==
X-Gm-Gg: AYBFou0zGocN3ddCTzxsZkhU21B2+/rohy8NWapMptWs5evb5CkGNDmgLMrrt0+Ltsf
	hePV64L9B8rSMB2QR37eHhfMPQ6jupDy8o6X0U/AagM6kVDnvvehcuWNEhDZl9712FAGGX9YoMd
	JoK/1GNycb4vM0aonWVuVcdPHkRIZJQ4sp3mIls9n8QH65RfpPdnfyeJSM/xV1E6wQ7LVjzIbka
	fHkp9ZL/SShjnjmod18N+1NjgfTVEttAUcxl7aToTpWiELlwzLFUVvJOOHfKOrA1UMHxvmFWjVC
	cIOAew0lkdSgZtpCWKKGBD8lmqkBzp+A/YjyKFsMRslmtlsneEW+l518OV8YlATsx1IyONQx/vm
	ASP3sWle3bcuZT21VRc6BQLd5YOdDBD70jBBbG2p4aEvQUg9gkQ2jd/T+kgtbYcRV1WwZaxUSLN
	knFDQJEOmGVRRQMKPH4kuJsAIUjCuTbYGh9E88okjO0XyikT+MkFIBXgwBvHWLM4UlHY00mvVEk
	TVIdyw6jLP67R8y8Zba4Ap79IE61xwrJA0GmRWJrTp0AweFLCR04faXQWMeoCZVSo8z4GjDQu7C
	GoqhI2hf8q1v1q3ik2koxsbN2YM=
X-Received: by 2002:a05:6820:806:b0:6f8:2346:cd8e with SMTP id 006d021491bc7-718a78edb80mr85402eaf.80.1794253689268;
        Mon, 09 Nov 2026 11:48:09 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::3232])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa132e65sm70363eaf.14.2026.11.09.11.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:08 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v9 9/9] linux-dummy: Allow empty SPDX deploy artifacts
Date: Mon,  9 Nov 2026 12:45:45 -0700
Message-ID: <20261109194759.550935-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109194759.550935-1-JPEWhacker@gmail.com>
References: <20261104153535.3184146-1-JPEWhacker@gmail.com>
 <20261109194759.550935-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:48:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249874
Content-Type: text/plain; charset="utf-8"

The recipe doesn't deploy anything so set SPDX_DEPLOY_ALLOW_EMPTY so
that it doesn't generate an error

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-kernel/linux/linux-dummy.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index d7f39a452d..c45352aab2 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -23,6 +23,8 @@ FILES:kernel-vmlinux = ""
 ALLOW_EMPTY:kernel-vmlinux = "1"
 DESCRIPTION:kernel-vmlinux = "Kernel vmlinux meta package"
 
+SPDX_DEPLOY_ALLOW_EMPTY:task-deploy = "1"
+
 INHIBIT_DEFAULT_DEPS = "1"
 
 COMPATIBLE_HOST = ".*-linux"
-- 
2.56.0

