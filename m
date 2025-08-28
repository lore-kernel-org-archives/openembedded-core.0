Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2206C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 14:14:45 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.22040.1756390484575840166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 07:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=km21s42u;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7ace3baso170398966b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 07:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756390483; x=1756995283; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PSCXHpTkQN6/ryCOzd7LJRhl4XQLFa/Dryx2wNCppZI=;
        b=km21s42uC3tKmc6gygrA93r/VRsRTx+nKGctk93/Ax0FipRNEmt6AZoaKLyFmII5fS
         Jb1aHQal91vEUMwJosg0z7zgNvbfivDWsMFJVctUD2UaEZfP2xrgNRkxi2SWzYkDQPCd
         n6ccm4RZ3OxuQ9E7DRwZhuyiOdIFtaQ5PpVTfw+o/dIGpe1APnqpgCsotBJYIQDC9X2P
         vm1nfALaeINZNZJsCYWTW9EKDKTdLDKBqeo6uB9D+J/6I2myaoXDyA7lAQL+3kcsLBJx
         YajlRReZQRcHYPDEliqC8qE6xSWukpkKQDLm0LTz1NYRVWWComwPnQIuz1gHnEfBg1Wt
         eFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756390483; x=1756995283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSCXHpTkQN6/ryCOzd7LJRhl4XQLFa/Dryx2wNCppZI=;
        b=bscxTVI9nxfBC21wzLIT3iLzNtNXQRR4E7l+vdAmDIohfx/7sr6yU6O4/7nky0mpBe
         ZG+ko/Egea/4d/vdW6HmkeswMWKjgc6x14BQUvIUgR6t/Uj8HKEH67t6Xe6qyVkpy73M
         YGweyNdSrIx1VnRsL27/AUlcJpskWZO48z6gqBgkowAsLriNdQ61X9wgAgINPyr9tkEg
         9Vg2uNKhtPbHZH2KafIIEz9mgFjWnJmx3RdaQ+Mm5gk53zEF4iUFmes5Cw7rW1FdjGLN
         pvlKiGu7Jg6d+Gt2dQ+W989JB5gTPRT5tRenIAsiLsBgqhVDcL9aIPkExrX+tFrouWsz
         RRmw==
X-Gm-Message-State: AOJu0YwI+xLhQ4xWBckoJk3/pXeV4A+TQO187D99G6ndWD9ZCKKPuM4j
	OH1E6wUAdkuN3PK46oIilgTLRkAgM83SFsZv8hNSvF28KVoPLTx7ivW+FpfVKw==
X-Gm-Gg: ASbGncvhdh1jCb4O2EoFheL7cKSW/Q42yRLvxKNmycmDuq2CyKH8kf4x4zm9jIRSeJW
	rpM6KoC4MUNer3FW1RyOIMWi12SQAN8luP+A9/j8ScDfEfDRxmyJcWQ1Dda0SRYC9s20VkbumAJ
	OhYuY7J59wBt+7IP4fG7YK2dBAzsu2GrBAyNkAIULKqq/soEMHe7JO+QxClON2oPNe97//f8osk
	YAV8giQHI/+bfey9Eo159co6hS3bN3G6a5ypezJ51BrmGjZqDzPlsKmFccfEcQzkNHPkitk+PcA
	MbGvZPGVnN+Kgr6TNphojcoJDUSdHEQt9xrqsj7pKjy8t/oczVg/mjn3LMXF5WZb7harlg5CQ9i
	2kCe5K7TkY53bcTvXcTDGv0cB3tPkVIo=
X-Google-Smtp-Source: AGHT+IHOwFtGG5k8qQie1JBHODofFHmkcKdh/HJ50/feB0hED78OslAl5QzipUJrP4WpHthEwa4UCw==
X-Received: by 2002:a17:907:3f10:b0:afe:e4d2:5710 with SMTP id a640c23a62f3a-afee4d268f7mr238843666b.40.1756390482667;
        Thu, 28 Aug 2025 07:14:42 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe91744c66sm747238766b.88.2025.08.28.07.14.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 07:14:42 -0700 (PDT)
Message-ID: <b0663efe-d450-45d1-a6d6-43d29f0a1878@gmail.com>
Date: Thu, 28 Aug 2025 16:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] apt: upgrade 2.6.1 -> 3.0.3
To: openembedded-core@lists.openembedded.org
References: <185FF3BFFAE4AAAC.31147@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <185FF3BFFAE4AAAC.31147@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 14:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222578

On 8/28/25 16:13, Gyorgy Sarvari via lists.openembedded.org wrote:
> +From a6b024ceb71c43977838d625f5ac64b7e4815a56 Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Thu, 28 Aug 2025 08:11:58 +0200
> +Subject: [PATCH] fix compilation with musl
> +
> +The basename() function requires the libgen.h header when
> +compiling with musl-libc, otherwise it complains:
> +
> +error: 'basename' was not declared in this scope; did you mean 'rename'?
> +
> +Also, musl's basename requires char* instead of const char* argument:
> +
> +error: invalid conversion from 'const char*' to 'char*' [-fpermissive]
> +
> +The musl implementation of basename modifies the argument only in case
> +it is a folder path (it cuts off the trailing slashes). In our case,
> +when argv[0] is passed, it is always a filename without a trailing
> +slash, so just cast the argument.
> +
> +Upstream-Status: Pending [account registration in progress]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>

I plan to change the status of the Pending patch in the near future
(once my Debian account is approved). Until then it's RFC in the worst
case, I guess?

