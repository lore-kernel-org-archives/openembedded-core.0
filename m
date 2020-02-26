Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2301D615FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:14:11 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id 88so1659838qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 07:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bkXdvAz4XBKsXMoeSCg9Or6IVjHYsKV++qz9RBkOQbw=;
	b=cekHruWsMDqB9AZce6PDyc3Gdxv1iNwg+T/wGKH+LwCizzfZfhy49aJV20AiIKt9AP
	tpsk6lhVYXj9hm7E9k2/YCV+G2VM5PN3UQojTgZUkxQzPAEkkkxHh4sNXFKj/Y85xZg2
	0OtSQe5FmtibgCfoHsWepxj8/y2Qhmp6Ebpoq/50oKpSRh4EILy0btb3wCPrlFykppNX
	bptdTXL7eXiWItvT6H/x50rb84IJ/Kp7FyDxdTmowSX3SuDlsPLkAgKbVdKDvtW7Ge64
	9lvQ1pc55VsXquybkVyo4I5Tc0xpj8zN6ve9dMyx7WwEWSj2/vk5Ar6ZEvWR37uW7z6+
	vS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bkXdvAz4XBKsXMoeSCg9Or6IVjHYsKV++qz9RBkOQbw=;
	b=dn0/EEECBwodCXxyoWR18EqJb0YE4NeZk6bBoehaBo274xa6iVpB5SZ2Vrfxdjmu8B
	POL8Fb7nztiVGlQWvoKCzMNZAPGdfty74hKBtS7v+8yaLoa8yiSyfSt6znjmMfpT+m70
	piTMEo5nlv5KAdS7sxDv5r+UDVz98TB71Ev+sErs+/gqlUYGlHk+Vh9hM7/pGp2SRllo
	E4q322ss/eOmHQSW2JgM7ZthnkyE2M7/+R03oLGk6GMcrWUYNC1xv1t/qdTIibXihU1K
	Qp15xTecQcSl0bvuIP8gVC29IhvqazsKNVPWxXRVOnQQHsiIxJ0M6SNO6mwtbnBJcjLq
	EWhA==
X-Gm-Message-State: APjAAAWBu3lMvtkPYwcTbYLtgNjptV8ojr+AsBq3GvvaiHxrGcmWZLuO
	Ra85cpNbAWISRL8p6chjVUqKbLXUM5TDWCZ6RsrbxyT+
X-Google-Smtp-Source: APXvYqw0Ot10QEkKkvNJrQqwH7zgybxJR3TB0IKkgkLvS83blt1JxfSyyOEgPs73RRiktiwCRcKUxMgBwbmSBaHweq4=
X-Received: by 2002:ac8:1a19:: with SMTP id v25mr5524387qtj.146.1582730052662; 
	Wed, 26 Feb 2020 07:14:12 -0800 (PST)
MIME-Version: 1.0
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-2-zboszor@pr.hu>
	<CAMKF1sqrFju=q26M-wSuTDR7xjK9tycivhDGvR0eGqAa5g2Zog@mail.gmail.com>
	<3b6928cc-d872-a9c9-942a-67f58d152790@pr.hu>
In-Reply-To: <3b6928cc-d872-a9c9-942a-67f58d152790@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Feb 2020 07:13:46 -0800
Message-ID: <CAMKF1sq+8VCveK48+FqpnPRU_MH6_g9+bVfzo4f2Bbto_d6MJQ@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] libva-initial: New recipe to carry only pkgconfig files and headers
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
X-List-Received-Date: Wed, 26 Feb 2020 15:14:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 7:12 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:
>
> 2020. 02. 26. 15:58 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> > On Wed, Feb 26, 2020 at 6:05 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n =
via
> > Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
> >>
> >> The package name exploits sstate.bbclass so it's not added as
> >> implicit dependency to packages.
> >>
> >
> > what is the use of this recipe and why should it be added to core ?
>
> I should have added a cover letter, shouldn't I?
> See patch 3/5 in the series for enabling gallium-va in Mesa.
>

recipe seems to build full libva, so why not just use that instead.

> >
> >> Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu>
> >> ---
> >>   meta/recipes-graphics/libva/libva-2.6.1.inc        | 4 +++-
> >>   meta/recipes-graphics/libva/libva-initial_2.6.1.bb | 5 +++++
> >>   2 files changed, 8 insertions(+), 1 deletion(-)
> >>   create mode 100644 meta/recipes-graphics/libva/libva-initial_2.6.1.b=
b
> >>
> >> diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc b/meta/recipe=
s-graphics/libva/libva-2.6.1.inc
> >> index ca1386d80b..5b1cdee7e3 100644
> >> --- a/meta/recipes-graphics/libva/libva-2.6.1.inc
> >> +++ b/meta/recipes-graphics/libva/libva-2.6.1.inc
> >> @@ -17,10 +17,12 @@ SECTION =3D "x11"
> >>   LICENSE =3D "MIT"
> >>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5ef03=
537800f"
> >>
> >> -SRC_URI =3D "https://github.com/intel/${BPN}/releases/download/${PV}/=
${BP}.tar.bz2"
> >> +SRC_URI =3D "https://github.com/intel/libva/releases/download/${PV}/l=
ibva-${PV}.tar.bz2"
> >>   SRC_URI[md5sum] =3D "aef13eb48e01a47d1416d97462a22a11"
> >>   SRC_URI[sha256sum] =3D "6c57eb642d828af2411aa38f55dc10111e8c98976dba=
b8fd62e48629401eaea5"
> >>
> >> +S =3D "${WORKDIR}/libva-${PV}"
> >> +
> >>   UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva/releases"
> >>
> >>   DEPENDS =3D "libdrm"
> >> diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb b/meta=
/recipes-graphics/libva/libva-initial_2.6.1.bb
> >> new file mode 100644
> >> index 0000000000..828ef6fbca
> >> --- /dev/null
> >> +++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
> >> @@ -0,0 +1,5 @@
> >> +require libva-${PV}.inc
> >> +
> >> +do_install_append () {
> >> +       rm -f ${D}${libdir}/*.so*
> >> +}
> >> --
> >> 2.24.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

