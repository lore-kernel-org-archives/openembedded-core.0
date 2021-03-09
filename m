Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.13781.1615315250268177836
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 10:40:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uK7o57ob;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id h98so17679274wrh.11
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 10:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ygY9UoNrkZ/ETeE0gS+QxEpwv7qDs6plWl5LslnXdnM=;
        b=uK7o57ob+dO+Ws7Ob1cVRYl3kR8o15OqDceNjnMDZRPh3A5KP8UXyjXOTyPe6BCBlF
         ZP7CQCcZGLIXaK/v2YZqObd50MIW7yuFtUBVNa40yCRGrRe58uNgaoTXAZ3KNyYaQRFm
         TnsryW7gg3TaYRsnBJ8u0Kj8rtva9XBhhFiYvsT3A2eCY79EO5xAGdd04ayrMyVgXHeu
         eCpxksYAiBMx+JlyJal489jkfFXN9vc6BFZNCNZkRkOuSrlh75NGqy9FK15c2uArqBos
         jrosD8PkQRlBeq9T/6i9ayp5LIsHNlaCT8B0m1W65esHhHwZeFBdmQzVfu6TrrfEpQnp
         XZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ygY9UoNrkZ/ETeE0gS+QxEpwv7qDs6plWl5LslnXdnM=;
        b=ThML5KZElhRzFzoB/Xk3IMUTzdY4e9j7NKG2imE6Jx0zSdYuosPTFCvw+YzGot9ZQI
         LZZ9x1Xg0CJ6ZeTSpP3pDqY6PZ3svxvQEddkKcm40N1yZl5cbitaI7BMCdebdZ93UMoh
         YMOO9VNSNju5zrPgPIpSdaPaEYlmC+PWgU40KfalhZfrQt8GESf+2kGpySGCx6+34Il3
         peiU5NVMDiTxnBSEtRbjIokIyL6cygRuwEAo79hMzcVvLocLz7KDhxxgZ5IiUYmqNH6N
         Pqg9ZpAi9tsQZq/fGYKk6zeZ/IgpS0z9kOCK4YcjdvGcGRtpnomguBdVoOq6b0aMNZns
         EJRQ==
X-Gm-Message-State: AOAM532l/54zXu3WBX0fMTkK3SkoJsGhuE7otS4GZKl/1QrzO/UVmwcP
	/xlaz27w24cYkJNlXv9M0kqudFVoZjsQ7j8H7AY=
X-Google-Smtp-Source: ABdhPJwxY5hEP9qRlGiQZDWhq4Vz7hbpV3GhSMbcx8D0WotQ+YXCAaGo9F2/hr2VPZO3vjSElVBcPt8AWAaal9aYOFU=
X-Received: by 2002:a5d:46c4:: with SMTP id g4mr29868800wrs.241.1615315248744;
 Tue, 09 Mar 2021 10:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20210308214228.1682-1-anmolbir.mann@windriver.com> <0169fb3a33bdab139ff206d122cc7db96b829308.camel@linuxfoundation.org>
In-Reply-To: <0169fb3a33bdab139ff206d122cc7db96b829308.camel@linuxfoundation.org>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Tue, 9 Mar 2021 12:40:37 -0600
Message-ID: <CAJdd5GabiyZFigVgA0vfT+irrjRfGNZkG=GTx_UHPSLZvw5-5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mingw: Remove 'nativesdk-glibc-utils' for windows sdk
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Anmolbir Mann <anmolbir.mann@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 9, 2021 at 10:50 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-03-08 at 13:42 -0800, Anmolbir Mann wrote:
> > From: amann <anmolbir.mann@windriver.com>
> >
> > Certain recipes require the "glibc-utils" recipe to include Glibc utility tools.
> > However, the native version is incompatible with the Windows host, and thus these
> > recipes will cause the Windows SDK to fail to build, particularly the kernel
> > development recipes.
> >
> > [YOCTO #14286]
> >
> > Signed-off-by: amann <anmolbir.mann@windriver.com>
> > Signed-off-by: dreyna <david.reyna@windriver.com>
> > ---
> >  conf/machine-sdk/include/mingw32-common.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/conf/machine-sdk/include/mingw32-common.inc b/conf/machine-sdk/include/mingw32-common.inc
> > index bc6c91e..0109e75 100644
> > --- a/conf/machine-sdk/include/mingw32-common.inc
> > +++ b/conf/machine-sdk/include/mingw32-common.inc
> > @@ -24,6 +24,7 @@ SDK_PACKAGING_FUNC = "do_compile"
> >  SDKUSE_NLS = "no"
> >  SDKIMAGE_LINGUAS = ""
> >  SDK_DEPENDS_remove = "nativesdk-glibc-locale"
> > +SDK_DEPENDS_remove = "nativesdk-glibc-utils"
> >
> >
> >  SDKPKGSUFFIX = "nativesdk-mingw32"
> >
>
> I think meta-mingw patches need to go to the yocto mailing list with
> [meta-mingw] in the subject.

Thanks Richard.

I pushed this to master-next for testing.

>
> Cheers,
>
> Richard
>
