Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23845E7D0D6
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 06:58:41 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.15770.1695365915014619179
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 23:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wkn3eBLo;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c008042211so30225291fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 23:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695365913; x=1695970713; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OjJWM4wf/wdDyd8UV7JVIYR0J7YI4ASBoIxjCjFcpa4=;
        b=Wkn3eBLocBslOZ4t32/hWiVvZV36EFXNX+Ro+u+fem9+vcu35Wc8wrzxYuD22w3hli
         C561hF6jQLmcnM9OeOv+jZgnxz53rfqkF9wT3lT84mB5Nk+Qx89F5hZvlNHWtK5JwFJ1
         CynjUx5bZKQn0BkfsuY1cQMzWEqKGiF4WSJD39awMLb3hUr7hK0aH8l4CgR9V1lyYIG7
         dR4jn//9rFUqvVjitQNyaGT5C0fzpuarRjkt55joQNX6EY3vpc2ixGFk2Afo77bNkBOQ
         GvoCyVkz9P8YE5JaJqmGPuh12Bs6hgTka76RQoUvVUaUmFdR1JVZpwJGyse73ypACnLh
         ssoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695365913; x=1695970713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjJWM4wf/wdDyd8UV7JVIYR0J7YI4ASBoIxjCjFcpa4=;
        b=vfjoP7fAkYRmQgj+oQ5eP5J/Hj8vpW2tidGis7PFZPinD7qaCl4nW57vENTyc80G8y
         SNVBgcxYWNs3Zyn+3saEOWOtXEOapCMb3zrTF7FuNyfVvBZi6+XUrnyFHEsi+bTPLwAb
         mqw66iKwYbmqVPAC40JCAN41SBbGr+LQ8kk/n6FKVnHvAygKtq6KINy32cV3RIk23anH
         v/9uWIGbPsToWB2D5LAuDgpnovJEHoiDZJ/gByykAcrnYoFpPFj7hRs9Z5RGADAb7sfV
         uCk3G8YGZjkw8y5r9tDW+MotaGu9Gs+jaQ097QIcw5yZxuyU1ymzP2joQDfXDvoJGpTN
         HFnw==
X-Gm-Message-State: AOJu0Yw4HCbbqREnU0lb+xBK8bOQbL4xHhOAwVbld9BNw8oW1iNKeIlM
	z9IPtcd9BuTgVpTlasZsmEGh81hrKKpAb0qrkho=
X-Google-Smtp-Source: AGHT+IFGJ/xtwSGgw9hq/kZPw6LA7bS7RtEAjujdYCLNPuYYlWUQb25SCkJbddHllGtcydiXWBD7kZ9AR7+XvBeM9CE=
X-Received: by 2002:a2e:804a:0:b0:2b6:e105:6174 with SMTP id
 p10-20020a2e804a000000b002b6e1056174mr6714293ljg.47.1695365912981; Thu, 21
 Sep 2023 23:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230920181526.386874-1-f_l_k@t-online.de> <2023092114422322cfc0b0@mail.local>
 <20230921205944c6389866@mail.local> <CANNYZj9JH-gcfAQad2y7SQuq2aMQ--=8J65xe--fW2gG3j4=TQ@mail.gmail.com>
 <20230922064202279c2c00@mail.local>
In-Reply-To: <20230922064202279c2c00@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Sep 2023 08:58:21 +0200
Message-ID: <CANNYZj8HJWY0npBhqjFSU3Y5SjdDXttXrtYWnYsyk=r3G0zwOQ@mail.gmail.com>
Subject: Re: [oe-core][PATCHv6] vte: upgrade 2.72.2 -> 2.74.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 06:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188044

On Fri, 22 Sept 2023 at 08:42, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> IT was on v3. nodistro is not an esoteric configuration. Honestly,
> while poky is great for testing, this is an awful distro for an actual
> product. Way to many features are enabled for most of the embedded
> platforms.

Right. I think there was a misunderstanding there, and what was meant
is 'plain poky'.

> I agree and I don't expect anyone to test mips, ppc, musl or x32 on
> their own but having a patch building fine with nodistro is a basic
> test.
> 32bit is pretty much alive though as we have seen new 32bit SoCs getting
> released this year. There were even ARMv5 SoCs released just last year.

No. Absolutely not. I strongly disagree with this notion of imposing
arbitrary additional configurations that 'must' be tested before
submission, be it nodistro, 32 bit or something else that someone
thinks is important. The only expectation we should have is that the
submissions are tested on poky with its default configuration, which
is qemux86_64. Anything else should be exposed by the AB. Otherwise
the barrier to contributing becomes high enough that contributors will
give up and move to Debian. Or buildroot.

Alex

