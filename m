Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5346.1794386243901849698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 00:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GeMoZXd8;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f8cdd30beso4977689eec.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 00:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794386243; x=1794991043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGTwN3piz8aECWUpe7c8hzhvlJtfopUrPtGWc8F5Q+k=;
        b=GeMoZXd8b3ifXKIqfR+DdtiKrdrI0zEQ0GQlXciWi423ydZSdoofPL8N2CpVb7J0Ud
         MqMGULboEzgd3oI41HdH4HFd0TwXkCgCiTgV4Lh6/DIvZjEXQu0UFBmS0QvAll5zvaeE
         r92+t7I64ti/H3jVfjsyy82L/monXwjRSme3/4XOvZjJW2cxaXhQQdl6ysb2eOGVxpPb
         /bQyBstXwcyd1YgxfaOcwIrYKGUnQD5DLo/VOZZ/LcYw2c7M2/aEsSPvbIiDlKS1ncSK
         19NtMHvizhqaQOoOquiPZQ6Osu64ltg/RAju+g91AvtYEI/omRbVnG6WuK/NVd6A/wNV
         imRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386243; x=1794991043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGTwN3piz8aECWUpe7c8hzhvlJtfopUrPtGWc8F5Q+k=;
        b=ez3H3z9sEpSUKjiLoZ3SCr9t6K0eUMDbFtkVKZWybuKjKPfEZPs588qVcxUxmuT/J+
         GAMXHPcmlJkVIeP3dwM0l3nfxNQ+8ObGviMsGXITd+FSIEygogs53IVqkVohMEQx7jvd
         AHo7e2zItrM/HRPyhCrbjGzG/VTMgJtFT6NlpiKaBPPzRL/GU9V4ZvX/oucbVyleVZ9q
         Kg9YTAf8HkVAA/K7A44avWMtR/ZrhziZQmAPpAqduqynTjiD89I4K3g7rchbOn3t9OEX
         VPgFdPQwDeS6kiZqu4TI9pMhwY5n1F2NYk8S3q2MurOf9xlgF4S2q6yaIju9M8o1AGa9
         VYbg==
X-Gm-Message-State: APuU4Z/8ROWEol4NMCnBkhXre5PJpQZM69+r9dcmPII7xZeU/xdmQlow
	iGAKonGc3AAt5CHR5MqGURtNW5/F7k5H9sNIxEZLXbgLYQ4IkXmPqE+4ZZtSzKGkmoQ2Iw==
X-Gm-Gg: AYBFou26WUNgRoTU9esUeyC/Oo1TwzUZaZeDChbDsmBbit6n2ssveJpyy/gmfjRcs09
	LWMXTdm+ZpUSb4Hnmt7F/uVvuS3/c6A0ohStM65wE9la4xfPHFxQB5HIrZKyF1K1lZmqfUwb8ub
	BiTTaS2IMAtWqbutQ3HirEf0m7ulEbWsdcGYQP81uwD08bmA/K8nwEVU3Nbc0UpGXMuOnFIqZks
	9jyk0jVAI40IZb9RW9i0DrV4HKOlj6JM9FNasP4uaKU/2zZv6GGt0MWbnXt8293Hv7aVIBIGILL
	PVFjvAuBFFoejN9qNaFiqgW5+cIl3zYHldq8Wsnwo/Bh6wsi5FfviqgrbkPT8/Q2K04LJ3tMJoM
	Kau2zasXLgZrCZ3hgZoCBdxE9OTzBv+qcmbgIafvk+Gdze2Pr2LbzEFT7HvbN7Fbj/WmusgT0kV
	+5zc1NyQXEkzJkKwd+Mguiecc8l/t35xVdnMF23RLdFPjOzVwYYUacj0IQ220ouk0NMVOChzAb2
	W2uLLSi/WSNpjWV6rMQbP55GG7h3XZoGHqDMWil+QWNlzXF144qq2p7blRsBrsS3d+RGQzvm2HP
	BaSz3XqcWibnqJOlTn3Z4cBEJvvNyRbWpsxVAxQ1Fo0T1aqmHkopdyHN1HcYmoUuY7+dMNGPYiZ
	lOcRTAwmKts3Ap1ruGLzNbIdDr98QLZIN1s7GTxfKGIKUYpqcl+Ej+l7kk3JPqDY5Kyo0SL0qQS
	4K/TkPbj4Mf+BqOWbCj+NUM4c1Nm3+Xo9bnUHBKm09KZGGfGP7FWqzKxpMigvChsDqNzGTIMjK8
	eT2duV3lZOvu79YhIF6EZhMpPblOL+CYsWH8X5QrxwatdyWX0CIWdabCy2H4c2XWmKGK2Uf1h4W
	2FS8
X-Received: by 2002:a05:7301:3f19:b0:36f:3da8:dbc8 with SMTP id 5a478bee46e88-37686d31fa8mr3236805eec.31.1794386243203;
        Wed, 11 Nov 2026 00:37:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm14504599eec.7.2026.11.11.00.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:37:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] musl: Disable FP contraction in yn
Date: Wed, 11 Nov 2026 00:37:10 -0800
Message-ID: <20261111083711.549321-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111083711.549321-1-khem.raj@oss.qualcomm.com>
References: <20261111083711.549321-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 08:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249969
Content-Type: text/plain; charset="utf-8"

clang contracts a*b+c into fma by default, unlike GCC in ISO C mode.
That changes the rounding of the yn() forward recurrence, and
libc-test math/yn fails with a 3.2 ulp error when musl is built with
clang. Turn contraction off in jn.c with #pragma STDC FP_CONTRACT OFF.

Tested natively on aarch64 with clang 23.1.3 and gcc 14.2 for
generic, cortex-a57, cortex-a72 and neoverse-n1: math/yn passes with
both compilers.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
AI-Generated: Uses Claude Code
---
 ...-math-disable-FP-contraction-in-jn.c.patch | 34 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0005-math-disable-FP-contraction-in-jn.c.patch

diff --git a/meta/recipes-core/musl/musl/0005-math-disable-FP-contraction-in-jn.c.patch b/meta/recipes-core/musl/musl/0005-math-disable-FP-contraction-in-jn.c.patch
new file mode 100644
index 0000000000..f87f9752e2
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0005-math-disable-FP-contraction-in-jn.c.patch
@@ -0,0 +1,34 @@
+From 3c36c2969dc3bea32d7e465428f7b2c78787de77 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 10 Nov 2026 20:13:06 -0800
+Subject: [PATCH] math: disable FP contraction in jn.c
+
+GCC does not contract floating point expressions in ISO C mode
+(-std=c99), but clang contracts a*b+c into fma by default. In yn()
+that turns the forward recurrence b = (2.0*i/x)*b - a into an fma,
+which changes its rounding. Built with clang 23 for aarch64,
+libc-test's math/yn then fails with
+
+  yn(6, 0x1.8c5db097f7442p-1) want -0x1.6dbc18f9d5ddep+13
+  got -0x1.6dbc18f9d5de1p+13, ulperr -3.219
+
+Turn contraction off for this file, as GCC builds already have it.
+
+Upstream-Status: Submitted [https://www.openwall.com/lists/musl/2026/11/11/4]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/math/jn.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/math/jn.c b/src/math/jn.c
+index 4878a54..b077f02 100644
+--- a/src/math/jn.c
++++ b/src/math/jn.c
+@@ -35,6 +35,7 @@
+  */
+ 
+ #include "libm.h"
++#pragma STDC FP_CONTRACT OFF
+ 
+ static const double invsqrtpi = 5.64189583547756279280e-01; /* 0x3FE20DD7, 0x50429B6D */
+ 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 0be24b22f1..ff8a08337c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
            file://0003-tools-version.sh-fall-back-to-VERSION-when-git-descr.patch \
            file://0004-math-enable-FENV_ACCESS-in-expm1-expm1f-hypot-and-hy.patch \
+           file://0005-math-disable-FP-contraction-in-jn.c.patch \
           "
 
 PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
