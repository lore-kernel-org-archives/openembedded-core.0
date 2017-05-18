Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id D47C4601D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 11:23:07 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=svr-ies-mbx-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1dBJWM-0000Yu-Mw from Awais_Belal@mentor.com ;
	Thu, 18 May 2017 04:23:06 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP
	Server (TLS) id 15.0.1210.3; Thu, 18 May 2017 12:23:03 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1210.000; Thu, 18 May 2017 12:23:03 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Robert Yang
	<liezhi.yang@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] autogen-native: allow user to set POSIX_SHELL
	as desired
Thread-Index: AQHSz6MW7Q5pe3J2J0SZSGZTFD/7BaH5nyEAgAAUlwCAAD5Uzw==
Date: Thu, 18 May 2017 11:23:03 +0000
Message-ID: <1495106583673.65036@mentor.com>
References: <20170518065043.1662-1-awais_belal@mentor.com>
	<62e4fbc9-931b-d0dd-e71b-99002495c32e@windriver.com>,
	<a577a0c9-e1df-a657-a00b-4c5cd69c4609@linux.intel.com>
In-Reply-To: <a577a0c9-e1df-a657-a00b-4c5cd69c4609@linux.intel.com>
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
X-List-Received-Date: Thu, 18 May 2017 11:23:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> That's right. The file is generated from libopts.def in the same=0A=
> directory. I now looked at the code finally :) and I think it's better=0A=
> to leave the POSIX_SHELL variable alone (and not set it from the recipe=
=0A=
> either because it has no effect), and go back to the original idea of=0A=
> patching the place where it's used to make a shebang line - I think=0A=
> there's only one such place in the source code.=0A=
=0A=
> But fixing libopts.def is okay too, I just think it's more trouble.=0A=
=0A=
The usage of libopts.def has been deprecated upstream: git://git.sv.gnu.org=
/autogen.git # 5cbe233387d7f7b36752736338d1cd4f71287daa but they've still k=
ept libopts.m4 so I think this patch will do for future use as well and sho=
uldn't have a problem.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>=0A=
Sent: Thursday, May 18, 2017 1:36 PM=0A=
To: Robert Yang; Belal, Awais; openembedded-core@lists.openembedded.org=0A=
Subject: Re: [OE-core] [PATCH] autogen-native: allow user to set POSIX_SHEL=
L as desired=0A=
=0A=
On 05/18/2017 10:23 AM, Robert Yang wrote:=0A=
>> +-      test -x "$POSIX_SHELL" && break=0A=
>> ++      test -n "$POSIX_SHELL" && break=0A=
>=0A=
> The problem is libopts.m4 is auto generated, so it may override=0A=
> when upgrade autogen-native.=0A=
=0A=
That's right. The file is generated from libopts.def in the same=0A=
directory. I now looked at the code finally :) and I think it's better=0A=
to leave the POSIX_SHELL variable alone (and not set it from the recipe=0A=
either because it has no effect), and go back to the original idea of=0A=
patching the place where it's used to make a shebang line - I think=0A=
there's only one such place in the source code.=0A=
=0A=
But fixing libopts.def is okay too, I just think it's more trouble.=0A=
=0A=
Alex=0A=
=0A=

