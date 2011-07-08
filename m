Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QfIXu-0000MW-5M
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 23:25:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jul 2011 14:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="28020979"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2011 14:15:15 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx604.amr.corp.intel.com ([10.250.113.17]) with mapi;
	Fri, 8 Jul 2011 14:15:14 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jul 2011 14:15:14 -0700
Thread-Topic: [OE-core] [PATCH 4/7] binutils: package unpackaged files
Thread-Index: Acw9hIATQJ09IHktR7+DyiM5k1FkjgALtSDA
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE293C92@orsmsx504.amr.corp.intel.com>
References: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
	<12dc19831b4766f0894ff43ae916150057a0e65e.1310070283.git.nitin.a.kamble@intel.com>
	<1310138792.20015.880.camel@rex>
	<1310139246.6337.130.camel@phil-desktop>
In-Reply-To: <1310139246.6337.130.camel@phil-desktop>
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
X-List-Received-Date: Fri, 08 Jul 2011 21:25:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Friday, July 08, 2011 8:34 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 4/7] binutils: package unpackaged files
>=20
> On Fri, 2011-07-08 at 16:26 +0100, Richard Purdie wrote:
> > > @@ -35,11 +35,13 @@ FILES_${PN}-symlinks =3D " \
> > >  	${bindir}/c++filt \
> > >  	${bindir}/gprof \
> > >  	${bindir}/ld \
> > > +	${bindir}/ld.bfd \
> > >  	${bindir}/nm \
> > >  	${bindir}/objcopy \
> > >  	${bindir}/objdump \
> > >  	${bindir}/ranlib \
> > >  	${bindir}/readelf \
> > > +	${bindir}/elfedit \
> > >  	${bindir}/size \
> > >  	${bindir}/strip"
> >
> > Nitin, do you know if the ld.bfd above is a hardlinked copy of ld?
>=20
> If you're getting ld.bfd at all (at least with our current recipes)
> then
> it probably means that ${bindir}/ld is gold.  So in that case they
> oughtn't to be symlinked.
>=20
Just verified that ld.bfd is a soft link to i586-poky-linux-ld.bfd

So what is the right think here, rm -f ld.bfd, or putting it in the symlink=
s package is good?

Nitin

> p.
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


