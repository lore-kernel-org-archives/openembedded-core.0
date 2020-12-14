Received: from EUR06-DB8-obe.outbound.protection.outlook.com (EUR06-DB8-obe.outbound.protection.outlook.com [40.92.51.89])
 by mx.groups.io with SMTP id smtpd.web08.36680.1607961021916954702
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 07:50:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=cjP4nUwm;
 spf=pass (domain: outlook.com, ip: 40.92.51.89, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYXjUQC9nySqNglP4MtmpTGE2rsM9w1PhTFNNQgO9x8ZzNSdRD+cH8sq/4S/ubQReF4EzZb6ySHwjBGaOmVgsw2CORIQ+ox2Zc0sQZltfP5jHYNuGe6S1QR2ibWrstfU1/NCERz8W28of98ahArc/d6XfCGiusjD/2nfh1hPpJjF/KsOBCCv4tWRO+7kbVSs0Xsw3R1ARtjTY/IXlmbTFbv9jXnV1knA+iwqkSbF2xozb4zyXzww4FGv9JQDBzwZlZ27jBc5HYBjKPyMKbekUK1VII2lF7Mv6nai6o1RohzetVu0QhrS9ySnkDeh+Jai4+HlNMb8vSuQntDd1gJ8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kcw792HB08b0fCLHox2glJl1bah9nRgHSE79mPCdBvg=;
 b=gtIrhFha8JvUhYvH1/DSx8lLER1AycGVOkqnzGoX0y0LOjutMwsOqeuQvxRjS3zq2sZKEiNFUu+UmmTc7Lp305aq4lS6JYFSA+sS9io55W1IzitCb17DTNH7dgtWprzQNQdt6RJikhXUaz6Qh0TGvOWCcB017lqd4U2pDn0usLlAFqV9A2FyszeXs5iguGiqYSUQMdZFxAvjJpbSsD3coUX7UAaNeZolXsPIOwIHBPYQbQTIXI1oI4KkFRg6pMRbCqvF9+PwnTpxGMhBbtbJ0rJ4csg6hb5XX6B9IHd88IF27ZSXacH1lcgSNIR1l1TMoU+N65Ctv2vTwqwiPiHghA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kcw792HB08b0fCLHox2glJl1bah9nRgHSE79mPCdBvg=;
 b=cjP4nUwmywNsXn8UhqYUaj6kp7V+TyJK114GlMuDR92Oqdd54lJAcDV2C+cCUPiyIQlY713NZ0v4RHC5mpc8PDUTixtOKXHm/TBuKaWQJurAqvaUWEW3LAkCZyvVv2ytPoPpZQr0veRd7EOyXT7ciPVTrVBUN+CFe6guXPipSs3TAp/nGwTi4oHdxNyW85nSkCYmKAfIOerhSL0LTyFhdJHnyBoy+X2HL3Q64LDW+/sBJxJ8QBXh53VlcoyK9dVJmuAFsGCQKv0G/tQYbysqCSwKoBS4NPPHL/I0vnwqK36NzHgSpuy86xKjj4lIE7ezAJY7A1iJolF6KviEEqx/Rg==
Received: from AM7EUR06FT042.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::45) by
 AM7EUR06HT238.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::148)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Mon, 14 Dec
 2020 15:50:20 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:fc36::4a) by AM7EUR06FT042.mail.protection.outlook.com
 (2a01:111:e400:fc36::333) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Mon, 14 Dec 2020 15:50:20 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:5583C5ED43E9602B28ED421C99CDD6DB21A2B9C8CC1F573607187DC6E38E9224;UpperCasedChecksum:F290165EAA658231D4B0B26EBE1CE5E7EA64BC30EF2AE7842F2ADC7B8F54D251;SizeAsReceived:9459;Count:48
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772%3]) with mapi id 15.20.3654.021; Mon, 14 Dec 2020
 15:50:20 +0000
Subject: Re: [OE-core] Strange segfault on native Go binaries
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
CC: "Purdie, Richard" <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
 <CAMKF1sqj0epXj_cFBniiEvYmfTgcVuCxaAfLh7_Y7oPZ==Tq1w@mail.gmail.com>
 <CAP9ODKoxVgDoMtys=aQdhteAZQ3bV7fbtLN8ZUuHehW2caLgSg@mail.gmail.com>
 <CAMKF1spBFaSKMXU77Rmx-usTw-mJN-dhbAb-=PKiFSFJ1-5hSg@mail.gmail.com>
 <CAP9ODKoPuatKkZYK0Zy-6wfPh--G7HD3bz_QDRmqDR-gRhiLnA@mail.gmail.com>
 <AM9PR09MB47393922BAC96879D84F9A8DA8C70@AM9PR09MB4739.eurprd09.prod.outlook.com>
 <CAP9ODKrCw15pXVTTqcZm3C12ZZR+i0bxKHC5UbdOQC8VvewNgQ@mail.gmail.com>
 <AM9PR09MB4739F7F2E5541EEA191395AAA8C70@AM9PR09MB4739.eurprd09.prod.outlook.com>
 <CAP9ODKp6qxtK26vncP7dhxrtm2a92N8ug+UHaDswA0N03g1E7Q@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB4739994ACF4972301B44880EA8C70@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Mon, 14 Dec 2020 16:50:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAP9ODKp6qxtK26vncP7dhxrtm2a92N8ug+UHaDswA0N03g1E7Q@mail.gmail.com>
X-TMN: [EMnRH/9If1PhBYFtBaR/S9mhnc6B8ap0]
X-ClientProxiedBy: AM5PR0301CA0021.eurprd03.prod.outlook.com
 (2603:10a6:206:14::34) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <81f21f72-41d5-0717-e372-37a6a8218d97@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.83.178) by AM5PR0301CA0021.eurprd03.prod.outlook.com (2603:10a6:206:14::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 15:50:19 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 57d348ff-3849-47ed-fae6-08d8a047f5f6
X-MS-TrafficTypeDiagnostic: AM7EUR06HT238:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4J/VucuAx3wE5XGd4/4y7gwoXqOWl3gGPYf+1VAcqno9fUowTtYblWoSpkLveW/g8hprfb0wGVJ7K2NEs2DURcqWGZva58Nhda9JDTE6xaR5PfWOOGlRWEz4sRl69fkDJ6HoLgbhKCf+xpWHv9WhNL6DCTwjFw6DLhW/we5OwYnqnYJa8FH783fGM/0LeOuUGQAAKvIWVa9kd9fcG42ujw==
X-MS-Exchange-AntiSpam-MessageData: 
	KFccg6g9aNk2Bdy3YZiJQ3xoQsz08h/yeL0GryAaJ7aHmL8CgnolRt4rzWxFzVO+SmLR33QaEYYtwCvDNQafoBOkRAYH17FlAilOr8CJM9zVB0Mcf+byizLq6COqhlDsVae96BEWHS+va50I/8sHgg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 15:50:20.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d348ff-3849-47ed-fae6-08d8a047f5f6
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR06FT042.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT238
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 14.12.20 16:25, Otavio Salvador wrote:
> Hello Konrad,
>=20
> Em seg., 14 de dez. de 2020 =C3=A0s 11:06, Konrad Weihmann
> <kweihmann@outlook.com> escreveu:
>> Had that at a bunch of my tools in meta-sca - as I couldn't rule out my
>> own fault, I help myself with the static linking workaround
>>
>> On 14.12.20 15:03, Otavio Salvador wrote:
>>>> As a partial workaround I disabled GO_DYNLINK for native - so I kind o=
f
>>>> second the impression that relocation is buggy in here.
>>>
>>> Where you did it? I tried in the 'glide-native' case but it did not wor=
k out.
>=20
> Adding:
>=20
> # Disable dnylinking
> GO_DYNLINK_class-native =3D "1"
>=20
> "solves" it, indeed.
>=20
> Richard and Khem, it seems to be related to Go itself. I'd like to
> propose we add this to the class so  we workaround it for now until we
> fix it properly.
>=20

I don't know if that a good idea - I had at least one tool that wasn't=20
even producing binaries with this hack (gosec to be exact) - so if that=20
would be added, then only as a very temporary fix. I would expect some=20
newly introduced *security* feature in go linking to cause it, but I=20
haven't found the time yet to check that in detail
