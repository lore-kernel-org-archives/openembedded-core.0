Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SPPGU-0005Ah-N1
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 04:26:02 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 May 2012 19:16:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95303804"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 01 May 2012 19:16:02 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 1 May 2012 19:16:01 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.226]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.243]) with mapi id
	14.01.0355.002; Wed, 2 May 2012 10:16:00 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH V2 0/7] Misc fixings for multilib
Thread-Index: AQHNJD/ihQsQenKDNUCY5wGwb4kk7Za0x9WAgAD3pgA=
Date: Wed, 2 May 2012 02:15:59 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FD9C602@SHSMSX102.ccr.corp.intel.com>
References: <cover.1335508325.git.lianhao.lu@intel.com>
	<4FA0305D.6010408@linux.intel.com>
In-Reply-To: <4FA0305D.6010408@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH V2 0/7] Misc fixings for multilib
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
X-List-Received-Date: Wed, 02 May 2012 02:26:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Saul Wold wrote on 2012-05-02:
> On 04/26/2012 11:34 PM, Lianhao Lu wrote:
>> 1. Added a package QA check function in multilib case. It checkes whethe=
r
>> there is a package runtime dependency on packages with names not prefixe=
d
>> by $MLPREFIX.
>>=20
>> 2. Fixed a bunch of recipes to use $libdir and $base_libdir instead of t=
he
>> hard coded /usr/lib and /lib.
>>=20
>> The following changes since commit 5a1f172d35be610688842a8a9a84f24edb9ae=
b51:
>>    Martin Jansa (1):
>>          bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NA=
ME
>> are available in the git repository at:
>>=20
>>    git://git.yoctoproject.org/poky-contrib llu/multilib
>>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dllu/multil=
ib
>> Lianhao Lu (7):
>>    multilib.bbclass: Added multilib specific package QA.
> I think that we need to address some of these WARNING before merging
> this change directly.  Is this supposed to address [YOCTO #2038]?

No. This patch is intended to find potential RDEPENDS problems for those re=
cipes which=20
might not be so friendly with multilib cases. We'd like to detect those pot=
ential RDEPENDS=20
problems as early as possible, not by the failure of the do_rootfs task. II=
RC Dongxiao had=20
a patch in his merge pending list to address most of the "eglibc-locale" RD=
EPENDS warnings,
right Dongxiao?

-Lianhao

>>    popt: Fixing pkgconfig file installation issue.
>>    avahi: not using hard coded libdir.
> Merged into OE-Core
>=20
>>    pulseaudio: use base_libdir for udev rules.
>>    alsa-utils: use base_libdir for udev rules.
> I am still reviewing the udev changes.
>=20
>>    xorg-app: Use ${libdir} and ${datadir} for packaging.=20
> Merged into OE-Core=20
>>    xf86-input-vmmouse: use base_libdir for udev rules.
> Under review
>=20
> Thanks
> 	Sau!
>=20


