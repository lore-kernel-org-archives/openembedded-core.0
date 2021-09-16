Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.407.1631804410420511609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 08:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CqNs+hM6;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id s32so5746769qtc.12
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 08:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kcj6pE6ter9Q4aMquBpQyb0UY2ZUIMh/lBr5kG2Tc3Y=;
        b=CqNs+hM6XIkUxAdILGG8Xps8buJ3be56EyL6OPEt+i1AomF14LIRDrLuBLhNjmv2W9
         Tq3vnYBSxRJrnwGRFsjm7sN/wGNDlo8Mr3oShhH7W63T1RyFsKKEgpuY2H38+BYZjbtI
         kbkWIAtM7563d+mtvfhikKPOrkuF5sy2HF9p0qCo8vPmuZzLNr9hSNKAofUlLHkXi43q
         x55I1iqK7QVo6knzcu6EeJIBAnx32G91ddenwL9sjZ+J0lSe25kwM3GCynupj7NULFWt
         MpJujbspSXKM1I2LmGZ3x3qNkT4RqoNsptxfBbumdMm000YHY6OPNKS/hB1icGSCgEQM
         8Ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kcj6pE6ter9Q4aMquBpQyb0UY2ZUIMh/lBr5kG2Tc3Y=;
        b=8EGw+dm4BeVfxS9dW6fb6ZrqSuhMrUXvYSPLPjhnTGJ0/SlEN6bTVPMw4Ojmpzs1Q6
         t3KUk+p2KaeD94JPd3Ep2Yw8Bk2rOJarQvvZwWy6ayZQ56JA0ZZG1Z5Pyit//QU6lsq+
         ncYBZTmR5Tnc7VR3qXPvAxIGn/hPXAm7Wo0Yg5V5U7Kx0+At0ukgUPeGpvU1j3goCroo
         BJ/5X9cjP89o8B7Z9tzHk4F8XLf1EWdUBRXseCiHejQUhT+LAjuTLn40XumVmRITlnaE
         YtJ34fVwociKMg41ITMJbDDAneYfvtNnzRgEcQcCAUFSLcXQzRt2UCi+D98TFwATd+pf
         XeeQ==
X-Gm-Message-State: AOAM532yv54eAR6q2PSNOhiyUV3vYckN7HqmJRIYp4KtZZTR7+87SzGE
	2zoO5SkGQgqmAS8WPH8M/SjXx1G4dL4MRdGVvCc=
X-Google-Smtp-Source: ABdhPJy5T5qOy8WVhtgb3UI0fwRgmGK0pGaSlXoBtielDBbf7C4gSQZDIr5dFGnjohMxBOksPZ1XA3upVvQHPjKjsQo=
X-Received: by 2002:ac8:78c:: with SMTP id l12mr5599888qth.112.1631804409410;
 Thu, 16 Sep 2021 08:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <8bbba4f2242345528f8439794a20058b@axis.com> <CAMKF1spmgQ7smkNOJDaJNBBcfhOuaRZOYtos3+XXDAt1DF+T1A@mail.gmail.com>
 <145eb216f49f4a15a2fbf7ef8ce974ed@axis.com> <CAMKF1so3hAEo2xuNEasNFbJ1KA+6WNQBb+H7UhQZS+Xx0Tp_zA@mail.gmail.com>
 <ee4e816f88884724b659d99689f31a16@axis.com>
In-Reply-To: <ee4e816f88884724b659d99689f31a16@axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 16 Sep 2021 07:59:43 -0700
Message-ID: <CAMKF1sryt7C8kGUGiwHtM+-k-ZdCmqCr6hFy3QKO+DocQWRz9A@mail.gmail.com>
Subject: Re: [OE-core] Missing Expat license (was: [PATCH 12/14] ffmpeg: update LICENSE)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Ross Burton <ross@burtonini.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 16, 2021 at 7:32 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: den 16 september 2021 15:42
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: Ross Burton <ross@burtonini.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] Missing Expat license (was: [PATCH 12/14] ffmpeg:
> > update LICENSE)
> >
> > On Thu, Sep 16, 2021 at 2:15 AM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: Khem Raj <raj.khem@gmail.com>
> > > > Sent: den 16 september 2021 01:06
> > > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > Cc: Ross Burton <ross@burtonini.com>; openembedded-
> > > > core@lists.openembedded.org
> > > > Subject: Re: [OE-core] Missing Expat license (was: [PATCH 12/14]
> > ffmpeg:
> > > > update LICENSE)
> > > >
> > > > On Wed, Sep 15, 2021 at 3:26 PM Peter Kjellerstedt
> > > > <peter.kjellerstedt@axis.com> wrote:
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > > > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > > > > > Sent: den 9 september 2021 21:54
> > > > > > To: Ross Burton <ross@burtonini.com>; openembedded-
> > > > > > core@lists.openembedded.org
> > > > > > Subject: Re: [OE-core] [PATCH 12/14] ffmpeg: update LICENSE
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > > > > core@lists.openembedded.org> On Behalf Of Ross Burton
> > > > > > > Sent: den 3 september 2021 15:25
> > > > > > > To: openembedded-core@lists.openembedded.org
> > > > > > > Subject: [OE-core] [PATCH 12/14] ffmpeg: update LICENSE
> > > > > > >
> > > > > > > "BSD" is ambiguous, ffmpeg comprises of several licenses which
> > are
> > > > > > > BSD-like.
> > > > > > >
> > > > > > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > > > > > ---
> > > > > > >  meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 2 +-
> > > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> > > > > > b/meta/recipes-
> > > > > > > multimedia/ffmpeg/ffmpeg_4.4.bb
> > > > > > > index e19077541ec..f822ba9ab78 100644
> > > > > > > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> > > > > > > +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> > > > > > > @@ -5,7 +5,7 @@ DESCRIPTION = "FFmpeg is the leading multimedia
> > > > framework,
> > > > > > > able to decode, encod
> > > > > > >  HOMEPAGE = "https://www.ffmpeg.org/"
> > > > > > >  SECTION = "libs"
> > > > > > >
> > > > > > > -LICENSE = "BSD & GPLv2+ & LGPLv2.1+ & MIT"
> > > > > > > +LICENSE = "GPLv2+ & LGPLv2.1+ & ISC & Expat & BSD-2-Clause &
> > BSD-3-
> > > > Clause & IJG"
> > > > > >
> > > > > > There is no "Expat" license in neither meta/files/common-licenses
> > nor
> > > > > > in meta/conf/licenses.conf.
> > > > >
> > > >
> > > > Perhaps adding it might be one way see
> > > > https://directory.fsf.org/wiki/License:Expat
> > > > SPDX seems to not have specific entry for it as it points to MIT there
> > >
> > > If "the expat license" is in fact MIT (hard to tell as there is no
> > license
> > > text in the ffmpeg sources), I do not see why we would need a special
> > license
> > > for it. All other recipes use "MIT" without creating a specific license
> > file.
> > > This includes the expat recipe itself, which use "MIT" as license.
> > >
> >
> > this here is a interesting take on it
> > https://www.gnu.org/licenses/license-list.html#Expat
> > so it really is not MIT as per above
>
> Well, that page does not seem to acknowledge the term "the MIT
> license", which the rest of us obviously do... So while they
> may call it the Expat license, the actual license text at
> https://directory.fsf.org/wiki/License:Expat is still ye goode
> olde MIT text.
>
> > > > I think ptest package will contain vsynth2.yuv which is built using
> > > > reference.pnm so technically
> > > > we need to use Expat for ptest package.
> > >
> > > ffmpeg does not produce any ptest package AFAICT.
> >
> > We will still have it. it in -src packages, if its not used then
> > perhaps just delete this file.
>
> It does not end up in ffmpeg-src (since it is a picture I presume and
> not a source file) nor anywhere else (I have searched through the
> packages-split directory after building ffmpeg with the "poky" distro,
> which, e.g., enables ptest by default).

OK that should be fine then, I thought we bundled all sources +
generated sources with -src pkgs

>
> //Peter
>
> > > //Peter
> > >
> > > > > Ross, since you added the reference to the Expat license, did you
> > plan
> > > > on
> > > > > actually adding it as well? It being missing breaks at least our
> > license
> > > > > handling. After writing this, I went digging in ffmpeg, and it seems
> > > > that the
> > > > > Expat license (only mentioned by name, there is no actual license
> > text)
> > > > is
> > > > > only used for a test image (reference.pnm), which does not end up in
> > any
> > > > > package. So to me it seems as this does not need to be included in
> > > > LICENSE.
> > > > >
> > > > > Also, given the long list of licenses that are now in LICENSE, what
> > > > packages
> > > > > are actually expected to use those licenses? AFAICT, all packages
> > that
> > > > are
> > > > > explicitly listed in the recipe either use GPLv2+ or LGPLv2.1+. The
> > > > default
> > > > > licenses only seem to be used for, e.g., ffmpeg-dev, ffmpeg-dbg and
> > > > > ffmpeg-doc, which seems weird.
> > > > >
> > > > > More weirdness, LIC_FILES_CHKSUM lists GPLv2, GPLv3, LGPLv2 and
> > LGPLv3,
> > > > but
> > > > > neither GPLv3 nor LGPLv3 are used in LICENSE. And there are no
> > > > references for
> > > > > any of the newly added licenses.
> > > > >
> > > > > > >  LICENSE:${PN} = "GPLv2+"
> > > > > > >  LICENSE:libavcodec = "${@bb.utils.contains('PACKAGECONFIG',
> > 'gpl',
> > > > 'GPLv2+', 'LGPLv2.1+', d)}"
> > > > > > >  LICENSE:libavdevice = "${@bb.utils.contains('PACKAGECONFIG',
> > 'gpl',
> > > > 'GPLv2+', 'LGPLv2.1+', d)}"
> > > > > > > --
> > > > > > > 2.25.1
> > > > > >
> > > > > > //Peter
> > > > >
> > > > > //Peter
> > > > >
> > > > >
> > > > > 
> > > > >
