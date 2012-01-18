Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Rnf8d-0003oC-Pw
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 00:41:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Jan 2012 15:34:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="98039156"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by orsmga001.jf.intel.com with ESMTP; 18 Jan 2012 15:34:12 -0800
Received: from orsmsx152.amr.corp.intel.com (10.22.226.39) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 18 Jan 2012 15:34:11 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.13]) by
	ORSMSX152.amr.corp.intel.com ([169.254.8.207]) with mapi id
	14.01.0355.002; Wed, 18 Jan 2012 15:34:11 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/5] guile: new recipe for autogen
Thread-Index: AQHM1VcCSAYx49LWRUWx61XcANBMzpYSabuAgAA1APCAACmUoA==
Date: Wed, 18 Jan 2012 23:34:10 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C012A381C@ORSMSX106.amr.corp.intel.com>
References: <b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
	<b8e0859cf0bc609d134ce75fc763ff305549a0c1.1326831402.git.nitin.a.kamble@intel.com>
	<10DCD6A9-4386-4224-A1EE-F5C97CD71CD8@dominion.thruhere.net>
	<ADD6A3980E8C39419A432FF422031B4C012A36FC@ORSMSX106.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C012A36FC@ORSMSX106.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] guile: new recipe for autogen
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
X-List-Received-Date: Wed, 18 Jan 2012 23:41:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Kamble, Nitin A
> Sent: Wednesday, January 18, 2012 1:09 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 3/5] guile: new recipe for autogen
>=20
>=20
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> > Koen Kooi
> > Sent: Wednesday, January 18, 2012 1:54 AM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 3/5] guile: new recipe for autogen
> >
> >
> > Op 17 jan. 2012, om 21:30 heeft nitin.a.kamble@intel.com het volgende
> > geschreven:
> >
> > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > >
> > > guile recipe is needed by autogen.
> >
> > How much does this differ from the guile in meta-oe?
>=20
> Koen,
>   I could not get the guide-config-cross stuff working with this
> version.
> I don't understand guile that well to fix this.
> Who created the guilt recipes in meta-oe ?
> Other than that I don't see any functional differences other than newer
> Version.
>=20
> Nitin


I spent more time, and could get the guile-config-cross stuff working in th=
e newer recipe.
So with this in the meta-oe guile recipes can be removed.

Nitin

>=20
>=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


