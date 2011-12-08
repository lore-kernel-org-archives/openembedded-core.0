Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RYivp-0004KS-Vz
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 19:42:58 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Dec 2011 10:36:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100167758"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2011 10:36:07 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx602.amr.corp.intel.com ([10.22.226.211]) with mapi;
	Thu, 8 Dec 2011 10:36:07 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2011 10:36:04 -0800
Thread-Topic: [OE-core] [PATCH 02/11] mdadm: Make custom CC definition
	conditional
Thread-Index: Acy1ee32G6rV4Ad3SSWqmvAOMRW8CQAXjaXQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E3FA7B57@orsmsx504.amr.corp.intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
	<664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
	<5ca5c0566bdfb8c66df8db831e116b35b7fbb3d8.1323323130.git.nitin.a.kamble@intel.com>
	<CAMKF1sp=VgL+FoxWk47qPyLVXgYF5oSsv5BrSkeFGgyA3j0Lcg@mail.gmail.com>
In-Reply-To: <CAMKF1sp=VgL+FoxWk47qPyLVXgYF5oSsv5BrSkeFGgyA3j0Lcg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "hjl.tools@gmail.com" <hjl.tools@gmail.com>
Subject: Re: [PATCH 02/11] mdadm: Make custom CC definition	conditional
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
X-List-Received-Date: Thu, 08 Dec 2011 18:42:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Wednesday, December 07, 2011 11:20 PM
> To: Patches and discussions about the oe-core layer
> Cc: hjl.tools@gmail.com
> Subject: Re: [OE-core] [PATCH 02/11] mdadm: Make custom CC definition
> conditional
>=20
> On Wed, Dec 7, 2011 at 9:48 PM,  <nitin.a.kamble@intel.com> wrote:
> > +
> > ++ifndef CC
> > + CC =3D $(CROSS_COMPILE)gcc
> > ++endif
> > ++
>=20
> may be you could do
>=20
> CC ?=3D $(CROSS_COMPILE)gcc
> here instead

Yes, This way also works the same, I changed the commit accordingly.

>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


