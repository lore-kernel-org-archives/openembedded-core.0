Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7E6C54E90
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:03 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.4733.1747808397871663642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IvwAOePn;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742c73f82dfso2897534b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808397; x=1748413197; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5fY8IJHzXMxLrAcngeOMfmbFGDVEfnjgLOWHaEIfY8=;
        b=IvwAOePnW1SZyv1l0kH9VhFaCsFLk6ppVdXwiBMjh6AvmF4Xn2XF5JF9qNAxBs3gIR
         LPX2Wn5U9FJb7IdB+l28aJFHvDnimmohhXHS3c5bsINlF6WrSFjJ95zkYdFYF7FmwG+f
         2CkeNmQWM9GzHK8+B4hJdiP/x9yGEvntAijDIqJ0K+aUfYD0V5mIwKD9n18Tl5hwg3sp
         EqGpu/hiC4/ZPeHKGWpOfbEjuqzMAU2zzhOe+VjFRZ33cF1IXfl5UdjHoW36gqNGKnua
         PiXFJCSxwpjzw2a0F1two+LVCaTd1dm0F5DZTqZTuiKY6jrAFm7WJ7KlnlzWEGMDpz3T
         +GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808397; x=1748413197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5fY8IJHzXMxLrAcngeOMfmbFGDVEfnjgLOWHaEIfY8=;
        b=l3LRmLD/7cYdlNs8BWiqn4crNp72vh05YTWpkniLrtdYTmHl/qPzp1bIurG4p3z1AT
         seXNEJ5N0+oUqzEzCVFyg7gsUXePoHnYqlpWmyy6vIg6S/gWs1XRDBpiPoYMiMNea6up
         0i2rA0Xl6oXndA0PMS7umiw5xtTAAPbhOZQMhcl1rkqJ3zkz3czS+O0QODwtK1UZeCpa
         fVAcbaVPui1542LN5tG/bB5qSGg0ay1YAvnyGgiCs281LVdrrbslcDRT/iywjY0dG6Bi
         ngBi7BlMRCT8/Al5YoGnfzACLbsAQjPPQK8BAmyeezT+/50NCfca3H6OUz9SNbHqxmsh
         PIMQ==
X-Gm-Message-State: AOJu0YxaMfgiFvoiTNnTuVyLzyv4bgz4MIbGfa9AnzpFY86h2kQ0wAue
	VXqzutzee5+G2tpPBXC5RNMWEQIfFwyLguS6iLDS+1Cmcn8yhOOM9fLa7PtE947n
X-Gm-Gg: ASbGncs2f0LCWrLm9mxVOzHfdHmUD2cK+D4WqeAb4ncKH7RRPRoe2myQeu5bcTEiNLu
	cr/M2TDkOOILtPDG/cLpXV0DVKg3WgIf2bJmKXn+4sVbboohTg/EwWkY+kd5RWoo8sXAKCrEevi
	FQd61PUyd5srn0k7m095VBzzYjcDnjKIzMSl2QPrPxfF1u6t/mJNWvj8hfPgcrzGInnS3xuMXvb
	P6UmUp61RvOn7isdnKQGoLfVnW7uKbYLzp3MfjXO5/ZdbCGIJlU3i5+5T4hGTtpFNZbOBlnLWdc
	iksGVohlzuNaodNZ4qlPYECMk5yOdC6HF3ip+J+/+QY=
X-Google-Smtp-Source: AGHT+IHjALaGiSMaaaLthR4/UF4vA4mCmX+wzqVJmD45Ud2GQGv4AUa/M05IhWqst/r5HK/zXpCkAQ==
X-Received: by 2002:a05:6a20:432a:b0:215:eac9:1ab2 with SMTP id adf61e73a8af0-216219f04e0mr31952098637.28.1747808396990;
        Tue, 20 May 2025 23:19:56 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:19:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:43 -0700
Subject: [PATCH v2 07/28] pulseaudio: Treat -Wunused-command-line-argument
 as error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-7-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216975

This ensures that it does not enble SSE when -msse flag is passed, clang
warns about unused option on non-x86 targets but it must be flagged as
error for configure to notice and fail the check to enable SSE on non-x86
machines

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 18c12ede630766bb9204bb1d5efb7cea8695dd1e..3c65aaee6e02cf417e3165c194353883c453aa00 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -71,6 +71,9 @@ inherit bash-completion meson pkgconfig useradd gettext perlnative systemd manpa
 # if using --disable-nls
 USE_NLS = "yes"
 
+# Helps tests for -msse fail on non-SSE architectures which is all non-x86
+TUNE_CCARGS:append:toolchain-clang = " -Werror=unused-command-line-argument"
+
 EXTRA_OEMESON = "\
 		-Dhal-compat=false \
 		-Dorc=disabled \

-- 
2.49.0


