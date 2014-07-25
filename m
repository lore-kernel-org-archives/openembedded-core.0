Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 11DA8701AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 13:45:47 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so4347297wes.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 06:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2igjBE+ToRmmJBfwDj3d4czWkuqkwcfQIB8xLN+G3aI=;
	b=iIk2hAOGt5YYnLFV+vaQqmE/+ZnlA7Y0BZUlFIJ3bst7QFpC/TCfgdM0rL3M7Q5ICT
	IpL8A5AAGyiAX3Xf3OJapgu5TQQLFuCj9ef2p899D4Y0qkxMez4XG/qsTzRMLBpkMTAJ
	IaM8kdI/N73QoCGTSNJ73JOGO0j5lIzEQeaP/ZArsZbvlQ6XpuKuVpl9hNdh9gvkckAm
	ZhC5sVbN+o1o2ieEf9JhBB+/FjvtoNqH22yQRgdx49WH7V2PgyRT320foJZ8AQBfAWu1
	D909zs4pJqKDkLvXpDChNe8BwQQBJqTJ5ilBmgJYr1AMFB9LIgPzlG/DuVc2oJ/SVcI3
	aALQ==
X-Received: by 10.180.84.7 with SMTP id u7mr5193696wiy.27.1406295946795;
	Fri, 25 Jul 2014 06:45:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v4sm6132294wiz.16.2014.07.25.06.45.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jul 2014 06:45:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Jul 2014 15:46:01 +0200
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20140725134601.GV2492@jama>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
	<48ca1900cd8400421948c4a2c33c722b979f3292.1406234258.git.bruce.ashfield@windriver.com>
	<20140725132158.GU2492@jama>
	<CADkTA4PP26gr6PozfYFM3Z6-FB2g+EUsUGXQQ46VCjd6xkG4qA@mail.gmail.com>
	<CADkTA4OG_ddsMBzo54kH_FXRo7bNCL+ZQsTHBhdVcYrBLDGX1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4OG_ddsMBzo54kH_FXRo7bNCL+ZQsTHBhdVcYrBLDGX1Q@mail.gmail.com>
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
X-List-Received-Date: Fri, 25 Jul 2014 13:45:58 -0000
X-Groupsio-MsgNum: 55568
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JVTyp1F/hrbhzAAs"
Content-Disposition: inline

--JVTyp1F/hrbhzAAs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2014 at 09:36:12AM -0400, Bruce Ashfield wrote:
> On Fri, Jul 25, 2014 at 9:23 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Fri, Jul 25, 2014 at 9:21 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> >> On Thu, Jul 24, 2014 at 04:41:48PM -0400, Bruce Ashfield wrote:
> >>> During the uprev of the yocto kernel to 3.16, lttng-modules failed to=
 build.
> >>> To grab the latest stable content, we update to 2.5.0, and add two pa=
tches
> >>> to also make it build against 3.16+.
> >>>
> >>> We also drop the older 2.3.3 lttng-modules, since it is no longer req=
uired
> >>> to support ARM builds.
> >>>
> >>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >>> ---
> >>>  ...compaction-instrumentation-to-3.16-kernel.patch | 83 ++++++++++++=
++++++++++
> >>>  ...ate-vmscan-instrumentation-to-3.16-kernel.patch | 70 ++++++++++++=
++++++
> >>>  meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   | 36 ----------
> >>>  ...tng-modules_2.4.1.bb =3D> lttng-modules_2.5.0.bb} |  7 +-
> >>>  4 files changed, 157 insertions(+), 39 deletions(-)
> >>>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-co=
mpaction-instrumentation-to-3.16-kernel.patch
> >>>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-vm=
scan-instrumentation-to-3.16-kernel.patch
> >>>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
> >>>  rename meta/recipes-kernel/lttng/{lttng-modules_2.4.1.bb =3D> lttng-=
modules_2.5.0.bb} (85%)
> >>>
> >>
> >> ...
> >>
> >>> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb b/meta/=
recipes-kernel/lttng/lttng-modules_2.5.0.bb
> >>> similarity index 85%
> >>> rename from meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
> >>> rename to meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> >>> index 5e05ffc69853..5a99a5adae8b 100644
> >>> --- a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
> >>> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> >>> @@ -10,14 +10,15 @@ DEPENDS =3D "virtual/kernel"
> >>
> >> Is the LICENSE =3D "LGPLv2.1 & GPLv2" correct?
> >
> > Let me double check. I was doing an update and test, and didn't notice =
if
> > this had changed.
> >
> > Even if it did change, and I'm just uprev'ing .. I'll fix it, since it
> > being wrong
> > in the past doesn't give me a free pass to keep it wrong in an update :)
>=20
> Too funny. There have been the three MIT licence files since 2011 .. so I=
 agree
> that the recipe's summary is long.  I'll tack a patch onto the end of the=
 series
> and wait to hear from RP/Saul about anything else I may have broken.

Sorry I thought you're maintainer of lttng-*, it seems like Laurentiu is
+ Laurentiu
maintainers.inc:RECIPE_MAINTAINER_pn-lttng-modules =3D "Laurentiu Palcu <la=
urentiu.palcu@intel.com>"
maintainers.inc:RECIPE_MAINTAINER_pn-lttng-ust =3D "Laurentiu Palcu <lauren=
tiu.palcu@intel.com>"

The same LICENSE issue is in lttng-ust

git/LICENSE:
=2E..
* MIT license :

Public header files are distributed under the MIT license. See
mit-license.txt for details.
=2E..

> Bruce
>=20
> >
> > Cheers,
> >
> > Bruce
> >
> >>
> >> git/LICENSE says:
> >>
> >> * MIT-style license
> >>
> >> These files are licensed under an MIT-style license. See mit-license.t=
xt
> >> for details.
> >>
> >> lib/prio_heap/lttng_prio_heap.h
> >> lib/prio_heap/lttng_prio_heap.c
> >> lib/bitfield.h
> >>
> >>
> >>>
> >>>  inherit module
> >>>
> >>> -SRCREV =3D "a0383def517e3aebbbcebae61fe2bcfb50d31e71"
> >>> -PV =3D "2.4.1"
> >>> +SRCREV =3D "789fd1d06d07aeb9a403bdce1b3318560cfc6eca"
> >>>
> >>>  # lttng currently blacklists arm with gcc-4.8
> >>>  COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
> >>>
> >>> -SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2=
=2E4 \
> >>> +SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2=
=2E5 \
> >>>             file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.pa=
tch \
> >>> +           file://Update-compaction-instrumentation-to-3.16-kernel.p=
atch \
> >>> +           file://Update-vmscan-instrumentation-to-3.16-kernel.patch=
 \
> >>>             "
> >>>
> >>>  export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
> >>> --
> >>> 1.8.1.2
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >> --
> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end"
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JVTyp1F/hrbhzAAs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPSX5kACgkQN1Ujt2V2gByEsQCgh2t++LWDD/MRNvQwXgSpLHsb
eHEAoKXggDaVJ7l3xuhOf34AAS2wipxo
=jUXS
-----END PGP SIGNATURE-----

--JVTyp1F/hrbhzAAs--
