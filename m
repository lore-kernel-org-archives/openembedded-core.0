Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C766C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 18:18:15 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.26208.1671646692166818956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 10:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oB0ZZL/3;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id s187so13998659oie.10
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 10:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJhgKdwsjBR/6uEoAu5e1VR5tfMcXdrrwfeQdCz3kcM=;
        b=oB0ZZL/3kT+keyXIDkTvHvWyH0+K9KzI9DsvYyL4vZ8MFgv5mfb4BMK/Uu6y3ukzrw
         lcR0NKCf/wMM5aov89C/jU9ZMphIubfpbuxZoouExMCajl5YRGSDBByGq8R8Jf7+11i+
         XklqGNQd9Cv3hg9BkNRZk8mbmLo4MQzyIV0EEJKJd1xWqxLZGr4kbXDi+I90JcXFNlfL
         TjyB9knmafYtlp6HlQMNxdYLV19DvImacjx5N9D++GLBGBH636Ma2JyjXtNNwpu0fd73
         PUnTAT+xg9BBlr5a3mjinDPts+3Mk2MlxwdTn9HHPOYhco2WK+YpYAVL3J+Z1t+xbL84
         aCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJhgKdwsjBR/6uEoAu5e1VR5tfMcXdrrwfeQdCz3kcM=;
        b=L75XeD47i57RhaC0lrhiL2M/Gt0MyZ2htyT9XO/SnAxrLDkZDxlSWIuEKeyb7rt5sB
         GHfib8xv1IvqIscZmmDQ4U03sp4EKyeLs0MCLvy73jngDxXg/KyQLw2oXYp40m7Q8zhN
         K28Zs/b3MebAXeBpLi4QTF9ZbpngN09ON+LyPv91Xb9g0cirkT8w86x9JEj7J9LBSU5+
         7bWK+GOZxlbEcDycOz7D+pwCmnlLMuNUUWKZCly5rXMcQu1Mbp+BYDzXDOY9b6zIwk6J
         dSRR1OtI0CgG6PGdTXYTZZA0W7LUaCM0pfxu+JeUtVS5T/+AFld01MhPDXVrgx5BxzAu
         q1zw==
X-Gm-Message-State: AFqh2kqQmUoIxcCgpGeNNpa3SqarKqtJi5D/ZCIGCVvXWFDl0r9H0B7C
	2R9aWkk/F4DaSQGKHqIQDQ5PLKgIUgpAaiQiapk=
X-Google-Smtp-Source: AMrXdXsbuwyakAosATEEaK/dkKYT72bJltHz7yV3Va87fjaapuvBHP+6zWtbHs3IeMJBwfdFe0X68wDybsEUdMCyRHQ=
X-Received: by 2002:aca:3855:0:b0:35c:53a9:5513 with SMTP id
 f82-20020aca3855000000b0035c53a95513mr6178oia.262.1671646691258; Wed, 21 Dec
 2022 10:18:11 -0800 (PST)
MIME-Version: 1.0
References: <SJ1PR11MB61299AC634FF3D553C33003CEBEB9@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB61299AC634FF3D553C33003CEBEB9@SJ1PR11MB6129.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Dec 2022 10:17:45 -0800
Message-ID: <CAMKF1sr62SvX7hB66FMKANyJJu6uhFL8EJSRjK8nrtrxB20c6Q@mail.gmail.com>
Subject: Re: GCC Patch Tracking [Pending Patches in Poky Sources]
To: "Shinde, Yash" <Yash.Shinde@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 18:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174937

On Wed, Dec 21, 2022 at 9:36 AM Shinde, Yash <Yash.Shinde@windriver.com> wr=
ote:
>
> 0002-gcc-poison-system-directories.patch:Upstream-Status: Pending
>

This could be submitted to gcc, now that clang already has implemented
such an option https://reviews.llvm.org/D52524
it might be good to do so.

> 0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch:Upstream-=
Status: Pending

This is upstreamable too.

>
> 0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch:Upstream-St=
atus: Pending
>

barring this hunk in gcc/Makefile.in
-tmake_file=3D@tmake_file@
+tmake_file=3D@tmake_file@ ./t-oe

This can be submitted too.

> 0006-cpp-honor-sysroot.patch:Upstream-Status: Pending
>

this can be submitted too.

> 0008-libtool.patch: Upstream-Status: Pending

Not sure about this. but worth discussing it upstream as well.

>
> 0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch:Upstream-Sta=
tus: Pending

We have to keep it until we drop armv4 support from core.

>
> 0013-Ensure-target-gcc-headers-can-be-included.patch:Upstream-Status: Pen=
ding

this is specific to OE gcc install structure.

>
> 0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch: Upstream=
-Status: Pending
>

Specific to OE's notion of multilib

> 0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch:Upstream-=
Status: Pending

This is needed for musl systems. Should be worth discussing.

>
> 0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch:Upstream-=
Status: Pending
>

Musl specific. It was already submitted few years back but it has not
yet been accpeted. Perhaps worth raising the thread again.

> The given GCC patches are with it=E2=80=99s current status as =E2=80=98Pe=
nding =E2=80=99 in the Poky sources(meta/recipes-devtools/gcc/gcc/). Please=
 let us know about why the patches are not submitted or let us know if ther=
e is any problem in including it in upstream.
>
>
> Regards,
> Yash.

