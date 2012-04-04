Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SFLvo-0001dX-Qc
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 10:51:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Apr 2012 01:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149462097"
Received: from unknown (HELO helios.localnet) ([10.252.120.20])
	by fmsmga002.fm.intel.com with ESMTP; 04 Apr 2012 01:41:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 04 Apr 2012 09:41:52 +0100
Message-ID: <7023646.7DOUuAkhhT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <20120404102901.59872c25@eb-e6520>
References: <1332328101-22779-1-git-send-email-eric@eukrea.com>
	<4F7B629D.3010906@linux.intel.com>
	<20120404102901.59872c25@eb-e6520>
MIME-Version: 1.0
Subject: Re: [PATCH] speex: fix FILES variables
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
X-List-Received-Date: Wed, 04 Apr 2012 08:51:09 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday 04 April 2012 10:29:01 Eric B=E9nard wrote:
> Hi Saul,
>=20
> Le Tue, 03 Apr 2012 13:50:37 -0700,
>=20
> Saul Wold <sgw@linux.intel.com> a =E9crit :
> > On 03/21/2012 04:08 AM, Eric B=E9nard wrote:
> > > actually FILES_${PN} and FILES_${PN}-dev match the same files.
> > > these files are supposed to go into ${PN} so remove the other ent=
ry.
> > >=20
> > > Signed-off-by: Eric B=E9nard<eric@eukrea.com>
> > > ---
> > >=20
> > >   meta/recipes-multimedia/speex/speex_1.2rc1.bb |    3 +--
> > >   1 files changed, 1 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> > > b/meta/recipes-multimedia/speex/speex_1.2rc1.bb index fe46a00..73=
70134
> > > 100644
> > > --- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> > > +++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> > > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> > > "file://COPYING;md5=3D314649d8ba9dd7045dfb6683f298d0a8 \> >=20
> > >                       file://include/speex/speex.h;beginline=3D1;=
endline=3D3
> > >                       4;md5=3Da68129f78d7fe66e07163f73aba143b3"> =
>  =20
> > >   DEPENDS =3D "libogg"
> > >=20
> > > -PR =3D "r0"
> > > +PR =3D "r1"
> > >=20
> > >   SRC_URI =3D
> > >   "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1.tar.g=
z"
> > >=20
> > > @@ -24,5 +24,4 @@ EXTRA_OECONF =3D " --enable-fixed-point
> > > --with-ogg-libraries=3D${STAGING_LIBDIR} \> >=20
> > >   PACKAGES +=3D "${PN}-bin"
> > >   FILES_${PN} =3D "${libdir}/lib*.so.*"
> > >=20
> > > -FILES_${PN}-dev +=3D "${libdir}/lib*.so.*"
> > >=20
> > >   FILES_${PN}-bin =3D "${bindir}"
> >=20
> > Merged into OE-Core
>=20
> it was already applied as 4fc0f65e7d6e6fc6775a9a7e54510b629c9786d9

Saul's just catching up on the merge replies, so he's referring to that=
=20
commit.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


