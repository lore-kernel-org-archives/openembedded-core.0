Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2E00660721
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 22:55:29 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id o15-v6so821224qtk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+Pp8sZYoBT3jEC79w02XNtzQkztfHJH4dpwEahfqEww=;
	b=K2AiCaoBpnAJH9guE+APaltvqEAHw8KrSQugpk5mL5DrcmLRa79aHN37aUGedOMcHk
	1e0sVcE7srRt6KzoBuGSKc382qw6HIbesdA97q+bHLvR/Pm3hAyNF6kW9R3IjaQQftaS
	nMHo8pbcQz3FlkINC7YFruEoDkAGQB+Qo9+icuQL0v2HWvi70kLDG5fnZ3YH943ibfOg
	Xzwi8ixDO68WpHXeLyk1/i/CIWSFJ6kBFqygfBF26ScEJQ18p2Ill6FhgCnr3ADnJ7a9
	69Gzdt4xmJy58KIlF971GC9z91ytgILmZY1iB0g0nulw0ufOa/XH8ETi6sK5vkRlNzCX
	g0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+Pp8sZYoBT3jEC79w02XNtzQkztfHJH4dpwEahfqEww=;
	b=K/d3+If2TVLtQOMJV6790yJxmwG3wt6uTtWH+HaIvvMlI/fK8oLYzO7DEdNH0eRPNH
	k47VsctObm/1Mud/qQoijcPtctqiX2AZk0SPEGJSQMda0EeJdWXKszyzhj38Gr7d+4Ze
	S2i4xPqVtxnUc/IyhNLUYNbGZ+g48oaQIoPa4dTl9zVDx3BfmYrQD0sYJgR/idbpYcAc
	Pi9vAVKMGD1iAeRRVAKRVfqf6VLsfDxnu3FXONeHIKf7pk50VaHRfghwC7st/kF119r8
	HJMTbOCC7tCiNCrLoYysSZgkzUP0ooL9k6arWySqHfYeuhO+/8O++SzuOFDrvztHLoSY
	/Kfg==
X-Gm-Message-State: APzg51CUf7Nx449YEgXaDIT8DhOUibq84Up2vx6pcqC2hsufuu+wRoOS
	PNNgm9KxBfVw6F7Sgr6iNgO6A9NUJTvHjnrSPxk=
X-Google-Smtp-Source: ANB0VdbWbNQReD2xLrOvmmbBtoNKBXyomObMODjTo21UQEaGjNw4n2LV0tSIb38g8AhnJn1isbtYOx3/8AaEjQFaoIc=
X-Received: by 2002:ac8:4304:: with SMTP id
	z4-v6mr15901718qtm.295.1535410530745; 
	Mon, 27 Aug 2018 15:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1534791421.git.raj.khem@gmail.com>
	<011962bd47ca60969fa50a3e890adadd6bddc487.1534791421.git.raj.khem@gmail.com>
	<CALbNGRRN0gjg4VTu4mPh726Q6JyCf4BCmv32mDuVaJ5BtNxpjg@mail.gmail.com>
In-Reply-To: <CALbNGRRN0gjg4VTu4mPh726Q6JyCf4BCmv32mDuVaJ5BtNxpjg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Aug 2018 15:55:04 -0700
Message-ID: <CAMKF1so_wuCSh7uo=QOJvmxPSDX=OW-hwiV6KCuMVjHi6Aw0FQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Mon, 27 Aug 2018 22:55:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 27, 2018 at 2:15 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Aug 20, 2018 at 8:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
> >  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graph=
ics/cairo/cairo.inc
> > index 20e0d2c92a..7347f223ff 100644
> > --- a/meta/recipes-graphics/cairo/cairo.inc
> > +++ b/meta/recipes-graphics/cairo/cairo.inc
> > @@ -22,7 +22,8 @@ X11DEPENDS =3D "virtual/libx11 libsm libxrender libxe=
xt"
> >  DEPENDS =3D "libpng fontconfig pixman glib-2.0 zlib"
> >
> >  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x=
11 xcb', '', d)} \
> > -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
> > +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
> > +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'open=
gl', '', d)}"
> >
> >  PACKAGECONFIG[x11] =3D "--with-x=3Dyes -enable-xlib,--with-x=3Dno --di=
sable-xlib,${X11DEPENDS}"
> >  PACKAGECONFIG[xcb] =3D "--enable-xcb,--disable-xcb,libxcb"
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphic=
s/mesa/mesa.inc
> > index 5afd0db4b7..dd626d9f00 100644
> ^ I think this came in accidentaly and it breaks builds when adding
> packageconfig glesv2:
>
> | configure: error: use either --enable-gl=3Dyes or --enable-glesv2=3Dyes=
.
> Not both at the same time.

do you remove opengl from DISTRO_FEATURES when enabling glesv2 ?
try that out.

>
> Please check
>
> Andreas

