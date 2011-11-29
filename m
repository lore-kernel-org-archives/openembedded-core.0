Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RVV1D-0005Vn-Q8
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 22:15:12 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Nov 2011 13:08:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,593,1315206000"; d="scan'208";a="80365922"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by azsmga001.ch.intel.com with ESMTP; 29 Nov 2011 13:08:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 29 Nov 2011 13:08:30 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Tue, 29 Nov 2011 13:08:30 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 13:08:30 -0800
Thread-Topic: [OE-core] [PATCH 1/4] gmp: also generate the libgmpcxx library
	& package it properly
Thread-Index: Acyu1GT9xcjRtFnZSc6++CXnwvHxOAABo9iA
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E3D9E7EE@orsmsx504.amr.corp.intel.com>
References: <cover.1322594901.git.nitin.a.kamble@intel.com>
	<48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>
	<1322598026.3077.11.camel@lenovo.internal.reciva.com>
In-Reply-To: <1322598026.3077.11.camel@lenovo.internal.reciva.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] gmp: also generate the libgmpcxx library & package it properly
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
X-List-Received-Date: Tue, 29 Nov 2011 21:15:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Tuesday, November 29, 2011 12:20 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 1/4] gmp: also generate the libgmpcxx
> library & package it properly
>=20
> On Tue, 2011-11-29 at 11:30 -0800, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > configure runs few checks to make sure c++ compiler and runtime are
> working
> > as expected with the --enable-cxx=3Ddetect option. And it enables
> building
> > of libgmpxx library.
> >
> > Same as earlier the libgmp.so.10.x file is packaged in the libgmp10
> package,
> > and a new package named libgmpxx4 is added for libgmpxx.so.4.x file.
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > Signed-off-by: Phil Blundell <philb@gnu.org>
>=20
> Um, why does this patch have my name in Signed-off-by?
>=20
> p.

Because I took the code from your email.

Nitin

>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


