Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1953C369D5
	for <webhook@archiver.kernel.org>; Sat, 26 Apr 2025 02:35:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.2862.1745634930913373333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 19:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zk65lQgt;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224191d92e4so33231645ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 19:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745634930; x=1746239730; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBkwLT9bTW0yCG7yXoRZxZWuOaQ478+t+6iA5sufD5Q=;
        b=Zk65lQgtKw4laD1pvtzTFPzgDfsQ3xtyETkqu7wK0kFfnQVg7AxkJBxJzOHCXDo5rT
         hCpWBA3yU4HIui3L51bSaklhPakONm4SmHFb28PCKY+z+1eac29iZRGBcjTnYfZAj9xU
         uNBMWGHxT+fyJTnNVQqkhQeClsMVQ2Pdja0r3qeJHlNkxUIcKeDcjBQGiLuIsJ0L/VKR
         Ut5eeWLhgaibzwZAyN01Q/s0XWeuIA3Fvwn3ce4fJrpfFqrvZ+eYMCknNsSDQofMwvLA
         WWBFjR+zzlICtJBpEoXr6saUuxWftDJ+ZMQd8RK5dS7faYKY/YzHorgRjXdqDPXire5j
         7dMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745634930; x=1746239730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBkwLT9bTW0yCG7yXoRZxZWuOaQ478+t+6iA5sufD5Q=;
        b=vHnp8d6GLEnE1a7tmXLfXAyagm7dWwhCvUtprO5vVam9vIvE0ndgv7aXeCr22GdVdy
         G/XqK457VVIn4iccMatw7vW7r470QmTx12NQ/gg5nd3ku0WNKvR3+/kDOCD0uhfVlId7
         mRcfi7N6JER23ZBEYBUiiXZUcWxZ5F7Ml03U7GREJl2vKnEuKIRSgDAvSMF3LsLWxS0R
         Q8enbfdOnk7s2lyVZjqHpXYroG4oDhqJrqSRNuoX7ZTq1TcbDYYUnmNerF9U5jWNW+dx
         DGEsQQ8ZPTWOfrkyCJLGU0ehd/zLa5WZAiQH51i6RsEf+3Fld/b1Z2LYW7sJwZEGOCOv
         DFZA==
X-Gm-Message-State: AOJu0YzO2ubUWAgx6Uka15zlpAjeZw0ZRIYAs3mnuMouaM0jCcFO/OxR
	heImOGLR/tHMzdiM8Wz+dFQJz14WqfdwDhJb98i3IC8p5V+EPDjcybmbpEoN
X-Gm-Gg: ASbGncuWD6aIg2CbJ9PnP4uAk0Qe7ShcLOoPGggdOhpcIXKsk3dBHLIJhStSpemWo0m
	xKpOvK1eu0yDmOfUCiH0uDInnEz7YMxx6EsOhfscME8j+6FpSGEsaZQzYxYnoMONHGg25UPH2VD
	+NmJ1ursJphrzr78XiMHDGs5qh6AnEjs3VaN0wqiOL0fP7RyhMv5unQyVwfU3nve8X2ZiR9Cr0k
	LNzrQKMBKWcPQnJxD94qkPjMKdfv8Nnx0lhqtB+EKQ5F9zPWgwqaKJafI9MhBk2Bfqv5uZRMwG5
	1MzSuCN21gkNM0FPw4snaXz+Tl+i57UzAH1XAjZRQmg=
X-Google-Smtp-Source: AGHT+IHg67F7jFx4kYI2JrXsJQt9LfXvU4OaMGjWMz479G2RD5tFrSZPSs4JYButdBRftCivkz1eSw==
X-Received: by 2002:a17:903:19c3:b0:224:2384:5b40 with SMTP id d9443c01a7336-22dc6a09678mr30919885ad.24.1745634930071;
        Fri, 25 Apr 2025 19:35:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db97b3sm40057475ad.55.2025.04.25.19.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 19:35:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2025 19:35:10 -0700
Subject: [PATCH v3 08/10] mesa: Pass needed clang flags via
 BINDGEN_EXTRA_CLANG_ARGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-clang-merge-v3-8-feea6f07d130@gmail.com>
References: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
In-Reply-To: <20250425-clang-merge-v3-0-feea6f07d130@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 02:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215507

This is needed for clang to find the c++ headers when invoked via
bindgen

Fixes
| /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
| Unable to generate bindings: clang diagnosed error: /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' file not found
|

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cd0f02c6d7b7c8de37bdb1695abc70d95f99a919..3ebd96fcb04b5612b293794ca4d124f1d932f54f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -233,6 +233,7 @@ FULL_OPTIMIZATION:append = " -fno-omit-frame-pointer"
 CFLAGS:append:armv5 = " -DMISSING_64BIT_ATOMICS"
 CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
 
+export BINDGEN_EXTRA_CLANG_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}"
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 DEV_PKG_DEPENDENCY = ""
 

-- 
2.49.0


