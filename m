Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QuKiE-0002N6-9R
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 10:45:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Aug 2011 01:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,250,1312182000"; d="scan'208";a="40174500"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 19 Aug 2011 01:41:15 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 19 Aug 2011 16:40:08 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 19 Aug 2011 16:40:07 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 19 Aug 2011 16:40:06 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2011 16:40:05 +0800
Thread-Topic: [OE-core] Blocker - [Bug 1070] [deb] core-image-sato-sdk.bb:
	do_rootfs failed: unmet dependencies
Thread-Index: AcxeRIB3sqhyOT5qQx+77XK2ysgp+QABKHRw
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F306C63BF6E@shsmsx502.ccr.corp.intel.com>
References: <4E4E1566.8080202@windriver.com>
In-Reply-To: <4E4E1566.8080202@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: "Liu, Song" <song.liu@intel.com>, "Wold, Saul" <saul.wold@intel.com>
Subject: Re: Blocker - [Bug 1070] [deb] core-image-sato-sdk.bb: do_rootfs failed: unmet dependencies
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
X-List-Received-Date: Fri, 19 Aug 2011 08:45:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

wenzong fan wrote on 2011-08-19:
> Hi Folks,
>=20
> I think I was blocked by this defect now, and it also blocked the #1086:
>=20
> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1070
>=20
> I have try to add the depended packages to 'package_to_install', but=20
> they won't be installed at all. I know a little about the dpkg, I'm=20
> not sure if this is caused by 'dpkg/apt-get' or something wrong in the dp=
kg database.
>=20
> Details please refer to the attached logs, any suggestions will be welcom=
ed!
>=20

I'm not sure what's the difference between update-alternatives-cworth and u=
pdate-alternatives-dpkg, but I do see the update-alternatives-cworth claims=
 conflicting with update-alternatives-dpkg. It seems the former is coming f=
rom the ipk world, and the latter is coming from deb world. Should we use u=
pdate-alternatives-dpkg in deb world?

Best Regards,
Lianhao




