Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 999917D41E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 10:44:45 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id q132so10337293itc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 03:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OqIEvMj83tHuHeIEf7iPTO2h9xxHQ5n2vdluUhycHVk=;
	b=Og7JcoKCGwf8j5zkj0R45Y9Wac7efZ2U3rf4kpJz3Oa83jbo7aL3pQ1lXQGuXmj5uO
	4R/0aNuv+pY5X65sL3PpJz2Dbj+aWAv0vtcGZm7dmbkNr6AoOiN583G1y4YVs8zLWOJ1
	S9M/wrh4W6uKGBy7zpwbwNO8ikIW9JFyG4B2YZaOWWuaUAY4LvquuI/OIoFf0vJf/Siw
	Q4LMB7Uieokjm1NhlbmzGAYiNpQEiGeErT/MEmrgVdSlf9ddRI22b315oqWuVgdHUB9j
	X8M+XJ8CPFeszNqaJmbFqzPoup6URKReUykaDP+9/5JqIYuxp+D4VrnlikzTBJwAyn81
	Qf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OqIEvMj83tHuHeIEf7iPTO2h9xxHQ5n2vdluUhycHVk=;
	b=rogn3PV3tRgmvIYP4+dZSqL3xf73Wu/qTkSzXsAoy+frzFM4Xf5fL9dkl6KU4X4smW
	06t0Kf01+G9SST11y0nyu+r1Gg8qEa+mCUkzP7VeJfmqLvtPxfM5R9tUU+APY7iYuD/P
	o1mf/5IOM7tHIL7se0P3HViLfj549gPZ9jArE2tcJnWYroo8ZhM/FlIMRRlclrn6c04w
	4/LGZ7XzcIMa1BLsSXCKwl6EaNw6LfahhlXXxwJRMJ5DPhYdwv84w3QRlF6XguRqBS8r
	Y5BP+x5ja/PecvQ2e5/FQjYjyXoQgnjbeGUeIYzH0Lz0nkkWBjCgkUwTh9yliv0OZKHX
	fC0g==
X-Gm-Message-State: APjAAAW+2c7MkMGx2+FSkb4Sd4sD9u94XBf9gh5eYPu5FLo958jSKZJH
	eoi2Vhov27zO+FHRBvVFy82N56E4s2IBW6gMH1HmrA==
X-Google-Smtp-Source: APXvYqy+OijQ/PoLDXkWORwGIZ4S/vVYjOpH/RW++Hi6j2bvUK9GI+Z+fosScvofTjamN6OUdGvQrNepWkV35XtKCyM=
X-Received: by 2002:a24:4145:: with SMTP id x66mr23159128ita.130.1557225886539;
	Tue, 07 May 2019 03:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190424051620.10065-1-open.source@oleksandr-kravchuk.com>
	<bdd177a6-9d65-ed60-cb2f-20fea4effbea@oleksandr-kravchuk.com>
	<CANNYZj9gNDaNgzx=240=thj_QA6h0Wrs_qvwfSabun72-r-Pog@mail.gmail.com>
In-Reply-To: <CANNYZj9gNDaNgzx=240=thj_QA6h0Wrs_qvwfSabun72-r-Pog@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 May 2019 11:44:35 +0100
Message-ID: <CAJTo0LbJghj1jokkpoKz1xwg+FTUckUMSxZQsWsj0wvgMFc2eg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH v2] ell: add recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2019 10:44:45 -0000
Content-Type: text/plain; charset="UTF-8"

It's sitting in mut, I'll prod RP today :)

On Mon, 6 May 2019 at 16:42, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Please resend, patches do get lost sometimes.
>
> Alex
>
> On Mon, 6 May 2019 at 16:36, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
> >
> > Khem -
> >
> > Is it being hold for a specific reason or it was just lost? Thanks.
> >
> > On 24/04/2019 07:16, Oleksandr Kravchuk wrote:
> > > ELL has originally been part of meta-openembedded, but newer versions
> > > of some of the oe-core components depend on it, e.g. ofono.
> > >
> > > Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > > ---
> > >  meta/conf/distro/include/maintainers.inc |  1 +
> > >  meta/recipes-core/ell/ell_0.19.bb        | 22 ++++++++++++++++++++++
> > >  2 files changed, 23 insertions(+)
> > >  create mode 100644 meta/recipes-core/ell/ell_0.19.bb
> > >
> > > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> > > index 41c2a95d53..c00e5b8c65 100644
> > > --- a/meta/conf/distro/include/maintainers.inc
> > > +++ b/meta/conf/distro/include/maintainers.inc
> > > @@ -166,6 +166,7 @@ RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
> > >  RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
> > >  RECIPE_MAINTAINER_pn-eglinfo-wayland = "Alexander Kanavin <alex.kanavin@gmail.com>"
> > >  RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
> > > +RECIPE_MAINTAINER_pn-ell = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> > >  RECIPE_MAINTAINER_pn-enchant = "Anuj Mittal <anuj.mittal@intel.com>"
> > >  RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
> > >  RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
> > > diff --git a/meta/recipes-core/ell/ell_0.19.bb b/meta/recipes-core/ell/ell_0.19.bb
> > > new file mode 100644
> > > index 0000000000..8f635e673c
> > > --- /dev/null
> > > +++ b/meta/recipes-core/ell/ell_0.19.bb
> > > @@ -0,0 +1,22 @@
> > > +SUMMARY  = "Embedded Linux Library"
> > > +DESCRIPTION = "The Embedded Linux Library (ELL) provides core, \
> > > +low-level functionality for system daemons. It typically has no \
> > > +dependencies other than the Linux kernel, C standard library, and \
> > > +libdl (for dynamic linking). While ELL is designed to be efficient \
> > > +and compact enough for use on embedded Linux platforms, it is not \
> > > +limited to resource-constrained systems."
> > > +SECTION = "libs"
> > > +LICENSE  = "LGPLv2.1"
> > > +LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> > > +
> > > +DEPENDS = "dbus"
> > > +
> > > +inherit autotools pkgconfig
> > > +
> > > +SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
> > > +SRC_URI[md5sum] = "4356397ca11d5f8ec7f1aaf1e91ffea4"
> > > +SRC_URI[sha256sum] = "a5a4d45ca002dd91560fcd565e696f59e82631e69c927115dafc640f0b8d779c"
> > > +
> > > +do_configure_prepend () {
> > > +    mkdir -p ${S}/build-aux
> > > +}
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

