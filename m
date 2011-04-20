Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QCN0S-0002Il-Hb
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 04:19:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Apr 2011 19:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,243,1301900400"; d="scan'208";a="911969558"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga001.fm.intel.com with ESMTP; 19 Apr 2011 19:16:38 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi;
	Tue, 19 Apr 2011 19:16:37 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 19 Apr 2011 19:16:34 -0700
Thread-Topic: [OE-core] gcc 4.6 recipes naming
Thread-Index: Acv+4nVhN7bRfQqJQhi+54e9NeeQ4wAHk0cA
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94515DC35F@orsmsx504.amr.corp.intel.com>
References: <BANLkTini7EDvr-GoW1AP3aaQWjv6tYjOLQ@mail.gmail.com>
	<1303225305.5518.219.camel@rex>
	<BANLkTi=shye_RULY2_AZuz9Kca8+N_qNxQ@mail.gmail.com>
	<1303252653.5518.293.camel@rex>
In-Reply-To: <1303252653.5518.293.camel@rex>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: gcc 4.6 recipes naming
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
X-List-Received-Date: Wed, 20 Apr 2011 02:19:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Also if we keep the 4.6.x notation, it helps matching gcc -v with the gcc_4=
.6.x package installed on the target.

Thanks,
Nitin


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Tuesday, April 19, 2011 3:38 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] gcc 4.6 recipes naming
>=20
> On Tue, 2011-04-19 at 10:33 -0700, Khem Raj wrote:
> > On Tue, Apr 19, 2011 at 8:01 AM, Richard Purdie
> > > I think this is just going to confuse people to be honest. I'm
> happy to
> > > stick to the 4.6.0 naming, then move to 4.6.1 and so forth over
> time.
> > > People expect to see the .X number else they just get confused
> about
> > > which patch revision we're at.
> > >
> > > What I'm thinking we will do differently to OE is not to have every
> > > point release available but try and stick to the latest. The
> exception
> > > would be when there is a problem in the point release version which
> we
> > > don't have a fix for.
> >
> > usually later minor release will always be better (since they are
> bugfixes only)
> > so chances are less that we will regress
>=20
> Agreed, I'm just being clear what the expectations are! :)
>=20
> > > Does that sound reasonable?
> > >
> >
> > Yes having just one minor release at a time makes it easier
> certainly.
> > I was trying to make it easy to push updates and we could avoid some
> > git operations and logs would be straighter too since recipes would
> live
> > longer otherwise we will be git mv'ing them every 6 months when
> release happens.
>=20
> I think this is fine, we do this for the other recipes too.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


