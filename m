Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R1Dpp-0002u4-Ms
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 10:50:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Sep 2011 01:45:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="45979269"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 07 Sep 2011 01:45:00 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 7 Sep 2011 16:44:29 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 7 Sep 2011 16:44:29 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Wed, 7 Sep 2011
	16:44:29 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 7 Sep 2011 16:44:27 +0800
Thread-Topic: [OE-core] [PATCH 1/5] hal: Remove build time dependency of
	virtual/kernel
Thread-Index: AcxtOUIpUvrKdqWpQ5OQA2iu0nciUQAAOBLA
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D74AA360@shsmsx501.ccr.corp.intel.com>
References: <cover.1314953755.git.dongxiao.xu@intel.com>
	<4959b5dd8cbbed8bbbd6aace139e93b9ced52f80.1314953755.git.dongxiao.xu@intel.com>
	<BE7333AC-4DA0-4DDB-8707-96F15A7A8A58@dominion.thruhere.net>
In-Reply-To: <BE7333AC-4DA0-4DDB-8707-96F15A7A8A58@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] hal: Remove build time dependency of	virtual/kernel
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
X-List-Received-Date: Wed, 07 Sep 2011 08:50:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Wednesday, September 07, 2011 4:36 PM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 1/5] hal: Remove build time dependency of
> virtual/kernel
>=20
>=20
> Op 2 sep. 2011, om 11:03 heeft Dongxiao Xu het volgende geschreven:
>=20
> > hal has runtime dependency on kernel, but not build time. Remove it
> > from "DEPENDS" list.
> >
> > Also fix a wrong PACKAGE_ARCH setting when building multilib
> > lib32-hal, because ":=3D" will be extended immediately which is not the=
 right
> value.
> > Using TUNE_PKGARCH instead.
>=20
> After this patch it fails to build with:
>=20
> | probe-video4linux.c:33:28: fatal error: linux/videodev.h: No such file
> | or directory
>=20
> Which does look like a kernel header to me

Thanks Koen, it seems that we still need to draw back "virtual/kernel" as h=
al's DEPENDS.

Thanks,
Dongxiao

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


