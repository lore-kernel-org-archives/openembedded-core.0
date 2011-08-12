Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QrhU6-0000e6-En
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 04:28:30 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Aug 2011 19:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,360,1309762800"; 
   d="scan'208";a="6382262"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Aug 2011 19:23:56 -0700
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 12 Aug 2011 10:22:41 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Fri, 12 Aug 2011 10:22:40 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 12 Aug 2011 10:22:40 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 12 Aug 2011 10:22:40 +0800
Thread-Topic: [OE-core] [PATCH 1/2] image: populate site config files into
	roootfs.
Thread-Index: AcxYlFbY33dHM5IOR+OOZZQySK8sKgAAY/+Q
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F2FA7675BDA@shsmsx502.ccr.corp.intel.com>
References: <cover.1313072334.git.lianhao.lu@intel.com>
	<a536443a01f8059b9a11418ea7b812e3286b7576.1313072334.git.lianhao.lu@intel.com>
	<1313073561.6733.135.camel@phil-desktop>
	<C10D3FB0CD45994C8A51FEC1227CE22F2FA7675AE3@shsmsx502.ccr.corp.intel.com>
	<4E448A4F.6000707@linux.intel.com>
In-Reply-To: <4E448A4F.6000707@linux.intel.com>
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
X-List-Received-Date: Fri, 12 Aug 2011 02:28:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote on 2011-08-12:
> On 08/11/2011 06:09 PM, Lu, Lianhao wrote:
>> Phil Blundell wrote on 2011-08-11:
>>> On Thu, 2011-08-11 at 22:31 +0800, Lianhao Lu wrote:
>>>> [YOCTO #892] populate the site config files content into the file
>>>> in {target}/cross_site_config in rootfs, which can be used by the
>>>> cross toolchain in meta-toolchain when the rootfs is used as sysroot.
>>>=20
>>> Is that going to cause ${datadir}/cross_site_config to get created
>>> in all rootfs images?  That would be undesirable, but I couldn't
>>> obviously see a flag to turn it on and off.
>>>=20
>>=20
>> We can add flag to turn it on and off. But the problem is that in that
>> case, the user need to build 2 image rootfs, one for running and one
>> for cross compiling.
>>=20
> Lianhao,
>=20
> This is only required for toolchain, is there a way to create the
> externally from the rootfs and package it with the ADT?  The problem
> here is that you will add space to the image (not sure how big), maybe
> this only make set to be and IMAGE_FEATURE for -dev or -sdk images,
> just as we add the -dev and -dbg packages to only those images?
>=20

Its about 50KB for core-image-sato-sdk. Having them in a separate package s=
eems not feasible now, because we can't make sure the package is generated =
after all other packages have finished their populate-sysroot tasks. But it=
's a good idea to populate the site config files only into the -dev or -sdk=
 images. I'll rework the patch.

Best Regards,
Lianhao




