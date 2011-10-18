Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RGGy8-0005Bc-O2
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 23:13:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Oct 2011 14:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64290563"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga001.jf.intel.com with ESMTP; 18 Oct 2011 14:07:13 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx604.amr.corp.intel.com ([10.250.113.17]) with mapi;
	Tue, 18 Oct 2011 14:07:13 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 18 Oct 2011 14:07:12 -0700
Thread-Topic: [OE-core] [PATCH 3/5] python-scons: upgrade from 2.0.1 to 2.1.0
Thread-Index: AcyN1/Y0hESKySZ+Qv2/cNIl1TisJAAAeQ4w
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E2F429D2@orsmsx504.amr.corp.intel.com>
References: <cover.1318968860.git.nitin.a.kamble@intel.com>
	<3e92600b78e184b9388ed75c91796aa5ee17a3fc.1318968860.git.nitin.a.kamble@intel.com>
	<20111018205425.GC27472@sakrah.homelinux.org>
In-Reply-To: <20111018205425.GC27472@sakrah.homelinux.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] python-scons: upgrade from 2.0.1 to 2.1.0
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
X-List-Received-Date: Tue, 18 Oct 2011 21:13:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Tuesday, October 18, 2011 1:54 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 3/5] python-scons: upgrade from 2.0.1 to
> 2.1.0
>=20
> On (18/10/11 13:15), nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  ...ative_2.0.1.bb =3D> python-scons-native_2.1.0.bb} |    3 +--
> >  ...python-scons_2.0.1.bb =3D> python-scons_2.1.0.bb} |    6 +++---
> >  2 files changed, 4 insertions(+), 5 deletions(-)
> >  rename meta/recipes-devtools/python/{python-scons-native_2.0.1.bb =3D>
> python-scons-native_2.1.0.bb} (89%)
> >  rename meta/recipes-devtools/python/{python-scons_2.0.1.bb =3D>
> python-scons_2.1.0.bb} (51%)
> >
> > diff --git a/meta/recipes-devtools/python/python-scons-
> native_2.0.1.bb b/meta/recipes-devtools/python/python-scons-
> native_2.1.0.bb
> > similarity index 89%
> > rename from meta/recipes-devtools/python/python-scons-native_2.0.1.bb
> > rename to meta/recipes-devtools/python/python-scons-native_2.1.0.bb
> > index f7646a2..083ad15 100644
> > --- a/meta/recipes-devtools/python/python-scons-native_2.0.1.bb
> > +++ b/meta/recipes-devtools/python/python-scons-native_2.1.0.bb
> > @@ -2,5 +2,4 @@ require python-scons_${PV}.bb
> >  inherit native
> >  DEPENDS =3D "python-native"
> >  RDEPENDS_${PN} =3D ""
> > -PR =3D "r1"
> > -
> > +PR =3D "r0"
> > diff --git a/meta/recipes-devtools/python/python-scons_2.0.1.bb
> b/meta/recipes-devtools/python/python-scons_2.1.0.bb
> > similarity index 51%
> > rename from meta/recipes-devtools/python/python-scons_2.0.1.bb
> > rename to meta/recipes-devtools/python/python-scons_2.1.0.bb
> > index 1c7939e..22df333 100644
> > --- a/meta/recipes-devtools/python/python-scons_2.0.1.bb
> > +++ b/meta/recipes-devtools/python/python-scons_2.1.0.bb
> > @@ -1,15 +1,15 @@
> >  DESCRIPTION =3D "A Software Construction Tool"
> >  SECTION =3D "devel/python"
> >  LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D8481211ebbeaed9cdc7ad5a3b0c98aaf"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Dab8b65435c2e520ed18e67459f1f9bb9"
>=20
> a little commentary on what changed in license text would be nice here

The change is copyright year to 2011 :)
Nitin

>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


