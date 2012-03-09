Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1S5uZ9-0008P6-KT
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 08:48:43 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Mar 2012 23:40:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="75480738"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Mar 2012 23:40:03 -0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 9 Mar 2012 00:40:02 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Fri, 9 Mar 2012 15:40:00 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] image_types: ensure .rootfs.ext3 is
	created before vmdk is created.
Thread-Index: AQHM/cZ62rN+yLQuV063SGjQqXVoWJZhkmzg
Date: Fri, 9 Mar 2012 07:40:00 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCD8DD0@SHSMSX102.ccr.corp.intel.com>
References: <cover.1331277565.git.dexuan.cui@intel.com>
	<6d24f6bd75d4c9da78368d3cae9dbbc8a470b2b6.1331277565.git.dexuan.cui@intel.com>
	<4F59B186.6090009@linux.intel.com>
In-Reply-To: <4F59B186.6090009@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] image_types: ensure .rootfs.ext3 is created before vmdk is created.
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
X-List-Received-Date: Fri, 09 Mar 2012 07:48:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote on 2012-03-09:
> On 03/08/2012 11:19 PM, Dexuan Cui wrote:
>> In the case of self-hosted-image.bb, IMAGE_FSTYPES =3D "vmdk", so the
>> variables alltypes and subimages don't contain ext3, and
>> .rootfs.ext3 won't be created, and finally the generated .hddimg and
>> .vmdk don't have an actual rootfs -- the size of the .vmdk file is only =
about 9MB.
>>=20
>> [YOCTO #2067]
>>=20
>> Signed-off-by: Dexuan Cui<dexuan.cui@intel.com>
>=20
> Nice Catch!
>=20
> Acked-by: Saul Wold <sgw@linux.intel.com>
BTW, I didn't find the bug in my previous test because I didn't build
From scratch, so actually I already had a file
tmp/deploy/image/self-hosted-image-qemux86.ext3, and according to=20
bootimg.bbclass's populate(), we used it -- but we should use a new .ext3 f=
ile.

Thanks,
-- Dexuan




