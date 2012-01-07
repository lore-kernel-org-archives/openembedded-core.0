Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RjR7O-0005uu-Qd
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 08:55:11 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2012 23:47:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109713386"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jan 2012 23:47:44 -0800
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 7 Jan 2012 15:47:44 +0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 7 Jan 2012 15:47:44 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.38]) with mapi id
	14.01.0355.002; Sat, 7 Jan 2012 15:47:42 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/7][PULL] Hob2 related oe-core changes
Thread-Index: AQHMzJIkBq8QhkpYe0SkSyE8WymPB5YAh7VQ
Date: Sat, 7 Jan 2012 07:47:41 +0000
Message-ID: <40776A41FC278F40B59438AD47D147A9016A54@SHSMSX102.ccr.corp.intel.com>
References: <cover.1325840092.git.dongxiao.xu@intel.com>
	<1325867267.14746.8.camel@ted>
	<A309F06A-FC39-48FD-BBCF-3AC53984B5FA@dominion.thruhere.net>
In-Reply-To: <A309F06A-FC39-48FD-BBCF-3AC53984B5FA@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 0/7][PULL] Hob2 related oe-core changes
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
X-List-Received-Date: Sat, 07 Jan 2012 07:55:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Koen,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Saturday, January 07, 2012 12:42 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 0/7][PULL] Hob2 related oe-core changes
>=20
>=20
> Op 6 jan. 2012, om 17:27 heeft Richard Purdie het volgende geschreven:
>=20
> > On Fri, 2012-01-06 at 17:04 +0800, Dongxiao Xu wrote:
> >> Hi Richard,
> >>
> >> This pull request is the hob2 related oe-core changes.
> >> Please help to review and pull.
> >>
> >> Note that this pull request has dependency on the hob related bitbake
> changes.
> >>
> >> Thanks,
> >> Dongxiao
> >>
> >> The following changes since commit
> 4a85312568a6bb052cc511c15b4ae842ff7f8e59:
> >>  Richard Purdie (1):
> >>        image-mklibs/package_ipk: Remove bashisms
> >>
> >> are available in the git repository at:
> >>
> >>  git://git.pokylinux.org/poky-contrib dxu4/hob-oecore-changes
> >> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Ddxu4/hob-oecor=
e
> >> -changes
> >>
> >> Dongxiao Xu (6):
> >>  bblayers.conf.sample: Use ?=3D to set BBLAYERS
> >>  image.bbclass: Use ?=3D to set LINGUAS_INSTALL
> >
> > I merged these.
> >
> >>  packageinfo.bbclass: add a new bbclass to pass package information
> >
> > I still have quite a strong dislike of this code, its rather nasty to
> > require this and I wish we could come up with a less ugly way to
> > collect up this information.
> >
> >>  hob.bb: Add a empty image template
> >>  hob-toolchain: add a new recipe hob-toolchain
> >>  layers: add a new folder to put user added layers
> >
> > I don't like these three. They're horribly hob specific and IMO
> > shouldn't be in the general metadata. If there is no way to avoid
> > them, they should perhaps go into a meta-hob layer directory to keep
> > them separate from the rest of the system.
>=20
> And I still don't get why hob can't load local.conf to load the defaults =
instead of
> ignoring it completely.

The new Hob doesn't ignore local.conf, it will load all its values (except =
BB_NUMBER_THREADS and PARALLEL_MAKE) as the default configuration.

Thanks,
Dongxiao

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


