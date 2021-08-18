Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.62053.1629324162881548907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 15:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NuhAnF8H;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id bj38so4841682qkb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 15:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dkukoCOOL/dUx1LE3qX/CdDSXdKHJz+mu8ua7ylVqAU=;
        b=NuhAnF8H/DEUJ0Jd7I78W4AFgYBIEb0kW3TXVzBw3QySJjRqFt75JReKC16coZXSHI
         bOcox5amOwvUjqAWGPD4NIenZ0MK35j1yV5CEpEjR0EItYncExLQr7/h3LlySqPpJFLt
         wO5Kq/Nv1IRhkS6O4yN5Y8c/nlxVBJ/0qh5d2GqXVngO0yUAWOi4DQHvFV1tnqdcfFaj
         u2UcUhZAE8R2Pr4gF/L9u8eicrqOGAb5bw/XeHYjiERk0KJPDNvMq+DE1xkcYH8uKtuc
         z+ftyoRM9PNwqjPqIrYhbFGfb7VPwLYn0d9rqt9fgU7OMbD1ee9H9ikXksyWMyaCclRQ
         zuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dkukoCOOL/dUx1LE3qX/CdDSXdKHJz+mu8ua7ylVqAU=;
        b=ZGnfLnuGHl92RyzRX+pC+t4KDBiP0aqd9DmDLxBsUAmfe+o/O3+rzbM3Qqi8t3Eo0m
         6lxLlQMkpR6akrBY9YDJSICxafM9BTYcN7ihnulzYQqQi9xmsKquAPYPvAio9Juwqjwa
         UHiKs73jOeNURFaLaV484P54HIVyK6yE6nGGcumia+vF1SkGGEQRTKWQUoNXr3JvrlmE
         PoCb+lbHIZtAKzSd7Ap9f4grDYznjsjkS3B2KU5gmyxD/vVYYn3xqwK3ALK7UoYTEXn0
         /cGR9KRTECfGY0oaGpEpB15EwcGn/5JlP/n5SX0qt0S4JhDSuSE5J21Zy1wqrsFNxRv7
         Q2ag==
X-Gm-Message-State: AOAM533xqMeIuk6aXTcW9zp2MxckJDrR/0/rOc65yP+9QCUOokhd+Nna
	ZH4C+0zjlTgKUgM+qd54Nh0OidfVoW382O2x2mM=
X-Google-Smtp-Source: ABdhPJyC8AzXE3hwtT7Mfo9EXHxrq5flQJs1PjlTRSm5VBfncxjsgIObamWWWip4cJlgSvxf5lIXuXThjF43n+oc3nA=
X-Received: by 2002:a05:620a:88d:: with SMTP id b13mr475778qka.125.1629324161829;
 Wed, 18 Aug 2021 15:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <536e91b5-6c16-aeb2-f534-edde8601ac84@windriver.com>
In-Reply-To: <536e91b5-6c16-aeb2-f534-edde8601ac84@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 18 Aug 2021 15:02:15 -0700
Message-ID: <CAMKF1spD_gnPW7x5st-5i8VC2wpLmOFGKF9K0iKSSSR4xB=wbw@mail.gmail.com>
Subject: Re: update glibc to HEAD of release/2.34/master to include fix for CVE-2021-38604?
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 18, 2021 at 2:40 PM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
> Hi Khem,
>
> I was going to apply the commit
>
> glibc is currently at ae37d06c7d127817ba43850f0f898b793d42aea7, 8
> commits behind origin/release/2.34/master as shown below.
>
> Those commits also contain the fix for CVE-2021-38604. Should I go ahead
> and update:
>
> ./glibc-version.inc:SRCREV_glibc ?=
> "ae37d06c7d127817ba43850f0f898b793d42aea7"
>
> or is there work in progress to do this?

Please go ahead, also add the below information to git commit log.

>
> glibc.git$ git log --oneline ae37d06c7d127817ba43850f0f898b793d42aea7...
> 7c987a5ccb (HEAD, origin/release/2.34/master) librt: add test (bug 28213)
> 7947430322 librt: fix NULL pointer dereference (bug 28213)
> 31902ae639 Linux: Fix fcntl, ioctl, prctl redirects for _TIME_BITS=64
> (bug 28182)
> 9995d0588f iconv_charmap: Close output file when done
> 7ff4da3dc2 copy_and_spawn_sgid: Avoid double calls to close()
> a5bd2e10e0 gaiconf_init: Avoid double-free in label and precedence lists
> 3a48da47a9 gconv_parseconfdir: Fix memory leak
> 0b03996304 ldconfig: avoid leak on empty paths in config file
>
>
> Sakib Sajal
>
