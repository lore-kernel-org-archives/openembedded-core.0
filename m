Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SAPmE-0005Y4-91
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 18:56:50 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Mar 2012 10:47:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="131604285"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2012 10:47:55 -0700
Received: from orsmsx105.amr.corp.intel.com (10.22.225.132) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Mar 2012 10:47:54 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX105.amr.corp.intel.com ([169.254.4.199]) with mapi id
	14.01.0355.002; Wed, 21 Mar 2012 10:47:54 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Thread-Topic: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python
	support"
Thread-Index: AQHNB4VDG6/xwLeUgEWTysDmkk+IHpZ1BaqA
Date: Wed, 21 Mar 2012 17:47:53 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
In-Reply-To: <20120321180748.7cc58e67@eb-e6520>
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
X-List-Received-Date: Wed, 21 Mar 2012 17:56:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Eric B=E9nard [mailto:eric@eukrea.com]
> Sent: Wednesday, March 21, 2012 10:08 AM
> To: Kamble, Nitin A
> Cc: openembedded-core@lists.openembedded.org; Martin.Jansa@gmail.com;
> richard.purdie@linuxfoundation.org
> Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with
> python support"
>=20
> Hi Nitin,
>=20
> Le Wed, 21 Mar 2012 09:35:16 -0700,
> nitin.a.kamble@intel.com a =E9crit :
>=20
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > This reverts commit 1cb4614f1d5e482b88ea372d1841a6c313a49941.
> >
> > and bump PR
> >
> > This fixes this bug:
> > [YOCTO #2077] - memory buffer mess up of i586-poky-linux-gdb in meta-
> toolchain
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2077
> >
> this configuration should work as python is enabled in gdb in most
> modern distribution, the problem here may be in the libreadline of the
> host system.
> May you please try to remove --with-system-readline from
> EXTRA_OECONF in gdb-common.inc so that gdb doesn't try to use the
> libreadline of your old ubuntu system ?
>=20
> If that solves the problem this would allow us not to loose this python
> scripting capability which is quite useful in gdb.
>=20
> Thanks
> Eric
> --
> http://eukrea.com/en/news/104-2012

Hi Eric,
  I tried removing the "--with-system-readline" from the EXTRA_OECONF. It d=
id not change the behavior of the issue.
Also I noticed that that commit never worked in the tree. I have built it o=
n fedora and suse systems.

Nitin



