Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TwFtl-0006kG-Kz
	for Openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 18:38:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jan 2013 09:23:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,493,1355126400"; d="scan'208";a="245686179"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2013 09:23:11 -0800
Received: from orsmsx108.amr.corp.intel.com (10.22.225.41) by
	ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server
	(TLS) id 14.1.421.2; Fri, 18 Jan 2013 09:23:11 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.5]) by
	ORSMSX108.amr.corp.intel.com ([169.254.9.84]) with mapi id
	14.01.0355.002; Fri, 18 Jan 2013 09:23:10 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 1/1] linux-yocto_3.4: use
	${KSRC_linux_yocto_3_4_repo} based SRC_URI
Thread-Index: AQHN9CJIK2y0V8nG90isWTBaahiWJJhP3ZqA//96GMA=
Date: Fri, 18 Jan 2013 17:23:09 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C3F0BCF8A@ORSMSX106.amr.corp.intel.com>
References: <cover.1358365495.git.nitin.a.kamble@intel.com>
	<9ab00cdffdd81cbdcd68ac03aafd925372f25ad7.1358365495.git.nitin.a.kamble@intel.com>
	<50F983F9.4020708@linux.intel.com>
In-Reply-To: <50F983F9.4020708@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto_3.4: use ${KSRC_linux_yocto_3_4_repo} based SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 17:38:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Friday, January 18, 2013 9:19 AM
> To: Kamble, Nitin A
> Cc: Openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/1] linux-yocto_3.4: use
> ${KSRC_linux_yocto_3_4_repo} based SRC_URI
>=20
> On 01/16/2013 11:46 AM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > This makes replacing kernel git repository easy.
> > For example you can add the following line in your local.conf to use
> > your own local kernel repository:
> >
> > KSRC_linux_yocto_3_4_repo =3D "/home/nitin/linux-yocto-
> 3.4.git/;protocol=3Dfile"
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >   meta/recipes-kernel/linux/linux-yocto_3.4.bb |    3 ++-
> >   1 files changed, 2 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > index 70ed967..92129b6 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > @@ -11,7 +11,8 @@ SRCREV_machine_qemux86-64 ?=3D
> "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
> >   SRCREV_machine ?=3D "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
> >   SRCREV_meta ?=3D "7e0cd2990798aae80565baa17d3b6c771874f284"
> >
> > -SRC_URI =3D "git://git.yoctoproject.org/linux-yocto-
> 3.4.git;protocol=3Dgit;nocheckout=3D1;branch=3D${KBRANCH},${KMETA};name=
=3Dma
> chine,meta"
> > +KSRC_linux_yocto_3_4_repo ?=3D "git.yoctoproject.org/linux-yocto-
> 3.4.git;protocol=3Dgit"
> > +SRC_URI =3D
> "git://${KSRC_linux_yocto_3_4_repo};nocheckout=3D1;branch=3D${KBRANCH},${
> KMETA};name=3Dmachine,meta"
> >
>=20
> Nitin,
>=20
> Can't the same be accomplished by setting SRC_URI-yocto-linux in your
> local.conf file:
>=20
> > SRC_URI_linux-yocto =3D "/home/nitin/linux-yocto-3.4.git/;protocol=3Dfi=
le
> ;nocheckout=3D1;branch=3D${KBRANCH},${KMETA};name=3Dmachine,meta"
>=20
> Yes, it might require a little cut paste of the nocheck... part.
>=20
> Sau!
>=20


Saul,
   This way same settings can be used for any BSP. And shouldn't we make li=
fe of YP developer easy?

Thanks,
Nitin

>=20
>=20
> >   LINUX_VERSION ?=3D "3.4.24"
> >
> >


