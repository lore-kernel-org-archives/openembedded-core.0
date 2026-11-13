Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13793.1794582836899801907
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 07:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0ZGo4ZEm;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: michalwsieron@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49412eb1474so529170f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 07:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794582835; x=1795187635; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNrg82HviHrfndm7V9OddM+smAcyv2mIt4HmcFt6DYI=;
        b=0ZGo4ZEmfH/sy6GybMB9MT5o46hDblJYyRn+axm2P/wWpkyxgdN96mRUXbEwbkWY/4
         8Ym9c671ZF3S8n8K4QYYBxAPxQJcuH78Ww4vVpN0JYeMRWBPhyH+45CMtaENZHt1l9MR
         PBro02NKp+36f5zBwdy7vH4PKhozS4+qV7XPXAQ7LcMXLEeJbth/x32iZTjSbAUv1xHz
         suSupE4KB6pEyaP16AnVUqI07ebZn9vKr5a5VtduBYENfWU2EO9R0Zv1NzhoYDc5fVjX
         VXrSOMSW9cJbqfsZN8l9dwirL76u/JAPnc2+6UOu8Mm+vVmNm+ynvGRcxzF47fcgb88U
         N/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582835; x=1795187635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNrg82HviHrfndm7V9OddM+smAcyv2mIt4HmcFt6DYI=;
        b=0mEkYgtKZgdXiXkX3upnWg9JdKLTsDWh3Y7MA5p+5YOEMZw7IzhXaw2peNIPFNB9rJ
         llWaFc2QrNbdZXBoDMiUW6VFXRP6X0hfq7I47FYj238EG8a+XZcNphd5BUQZuGKf+5ZH
         SOVIemhRs3Ah9frhWTep8+/tJbQy9R7/hVZs+YwJqB8wVEim1kwr54mxRBGIuGI1QVhk
         dHwvLqRN7goMk6g+YJQ9gUPdQ7t3AU21Q/3Bfd9Got/ihD/FTIGVWcVz5lymCf5Z/rMa
         Bb2WHnL+Fy/PR5nSGiNyPtGKypgIGvEuUfWv4ICdiwO4KduZv+vsKGmx1x5kVwS3XMzL
         PDtw==
X-Gm-Message-State: APuU4Z/Y7f+Qu7BB1n4tzrXJNlY3RrpvZ9kv6FM3+DJkkABgviEIKAuj
	JQfZqFs4mzUU7TbvHMvIxahCN3kSQXscDLxT/QRPbaxQ1F8DYpBts5c+UPwZyUSy
X-Gm-Gg: AYBFou2wlKdXMMk4ZZShSDh1JqrG7SXWoTy7/PlKLuaLDHDbpEFn+8BzO08fxHwW12c
	xVxYprv7JcyPRme9plxl1QZAHCE6ttQ1x3NIQWo21Hl8QgKQcQ9M+XLe4w9dCZ1Cgir/Uqr1VER
	GiFoLQ5J5BanshQF5s02X83uj1C9PDi2nJpiHn8+xe5iwZl+oDGWNs06B7MVjrTmIza2FeUfWx+
	XesXt0FXTsIhGvhdWcu3B9UPUlru4JJZVXj3Meqbq6dlpQYIYn4fS6NlIaYfUvEFNvaKnWOwqOK
	uI6/bvuhrcgcJGTvDkSxFye8c32oCqG0Wktj2cGfzCk+EwD4ruEf5ZRWL818ygQsELDXdN4/Sqx
	rOKrUSq31zGJIcDwMIkENHcA13JPdpRap5q29KSMIuLnL+Kevt/F1CG3naj0MQoQVRnPuUT1q0t
	iCroIu6I1BlS3bD0WuFsL+oAJFQZe/Sa+5axJRY30acBzZZuXnRYyDYkhss5sKXmfkYOJphdD/S
	U0O0QWj/JUPm4eI0dDB9OdLmWIG/Z95lctrskQuBDCtV8+xP+CNZlcWuXg6UESeejo+jibSxF6W
	lYLCvFcDcilDXHWsdQ==
X-Received: by 2002:a05:6000:46d0:b0:494:6f49:246d with SMTP id ffacd0b85a97d-49c723fc541mr4590498f8f.24.1794582834994;
        Fri, 13 Nov 2026 07:13:54 -0800 (PST)
Return-Path: <michalwsieron@gmail.com>
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8c248sm5633781f8f.58.2026.11.13.07.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:13:54 -0800 (PST)
From: Michal Sieron <michalwsieron@gmail.com>
X-Google-Original-From: Michal Sieron <michal.sieron@nokia.com>
Date: Fri, 13 Nov 2026 16:13:22 +0100
Subject: [PATCH 1/2] rust-target-config.bbclass: Add i128:128 to mips64
 data layouts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-msieron-rust-mips-llvm-v1-1-cd3b005bd089@nokia.com>
References: <20261113-msieron-rust-mips-llvm-v1-0-cd3b005bd089@nokia.com>
In-Reply-To: <20261113-msieron-rust-mips-llvm-v1-0-cd3b005bd089@nokia.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 15:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250185

LLVM 22 added i128:128 to the default MIPS64 data layout. rustc rejects
a target spec whose data-layout differs from the one LLVM reports, so
building libstd for mips64 fails:

  error: data-layout for target `mips64-octeon2-linux-gnu`,
  `E-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128`, differs from LLVM
  target's `mips64-octeon2-linux-gnu` default layout,
  `E-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128`

Add i128:128 to the mips64 and mips64el entries to match, as already
done for the other 64-bit architectures. mips64-n32 is left alone.

AI-Generated: Uses Cursor

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index fee19a1a64..1faaaef33d 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -225,7 +225,7 @@ TARGET_C_INT_WIDTH[mipsel] = "32"
 MAX_ATOMIC_WIDTH[mipsel] = "32"
 
 ## mips64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[mips64] = "E-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
+DATA_LAYOUT[mips64] = "E-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
 TARGET_ENDIAN[mips64] = "big"
 TARGET_POINTER_WIDTH[mips64] = "64"
 TARGET_C_INT_WIDTH[mips64] = "32"
@@ -239,7 +239,7 @@ TARGET_C_INT_WIDTH[mips64-n32] = "32"
 MAX_ATOMIC_WIDTH[mips64-n32] = "64"
 
 ## mips64el-unknown-linux-{gnu, musl}
-DATA_LAYOUT[mips64el] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
+DATA_LAYOUT[mips64el] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
 TARGET_ENDIAN[mips64el] = "little"
 TARGET_POINTER_WIDTH[mips64el] = "64"
 TARGET_C_INT_WIDTH[mips64el] = "32"

-- 
2.43.0

