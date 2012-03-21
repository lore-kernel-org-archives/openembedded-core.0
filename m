Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SAQ5b-0006K4-Bl
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 19:16:51 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Mar 2012 11:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="142684017"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2012 11:07:52 -0700
Received: from orsmsx103.amr.corp.intel.com (10.22.225.130) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Mar 2012 11:07:51 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX103.amr.corp.intel.com ([169.254.2.207]) with mapi id
	14.01.0355.002; Wed, 21 Mar 2012 11:07:51 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Thread-Topic: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python
	support"
Thread-Index: AQHNB4VDG6/xwLeUgEWTysDmkk+IHpZ1BaqAgAB3WAD//4s7gIAAd4cA//+K+DA=
Date: Wed, 21 Mar 2012 18:07:50 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
In-Reply-To: <20120321190208.25dc0387@eb-e6520>
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
X-List-Received-Date: Wed, 21 Mar 2012 18:16:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Eric B=E9nard [mailto:eric@eukrea.com]
> Sent: Wednesday, March 21, 2012 11:02 AM
> To: Kamble, Nitin A
> Cc: openembedded-core@lists.openembedded.org; Martin.Jansa@gmail.com;
> richard.purdie@linuxfoundation.org
> Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with
> python support"
>=20
> Le Wed, 21 Mar 2012 17:57:57 +0000,
> "Kamble, Nitin A" <nitin.a.kamble@intel.com> a =E9crit :
> > Can you try meta-toolchain for qemux86 or qemux86-64 machine ?
> > I found that sdk gdb is failing for these machines since that commit
> went in the oe-core.
> >
> I'm launching a build and will keep you informed of the result. If that
> only fails for x86 or x86_64 targets, we can use overrides to disable
> python support only for these targets.
>=20
> Eric

I also starting test for sdk gdb for qemuarm target. Will keep you posted. =
Any solution that gives a working sdk gdb for all arches will be good.

Thanks,
Nitin



