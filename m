Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QpTqP-0004Jf-0M
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 01:30:21 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2011 16:25:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,326,1309762800"; d="scan'208";a="36346462"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2011 16:25:51 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx604.amr.corp.intel.com ([10.250.113.17]) with mapi;
	Fri, 5 Aug 2011 16:25:50 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 5 Aug 2011 16:25:48 -0700
Thread-Topic: [OE-core] [PATCH 09/10] x86 tune inc files: add x32 abi tune
	parameters
Thread-Index: AcxTtgSMKgdR9+M9RpaqzZqjDQZynwAENmSA
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE903E65@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<2c351319afd13acfca1283104172729925cfb696.1312469790.git.nitin.a.kamble@intel.com>
	<1312560258.14274.125.camel@rex>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85FADF@orsmsx504.amr.corp.intel.com>
	<4E3C5F6D.401@linux.intel.com>
In-Reply-To: <4E3C5F6D.401@linux.intel.com>
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
X-List-Received-Date: Fri, 05 Aug 2011 23:30:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Saul Wold
> Sent: Friday, August 05, 2011 2:24 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 09/10] x86 tune inc files: add x32 abi
> tune parameters
>=20
> On 08/05/2011 11:07 AM, Kamble, Nitin A wrote:
> >
> >
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> >> Richard Purdie
> >> Sent: Friday, August 05, 2011 9:04 AM
> >> To: Patches and discussions about the oe-core layer
> >> Subject: Re: [OE-core] [PATCH 09/10] x86 tune inc files: add x32 abi
> >> tune parameters
> >>
> >> On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> >>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >>>
> >>> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> >>> ---
> >>>   meta/conf/machine/include/ia32/arch-ia32.inc |   23
> >> ++++++++++++++++++++---
> >>>   meta/conf/machine/include/tune-core2.inc     |    4 ++++
> >>>   meta/conf/machine/include/tune-x86_64.inc    |    2 +-
> >>>   3 files changed, 25 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc
> >> b/meta/conf/machine/include/ia32/arch-ia32.inc
> >>> index 2709440..fb527da 100644
> >>> --- a/meta/conf/machine/include/ia32/arch-ia32.inc
> >>> +++ b/meta/conf/machine/include/ia32/arch-ia32.inc
> >>> @@ -6,17 +6,29 @@ DEFAULTTUNE ?=3D "x86"
> >>>   TARGET_FPU ?=3D ""
> >>>   X86ARCH32 ?=3D "i586"
> >>>   X86ARCH64 ?=3D "x86_64"
> >>> +X86ARCHX32 ?=3D "x86_64"
> >>>
> >>>   # ELF32 ABI
> >>>   TUNEVALID[m32] =3D "IA32 ELF32 standard ABI"
> >>> -TUNECONFLICTS[m32] =3D "m64"
> >>> +TUNECONFLICTS[m32] =3D "m64 mx32"
> >>>   TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m32",
> >> "${X86ARCH32}", "" ,d)}"
> >>> +ABIEXTENSION .=3D "${@bb.utils.contains("TUNE_FEATURES", "m32",
> "32",
> >> "" ,d)}"
> >>
> >> Please drop the above line. There is no need to change that.
> >>
> >>>   TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "m32", "-
> m32",
> >> "", d)}"
> >>>
> >>> +# x32 ABI
> >>> +TUNEVALID[mx32] =3D "IA32e (x86_64) ELF32 standard ABI"
> >>> +TUNECONFLICTS[mx32] =3D "m64 m32"
> >>> +TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "mx32",
> >> "${X86ARCHX32}", "" ,d)}"
> >>> +ABIEXTENSION .=3D "${@bb.utils.contains("TUNE_FEATURES", "mx32",
> >> "x32", "" ,d)}"
> >>> +TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-
> >> mx32", "", d)}"
> >>> +TUNE_LDARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m
> >> elf32_x86_64", "", d)}"
> >>> +TUNE_ASARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-
> >> x32", "", d)}"
> >>> +
> >>
> >> These are fine.
> >>
> >>>   # ELF64 ABI
> >>>   TUNEVALID[m64] =3D "IA32e (x86_64) ELF64 standard ABI"
> >>> -TUNECONFLICT[m64] =3D "m32"
> >>> +TUNECONFLICT[m64] =3D "m32 mx32"
> >>>   TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "m64",
> >> "${X86ARCH64}", "" ,d)}"
> >>> +ABIEXTENSION .=3D "${@bb.utils.contains("TUNE_FEATURES", "m64",
> "64",
> >> "" ,d)}"
> >>
> >> Again, please drop the above line.
> >>
> >>>   TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "m64", "-
> m64",
> >> "", d)}"
> >>>
> >>>   TUNE_PKGARCH ?=3D "${@bb.utils.contains("TUNE_FEATURES", "m32",
> "x86",
> >> "x86_64", d)}"
> >>> @@ -30,4 +42,9 @@ PACKAGE_EXTRA_ARCHS_tune-x86 =3D "x86"
> >>>   AVAILTUNES +=3D "x86-64"
> >>>   TUNE_FEATURES_tune-x86-64 ?=3D "m64"
> >>>   BASE_LIB_tune-x86-64 ?=3D "lib64"
> >>> -PACKAGE_EXTRA_ARCHS_tune-x86-64 =3D "x86_64"
> >>> +PACKAGE_EXTRA_ARCHS_tune-x86-64 =3D "x86-64"
> >>
> >> That is likely wrong, please drop this piece.
> >>
> >>> +
> >>> +AVAILTUNES +=3D "x86-64-x32"
> >>> +TUNE_FEATURES_tune-x86-64-x32 ?=3D "mx32"
> >>> +BASE_LIB_tune-x86-64-x32 ?=3D "lib"
> >>> +PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 =3D "x86-64-x32"
> >>
> >> And this is wrong too.
> >>
> >> You really want:
> >>
> >> TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-
> x32",
> >> "", d)}"
> >> PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 =3D "x86_64-x32"
> >>
> >>> diff --git a/meta/conf/machine/include/tune-core2.inc
> >> b/meta/conf/machine/include/tune-core2.inc
> >>> index 25c2226..8a4de3e 100644
> >>> --- a/meta/conf/machine/include/tune-core2.inc
> >>> +++ b/meta/conf/machine/include/tune-core2.inc
> >>> @@ -18,3 +18,7 @@ TUNE_FEATURES_tune-core2-64 ?=3D
> >> "${TUNE_FEATURES_tune-x86-64} core2"
> >>>   BASE_LIB_tune-core2-64 ?=3D "lib64"
> >>>   PACKAGE_EXTRA_ARCHS_tune-core2-64 =3D "${PACKAGE_EXTRA_ARCHS_tune-
> x86-
> >> 64} core2-64"
> >>>
> >>> +AVAILTUNES +=3D "core2-x32"
> >>> +TUNE_FEATURES_tune-core2-x32 ?=3D "${TUNE_FEATURES_tune-x86-64-x32}
> >> core2"
> >>> +BASE_LIB_tune-core2-x32 ?=3D "lib"
> >>> +PACKAGE_EXTRA_ARCHS_tune-core2-x32 =3D "${PACKAGE_EXTRA_ARCHS_tune-
> >> x86-64-x32} core2-x32"
> >>
> >> PACKAGE_EXTRA_ARCHS_tune-core2-x32 =3D "${PACKAGE_EXTRA_ARCHS_tune-
> x86-
> >> 64-x32} core2-64-x32"
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >>
> >
> > Richard,
> >    Changed the commits according to the comments, please pull/cherry-
> pick again.
> >
> It might be best to rebase against master and resend a V2 patch set so
> it's clear to RP and other in the community what you changed.

Ok, second patch set coming soon.
>=20
> BTW, for the layer, do you really need to pull glibc back in?  Or can
> you use eglibc from oe-core with the correct settings for x32?
I will stay with glibc in the meta-x32 for now.

Thanks,
Nitin

>=20
>=20
> Sau!
>=20
> > Thanks,
> > Nitin
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


