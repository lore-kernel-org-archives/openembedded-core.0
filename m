Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48294C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 12:47:42 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.20782.1679748452302225897
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 05:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VrkV7QVB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id v4-20020a05600c470400b003ee4f06428fso2448329wmo.4
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 05:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1679748451;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KAkeFQQgWq5nLuMUgQiww0GleLGKb9XOERhLoWMY8yw=;
        b=VrkV7QVBGha4eUySxf6HEjryNIiPbG51CqK4RsoXHLpuY+z652f47aWhTr6eoljPME
         Bc593nNX8lwxhWZOkjlJZQ/TO7guMCpAZ0zN70937o6mOd2iSasVAEVDsyqRMz8t0iub
         aYlsckW0o6Hl18r8UOVmtaO0OyM7h0cpZIAcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679748451;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KAkeFQQgWq5nLuMUgQiww0GleLGKb9XOERhLoWMY8yw=;
        b=tE14Pc41zqPYKrWL8/cNZFyHbuyr9qO2uCggdwGAYyofTLrfrdbvvgqQzld/yWJiou
         Hoc/kGPpfe2ROgBnyGB3day3U9PFuX1fIXFHKoaUILau6UYTIaccS0ko5EYXXH0PoLQ4
         kMUqPmlPOlLgeZHK/F/aMkDyiCZSVsTnYkrA9LIMKpokOHSBXBo2HBhaHNThlGSb/f66
         u/UZ1mSiekaGCIWH/5Bgk9ahbQBXcv6TqYT4g2lmeOSLwkl1MYQ0cxir6JoZgRjfkluW
         zvQ0mUaL8T02pjch/zs2CPAX4x/JqGJBF0woL8SAGTs6TV8PrVex+/OL1KX3THa2yyo2
         zbQQ==
X-Gm-Message-State: AO0yUKWayvVJIf72Hm8nhDWeadyS2vvEpco1EqgEoQ/VY4oETECu5kB+
	0lyXh7KMDjSMF5CzPGYdW6hkzw==
X-Google-Smtp-Source: AK7set+Jy1V7CMGRk6rorZERM3c5Y4s+b0iD2bP3wkM3J8M+LhOdtz/4gJcZ9TN9t/HQsOqrIfARYw==
X-Received: by 2002:a1c:4c11:0:b0:3ed:b6f3:8388 with SMTP id z17-20020a1c4c11000000b003edb6f38388mr4853187wmf.12.1679748450722;
        Sat, 25 Mar 2023 05:47:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b5aa:4d6f:dd37:6d3d? ([2001:8b0:aba:5f3c:b5aa:4d6f:dd37:6d3d])
        by smtp.gmail.com with ESMTPSA id c26-20020a7bc01a000000b003ee44b2effasm7839091wmb.12.2023.03.25.05.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 05:47:30 -0700 (PDT)
Message-ID: <9c9a087685d2bc46b55f2713ea2dd60b7362a4e4.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/7] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 25 Mar 2023 12:47:29 +0000
In-Reply-To: <cover.1679670268.git.bruce.ashfield@gmail.com>
References: <cover.1679670268.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 12:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179095

On Fri, 2023-03-24 at 11:08 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Richard,
>=20
> Here's the latest round of -stable updates. Along with them, there's
> some fixes for on-target/SDK builds with kernel-devsrc and fixes to
> ensure that 6.3+ works against the upcoming release.
>=20
> I was out of the office last week, or these would have been avialable
> sooner .. I already have more -stable updates pending.
>=20
> I'll be sending hardware reference bumps, and updates to the LTS
> releases in separate series.

There is something not quite right with the kernel module builds on
5.15 (poky-altcfg):

https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/5639/ste=
ps/13/logs/stdio


make -C /usr/src/kernel M=3D/tmp modules
/bin/sh: -c: line 1: syntax error near unexpected token `('
/bin/sh: -c: line 1: `if [ "gcc (GCC) 12.2.0" !=3D gcc (GCC) 12.2.0" ];
then \'
make[1]: *** [Makefile:1797: prepare] Error 2
make: *** [Makefile:5: all] Error 2

Looks like a quote went missing somewhere?

Cheers,

Richard


