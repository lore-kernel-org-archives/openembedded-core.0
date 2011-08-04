Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp6vl-0007vI-6p
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 01:02:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2011 15:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,320,1309762800"; d="scan'208";a="35292964"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by azsmga001.ch.intel.com with ESMTP; 04 Aug 2011 15:57:56 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx602.amr.corp.intel.com ([10.22.226.211]) with mapi;
	Thu, 4 Aug 2011 15:57:56 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 4 Aug 2011 15:57:56 -0700
Thread-Topic: [OE-core] [PATCH 04/10] glibc: bring back the needed support
	for glibc recipes
Thread-Index: AcxS+OBWMZLN9ScsTtWQA+JYwRn4zQAALEZQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE85F584@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<03d062a7104f31d03893833485ec3836c07e8f90.1312469790.git.nitin.a.kamble@intel.com>
	<1312494646.3169.2.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4C1@orsmsx504.amr.corp.intel.com>
	<1312495815.3169.9.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F563@orsmsx504.amr.corp.intel.com>
	<CA+M6bXmzQdpJfADuj65emFTfED=o-HhF7QufdVtMTJCbcCgGGQ@mail.gmail.com>
In-Reply-To: <CA+M6bXmzQdpJfADuj65emFTfED=o-HhF7QufdVtMTJCbcCgGGQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 04/10] glibc: bring back the needed support for glibc recipes
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
X-List-Received-Date: Thu, 04 Aug 2011 23:02:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Tom Rini
> Sent: Thursday, August 04, 2011 3:50 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the needed
> support for glibc recipes
>=20
> On Thu, Aug 4, 2011 at 3:47 PM, Kamble, Nitin A
> <nitin.a.kamble@intel.com> wrote:
> >
> >
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> >> Phil Blundell
> >> Sent: Thursday, August 04, 2011 3:10 PM
> >> To: Patches and discussions about the oe-core layer
> >> Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the needed
> >> support for glibc recipes
> >>
> >> On Thu, 2011-08-04 at 15:04 -0700, Kamble, Nitin A wrote:
> >> >
> >> > > -----Original Message-----
> >> > > From: openembedded-core-bounces@lists.openembedded.org
> >> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf
> >> Of
> >> > > Phil Blundell
> >> > > Sent: Thursday, August 04, 2011 2:51 PM
> >> > > To: Patches and discussions about the oe-core layer
> >> > > Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the
> needed
> >> > > support for glibc recipes
> >> > >
> >> > > On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com
> wrote:
> >> > > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >> > > >
> >> > > > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> >> > >
> >> > > This commit message is very terse. =A0Why is this change
> necessary?
> >> >
> >> > Because meta-x32 layer has glibc, which needs these support files.
> I
> >> will update the commit message in the tree.
> >>
> >> Can't the tclibc-glibc file go in meta-x32 as well, then?
> >>
> > It can go in the meta-x32 layer, but I think better place for this
> support file is in the meta layer. It would help avoid duplication of
> the code in multiple layers.
>=20
> Part of the answer here is that obsolete / etc things don't belong in
> the core, but in other layers that need them.  My read on things is
> that we've removed glibc in favor of eglibc...

With high demand I will move the glibc file in the meta-x32 layer. I was tr=
ying to do what felt right at 1st, but I wasn't aware that eglibc is favore=
d so much over glibc.
>=20
> --
> Tom
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


