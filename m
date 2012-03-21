Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SATry-0004Hg-II
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 23:19:03 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Mar 2012 15:10:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="120190189"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by orsmga001.jf.intel.com with ESMTP; 21 Mar 2012 15:10:07 -0700
Received: from orsmsx152.amr.corp.intel.com (10.22.226.39) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Mar 2012 15:10:06 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX152.amr.corp.intel.com ([169.254.8.120]) with mapi id
	14.01.0355.002; Wed, 21 Mar 2012 15:10:06 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Thread-Topic: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python
	support"
Thread-Index: AQHNB4VDG6/xwLeUgEWTysDmkk+IHpZ1BaqAgAB3WAD//4s7gIAAd4cA//+K+DCAAI5egIAABI0A//+ae8AAD0RXgAAOkVAg//+Uh4CAAHG8cP//lp4AgAB0JIA=
Date: Wed, 21 Mar 2012 22:10:06 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137B6A9@ORSMSX106.amr.corp.intel.com>
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
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<20120321230514.1c170480@eb-e6520>
In-Reply-To: <20120321230514.1c170480@eb-e6520>
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
X-List-Received-Date: Wed, 21 Mar 2012 22:19:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Eric B=E9nard [mailto:eric@eukrea.com]
> Sent: Wednesday, March 21, 2012 3:05 PM
> To: Kamble, Nitin A
> Cc: Martin Jansa; openembedded-core@lists.openembedded.org;
> richard.purdie@linuxfoundation.org
> Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with
> python support"
>=20
> Le Wed, 21 Mar 2012 21:53:10 +0000,
> "Kamble, Nitin A" <nitin.a.kamble@intel.com> a =E9crit :
> >  If it is working for you, I don't understand why is it not working
> here.
> >
> it's not working _only_ for me, Martin also had success.
>=20
> > [nitin@nbuild0 oecore-x86_64]$ cd /usr/local/oecore-x86_64/
> > [nitin@nbuild0 oecore-x86_64]$ ls
> > environment-setup-x86_64-oe-linux  site-config-x86_64-oe-linux
> sysroots  version-x86_64-oe-linux
> > [nitin@nbuild0 oecore-x86_64]$ . environment-setup-x86_64-oe-linux
> > [nitin@nbuild0 oecore-x86_64]$ ./sysroots/x86_64-oesdk-
> linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-gdb
> > *** glibc detected *** ./sysroots/x86_64-oesdk-linux/usr/bin/x86_64-
> oe-linux/x86_64-oe-linux-gdb: double free or corruption (out):
> 0x00007f3226818030 ***
> > Aborted (core dumped)
> > [nitin@nbuild0 oecore-x86_64]$ ldd ./sysroots/x86_64-oesdk-
> linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-gdb
> >         linux-vdso.so.1 =3D>  (0x00007fffd05d8000)
> >         libreadline.so.6 =3D> /lib64/libreadline.so.6
> (0x0000003f07400000)
> >         libdl.so.2 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libdl.so.2 (0x00007fa207a72000)
> >         libncurses.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-
> oesdk-linux/lib/libncurses.so.5 (0x00007fa20784f000)
> >         libtinfo.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-
> oesdk-linux/lib/libtinfo.so.5 (0x00007fa207628000)
> >         libz.so.1 =3D> /lib64/libz.so.1 (0x0000003f06c00000)
> >         libm.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libm.so.6 (0x00007fa2073a5000)
> >         libpthread.so.0 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-
> oesdk-linux/lib/libpthread.so.0 (0x00007fa207188000)
> >         libutil.so.1 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-
> oesdk-linux/lib/libutil.so.1 (0x00007fa206f84000)
> >         libexpat.so.1 =3D> /lib64/libexpat.so.1 (0x0000003f09800000)
> >         libc.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libc.so.6 (0x00007fa206bfd000)
> >         /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-
> linux-x86-64.so.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x0000003f05000000)
> >
> >
> > I am seeing that the sdk gdb is dynamically linking with some of the
> host libraries as seen above.
> >
> ebenard@eb-e6520 x86_64-oe-linux]$ ldd x86_64-oe-linux-gdb
> ./x86_64-oe-linux-gdb: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libc.so.6: version `GLIBC_2.14' not found (required by
> /lib64/libz.so.1)
> ./x86_64-oe-linux-gdb: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libc.so.6: version `GLIBC_2.14' not found (required by
> /usr/lib64/libpython2.7.so.1.0)
> 	linux-vdso.so.1 =3D>  (0x00007fff12dff000)
> 	libreadline.so.6 =3D> /lib64/libreadline.so.6 (0x0000003ba3a00000)
> 	libdl.so.2 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libdl.so.2 (0x00007fbfa6c67000)
> 	libncurses.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-
> oesdk-linux/lib/libncurses.so.5 (0x00007fbfa6a44000)
> 	libtinfo.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libtinfo.so.5 (0x00007fbfa681d000)
> 	libz.so.1 =3D> /lib64/libz.so.1 (0x0000003ba3200000)
> 	libm.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libm.so.6 (0x00007fbfa659a000)
> 	libpthread.so.0 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-
> oesdk-linux/lib/libpthread.so.0 (0x00007fbfa637d000)
> 	libutil.so.1 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libutil.so.1 (0x00007fbfa6179000)
> 	libpython2.7.so.1.0 =3D> /usr/lib64/libpython2.7.so.1.0
> (0x0000003bb3000000)
> 	libexpat.so.1 =3D> /lib64/libexpat.so.1 (0x0000003ba7200000)
> 	libc.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libc.so.6 (0x00007fbfa5df1000)
> 	/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-
> linux-x86-64.so.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x0000003ba1600000)
> [ebenard@eb-e6520 x86_64-oe-linux]$ ./x86_64-oe-linux-gdb
> GNU gdb (GDB) 7.4
> Copyright (C) 2012 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show
> copying" and "show warranty" for details.
> This GDB was configured as "--host=3Dx86_64-oesdk-linux
> --target=3Dx86_64-oe-linux". For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>.
> (gdb) quit
> [ebenard@eb-e6520 x86_64-oe-linux]$ cd ../i586-oe-linux/
>=20
> [ebenard@eb-e6520 i586-oe-linux]$ ldd i586-oe-linux-gdb
> ./i586-oe-linux-gdb: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libc.so.6: version `GLIBC_2.14' not found (required by
> /lib64/libz.so.1)
> ./i586-oe-linux-gdb: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libc.so.6: version `GLIBC_2.14' not found (required by
> /usr/lib64/libpython2.7.so.1.0)
> 	linux-vdso.so.1 =3D>  (0x00007fff7c949000)
> 	libreadline.so.6 =3D> /lib64/libreadline.so.6 (0x0000003ba3a00000)
> 	libdl.so.2 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libdl.so.2 (0x00007fe6f9c74000)
> 	libncurses.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-
> oesdk-linux/lib/libncurses.so.5 (0x00007fe6f9a51000)
> 	libtinfo.so.5 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libtinfo.so.5 (0x00007fe6f982a000)
> 	libz.so.1 =3D> /lib64/libz.so.1 (0x0000003ba3200000)
> 	libm.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libm.so.6 (0x00007fe6f95a7000)
> 	libpthread.so.0 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-
> oesdk-linux/lib/libpthread.so.0 (0x00007fe6f938a000)
> 	libutil.so.1 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libutil.so.1 (0x00007fe6f9186000)
> 	libpython2.7.so.1.0 =3D> /usr/lib64/libpython2.7.so.1.0
> (0x0000003bb3000000)
> 	libexpat.so.1 =3D> /lib64/libexpat.so.1 (0x0000003ba7200000)
> 	libc.so.6 =3D> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/lib/libc.so.6 (0x00007fe6f8dfe000)
> 	/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-
> linux-x86-64.so.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x0000003ba1600000)
> [ebenard@eb-e6520 i586-oe-linux]$ ./i586-oe-linux-gdb
> GNU gdb (GDB) 7.4
> Copyright (C) 2012 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show
> copying"
> and "show warranty" for details.
> This GDB was configured as "--host=3Dx86_64-oesdk-linux --target=3Di586-o=
e-
> linux".
> For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>.
> (gdb) quit
>=20
> --
> http://eukrea.com/en/news/104-2012


Looks like in my case the sdk gdb is not dynamically linked with libpython.

Nitin



