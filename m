Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SAq0F-0008Q4-L9
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 22:57:03 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Mar 2012 14:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="124043809"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2012 14:48:07 -0700
Received: from orsmsx104.amr.corp.intel.com (10.22.225.131) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 22 Mar 2012 14:48:06 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX104.amr.corp.intel.com ([169.254.3.46]) with mapi id
	14.01.0355.002; Thu, 22 Mar 2012 14:48:06 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>,
	=?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>, Khem Raj
	<raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/1] Revert "gdb-cross-canadian: build gdb
	with python support"
Thread-Index: AQHNB4VDG6/xwLeUgEWTysDmkk+IHpZ1BaqAgAB3WAD//4s7gIAAd4cA//+K+DCAAI5egIAABI0A//+ae8AAD0RXgAAOkVAg//+Uh4CAAHG8cP//vk0AgABePxD//+QoAIAAbP/w//+eq4AADuUhAAAAJUEAAADrcAAAAH4QAAAAmVaAAAhCLcAAASiuAAAO5twgAAuu0gAAEqkugAAz6vaAAGdsPkA=
Date: Thu, 22 Mar 2012 21:48:05 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137C00E@ORSMSX106.amr.corp.intel.com>
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
X-List-Received-Date: Thu, 22 Mar 2012 21:57:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Khem,
  Can you help me understand why renaming readline.so to readline_d.so
 is solving the core dump (or double free) issue?

  As noted in another email, the host gdb on fedora is able working fine
 without need of readline_d.so; so providing readline_d.so is also seems
 to be a workaround over a real issue.

Thanks,
Nitin




