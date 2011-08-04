Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp6wg-0007xY-Nv
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 01:03:18 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Aug 2011 15:58:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,320,1309762800"; d="scan'208";a="38006708"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2011 15:58:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 4 Aug 2011 15:58:48 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Thu, 4 Aug 2011 15:58:48 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 4 Aug 2011 15:58:48 -0700
Thread-Topic: [OE-core] [PATCH 04/10] glibc: bring back the needed support
	for glibc recipes
Thread-Index: AcxS+K9gCS7cTqnaQKq/64f0GUvjjwAAUuOg
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE85F588@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<03d062a7104f31d03893833485ec3836c07e8f90.1312469790.git.nitin.a.kamble@intel.com>
	<1312494646.3169.2.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4C1@orsmsx504.amr.corp.intel.com>
	<CA+M6bX=xN7Ek_rh4Qu=RxbRJQ5CrSK7qRy=Vh=S7L-OdR4SHyw@mail.gmail.com>
In-Reply-To: <CA+M6bX=xN7Ek_rh4Qu=RxbRJQ5CrSK7qRy=Vh=S7L-OdR4SHyw@mail.gmail.com>
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
X-List-Received-Date: Thu, 04 Aug 2011 23:03:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Tom Rini
> Sent: Thursday, August 04, 2011 3:49 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the needed
> support for glibc recipes
>=20
> On Thu, Aug 4, 2011 at 3:04 PM, Kamble, Nitin A
> <nitin.a.kamble@intel.com> wrote:
> >
> >
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> >> Phil Blundell
> >> Sent: Thursday, August 04, 2011 2:51 PM
> >> To: Patches and discussions about the oe-core layer
> >> Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the needed
> >> support for glibc recipes
> >>
> >> On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> >> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >> >
> >> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> >>
> >> This commit message is very terse. =A0Why is this change necessary?
> >
> > Because meta-x32 layer has glibc, which needs these support files. I
> will update the commit message in the tree.
>=20
> Can x32 not use eglibc?
Not yet, x32 work is done on the glibc tip, and eglibc is not there to pick=
 up the work.

Nitin

>=20
> --
> Tom
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


