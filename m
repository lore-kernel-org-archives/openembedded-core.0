Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CAFC52D70
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:08:58 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.70828.1722524933434852645
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 08:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dUWumkZX;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7a1d42da3baso491610885a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722524932; x=1723129732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owxsp6s5e1yb0jbZcD4q0wfEGsGu/rpnZYcCaMWvTQk=;
        b=dUWumkZXfJsIVBRTTP9IOy/pgVjk1yVWgOKQmBwbcGzlQ2fW6IogpzYpEaHQb1ClVr
         k2FeCLqUPDUITlX0XZtN56GTdCJdryG2turZncrBFJvaZE4BJjhcLkIfV6ZbbpYtVxcn
         Zpe9vg6+9TKkiuLRbKJ5QQtt6ox6kKLRrC7xCyt1jnb361Npwn8tOFpfM3WeXN/j5qML
         UvxGpT78nPQk9Vff4ntvc5ouUy0a6MzUJHhPyXWABrQ/apQX1i3dTtqOQOjpoG03Xo8f
         zxR54OcXEuIWAvcSYX3T2EexioDvF3XMKSvHuketzIDo/Kkcru4VOzGKK2vkpJDv/Hzg
         1b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722524932; x=1723129732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owxsp6s5e1yb0jbZcD4q0wfEGsGu/rpnZYcCaMWvTQk=;
        b=EBaBlDLGYT2mLX9eWu4dHwB55I+QEgDsTT3Fchc0p/zhmbVfEJJjTLv3ccywILrAsY
         j1EG+PTfZVaZNEbmunCdcnz2FuYrf4zMfkegMSjynK1DOGTPkAp6hcptGuTW6ILjOzJJ
         /XNoRBGroYWGu/rVdNn+NnjcpU0TCuGixa5HYh8I36edgQoi/o5L6Q679xP+aBtPwrOg
         HtGAIFpdHQwzVX+QELQqiBPOwLzaOSTbjy+Bb4rWTXRDPOkbcUSlBnCNxy2Q9LxDbT3H
         j9g3XGu+4aOz/zORrDaT0BL3GZHcv5jTq8W9KNNeb5kaGoDDvPcFAKk3RDN9WJJd0oMj
         jhxQ==
X-Gm-Message-State: AOJu0YxVyHq4GA7e115m7pb6newc8nBV4QhpZbi15eQaoxV2ra1cGaf+
	U9jhMciHPR+wk60QB80g39t2R79GvKxLVweQBvZM2+si0JRAyR+tmZEt1SBG
X-Google-Smtp-Source: AGHT+IEuEXva6K+5uxyagLzwqRQylzNkE+pUl4KgF0ORXzJKyhPKzSwMzhvFl7g4t976lwWAcBemCA==
X-Received: by 2002:a05:620a:2909:b0:7a1:dfe4:5708 with SMTP id af79cd13be357-7a34ef027c1mr37137285a.16.1722524932184;
        Thu, 01 Aug 2024 08:08:52 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73b5003sm859343985a.43.2024.08.01.08.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:08:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] linux-libc-headers: update to v6.10
Date: Thu,  1 Aug 2024 11:08:38 -0400
Message-Id: <f0e9fc1183fd22e44a0f01998c09323b833d1249.1722524523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1722524523.git.bruce.ashfield@gmail.com>
References: <cover.1722524523.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 15:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202745

From: Bruce Ashfield <bruce.ashfield@gmail.com>

6.10 will be the reference kernel version for the fall release,
so we bump our libc-headers to match.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc                     | 2 +-
 .../{linux-libc-headers_6.9.bb => linux-libc-headers_6.10.bb}   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.9.bb => linux-libc-headers_6.10.bb} (80%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 23a4ace4a6..c6bc80c542 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.42%"
 GDBVERSION ?= "15.%"
 GLIBCVERSION ?= "2.40%"
-LINUXLIBCVERSION ?= "6.9%"
+LINUXLIBCVERSION ?= "6.10%"
 QEMUVERSION ?= "9.0%"
 GOVERSION ?= "1.22%"
 RUSTVERSION ?= "1.75%"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb
similarity index 80%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb
index 7ebf63a051..9484083948 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb
@@ -8,6 +8,6 @@ SRC_URI:append:libc-musl = "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[sha256sum] = "24fa01fb989c7a3e28453f117799168713766e119c5381dac30115f18f268149"
+SRC_URI[sha256sum] = "774698422ee54c5f1e704456f37c65c06b51b4e9a8b0866f34580d86fef8e226"
 
 
-- 
2.39.2


