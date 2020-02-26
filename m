Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id B9F1D6160B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:30:43 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id f3so3003218qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 07:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QALC799BmIGa73c+9UMzqDKm8Mlhtmiv0qL9c8gfOt8=;
	b=q3endX53VMvXfpHvp6QTJMd+jyqpYT7VLqkcbDyU2ds5SXnnxsRiPrGEGnYTP6d/hV
	rSI3qUdHnUav6q2CPzmwPc/cpgifUN9oiNZ1KAWTsC7VymaEcGRE+3v1/e2zkJcptfXi
	HpBFW6254prv3nf5ZCp/9T+lOp7SO6OPtJFy8VkbUDg96/GvlfcTki6lrTKJxCla3jij
	/rZe7nS6ETDZbkKYFC4eVVMYF8moO6GCsu34Lr02cDbeNZQ5TkXdI6IwQTwCBXHWRiqW
	C/+Q5T0WiHe2mtjUu5Lc4uoESpmokatn8o++5zkH5iCukZ86WVn5K/2XMwmz2IF6hskg
	VVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QALC799BmIGa73c+9UMzqDKm8Mlhtmiv0qL9c8gfOt8=;
	b=XaRkfioj9Vr6gp08bmO4ZqTxUhK5fIGOWYSbg28xRo/mTFDHzHjlGo5SqnysHXMRMK
	x5XDALqZPEBuGrZG7hF+xK3K+vSXT+CBlxHGoL0vR7oQa/RMxzZWbNwMD18SOfZgm9wx
	smkL5XnjJ0HtPtT7u21D87vPkelCgrri1+RdHayWn8orFiRiJc/nAh5zAq4WjHdgLpA3
	db31gGVMwyNE+quuGSN95p8bW7WaPm8dwTxuT4Ki3W/boRh5WoZ3a3lMm8tlQhjtRtNn
	MpKTlxTivDXydzwV2M+ltm6M5lwdayi02Rgxt6Q3UvRhyLLJOCRiTvuxVzA6i1PM3BIt
	4CNg==
X-Gm-Message-State: APjAAAUqci2QKTitx9CcF50Q0Ksyopz5b0FW7Z0DPUItFsp4JPgNWpGO
	Ktujz0OX4nYq8/i0TERUh4letKTl7M/gZhW06mtrrV+W
X-Google-Smtp-Source: APXvYqwZcoFokcXsgFKW5olGGZFeZo7gHtR3ixsHnpXMXIQWNDeyzXbdsoyjEAQdV2ni1koCwcJ9NihrXWuwpANphqc=
X-Received: by 2002:ae9:eb8d:: with SMTP id b135mr6693719qkg.215.1582731044230;
	Wed, 26 Feb 2020 07:30:44 -0800 (PST)
MIME-Version: 1.0
References: <20200226135716.49255-1-zboszor@pr.hu>
	<20200226135716.49255-2-zboszor@pr.hu>
	<CAMKF1sqrFju=q26M-wSuTDR7xjK9tycivhDGvR0eGqAa5g2Zog@mail.gmail.com>
	<3b6928cc-d872-a9c9-942a-67f58d152790@pr.hu>
	<CAMKF1sq+8VCveK48+FqpnPRU_MH6_g9+bVfzo4f2Bbto_d6MJQ@mail.gmail.com>
	<1753b549-7a12-ec88-a1e5-f23ff05b060e@pr.hu>
In-Reply-To: <1753b549-7a12-ec88-a1e5-f23ff05b060e@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Feb 2020 07:30:18 -0800
Message-ID: <CAMKF1srD6BcwvQQ7cs3fdw1oQUxO+8K6dRWVn4DozbrkUgy+Cw@mail.gmail.com>
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
X-List-Received-Date: Wed, 26 Feb 2020 15:30:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 7:20 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:
>
> 2020. 02. 26. 16:13 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> > On Wed, Feb 26, 2020 at 7:12 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n =
<zboszor@pr.hu> wrote:
> >>
> >> 2020. 02. 26. 15:58 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> >>> On Wed, Feb 26, 2020 at 6:05 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1=
n via
> >>> Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
> >>>>
> >>>> The package name exploits sstate.bbclass so it's not added as
> >>>> implicit dependency to packages.
> >>>>
> >>>
> >>> what is the use of this recipe and why should it be added to core ?
> >>
> >> I should have added a cover letter, shouldn't I?
> >> See patch 3/5 in the series for enabling gallium-va in Mesa.
> >>
> >
> > recipe seems to build full libva, so why not just use that instead.
>
> You don't seem to be reading mails from openembedded-devel that
> you were cc-ed on.

don't assume things

> http://lists.openembedded.org/pipermail/openembedded-devel/2020-February/=
205142.html
>

I am trying to make us thing if -dev package can be used somehow to avoid t=
his
or have we exhausted all possibilities.

> >
> >>>
> >>>> Signed-off-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@pr.hu=
>
> >>>> ---
> >>>>    meta/recipes-graphics/libva/libva-2.6.1.inc        | 4 +++-
> >>>>    meta/recipes-graphics/libva/libva-initial_2.6.1.bb | 5 +++++
> >>>>    2 files changed, 8 insertions(+), 1 deletion(-)
> >>>>    create mode 100644 meta/recipes-graphics/libva/libva-initial_2.6.=
1.bb
> >>>>
> >>>> diff --git a/meta/recipes-graphics/libva/libva-2.6.1.inc b/meta/reci=
pes-graphics/libva/libva-2.6.1.inc
> >>>> index ca1386d80b..5b1cdee7e3 100644
> >>>> --- a/meta/recipes-graphics/libva/libva-2.6.1.inc
> >>>> +++ b/meta/recipes-graphics/libva/libva-2.6.1.inc
> >>>> @@ -17,10 +17,12 @@ SECTION =3D "x11"
> >>>>    LICENSE =3D "MIT"
> >>>>    LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5e=
f03537800f"
> >>>>
> >>>> -SRC_URI =3D "https://github.com/intel/${BPN}/releases/download/${PV=
}/${BP}.tar.bz2"
> >>>> +SRC_URI =3D "https://github.com/intel/libva/releases/download/${PV}=
/libva-${PV}.tar.bz2"
> >>>>    SRC_URI[md5sum] =3D "aef13eb48e01a47d1416d97462a22a11"
> >>>>    SRC_URI[sha256sum] =3D "6c57eb642d828af2411aa38f55dc10111e8c98976=
dbab8fd62e48629401eaea5"
> >>>>
> >>>> +S =3D "${WORKDIR}/libva-${PV}"
> >>>> +
> >>>>    UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva/releases"
> >>>>
> >>>>    DEPENDS =3D "libdrm"
> >>>> diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb b/me=
ta/recipes-graphics/libva/libva-initial_2.6.1.bb
> >>>> new file mode 100644
> >>>> index 0000000000..828ef6fbca
> >>>> --- /dev/null
> >>>> +++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
> >>>> @@ -0,0 +1,5 @@
> >>>> +require libva-${PV}.inc
> >>>> +
> >>>> +do_install_append () {
> >>>> +       rm -f ${D}${libdir}/*.so*
> >>>> +}
> >>>> --
> >>>> 2.24.1
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
>

