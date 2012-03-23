Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SB9Am-0002Oj-HZ
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 19:25:12 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Mar 2012 11:16:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="132494814"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2012 11:16:15 -0700
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 23 Mar 2012 11:16:14 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX151.amr.corp.intel.com ([169.254.7.218]) with mapi id
	14.01.0355.002; Fri, 23 Mar 2012 11:16:11 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gdb-cross-canadian: Fix linking issues when
	python support is enabled
Thread-Index: AQHNCPO1IvNa5K9RU0i9GCXicJ+ycZZ4Lv7A
Date: Fri, 23 Mar 2012 18:16:10 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C0137C822@ORSMSX106.amr.corp.intel.com>
References: <1332507041-30674-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1332507041-30674-1-git-send-email-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH] gdb-cross-canadian: Fix linking issues when	python support is enabled
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
X-List-Received-Date: Fri, 23 Mar 2012 18:25:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
>=20
> gdb-cross-canadian was linking with static version of libpython
> and looking for build host python when run. This could be mismatch
> between python-nativesdk and build host provided python. So we
> make it consistent to always use python-nativesdk
>=20


Khem,
  In my debug effort, I did not find that gdb-cross-canadian was
linking with static version of libpython. How did you find that out ?
I think I can learn a lot from you :)

Thanks,
Nitin



