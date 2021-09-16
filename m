Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.1273.1631799765699181388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 06:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gNaMjcav;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id bk29so7337844qkb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 06:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nxp9WrqUvRzMsn1pcHfyMjiKgCm4A7N/77MBfp4gmnY=;
        b=gNaMjcav/RzvpvT/OQBIsik5uoiocdkquqnfyefRgJKwU6+yJmqvCxkS4YVXoEoHgS
         PMYhxeVbLLS319C5Lda2UNM1gETsBlUQeh1wAuHs7g8keAI3y0z65IHrqq2dmE9V9WG8
         Lo0WUC5fRmYTdIpbLZTzsHIWNDpcdPSXcVY5toTaKHdwN66ZHAWbrId7rcFBRAifKGh0
         43bX+CFb4+mXBiLI5T4vm8EuRWHk4U7XRIRodNqU/reNYzfOkENFzKWFlJmwKRwgynL8
         oiz67F43gmNOzgK4v2wFCi+vks8uw98TEmRIk693+MRDjRjqElGtO2/7UVuxhE2j2R1x
         8Hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nxp9WrqUvRzMsn1pcHfyMjiKgCm4A7N/77MBfp4gmnY=;
        b=BxoFmVEFPgtxdrucgwcS9y8xZA3REN71z286mbboa3quLpcGb9xr+OV02EGuo5QR3F
         TNfl9TC2QHQCRIrbiCVO8lHA/eCK2zozs5o5uckjmvbGiHLdhaxPW9YBydD0R4Txty71
         LVwTAfkfXY2ID6m497BruSf1HZU+QcRJsoJJIe4K+A2Vq1to575+j2X/YwcWaaiTw9Ep
         jW/Oy43qUe6jJLH0YuvgQ3yh5nKT0xjbXlQpZfz9Sl5MPt6OdM9Ihf0aJjW87o4ER+Vh
         h0l67DLPVqf4TLSrTynkjdkcPUiIfttIvSx80Z7Fozdw2DFf6XDHwcxo4738lD3WnL9+
         HL3g==
X-Gm-Message-State: AOAM5338GS6GpnfWPzfFMoTZK0ZVd/caDsIkJD9v9z9JFCv1XTjlxlAs
	9V2PYQ61rHC3lxqZ88zobUtxhZ1ta/NuuF6hY8VS8kBr1gSVOw==
X-Google-Smtp-Source: ABdhPJyzphqPbC7s6kc+xWYxOu/Pek2PO/K4TRYjFuAI3Z4iYM1Yb0Em1whWFO5jF2d/2Xk4l4UilmDAEAQeIYpJN8Y=
X-Received: by 2002:a05:620a:1086:: with SMTP id g6mr4971271qkk.105.1631799764667;
 Thu, 16 Sep 2021 06:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <8bbba4f2242345528f8439794a20058b@axis.com> <CAMKF1spmgQ7smkNOJDaJNBBcfhOuaRZOYtos3+XXDAt1DF+T1A@mail.gmail.com>
 <145eb216f49f4a15a2fbf7ef8ce974ed@axis.com>
In-Reply-To: <145eb216f49f4a15a2fbf7ef8ce974ed@axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 16 Sep 2021 06:42:18 -0700
Message-ID: <CAMKF1so3hAEo2xuNEasNFbJ1KA+6WNQBb+H7UhQZS+Xx0Tp_zA@mail.gmail.com>
Subject: Re: [OE-core] Missing Expat license (was: [PATCH 12/14] ffmpeg: update LICENSE)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Ross Burton <ross@burtonini.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 16, 2021 at 2:15 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: den 16 september 2021 01:06
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: Ross Burton <ross@burtonini.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] Missing Expat license (was: [PATCH 12/14] ffmpeg:
> > update LICENSE)
> >
> > On Wed, Sep 15, 2021 at 3:26 PM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > > Sent: den 9 september 2021 21:54
> > > > To: Ross Burton <ross@burtonini.com>; openembedded-
> > > > core@lists.openembedded.org
> > > > Subject: Re: [OE-core] [PATCH 12/14] ffmpeg: update LICENSE
> > > >
> > > > > -----Original Message-----
> > > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > > core@lists.openembedded.org> On Behalf Of Ross Burton
> > > > > Sent: den 3 september 2021 15:25
> > > > > To: openembedded-core@lists.openembedded.org
> > > > > Subject: [OE-core] [PATCH 12/14] ffmpeg: update LICENSE
> > > > >
> > > > > "BSD" is ambiguous, ffmpeg comprises of several licenses which are
> > > > > BSD-like.
> > > > >
> > > > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > > > ---
> > > > >  meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> > > > b/meta/recipes-
> > > > > multimedia/ffmpeg/ffmpeg_4.4.bb
> > > > > index e19077541ec..f822ba9ab78 100644
> > > > > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> > > > > +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> > > > > @@ -5,7 +5,7 @@ DESCRIPTION = "FFmpeg is the leading multimedia
> > framework,
> > > > > able to decode, encod
> > > > >  HOMEPAGE = "https://www.ffmpeg.org/"
> > > > >  SECTION = "libs"
> > > > >
> > > > > -LICENSE = "BSD & GPLv2+ & LGPLv2.1+ & MIT"
> > > > > +LICENSE = "GPLv2+ & LGPLv2.1+ & ISC & Expat & BSD-2-Clause & BSD-3-
> > Clause & IJG"
> > > >
> > > > There is no "Expat" license in neither meta/files/common-licenses nor
> > > > in meta/conf/licenses.conf.
> > >
> >
> > Perhaps adding it might be one way see
> > https://directory.fsf.org/wiki/License:Expat
> > SPDX seems to not have specific entry for it as it points to MIT there
>
> If "the expat license" is in fact MIT (hard to tell as there is no license
> text in the ffmpeg sources), I do not see why we would need a special license
> for it. All other recipes use "MIT" without creating a specific license file.
> This includes the expat recipe itself, which use "MIT" as license.
>

this here is a interesting take on it
https://www.gnu.org/licenses/license-list.html#Expat
so it really is not MIT as per above

> > I think ptest package will contain vsynth2.yuv which is built using
> > reference.pnm so technically
> > we need to use Expat for ptest package.
>
> ffmpeg does not produce any ptest package AFAICT.

We will still have it. it in -src packages, if its not used then
perhaps just delete this file.

>
> //Peter
>
> > > Ross, since you added the reference to the Expat license, did you plan
> > on
> > > actually adding it as well? It being missing breaks at least our license
> > > handling. After writing this, I went digging in ffmpeg, and it seems
> > that the
> > > Expat license (only mentioned by name, there is no actual license text)
> > is
> > > only used for a test image (reference.pnm), which does not end up in any
> > > package. So to me it seems as this does not need to be included in
> > LICENSE.
> > >
> > > Also, given the long list of licenses that are now in LICENSE, what
> > packages
> > > are actually expected to use those licenses? AFAICT, all packages that
> > are
> > > explicitly listed in the recipe either use GPLv2+ or LGPLv2.1+. The
> > default
> > > licenses only seem to be used for, e.g., ffmpeg-dev, ffmpeg-dbg and
> > > ffmpeg-doc, which seems weird.
> > >
> > > More weirdness, LIC_FILES_CHKSUM lists GPLv2, GPLv3, LGPLv2 and LGPLv3,
> > but
> > > neither GPLv3 nor LGPLv3 are used in LICENSE. And there are no
> > references for
> > > any of the newly added licenses.
> > >
> > > > >  LICENSE:${PN} = "GPLv2+"
> > > > >  LICENSE:libavcodec = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> > 'GPLv2+', 'LGPLv2.1+', d)}"
> > > > >  LICENSE:libavdevice = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> > 'GPLv2+', 'LGPLv2.1+', d)}"
> > > > > --
> > > > > 2.25.1
> > > >
> > > > //Peter
> > >
> > > //Peter
> > >
> > >
> > > 
> > >
