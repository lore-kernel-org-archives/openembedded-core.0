Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 6435977CCC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 14:24:33 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1dBMLx-0000uP-A8 from Awais_Belal@mentor.com ;
	Thu, 18 May 2017 07:24:34 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Thu, 18 May 2017 15:24:25 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1210.000; Thu, 18 May 2017 15:24:25 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Robert Yang
	<liezhi.yang@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] autogen-native: allow user to set POSIX_SHELL
	as desired
Thread-Index: AQHSz6MW7Q5pe3J2J0SZSGZTFD/7BaH5nyEAgAAUlwCAAD5Uz4AAA66AgAActU7///GqgIAAIWl6
Date: Thu, 18 May 2017 14:24:25 +0000
Message-ID: <1495117465670.44497@mentor.com>
References: <20170518065043.1662-1-awais_belal@mentor.com>
	<62e4fbc9-931b-d0dd-e71b-99002495c32e@windriver.com>
	<a577a0c9-e1df-a657-a00b-4c5cd69c4609@linux.intel.com>
	<1495106583673.65036@mentor.com>
	<62eacb9b-662a-c259-0bbf-364c488cb194@linux.intel.com>
	<1495113640541.39546@mentor.com>,
	<401f15a7-02de-d15a-443b-e68a159ba541@linux.intel.com>
In-Reply-To: <401f15a7-02de-d15a-443b-e68a159ba541@linux.intel.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.87]
MIME-Version: 1.0
Subject: Re: [PATCH] autogen-native: allow user to set POSIX_SHELL as desired
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 May 2017 14:24:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> In this case:=0A=
> http://git.savannah.gnu.org/cgit/grub.git/tree/NEWS#n159=0A=
=0A=
Ooooh, thanks :)=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>=0A=
Sent: Thursday, May 18, 2017 6:24 PM=0A=
To: Belal, Awais; Robert Yang; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] autogen-native: allow user to set POSIX_SHEL=
L as desired=0A=
=0A=
On 05/18/2017 04:20 PM, Belal, Awais wrote:=0A=
>> I just checked why is autogen in oe-core in the first place. The=0A=
>> only thing that needs it now is grub, and it will no longer be=0A=
>> necessary when Khem's grub 2.02 patch shows up in master. So then=0A=
>> we can remove the whole thing. But thanks for fixing! :)=0A=
>=0A=
> I went through Khem's grub2 changes:=0A=
> http://cgit.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/m=
aster&id=3D0af89270aa83d6ad0a4859e18643b53191567c8b=0A=
> and in those changes the grub2.inc still reads=0A=
>=0A=
> DEPENDS =3D "flex-native bison-native autogen-native"=0A=
>=0A=
> So I think this can be valuable :)=0A=
=0A=
Don't take what DEPENDS says as authoritative on the subject. :) The=0A=
only way to tell if some dependency is no longer needed is careful=0A=
inspection of upstream code.=0A=
=0A=
In this case:=0A=
http://git.savannah.gnu.org/cgit/grub.git/tree/NEWS#n159=0A=
=0A=
Alex=0A=
=0A=

