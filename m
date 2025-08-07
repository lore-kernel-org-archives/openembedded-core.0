Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B26C87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 09:57:39 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.47566.1754560649001695104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 02:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ToecZWfc;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-7075ccb168bso8080506d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 02:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754560648; x=1755165448; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DxbaTJ9nHWFKoaz8dKBwKGaDlIDCtZtbv1dmAU0dQhg=;
        b=ToecZWfcqKecd1X/sGrjiw/BNwO/9RMexvbdsJHB9qCmo3AgCTa0eAW0fTWA4RHxNe
         F+8gAXUOq8KASR7GZf1eZtF93HjxpBm/6RjPLJhJ8dQffFDcef/GuhFWK6zuZ5/IrS7A
         YeFjjo9r6UQqClJXzjLZiA2Or+f59d+uQUvb54kC6/ntMwPx5CYocZIWXCURKADmiS2a
         aEIcdfPjTtcHl40yTDln9pg6mPH1D9Nw2fWkq2kErVW4g5IPX9CTE1+ybRbE2+LKQQ4H
         MuMw6MLYCniEBV5JDOq5xO0ez1skrNuU9YdAABF+8bV4xQv+6K7w9naLrfvyoernXycO
         27lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754560648; x=1755165448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxbaTJ9nHWFKoaz8dKBwKGaDlIDCtZtbv1dmAU0dQhg=;
        b=MQHDWVXP+iF3Kyf6TmK8iaURUQNveWYpjLU39dai3WiGJfZRlg6IH476dxLJCm9+HF
         /P3WFSZfoXmoPWnxKvvpb2i+D/a9+DVg+T8p0f2FKBM5G3An6ndAdGTgmR8gTQTTtBn2
         vPgdNZRrm+pNsXGUtlGokHi+OzJvjn5SWyYU2CS7SYw+ptLyVsA3jW3PvPSN60m6MBEY
         nygP05hKYFGJzzSpTnOj2UdVMtjh/NdxKh0FogRb1Ax0EhWW1oxSkHbFkq9A9HWajsLH
         bhrUypLLpM+DgWL1+jr8BRqFCHWHnZsjM8Qvl1QNwtY8VGfg8hf4SqtszSmNhJsCYdXT
         dsFA==
X-Gm-Message-State: AOJu0YzFRtAhoe2aoCLxA3Sh10bTd7qMDa5gETnza10OgsSKh42XDQf7
	qX95yo2by6VSp6oRct/TCZsq9pHZptMO/7kBaAhM4vbgSgGT8VYD3Oh81YSBc9zwjzK4kPukCCa
	r/54E+WDQA0QsmwdePcV3epZzr35hVL8=
X-Gm-Gg: ASbGncvMhgDNgn6I7Mb4ycFFh3i8UisbfSFI/rDWlUYj0t2CADufxHbpd5Q/IUOgA0Y
	BDh3FwoBoN1Edc3x7216YqEc8k+zkcemvRGhTJD0g+LtfRBrJMDQC38Wc6E74wWohMqYMiA0G/s
	AX2cF2q2HdYKk3Xh6oF4mO+63S0V00SNzcaIji1dAB0bb+3DtHvmL4dujnJoKtbKQziBsEO+cwh
	I5T4fUkpRO6AQOmOI6jHHQq3kiBHqbCwlhrkgTk1g==
X-Google-Smtp-Source: AGHT+IHGzXTYoxfnE0wndKfqqIRT8TbwaQDMGyY+p9zSPl4H67fW3DzJWppC5OG0lD1OSuAbWIHOpNJbRGVOtm/10tk=
X-Received: by 2002:a05:6214:246f:b0:707:7cee:4fd with SMTP id
 6a1803df08f44-7097ae10932mr82040676d6.3.1754560647984; Thu, 07 Aug 2025
 02:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250801042242.3076232-1-raj.khem@gmail.com> <20250801042242.3076232-3-raj.khem@gmail.com>
In-Reply-To: <20250801042242.3076232-3-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Aug 2025 11:57:16 +0200
X-Gm-Features: Ac12FXxVRNaTdSsrJejrIDLbUXGcDKSLyrNrw4oLif2FQ4SWWanQzTbSwOl4_c8
Message-ID: <CANNYZj_aGce4mmz2P+LUHZdDYGVYQ1sOSkdcOdn6-mTY_USk2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/7] libxcrypt: Allow undefined symbols in
 version scripts with lld linker
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 09:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221560

On Fri, 1 Aug 2025 at 06:22, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
>
> Unlike GNU ld, LLD defaults to erroring about undefined version symbols
> add commandline parameter to sush lld here
>
> Fixes
> | x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'crypt_gensalt_r' failed: symbol not defined
> | x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'xcrypt' failed: symbol not defined
> | x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'xcrypt_gensalt' failed: symbol not defined
> | x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'xcrypt_gensalt_r' failed: symbol not defined
> | x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'xcrypt_r' failed: symbol not defined
> | x86_64-yoesdk-linux-clang: error: linker command failed with exit code 1 (use -v to see invocation)

> +LDFLAGS:append:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"

Wait. Why is there an undefined symbol error in the first place?
Shouldn't we address the error, rather than silence it?

The same question stands for similar patches for libtirpc, gzip and
binutils-cross-canadian.

Alex

