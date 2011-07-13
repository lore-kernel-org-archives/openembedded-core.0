Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qh1vk-0001yL-8p
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 18:04:56 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2011 08:41:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,525,1304319600"; d="scan'208";a="25424222"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 08:41:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 13 Jul 2011 08:41:41 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Wed, 13 Jul 2011 08:41:41 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 08:41:39 -0700
Thread-Topic: [OE-core] [PATCH 1/5] siteinfo.bbclass: hack for x32
Thread-Index: AcxBJa4B1y2ltQ11TXyJNBPgRAFoAQATZLuA
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE31041C@orsmsx504.amr.corp.intel.com>
References: <cover.1310497097.git.nitin.a.kamble@intel.com>
	<af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
	<0FDDF2A7-BB8C-46D1-B0AE-985C71CCFFBB@gmail.com>
In-Reply-To: <0FDDF2A7-BB8C-46D1-B0AE-985C71CCFFBB@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] siteinfo.bbclass: hack for x32
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
X-List-Received-Date: Wed, 13 Jul 2011 16:04:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Tuesday, July 12, 2011 11:20 PM
> To: Patches and discussions about the oe-core layer
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/5] siteinfo.bbclass: hack for x32
>=20
>=20
>=20
> On Jul 12, 2011, at 12:02 PM, nitin.a.kamble@intel.com wrote:
>=20
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> > meta/classes/siteinfo.bbclass |    3 +++
> > 1 files changed, 3 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/classes/siteinfo.bbclass
> b/meta/classes/siteinfo.bbclass
> > index 78b7008..035355f 100644
> > --- a/meta/classes/siteinfo.bbclass
> > +++ b/meta/classes/siteinfo.bbclass
> > @@ -59,6 +59,9 @@ def get_siteinfo_list(d):
> >                "x86_64-linux":            "endian-little bit-64
> common-glibc",\
> >                "x86_64-linux-uclibc":     "endian-little bit-64
> common-uclibc"}
> >        if target in targetinfo:
> > +                  target_cc_arch =3D bb.data.getVar('TARGET_CC_ARCH',
> d, 1)
> > +               if target_cc_arch =3D=3D "-mx32":
> > +                     target =3D "i686-linux"
>=20
> What would/could target be when using -mx32 ?
> I suppose it's one of the entries in dictionary above
>=20
So far x86_64 is the target for x32.

Nitin

>=20
>=20
> >                info =3D targetinfo[target].split()
> >                info.append(target)
> >                info.append("common")
> > --
> > 1.7.5.4
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


