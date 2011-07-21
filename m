Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QjwL2-0001xi-5y
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 18:43:04 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jul 2011 09:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,242,1309762800"; d="scan'208";a="30806664"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2011 09:38:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 21 Jul 2011 09:38:52 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Thu, 21 Jul 2011 09:38:52 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jul 2011 09:38:50 -0700
Thread-Topic: [OE-core] [PATCH 2/2] glib-2.0: fix a compilation issue due to
	dtrace
Thread-Index: AcxHv2iNWehkEa7TRsah6hcvI1JRBQABRjBw
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE4E76A3@orsmsx504.amr.corp.intel.com>
References: <cover.1311240498.git.nitin.a.kamble@intel.com>
	<3a3c12b31f8d8dc600750be9d75aeeb236c5b618.1311240498.git.nitin.a.kamble@intel.com>
	<1311264030.30326.140.camel@phil-desktop>
In-Reply-To: <1311264030.30326.140.camel@phil-desktop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] glib-2.0: fix a compilation issue due to dtrace
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
X-List-Received-Date: Thu, 21 Jul 2011 16:43:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Thursday, July 21, 2011 9:00 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 2/2] glib-2.0: fix a compilation issue
> due to dtrace
>=20
> On Thu, 2011-07-21 at 02:29 -0700, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> Could you add some text to the commit message explaining what the
> compilation issue was and under what circumstances it occurred?  It
> might also be good to know why bumping PR isn't necessary.
>=20
Phil,
  I felt the PR bump was not necessary, as it was fixing the compilation is=
sue. I will add more information to the commit and resend it.

> Also:
>=20
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> > index a2e609f..7d095c1 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
> > @@ -19,4 +19,3 @@ SRC_URI[md5sum] =3D
> "789e7520f71c6a4bf08bc683ec764d24"
> >  SRC_URI[sha256sum] =3D
> "222f3055d6c413417b50901008c654865e5a311c73f0ae918b0a9978d1f9466f"
> >
> >  BBCLASSEXTEND =3D "native"
> > -
>=20
> ... I guess this part of the patch can be omitted.

Noted down.

Thanks,
Nitin

>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


