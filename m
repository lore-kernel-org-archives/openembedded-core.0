Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web08.1068.1613168417821067935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 14:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U0F4bOfv;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: alistair23@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id f2so803100ioq.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 14:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CgdNvq36Jf+eW4wkAJMqKamuHSAV/6CGUeoN18fAGcs=;
        b=U0F4bOfvCzJ7/BjPDFoKdQ6g5GNSVOE1db6/rZdTCBEbPmaOkyi2x+MUe77APf8XtN
         UisZmvWfuYBZNEvaA97aqchqJDxAb6q73Vvxsj95kL3FbEZRbWpcy1+f3jllkjN9JYL0
         R4Hi5KHiWmnr6tUvt93U3WQTepsileyNw7boEFMUhQMOdfB9OYnY0LrjtSztisTOfJZC
         vLQZexwE6CiZC9gHjiah5dSAqNmFpwyStMGouv34xC0ggEYQbhov/rOMt4m5EWSk83L1
         ZVvN/C5vvDLlR58qXj0n2rYqdFYimquIZG84x9pJ4K3cKudnhN264GBZEFERvGPFSHql
         4Ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CgdNvq36Jf+eW4wkAJMqKamuHSAV/6CGUeoN18fAGcs=;
        b=Mo1fyCC2HOgJVfglh4y9mMU23aINNE10VoAFoGZt4wzGDyz8NGZMZXJy5CcK09gsDC
         HI/m1Shd/JwyMLS5dREH2CQjb0R6twhH4V3k6l95Btq2kvCTTvHApEw9vt3LRNcmaRH9
         OjnP9pTvkO0ZDO0yTd04+RZy0xrxtksGEhPQlXGaCuqRbTwBE8lK4q8YmXZdJS3juPyw
         Ge9mHrc+NPgB5y/1kqOJZkZaDKConXao12p2PBUOMdSw2Lmzl4TejSrKtKimUHmPPESp
         ah8MCg0ILN+rE4vxostoL4nqsR1gugBR0BcS9Z5gOQNHpOXv6SfiW0pHutmzuCGXJVSe
         Bg8Q==
X-Gm-Message-State: AOAM531+6xIZWvAPZ252sD4AHnN5kcSvd4VX/Nj8OlxRX4qgqiZlQrvP
	hz3Pp99iyrZN1wI3ZKbI4q5A95/jVx/iYwQnSMU=
X-Google-Smtp-Source: ABdhPJycvhbBHUSgBfkrhlRKR/hQY7MO7ulNpxTKTaLGprXaAewp/ga4RfEwAjVMDhllzF7WOP5GhitjlUPdvLjsjFM=
X-Received: by 2002:a02:2944:: with SMTP id p65mr4489706jap.91.1613168417195;
 Fri, 12 Feb 2021 14:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20210211165229.741761-1-alistair.francis@wdc.com> <CAHtQpK7yL4JGRK1FVGW-yoBr63iHnRfv3nvdYbLemePqVBoFeg@mail.gmail.com>
In-Reply-To: <CAHtQpK7yL4JGRK1FVGW-yoBr63iHnRfv3nvdYbLemePqVBoFeg@mail.gmail.com>
From: "Alistair Francis" <alistair23@gmail.com>
Date: Fri, 12 Feb 2021 14:19:36 -0800
Message-ID: <CAKmqyKPXtYa3Nwbzk7MHJKs50wCerfcNCN7w6Li4MdM39CxaXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Enable building for RISC-V 32-bit
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 11, 2021 at 9:13 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Hello Alistair,
>
> On Thu, Feb 11, 2021 at 5:52 PM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  ...ort-for-io_pgetevents_time64-syscall.patch | 58 +++++++++++++++++++
> >  .../openssl/openssl_1.1.1i.bb                 |  4 ++
> >  2 files changed, 62 insertions(+)
> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch b/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
> > new file mode 100644
> > index 0000000000..591354fbb9
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssl/openssl/0003-Add-support-for-io_pgetevents_time64-syscall.patch
> > @@ -0,0 +1,58 @@
> > +From d1a1b797d961301fd58513e50ac5de9ad5b8bc08 Mon Sep 17 00:00:00 2001
> > +From: Alistair Francis <alistair.francis@wdc.com>
> > +Date: Thu, 29 Aug 2019 13:56:21 -0700
> > +Subject: [PATCH] Add support for io_pgetevents_time64 syscall
> > +
> > +32-bit architectures that are y2038 safe don't include syscalls that use
> > +32-bit time_t. Instead these architectures have suffixed syscalls that
> > +always use a 64-bit time_t. In the case of the io_getevents syscall the
> > +syscall has been replaced with the io_pgetevents_time64 syscall instead.
> > +
> > +This patch changes the io_getevents() function to use the correct
> > +syscall based on the avaliable syscalls and the time_t size. We will
> > +only use the new 64-bit time_t syscall if the architecture is using a
> > +64-bit time_t. This is to avoid having to deal with 32/64-bit
> > +conversions and relying on a 64-bit timespec struct on 32-bit time_t
> > +platforms. As of Linux 5.3 there are no 32-bit time_t architectures
> > +without __NR_io_getevents. In the future if a 32-bit time_t architecture
> > +wants to use the 64-bit syscalls we can handle the conversion.
> > +
> > +This fixes build failures on 32-bit RISC-V.
> > +
> > +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > +Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/9819]
>
> This PR and related commit has not been integrated in 1.1.1-stable
> branch, and according to Arnd [1] - it might be wrong.
>
> I do not know if this can be taken like that, but just want to point
> out that upstream did not fully take the change you're providing here.

Thanks for pointing that out, I'll have to look into it more then.

Alistair

>
> > +---
> > + engines/e_afalg.c | 16 ++++++++++++++++
> > + 1 file changed, 16 insertions(+)
> > +
> > +diff --git a/engines/e_afalg.c b/engines/e_afalg.c
> > +index dacbe358cb..99516cb1bb 100644
> > +--- a/engines/e_afalg.c
> > ++++ b/engines/e_afalg.c
> > +@@ -125,7 +125,23 @@ static ossl_inline int io_getevents(aio_context_t ctx, long min, long max,
> > +                                struct io_event *events,
> > +                                struct timespec *timeout)
> > + {
> > ++#if defined(__NR_io_getevents)
> > +     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
> > ++#elif defined(__NR_io_pgetevents_time64)
> > ++    /* Let's only support the 64 suffix syscalls for 64-bit time_t.
> > ++     * This simplifies the code for us as we don't need to use a 64-bit
> > ++     * version of timespec with a 32-bit time_t and handle converting
> > ++     * between 64-bit and 32-bit times and check for overflows.
> > ++     */
> > ++    if (sizeof(timeout->tv_sec) == 8)
> > ++        return syscall(__NR_io_pgetevents_time64, ctx, min, max, events, timeout, NULL);
> > ++    else {
> > ++        errno = ENOSYS;
> > ++        return -1;
> > ++    }
> > ++#else
> > ++# error "We require either the io_getevents syscall or __NR_io_pgetevents_time64."
> > ++#endif
> > + }
> > +
> > + static void afalg_waitfd_cleanup(ASYNC_WAIT_CTX *ctx, const void *key,
> > +--
> > +2.23.0
> > +
> > diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> > index 86950f7544..599d78abea 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> > @@ -23,6 +23,10 @@ SRC_URI_append_class-nativesdk = " \
> >             file://environment.d-openssl.sh \
> >             "
> >
> > +SRC_URI_append_riscv32 = " \
> > +           file://0003-Add-support-for-io_pgetevents_time64-syscall.patch \
> > +          "
> > +
> >  SRC_URI[sha256sum] = "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
> >
> >  inherit lib_package multilib_header multilib_script ptest
> > --
> > 2.30.0
> >
> >
> > 
> >
>
> Link: [1]: https://github.com/openssl/openssl/commit/5b5e2985f355c8e99c196d9ce5d02c15bebadfbc#comments
> --
> Regards,
> Andrey.
