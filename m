Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RcZRr-0000kI-Kh
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 10:23:55 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2011 01:16:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103723010"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 19 Dec 2011 01:16:51 -0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 19 Dec 2011 17:16:46 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Mon, 19 Dec 2011 17:16:45 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Dec 2011 17:16:44 +0800
Thread-Topic: [OE-core] [PATCH 1/1] socat: add the latest stable version
	1.7.2.0
Thread-Index: Acy+LEmUAceKH/BlQOmpBBhNW9Zl8AAAXBUQ
Message-ID: <1865303E0DED764181A9D882DEF65FB6EA8B6E113E@shsmsx502.ccr.corp.intel.com>
References: <cover.1324272052.git.dexuan.cui@intel.com>
	<5f5f0083a3fa9afa2081b1cca3dfda03b0fb7f76.1324272052.git.dexuan.cui@intel.com>
	<9D240952-C22F-4CC9-8BF8-CFBA5D21F372@dominion.thruhere.net>
In-Reply-To: <9D240952-C22F-4CC9-8BF8-CFBA5D21F372@dominion.thruhere.net>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] socat: add the latest stable version	1.7.2.0
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
X-List-Received-Date: Mon, 19 Dec 2011 09:23:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote on 2011-12-19:
>=20
> Op 19 dec. 2011, om 06:22 heeft Dexuan Cui het volgende geschreven:
>=20
>> +DEPENDS =3D "openssl"
>> +
>> +LICENSE =3D "GPLv2+"
Hi Koen,
Thanks very much for the comment!=20

> Linking GPL and openssl is not allowed due to the advertising clause=20
> in BSD. The socat people realized that and say:
"the advertising clause in BSD"?=20
I suppose you meant "the advertising clause in openssl license"?

> license
> -------
>=20
> socat is distributed under the terms of the GNU GPL; except for=20
> install-sh, which is copyright MIT, with its own license;
>=20
> In addition, as a special exception, the copyright holder gives=20
> permission to link the code of this program with any version of the=20
> OpenSSL library which is distributed under a license identical to that=20
> listed in the included COPYING.OpenSSL file, and distribute linked=20
> combinations including the two. You must obey the GNU General Public=20
> License in all respects for all of the code used other than OpenSSL.
> If you modify this file, you may extend this exception to your version=20
> of the file, but you are not obligated to do so. If you do not wish to do
> so, delete this exception statement from your version.
My understanding is: the author of socat allows us to link socat to the lib
openssl?

Koen,=20
I'm really not good at the license stuff at all. Could you please explain
the situation in more details?
What need we do if we want to add the socat recipe into poky? It has
already been in OE for a long period of time.
=20
Thanks,
-- Dexuan




