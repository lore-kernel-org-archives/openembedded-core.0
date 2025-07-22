Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73000C83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 01:38:19 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.2867.1753148293523598139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 18:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LiSfP3S/;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-237e6963f63so29417525ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 18:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753148293; x=1753753093; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0NPNWpFSK0nKR5k9M5zpFELneyCLGrKXGH16FlChwaE=;
        b=LiSfP3S/mA32zKUBXH9EOvsk1ZAoSAP5sYhr2MVYdhJocr3GebtXln9li1TjsNOMTX
         xvyINBlGEXnSc56G3iAzsRUuO+zN0OyXl5Y+Iht3H1I5+PYidcDaWCX/Kp/+ZnHW+z7u
         IkoIoMqGpui41aNFztwQJvFWN3FUEpdr4AioOmQPi5B7Q9H6PFox/V+W8KX7sHmOmpfV
         WJiRKtRGBINEG+C9W7wlPMA556zj+A/YIraxggdikBCP8Xi8k5W0C8bWiH2ZCrmwTGGH
         E780N6RudYjpCrSMR/cJPkNeKA8klgmufu5hKjL9GD4f/JJlk20JwU16SAawNUl28dVz
         0Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753148293; x=1753753093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0NPNWpFSK0nKR5k9M5zpFELneyCLGrKXGH16FlChwaE=;
        b=ArcVqY3BEQT0cdkXAs2Vpa2qIDOrWCJwRSj6zF+QGoqmXpiLgY+p83iO818q78rPLE
         IwtxDqooNbLUDllRjWnY7liJyBVRgSvl30cQNgImkUPZmG5F9imr7p6zVTxk1lapuDu2
         bsEkgO5gcto1HtEmDKBvA+MdQF04vferQsZrDtQjlUNhre8U6yAX1fG4H5rxUfjzwDlj
         WhaMoYOx/ycgEJH2hdwVGGsHsnvCBh2xzWyDerpTXHAfQ9apZ9MLYw8e1iFBST74/843
         3FngkJ9MWLcTnv2LzBVkwMr4xGMi+K2uQ6oPjiM497bsSXAFF/Nm0Gzz1O4WPhfe2/JX
         8LDw==
X-Forwarded-Encrypted: i=1; AJvYcCWNClWzzfbBqClLtsASwQpr2n8vvpuwswkVZvDy9ZLHCYixCf71on7apcSKA05OdOnLA3c4YQ+a9jO8NJD7g12ePQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyASlxo+zBhkATBpnSTsMZEHEPwmn+qQjPvmF3+vzCsUf2GnISD
	NRd6y+YgiGBeVWMMInSn9O+ixShFYGxe8CiEaWiveJ43BVktbjrgAor4djoRDL6p
X-Gm-Gg: ASbGncvwdi+8gpZvYY1EJzxr7HBjoOuxNpzNMfS9JE4ScKj3OeQq7yyc97nz8QBcX7U
	7mvpV4l1sev1m+5zza272sPSklHGpfik0r+JSfVixLnu25z2KDBVQOiWOwgqVYivA0KBOkLjgPM
	fmc8vSTdJLrL4Q8bjrkXOxJ/A0Fj36YzZ7r5sGQ4zTzHrr6nBMh9FDe4GVq3seHcEypjDki04ct
	fQL6z6BLappHAHyHH8wOEn8LagPTQWF268rm3BJZplGifJ2OSzcHMF4cr36PFr7PJOdb54qejN7
	cdY5rJuixsRbXgbeu71l+3iBkz46etg+q50OoRVa/kdhgZmyRyQ2QFtgb5U5NzEGDfiJ+irwD6h
	aqn2Mr/HR2XO/TrGV5w3RM4QbhqRxoF1gaWC3RM8jCCs6VSU=
X-Google-Smtp-Source: AGHT+IEHhfkz2JQlFgsRcJHNne3qZPeha8GZtT5QqwoLyD+/NnOF10r/7wFL4iMi9+N1j7icj8DaNw==
X-Received: by 2002:a17:902:dac7:b0:235:f70:fd37 with SMTP id d9443c01a7336-23e256c9608mr282085125ad.19.1753148292847;
        Mon, 21 Jul 2025 18:38:12 -0700 (PDT)
Received: from [10.15.13.154] ([209.129.148.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4b0asm64483385ad.100.2025.07.21.18.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 18:38:12 -0700 (PDT)
Message-ID: <fe3e805e-1355-407b-892c-3cf98c118f3e@gmail.com>
Date: Mon, 21 Jul 2025 18:38:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates
To: deepesh.varatharajan@windriver.com,
 openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20250721122319.1549209-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250721122319.1549209-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 01:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220715



On 7/21/25 5:23 AM, Varatharajan, Deepesh via lists.openembedded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> 
> $ git log --oneline 06a70769fd0b2e1f2a3085ad50ab620282bd77b3..cff1042cceec3502269947e96cf7023451af22f3
> cff1042cce Fix error reporting (false negatives) in SGID tests
> 1924d341c0 support: Pick group in support_capture_subprogram_self_sgid if UID == 0
> 
> Testing Results:
>               Before   After    Diff
> PASS          5074     5082     +8
> XPASS         4        4         0
> FAIL          121      116      -5
> XFAIL         16       16        0
> UNSUPPORTED   157      154      -3
> 
> cff1042cce Fix error reporting (false negatives) in SGID tests
> Improved SGID test handling by unifying error reporting and using secure temporary directories.
> Replaced non-standard exit codes and fixed premature exits to avoid masking failures.
> These changes reduced false negatives, increasing overall test pass rates
> 

LGTM

> UNSUPPORTED tests changes
> -UNSUPPORTED: stdlib/tst-secure-getenv
> -UNSUPPORTED: elf/tst-env-setuid-static
> -UNSUPPORTED: elf/tst-env-setuid-tunables
> 
> FAILed tests changes
> -FAIL: malloc/tst-aligned-alloc-random-thread-cross-malloc-check
> -FAIL: malloc/tst-aligned-alloc-random-thread-malloc-check
> -FAIL: malloc/tst-dynarray
> -FAIL: malloc/tst-dynarray-mem
> -FAIL: resolv/tst-resolv-aliases
> 
> PASSed tests changes
> +PASS: stdlib/tst-secure-getenv
> +PASS: elf/tst-env-setuid-static
> +PASS: elf/tst-env-setuid-tunables
> +PASS: malloc/tst-aligned-alloc-random-thread-cross-malloc-check
> +PASS: malloc/tst-aligned-alloc-random-thread-malloc-check
> +PASS: malloc/tst-dynarray
> +PASS: malloc/tst-dynarray-mem
> +PASS: resolv/tst-resolv-aliases
> 
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 0130613936..6ee9fc7a0b 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>   SRCBRANCH ?= "release/2.39/master"
>   PV = "2.39+git"
> -SRCREV_glibc ?= "06a70769fd0b2e1f2a3085ad50ab620282bd77b3"
> +SRCREV_glibc ?= "cff1042cceec3502269947e96cf7023451af22f3"
>   SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
>   
>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220683): https://lists.openembedded.org/g/openembedded-core/message/220683
> Mute This Topic: https://lists.openembedded.org/mt/114266899/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


