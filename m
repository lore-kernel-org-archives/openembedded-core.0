Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.8765.1620493555156302975
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 May 2021 10:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yq3ymabq;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id a5so3180825pfa.11
        for <openembedded-core@lists.openembedded.org>; Sat, 08 May 2021 10:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Xcvn9jCUi5UxokChZ9z5+Mh/IM0j754fnOWJ5UA0MJU=;
        b=Yq3ymabqqrMU0OVGNfpeIV1y4JD6kwatqq7GBo53nyPUvob8aLSn7oZsufkVMimSXy
         ZjzX0XgDMqaAZq2doMXhw6UPlRhqBq2lt62ZeAkvW7RNoANiXP/nBgDzxVCGLw3gZDLM
         bg9iXaNzer+qN9gXNc5+fB+dScggz6eEKBK/o3/qdxoaDoUrp1bfJPpkNqphFe1fUTSc
         kMpVl+hp6xLTT7IFeNXy50PIur5jwbgrfjI67F9ait6ee2fmY2tHpPtDl3RsBBIGfkz8
         T0jrw1De3bA6wmNFuGnXBF8eKVPGdNFGmUXi862qkprUB4st7CIgc165H/FDWsfhVgWk
         nBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Xcvn9jCUi5UxokChZ9z5+Mh/IM0j754fnOWJ5UA0MJU=;
        b=qkfA0OKO+TCd+Et+5e9Yn7TyIORHFWI18CItmMQH5Zy9/bDtdi5ZcRnDDgwAdyO13j
         GrI0e32WhTA/hjmCN+GWEkPecsb40j112YI3cjbalJaGohL9YAirmSmCiDNs+W20DqUK
         LN+KIuxyELLEOWV9BzRDfXCSA+NigqpCLmtjdFggNSG1qWYw+dPcwX/mf0XvFhlc/s67
         ujWqWk7y+ebxBuItk55ohyjzPM3/zh736fYKjkCBjAxZ1Dlt4yvSFLi8kMKtNXF8axNa
         kL194BjLH2bLXV+dgRqJ4fHSgCV17ZTcwXG3GtDGhRViH5YDqnzscrnpaF6BI321Ol62
         2N2A==
X-Gm-Message-State: AOAM5325AuVtJsjMgUtVvuo+8gT7GEuFCUiXpyOchbTrjkAF2Vrh21Sm
	YrlEzuBeUWEbUsvtumfBqU2e5iSQZD6YLJ6Y1uA=
X-Google-Smtp-Source: ABdhPJwKBoqNuAFLFqR6EgKqYCikwjLQfRy090Bp3iCfC2tCb7qbQ2GVbqeoFxBAgLY3+Ez/nPnIoJ0pAVK2lXXmdYM=
X-Received: by 2002:a65:6a50:: with SMTP id o16mr16562545pgu.6.1620493554535;
 Sat, 08 May 2021 10:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdbUdiAU4Eq-6Ogzudm70ieGhzuop0_zCiOBYvczYKi+cQ@mail.gmail.com>
 <CALbNGRS5TPuj_+prg_jsFyMckyoaFzxFO0g_Lq4QCSZCw+-CJA@mail.gmail.com> <CAOSpxdYnKTSjBPD1BuqYyo6r1X6TzQm9M6_wpDPWq4y66Vhk3Q@mail.gmail.com>
In-Reply-To: <CAOSpxdYnKTSjBPD1BuqYyo6r1X6TzQm9M6_wpDPWq4y66Vhk3Q@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 8 May 2021 19:05:43 +0200
Message-ID: <CALbNGRS7ziX_bR0V-=gREaF9SqdPsYWHCEVVAye6_V2hY+A2LQ@mail.gmail.com>
Subject: Re: [OE-core] Dunfell support for Fedora 33
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 7:17 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Thu, Apr 29, 2021 at 6:57 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Thu, Apr 22, 2021 at 6:24 PM Steve Sakoman <steve@sakoman.com> wrote=
:
> > >
> > > I'd like to work toward getting Fedora 33 as a supported distro for
> > > the next dunfell release (3.1.8).
> > >
> > > Initial autobuilder testing looks fairly good, but I'd like to get
> > > some feedback from people who are already doing dunfell builds on
> > > Fedora 33.  Have you run into any issues?  If including
> > > meta-openembedded in your builds, any issues there?
> > >
> > > Thanks!
> > >
> > > Steve
> > >
> > Hi,
> >
> > FWIW: on my new machine I gave my monster image a build with dunfell /
> > fedora 33. Ok this is not a world build but I had no issues on oe-core
> > / meta-openembedded.
>
> Thanks for the report!
>
> Steve
Hi Steve,

it seems Fedora 33 updated python to 3.9.2 (bottom posts in [1]) and
am not sure my tests included that. Will try another build.

[1] https://github.com/kraj/meta-clang/issues/463

Cheers,

Andreas
