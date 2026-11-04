Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11871.1793806548433220465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NEGFlf41;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8451a619da7so550148a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806547; x=1794411347; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQGYr8GCQvUsr05n7h4ns23NXlVBlfSkuZZYFiRn/H0=;
        b=NEGFlf41kHXDfjY11MooK2bpejdE7BACGicyGwG/wU+ntBEWJ2o9EA204+XqwkECtg
         pMRsksaXp6ch2goFZAQjZuJgsqmMfwiwmNM7Ar8I2MQKp2t5Ei8l7JGvzCz1AJ4CukAy
         DDHavPzeVeW5fuBnix3rM+45NdwLIqAdvNZL/V+KvIPgUtZQ8HsSX2IQrzRBHUYec8LR
         R4U8Rs4AnPiazJLwtYkgK3L7pDBekOq/yiggo9EgLa476eBTlekezkLp2vwlOyrVS7lX
         8heO/Avd1bsDa8L2pZQYG8W25tXwGz3YM3Ltcj5quzuBt0s5gvqdEqTwD1E7M5ybszkW
         ZAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806547; x=1794411347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eQGYr8GCQvUsr05n7h4ns23NXlVBlfSkuZZYFiRn/H0=;
        b=I5Ql5iX93gjmtfMAkbiGifvyMdV8vKBtDvfn0XInRczN5T3OPz9AtE8XAWcSnGI1kp
         WWST0oL0XjAZ5tzUp2ijrELwj0kCEU4HQZYhxetf12uiSupa9y0DsQjwzkYZn9QErgjh
         b9VgoASM/WZUetvt7/ZhwBmCzSM/p8SWc10Jtt24m4TnoVJonG6UgCNKLtgT7tO3mcp5
         Mq3SqaUaZKaan6kfFGYew+8MF0TOgoiqBuuYpkyFMlvE0iLYf6vMa3NLJJtly3W7cQrj
         sC/eyFnUTqAtEqmlRIjpbBJ6/NaNYSTJld+JJLoUK/XqGewAedb5TaVXExvSSwkmkfeD
         LtlQ==
X-Gm-Message-State: APuU4Z/QrCm72KTfA2aF3uSQvR4U+aQykn7cUFs42bHKMc0oGRkNKhVD
	ZI5Kikw0GkU811J95A6ahg71PftNc3tP7HF+Or/p36yqw9HVw6xgFmfTei2XHQ==
X-Gm-Gg: AYBFou3zd6IpX3kJ72wadKZz26FcAGcS/owf4H2WyG99z/FSZtjX2A1gtUcRNUIdkKq
	z6lplYvZ3medfX209rQxORyOF/SO+imNO/CAO0FynAsup3VOhy6YRF9I+/W+ZowUNMiG0bEmRj5
	Nz7HphHEVI9ErXNudDLUb1TgOqVHO1fu2dvDBgrFpGg84ZDYMyemkGwP2h3O8DTXiLnHy3rial9
	tjmgjhb0EL7kUGVRmmgQzf42VpuFk9lF+Cu5v38IjUfVBjbJLqmSkPcEgZq3tPTm7EY3mEW91Yh
	jiruPTGt7JqcFzMKgX3oYrxWdPLeklsCuyiKzpj5JVfp8l7MGMfbMXkdCfKXXeJTc1jyxHBrV2W
	QgIiEqSnfkoYuh0axUMK4HNkrIr46vVBYQGYHI7VSoqJw+zcPPumlrLNetMSRRw5T6i0NeOOziT
	0s5FxmkWr90gU3MEubhaknSeTL1Id4lkHSGIyMc/kY2VFvP3/AkbAn0IXkv61DLyQ2bKFWmSA2q
	0DTx+Sfj+NPoR1pido3JM2qRhnapMReFJvotAhjAl0gLiVxvXca+RaZddRkp6F7t+pYekio4fUe
	J8414VOgLgjZPULZzy6VF83trJM=
X-Received: by 2002:a05:6808:4e0b:b0:564:3fe1:2f95 with SMTP id 5614622812f47-5643fe14f4amr6879850b6e.56.1793806547426;
        Wed, 04 Nov 2026 07:35:47 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1d6f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9f8basm1894928b6e.12.2026.11.04.07.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:35:46 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v8 9/9] linux-dummy: Allow empty SPDX deploy artifacts
Date: Wed,  4 Nov 2026 08:34:02 -0700
Message-ID: <20261104153535.3184146-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104153535.3184146-1-JPEWhacker@gmail.com>
References: <20261028220609.1348489-1-JPEWhacker@gmail.com>
 <20261104153535.3184146-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249403
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

