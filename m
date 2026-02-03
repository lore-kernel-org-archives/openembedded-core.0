Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE30E6E7E3
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13484.1770113968498402465
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YwTTDEO7;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-482f2599980so26236935e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113966; x=1770718766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRbpdnfCPzXYtV9l9RU5VAF3MvD/TbwGpKBzzr/lkfs=;
        b=YwTTDEO7wiHjs7TWK8PN/D8zE+OIVewfMODH6KOM2SEnyBc+JRj7RmtiYWekH4bmG3
         c9Tum62LYEhL5YvuQzIiHoxY6ttj0U7rHSh3yxoXR8pH/5MQo02zbHpuTXK3z8bKkOUy
         dbgmNmQ902roWIR3C/FC9+eSGFn/VwnvFIvVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113966; x=1770718766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRbpdnfCPzXYtV9l9RU5VAF3MvD/TbwGpKBzzr/lkfs=;
        b=BnEeHb6GaWvExTNcf4s9dVAMR93hBQqxDI+IdKD15d76tRszSqseN49UBlDDKCYEWa
         eSILho6KNqdGIAa6e1yGQIuIZb1G2gIhq3tk/VpjC3QRj/1BQUR5c0fune38xx7sW/K9
         7h2rHwX/oBYRnS1IR2JdYhoBiAiIfurynV/dd/dFZ9wAgzDc1lJ88M6HqOpPWD4Oary5
         pqfzoT8BaMnca6/N9J6s/wEApbq/gVKghJlUnaZmzSRO+e8u+7qqZg9SNmRuuZKfooX/
         0dMb5DLnXzz6HidDsLyHmhJZnM2nsjDZvytUmAwIjOxCJK9NL6NESG7nhX1JnAI9bBa2
         EmIQ==
X-Gm-Message-State: AOJu0YzAAKVcEG4FT/FB8wnod4cgJqzFkXgqpOY13bk0Wk3/WHt4sbrI
	HX0Uh17oSsk3x4X5vLg9nwoC39uKfUDh8W23v6/ZVrC9sHBo5w8XD6i7/M9cQLytk+l3uzBZO/d
	OL+fEigM=
X-Gm-Gg: AZuq6aKC76RWX5dY7W0URAP/mHp9xlcIrfsQVEZOlgLsTFqsfv4K+WfgsfSQvq9qWQN
	fTQdkcMUfwN8TnRX7oo1bKMomUmOK7jTyku21YO0ILqHkBB3txGih3qC6vk23GYIrA+uHF66gay
	1DpCQrGVCmFZWeTzkd7aICiCaYJc7beDV3IjO4x1SVp9CKJZUAl1znlfDrC6Cr5SngZrQkaC/Vv
	HGzgWcOxNxD2AvFUQILt/VpV1/dxmYBMo0vj1rJQuqAFX2FSZGIb22oWydbkGHIhv3gbjjIwCY1
	lW/gEyfewGYjCoqo/loix1H4MQxNRbCp13ayUgVsQKym+NndN6WBZ3FV0omgoJQYz1kJxq7AyzP
	5Dj526/vroukKzkZCfkNe5l5jqaX5/HXnCffvkME1PB7/6pzFwhcWYhJ79bs+X4UwY2gYDVSbm9
	S4aV3O3K+BEM4K/FED/yn49oGrwkEPMvHcN0S6sPQUEY68L0JkoiLYz2wlj83qKmgVszWEi1zac
	rjICoXKtW3xdQeQY2zENqOtjA==
X-Received: by 2002:a05:600c:8716:b0:47a:80f8:82ab with SMTP id 5b1f17b1804b1-482db48d4c0mr206900375e9.24.1770113966490;
        Tue, 03 Feb 2026 02:19:26 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 06/22] zlib: ignore CVE-2026-22184
Date: Tue,  3 Feb 2026 11:16:35 +0100
Message-ID: <583076ca73722543c358f97a7e476ab3e8a15437.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230434

From: Peter Marko <peter.marko@siemens.com>

This is CVE for example tool contrib/untgz.
This is not compiled in Yocto zlib recipe.

This CVE has controversial CVSS3 score of 9.8.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0592c51b6ad038d737d2f6b30977bd0c5c50058)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/zlib/zlib_1.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index 592b7f14229..ef831421216 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -51,3 +51,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Adding 'CVE_PRODUCT' to avoid false detection of CVEs
 CVE_PRODUCT = "zlib:zlib gnu:zlib"
+
+CVE_STATUS[CVE-2026-22184] = "not-applicable-config: vulnerable file is not compiled"

