Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2937C3600D
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:34:03 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.43715.1742834036496248052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aqpyd5Hs;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301493f45aeso7586344a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834036; x=1743438836; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODXxWvP4HWzPBkGkhwNrzbEngbHRZuQJJTKVQYwBOw4=;
        b=aqpyd5Hsp9DnnwuKRkeTpM+TwMrhcfWMuD1kZ0s4919p+UpXP2Q7XP0c/PTRgrxn58
         qlIejfaYG94sSomW0/uWEJ/OYhc2hjwXFyyplFfMarp19RxGaDZn1hRmbGzD5zMAMYCM
         /2BUty8rPfd5kI/RTUUi6778yMeGxiyE9O5Z2B6OctSBY0k9gGciKvtKUKK0N1flUhlk
         2Nmn+MEa6CdAy98qBZEjmhnIsKBEwB+b2pcXxjagYCTuj5LKBhxmkY82jao7cqF70x35
         F7B0/6nALx8lsTzfdqZwYdHgiyvAAONxlVgtO0ilpPQ63NEBfkyOrY17OQawz2Va7nJU
         Iysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834036; x=1743438836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODXxWvP4HWzPBkGkhwNrzbEngbHRZuQJJTKVQYwBOw4=;
        b=mQnQ8tS2TK20eWiZnZYKPYx+ryvdPCUdQrb2LaKbthueskNH3EFNYxjSGDF3+nzmod
         7MV1kaflphSD3gHdy6t4m+xVmkf1aNmp89O0wSQMyk7IIo1n+I9HMoTiiuOCl1RorO9K
         FUXWR5iNmF3HA1G3qVcOa3Zb33RcBp2801VH3RM/6WBvWI73AykcjxdyRjcQPv/D2cd8
         /n+g0hvTNrT2lAjezdXl9GusSSkBQ65yn49udFR3WmU3kBpqm/KyCw6uNM9M3M2skpma
         Uo18qZF4x/bulJOqFrNHm5+ZtMs+Jomp5bWWa1eSZAEkd26vGdkyz2zy+hE9t02ThefR
         GOJA==
X-Gm-Message-State: AOJu0YwUhc54uHZvMpkZV+lQqzp08XWDnaykaxJmEaZmm7Ftv6JBDwmE
	cNpWlJ/i059R2nBf2kWkfRCHMl/dGF1FQknsk06cxIPxTHwXKCLhhaULITZe
X-Gm-Gg: ASbGnct4/Hp08nMFQobRwlXr0EwehHvacIrp1Oks2mLMc/SQaB820k/nwwqcYwiUO28
	dCSi56UUhI5njl66QykBe+/YUq3MK1rXXQI8G7S9jaQzH7g8p6V6P4uHclcpPJ5kD7fkZn6vIgV
	XEtrBWFWH5x+Zz/2qE2UThtsEyNzoEpmBm/BYfyzDy4qf9HxdsZsFLxx/KoZlpzI87I9zzUwr2K
	vDD9BedjvRbiOm8zlwWucbx8hic+UKBIq9NtG/WspsAnMdeIjZWnU5sueJbC3wPiwnX9bKmTGRU
	/UD79K4tYZ9876P2vJ9caB68pHpLUJKU1pZus/bxDx2d5do=
X-Google-Smtp-Source: AGHT+IHwO8SfwGAB09azwXzSo20YXTopxop32Wy0PJcOtzYvqUCYILhTeKPlCpnvoXZraf7zp5eeHQ==
X-Received: by 2002:a05:6a20:9151:b0:1f3:47d6:aa05 with SMTP id adf61e73a8af0-1fe42c6bce5mr25835398637.0.1742834035690;
        Mon, 24 Mar 2025 09:33:55 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:35 -0700
Subject: [PATCH 14/21] ghostscript: Pin to C17 std
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-14-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213546

The code defines a custom 'bool' type (as an 'int'), which is incompatible
with C23 in which bool is a keyword, and trying to use <stdbool.h> fails
because 'int' and 'bool' are used interchangeably in the code.

Add the flag to CC variable, since CFLAGS is used by both c and c++ compilers
and clang++ is less forgiving when C compiler only option is used on its
cmdline so it complains about -std=gnu17 and bails out.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
index 1d05945c30d9dc3cf3cd2950edef4788df643e29..e937f04cb3826da151747ae8aca59b3303d2e61a 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.0.bb
@@ -47,6 +47,8 @@ EXTRA_OECONF:append:mipsarcho32 = " --with-large_color_index=0"
 EXTRA_OECONF:append:armv7a = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 EXTRA_OECONF:append:armv7ve = "${@bb.utils.contains('TUNE_FEATURES','neon','',' --disable-neon',d)}"
 
+CC += "-std=gnu17"
+
 # Uses autoconf but not automake, can't do out-of-tree
 inherit autotools-brokensep pkgconfig
 

-- 
2.49.0


