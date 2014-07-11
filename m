Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 201E0703A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 11:47:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,642,1400018400"; d="scan'208";a="54744562"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 11 Jul 2014 13:47:41 +0200
Received: from COSNADEXC13.usr.ingenico.loc ([169.254.1.156]) by
	COSNADEXC21.usr.ingenico.loc ([10.31.4.221]) with mapi id
	14.03.0174.001; Fri, 11 Jul 2014 13:47:41 +0200
From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] libav: add PACKAGECONFIG for theora,
	libvorbis, speex and openssl
Thread-Index: AQHPnNJ/XlmlgL3ls0q17myQTtn7XpuawSVA
Date: Fri, 11 Jul 2014 11:47:40 +0000
Message-ID: <8672BB614B4CCA40A6B3BDD6FD82050BA8B25636@COSNADEXC13.usr.ingenico.loc>
References: <1404138201-22662-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<20140630164039.GC2437@jama>
	<C147EF5C-664D-45FD-BA7C-020B54702266@dominion.thruhere.net>
In-Reply-To: <C147EF5C-664D-45FD-BA7C-020B54702266@dominion.thruhere.net>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.31.16.119]
MIME-Version: 1.0
Subject: Re: [PATCH v2] libav: add PACKAGECONFIG for theora, libvorbis, speex and openssl
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
X-List-Received-Date: Fri, 11 Jul 2014 11:47:45 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Koen,

Something like this (in a small python function) would be acceptable?

d.setVar('LICENSE', 'CLOSED')

Regards,
Matthieu


-----Message d'origine-----
De=A0: Koen Kooi [mailto:koen@dominion.thruhere.net]=20
Envoy=E9=A0: vendredi 11 juillet 2014 08:37
=C0=A0: Martin Jansa
Cc=A0: Matthieu CRAPET; openembedded-core@lists.openembedded.org
Objet=A0: Re: [OE-core] [PATCH v2] libav: add PACKAGECONFIG for theora, lib=
vorbis, speex and openssl

[...]=20

>> +# Check codecs that require --enable-nonfree USE_NONFREE =3D=20
>> +"${@bb.utils.contains_any('PACKAGECONFIG', [ 'faac', 'openssl' ], 'yes'=
, '', d)}"
>>=20
>> EXTRA_OECONF =3D " \
>>     --enable-shared \
>>     --enable-pthreads \
>>     --enable-gpl \
>> +    ${@bb.utils.contains('USE_NONFREE', 'yes', '--enable-nonfree',=20
>> + '', d)} \
>=20
> cannot you just pass --enable-nonfree in faac and openssl PACKAGECONFIG?
> In worse case when both are enabled the option will be added twice.

If you have nonfree enabled, you need to change the license as well, it won=
't be GPL anymore.

regards,

Koen


