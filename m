Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QfEp5-0004h9-Id
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 19:26:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Jul 2011 10:22:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="24528882"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by azsmga001.ch.intel.com with ESMTP; 08 Jul 2011 10:22:39 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 8 Jul 2011 10:22:35 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Fri, 8 Jul 2011 10:22:35 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jul 2011 10:22:34 -0700
Thread-Topic: [OE-core] eglibc issuettes continued
Thread-Index: Acw9k1p54+tGfkblRM2NpfoAMfDt2QAABtXQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE226688@orsmsx504.amr.corp.intel.com>
References: <1310139697.6337.134.camel@phil-desktop>
	<1310143750.20015.911.camel@rex>
	<9DA5872FEF993D41B7173F58FCF6BE94DE226629@orsmsx504.amr.corp.intel.com>
	<1310145557.20015.914.camel@rex>
In-Reply-To: <1310145557.20015.914.camel@rex>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: eglibc issuettes continued
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
X-List-Received-Date: Fri, 08 Jul 2011 17:26:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard,
 You can make similar patch for localtime, (which is a broken link), Otherw=
ise I will send a patch for it.

Nitin


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Friday, July 08, 2011 10:19 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] eglibc issuettes continued
>=20
> On Fri, 2011-07-08 at 09:59 -0700, Kamble, Nitin A wrote:
> > I sent a patch to fix /etc/localtime & /etc/rpc files. Other than
> that I am not seeing any issues for the eglibc recipe packaging.
>=20
> I pushed:
>=20
> http://git.openembedded.net/cgit.cgi/openembedded-
> core/commit/?id=3D93ce74a299832ca7f24b4ce1b951abffa0232612
>=20
> to fix one of those. If there is still the localtime issue, we probably
> need a patch for that one...
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


