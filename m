Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web09.1313.1631041306980730887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 12:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hhpZJuAR;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 4so6476869qvp.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 12:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1C5hKwkRCAV7N62BLPoDiOIW8GMupdX5wjgItDnPZHc=;
        b=hhpZJuARvO9HGTDj34bnCBYcGrwPe2RmdkQsItOYYxl9/e24HVCPC62eUHFp/WxTAc
         cSsJqu0S20q1wfUtO6HiaGC2WRTRMli6jDYxqgqiQYIVnws+Ng426PxbMgYfAq4SbDen
         xidyf5xG7Ou9cj6eErmFZU+IZ2ODePuk+qHO5oct7zkjYx5aGPiUwP9fRghiOoP2VQnO
         wu7eKVCW5I4SjtQH0X8go1y+aUB//hM4vppN0KZgzL1XKQbNu/C6Q3pAZo4yiOreLal1
         GIfqtPoj8K4pg76ClT3ND+kKY2dN0jB53dqnmYW7DgggnZqBtQNbjUWi+A0BlrIOm9NJ
         FO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1C5hKwkRCAV7N62BLPoDiOIW8GMupdX5wjgItDnPZHc=;
        b=bCm1herONEz6ITeJF2XqO1pbI6nl7GIT+2qlM2xm86ZinHnJNTe+yV6OPSDrjlPsy4
         3bwXAy4pSXBqslJBefGwQAKos5cR1VfYOy1f6Sx7n9XSPBaowy1U+Wa8k2bMpT5OuSAX
         HTFUelDI6KWZMPje/b0oO9Zb5/hqGmY2nD6JwLP4DCoT1kRYKMjJnjPK/sOCHeui5FTi
         g7NKaiH18eYJbtTi2pIR+gOnNuBKBpiK8WrSTxi8UL00T1FuMOIUD4HiR4rZ8MdqF1VJ
         ykAM5MyZTlB4MdOwWxB+pjvY7PYSWRgkIByV5ZQ9n6Jyy52QpMa5TNlkqDQdSrBZw7hb
         Ya/g==
X-Gm-Message-State: AOAM5326cgSTrEQGUnhiEQImAsEm3n2hOA8ocS9ISaAQn1T9F0Gzc69O
	PFpnjRazC6LRhWMcxzwlZaK0Fs3SZAd9dkFfUEw=
X-Google-Smtp-Source: ABdhPJx1QbswURdpZ2+8+WBgyxqJgYbqXyP5V+5QkLP7CfjIQIBBefkmKQZmuYo37OE1BYAlfWp2skC/034jmCP7Vc0=
X-Received: by 2002:ad4:5cc2:: with SMTP id iu2mr18776008qvb.41.1631041305932;
 Tue, 07 Sep 2021 12:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631006167.git.liezhi.yang@windriver.com>
 <ed036834262a67e88a58001d20c719bed37d50f5.1631006167.git.liezhi.yang@windriver.com>
 <945b8038-97c7-1264-594f-e3b424695c22@windriver.com> <CAAnfSTsq2BtJb+PbEj=Yf0E8V=hs6DzDiv5YwRLaWkmd_w3dag@mail.gmail.com>
In-Reply-To: <CAAnfSTsq2BtJb+PbEj=Yf0E8V=hs6DzDiv5YwRLaWkmd_w3dag@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 7 Sep 2021 12:01:20 -0700
Message-ID: <CAMKF1srnujBBbhA2st_5qV9RV8ehX_CkSVzoGhOyACO=c0ymow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] assimp: Remove it
To: Ross Burton <ross@burtonini.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, Robert Yang <liezhi.yang@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 7, 2021 at 5:10 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Tue, 7 Sept 2021 at 13:04, Randy MacLeod <randy.macleod@windriver.com> wrote:
> > I'll look at the sections that you have pointed out later today.
>
> Debian is always worth looking at when there's license issues.
>
> https://salsa.debian.org/debian/assimp/-/blob/master/debian/README.source
>
> Specifically:
>
> https://salsa.debian.org/debian/assimp/-/blob/master/debian/README.source#L81
>
> They strip non-free components from the tarball before importing into
> their git repository.  We can delete the same files during the build
> so they don't get redistributed.

yeah that seems a sensible approach to me.

>
> Ross
>
> 
>
