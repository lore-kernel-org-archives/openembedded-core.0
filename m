Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SASxm-00023H-Do
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:20:58 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Mar 2012 14:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="120169606"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga001.jf.intel.com with ESMTP; 21 Mar 2012 14:12:03 -0700
Received: from orsmsx104.amr.corp.intel.com (10.22.225.131) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Mar 2012 14:12:02 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX104.amr.corp.intel.com ([169.254.3.46]) with mapi id
	14.01.0355.002; Wed, 21 Mar 2012 14:12:02 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Thread-Topic: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python
	support"
Thread-Index: AQHNB4VDG6/xwLeUgEWTysDmkk+IHpZ1BaqAgAB3WAD//4s7gIAAd4cA//+K+DCAAI5egIAABI0A//+ae8AAD0RXgAAOkVAg
Date: Wed, 21 Mar 2012 21:12:02 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
In-Reply-To: <20120321220253.00c4f254@eb-e6520>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Wed, 21 Mar 2012 21:20:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Eric B=E9nard [mailto:eric@eukrea.com]
> Sent: Wednesday, March 21, 2012 2:03 PM
> To: Kamble, Nitin A
> Cc: Martin Jansa; openembedded-core@lists.openembedded.org;
> richard.purdie@linuxfoundation.org
> Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with
> python support"
>=20
> Le Wed, 21 Mar 2012 20:48:23 +0000,
> "Kamble, Nitin A" <nitin.a.kamble@intel.com> a =E9crit :
> >   I removed the meta-yocto layer, which removed poky distro from the
> config. And I am still seeing same issue.
> >
> > [nitin@nbuild0 /]$ cd /usr/local/oecore-x86_64/
> > [nitin@nbuild0 oecore-x86_64]$ ls
> > environment-setup-x86_64-oe-linux  site-config-x86_64-oe-linux
> sysroots  version-x86_64-oe-linux
> > [nitin@nbuild0 oecore-x86_64]$ . environment-setup-x86_64-oe-linux
> >  [nitin@nbuild0 oecore-x86_64]$ sysroots/x86_64-oesdk-
> linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-gdb
> > *** glibc detected *** sysroots/x86_64-oesdk-linux/usr/bin/x86_64-oe-
> linux/x86_64-oe-linux-gdb: double free or corruption (out):
> 0x00007f3221852030 ***
> > Aborted (core dumped)
> >
> may you please provide details on :
> - log reported by bitbake when you launch it to know a little bit more
>   your configuration,

This is with yocto git repo, with just meta layer, I removed the meta-yocto=
 layer from configuration to keep just oecore bits and to take out the poky=
 bits.=20

$ bitbake meta-toolchain
Pseudo is not present but is required, building this first before the main =
build
Parsing recipes: 100% |####################################################=
#########################| Time: 00:00:03
Parsing of 831 .bb files complete (0 cached, 831 parsed). 1107 targets, 19 =
skipped, 0 masked, 0 errors.

OE Build Configuration:
BB_VERSION        =3D "1.15.1"
TARGET_ARCH       =3D "x86_64"
TARGET_OS         =3D "linux"
MACHINE           =3D "qemux86-64"
DISTRO            =3D ""
DISTRO_VERSION    =3D "oe-core.0"
TUNE_FEATURES     =3D "m64"
TARGET_FPU        =3D ""
meta              =3D "master:40f95685e6a3b4359d2ab2fea1418fe5e4bd0aa1"

> - host distribution and arch of your build host
Build host:=20
$ cat /etc/SuSE-release
openSUSE 11.4 (x86_64)
VERSION =3D 11.4
CODENAME =3D Celadon
$ uname -a
Linux yocto-hm1 2.6.37.6-0.7-default #1 SMP 2011-07-21 02:17:24 +0200 x86_6=
4 x86_64 x86_64 GNU/Linux

SDK machine host:
$ cat /etc/redhat-release
Fedora release 15 (Lovelock)
$ uname -a
Linux nbuild0.sc.intel.com 2.6.40.6-0.fc15.x86_64 #1 SMP Tue Oct 4 00:39:50=
 UTC 2011 x86_64 x86_64 x86_64 GNU/Linux


Next I am also trying to build from the oe-core git tree.

Thanks,
Nitin

>=20
> Thanks
> Eric


