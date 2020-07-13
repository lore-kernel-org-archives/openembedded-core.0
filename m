Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.8703.1594681474168535074
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 16:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=OVhX9ah/;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id dr13so19379025ejc.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 16:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=utdjx2mWX4mwilm6L00oaE4Jmt8P0PfIzY7zN7y1Bj0=;
        b=OVhX9ah/yHQIQo5tJpmTPHWq/JlFdpo4XJD9m7SF4n6voIu29MucCr0D2RHkPMNosz
         D3laD1dVwaCe3SgZXdrNN1F0ZNozF0QnSIXtDgl/vzJXH6pWgG9cI3H3/BrzaeJpRrIi
         QELq+guJnWYby4d59/X1maCgLaBDzXpzEHhYD4vWSrhJ0bjKaUCuUMKEqs0SiVcHFrRN
         +Qa5DRUxGsg4f3ZWysqHE+/WqOPz35fTbX9yuEJMmNMMb6nTxT+35otu8XzutW9g94ZM
         U62zWPz2jPlzX+z4gMxGAZTjpSmJ8JGUoD1e/LmufPCL+Jl3/sf7MorbTIa+ozlmFFTV
         1vqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=utdjx2mWX4mwilm6L00oaE4Jmt8P0PfIzY7zN7y1Bj0=;
        b=gA/T+rYYHwCUMW833f5z+QKPSCGWMmB5fT5uOXKFZshAXphsTkxeEGauhGBO9aK+J7
         2VKjXsX8adf0OzXCOFfUsZj3cqSyxJ7IcONYP/7BzkzFzZTXez7rhCLbZ63XgGY3ne1N
         1ndFzmEgFrJ2S5L4ohZRX1xvpwHh8qvtWnGkTpDaTthk5n667SiyRvEZ7oVffSZR+/1N
         v9CXn2NE32PpeAkviRRBUaN9t1aNuWJIO7kntdD7S76iFWndtw9AIfjb4HUHJBUn9A8C
         PKI2lLr0MQkhU2jPt0WkqUE+6SbGo6Ffx8ir1hW5BWoYOpeIApllsFrP937IjMNLtz0k
         5djQ==
X-Gm-Message-State: AOAM531OShU/zEh/SmgsiKR+Zxpw5m/Zo5JvXWqSA/Y4XJ8z+3hToZcW
	A2vTqRPKex992AZ1tB1Dnu774CyLxHkfEql8gVRIpQ==
X-Google-Smtp-Source: ABdhPJzEzdelWT/SOG+8272Fgtmmj849dd4/KY684BR7p1abrXfhLAHXtzX+zoKMxRQbtXtK4DXn0UlUxFXM/42PyU0=
X-Received: by 2002:a17:906:af6d:: with SMTP id os13mr1815626ejb.57.1594681472558;
 Mon, 13 Jul 2020 16:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594649587.git.steve@sakoman.com> <ad44aab08c0c204923d44aa37c39559a7bd843c0.1594649587.git.steve@sakoman.com>
 <92cf9c7e6eaec95059019b461becd588b2b93dbf.camel@gmail.com>
In-Reply-To: <92cf9c7e6eaec95059019b461becd588b2b93dbf.camel@gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 13 Jul 2020 13:04:21 -1000
Message-ID: <CAOSpxdZMtm01BXdA9EnE9SEu8o9jUbm5+_fBht6tPmmkVMLoTw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 08/15] kernel.bbclass: make dependency on lzop-native conditional
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 13, 2020 at 11:29 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> Can we drop this one from the backports?

Yes, I will remove this patch from my final pull request.

Steve

> The patch possibly reduces a bit of build time if lzop-native is not used
> by any other recipe, but does not fix anything.
>
> One can build a zImage which is compressed with lzo. For a kernel recipe which
> does use a zImage with lzo and relies on the kernel.bbclass to add a depend on
> lzop-native the build breaks.
>
> Cheers
> Max
>
> Am Montag, den 13.07.2020, 04:16 -1000 schrieb Steve Sakoman:
> > From: Timon Ulrich <t.ulrich@anapur.de>
> >
> > a native lzop is only needed when an lzo compressed initramfs is actually present
> >
> > Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 1217ddf070261c5fe523729b2a833bd38f1e4ccd)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes/kernel.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 9e3c34ad48..af7e88b380 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -4,7 +4,8 @@ KERNEL_PACKAGE_NAME ??= "kernel"
> >  KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else
> > d.getVar("KERNEL_PACKAGE_NAME") }"
> >
> >  PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
> > -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native
> > lzop-native bison-native"
> > +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native
> > bison-native"
> > +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
> >  DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
> >  PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
> >
> > 
>
