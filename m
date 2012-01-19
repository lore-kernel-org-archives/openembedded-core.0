Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Rngsi-0006S6-5T
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 02:33:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jan 2012 17:25:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97362898"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2012 17:25:33 -0800
Received: from orsmsx104.amr.corp.intel.com (10.22.225.131) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 18 Jan 2012 17:25:32 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.13]) by
	ORSMSX104.amr.corp.intel.com ([169.254.3.157]) with mapi id
	14.01.0355.002; Wed, 18 Jan 2012 17:25:32 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv3 2/7] bdwgc: new recipe for autogen
Thread-Index: AQHM1jmLb7DscrtyFUeCORJRuy0qgJYTaU0A//98mlA=
Date: Thu, 19 Jan 2012 01:25:31 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C012A40BA@ORSMSX106.amr.corp.intel.com>
References: <f37166f3f48c2747fbcc4d9ca8e9c2ddbe9aa637.1326929307.git.nitin.a.kamble@intel.com>
	<948a269f26b2705882e03fa636c947197feca97b.1326929307.git.nitin.a.kamble@intel.com>
	<4F176EAC.6090309@linux.intel.com>
In-Reply-To: <4F176EAC.6090309@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCHv3 2/7] bdwgc: new recipe for autogen
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
X-List-Received-Date: Thu, 19 Jan 2012 01:33:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Wednesday, January 18, 2012 5:15 PM
> To: Patches and discussions about the oe-core layer
> Cc: Kamble, Nitin A
> Subject: Re: [OE-core] [PATCHv3 2/7] bdwgc: new recipe for autogen
>=20
> On 01/18/2012 03:32 PM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > This recipe is needed by guile.
> > And guile is needed for autogen.
> >
> > As per Beth's recommondation changed the license specification of the
> > recipe as
> >
> > LICENSE =3D "MIT&  FSF-Unlimited&  GPL-2.0"
> >
> > Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> > ---
> >   meta/recipes-support/bdwgc/bdwgc_20110107.bb |   40
> ++++++++++++++++++++++++++
> >   1 files changed, 40 insertions(+), 0 deletions(-)
> >   create mode 100644 meta/recipes-support/bdwgc/bdwgc_20110107.bb
> >
> > diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> > new file mode 100644
> > index 0000000..1e32681
> > --- /dev/null
> > +++ b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> > @@ -0,0 +1,40 @@
> > +SUMMARY =3D "A garbage collector for C and C++"
> > +
> > +DESCRIPTION =3D "The Boehm-Demers-Weiser conservative garbage
> collector can be\
> > + used as a garbage collecting replacement for C malloc or C++ new.
> It allows\
> > + you to allocate memory basically as you normally would, without
> explicitly\
> > + deallocating memory that is no longer useful. The collector
> automatically\
> > + recycles memory when it determines that it can no longer be
> otherwise\
> > + accessed.\
> > +  The collector is also used by a number of programming language\
> > + implementations that either use C as intermediate code, want to
> facilitate\
> > + easier interoperation with C libraries, or just prefer the simple
> collector\
> > + interface.\
> > +  Alternatively, the garbage collector may be used as a leak
> detector for C\
> > + or C++ programs, though that is not its primary goal.\
> > +  Empirically, this collector works with most unmodified C programs,
> simply\
> > + by replacing malloc with GC_malloc calls, replacing realloc with
> GC_realloc\
> > + calls, and removing free calls."
> > +
> > +HOMEPAGE =3D "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
> > +SECTION =3D "devel"
> > +LICENSE =3D "MIT&  FSF-Unlimited&  GPL-2.0"
> > +LIC_FILES_CHKSUM =3D
> "file://README.QUICK;md5=3D9b9dd874f6940641b6ab19893ee8f1cc \
> > +
> file://doc/README;md5=3D6d74ce18ff55d936a4d6bd35a98e9eb9 \
> > +
> file://libatomic_ops/doc/LICENSING.txt;md5=3D607073e04548eac7d1f763e48047
> 7bab"
> > +
> > +SRC_URI =3D
> "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/bdwgc-
> 7_2alpha5-20110107.tar.bz2"
> > +
> > +SRC_URI[md5sum] =3D "4f3c130fc71ff23584edaa19a37739ee"
> > +SRC_URI[sha256sum] =3D
> "1f57b959ae1144e1e5fa59d52d7cb4ed626fd74cf47da1c9c119b8b46ae2722d"
> > +
> > +PR =3D "r0"
> > +
> > +S =3D "${WORKDIR}/bdwgc"
> > +
> > +do_install_append (){
> > +	rm -rf ${D}${datadir}/gc
> > +}
> > +
> > +inherit autotools
> > +BBCLASSEXTEND =3D "native nativesdk"
>=20
> Nitin,
>=20
> I am seeing the following WARNING, can you please fix this
> WARNING: For recipe bdwgc, the following files/directories were
> installed but not shipped in any package:
> WARNING:   /usr/share
>=20
> Thanks
> 	Sau!
Fixed this on the contrib. branch.
Thanks,
Nitin



