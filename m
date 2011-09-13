Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R3Izl-0005VT-8A
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 04:45:09 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Sep 2011 19:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,371,1312182000"; d="scan'208";a="16420995"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Sep 2011 19:39:58 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 13 Sep 2011 10:39:27 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 13 Sep 2011 10:39:27 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Tue, 13 Sep 2011 10:39:26 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2011 10:39:24 +0800
Thread-Topic: [OE-core] [PATCH 2/3] rpm: add multilib prefix for archs under
	deploy/rpm
Thread-Index: AcxxcKVhta/TUeHMRziWK0ul57ANtQATAObA
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D754B024@shsmsx501.ccr.corp.intel.com>
References: <cover.1315815933.git.dongxiao.xu@intel.com>
	<57947e84078c2fbd1dde287bd9910cfd95e2ea27.1315815933.git.dongxiao.xu@intel.com>
	<4E6E1D79.80208@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D754AE15@shsmsx501.ccr.corp.intel.com>
	<4E6E3FE0.2060805@windriver.com>
In-Reply-To: <4E6E3FE0.2060805@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] rpm: add multilib prefix for archs under deploy/rpm
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
X-List-Received-Date: Tue, 13 Sep 2011 02:45:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mark Hatle
> Sent: Tuesday, September 13, 2011 1:23 AM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 2/3] rpm: add multilib prefix for archs und=
er
> deploy/rpm
>=20
> On 9/12/11 10:07 AM, Xu, Dongxiao wrote:
> > Hi Mark,
> >
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> >> Of Mark Hatle
> >> Sent: Monday, September 12, 2011 10:56 PM
> >> To: openembedded-core@lists.openembedded.org
> >> Subject: Re: [OE-core] [PATCH 2/3] rpm: add multilib prefix for archs
> >> under deploy/rpm
> >>
> >> On 9/12/11 3:34 AM, Dongxiao Xu wrote:
> >>> Currently MACHINE_ARCH deploy folder is unique in multilib system,
> >>> thus a lib32 version of rpm package will override a normal rpm
> >>> package if its PACKAGE_ARCH is ${MACHINE_ARCH}.
> >>>
> >>> Define different deploy folder for multilib architectures to avoid
> >>> the confliction.
> >>
> >> I'm not sure I understand here.  Within the deployment directory is a
> >> set of directories for each RPM architecture.  Are you saying that we
> >> can get two packages that have different contents but the same RPM
> architecture?
> >>
> >
> > Yes, for example the netbase recipe, which the PACKAGE_ARCH =3D
> MACHINE_ARCH.
> > Both the normal version of netbase package and the lib32 version are
> > named as "netbase-4.45-r1.qemux86_64.rpm" putting in
> > tmp/deploy/rpm/qemux86-64 directory, so we need to differentiate them.
>=20
> Wow, that is very broken.  I think part of the problem is that the arch i=
s used to
> signify not only ABI (and optimizations), but also machine type in this c=
ase.
>=20
> What we really need is an additional architecture type that handles machi=
ne
> specific packages for each multilib type.  I'm really not sure what they =
would
> be called or how it would work though.
>=20
> Anyone have suggestions for naming and processing of these?  (I'm almost
> tempted to say "machine_lib")

In the weekend I had a talk with Richard and he suggested on adding MLPREFI=
X to MACHINE_ARCH to differentiate them.
Otherwise user need to define a new value for MACHINE_virtclass-multilib-li=
b32?

Thanks,
Dongxiao

>=20
> --Mark
>=20
> > Thanks,
> > Dongxiao
> >
> >> Can you give me an example of what is going wrong?
> >>
> >> --Mark
> >>
> >>> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> >>> ---
> >>>  meta/classes/multilib.bbclass   |    5 +++++
> >>>  meta/classes/rootfs_rpm.bbclass |    4 +++-
> >>>  2 files changed, 8 insertions(+), 1 deletions(-)
> >>>
> >>> diff --git a/meta/classes/multilib.bbclass
> >>> b/meta/classes/multilib.bbclass index 76c86b2..6ace1fe 100644
> >>> --- a/meta/classes/multilib.bbclass
> >>> +++ b/meta/classes/multilib.bbclass
> >>> @@ -77,4 +77,9 @@ python __anonymous () {
> >>>      multilib_map_variable("PACKAGES_DYNAMIC", variant, d)
> >>>      multilib_map_variable("PACKAGE_INSTALL", variant, d)
> >>>      multilib_map_variable("INITSCRIPT_PACKAGES", variant, d)
> >>> +
> >>> +    package_arch =3D d.getVar("PACKAGE_ARCH", True)
> >>> +    machine_arch =3D d.getVar("MACHINE_ARCH", True)
> >>> +    if package_arch =3D=3D machine_arch:
> >>> +        d.setVar("PACKAGE_ARCH", variant + "_" + package_arch)
> >>>  }
> >>> diff --git a/meta/classes/rootfs_rpm.bbclass
> >>> b/meta/classes/rootfs_rpm.bbclass index 135ca75..7936d77 100644
> >>> --- a/meta/classes/rootfs_rpm.bbclass
> >>> +++ b/meta/classes/rootfs_rpm.bbclass
> >>> @@ -218,7 +218,9 @@ python () {
> >>>              default_tune =3D
> >> localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
> >>>              if default_tune:
> >>>                  localdata.setVar("DEFAULTTUNE", default_tune)
> >>> -            ml_package_archs +=3D localdata.getVar("PACKAGE_ARCHS",
> >> True) or ""
> >>> +            localdata.setVar("MACHINE_ARCH", eext[1] + "_" +
> >> localdata.getVar("MACHINE_ARCH", False))
> >>> +            package_archs =3D localdata.getVar("PACKAGE_ARCHS",
> True)
> >> or ""
> >>> +            ml_package_archs +=3D " " + package_archs
> >>>              #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1],
> >> localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
> >>>      bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs,
> >> d)  }
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


