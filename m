Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RcWbh-0004Nu-LL
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 07:21:54 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2011 22:14:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87967668"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 18 Dec 2011 22:14:49 -0800
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 19 Dec 2011 14:13:52 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Mon, 19 Dec 2011 14:13:52 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Mon, 19 Dec 2011 14:13:50 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Date: Mon, 19 Dec 2011 14:13:49 +0800
Thread-Topic: [OE-core] [PATCH 1/1] wget: fix a host intrusion issue
	introduced by adding --with-ssl=openssl.
Thread-Index: Acy+EEUC59JfiuX3RNWS35gmPMa5fQABHBiA
Message-ID: <1865303E0DED764181A9D882DEF65FB6EA8B6E0FA7@shsmsx502.ccr.corp.intel.com>
References: <cover.1324271587.git.dexuan.cui@intel.com>
	<33eb9cf534f8e946cf8cb2d67d64b47f193a89e7.1324271587.git.dexuan.cui@intel.com>
	<4EEECD7D.7030807@eukrea.com>
In-Reply-To: <4EEECD7D.7030807@eukrea.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] wget: fix a host intrusion issue introduced by adding --with-ssl=openssl.
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
X-List-Received-Date: Mon, 19 Dec 2011 06:21:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Eric B=E9nard wrote on 2011-12-19:
>>   inherit autotools gettext update-alternatives
>> -EXTRA_OECONF =3D "--with-libc --enable-ipv6 --with-ssl=3Dopenssl"
>> +EXTRA_OECONF =3D "--with-libc --enable-ipv6
>> --with-libssl-prefix=3D${STAGING_DIR_HOST} --with-ssl=3Dopenssl"
>>=20
>>   do_install_append () {
>>   	mv ${D}${bindir}/wget ${D}${bindir}/wget.${PN}
>=20
> this also fix a problem I just met (angstrom, armv5 target) :
>   | configure: error: --with-ssl=3Dopenssl was given, but SSL is not avai=
lable.
> Tested-by: Eric B=E9nard <eric@eukrea.com>
Hi Eric,
This is actually the same issue Steve and I met with. :-)

Eric and Steve, thank you both for the testings!

Thanks,
-- Dexuan




