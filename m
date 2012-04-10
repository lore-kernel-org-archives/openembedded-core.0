Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SHSUa-0001op-Po
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 06:15:45 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Apr 2012 21:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="87185980"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Apr 2012 21:06:26 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 9 Apr 2012 21:06:25 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Tue, 10 Apr 2012 12:06:25 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/1] meta-toolchain: runqemu falied on
	FC16/Opensuse12.1 x86_64
Thread-Index: AQHNFjrD5+rzQHJT5kasSUjz+hO3xJaSTBPw//+X+ACAAOd6gIAApXkg
Date: Tue, 10 Apr 2012 04:06:24 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FD33582@SHSMSX102.ccr.corp.intel.com>
References: <cover.1333966697.git.liezhi.yang@windriver.com>
	<857BE142E5399E46B20FD45B9DB8A7BC0FD32945@SHSMSX102.ccr.corp.intel.com>
	<4F82D450.2000602@windriver.com> <4F83967D.6020403@windriver.com>
In-Reply-To: <4F83967D.6020403@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] meta-toolchain: runqemu falied on	FC16/Opensuse12.1 x86_64
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
X-List-Received-Date: Tue, 10 Apr 2012 04:15:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Robert Yang wrote on 2012-04-10:
>=20
>=20
> On 04/09/2012 08:21 PM, Robert Yang wrote:
>>=20
>>=20
>> On 04/09/2012 06:36 PM, Lu, Lianhao wrote:
>>>=20
>>> Robert Yang wrote on 2012-04-09:
>>>> Test info:
>>>> * Have tested on:
>>>> * Fedora 16 x86_64
>>>> * Opensuse 12.1 x86_64
>>>=20
>>> Robert,
>>> Hongna just found a qemu launch error on openSuse x86_64 using the 2.15
>>> eglibc-nativesdk, something about the SDL initialization error. Did you=
r
>>> platform work well?
>>>=20
>>=20
>=20
> Here is the update information from Hongna:
>=20
> I have finished the test on opensuse x86-64, both qemuarm and qemux86 do
> cross debug pass using 2.15 toolchain.
>=20
> // Robert
>=20
>> Maybe he just used "ssh" without "-X" or "-Y" ? There would be an SDL
>> initialization error when ssh without "-X" or "-Y". It worked well for m=
e.
>>=20
>> // Robert

It just popped into my mind that when ssh with X forwarding, does the SDL i=
nitialization happen on the Xserver, which is NOT openSuse x86-64, while th=
e xclient(qemu) is running on openSue? Could you try launching the qemu dir=
ectly on the openSuse? Thanks!

-Lianhao

>>=20
>>>> * Ubuntu 10.04
>>>> * The testing commands are:
>>>> $ bitbake core-image-sato meta-toolchain meta-toolchain-sdk
>>>>=20
>>>> And untar the sdk, then runqemu from the sdk to start the target.
>>>> // Robert
>>>>=20


