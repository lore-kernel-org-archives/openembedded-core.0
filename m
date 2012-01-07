Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RjRK0-0006Zd-Qa
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 09:08:13 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jan 2012 00:00:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="104499350"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jan 2012 00:00:37 -0800
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 7 Jan 2012 16:00:36 +0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 7 Jan 2012 16:00:36 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.223]) with mapi id
	14.01.0355.002; Sat, 7 Jan 2012 16:00:35 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 4/7] packageinfo.bbclass: add a new bbclass
	to	pass package information
Thread-Index: AQHMzF6DRhHmIrylSUeSKEDnL6te7pYAi6dA
Date: Sat, 7 Jan 2012 08:00:34 +0000
Message-ID: <40776A41FC278F40B59438AD47D147A9016A81@SHSMSX102.ccr.corp.intel.com>
References: <cover.1325840092.git.dongxiao.xu@intel.com>
	<0642f4ea3b43b7753405481c5f4999cf9f822142.1325840474.git.dongxiao.xu@intel.com>
	<15DFFA35-B02B-463A-8CBA-9EBD369CC406@dominion.thruhere.net>
In-Reply-To: <15DFFA35-B02B-463A-8CBA-9EBD369CC406@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 4/7] packageinfo.bbclass: add a new bbclass to	pass package information
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
X-List-Received-Date: Sat, 07 Jan 2012 08:08:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Koen,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Friday, January 06, 2012 6:32 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 4/7] packageinfo.bbclass: add a new bbclass=
 to
> pass package information
>=20
>=20
> Op 6 jan. 2012, om 10:05 heeft Dongxiao Xu het volgende geschreven:
>=20
> > packageinfo.bbclass is to pass the accurate package information to
> > clients (e.g. Hob), including PN, PV, RDEPENDS, PKGSIZE, etc.
>=20
> Why not reuse buildhistory for this?

I didn't aware the existence of buildhistory.bbclass when I wrote my code. =
I will have a look at that.

Thanks,
Dongxiao

>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


