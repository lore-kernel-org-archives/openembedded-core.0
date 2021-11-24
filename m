Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75ED4C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:57:05 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.6980.1637765824309265072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oMFQY85q;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id e3so11749086edu.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h7c7XUtChFVYmsmv30EQ4ss3mg6/60d7LJfobDFUfN4=;
        b=oMFQY85qtCP/d8QhCHQVqUdJWgUUBlx+9nAcStgE+prsuDmrjk2pFrWnEo5XVpvOPN
         L1g4tuixfQA9n3oaHX3Wv0eDUvE30ur19aEqWWQrDn6XYsGe7AQs+hEzI/7QjZFXmOoG
         rl0bZDz0Uh8Bpfr6+OrNJdrimYyvWp3G730HrIqfYGbHNKFq5Zi/xuX3Jdz+3mab0xrx
         Z+Bzo9O7ZmmZGf6T3QNMAX4l3bkosnuEZEpmrXI7IIVNaH5RxzDjlPt+P361H+NX05PB
         LoK5WrNmsJLSRfUHOlp54J87MXWXdro/B6CDrlDZ+MdBuydoGoo9sp8NVLQTrkQVQQON
         VxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h7c7XUtChFVYmsmv30EQ4ss3mg6/60d7LJfobDFUfN4=;
        b=aNohlfwkRglqfnTTbWJ3nFwDRfzjn1QQxleGmz9a/ATUCMzw4EhZ3UhBUZr5gMp1sk
         0Ho9zxKlcXfSJRnDP97ewpU9uJQ+YtBBZWCgUqZslzdR6GhLIuOzS4is6nWXYHHMlKLd
         iGrxlpGLPJxm5sDQ7Uf53hBVnTlgJ5nqVEyjmwobJco78RN/SFC+SfMCYe/Oybdo8L79
         0SBvm+70R4BIG7nlmxaz3lSsB45wZB3AUutZ5k2zQyZQBi838Ofr04TAcAx6+AS54HmH
         2sUvQtgmslsEQT7+ID/mlVWR4HWK4kFIE+BysfRkm4VoQWrNwLnF7kASlU10tbGme25R
         Z3wA==
X-Gm-Message-State: AOAM532TeGfj7vhADaVyEpEiNTgIxVWte5ZaFW1r3mappITIR9WXCyaU
	E/rqf4SGmCuvNs/R0JQcVF0Pwt0NLlWNNa87LmU=
X-Google-Smtp-Source: 
 ABdhPJw8Dz+Df0HfrB9zjjAYHUSi+WYjVcU896PXVZ1caTuV9ZMo/kU2oEQ7dHxPy5hOaoax5CPEN6VgWUf9bXDmZ6g=
X-Received: by 2002:a17:907:1c0a:: with SMTP id
 nc10mr21231159ejc.211.1637765822449;
 Wed, 24 Nov 2021 06:57:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
 <CAAnfSTuyYHJk6BnGMTMq0_QA7wuxmLA5x0_rwN5Oe_kj3Mc1aQ@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTuyYHJk6BnGMTMq0_QA7wuxmLA5x0_rwN5Oe_kj3Mc1aQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 Nov 2021 09:56:51 -0500
Message-ID: 
 <CADkTA4PEw9R_zCrCV65ehYJq0gkw1yoWX0M3tZXFzvff9bW5Mg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/20] kernel/kernel-yocto: consolidated pull
 request
To: Ross Burton <ross@burtonini.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Tim Orling <ticotimo@gmail.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:57:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158711

On Wed, Nov 24, 2021 at 9:46 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Tue, 23 Nov 2021 at 21:57, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > We weren't able to even run the validation at all, due to the kernel
> > calling pkg-config directly to check for libyaml, which is the target
> > pkgconfig and failing on missing dependencies. Rather than patching
> > the kernel, I've finally given in and made the do_compile task set
> > the PKG_CONFIG variables to point to our native-sysroot.
>
> The correct fix here would be the kernel should use $PKG_CONFIG (or
> ideally, BUILD_PKGCONFIG or similar for host lookups) and then you can
> override it with export PKGCONFIG=pkgconfig-native.
>

Agreed, that's what I was referring to as the medium term solution. Once
I get 5.16 working, I'll look into sending patches upstream to the various
bare calls to pkgconfig

Bruce

> I see that some bits of the kernel already set PKG_CONFIG ?=
> $(CROSS_COMPILE)pkg-config, but others directly use pkg-config.
>
> Ross



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

