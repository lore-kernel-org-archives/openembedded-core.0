Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SAkwf-0003JL-Qd
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 17:33:03 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Mar 2012 09:22:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="120526523"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2012 09:22:24 -0700
Received: from orsmsx102.amr.corp.intel.com (10.22.225.129) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 22 Mar 2012 09:20:19 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.160]) with mapi id
	14.01.0355.002; Thu, 22 Mar 2012 09:20:19 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>, Khem Raj
	<raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/1] Revert "gdb-cross-canadian: build gdb
	with python support"
Thread-Index: AQHNB4VDG6/xwLeUgEWTysDmkk+IHpZ1BaqAgAB3WAD//4s7gIAAd4cA//+K+DCAAI5egIAABI0A//+ae8AAD0RXgAAOkVAg//+Uh4CAAHG8cP//vk0AgABePxD//+QoAIAAbP/w//+eq4AADuUhAAAAJUEAAADrcAAAAH4QAAAAmVaAAAhCLcA=
Date: Thu, 22 Mar 2012 16:20:18 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137BE5C@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sq7hcTKrzFBYgmUOTcdQw6sC1FG4jUhsfKauqeXLQMgsg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
	<20120322131310.1c6455d1@eb-e6520>
	<CAMKF1sqEGjWMpPTQxP3j1bbP6H2FQqAgHZGm399ejC-RyDxboQ@mail.gmail.com>
	<20120322134340.1af3dfda@eb-e6520>
	<CAMKF1srORF53h-V+fKTjJn2jWg=f6nOaMf_eUmYPLnW-ovc7NQ@mail.gmail.com>
	<20120322141455.644058f0@eb-e6520>
In-Reply-To: <20120322141455.644058f0@eb-e6520>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 22 Mar 2012 16:33:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Eric B=E9nard [mailto:eric@eukrea.com]
> Sent: Thursday, March 22, 2012 6:15 AM
> To: Khem Raj
> Cc: Kamble, Nitin A; Patches and discussions about the oe-core layer;
> Martin Jansa
> Subject: Re: [OE-core] [PATCH 1/1] Revert "gdb-cross-canadian: build
> gdb with python support"
>=20
> Le Thu, 22 Mar 2012 05:57:46 -0700,
> Khem Raj <raj.khem@gmail.com> a =E9crit :
>=20
> > On Thu, Mar 22, 2012 at 5:43 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> > > you are right :
> > >
> > > $ sudo rm ../../lib/python2.7/lib-dynload/readline.so
> >
> > ok another experiment instead of deleting readline.so make a copy of
> > it and call it
> > readline_d.so in the same dir or whereever gdb looks for debug
> symbols
> > and see if it still works or do you get the segfault again.
>=20
> true :
>=20
> [ebenard@eb-e6520 lib-dynload]$ sudo mv readline.so readline_d.so
> [ebenard@eb-e6520 lib-dynload]$ arm-oe-linux-gnueabi-gdb
> GNU gdb (GDB) 7.4
> Copyright (C) 2012 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later
> <http://gnu.org/licenses/gpl.html> This is free software: you are free
> to change and redistribute it. There is NO WARRANTY, to the extent
> permitted by law.  Type "show copying" and "show warranty" for details.
> This GDB was configured as "--host=3Dx86_64-oesdk-linux
> --target=3Darm-oe-linux-gnueabi". For bug reporting instructions, please
> see: <http://www.gnu.org/software/gdb/bugs/>.
> (gdb) quit
>=20
> Eric

Khem, Eric,

Renaming the sdk python2.7/lib-dynload/readline.so to python2.7/lib-dynload=
/readline_d.so gets the sdk gdb working for me too.
So is this a workaround or solution to the problem? If it is a workaround w=
hat should be right solution?

Thanks,
Nitin




