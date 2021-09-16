Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.9373.1631788872222327962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 03:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=VFxAKz56;
 spf=pass (domain: burtonini.com, ip: 209.85.128.54, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f54.google.com with SMTP id j134-20020a1c238c000000b0030b32367649so656042wmj.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 03:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ld1waH7JrJjFSYz+TypXfWal7sdmoWroZgmjA5OUfIQ=;
        b=VFxAKz56FcUixVfPgKiOrTp0kvsA4qM/xqSmOhkdHQXrBsuiI3Y0GB7x2mQXL6yGDr
         kaNAFdQcf4ox1cR0+6jf1jDYN0Z21OF4os1EGERlli1ScXH3oQSB7KNEzHnJgMUpJQ+C
         BpJrYAQi9Vt+I8hIkjW/AEjJpxFcbBS7WIvXUycD1z53LvZ57Hx1uYgBTWnkjOvxFEDc
         A/n5ERa8mBjLJsTfweiD1CaXhEwQDFZgNSPYdQqSQOXAWFfPPJ+hwxys2bkgmAzhPz59
         72w48GAbMgtl+ILsJNXGBbRKO8vM8BqeQuMwwvASCznYF/sdZFGr56PFgKm/dyv69UUR
         EARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ld1waH7JrJjFSYz+TypXfWal7sdmoWroZgmjA5OUfIQ=;
        b=8NGuFnz3mduppYyqcV6jTZRo5OmNMKvs2TfbPTPyEATeX1M4WKfHHB5+BAxKqEPfBy
         R2bb8rYXv7dhNRavT7XdXsZKUQgtF20fvgNY/pRhcycLet1zysE65S/BhcOnMcykZiUn
         hjPTcUl0VBD89nvUziDLBRvjRF04/c663UwnUq0zRMsRy0qa5nLrvePA0t/DYBjx7QVK
         qMh7ZcMKoOQpX+3GJsWkP78ZANeBcXyNevHrTRtOaqU1opG2DMOivymqTrPeZHim6dYs
         X8vWdFbL6Y6wUIiY7+gf6H22/CMbFCV1ohaf07AWULU79NYhfyr9wPPBq3QUreMVM30H
         45Zg==
X-Gm-Message-State: AOAM533bKAXouCRFarOfPWg4wnUM/IdNOYpCXB0SvJf9NXX/xUhqItvs
	shcpkee+ac16BDAPTIvVpOVa90VkbuMduT8uhgJ02w==
X-Google-Smtp-Source: ABdhPJwtAbGSztyyG2WDx8JfB1rhjyuW1qITUsWHTsTiLGgQjmDV0sRNCawq/hQTlvj6r1OOhP8HEfcB0hGR6ezG824=
X-Received: by 2002:a1c:2246:: with SMTP id i67mr4287195wmi.157.1631788870110;
 Thu, 16 Sep 2021 03:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <8bbba4f2242345528f8439794a20058b@axis.com>
In-Reply-To: <8bbba4f2242345528f8439794a20058b@axis.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 16 Sep 2021 11:40:59 +0100
Message-ID: <CAAnfSTv1fWsLpHbqSQ7xy9+m5JvGFvbnW3EFM893eqKh2pNtUQ@mail.gmail.com>
Subject: Re: Missing Expat license (was: [PATCH 12/14] ffmpeg: update LICENSE)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Sept 2021 at 23:26, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> > > -LICENSE = "BSD & GPLv2+ & LGPLv2.1+ & MIT"
> > > +LICENSE = "GPLv2+ & LGPLv2.1+ & ISC & Expat & BSD-2-Clause & BSD-3-Clause & IJG"
> >
> > There is no "Expat" license in neither meta/files/common-licenses nor
> > in meta/conf/licenses.conf.
>
> Ross, since you added the reference to the Expat license, did you plan on
> actually adding it as well? It being missing breaks at least our license
> handling. After writing this, I went digging in ffmpeg, and it seems that the
> Expat license (only mentioned by name, there is no actual license text) is
> only used for a test image (reference.pnm), which does not end up in any
> package. So to me it seems as this does not need to be included in LICENSE.

Whoops, sorry.  Not sure how I didn't notice this.  It should be MIT.

The other license issues are "interesting", yes.  I think the recipe
needs an overhaul...

Ross

>
> Also, given the long list of licenses that are now in LICENSE, what packages
> are actually expected to use those licenses? AFAICT, all packages that are
> explicitly listed in the recipe either use GPLv2+ or LGPLv2.1+. The default
> licenses only seem to be used for, e.g., ffmpeg-dev, ffmpeg-dbg and
> ffmpeg-doc, which seems weird.
>
> More weirdness, LIC_FILES_CHKSUM lists GPLv2, GPLv3, LGPLv2 and LGPLv3, but
> neither GPLv3 nor LGPLv3 are used in LICENSE. And there are no references for
> any of the newly added licenses.
>
> > >  LICENSE:${PN} = "GPLv2+"
> > >  LICENSE:libavcodec = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
> > >  LICENSE:libavdevice = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
> > > --
> > > 2.25.1
> >
> > //Peter
>
> //Peter
>
