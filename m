Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E41D5C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 21:49:21 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web09.902.1643924961115407926
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 13:49:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AwI6zCVT;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id o10so3291460qkg.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 13:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6kcM3dvLn12MGWWTSPYZaZKQyiWzioybN4dZ+3pWre0=;
        b=AwI6zCVTSzBGMN1+i8RE6X730sbNevRW28DTSbubBrVt3GPqS7OkWrs92VgUQF/Hgj
         mobgopX74EeLbk3gZfE1wtbnX0KaDa2ty+AZeCc+Rp/uuCRGqFQbiKw58MXmxYwm8rhV
         4XuRE08G3LhyVYCvBUaz7Y0sidLO02xTDh6ZBAUqfFN6aBRHImB47HRNdflALvMLjJbd
         hdSLqr3AgPNTyfKg/w7IJp6+ChyionSkZLR+jPclPJhU4kQQTN5qjKLK+KexH5cd3INt
         Dy7FoEBBkv4E9n02gW+5rxqB/G5gRaS0QKk2Ab5aQQgJ/YC+M7hKSl71VLWk2IHalztD
         7PYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6kcM3dvLn12MGWWTSPYZaZKQyiWzioybN4dZ+3pWre0=;
        b=oHZvp2uWGt2B/NzpUmktzYIiEq7wLod/jcW05uVJ1ON5c6ZFSgdDa9ZEeb0KyiLqzI
         pywsOiKp+FUxq2Mx9zKH4y3c71jIqIN1CtZSMfduEXr3afCSpiXNABvh3dTmJ+KOfX2l
         PJreP1tIHMWNXF944D+VnlWtVqLqLF5DUF9RH5VEStAmtaGXM2JxBPY3MLGCaJIcLY6T
         HOwF5R6NmNI8bnCjvJKBcUzDvDKoNXEK9UNiJEaGA8w+GH/vRCnAp9QGNRCJ1ryRj7Vw
         hhzo5JiQgwMhW/2SUzRGeaio65bPexDJ6EemieUO3Vb3Nx0gbh2MVaXShQyE4wyE/o6v
         O4qQ==
X-Gm-Message-State: AOAM530ftB6QGHq25heBKrVXUqcq/8trJKdGU/X0ybuD9t+FbeKG880j
	GcF8yq9bvnjOSNiFK/L0u5WQx4oJTnmaVoql/BCUJZKUK5M=
X-Google-Smtp-Source: 
 ABdhPJwOf+NT130B7S1sNWrsvvt/07aurG7RCSSg9nPhf3pbHg+QJCl0j1qU1lFuNmAwblGE/K7Wwok77FXIJT+cupY=
X-Received: by 2002:a05:620a:2010:: with SMTP id
 c16mr30511qka.149.1643924960130;
 Thu, 03 Feb 2022 13:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20220203172619.1299363-1-enrico.scholz@sigma-chemnitz.de>
 <CAMKF1sqp=KjKrgVb-FCLr29UTmxaGQ4_w=qrOU+6wvdR5NA_oQ@mail.gmail.com>
 <lyczk37hnp.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyczk37hnp.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Feb 2022 13:48:54 -0800
Message-ID: 
 <CAMKF1srDD92NHeTXrkseFjzt0FCWNNrHDfBr7EM_vMasxnFxew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: enable zstd compression of LTO bytecode
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 21:49:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161321

On Thu, Feb 3, 2022 at 1:40 PM Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
>
> Khem Raj <raj.khem@gmail.com> writes:
>
> >> gcc-10+ supports zstd compression of LTO bytecode.  Install the
> >> corresponding package to enable this feature in a deterministic way.
> >>
> >> NOTE: previously built LTO object files (without this compression)
> >> must be regenerated; gcc will fail else with
> >>
> >>   | lto1: internal compiler error: original not compressed with zstd
> >>
> >> in this case.
> >>
> >> NOTE: it seems to be possible that zstd support is enabled non
> >> deterministically (perhaps by host system pollution).
> >>
> >> I had the problem that the SDK gcc was built with zstd while the
> >> cross gcc was built without it.  Libraries (built by cross gcc and
> >> uncompressed hence) could not be used with the SDK gcc.
> >
> > this means regenerating entire shared state isnt it ?
>
> yes (at least when lto.inc is used (which is *not* by default)).  When a
> bad sstate really matters for 'master', perhaps there can be wait for a
> change in glibc or so before applying this patch.
>
> Or do you think that adding a DISTRO_FEATURE like 'lto-zstd' would make
> sense?  When this flag is missing, '--without-zstd' must be added to
> EXTRA_OECONF.  Also some early [vardeps] must be set (where?) to avoid
> the sstate problem.
>
> Globally enabling 'zstd' appears easier because drawbacks (costs for
> compression + decompression) should be negligible for zstd.

I think switching to zstd is fine.

>
>
>
> Enrico

