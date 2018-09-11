Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id BFA767964B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 19:13:47 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id g44-v6so29428407qtb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 12:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Yrkcq3919bIrw+owWW6aHJjGvP9ZNnzCyCXEAXtU5+o=;
	b=DVNloJOfd8WZXYF2FdfgJh+fjIMpF1cW2Jgye9VTbAsZVqN/5rTrGxILySB9Jufmi2
	VYxZqeN7UimhdV3Zv2lG8K82NipPEHDszlfRuZiZTzHJoCYRM3oI617N34m3Ilx5PSPg
	Ixm1Xd2U+ZN+fQToWVlJNHAeiZnyua/HQr7FbC/89Rnik+uUkFGuaZPEVjfzks8dNT05
	l2pKdGK88n5Sv0EhAFOKv9asqCV06ubAC0oI979phTyJYqP9kPyqu99V/IQbwU2RhRZq
	zhdF8ZICvvgyPHqbaMeTnJhjK5t9DXl8Cdolkloa2sh2AkHEXAG8EQe4dP6VuCOmabrO
	mZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Yrkcq3919bIrw+owWW6aHJjGvP9ZNnzCyCXEAXtU5+o=;
	b=h4PwDlkxu48Z1A1XKxWwUa7E6Ppu2tSWI/flX90KpDPQ+TKAesYk6sTegZPj5Yu/CW
	zZHLjE4RBrzpA+zeuJdZBzBL9G6AE/FXhVj1gqvlJYBkCMxmf8AdyJ5C78cLk9lTxJRr
	zYPEahxlXblgSJ6HtrwC2Ok6o20beVXuqhTiGsqLyEmaWmCI7b9ox0keEQ5avTaJVZyG
	pKNpF0vwBuAsZ26Fzukqb7+H6j5vD9XOJCoUpg6BrP0P45tV7L1yIfASs2LAFZZBY6vk
	dt6yjIjhfjFBPnxkRqcJ0IyHCLyt8Tp6GGI/tRj0I/dPzHNhBeb0B4IFoob7yhGGctjH
	sYXA==
X-Gm-Message-State: APzg51C4UUuKBtRnFfyrTmgRTdXOTZ5Uu3zd1ZKS83k1wN6JOdCHzmLm
	JSi6mVTxaaNA4daG90QGODiSczX5wmnQWgvjWsFlpA==
X-Google-Smtp-Source: ANB0VdasFZEvtDNSXCnWQEDVwBMgFXZIXusd1b1CqxxYxC4sBwlLIquEZ0uSIQZlSkS2Syy8ED7bz6KT0bMnxq9di8A=
X-Received: by 2002:ac8:4304:: with SMTP id
	z4-v6mr20214395qtm.295.1536693228354; 
	Tue, 11 Sep 2018 12:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180911173738.31045-1-raj.khem@gmail.com>
	<CAJ86T=VvSOUb4-d0LJ4QYD-uiGYva4hMvdPuhq9BMaU7Duu-ag@mail.gmail.com>
In-Reply-To: <CAJ86T=VvSOUb4-d0LJ4QYD-uiGYva4hMvdPuhq9BMaU7Duu-ag@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Sep 2018 12:13:22 -0700
Message-ID: <CAMKF1sqOaH4cBqh9z2Uai5Fub7HUsy5eJmtUZ1VQaNf-9J73wA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] socat: Cache shift value for CRDLY, TABDLY and CSIZE
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
X-List-Received-Date: Tue, 11 Sep 2018 19:13:48 -0000
Content-Type: text/plain; charset="UTF-8"

No, it isn't. infact it should be same as powerpc
On Tue, Sep 11, 2018 at 10:48 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Sep 11, 2018 at 10:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > Match it to definitions in
> > arch/<ARCH>/include/uapi/asm/termbits.h
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-connectivity/socat/socat_1.7.3.2.bb | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
> > index 4dcb7b4adc..1c8c903d83 100644
> > --- a/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
> > +++ b/meta/recipes-connectivity/socat/socat_1.7.3.2.bb
> > @@ -11,7 +11,6 @@ LICENSE = "GPL-2.0+-with-OpenSSL-exception"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >                      file://README;beginline=257;endline=287;md5=338c05eadd013872abb1d6e198e10a3f"
> >
> > -
> >  SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
> >             file://Makefile.in-fix-for-parallel-build.patch \
> >             file://0001-define-NETDB_INTERNAL-to-1-if-not-available.patch \
> > @@ -26,9 +25,23 @@ inherit autotools
> >  EXTRA_AUTORECONF += "--exclude=autoheader"
> >
> >  EXTRA_OECONF += "ac_cv_have_z_modifier=yes \
> > -        ac_cv_header_bsd_libutil_h=no \
> > +                 ac_cv_header_bsd_libutil_h=no \
> > +                 sc_cv_termios_ispeed=no \
> > +                 ${TERMBITS_SHIFTS} \
> >  "
> >
> > +TERMBITS_SHIFTS ?= "sc_cv_sys_crdly_shift=9 \
> > +                    sc_cv_sys_tabdly_shift=11 \
> > +                    sc_cv_sys_csize_shift=4"
> > +
> > +TERMBITS_SHIFTS_powerpc ?= "sc_cv_sys_crdly_shift=12 \
> > +                            sc_cv_sys_tabdly_shift=10 \
> > +                            sc_cv_sys_csize_shift=8"
> > +
> > +TERMBITS_SHIFTS_powerpc64 ?= "sc_cv_sys_crdly_shift=9 \
> > +                              sc_cv_sys_tabdly_shift=11 \
> > +                              sc_cv_sys_csize_shift=4"
>
> The _powerpc64 over-ride is forcing TERMBITS_SHIFTS back to the
> default. Is that the intention?
>
> >  PACKAGECONFIG_class-target ??= "tcp-wrappers"
> >  PACKAGECONFIG ??= ""
> >  PACKAGECONFIG[tcp-wrappers] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
> > --
> > 2.18.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

