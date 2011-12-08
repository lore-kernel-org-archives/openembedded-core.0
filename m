Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RYixe-0004O6-U3
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 19:44:51 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Dec 2011 10:37:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100168506"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2011 10:37:56 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx602.amr.corp.intel.com ([10.22.226.211]) with mapi;
	Thu, 8 Dec 2011 10:37:57 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 8 Dec 2011 10:37:55 -0800
Thread-Topic: [OE-core] [PATCH 05/11] findutils: Fix compilation for x32
	toolchain
Thread-Index: Acy1iO6fm2P8zpTuRG6+nH85iM0Q7gAT1v8g
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E3FA7B5E@orsmsx504.amr.corp.intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
	<664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
	<7e5d0671426509d061abbe8b320f65f2cfb3a8a0.1323323130.git.nitin.a.kamble@intel.com>
	<CAMKF1spqOpuz-M7e-F5Cwgx_ufQ4m7MTfBv05StCCXE3e5zV4w@mail.gmail.com>
	<1323335282.971.11.camel@ted>
In-Reply-To: <1323335282.971.11.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "hjl.tools@gmail.com" <hjl.tools@gmail.com>
Subject: Re: [PATCH 05/11] findutils: Fix compilation for x32 toolchain
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
X-List-Received-Date: Thu, 08 Dec 2011 18:44:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Thursday, December 08, 2011 1:08 AM
> To: Patches and discussions about the oe-core layer
> Cc: hjl.tools@gmail.com
> Subject: Re: [OE-core] [PATCH 05/11] findutils: Fix compilation for x32
> toolchain
>=20
> On Wed, 2011-12-07 at 23:14 -0800, Khem Raj wrote:
> > On Wed, Dec 7, 2011 at 9:48 PM,  <nitin.a.kamble@intel.com> wrote:
> > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > >
> > > Work around gnulib time_t assumption in findutils for x32
> >
> > if its a workaround can it be applied only to x32 with help of
> overrides please
>=20
> Its not a workaround, the patch looks like a generic reasonable fix to
> correct assumptions made by the program that aren't true?


Even though x32 caught the issue, the issue is not x32 specific. And also=20
other arches are building fine with the change. So I think it is better=20
to keep this patch in oecore.

Nitin

>=20
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


