Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RGJmn-0005Sy-JM
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 02:13:34 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 18 Oct 2011 17:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,368,1315206000"; d="scan'208";a="27952432"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Oct 2011 17:07:25 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx604.amr.corp.intel.com ([10.250.113.17]) with mapi;
	Tue, 18 Oct 2011 17:06:58 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 18 Oct 2011 17:06:57 -0700
Thread-Topic: [OE-core] [PATCH 2/5] gmp: also generate the libgmpcxx library
Thread-Index: AcyN26SCXoaPx1HdTbSlKit77YiLqAAFLpmQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E2F42C14@orsmsx504.amr.corp.intel.com>
References: <cover.1318968860.git.nitin.a.kamble@intel.com>
	<09731abe1a3295426dfef8d54c52c7f6805fe5dc.1318968860.git.nitin.a.kamble@intel.com>
	<20111018205346.GB27472@sakrah.homelinux.org>
	<9DA5872FEF993D41B7173F58FCF6BE94E2F429D0@orsmsx504.amr.corp.intel.com>
	<20111018211337.GA27508@sakrah.homelinux.org>
In-Reply-To: <20111018211337.GA27508@sakrah.homelinux.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] gmp: also generate the libgmpcxx library
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
X-List-Received-Date: Wed, 19 Oct 2011 00:13:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Tuesday, October 18, 2011 2:14 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 2/5] gmp: also generate the libgmpcxx
> library
>=20
> On (18/10/11 14:06), Kamble, Nitin A wrote:
> >
> >
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> > > Khem Raj
> > > Sent: Tuesday, October 18, 2011 1:54 PM
> > > To: Patches and discussions about the oe-core layer
> > > Subject: Re: [OE-core] [PATCH 2/5] gmp: also generate the libgmpcxx
> > > library
> > >
> > > On (18/10/11 13:14), nitin.a.kamble@intel.com wrote:
> > > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > > >
> > > > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > > > ---
> > > >  meta/recipes-support/gmp/gmp.inc      |    2 ++
> > > >  meta/recipes-support/gmp/gmp_4.2.1.bb |    2 +-
> > > >  meta/recipes-support/gmp/gmp_5.0.2.bb |    2 +-
> > > >  3 files changed, 4 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-
> > > support/gmp/gmp.inc
> > > > index 66349e6..77ce10d 100644
> > > > --- a/meta/recipes-support/gmp/gmp.inc
> > > > +++ b/meta/recipes-support/gmp/gmp.inc
> > > > @@ -14,3 +14,5 @@ ARM_INSTRUCTION_SET =3D "arm"
> > > >  acpaths =3D ""
> > > >
> > > >  BBCLASSEXTEND =3D "native nativesdk"
> > > > +
> > > > +EXTRA_OECONF +=3D " --enable-cxx=3Dyes"
> > >
> > > if you want 'yes' then just --enable-cxx is enough have you tried
> with
> > > --enable-cxx=3Ddetect that would make sure that C++ compiler and
> runtime
> > > is ok. Secondly is this option needed for native recipes too ?
> >
> > Thanks Khem for your comments. This option is also needed for native
> recipe to avoid having gmp-devel installed on the build system. "--
> enable-cxx=3Ddetect" can be used, but I am not sure if it is the best way
> yet, I think we always have c++ as part of gcc, not having c++ is not a
> case to worry. And if "detect" tests if c++ & runtime are not working
> as expected, then it should not disable the enable-cxx option with that
> reason; better would be to get a recipe build failure. So I still favor
> keeping the option as "--enable-cxx" until I can see the merit of
> "detect".
>=20
> detect can make sure that compilers are working as it expects them to
> be. so likely less issues when it is used later.

Khem,
  When detect fails then configure will get an error, and will not proceed =
with disabling cxx, so that is good.

# If --enable-cxx=3Dyes but a C++ compiler can't be found, then abort.
  if test $want_cxx =3D no && test $enable_cxx =3D yes; then
    as_fn_error $? "C++ compiler not available, see config.log for details"=
 "$LINENO" 5
  fi

Thanks,
Nitin


>=20
> >
> > Thanks,
> > Nitin
> >
> > >
> > > > diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb
> b/meta/recipes-
> > > support/gmp/gmp_4.2.1.bb
> > > > index 74da6b8..97ac4b2 100644
> > > > --- a/meta/recipes-support/gmp/gmp_4.2.1.bb
> > > > +++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
> > > > @@ -6,7 +6,7 @@ LICENSE =3D "LGPLv2.1+"
> > > >  LIC_FILES_CHKSUM =3D
> > > "file://COPYING;md5=3D892f569a555ba9c07a568a7c0c4fa63a \
> > > >
> > > file://COPYING.LIB;md5=3Dfbc093901857fcd118f065f900982c24 \
> > > >                      file://gmp-
> > > h.in;startline=3D6;endline=3D21;md5=3D5e25ffd16996faba8c1cd27b04b1609=
9"
> > > > -PR =3D "r0"
> > > > +PR =3D "r1"
> > > >
> > > >  SRC_URI =3D "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
> > > >             file://disable-stdc.patch"
> > > > diff --git a/meta/recipes-support/gmp/gmp_5.0.2.bb
> b/meta/recipes-
> > > support/gmp/gmp_5.0.2.bb
> > > > index 03fef45..f80971e 100644
> > > > --- a/meta/recipes-support/gmp/gmp_5.0.2.bb
> > > > +++ b/meta/recipes-support/gmp/gmp_5.0.2.bb
> > > > @@ -2,7 +2,7 @@ require gmp.inc
> > > >  LICENSE=3D"LGPLv3&GPLv3"
> > > >  LIC_FILES_CHKSUM =3D
> > > "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \
> > > >
> > > file://version.c;endline=3D18;md5=3Dd8c56b52b9092346b9f93b4da65ef790"
> > > > -PR =3D "r0"
> > > > +PR =3D "r1"
> > > >
> > > >  SRC_URI_append +=3D "file://sh4-asmfix.patch \
> > > >                     file://use-includedir.patch "
> > > > --
> > > > 1.7.4.4
> > > >
> > > >
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> core
> > >
> > > --
> > > -Khem
> > >
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> core
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --
> -Khem
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


