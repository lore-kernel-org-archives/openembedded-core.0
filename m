Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QpMX0-00018A-HQ
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:41:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2011 08:37:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="35750702"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2011 08:37:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 5 Aug 2011 08:37:24 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Fri, 5 Aug 2011 08:37:24 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 5 Aug 2011 08:37:24 -0700
Thread-Topic: [OE-core] [PATCH 09/10] x86 tune inc files: add x32 abi tune
	parameters
Thread-Index: AcxTRHOAe4/KQvgGRoOlHxwkMYddWwAPo9YQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE85F892@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<2c351319afd13acfca1283104172729925cfb696.1312469790.git.nitin.a.kamble@intel.com>
	<1312495032.3169.6.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4F7@orsmsx504.amr.corp.intel.com>
	<1312530654.3169.12.camel@lenovo.internal.reciva.com>
In-Reply-To: <1312530654.3169.12.camel@lenovo.internal.reciva.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 09/10] x86 tune inc files: add x32 abi tune parameters
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
X-List-Received-Date: Fri, 05 Aug 2011 15:41:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Friday, August 05, 2011 12:51 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 09/10] x86 tune inc files: add x32 abi
> tune parameters
>=20
> On Thu, 2011-08-04 at 15:18 -0700, Kamble, Nitin A wrote:
> >
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> > > Phil Blundell
> > > Sent: Thursday, August 04, 2011 2:57 PM
> > > To: Patches and discussions about the oe-core layer
> > > Subject: Re: [OE-core] [PATCH 09/10] x86 tune inc files: add x32
> abi
> > > tune parameters
> > >
> > > On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> > > >  # ELF32 ABI
> > > >  TUNEVALID[m32] =3D "IA32 ELF32 standard ABI"
> > > > -TUNECONFLICTS[m32] =3D "m64"
> > > > +TUNECONFLICTS[m32] =3D "m64 mx32"
> > > >  TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m32",
> > > "${X86ARCH32}", "" ,d)}"
> > > > +ABIEXTENSION .=3D "${@bb.utils.contains("TUNE_FEATURES", "m32",
> "32",
> > > "" ,d)}"
> > > >  TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "m32", "-
> m32",
> > > "", d)}"
> > >
> > > This is going to cause TARGET_OS to change for everyone using the
> i586
> > > ABI, right?  That doesn't seem like it is either necessary or
> > > desirable,
> > > and it isn't mentioned in the checkin comment either.
> >
> > Correct, this will change the TARGET_OS from linux_gnu to
> linux_gnu32. And it is also applicable for x86-64 machine set with x86
> tune. This change is be needed if multiple tunes are built from the
> same build directory. If such situation is not important then the
> ABIEXTENSION part can be dropped.
>=20
> Well, if you build i686 and x32 in the same tree they will already be
> disambiguated through TARGET_ARCH.  Likewise i686 and x86-64 already
> works for the same reason.  So, the only possible conflict is between
> x86-64 and x32, and setting ABIEXTENSION for x32 (only) would be
> sufficient to avoid that.
>=20
Now for TARGET_ARCH=3Dx86_64 there are multiple targets, one is 64bit, anot=
her=20
is x32 and yet another is 32. This is new addition due to multilib changes.=
=20
To distinguish the these different ABI target, TARGET_OS is appended with=20
the ABIEXTENSION.

> Though, I do wonder whether x32 ought to just have its own TARGET_ARCH
> value rather than trying to disambiguate it through TARGET_OS hackery.


Changing TARGET_ARCH is not correct way to handle it. Because HW/ARCH is=20
not different, the difference is in the ABI of the OS. And also changing=20
TARGET_ARCH would bring lot of other changes in recipes and classes in the=
=20
Tree.

Thanks,
Nitin

>=20
> p.
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


