Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SASat-0001Ea-Lx
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 21:57:20 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Mar 2012 13:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="131673196"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2012 13:48:24 -0700
Received: from orsmsx101.amr.corp.intel.com (10.22.225.128) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Mar 2012 13:48:23 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX101.amr.corp.intel.com ([169.254.8.154]) with mapi id
	14.01.0355.002; Wed, 21 Mar 2012 13:48:23 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>, =?iso-8859-1?Q?Eric_B=E9nard?=
	<eric@eukrea.com>
Thread-Topic: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python
	support"
Thread-Index: AQHNB4VDG6/xwLeUgEWTysDmkk+IHpZ1BaqAgAB3WAD//4s7gIAAd4cA//+K+DCAAI5egIAABI0A//+ae8A=
Date: Wed, 21 Mar 2012 20:48:23 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>
	<20120321194906.GC3659@jama.jama.net>
In-Reply-To: <20120321194906.GC3659@jama.jama.net>
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
X-List-Received-Date: Wed, 21 Mar 2012 20:57:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Wednesday, March 21, 2012 12:49 PM
> To: Eric B=E9nard
> Cc: Kamble, Nitin A; openembedded-core@lists.openembedded.org;
> richard.purdie@linuxfoundation.org
> Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with
> python support"
>=20
> On Wed, Mar 21, 2012 at 08:32:49PM +0100, Eric B=E9nard wrote:
> > Hi Nitin,
> >
> > Le Wed, 21 Mar 2012 18:07:50 +0000,
> > "Kamble, Nitin A" <nitin.a.kamble@intel.com> a =E9crit :
> > > > From: Eric B=E9nard [mailto:eric@eukrea.com] I'm launching a build
> > > > and will keep you informed of the result. If that only fails for
> > > > x86 or x86_64 targets, we can use overrides to disable python
> > > > support only for these targets.
> > > >
> > > > Eric
> > >
> > > I also starting test for sdk gdb for qemuarm target. Will keep you
> posted. Any solution that gives a working sdk gdb for all arches will
> be good.
> > >
> > that works fine here at least for target qemux86 :
> > [ebenard@eb-e6520 ~]$ cat /etc/fedora-release Fedora release 16
> > (Verne)
> >
> > [ebenard@eb-e6520 ~]$ uname -a
> > Linux eb-e6520 3.2.9-2.fc16.x86_64 #1 SMP Mon Mar 5 20:55:39 UTC 2012
> > x86_64 x86_64 x86_64 GNU/Linux
> >
> > [ebenard@eb-e6520 ~]$
> > source /usr/local/oecore-x86_64/environment-setup-i586-oe-linux
> >
> > [ebenard@eb-e6520 ~]$ which i586-oe-linux-gdb
> > /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/i586-oe-
> l
> > inux/i586-oe-linux-gdb
> >
> > [ebenard@eb-e6520 ~]$ i586-oe-linux-gdb GNU gdb (GDB) 7.4 Copyright
> > (C) 2012 Free Software Foundation, Inc.
> > License GPLv3+: GNU GPL version 3 or later
> > <http://gnu.org/licenses/gpl.html> This is free software: you are
> free
> > to change and redistribute it. There is NO WARRANTY, to the extent
> > permitted by law.  Type "show copying" and "show warranty" for
> details.
> > This GDB was configured as "--host=3Dx86_64-oesdk-linux
> > --target=3Di586-oe-linux". For bug reporting instructions, please see:
> > <http://www.gnu.org/software/gdb/bugs/>.
> > (gdb) python import sys
> > (gdb) python sys.stdout.write("hello, world\n") hello, world
> > (gdb)
>=20
> Just retested with qemux86-64 and distroless oe-core and also works
>=20
> OE @ /usr/local/oecore-i686 $ x86_64-oe-linux-gdb GNU gdb (GDB) 7.4
> Copyright (C) 2012 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show
> copying"
> and "show warranty" for details.
> This GDB was configured as "--host=3Di686-oesdk-linux --target=3Dx86_64-o=
e-
> linux".
> For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>.
> (gdb) python print 42
> 42
>=20
> the same with armv7a (and my normal SHR layers on top of oe-core)
>=20
> OE @ /usr/local/oecore-i686 $
> sysroots/i686-oesdk-linux/usr/bin/armv7a-vfp-neon-oe-linux-gnueabi/arm-
> oe-linux-gnueabi-gdb
> GNU gdb (GDB) 7.4
> Copyright (C) 2012 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show
> copying"
> and "show warranty" for details.
> This GDB was configured as "--host=3Di686-oesdk-linux --target=3Darm-oe-
> linux-gnueabi".
> For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>.
> (gdb) python print 42
> 42
>=20
> And host system is gentoo..
>=20
> Nitin: please try with distroless oe-core to see if it's host or poky
> issue (poky still has own SDK_* paths..).
>=20
> Cheers,
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

Hi Martin,
  I removed the meta-yocto layer, which removed poky distro from the config=
. And I am still seeing same issue.

[nitin@nbuild0 /]$ cd /usr/local/oecore-x86_64/
[nitin@nbuild0 oecore-x86_64]$ ls
environment-setup-x86_64-oe-linux  site-config-x86_64-oe-linux  sysroots  v=
ersion-x86_64-oe-linux
[nitin@nbuild0 oecore-x86_64]$ . environment-setup-x86_64-oe-linux
 [nitin@nbuild0 oecore-x86_64]$ sysroots/x86_64-oesdk-linux/usr/bin/x86_64-=
oe-linux/x86_64-oe-linux-gdb
*** glibc detected *** sysroots/x86_64-oesdk-linux/usr/bin/x86_64-oe-linux/=
x86_64-oe-linux-gdb: double free or corruption (out): 0x00007f3221852030 **=
*
Aborted (core dumped)


Thanks,
Nitin



