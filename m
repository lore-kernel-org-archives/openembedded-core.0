Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QpNlH-0006kt-Ji
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 19:00:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2011 09:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,324,1309762800"; d="scan'208";a="36247846"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2011 09:56:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 5 Aug 2011 09:56:11 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Fri, 5 Aug 2011 09:56:10 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 5 Aug 2011 09:56:09 -0700
Thread-Topic: [OE-core] [PATCH 08/10] insane.bbclass: add entries for
	linux-gnu<ABI>
Thread-Index: AcxTidJxcBkbFpUQQI20lDaY54OjGQABpYBg
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE85F9B5@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<6f5d9933df00c226e73afe5398613021a6a58133.1312469790.git.nitin.a.kamble@intel.com>
	<1312560418.14274.127.camel@rex>
In-Reply-To: <1312560418.14274.127.camel@rex>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 08/10] insane.bbclass: add entries for linux-gnu<ABI>
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
X-List-Received-Date: Fri, 05 Aug 2011 17:00:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Friday, August 05, 2011 9:07 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 08/10] insane.bbclass: add entries for
> linux-gnu<ABI>
>=20
> On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > for x86_64 multiple ABIs now have these new names for the TARGET_OS.
> > Add entries for:
> >  linux-gnu32, linux-gnux32, linux-gnu64
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  meta/classes/insane.bbclass |    9 +++++++++
> >  1 files changed, 9 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/classes/insane.bbclass
> b/meta/classes/insane.bbclass
> > index 5fb0d98..15e7fc7 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -90,6 +90,15 @@ def package_qa_get_machine_dict():
> >                          "microblaze":   (47787,  0,    0,
> False,         32),
> >                          "microblazeel": (47787,  0,    0,
> True,          32),
> >                        },
> > +            "linux-gnu32" :       {
> > +                        "x86_64":     (62,     0,    0,
> True,          32),
> > +                      },
>=20
> This one doesn't make sense to me. linux-gnu32 would be i586 (arch=3D3)
> and not arch=3D62?
>=20
> > +            "linux-gnux32" :       {
> > +                        "x86_64":     (62,     0,    0,
> True,          32),
> > +                      },
>=20
> This one is fine.
>=20
> > +            "linux-gnu64" :       {
> > +                        "x86_64":     (62,     0,    0,
> True,          64),
> > +                      },
> >         }
>=20
> I'm not sure we need this either...

If the ABIEXTENTION is taken out for m32 & m64 tunes, then these are not ne=
eded. So I will take them out.
Thanks,
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


