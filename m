Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Rca2t-000288-CU
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 11:02:12 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 Dec 2011 01:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="87179488"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by azsmga001.ch.intel.com with ESMTP; 19 Dec 2011 01:55:07 -0800
Received: from pgsmsx103.gar.corp.intel.com (10.221.44.82) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 19 Dec 2011 17:54:08 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX103.gar.corp.intel.com (10.221.44.82) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 19 Dec 2011 17:54:07 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Mon, 19 Dec 2011 17:54:06 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Dec 2011 17:54:05 +0800
Thread-Topic: [OE-core] [PATCH 1/1] socat: add the latest stable version
	1.7.2.0
Thread-Index: Acy+MaHra00uvjOfTfuy1ZBOI78TlgAAk05w
Message-ID: <1865303E0DED764181A9D882DEF65FB6EA8B6E116C@shsmsx502.ccr.corp.intel.com>
References: <cover.1324272052.git.dexuan.cui@intel.com>
	<5f5f0083a3fa9afa2081b1cca3dfda03b0fb7f76.1324272052.git.dexuan.cui@intel.com>
	<9D240952-C22F-4CC9-8BF8-CFBA5D21F372@dominion.thruhere.net>
	<1865303E0DED764181A9D882DEF65FB6EA8B6E113E@shsmsx502.ccr.corp.intel.com>
	<A35AA859-7150-4E0C-AEF0-A3B2FD044796@dominion.thruhere.net>
In-Reply-To: <A35AA859-7150-4E0C-AEF0-A3B2FD044796@dominion.thruhere.net>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] socat: add the latest stable version 1.7.2.0
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
X-List-Received-Date: Mon, 19 Dec 2011 10:02:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote on 2011-12-19:
>=20
> Op 19 dec. 2011, om 10:16 heeft Cui, Dexuan het volgende geschreven:
>=20
>> Koen Kooi wrote on 2011-12-19:
>>>=20
>>> Op 19 dec. 2011, om 06:22 heeft Dexuan Cui het volgende geschreven:
>>>=20
>>>> +DEPENDS =3D "openssl"
>>>> +
>>>> +LICENSE =3D "GPLv2+"
>> Hi Koen,
>> Thanks very much for the comment!
>>=20
>>> Linking GPL and openssl is not allowed due to the advertising clause=20
>>> in BSD. The socat people realized that and say:
>> "the advertising clause in BSD"?
>> I suppose you meant "the advertising clause in openssl license"?
>=20
> Yes, indeed
>=20
>>=20
>>> license
>>> -------
>>>=20
>>> socat is distributed under the terms of the GNU GPL; except for=20
>>> install-sh, which is copyright MIT, with its own license;
>>>=20
>>> In addition, as a special exception, the copyright holder gives=20
>>> permission to link the code of this program with any version of the=20
>>> OpenSSL library which is distributed under a license identical to=20
>>> that listed in the included COPYING.OpenSSL file, and distribute=20
>>> linked combinations including the two. You must obey the GNU General=20
>>> Public License in all respects for all of the code used other than Open=
SSL.
>>> If you modify this file, you may extend this exception to your=20
>>> version of the file, but you are not obligated to do so. If you do=20
>>> not wish to do so, delete this exception statement from your version.
>> My understanding is: the author of socat allows us to link socat to=20
>> the lib openssl?
>=20
> Correct. I don't know what happens when you include socat in a GPL=20
> product, but that's for other people to worry about :)
>=20
>> Koen,
>> I'm really not good at the license stuff at all. Could you please=20
>> explain the situation in more details?
>=20
> From what I've understood the advertising clause is consired a=20
> "restriction" by the GPL and hence incompatible. Since openssl is so=20
> widespread and gnutls so buggy the exception was invented to allow openss=
l to link with gpl software.
>=20
>> What need we do if we want to add the socat recipe into poky? It has=20
>> already been in OE for a long period of time.
>=20
> Some googling suggests that 'GPL-2.0+-with-OpenSSL-exception' is SPDX=20
> compatible, so we could put that in LICENSE.
Thanks a lot for the suggestion!

Please review/use the new patch:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/soc=
at-v2&id=3D896e5e9f9ca387d832d423a1e16ad918d473c4cc

Thanks,
-- Dexuan




