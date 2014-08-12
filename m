Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 78B98609C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:32:29 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so9671776wgg.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 04:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=79N1bfjVVjdt0YrAUwuV1yonCayMBbSuMJlrs9ZFue4=;
	b=csZIDNAVCoEROyrXKCKhVVGd6YAwFW51g8Q/uy/WbtvX/reU+6Jw1ngUXcsoaO1ebS
	xdptG168nJe7/O4gpBwEQtOlVTKbmclvH7fMZfGgUea/wexCwhuv3wOWx74cW9aNhhjn
	cbkDDX1wNwOpQOzTxxulOkIOHtNSltj2DHjOskzYnUPPYpsHgWqvN7yTaZjiP5eloG9Y
	2SbM6/AttdCKgFBT/IzTwrxjqxrUyIx0PlDVK6DHmxnRjC38Zo50cU/A0oSfmUX7s/WP
	K47khjPPJXhsAhehWWPfhMXB5jy1dJlWnpwkC14yXyjt58BvSNCz+C/EJg+ttumtwW5e
	TqyA==
X-Received: by 10.194.189.230 with SMTP id gl6mr4591233wjc.118.1407843150576; 
	Tue, 12 Aug 2014 04:32:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f16sm55269236wic.7.2014.08.12.04.32.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 04:32:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 13:33:05 +0200
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20140812113305.GG14848@jama>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
	<48ca1900cd8400421948c4a2c33c722b979f3292.1406234258.git.bruce.ashfield@windriver.com>
	<20140725132158.GU2492@jama>
	<CADkTA4PP26gr6PozfYFM3Z6-FB2g+EUsUGXQQ46VCjd6xkG4qA@mail.gmail.com>
	<CADkTA4OG_ddsMBzo54kH_FXRo7bNCL+ZQsTHBhdVcYrBLDGX1Q@mail.gmail.com>
	<20140725134601.GV2492@jama>
	<CADkTA4P0fQJjmQ_JwrodNSeYrhpjmTQbf=M9EXGOVMoDwoht1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4P0fQJjmQ_JwrodNSeYrhpjmTQbf=M9EXGOVMoDwoht1g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] lttng-modules: update to 2.5.0
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
X-List-Received-Date: Tue, 12 Aug 2014 11:32:37 -0000
X-Groupsio-MsgNum: 56349
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7WEKUnU0nndnxXPW"
Content-Disposition: inline

--7WEKUnU0nndnxXPW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2014 at 09:48:02AM -0400, Bruce Ashfield wrote:
> On Fri, Jul 25, 2014 at 9:46 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Fri, Jul 25, 2014 at 09:36:12AM -0400, Bruce Ashfield wrote:
> >> On Fri, Jul 25, 2014 at 9:23 AM, Bruce Ashfield
> >> <bruce.ashfield@gmail.com> wrote:
> >> > On Fri, Jul 25, 2014 at 9:21 AM, Martin Jansa <martin.jansa@gmail.co=
m> wrote:
> >> >> On Thu, Jul 24, 2014 at 04:41:48PM -0400, Bruce Ashfield wrote:
> >> >>> During the uprev of the yocto kernel to 3.16, lttng-modules failed=
 to build.
> >> >>> To grab the latest stable content, we update to 2.5.0, and add two=
 patches
> >> >>> to also make it build against 3.16+.
> >> >>>
> >> >>> We also drop the older 2.3.3 lttng-modules, since it is no longer =
required
> >> >>> to support ARM builds.
> >> >>>
> >> >>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> >>> ---
> >> >>>  ...compaction-instrumentation-to-3.16-kernel.patch | 83 +++++++++=
+++++++++++++
> >> >>>  ...ate-vmscan-instrumentation-to-3.16-kernel.patch | 70 +++++++++=
+++++++++
> >> >>>  meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   | 36 ----------
> >> >>>  ...tng-modules_2.4.1.bb =3D> lttng-modules_2.5.0.bb} |  7 +-
> >> >>>  4 files changed, 157 insertions(+), 39 deletions(-)
> >> >>>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update=
-compaction-instrumentation-to-3.16-kernel.patch
> >> >>>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update=
-vmscan-instrumentation-to-3.16-kernel.patch
> >> >>>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.3.3.=
bb
> >> >>>  rename meta/recipes-kernel/lttng/{lttng-modules_2.4.1.bb =3D> ltt=
ng-modules_2.5.0.bb} (85%)
> >> >>>
> >> >>
> >> >> ...
> >> >>
> >> >>> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb b/me=
ta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> >> >>> similarity index 85%
> >> >>> rename from meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
> >> >>> rename to meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> >> >>> index 5e05ffc69853..5a99a5adae8b 100644
> >> >>> --- a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
> >> >>> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> >> >>> @@ -10,14 +10,15 @@ DEPENDS =3D "virtual/kernel"
> >> >>
> >> >> Is the LICENSE =3D "LGPLv2.1 & GPLv2" correct?
> >> >
> >> > Let me double check. I was doing an update and test, and didn't noti=
ce if
> >> > this had changed.
> >> >
> >> > Even if it did change, and I'm just uprev'ing .. I'll fix it, since =
it
> >> > being wrong
> >> > in the past doesn't give me a free pass to keep it wrong in an updat=
e :)
> >>
> >> Too funny. There have been the three MIT licence files since 2011 .. s=
o I agree
> >> that the recipe's summary is long.  I'll tack a patch onto the end of =
the series
> >> and wait to hear from RP/Saul about anything else I may have broken.
> >
> > Sorry I thought you're maintainer of lttng-*, it seems like Laurentiu is
>=20
> No worries. I just get caught in the blast when lttng blows up during
> kernel uprevs, and I fix the wreckage so I can send out my updates :)
>=20
> If we don't hear from Laurentiu, I can still do the update, so I'll hold =
it
> as a separate patch here.

Ping!

Someone just sent patch to upgrade lttng-ust, so I've asked him for
LICENSE fix as well.

> > + Laurentiu
> > maintainers.inc:RECIPE_MAINTAINER_pn-lttng-modules =3D "Laurentiu Palcu=
 <laurentiu.palcu@intel.com>"
> > maintainers.inc:RECIPE_MAINTAINER_pn-lttng-ust =3D "Laurentiu Palcu <la=
urentiu.palcu@intel.com>"
> >
> > The same LICENSE issue is in lttng-ust
> >
> > git/LICENSE:
> > ...
> > * MIT license :
> >
> > Public header files are distributed under the MIT license. See
> > mit-license.txt for details.
> > ...
> >
> >> Bruce
> >>
> >> >
> >> > Cheers,
> >> >
> >> > Bruce
> >> >
> >> >>
> >> >> git/LICENSE says:
> >> >>
> >> >> * MIT-style license
> >> >>
> >> >> These files are licensed under an MIT-style license. See mit-licens=
e.txt
> >> >> for details.
> >> >>
> >> >> lib/prio_heap/lttng_prio_heap.h
> >> >> lib/prio_heap/lttng_prio_heap.c
> >> >> lib/bitfield.h
> >> >>
> >> >>
> >> >>>
> >> >>>  inherit module
> >> >>>
> >> >>> -SRCREV =3D "a0383def517e3aebbbcebae61fe2bcfb50d31e71"
> >> >>> -PV =3D "2.4.1"
> >> >>> +SRCREV =3D "789fd1d06d07aeb9a403bdce1b3318560cfc6eca"
> >> >>>
> >> >>>  # lttng currently blacklists arm with gcc-4.8
> >> >>>  COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
> >> >>>
> >> >>> -SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstabl=
e-2.4 \
> >> >>> +SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstabl=
e-2.5 \
> >> >>>             file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC=
=2Epatch \
> >> >>> +           file://Update-compaction-instrumentation-to-3.16-kerne=
l.patch \
> >> >>> +           file://Update-vmscan-instrumentation-to-3.16-kernel.pa=
tch \
> >> >>>             "
> >> >>>
> >> >>>  export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
> >> >>> --
> >> >>> 1.8.1.2
> >> >>>
> >> >>> --
> >> >>> _______________________________________________
> >> >>> Openembedded-core mailing list
> >> >>> Openembedded-core@lists.openembedded.org
> >> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >>
> >> >> --
> >> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >> >>
> >> >> --
> >> >> _______________________________________________
> >> >> Openembedded-core mailing list
> >> >> Openembedded-core@lists.openembedded.org
> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >>
> >> >
> >> >
> >> >
> >> > --
> >> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> > thee at its end"
> >>
> >>
> >>
> >> --
> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end"
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7WEKUnU0nndnxXPW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPp+3EACgkQN1Ujt2V2gBxjZwCdHSOgtxfU8d7qX+F8Xwv5K/rK
QlcAn1Nls1TKD3J4MWjLox3mhoe2BU7q
=BgMK
-----END PGP SIGNATURE-----

--7WEKUnU0nndnxXPW--
