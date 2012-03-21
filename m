Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SARf4-0008DM-3N
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 20:57:34 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Mar 2012 12:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="142732586"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2012 12:48:39 -0700
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Mar 2012 12:48:38 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX151.amr.corp.intel.com ([169.254.7.218]) with mapi id
	14.01.0355.002; Wed, 21 Mar 2012 12:48:38 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Thread-Topic: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python
	support"
Thread-Index: AQHNB4VDG6/xwLeUgEWTysDmkk+IHpZ1BaqAgAB3WAD//4s7gIAAd4cA//+K+DCAABC9YIAAfrcA//+LsHA=
Date: Wed, 21 Mar 2012 19:48:38 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137B4C9@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B46A@ORSMSX106.amr.corp.intel.com>
	<20120321203642.032e28a1@eb-e6520>
In-Reply-To: <20120321203642.032e28a1@eb-e6520>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Wed, 21 Mar 2012 19:57:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Eric B=E9nard [mailto:eric@eukrea.com]
> Sent: Wednesday, March 21, 2012 12:37 PM
> To: Kamble, Nitin A
> Cc: openembedded-core@lists.openembedded.org; Martin.Jansa@gmail.com;
> richard.purdie@linuxfoundation.org
> Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with
> python support"
>=20
> Hi Nitin,
>=20
> Le Wed, 21 Mar 2012 19:04:14 +0000,
> "Kamble, Nitin A" <nitin.a.kamble@intel.com> a =E9crit :
> >   The sdk gdb from meta-toolchain for qemuarm is also failing
> similarly:
> >
> > *** glibc detected *** arm-poky-linux-gnueabi-gdb: double free or
> corruption (out): 0x00007f8ef7992030 ***
> > Aborted (core dumped)
> >
> can you provide more details on your configuration as it seems you
> have a problem somewhere else ?
>=20
> here is my config (you already have host details in the previous email)
> [ebenard@eb-e6520 build]$ bitbake-layers  show-layers
> Parsing recipes..done.
>=20
> layer                 path
> priority
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D
> meta                  /home/ebenard/OE-CORE/openembedded-core/meta
>=20
> OE Build Configuration:
> BB_VERSION        =3D "1.15.1"
> TARGET_ARCH       =3D "i586"
> TARGET_OS         =3D "linux"
> MACHINE           =3D "qemux86"
> DISTRO            =3D ""
> DISTRO_VERSION    =3D "oe-core.0"
> TUNE_FEATURES     =3D "m32 i586"
> TARGET_FPU        =3D ""
> meta              =3D "master:ee00c3146525e481beaefd2149c61cfe51de2797"
>=20
> Eric

I am on the yocto/oe-core master branch: http://git.yoctoproject.org/cgit/c=
git.cgi/poky/log/

I can try reproducing this issue with http://cgit.openembedded.org/openembe=
dded-core/log/ and see what happens.

Thanks,
Nitin





