Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FF8CAC5B9
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 02:58:56 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.16448.1759201126947998635
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 19:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IAOYTd7w;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71d60110772so52322417b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 19:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759201126; x=1759805926; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkzEyN+1dWyRo2S9zSRcYl81av8AhiIGaLELzmuxvxg=;
        b=IAOYTd7wBW4KgEATBx4fwMae+ZBRCCvwVpKIJWe7ToOG035padNXKLgvj7cTE7nxfB
         mzMbfa5oE56zTV+vxCaBrg7A2xNAgOkH3k7543Z2eTOO0kGF5CGtcLmSO2uRYqkzuRZm
         CykrCmMyQ68vmVvT0BBd5kzYz+eoPrB4hKzCC3GOmFhuFCWV9hR8/+mfo9gFMplfOFKk
         v170B6Hvz6QM+fViOjv9XXgFopMhnNI09ciKmfKtwVRJ9142vtXT2GnTfZ60wO2X97pE
         FzCUs95Sv9Eo5Hm2+rixEzndwQZdBodoXZpX5jSJ0lgLynfK7sc6b7OHgDWSTNaTuYbV
         /2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759201126; x=1759805926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkzEyN+1dWyRo2S9zSRcYl81av8AhiIGaLELzmuxvxg=;
        b=SLFGiLcNIu2Je5A1Nmncsf1eU+cGSuwsst/fuVCOh+G6e1bI8NCValNu/ijPfPhNM0
         hUkvEBPqUu18rmqLSiyHFDAiIHJZD0nluMPOidkfqQQyP/EYhMD21mKigGCqAeQY0Btj
         GUePhDNhu8+iY7iKAmzqjgsJojOOrieGx1y0/I19Tg0VdsFdlEwLeLhtzXaewAr+9IWl
         zMjQqNebu+TmD1sKjG+Z8NgyhU49q2BTMn8QQoLSR1+xWF3lVUmsoDmdlXrtavPBlXAA
         OjpUWwHt6/8Mbg6CKgQ+TOR4D3xBZpvI8Mf6czzvLzd+1KYS64uz/BN/iMQ+01C1TaH6
         QKPg==
X-Gm-Message-State: AOJu0Yxevm15en3hbyThH474ffkothjE8bdsTpjBttAbwYKLEuwrMmMj
	++bZoZgjDb/jV7h9Zy8y+a5B3z5gYeh7MS4lDTh8M8m3smnILGJFgoa2Wnls8cQLHnyt7JJKDjX
	xorvME+KFlTlYvW1xg8C4K85tFeKMixLvVf1M5M0=
X-Gm-Gg: ASbGncu7CMVB0rbYhCXWupZr9136B5BcpTg8zU0pOVJfrAWxcw7+QRkXmMi78Mqv+65
	aOUTSMCQoWOusQBhYuZHOm7hSAVHHdT5GC6pGR+4SSu5ad+xaC9odhgtoF92uV535OxUXbRqciy
	8PoL841K5zw5vNXiRTp1sE7EK0tugVtXrhzWb+syuAIM8xqrRQOk88fcMbGfCEzf3HFPMjiPu05
	UAirMnrJoVbrzMIKlXA0kfzhMLhEkN1h37HBuDA3v2x2bxb1p5lRI9RXHBSX3IztclW+2GOd0fQ
	8fSEPeKYEM2Lj+glWdUQCeU3uw1PJ5OfGbtw7ahbOAQYuNuMBcQgFTUmeg==
X-Google-Smtp-Source: AGHT+IFNOJuNZmIC1oPysU9CtdPDlMygPU1gjEwGhMg+xPgJHjMHboFBH2eBBzdPS8q+9rnxRu1ZX5Mjugunqv/QvwI=
X-Received: by 2002:a05:690e:1a4a:b0:629:464e:7f0e with SMTP id
 956f58d0204a3-6361a840a43mr16041992d50.31.1759201125758; Mon, 29 Sep 2025
 19:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAD_4BXiwzc0VBdNjptP3N2Hj2=czhEEbLw4GOphNNnwnj9uTPQ@mail.gmail.com>
 <CAMKF1soVEKaJcH=J99=eUKor+1gzE3RAB0cHaTnET68f4DnAeQ@mail.gmail.com> <CAD_4BXiRTKx5HPNqmroz1fO3T8ggmQUVXa+=HJT=saLtg5PJzw@mail.gmail.com>
In-Reply-To: <CAD_4BXiRTKx5HPNqmroz1fO3T8ggmQUVXa+=HJT=saLtg5PJzw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Sep 2025 19:58:19 -0700
X-Gm-Features: AS18NWD_JX8V7ysHgmu8uNfwpXfci5GVfQODilcgXCHH-qSKNZawu-3b0qHdzgk
Message-ID: <CAMKF1sqwuC=AGzEa7W+EtfZM4fKvdXv-BP7YYhvhX5RD68owJw@mail.gmail.com>
Subject: Re: [OE-core] Distro wide LTO broken?
To: William Kennington <william@wkennington.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 02:58:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224172

On Mon, Sep 29, 2025 at 5:19=E2=80=AFPM William Kennington
<william@wkennington.com> wrote:
>
> On Mon, Sep 29, 2025 at 11:43=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
> >
> > On Mon, Sep 29, 2025 at 3:51=E2=80=AFAM William Kennington via
> > lists.openembedded.org
> > <william=3Dwkennington.com@lists.openembedded.org> wrote:
> > >
> > > If I add the following to my distro, the build breaks for the openssl
> > > and other core packages due to having build path impurities in the
> > > static libraries created.
> > >
> > > ```
> > > require conf/distro/include/lto.inc
> > > DISTRO_FEATURES +=3D "lto"
> > > ```
> > >
> > > The errors I get are all like
> > > ```
> > > ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
> > > /usr/lib/libssl.a in package openssl-staticdev contains reference to
> > > TMPDIR [buildpaths]
> > > ERROR: openssl-3.5.2-r0 do_package_qa: QA Issue: File
> > > /usr/lib/libcrypto.a in package openssl-staticdev contains reference
> > > to TMPDIR [buildpaths]
> > > ERROR: openssl-3.5.2-r0 do_package_qa: Fatal QA errors were found, fa=
iling task.
> > > ERROR: Logfile of failure stored in:
> > > /home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linu=
x/openssl/3.5.2/temp/log.do_package_qa.118335
> > > ERROR: Task (/srv/yocto/poky/meta/recipes-connectivity/openssl/openss=
l_3.5.2.bb:do_package_qa)
> > > failed with exit code '1'
> > > ```
> > >
> > > Probably there is just some kind of flag missing in the LTO build
> > > options to filter out the build directory, as -ffile-prefix-map and
> > > whatnot are already present in the builds. I haven't yet figured out
> > > exactly what is contributing to this impurity.
> > >
> >
> > Inspect the .a files ( maybe using strings or binary viewing tools
> > like xxd ), with LTO they are flat objects with additional information
> > for
> > LTO to work and I think it will give more information.
>
> Yeah, I believe it's just a single remapping we are missing somewhere
> that is allowing the extra string to be added into the binary. It's
> been a while since I've worked on this kind of impurity stripping, so
> it will probably take a bit to get used to the tooling again.
> Hopefully I find the root cause and we can strip it out
>
> An example invocation looks like the following. All other object files
> I looked at share the same impurity which ends up in the static
> library later
> ```
> aarch64-oe-linux-gcc  -mcpu=3Dcortex-a76.cortex-a55+crypto
> -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
> -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-securit=
y
> --sysroot=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto=
-oe-linux/openssl/3.5.2/recipe-sysroot
>  -I. -Iinclude -Iapps/include -I../sources/openssl-3.5.2
> -I../sources/openssl-3.5.2/include
> -I../sources/openssl-3.5.2/apps/include  -fPIC -pthread
> -Wa,--noexecstack -O2 -g -flto -ffat-lto-objects -fuse-linker-plugin
> -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa5=
5-crypto-oe-linux/openssl/3.5.2/s
> ources/openssl-3.5.2=3D/usr/src/debug/openssl/3.5.2
> -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa5=
5-
> crypto-oe-linux/openssl/3.5.2/build=3D/usr/src/debug/openssl/3.5.2
> -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa5=
5-crypto-oe-linux/openssl/3.5.2/recipe-sysroot=3D
>  -ffile-prefix-map=3D/home/builder/yocto/build/tmp/work/cortexa76-cortexa=
55-crypto-oe-linux/openssl/3.5.2/recipe-sysroot-native=3D
>  -pipe -DOPENSSL_USE_NODELETE -DOPENSSL_PIC
> -DOPENSSLDIR=3D"\"/usr/lib/ssl-3\""
> -DENGINESDIR=3D"\"/usr/lib/engines-3\""
> -DMODULESDIR=3D"\"/usr/lib/ossl-modules\"" -DOPENSSL_BUILDING_OPENSSL
> -DNDEBUG  -MMD -MF apps/lib/libapps-lib-app_x509.d.tmp -c -o
> apps/lib/libapps-lib-app_x509.o ../sources/openssl-3.5.2/apps/l
> ib/app_x509.c
> ```
> and the partial strings dump with the impurity looks like
> ```
> vtmp
> unsigned int
> /usr/src/debug/openssl/3.5.2
> ../sources/openssl-3.5.2/apps/lib/app_x509.c
> /home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux/op=
enssl/3.5.2/build
> include/openssl
> /usr/lib/aarch64-oe-linux/gcc/aarch64-oe-linux/15.2.0/include
> ../sources/openssl-3.5.2/include/openssl
> /usr/include
> ../sources/openssl-3.5.2/apps/lib
> ../sources/openssl-3.5.2/apps/include
> app_x509.c
> ```

If you already know its coming from  app_x509.c, then you have
narrowed it down a step. Next, would be
to build just this file with -dD -E option and inspect if it contains
any live string containing
"/home/builder/yocto/build/tmp/work/cortexa76-cortexa55-crypto-oe-linux/ope=
nssl/3.5.2/build"
if it does not find it. then perhaps build the assembly output with
-fverbose-asm -S
option and look for this string in the generated asm file.

> >
> > > Prior to rebasing on the latest master, LTO was working fine globally=
.
> >
> > what is the delta we are talking about here ?
>
> Sadly this was long ago `25d60ac6f61cc186b4c5a961554bee583736fd17`
> from early 2024. Doing any kind of bisection is probably pointless so
> I just need to figure out this new impurity (or maybe just the check
> got added since then)

Yeah that will take too long to bisect so leave that aside.

>
> >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#224137): https://lists.openembedded.org/g/openemb=
edded-core/message/224137
> > > Mute This Topic: https://lists.openembedded.org/mt/115492623/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

