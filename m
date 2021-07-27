Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.5157.1627346439590349202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jul 2021 17:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ewVdMeYu;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.48, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f48.google.com with SMTP id c16so3251814wrp.13
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jul 2021 17:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dYrtRVQpfES/pI0A2auZeAu8Qoz2PwdZJbRVvqmtIXY=;
        b=ewVdMeYunPos+nAizLGMg7W6ZWuTVk+PrImWLY93jfDoADntQrj5+4ZeirHGxqb54r
         Fio4R0RgUYQJiul1/norCYm6gQf4p/oZaNjj3dx6gaFBELMO03V5Ib2eo2MSufXg8gcX
         MTzIzgz3EKeaOSxOPBR27Wy2yG9RVnLMwct3vYdQJPWuLWWdrRSPrsqvZj+L926ZcSel
         8Ap/j72BZQ1cPYZ2nXq9yaHZFJ/4FSUMTjo1Ee5dpImJBloNtKDhglUeKY4CbWj2z8K1
         rOZnIvn3G0Cuudl1hycqjDfwlzLnagi1zvYTzHeaRXnkJ3KLc2LukR9puxZMrAGdpgrx
         QB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dYrtRVQpfES/pI0A2auZeAu8Qoz2PwdZJbRVvqmtIXY=;
        b=gDbi0NwbrlAxX7UlYFfWf16fWEsL0VMyDI4mTFtkAt22o9C2lYSPL8h2h8HQ9IG1Sb
         ThwO7V7Gu7KMyywrZdxec5OdlNUNBhN5miZgxTYkuAR1SvOEKSiEWdl1MlhgAoVJyZls
         xO41E+mwMyD8REt1cR/Uh8pDTbEU0CDOzST+7QazBg2QVGAJNCMpxyfdNzfnvq6dZsnw
         RczDFMrCZzG878Vjp8REbFfZB78/MccONd+/Jxxqyq4fR5p9MaMgQ8CWDANlcvugvnvj
         L0WqNm1U4K69ekvOPVPyJXhc9JziCIL1RkwZdoVrQEWv/SCa7seYuZUKB10TbmvZnMR5
         N4Rg==
X-Gm-Message-State: AOAM530MoDYGwkQUtn7HRCqIsTi/6lr9dwFhrQBf+j5C895tBYr1f1ZH
	qa7M4545JIWAdSfAdNpLBZXJkGQq4sjlw6GE0z/Lng==
X-Google-Smtp-Source: ABdhPJwGpSS6wxj1YcOE8140JVPO014LLZGunwuMkLWVOX5Z9jCf75QIfBSWCynofrUekxAvH6RS+mBuQOl4cxb4TW4=
X-Received: by 2002:a5d:5905:: with SMTP id v5mr9005711wrd.205.1627346437547;
 Mon, 26 Jul 2021 17:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210723214527.2225841-1-fib@cisco.com> <20210723214527.2225841-2-fib@cisco.com>
 <CAOSpxdYek8qF+oYVSuTGfzP6zq++f711QHJJur9P=xbrFVEWeQ@mail.gmail.com> <SJ0PR11MB4784D0CF9A35F4D8A63630DBADE89@SJ0PR11MB4784.namprd11.prod.outlook.com>
In-Reply-To: <SJ0PR11MB4784D0CF9A35F4D8A63630DBADE89@SJ0PR11MB4784.namprd11.prod.outlook.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 26 Jul 2021 14:40:26 -1000
Message-ID: <CAOSpxdZj+whn8ktEPHuFxQUL=1=6bVWtD53N=cSM4waNh28JtQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2 1/3] cmake-native: enabled zstd support
To: "Ruslan Babayev (fib)" <fib@cisco.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Samuli Piippo <samuli.piippo@gmail.com>, Samuli Piippo <samuli.piippo@qt.io>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 26, 2021 at 12:27 PM Ruslan Babayev (fib) <fib@cisco.com> wrote:
>
> Hi Steve,
>
> Thanks for reviewing the patches. I understand the problem of merging this patch as is.
> But Dunfell currently has a host contamination issue on systems with zstd installed as part of base OS resulting in broken cmake-native recipe. Can you help bring this up to the attention of the steering committee?

Perhaps Richard can comment on this.  You are asking for a feature
change to dunfell that involves modifications in both
openembedded-core and meta-openembedded. So both technical steering
committees would need to agree that this is appropriate.

> As for the other two patches in the series. Do they look OK? Do you see any issues in merging them? Or would you like me to separated them from the cmake patch?

The other two patches don't have issues, so no need to re-submit!

Steve
>
> Thanks,
> Ruslan
>
> -----Original Message-----
> From: Steve Sakoman <steve@sakoman.com>
> Sent: Monday, July 26, 2021 8:05 AM
> To: Ruslan Babayev (fib) <fib@cisco.com>
> Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>; Samuli Piippo <samuli.piippo@gmail.com>; Samuli Piippo <samuli.piippo@qt.io>; Richard Purdie <richard.purdie@linuxfoundation.org>
> Subject: Re: [OE-core][dunfell][PATCH v2 1/3] cmake-native: enabled zstd support
>
> On Fri, Jul 23, 2021 at 11:45 AM Ruslan Babayev (fib) via lists.openembedded.org <fib=cisco.com@lists.openembedded.org> wrote:
> >
> > From: Samuli Piippo <samuli.piippo@gmail.com>
> >
> > CMake depends on having all formats supported and build issues can
> > arise when zstd is not available:
> > https://gitlab.kitware.com/cmake/cmake/-/issues/21552
> >
> > Quote from a CMake dev:
> > "As far as CMake's design is concerned, we have no optional formats.
> > All should be supported. That's why we bundle sufficiently new
> > versions of libarchive and libzstd. If a distro builds with an older
> > libarchive that doesn't have zstd support, then that is not a proper packaging of CMake."
> >
> > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Ruslan Babayev <fib@cisco.com>
> > ---
> >  meta/recipes-devtools/cmake/cmake-native_3.16.5.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> > b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> > index b2952ee5f5..6034b654da 100644
> > --- a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> > +++ b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> > @@ -1,7 +1,7 @@
> >  require cmake.inc
> >  inherit native
> >
> > -DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native ncurses-native"
> > +DEPENDS += "bzip2-replacement-native expat-native xz-native zlib-native curl-native ncurses-native zstd-native"
>
> In hardknott/master the zstd recipe has been moved from meta-openembedded to oe-core.  This is not the case for dunfell, so this change will result in failures for builds that do not include meta-openembedded.
>
> So this patch is not suitable for dunfell unless the community/steering committee decide to also move the recipe in dunfell.
>
> Steve
>
> >
> >  SRC_URI += "file://OEToolchainConfig.cmake \
> >              file://environment.d-cmake.sh \
> > --
> > 2.26.2.Cisco
> >
> >
> > 
> >
