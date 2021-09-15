Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.3826.1631747216666740217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 16:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VtSpTkgI;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id t35so3956680qtc.6
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 16:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HVZ+b2MrBd82jwoS1POe8a/vn8s19KxTET2f9T863Wg=;
        b=VtSpTkgINHTGkWa6+OBi5pnerWFqgt+86q3+7NXBqH5Tx5sIOU3D0S7aAoxBfwGZp8
         1bvUFFmMMV4yFpQ4I+Vqwh0YP6oEaGURw80yw71SiEq47Q4qF8QH28iL/OqD4pNSKmM0
         Em8beFx71IYt2yUw7bz4A7+nSu5glP93zyDoCkBpih4gtKkGX2v0VVXaZVTeiUtf0JwL
         MURcePRf2Gnq6Yys9ehaZY3kLhRmFfGJ2cfcRRyl1N5IBbl7NdHuxwaXIPrpW5ZF0y4e
         zY0wnxc4glJdC3Yk/kpSZeces2P/XYcUALPYJvReSkPkEi1v7lSLGstS3Kci+KXcBUBp
         nn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HVZ+b2MrBd82jwoS1POe8a/vn8s19KxTET2f9T863Wg=;
        b=g6bgSn8mcJIp7VMflEl+V5VyqCQG9h4rfFhEjuUt00ROlgytck/TiscbATVsGv0O1q
         TX4/ozI6TMIYTbuLfgeDLWoZmAPcg5xGafoQCZTrjecURvCIuz62rmz9rW7q5pRT8Lc9
         G8uUY27DGcLkYBqDSBNyc87i3CASS3AvPsDNKpKYdSiW+Gk5Wiym82ImzW6pbms9V9TV
         XMcVjBfkgR5OuxlK653y6SFp6YOp5n7mBAwb1HCOi0lU8gNi+LOss7ctS5dnoLh1HxPe
         FvE7qtCjE2J5yfFIQe1MPeSH2nbKoDMd0ZmHQa64ciBW7mPXaa9VbFr3/DVRdcOHglUl
         dDZA==
X-Gm-Message-State: AOAM531qqsNwWMnbWV6WM1xCuFwVa+FYJqp2JPVP6iRcVj6TA82rb6JF
	hicsft/5yRW+DaDuAXNz3vDPrHlegrmxRXaAOa/rxodXXuf0Xw==
X-Google-Smtp-Source: ABdhPJxGI8DLPLVyjCeAeANy5o0ECO5Jz0v9DdUa0+gqkldQPQ13dY9I5rlhqiVM3I9PT+vrve9mEMSXhnT4W5ywG/o=
X-Received: by 2002:ac8:67d7:: with SMTP id r23mr2405834qtp.227.1631747215549;
 Wed, 15 Sep 2021 16:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <8bbba4f2242345528f8439794a20058b@axis.com>
In-Reply-To: <8bbba4f2242345528f8439794a20058b@axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 15 Sep 2021 16:06:29 -0700
Message-ID: <CAMKF1spmgQ7smkNOJDaJNBBcfhOuaRZOYtos3+XXDAt1DF+T1A@mail.gmail.com>
Subject: Re: [OE-core] Missing Expat license (was: [PATCH 12/14] ffmpeg: update LICENSE)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Ross Burton <ross@burtonini.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 15, 2021 at 3:26 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> > Sent: den 9 september 2021 21:54
> > To: Ross Burton <ross@burtonini.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 12/14] ffmpeg: update LICENSE
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > core@lists.openembedded.org> On Behalf Of Ross Burton
> > > Sent: den 3 september 2021 15:25
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] [PATCH 12/14] ffmpeg: update LICENSE
> > >
> > > "BSD" is ambiguous, ffmpeg comprises of several licenses which are
> > > BSD-like.
> > >
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> > b/meta/recipes-
> > > multimedia/ffmpeg/ffmpeg_4.4.bb
> > > index e19077541ec..f822ba9ab78 100644
> > > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> > > +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> > > @@ -5,7 +5,7 @@ DESCRIPTION = "FFmpeg is the leading multimedia framework,
> > > able to decode, encod
> > >  HOMEPAGE = "https://www.ffmpeg.org/"
> > >  SECTION = "libs"
> > >
> > > -LICENSE = "BSD & GPLv2+ & LGPLv2.1+ & MIT"
> > > +LICENSE = "GPLv2+ & LGPLv2.1+ & ISC & Expat & BSD-2-Clause & BSD-3-Clause & IJG"
> >
> > There is no "Expat" license in neither meta/files/common-licenses nor
> > in meta/conf/licenses.conf.
>

Perhaps adding it might be one way see
https://directory.fsf.org/wiki/License:Expat
SPDX seems to not have specific entry for it as it points to MIT there
I think ptest package will contain vsynth2.yuv which is built using
reference.pnm so technically
we need to use Expat for ptest package.

> Ross, since you added the reference to the Expat license, did you plan on
> actually adding it as well? It being missing breaks at least our license
> handling. After writing this, I went digging in ffmpeg, and it seems that the
> Expat license (only mentioned by name, there is no actual license text) is
> only used for a test image (reference.pnm), which does not end up in any
> package. So to me it seems as this does not need to be included in LICENSE.
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
>
> 
>
