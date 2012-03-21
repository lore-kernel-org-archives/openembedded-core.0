Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SAPwW-00065m-LD
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 19:07:28 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Mar 2012 10:58:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="80049525"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Mar 2012 10:58:09 -0700
Received: from orsmsx104.amr.corp.intel.com (10.22.225.131) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Mar 2012 10:57:58 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX104.amr.corp.intel.com ([169.254.3.46]) with mapi id
	14.01.0355.002; Wed, 21 Mar 2012 10:57:58 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Thread-Topic: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python
	support"
Thread-Index: AQHNB4VDG6/xwLeUgEWTysDmkk+IHpZ1BaqAgAB3WAD//4s7gA==
Date: Wed, 21 Mar 2012 17:57:57 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
In-Reply-To: <20120321185216.440a6353@eb-e6520>
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
X-List-Received-Date: Wed, 21 Mar 2012 18:07:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Eric B=E9nard [mailto:eric@eukrea.com]
> Sent: Wednesday, March 21, 2012 10:52 AM
> To: Kamble, Nitin A
> Cc: openembedded-core@lists.openembedded.org; Martin.Jansa@gmail.com;
> richard.purdie@linuxfoundation.org
> Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with
> python support"
>=20
> Le Wed, 21 Mar 2012 17:47:53 +0000,
> "Kamble, Nitin A" <nitin.a.kamble@intel.com> a =E9crit :
> >   I tried removing the "--with-system-readline" from the
> EXTRA_OECONF. It did not change the behavior of the issue.
> > Also I noticed that that commit never worked in the tree. I have
> built it on fedora and suse systems.
>=20
> it works fine here (Fedora 16 x86_64 host system, oe-core + qemuarm
> target + meta-toolchain-qte), tested yersterday.
>=20
> Eric

Can you try meta-toolchain for qemux86 or qemux86-64 machine ?
I found that sdk gdb is failing for these machines since that commit went i=
n the oe-core.

Thanks,
Nitin



