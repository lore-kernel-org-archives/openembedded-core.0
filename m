Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web09.5624.1611622207853986515
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 16:50:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P5vVyZ7N;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id j21so4119780pls.7
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 16:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nq/XbqG0nDlqiuAhlTXMHNBtvxovpGdQKsHnjEI/5pA=;
        b=P5vVyZ7NlqHf6OrDqBJ0W9EHBGqIWibOLx0uXgX5l9mnTOcw/RFw2mh2tUngp76GJd
         VdaL+zFQlkI4/kRgHeaxeflRAG5V930zWEkMlIXFbQqe3HO6AXuOBLq2omrSP/svgdmj
         EJQ8nYy+w3MfTZOOpvK9B+sdNL15tiG4uN4RdQNn/JaK/uBCUN1MrYWhK3h4YXBiqI4T
         9Mlot3qvCWJn91rDCDOnDLRpVSI0VZhZUfDZFyRexo8yCeghrJGNPX9d578dg6r1K6wF
         diZfHMKt+RSlwys2uzTSFKdVJQ3olI8hXa9xAA8fyiyEOUZsUwfJM0I76JGKWqZmTV77
         97DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nq/XbqG0nDlqiuAhlTXMHNBtvxovpGdQKsHnjEI/5pA=;
        b=JLyKpnclBilZ9FVD7Jrt8FCXCfEdt2PxcGujF1n3LV/9wXJuLofr0exgt+tV6+TsGS
         elq80/cpeaQDweqSc/F5UfUZ3d1myuDz9XJxOY4lavKpufmky0DBJhJFLYh8dBwvEX2R
         I+D/El/IBOJLKd+9yPOYvZU0SO8caMzILjVNLR6iEXN+mkkuQZMPeXAts4NMHmYMF6Gt
         qSkYUyLAk3Ohj5QBi+xqCrAt43wTbCbPCnFa9OWa9l0suNdYLkSEhW+liSEDrg/tHEhE
         7Y7ncnqOtWyElOQX8LLF6O3QnRWbcXRXEQHmYBRheDAeLgV/uCwPb0NVB0KeUXioJlf8
         iRRA==
X-Gm-Message-State: AOAM530GX8poFOz7O7LXZex4RsJACU1lJ1PTnEwWA5m0DB0HQW75wNNv
	+ZfKQ1Ler/ZYPzJjHLKVwzDpBFcUWJ8WAg==
X-Google-Smtp-Source: ABdhPJwo2HKdoGTQinvxvaiRqXjE4PmSXGygmbmGS7XQwTutZwm7fb51eKZh/J0Mrt4o/LqowhX74Q==
X-Received: by 2002:a17:90b:4905:: with SMTP id kr5mr3076023pjb.1.1611622207225;
        Mon, 25 Jan 2021 16:50:07 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b408])
        by smtp.gmail.com with ESMTPSA id fv19sm492344pjb.20.2021.01.25.16.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 16:50:06 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to 1.2.2 release
Date: Mon, 25 Jan 2021 16:50:04 -0800
Message-Id: <20210126005004.2429001-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Detailed logs are here [1]

* 85e0e351 release 1.2.2
* 3953aecb fix VIDIOC_DQEVENT (v4l2) ioctl fallback for pre-5.6 kernels
* 30f55067 fix v4l2 buffer ioctl fallbacks for pre-5.6 kernels
* db981ffb sh: fix incorrect mcontext_t member naming

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=1e4204d522670a1d8b8ab85f1cfefa960547e8af..85e0e3519655220688e757b9d5bfd314923548bd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 0a43ca2826..249ce53521 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,9 +4,9 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "1e4204d522670a1d8b8ab85f1cfefa960547e8af"
+SRCREV = "85e0e3519655220688e757b9d5bfd314923548bd"
 
-BASEVER = "1.2.1"
+BASEVER = "1.2.2"
 
 PV = "${BASEVER}+git${SRCPV}"
 
-- 
2.30.0

