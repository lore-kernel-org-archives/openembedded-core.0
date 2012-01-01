Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RhTrw-00010I-W9
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Jan 2012 23:27:09 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Jan 2012 14:19:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="91998100"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga001.jf.intel.com with ESMTP; 01 Jan 2012 14:19:49 -0800
Received: from orsmsx101.amr.corp.intel.com (10.22.225.128) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sun, 1 Jan 2012 14:19:49 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.229]) by
	ORSMSX101.amr.corp.intel.com ([169.254.8.57]) with mapi id
	14.01.0355.002; Sun, 1 Jan 2012 14:19:48 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 14/14] automake: upgrade from 1.11.1 to 1.11.2
Thread-Index: AQHMxopmtrON9V7v8EKfkhdBQKA03JX0c8CAgAOl7LA=
Date: Sun, 1 Jan 2012 22:19:47 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C01224F@ORSMSX106.amr.corp.intel.com>
References: <cover.1325204775.git.nitin.a.kamble@intel.com>
	<2c978c9609fda2df33641003921c25c2568be486.1325204775.git.nitin.a.kamble@intel.com>
	<20111230063629.GC16885@jama.jama.net>
In-Reply-To: <20111230063629.GC16885@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 14/14] automake: upgrade from 1.11.1 to 1.11.2
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
X-List-Received-Date: Sun, 01 Jan 2012 22:27:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Thursday, December 29, 2011 10:36 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 14/14] automake: upgrade from 1.11.1 to
> 1.11.2
>=20
> On Thu, Dec 29, 2011 at 04:30:59PM -0800, nitin.a.kamble@intel.com
> wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  meta/recipes-devtools/automake/automake.inc        |    1 -
> >  .../{automake_1.11.1.bb =3D> automake_1.11.2.bb}     |    5 +++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)  rename
> > meta/recipes-devtools/automake/{automake_1.11.1.bb =3D>
> > automake_1.11.2.bb} (88%)
> >
> > diff --git a/meta/recipes-devtools/automake/automake.inc
> > b/meta/recipes-devtools/automake/automake.inc
> > index 25b0c0e..c259673 100644
> > --- a/meta/recipes-devtools/automake/automake.inc
> > +++ b/meta/recipes-devtools/automake/automake.inc
> > @@ -4,7 +4,6 @@ Standards. Automake requires the use of Autoconf."
> >  LICENSE =3D "GPLv2"
> >  HOMEPAGE =3D "http://www.gnu.org/software/automake/"
> >  SECTION =3D "devel"
> > -PR =3D "r5"
> >
> >  SRC_URI =3D "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2 "
> >
> > diff --git a/meta/recipes-devtools/automake/automake_1.11.1.bb
> > b/meta/recipes-devtools/automake/automake_1.11.2.bb
> > similarity index 88%
> > rename from meta/recipes-devtools/automake/automake_1.11.1.bb
> > rename to meta/recipes-devtools/automake/automake_1.11.2.bb
> > index ff8353f..18436d2 100644
> > --- a/meta/recipes-devtools/automake/automake_1.11.1.bb
> > +++ b/meta/recipes-devtools/automake/automake_1.11.2.bb
> > @@ -37,8 +37,9 @@ SRC_URI +=3D "${PATHFIXPATCH} \
> >  	    file://prefer-cpio-over-pax-for-ustar-archives.patch \
> >  	    file://python-libdir.patch"
> >
> > -SRC_URI[md5sum] =3D "c2972c4d9b3e29c03d5f2af86249876f"
> > -SRC_URI[sha256sum] =3D
> "5b159d3c0e0a1f87de71b68bcb9f1a1c49e9e71749c9b723f17e2e1e0295c7ae"
> > +PR=3Dr0
>=20
> Just style issue but please add spaces and quotes.
Thanks for catching this. I have fixed it on the contrib branch: nitin/upgr=
ades+fixes

Thanks,
Nitin

>=20
> > +SRC_URI[md5sum] =3D "18194e804d415767bae8f703c963d456"
> > +SRC_URI[sha256sum] =3D
> "4f46d1f9380c8a3506280750f630e9fc915cb1a435b724be56b499d016368718"
> >
> >  do_install () {
> >  	oe_runmake 'DESTDIR=3D${D}' install
> > --
> > 1.7.6.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


