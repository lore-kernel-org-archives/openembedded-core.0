Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SApsk-0008Go-7m
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 22:49:18 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Mar 2012 14:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="132165629"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2012 14:40:21 -0700
Received: from orsmsx104.amr.corp.intel.com (10.22.225.131) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 22 Mar 2012 14:40:21 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX104.amr.corp.intel.com ([169.254.3.46]) with mapi id
	14.01.0355.002; Thu, 22 Mar 2012 14:40:21 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>, Khem Raj
	<raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/1] Revert "gdb-cross-canadian: build gdb
	with python support"
Thread-Index: AQHNB4VDG6/xwLeUgEWTysDmkk+IHpZ1BaqAgAB3WAD//4s7gIAAd4cA//+K+DCAAI5egIAABI0A//+ae8AAD0RXgAAOkVAg//+Uh4CAAHG8cP//vk0AgABePxD//+QoAIAAbP/w//+eq4AADuUhAAAAJUEAAADrcAAAAH4QAAAAmVaAAAhCLcAAASiuAAAO5twgAAuu0gAAEqkugAAz6vaA
Date: Thu, 22 Mar 2012 21:40:20 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137BFE5@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
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
	<ADD6A3980E8C39419A432FF422031B4C0137BE5C@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srd0KanO6NfQtm0U39GZS_ANsu9KdRR0hirpKQrhMCxzg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BEEB@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sr=PedPsmpPSGC42Wvof9fHbR26JM2hgEZjA3h621ynxA@mail.gmail.com>
	<20120322223127.136698cf@eb-e6520>
In-Reply-To: <20120322223127.136698cf@eb-e6520>
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
X-List-Received-Date: Thu, 22 Mar 2012 21:49:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Eric B=E9nard [mailto:eric@eukrea.com]
> Sent: Thursday, March 22, 2012 2:31 PM
> To: Khem Raj
> Cc: Kamble, Nitin A; Patches and discussions about the oe-core layer;
> Martin Jansa
> Subject: Re: [OE-core] [PATCH 1/1] Revert "gdb-cross-canadian: build
> gdb with python support"
>=20
> Hi Khem, Hi Nitin,
>=20
> Le Thu, 22 Mar 2012 12:16:44 -0700,
> Khem Raj <raj.khem@gmail.com> a =E9crit :
> > On Thu, Mar 22, 2012 at 10:38 AM, Kamble, Nitin A
> > <nitin.a.kamble@intel.com> wrote:
> > > Looks like we need this patch for the python recipe to generate
> debug modules:
> > > http://patch-tracker.debian.org/patch/series/view/python2.7/2.7.2-
> 8/debug-build.diff
> >
> > yep thats the one. Apply it to python and rebuild python-native and
> > stage it then see if that helps. You might have to adjust the FILES
> > and PACKAGES to put the new files in right places.
>=20
> With this patch all the libraries (including libpython2.7) now have a
> _d
> suffix : is that what we really want ?
>=20
> Once that's hacked in the recipe so that do_compile works - in case
> someone has an idea - I get a failure during installation of
> python-nativesdk :
> build/tmp-eglibc/work/x86_64-nativesdk-oesdk-linux/python-nativesdk-
> 2.7.2-r1.9/image/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-
> linux/usr/lib/python2.7/sysconfig.py :
> return os.path.join(get_path('platstdlib'), "config" + (sys.pydebug and
> "_d" or ""), "Makefile") | AttributeError: 'module' object has no
> attribute 'pydebug
>=20
> I checked on both debian & fedora and they are using this patch only to
> generate debug packages, not for the standard package.
> Moreover, when I execute gdb on my PC (Fedora 16) it runs fine and I
> don't have readline_d.so installed in lib-dynload so it seems possible
> to get gdb to work with python without having debug symbols.
>=20
> Eric


Hi Eric, Khem,
  I am also having very similar thoughts here. My fedora does not have=20
readline_d.so installed, and that is not a problem for host gdb.

The install issue you are seeing is due to python-native which is used=20
in the nativesdk install process, it is expecting "pydebug" enabled=20
in the native version also. And I could not get that patch applied to the
python-native successfully (another build issue).

Anyways, we 1st need to understand, how gdb in mainline distros like fedora=
=20
is able to work fine without having the debug python modules installed.

Thanks,
Nitin





