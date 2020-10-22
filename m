Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web11.1898.1603394519087580669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 12:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tIgOdMvg;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id 144so1798212pfb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 12:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:organization:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+pAretan5QBZ8b+6zY/Cre3PYLKog27W6n94ikJO3n4=;
        b=tIgOdMvg4PCHZT2PMVHFjFELgBDHCLf5iGxNvbI1iE3SmAXdI02KrdYj3O0LNsgFgt
         xGvZVwcheMHHntB5jXXh3mKKIjrRNT0rt8ega5MnhwD49U0yd/CBStOrRcbLHTCOO8Tk
         Zof2czihrXQUrUEXyeUiAxX1CTZ4u75RrsIFfvLNAxA6odLI2CpR/n5nA6jxDCkXbYf7
         Av921fMRfCn8UR8PckvWC9MeM++0wawckxsp3PqBs8hAe+5ExfaJjgM6H08VJC9v5uWw
         HmxzMPVcHWufYWYIqFsa0iQJUS7qnv2dMQ/78xF4OYpuw3OuV3jb6++xvT49NMafbmUp
         I6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+pAretan5QBZ8b+6zY/Cre3PYLKog27W6n94ikJO3n4=;
        b=fT1HBy1Um9rcihITHk9Ry7+J0g/L5LwNhGtglScBmWEM3ZEldstdCw/a4tvza868KD
         vAPOdtXr9MeAxpVQHUCrLf2eBgVVYa6oFZqsRqv1x0lGFLqB7/gITXTAGOF4qkEB2ZUN
         CzlYJfph7kRogzGWOZi9Uh6+Gat1z8gUTwvwhoSw4LIfFeAbzurErNhgOI80fVDXPHlJ
         rBJcjU2t8RDYrcgMVGUOrdT+XRDb2dKDrThpn1qmO1HEP2rEVNIDM8M+PZwcUZrrkQSx
         Wpucwj/ojczUCb9CuruQeQpnsGUCbpVlLcgGGHPEshKp4TWHGOhRLgwqjI0/YC1SUS6Q
         4mTg==
X-Gm-Message-State: AOAM530NNbNZ3JEHomH1raCBlWx9S/PUf7KFUHzorLEoubwZ6vj7S9Rk
	u+MXPBhA42Bq119iAPJIrHl+NOeDRqiVQQ==
X-Google-Smtp-Source: ABdhPJwT5Y54+EJgkYoA9NQaLyAFIKCRKNoFsAnRaRrGWDQIR7LWkbNi5NuSlpc//TGjivmjjOrYiQ==
X-Received: by 2002:a17:90b:1186:: with SMTP id gk6mr3749225pjb.109.1603394518266;
        Thu, 22 Oct 2020 12:21:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:913f:dc36:bf23:12ab? ([2601:646:9200:4e0:913f:dc36:bf23:12ab])
        by smtp.gmail.com with ESMTPSA id l199sm3252669pfd.73.2020.10.22.12.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 12:21:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20201021210932.984184-1-raj.khem@gmail.com>
 <d4a88c9df72243f4e334d3b408200062b6113b59.camel@linuxfoundation.org>
 <CAMKF1sp+iH=H3yTPWSr_6iSJK2F0yDGBHk59K_zq4_6JYLwwUQ@mail.gmail.com>
Organization: HIMVIS LLC
Subject: Re: [OE-core] [PATCH] multilib_header.bbclass: Do not install the stubs for non-multilib case
Message-ID: <16daa853-ba5a-af7b-40f7-8b4e757848be@gmail.com>
Date: Thu, 22 Oct 2020 12:21:56 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp+iH=H3yTPWSr_6iSJK2F0yDGBHk59K_zq4_6JYLwwUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/21/20 5:01 PM, Khem Raj wrote:
> 
> 
> On Wed, Oct 21, 2020 at 2:47 PM Richard Purdie 
> <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
> 
>     On Wed, 2020-10-21 at 14:09 -0700, Khem Raj wrote:
>      > We mark certain headers which are not usable in multilib case through
>      > this function, this however is a unnessary indirection when building
>      > distros without multilib feature. Additionally it also addresses a
>      > case
>      > where we compile baremetal software e.g. bootloaders or BPF binaries
>      > e.g. which are a different target effectively but can be built using
>      > same toolchain with some flags. This does not work when we always
>      > install the stubs since the stubs require a fixed wordsize definition
>      > and that may not be true for the BPF cases e.g. it will work fine
>      > when
>      > multilib is enabled since that would have provided the headers it
>      > needed
>      > say for 32bit multilib. Currently they go missing for a non-multilib
>      > case and we end up with errors like
>      >
>      > recipe-sysroot/usr/include/bits/long-double.h:23:10: fatal error:
>      > 'bits/long-double-32.h' file
>      > not found
>      > > #include <bits/long-double-32.h>
>      >
>      > Therefore lets install these stubs only when using
>      > multilib in distro
>      >
>      > Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>      > ---
>      >  meta/classes/multilib_header.bbclass | 4 +++-
>      >  1 file changed, 3 insertions(+), 1 deletion(-)
>      >
>      > diff --git a/meta/classes/multilib_header.bbclass
>      > b/meta/classes/multilib_header.bbclass
>      > index e03f5b13b2..9ccdf46be5 100644
>      > --- a/meta/classes/multilib_header.bbclass
>      > +++ b/meta/classes/multilib_header.bbclass
>      > @@ -6,7 +6,9 @@ inherit siteinfo
>      >  # all of the ABI variants for that given architecture.
>      >  #
>      >  oe_multilib_header() {
>      > -
>      > +     if [ -z "${MULTILIB_VARIANTS}" ]; then
>      > +             return
>      > +     fi
>      >       case ${HOST_OS} in
>      >       *-musl*)
>      >               return
> 
>     I have a feeling this was written specifically not to touch that
>     variable so that a multilib build can reuse components from a non-
>     multilib build and share the sstate if you configure it that way. This
>     change would force *all* multilibs to be stores as their own sstate and
>     require their own namespace.
> 
> 
> In practice either you use multilib or you don’t such a usecase is not 
> that common besides perhaps testing scenarios and maybe some OS vendor 
> test farms which considers all sort of combinations
> 
> And in some cases e.g x86-64 BASELIB gets defined differently if you 
> enable multilib or not so I guess we already are not reusing sstate 
> between non multilib and multilib builds for same arch
> 
> 


I ran a few combination builds without this patch applied.

build core-image-minimal/qemux86-64

then add just following to local.conf

require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

and rebuild core-image-minimal

here is buildhistory-diff output ( before and after adding multilib to 
local.conf)

http://sprunge.us/oM7Fg3

It ends up rebuilding all target packages inclduing some cross packages 
e.g. libtool-cross, native sstate it still re-used and that remains so 
with above patch applied as well.

Therefore this patch does not make things any different than they are 
currently.

Let me know if I should be checking more things.

> 
>     We may therefore have to find a different control for this :/.
> 
>     Cheers,
> 
>     Richard
> 
> 
> 
