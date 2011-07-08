Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QfEdF-0004R2-N9
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 19:14:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jul 2011 10:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="25503742"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2011 10:10:32 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 8 Jul 2011 10:10:32 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Fri, 8 Jul 2011 10:10:32 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jul 2011 10:10:30 -0700
Thread-Topic: [OE-core] [PATCH 4/7] binutils: package unpackaged files
Thread-Index: Acw9g5NzCBepVqNIQjmrUqbBgn7fTQADjMvQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE226657@orsmsx504.amr.corp.intel.com>
References: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
	<12dc19831b4766f0894ff43ae916150057a0e65e.1310070283.git.nitin.a.kamble@intel.com>
	<1310138792.20015.880.camel@rex>
In-Reply-To: <1310138792.20015.880.camel@rex>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 4/7] binutils: package unpackaged files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jul 2011 17:14:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Friday, July 08, 2011 8:27 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 4/7] binutils: package unpackaged files
>=20
> On Thu, 2011-07-07 at 13:25 -0700, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > To fix these package qa warnings
> > WARNING: For recipe binutils, the following files were installed but
> not shipped in any package:
> > WARNING:   /usr/bin/ld.bfd
> > WARNING:   /usr/bin/elfedit
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  .../binutils/binutils-cross-canadian_2.21.1.bb     |    2 +-
> >  .../binutils/binutils-crosssdk_2.21.1.bb           |    2 +-
> >  meta/recipes-devtools/binutils/binutils.inc        |    2 ++
> >  meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    2 +-
> >  4 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils-cross-
> canadian_2.21.1.bb b/meta/recipes-devtools/binutils/binutils-cross-
> canadian_2.21.1.bb
> > index 7dad2a6..e91e7dc 100644
> > --- a/meta/recipes-devtools/binutils/binutils-cross-
> canadian_2.21.1.bb
> > +++ b/meta/recipes-devtools/binutils/binutils-cross-
> canadian_2.21.1.bb
> > @@ -1,3 +1,3 @@
> >  require binutils_${PV}.bb
> >  require binutils-cross-canadian.inc
> > -PR =3D "r0"
> > +PR =3D "r1"
> > diff --git a/meta/recipes-devtools/binutils/binutils-
> crosssdk_2.21.1.bb b/meta/recipes-devtools/binutils/binutils-
> crosssdk_2.21.1.bb
> > index 0d6efff..21289cd 100644
> > --- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
> > +++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
> > @@ -4,7 +4,7 @@ inherit crosssdk
> >
> >  PROVIDES =3D "virtual/${TARGET_PREFIX}binutils-crosssdk"
> >
> > -PR =3D "r0"
> > +PR =3D "r1"
> >
> >  do_configure_prepend () {
> >  	sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPATHNATIVE}/lib
> ${SDKPATHNATIVE}/usr/lib /usr/local/lib /lib /usr/lib#'
> ${S}/ld/configure.tgt
> > diff --git a/meta/recipes-devtools/binutils/binutils.inc
> b/meta/recipes-devtools/binutils/binutils.inc
> > index 08c14b2..9a6b9c8 100644
> > --- a/meta/recipes-devtools/binutils/binutils.inc
> > +++ b/meta/recipes-devtools/binutils/binutils.inc
> > @@ -35,11 +35,13 @@ FILES_${PN}-symlinks =3D " \
> >  	${bindir}/c++filt \
> >  	${bindir}/gprof \
> >  	${bindir}/ld \
> > +	${bindir}/ld.bfd \
> >  	${bindir}/nm \
> >  	${bindir}/objcopy \
> >  	${bindir}/objdump \
> >  	${bindir}/ranlib \
> >  	${bindir}/readelf \
> > +	${bindir}/elfedit \
> >  	${bindir}/size \
> >  	${bindir}/strip"
>=20
> Nitin, do you know if the ld.bfd above is a hardlinked copy of ld?
>=20
> It may be better to turn this into a symlink if so (although our
> packaging process should preserve hardlinks these days).
>=20
Richard,
   The ld.bfd is softlink to <target_tupple>_ld. Hence I put it in the syml=
inks package.
Nitin


> Cheers,
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


