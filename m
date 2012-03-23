Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SB7AY-0007ZD-S8
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 17:16:51 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Mar 2012 09:07:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="132452597"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2012 09:07:53 -0700
Received: from orsmsx105.amr.corp.intel.com (10.22.225.132) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 23 Mar 2012 09:07:53 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX105.amr.corp.intel.com ([169.254.4.199]) with mapi id
	14.01.0355.002; Fri, 23 Mar 2012 09:07:52 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Khem Raj <raj.khem@gmail.com>, =?iso-8859-1?Q?Eric_B=E9nard?=
	<eric@eukrea.com>
Thread-Topic: [OE-core] [PATCH 1/1] Revert "gdb-cross-canadian: build gdb
	with python support"
Thread-Index: AQHNB4VDG6/xwLeUgEWTysDmkk+IHpZ1BaqAgAB3WAD//4s7gIAAd4cA//+K+DCAAI5egIAABI0A//+ae8AAD0RXgAAOkVAg//+Uh4CAAHG8cP//vk0AgABePxD//+QoAIAAbP/w//+eq4AADuUhAAAAJUEAAADrcAAAAH4QAAAAmVaAAAhCLcAAASiuAAAO5twgAAuu0gAAEqkugAARCB2AAB9PjQAANxRbgAB0c3ng
Date: Fri, 23 Mar 2012 16:07:52 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137C6C6@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
	<20120322131310.1c6455d1@eb-e6520>
	<CAMKF1sqEGjWMpPTQxP3j1bbP6H2FQqAgHZGm399ejC-RyDxboQ@mail.gmail.com>
	<20120322134340.1af3dfda@eb-e6520>
	<CAMKF1srORF53h-V+fKTjJn2jWg=f6nOaMf_eUmYPLnW-ovc7NQ@mail.gmail.com>
	<20120322141455.644058f0@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137BE5C@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srd0KanO6NfQtm0U39GZS_ANsu9KdRR0hirpKQrhMCxzg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BEEB@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sr=PedPsmpPSGC42Wvof9fHbR26JM2hgEZjA3h621ynxA@mail.gmail.com>
	<20120322223127.136698cf@eb-e6520> <4F6C2259.7000802@gmail.com>
	<20120323093114.2f779b94@eb-e6520> <4F6C676F.7060700@gmail.com>
In-Reply-To: <4F6C676F.7060700@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
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
X-List-Received-Date: Fri, 23 Mar 2012 16:16:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Friday, March 23, 2012 5:07 AM
> To: Eric B=E9nard
> Cc: Kamble, Nitin A; Patches and discussions about the oe-core layer;
> Martin Jansa
> Subject: Re: [OE-core] [PATCH 1/1] Revert "gdb-cross-canadian: build
> gdb with python support"
>=20
> On 03/23/2012 01:31 AM, Eric B=E9nard wrote:
> > Hi Khem,
> >
> > Le Fri, 23 Mar 2012 00:12:25 -0700,
> > Khem Raj<raj.khem@gmail.com>  a =E9crit :
> >> OK can you try following patch ? (untested) it does not fix the
> paths so
> >> once you install sdk it will have to be fixed as you did with
> chrpath
> >> for testing
> >>
> >> http://paste.ubuntu.com/896082/
> >>
> >> I think issue is currently we are linking with static version of
> >> libpython and also the search path to find python executable for gdb
> >> when running is /usr/bin and not the python from SDK so this patch
> >> takes care of both
> >>
> > very good catch, now gdb runs fine and strace shows that it loads
> > the right library :
> >
> > open("/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/usr/lib/python2.7/lib-dynload/readline.so",
> > O_RDONLY) =3D 6 fstat(6, {st_mode=3DS_IFREG|0755, st_size=3D23520, ...}=
) =3D
> 0
> > futex(0x7f3ada48e0a8, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
> > open("/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/usr/lib/python2.7/lib-dynload/readline.so",
> > O_RDONLY) =3D 7 read(7,
> > "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`%\0\0\0\0\0\0"...,
> 832)
> > =3D 832 fstat(7, {st_mode=3DS_IFREG|0755, st_size=3D23520, ...}) =3D 0
> > mmap(NULL, 2118952, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,
> 7,
> > 0) =3D 0x7f3ad8a05000
> >
> > Eric
>=20
> good. So this patch does the trick. I will post proper patch shortly
> we still need to fix the rpath problem though

Khem,
   Thanks for fixing the gdb issue at the root cause. And I have a fix for =
the rpath issue.
Thanks,
Nitin



