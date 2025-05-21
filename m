Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D31DC54F47
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:04 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.4705.1747808403574244871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OVBAsgnr;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-742caef5896so2990921b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808403; x=1748413203; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBI3Bc2vDZl6Jt4cPt9etx33zUGL1L3j36BSetdxOSY=;
        b=OVBAsgnrzWnlmsu6qTN5BDXED9IJANbOOtB/1v8yQ3I8WOHU1ss1P+X4P9l36qO5Bv
         vNhaaiIJM7elug0D3qnGXs53L6FEGQu7bj7ZgnNmKW34jLvDHmh0ObVhBbuvA+6F1uVw
         tOUbITG0kC3Cv5eW89DLRapEUwq45VHoRMptMbsYaKeoLT/LHzB979df9L9+k6BMgV5/
         raFEpBH715H0U/ypvTYwmGtJCwC+eEnkdUTYk6Ck0NNyavtnlX1A4zcLnXKiQU+0wtcw
         eLqplBQhGVsZdBgrKq9NbYlLh5haA0qjtFtbWfhH+5J/kuu4RyVtHZWx/Tw8jU5Pq2Hh
         8mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808403; x=1748413203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBI3Bc2vDZl6Jt4cPt9etx33zUGL1L3j36BSetdxOSY=;
        b=Jn7oX/Fun9/UG/Agg6iinQLQEhloMnS1YGqfIfThaiZ023bkqGNgQqp3QuPIiD4LAU
         u1BYt9RZrn2BsHnX6MZpUA8BIHG3BmLWzMKNSlNEA7A5QRQwDSJDXUoT0GywyuCiqkqR
         tgf7z6dv/QKV4Fjbv/MIOxXEIavISM/ZgxqkmQlvXtStn3Wpxwu4AJKwdzpJc3Oe6Q+j
         iL8Sr7RJopQfztyau6BrwVNRQW8eaIUhcrp1/er/l/L1Bge2A6WGdZYkIelIHFDETg3C
         oqQaKiF+tOHzpzn2yxCXIKFqDdsd5nEsPzDZCvpWk83RHpf1EhNQLtAEgKde5SicP4pM
         Qy0A==
X-Gm-Message-State: AOJu0YyxyBHY6AN2z+Sn5n1pSfTmHP8jLn2U/8HOhYMatjWiLvla4ekK
	cLqh8BrFqp26xcxM5o5+ORJrLG+k8+qy2vK/55p0AheSlHiEesJHA6GQ928aBvxP
X-Gm-Gg: ASbGnctDtspUGYIj+nZZV82orJs3pOGA67C/DxoHLSyLtiNDcdW2wYbGtZMeSdZXN1J
	jP2eH2NsCsq+KCc6/dQM10t97bitWKVmglYms9/PhAKyQxEjShOI11uIzHYLNJfuP9eWkumZP5p
	qapCGGyKJjK7HbaBfCZTVwoKBK4i71qliIeFAdIZBIJajX1iBGlaaHGg7pzGssWJNC648VIXdOW
	gToyRXAVxmIsiu4vfm9rEEfLkkYUW4rD7vshaOVAqPt95nfQT6fb0i4dZt5WYgMpBwNfuiNAZJu
	WgE2bwJZp/OvHsfTb/bFyCUqB9ewaxIlNky1yKm9I9s=
X-Google-Smtp-Source: AGHT+IEPS6jIhxn1kSdneSlBvmNJTvgLzy4I3PHcqmYcVwfyke2suyjHUyp1IHy/bhslK2jjvcmj5w==
X-Received: by 2002:a05:6a20:a12a:b0:1f0:e706:1370 with SMTP id adf61e73a8af0-216219e2510mr31929535637.35.1747808402740;
        Tue, 20 May 2025 23:20:02 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:50 -0700
Subject: [PATCH v2 14/28] bluez: Disable invalid-pp-token warning with
 clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-14-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216982

We add FIRMWARE_DIR via CFLAGS using escapes for string and clang
option parser flags it

<command line>:4:23: warning: missing terminating '"' character [-Winvalid-pp-token]
    4 | #define FIRMWARE_DIR \"/usr/lib/firmware\"
      |                       ^

emitting this warning during configure means some tests fail wrongly. e.g.
test for enable -fPIC -DPIC, which results in textrels in libbbluetooth.so

This warning can be disabled, the string is correctly passed to sources in
the end, so its spurious

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7bae968094f2a272c4deff7416dbd1208549e6ce..5835662f7a63a23915ec4af94597ec4a614a4640 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -84,6 +84,7 @@ EXTRA_OECONF = "\
 "
 
 CFLAGS += "-DFIRMWARE_DIR=\\"${nonarch_base_libdir}/firmware\\""
+CFLAGS:append:toolchain-clang = " -Wno-invalid-pp-token"
 
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.

-- 
2.49.0


