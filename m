Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.33405.1597620616177665606
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 16:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E+IY8OIk;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id b14so13509183qkn.4
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 16:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=damjxkgoTckBu6zZn/DUTn+sTI2+q24GY5YsOBli/7Q=;
        b=E+IY8OIkqUdduQYlk86T0XL4VaIH47ZSnlx5iEI7ELFlYyzJ6i3mrtFbQRaDMg06zx
         SKhuP4/VH7+BaEAf+c7ZGPut560vvCIyWHpUInv8B9UOd7hqQOA77lILsf2I0d4d1c+O
         tO2Zveo7fpkuO2WL1+wZ4JfNWQ8BLQ/a3UG3xqk4R8ThcDTd2kfYsd+tkNA3IxOY3O4R
         ej6waqJnTWBvK1Jblu7HNDHnnok6Sgq6zNgJ5ObP+7EtWuMOVS+aCBmnyKYEX5Qi7BuC
         d83ZAJUhBt21/4PQMF7EFA/JElOgrAm5VZWV4sH4aEBzgClE52+fW8XOYeIfFCoCnTE0
         1PWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=damjxkgoTckBu6zZn/DUTn+sTI2+q24GY5YsOBli/7Q=;
        b=j/s+z9SEM8iBNgslXLouyxKHjb6kXey90c+ggYGkxZ+U3ZYfyE9asBLdq43iBfaXSP
         8CrVawKAToWc4xhcIlJq3m8Wvqb/vO83Gda4hwCgxz9aKFXCDhyh1HPEKfgi0HsFoXbF
         +vNPHyP0QBDZ51tlaAZvmgGmO3tzdBE1oP6fKNMbR05tlaS3bFYmCGximF1OwbfsazFk
         AWOzyHilUd+aV6879Rj6f11LQLoyU2QcntzqH/pUn3W7gHwRY1zEN2e5Z5hpR1KSz4Th
         TjpfnUqgjGTFKjdCUugJP2JSqNpvo/vnOMnMq3y20FddJYU64lV/v4oyGZSUTxtdF67b
         3H3w==
X-Gm-Message-State: AOAM530U0ZhQ0nr5fdtUQE2yiFngWe+npsXOrcF6XXRjHRtP3lPlBjvj
	e7l4RteIOc9goMRSXSHBVsFlwxwoY9ZKRcUZgCI=
X-Google-Smtp-Source: ABdhPJzWdn6kNX1sV/nLwebhOY9zwg8DRlDl82m0EaEdGm3/JGYU3H08sQ86XS/RMutLpGB1YKXW55VnLoBmpzsQFdM=
X-Received: by 2002:a05:620a:209b:: with SMTP id e27mr10366278qka.431.1597620615319;
 Sun, 16 Aug 2020 16:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200804082019.76320-1-jacob.kroon@gmail.com> <CAMKF1soyMVB0jpLRA0v8WnCMaJ8DHf=id0xyvdoJ+78CL=UKwA@mail.gmail.com>
 <9e59ca1e-26f3-08a2-d43d-c4d4545d031a@gmail.com> <CAMKF1srkVAXV4NS7xL2mA+D8z7v4x612qjFG_0H_XFmvG3tx3A@mail.gmail.com>
 <CAMKF1sonGf4BT-XtktYVO02MtO_XA_SN_8N55WjjKgKafUPXJA@mail.gmail.com>
 <22b4b3f49bd9ca309ffe4c5fac7a3431fc43ce4b.camel@linuxfoundation.org>
 <CAMKF1srCFjrVimzDWU69Z=SaGu5gayYG7qi34Wo7pEqAG06osA@mail.gmail.com>
 <CAMKF1so+KKNoOTWMB6zLak5ek6c2rN-FAUfv1_L-TWp9h71jWQ@mail.gmail.com> <61e5a6bd3ec8371b2e15742caf18f342b5465c91.camel@linuxfoundation.org>
In-Reply-To: <61e5a6bd3ec8371b2e15742caf18f342b5465c91.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 16 Aug 2020 16:29:48 -0700
Message-ID: <CAMKF1spOwHVNw0h=32pFnVO7S7-E2DV_hxhk3WL24kFepvseEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc10: Don't default back to -fcommon
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Jacob Kroon <jacob.kroon@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 16, 2020 at 6:47 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2020-08-15 at 19:41 -0700, Khem Raj wrote:
> > Bruce,
> >
> > We need
> > https://github.com/torvalds/linux/commit/168200b6d6ea0cb5765943ec5da5b8149701f36a
> > backported to 5.4 kernels for perf to build with -fno-common can you
> > queue this in your kernel updates as soon as you can ?
>
> I think we have other active kernels which will also need it as even
> with Khem's patch we still see failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1267
>

I see

meta_ide.MetaIDE.test_meta_ide_can_build_cpio_project: FAILED (64.00s)

It seems the sdk fix for cpio is not working properly

> Cheers,
>
> Richard
>
