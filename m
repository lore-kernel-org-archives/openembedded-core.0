Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RHISb-00020T-A6
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 19:00:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Oct 2011 09:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="65517404"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga002.jf.intel.com with ESMTP; 21 Oct 2011 09:54:50 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 21 Oct 2011 09:54:50 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Fri, 21 Oct 2011 09:54:49 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Wold, Saul" <saul.wold@intel.com>
Date: Fri, 21 Oct 2011 09:54:47 -0700
Thread-Topic: [OE-core] [PATCH 2/6] gmp: also generate the libgmpcxx library
Thread-Index: AcyPxrdEVKgA3y3VSRe62yjSz+10+QASt1lQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E33A66D5@orsmsx504.amr.corp.intel.com>
References: <66cdd5054e220fcce980222ed68a2afc37f614af.1318984111.git.nitin.a.kamble@intel.com>
	<35417d38f61615445ed0c4d875e0bd0aa5649af4.1318984111.git.nitin.a.kamble@intel.com>
	<4E9FD2B2.5000508@intel.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E32D2390@orsmsx504.amr.corp.intel.com>
	<4EA12540.9020002@intel.com>
In-Reply-To: <4EA12540.9020002@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gmp: also generate the libgmpcxx library
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
X-List-Received-Date: Fri, 21 Oct 2011 17:00:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:saul.wold@intel.com]
> Sent: Friday, October 21, 2011 12:55 AM
> To: Kamble, Nitin A
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 2/6] gmp: also generate the libgmpcxx
> library
>=20
> On 10/20/2011 11:04 PM, Kamble, Nitin A wrote:
> >
> >
> >> -----Original Message-----
> >> From: Saul Wold [mailto:saul.wold@intel.com]
> >> Sent: Thursday, October 20, 2011 12:50 AM
> >> To: Patches and discussions about the oe-core layer
> >> Cc: Kamble, Nitin A
> >> Subject: Re: [OE-core] [PATCH 2/6] gmp: also generate the libgmpcxx
> >> library
> >>
> >> On 10/18/2011 05:30 PM, nitin.a.kamble@intel.com wrote:
> >>> From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >>>
> >>> configure runs few checks to make sure c++ compiler and runtime are
> >> working as expected
> >>> with the --enable-cxx=3Ddetect option.
> >>>
> >> Somehow this change has also changed what the gmp package provides,
> >> before this change the package provided libgmp10 via PKG_gmp:
> libgmp10,
> >> after this change, the libgmp10 is no longer provided and causes
> other
> >> breakage.
> >>
> >> The example case I found was a coreutils package that was built
> prior
> >> to
> >> this change failed to fulfill it's dependencies after this change
> when
> >> creating an image.  If I rebuild coreutils with the newer gmp build,
> >> then all is well, I think we need to understand this better before
> >> making this change.
> >>
> >> Did something else change in the packaging that would cause use to
> look
> >> the mapping above?
> >>
> > Saul,
> >    In my testing I did not get any of these issues you mentioned
> above.
> >
> > Also I tried to reproduce the issue with coreutils as mentioned
> above, and I can not reproduce the issue for creations of an image. Can
> you verify the issue one more time?
> >
> Just to confirm, did you have a build of coreutils prior to your gmp
> changes? Which image did you build?  Be sure you build an image that
> includes coreutils, such at an -sdk image.
>=20
> I can easily reproduce this issue.
>=20
> Sau!
>=20
I am able to reproduce the issue with sdk image, The packages(rpms) generat=
ed are different in r0 vs r1 version of gmp. Hence you are seeing that issu=
e. Earlier libgmp.so.10 was the only library need packaging, so I guest pac=
kage name was chosen aslibgmp10. now libgmpxx.so is also part of the packag=
e, hence recipe name which is gmp is chosen as the package name. =20

$ ls gmp-5.0.2-r0/deploy-rpms/i586/
libgmp10-5.0.2-r0.i586.rpm    libgmp-dev-5.0.2-r0.i586.rpm  libgmp-staticde=
v-5.0.2-r0.i586.rpm
libgmp-dbg-5.0.2-r0.i586.rpm  libgmp-doc-5.0.2-r0.i586.rpm

$ ls gmp-5.0.2-r1/deploy-rpms/i586/
gmp-5.0.2-r1.i586.rpm      gmp-dev-5.0.2-r1.i586.rpm  gmp-staticdev-5.0.2-r=
1.i586.rpm
gmp-dbg-5.0.2-r1.i586.rpm  gmp-doc-5.0.2-r1.i586.rpm

Thanks,
Nitin

> > Thanks,
> > Nitin
> >
> >>
> >> Sau!
> >>
> >>
> >>> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> >>> ---
> >>>    meta/recipes-support/gmp/gmp.inc      |    2 ++
> >>>    meta/recipes-support/gmp/gmp_4.2.1.bb |    2 +-
> >>>    meta/recipes-support/gmp/gmp_5.0.2.bb |    2 +-
> >>>    3 files changed, 4 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-
> >> support/gmp/gmp.inc
> >>> index 66349e6..3c662a0 100644
> >>> --- a/meta/recipes-support/gmp/gmp.inc
> >>> +++ b/meta/recipes-support/gmp/gmp.inc
> >>> @@ -14,3 +14,5 @@ ARM_INSTRUCTION_SET =3D "arm"
> >>>    acpaths =3D ""
> >>>
> >>>    BBCLASSEXTEND =3D "native nativesdk"
> >>> +
> >>> +EXTRA_OECONF +=3D " --enable-cxx=3Ddetect"
> >>> diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-
> >> support/gmp/gmp_4.2.1.bb
> >>> index 74da6b8..97ac4b2 100644
> >>> --- a/meta/recipes-support/gmp/gmp_4.2.1.bb
> >>> +++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
> >>> @@ -6,7 +6,7 @@ LICENSE =3D "LGPLv2.1+"
> >>>    LIC_FILES_CHKSUM =3D
> >> "file://COPYING;md5=3D892f569a555ba9c07a568a7c0c4fa63a \
> >>>
> >> file://COPYING.LIB;md5=3Dfbc093901857fcd118f065f900982c24 \
> >>>                        file://gmp-
> >> h.in;startline=3D6;endline=3D21;md5=3D5e25ffd16996faba8c1cd27b04b16099=
"
> >>> -PR =3D "r0"
> >>> +PR =3D "r1"
> >>>
> >>>    SRC_URI =3D "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
> >>>               file://disable-stdc.patch"
> >>> diff --git a/meta/recipes-support/gmp/gmp_5.0.2.bb b/meta/recipes-
> >> support/gmp/gmp_5.0.2.bb
> >>> index 03fef45..f80971e 100644
> >>> --- a/meta/recipes-support/gmp/gmp_5.0.2.bb
> >>> +++ b/meta/recipes-support/gmp/gmp_5.0.2.bb
> >>> @@ -2,7 +2,7 @@ require gmp.inc
> >>>    LICENSE=3D"LGPLv3&GPLv3"
> >>>    LIC_FILES_CHKSUM =3D
> >> "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \
> >>>
> >> file://version.c;endline=3D18;md5=3Dd8c56b52b9092346b9f93b4da65ef790"
> >>> -PR =3D "r0"
> >>> +PR =3D "r1"
> >>>
> >>>    SRC_URI_append +=3D "file://sh4-asmfix.patch \
> >>>                       file://use-includedir.patch "
> >



