Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web10.166.1616522575774700129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 11:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=mYW0F6Zs;
 spf=pass (domain: blade-group.com, ip: 209.85.221.171, mailfrom: yann.dirson@blade-group.com)
Received: by mail-vk1-f171.google.com with SMTP id s136so4843737vks.4
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 11:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4MFLQ2l/nK/pa9PaKcmrmKrD3KWwUNWGjIczesvYJvM=;
        b=mYW0F6ZsK3QMB9FGiAUq/8Brk1Q93cSkfLHzHJiFU1lCbg69PkCX8pZOf0lZs0aya0
         E8n7+ll/nC8qgrcLsRoX/3q9yNao6TXPT5aaXk3r48aTostey1gvUurrWk6o18zq5ZGH
         BN+/Zp125WkDgy55uyjYj5+4hCXBB67DCPtT8zAN5Slypf2BYSpuU3wJY3xV9H0WKSlb
         E72bHHNXkr1fouXhBFLqs7A5CRPJomJodD48C/x60FgXAhEfgG1D1o6JCsRinHTzPEUY
         Nwwkb1EZF3yw14h0eh7iSH08Mx9NonfqiHUwgmF6NKvKvBnlyK2nvNJGhc4lVVLfoJy3
         RUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4MFLQ2l/nK/pa9PaKcmrmKrD3KWwUNWGjIczesvYJvM=;
        b=oBYgHHql8Naa3l2kunDcnKzvB0JgGxQvh0/MiehOBZBQKYDfAsKU0VI6svewRmi6+s
         IRR3e6vuaIaSDezwcpfifXLwSelpkX+F3AII/PQGF03Xgq1jNnnKZxcykkjgvDq7EUqi
         6pSkkzbDiFQzY7nc4nZ5zJc+orch9pz9DGGczxLrT1lz+g1xDK0eUQru6dmg2nak2uzd
         aZ8N8aGbdcq+VOFP6NHFGaXhZn5pJvVUZNDsfEfYqYH4JPk1VQm4EYgbMbu4z2y+9fpc
         l0o2ti74CojY8ddjXALH31PlPd99xR9b4HEj7qKv4Hssxe+rg+F3mjY1SU9g9sPR7kA3
         pKpg==
X-Gm-Message-State: AOAM531x/4F5Aj3hYuWnbhhx8j+Wwx/wUvcYnbFj6qVsYbjQtvJyWSIN
	V78pAzl+p4PMPQ+rfGb/cW1WQ/Y3nX6ZWCuuJCKYUQ==
X-Google-Smtp-Source: ABdhPJwbq8dhvn5dDKGF6kNhlSFegwZx+t9lwfL19aOxoMUJGMd+i0Lk2Fh9OQruFAuN5t9PJ9/jEHrvPXmbujI0/j8=
X-Received: by 2002:a1f:1f4f:: with SMTP id f76mr4933844vkf.19.1616522574720;
 Tue, 23 Mar 2021 11:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210323163742.810094-1-yann@blade-group.com> <CANNYZj8fm0vTpB-p0PFJNmF4S8oOBmKGhK+R7PBhOdKZXy4R7A@mail.gmail.com>
 <20210323172746.ovdldryxjlupqvdj@qschulz>
In-Reply-To: <20210323172746.ovdldryxjlupqvdj@qschulz>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Tue, 23 Mar 2021 19:02:43 +0100
Message-ID: <CA+4=imaC00dQWRoKupNsL63Oazzq7512CZPOePXvoU1m=t5vqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC] ffmpeg: make LICENSE_FLAGS fine-grained
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 23 mars 2021 =C3=A0 18:27, Quentin Schulz
<quentin.schulz@streamunlimited.com> a =C3=A9crit :
>
> Hi all,
>
> On Tue, Mar 23, 2021 at 05:42:20PM +0100, Alexander Kanavin wrote:
> > Is it possible to further split the NONCOMMERCIAL_PACKAGECONFIGS into o=
nes
> > that are enabled and disabled, and use the former in PACKAGECONFIG itse=
lf?
> >
> > Alex
> >
> > On Tue, 23 Mar 2021 at 17:38, Yann Dirson <yann.dirson@blade-group.com>
> > wrote:
> >
> > > From: Yann Dirson <yann@blade-group.com>
> > >
> > > The rationale here is that if the user can only whitelist "commercial=
"
> > > to use any part of ffmpeg, even it the list of features is carefully
> > > reviewed when switching the whitelisting on, there was nothing to
> > > guard from inadvertently activating a new feature that would not have
> > > been reviewed.
> > >
> > > This patch adds one LICENSE_FLAGS value for each feature, except for
> > > those that bring no codec, trying to be on the same level of legal
> > > safety - but then I may miss something.
> > >
> > > I tried to leave out of the safe NONCOMMERCIAL_PACKAGECONFIGS list
> > > anything that brings a codec, notably libavcodec.  I also did not loo=
k
> > > at non-default features yet.
> > >
> > > There may still be a problem if any feature in ffmpeg gets activated
> > > by default upstream and not registed as a PACKAGECONFIG feature.  At
> > > least any of those that depend on another lib would not be enabled,
> > > that could be seen as a sufficient safeguard.
> > > ---
> > >  meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> > > b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> > > index 08be38ca50..3a36c95151 100644
> > > --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> > > +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
> > > @@ -16,7 +16,17 @@ LICENSE_libavutil =3D
> > > "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGP
> > >  LICENSE_libpostproc =3D "GPLv2+"
> > >  LICENSE_libswresample =3D "${@bb.utils.contains('PACKAGECONFIG', 'gp=
l',
> > > 'GPLv2+', 'LGPLv2.1+', d)}"
> > >  LICENSE_libswscale =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> > > 'GPLv2+', 'LGPLv2.1+', d)}"
> > > -LICENSE_FLAGS =3D "commercial"
> > > +
> > > +# PACKAGECONFIG features that do not pull codecs
> > > +NONCOMMERCIAL_PACKAGECONFIGS =3D " \
> > > + alsa bzlib drm gpl lzma zlib xcb xv \
> > > + avdevice avfilter avformat swresample swscale postproc avresample \
> > > +"
> > > +# An ffmpeg feature not in NONCOMMERCIAL_PACKAGECONFIGS should be
> > > explicitly whitelisted.
> > > +# See https://ffmpeg.org/legal.html
> > > +LICENSE_FLAGS =3D "${@' '.join('commercial_' + cfg \
> > > +                             for cfg in '${PACKAGECONFIG}'.split() \
>
> I would at least make it commercial_ffmpeg- + cfg. To make it obvious
> that it belongs to ffmpeg recipe/packages.

Makes sense.

>
> I guess it breaks backward compatibility, which IMO is fine unless there
> is a possibility someone who blacklisted this commercial license in some
> way now has it enabled. I don't know enough about the inner workings of
> LICENSE_FLAGS so cannot say if this is covered or not.

You mean, that "commercial" would be whitelisted globally, but then
something would
exclude ffmpeg from that whitelist ?  I'm not aware of a way to do that.

If someone whitelisted it, it should be with one of "commercial",
"commercial_ffmpeg",
or "commercial_ffmpeg_${PV}".  It is likely hard to get the 3rd one to
work, but in any case
the compatibility breakage would result in an early build failure, so
I guess it will be
acceptable.

--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.techAFA
