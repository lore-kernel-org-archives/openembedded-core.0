Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QrgKf-0007wP-6V
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 03:14:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2011 18:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,359,1309762800"; d="scan'208";a="40715638"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga001.fm.intel.com with ESMTP; 11 Aug 2011 18:10:07 -0700
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 12 Aug 2011 09:09:37 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Fri, 12 Aug 2011 09:09:36 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Fri, 12 Aug 2011 09:09:36 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 12 Aug 2011 09:09:36 +0800
Thread-Topic: [OE-core] [PATCH 1/2] image: populate site config files into
	roootfs.
Thread-Index: AcxYNH8Qxewn2gIwTKGEEFwnFHEhtgAV7vGA
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F2FA7675AE3@shsmsx502.ccr.corp.intel.com>
References: <cover.1313072334.git.lianhao.lu@intel.com>
	<a536443a01f8059b9a11418ea7b812e3286b7576.1313072334.git.lianhao.lu@intel.com>
	<1313073561.6733.135.camel@phil-desktop>
In-Reply-To: <1313073561.6733.135.camel@phil-desktop>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] image: populate site config files into roootfs.
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
X-List-Received-Date: Fri, 12 Aug 2011 01:14:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Phil Blundell wrote on 2011-08-11:
> On Thu, 2011-08-11 at 22:31 +0800, Lianhao Lu wrote:
>> [YOCTO #892] populate the site config files content into the file in
>> {target}/cross_site_config in rootfs, which can be used by the cross
>> toolchain in meta-toolchain when the rootfs is used as sysroot.
>=20
> Is that going to cause ${datadir}/cross_site_config to get created in
> all rootfs images?  That would be undesirable, but I couldn't
> obviously see a flag to turn it on and off.
>=20

We can add flag to turn it on and off. But the problem is that in that case=
, the user need to build 2 image rootfs, one for running and one for cross =
compiling.

Best Regards,
Lianhao




