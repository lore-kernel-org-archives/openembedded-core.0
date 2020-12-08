Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.11186.1607445422020011672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 08:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=owl6p+HI;
 spf=pass (domain: burtonini.com, ip: 209.85.167.67, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f67.google.com with SMTP id u18so24485871lfd.9
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 08:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y3EvZ/uJ5fylnk1Z0KHt9yTW3T7s6h0tIM1kxwwFRRs=;
        b=owl6p+HIDxpHHe/14r7uPvE5qrn8663kJm61D5vszhX/o6ApU46Jk33eH9CPzLeEYN
         jS6nm8r44zJmPlaW1z5hTdtpGmcqh5MoFzRTKHZl3aBPMEJ/9HfoH42hltPr1EfPMWxj
         Fn2Z98gqmPyU5+Y/LyJdm3Oghalo3lpZod8pMN1+4U5lh8ezjI1Y8Aj+r6jmOIktBKhj
         VAsUqxvVkOJmDZAevejmHw1In7hZjUKJy4RIopjFSDiBl5HRl5THuiewtyfZi9BQBVKC
         IpcVrRZ2Ih3LUjLhN3+qB2dcsvgQBWtA5w/oCFfE9W0FkpI1qtggdG2d4aa/mImI+B/v
         11iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y3EvZ/uJ5fylnk1Z0KHt9yTW3T7s6h0tIM1kxwwFRRs=;
        b=jByKFjKNsOQR8ysZzhNV0Uh+tmxam8QAjDQFmACwJfkHFoWno1yo4y+IC2Qr+RlPxH
         X2Vi1vL/PaOjQKbtxRXt7IiwtNq2WEDz8TvExBs7sbOpbNamCaTpZIhVwkafHJB2W9ZS
         z24/6g+5AyqdOXcngpqz4GQ/hpAdsGcatSomha8vmeTTF70rO/MfjK2PMRbBWdS419Ky
         pDQAMfEbrUGSc9vbZJVV3TnNvbBSSi146FKrMAkr1ngqdRiky0slWzsG4d8UHanLzIAA
         LMlaqnhLh1TLRl7p9T7TqR1e3k/ZW8xnNnD4fCOt9j5AivRHQ/943dKWjuOrdhFOnQ4k
         zPVg==
X-Gm-Message-State: AOAM532id+iUCJpPLPONJyQKtgQe5Vu7TQTC9gVgtiR1BXqafkclNEss
	CFUdapRVTVf+6bKdrt00lkjfkIJtIWKKve+XSzBHoA==
X-Google-Smtp-Source: ABdhPJwgLQwrFeqa4SjMPQccBVaM8IZy9ad7BaJwpxEhWc7/xdeFTJ1t65nKI4z6qgb1SiCc28wDERyI21YJT7PRTnQ=
X-Received: by 2002:a19:655c:: with SMTP id c28mr10786181lfj.549.1607445419924;
 Tue, 08 Dec 2020 08:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20201207155410.1671537-1-ross.burton@arm.com> <CAOSpxdZ2n8x_Qr3eJz6M-4rhuxB+0dM3nEn1-bv1EgU8+q-kRA@mail.gmail.com>
In-Reply-To: <CAOSpxdZ2n8x_Qr3eJz6M-4rhuxB+0dM3nEn1-bv1EgU8+q-kRA@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 8 Dec 2020 16:36:48 +0000
Message-ID: <CAAnfSTuJ6NOx=s7ESR30XD5gYv5NZpPu7TSd2bb6xzFxwOWCXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] coreutils: add SUSE-specific issues to CVE whitelist
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Yes, definitely.

Ross

On Tue, 8 Dec 2020 at 14:27, Steve Sakoman <steve@sakoman.com> wrote:
>
> On Mon, Dec 7, 2020 at 5:54 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > CVE-2013-0221 through -223 are all SUSE-specific, so add them to the
> > whitelist.
>
> Good for dunfell too (with recipe version change of course)?
>
> Steve
>
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-core/coreutils/coreutils_8.32.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes-core/coreutils/coreutils_8.32.bb
> > index 9d1eceef54..4eb357e310 100644
> > --- a/meta/recipes-core/coreutils/coreutils_8.32.bb
> > +++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
> > @@ -199,3 +199,6 @@ do_install_ptest () {
> >  }
> >
> >  FILES_${PN}-ptest += "${bindir}/getlimits"
> > +
> > +# These are specific to Opensuse
> > +CVE_WHITELIST += "CVE-2013-0221 CVE-2013-0222 CVE-2013-0223"
> > --
> > 2.25.1
> >
> >
> > 
> >
