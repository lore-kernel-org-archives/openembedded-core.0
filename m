Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.7671.1603972859072328604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 05:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lGZ1xCu7;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id j24so3393445ejc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 05:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9ILY4Vl97U0889GSeJ8wVjX3DgLXBkCmx76ae6SC1eU=;
        b=lGZ1xCu71GLP1RwPk+M+IpIbyl5bedaziAvomHrQ/l3zMBaDcpNpbQxGk07VelmfHE
         Ic23RC9uhCwtczK6hfti6s+R7vLJ+yRsmFZ7qW77BknqCjHC8mJMdTLcKWwJtGC0G7Ro
         v7IS6nC6NzjP7vdh3h/QnT8U68Y9IiPupJ6Q5J6wDZXC6OdYxX5u4/9Y/UkaqJ7JMibG
         Xhv/lbtdnRl3n97BPoQBCjAXOe5I6bnVrAg6MSFRiPnjuzKdyj8/ts1qHti6bo2KRdk6
         Jj4PLXPI17B8Z+8KELtGFTuiLmLxGM3NFwOGroTmcpiseruPhHHMCJQ4Oxjzh4eeQJKl
         uRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9ILY4Vl97U0889GSeJ8wVjX3DgLXBkCmx76ae6SC1eU=;
        b=p4auHWUetjje+bbtsBMCzt+nFPLszD3kIktmhzh7ll1UbEva6N0O7Bwjc02xwEG2xl
         XCHUbEGpTNJo8Bx31c+C+l4FDeS3zqfdkmjXXbOr+2Q3fRe/i0zENgXKkktRx84U7Xr4
         jxYYCatnIgCBhnnLG/ta3TTAB0n4W0b9gMhyeFyoC9sRGpJkZE8ZsUmNUo6b+fRN6/a2
         gDgQsSjOSVe2uH3dkBfO21QEGBph/QzzIFkN5Rr58cCA0EBe4RXDsXiZ1t5I2lrNy++J
         9SYm1DIDxatm8Idmhag23qKMeFzni8EFAyflWPowFXGHCovCRbgrJAovcr4Po7Lgtdtk
         ORgg==
X-Gm-Message-State: AOAM533Q1QN5atQ1F/nItwteYR1svd1oYp9APxHt17lAkgkcPif5taGW
	eJ7UrQ+lnyzHhArvGx+AgMfJRWNiEQTJ47U/a5Q=
X-Google-Smtp-Source: ABdhPJyqoXSC16uMgeyStFihvbPWBINB897Vxk3Yx1A7LkGaaNVHPMXYyOukuWSAQ4HyVsvLWdmIVcneFGVrbuEZTDM=
X-Received: by 2002:a17:906:5509:: with SMTP id r9mr3805290ejp.12.1603972857403;
 Thu, 29 Oct 2020 05:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201023184132.3208737-1-quaresma.jose@gmail.com> <6c5cc7223aec5587143b1d7e165346494a4ab77d.camel@linuxfoundation.org>
In-Reply-To: <6c5cc7223aec5587143b1d7e165346494a4ab77d.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 29 Oct 2020 12:00:57 +0000
Message-ID: <CANPvuRkMioP_k1f6=xj3Gn==wQq-JUtzqcux=sCV98CibvKFrA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 00/21] Updates the gstreamer to version 1.18.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Starting with 1.17, gstreamer1.0-libav will not ship a copy of FFmpeg.
ffmpeg is on meta-oe and because this recipe needs to be moved to
meta-oe as well.
I think [gstreamer1.0-libav: upgrade to version 1.18.0] can dropped from OE=
-core
and I will submit it to meta-oe.

Sorry for this. I have built all the recipes in the series but I have
meta-oe present in my layers.

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
quinta, 29/10/2020 =C3=A0(s) 11:18:
>
> On Fri, 2020-10-23 at 19:41 +0100, Jose Quaresma wrote:
> > V2:
> > - Fixes the build of vulkan plugin
> > - Fixes pacth headers
> > - Upgrade orc 0.4.31 -> 0.4.32
> >
> > V3:
> > - gstreamer1.0: Fix reproducibility issue around libcap
> > - gstreamer1.0-python: install append is not need any more
> > - gstreamer1.0-plugins-[good/bad]: disable new meson options
> > - gstreamer1.0-plugins-[base/good/bad]: add new meson option as
> > PACKAGECONFIG
> > - Update pacth headers
> >
> > V4:
> >
> > - gstreamer1.0-plugins-good: on wayland qt5 needs qtwayland
>
> Thanks for these, I've tried running some tests in master-next with the
> patchset. There was an issue on no-x11 builds:
>
> step1b: ERROR: Nothing PROVIDES 'ffmpeg' (but /home/pokybuild/yocto-worke=
r/no-x11/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.=
bb DEPENDS on or otherwise requires it)
> step1b: ERROR: Nothing RPROVIDES 'gstreamer1.0-libav-dev' (but /home/poky=
build/yocto-worker/no-x11/build/meta/recipes-multimedia/gstreamer/gstreamer=
1.0-libav_1.18.0.bb RDEPENDS on or otherwise requires it)
> step1b: ERROR: Nothing RPROVIDES 'gstreamer1.0-libav' (but /home/pokybuil=
d/yocto-worker/no-x11/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-=
libav_1.18.0.bb RDEPENDS on or otherwise requires it)
>
> in the build:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2629
>
> Would you be able to help sort that out?
>
> Cheers,
>
> Richard
>


--=20
best regards,
Jos=C3=A9 Quaresma
