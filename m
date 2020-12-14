Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.46])
 by mx.groups.io with SMTP id smtpd.web08.33315.1607946675912975611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 03:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=oX3pF/0k;
 spf=pass (domain: outlook.com, ip: 40.92.73.46, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjLeArAJq9i1X3d6MqzyJtFP6Fdwx7rYRbT/7ypL96J6CBsZJQVrEhIjaHc80V94eUNBcT4JYQNdi2mjeJZHxWsAzbC914i/VECbTtjgcDnf8Z/Ust9DpOJ7S7utv9+a7Atn5re6mcbaOAjNeIRN/hLLzT+DszM4GKbCpEE/66902tBCM/R1uLOfr93W577m+4x9yQz9opuAca/ZwqnZEmc2zLZigrrCnmdAmFewjboK8VtwAA0KiaYIKT+cIl++4pT5LoHkEcnk/ha9gJB6hbn/WB9Q6xrpoH6fcw6EuqS9iXJqjHuSwr5V3Nwrv6DzTiZMT3lEs7bHuvAyyW25qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKVpYyK94PCX5dpS6k1bVjk1z//nfdMV30aP9SJ3nQs=;
 b=nuqqj0d/j8VKxO7QKnXt7gaf7/OBsJ8sPH4wwZ1xKvTLuE91HRPBgaN+Vnrr+LvCrDXeriR7EsN3bklcog5eSz8OGFXhTINBEtIYDxuk3twEuIaNoA7IXvctmq7zEwJXtL3mWZ1K0OzDyLp28YAO4mn1TQaQbgaHF39fINaWUzFSobJxLQxlmPyiElodRk+TLJ+1Fffk0Ikl5CiGVxZKt3nrAjHSXf+sa+zTvVx1k8FCQGm1ASslM7KUntFPVOHJk0fOeO1EAj6wd31C9fznyRv5Imi4gZvizMIYxDgf8X6AFTZgole4+54wu3YSd+H5WyxfHbZNcw+f9rTzJ3BHMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKVpYyK94PCX5dpS6k1bVjk1z//nfdMV30aP9SJ3nQs=;
 b=oX3pF/0kNngdrX/ux/6wZONQVjokowjgC9ZVaj2DOfSdOg8rEYieeg0GKJNTWfrzjPak816ZBt8TA9OI5SiI3HYqf10IxQzGpZnEWt28s1rTzdofpsjjMpUeWLjJlGh8ABYY0Tg+kDc6FfZJD9vBMTwNc1rSOu0q9T7x5ssfFqCOXWKbfbsoxwBK/tb0pCGJeWQnIFpdgfKXpzYQoMZndCqeJV81RexobKfiu1At+6ewx+RDBx/d3zBJWRTQGqgP1rHgQvJ7Z2vju410I9ukt8srARwmqpEmOKbw20tiDTOMtIDj6AhU1PuzyFNN1hff4JkIPAUZFMmf4nPprWGpBA==
Received: from VI1EUR04FT029.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::52) by
 VI1EUR04HT226.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::246)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.18; Mon, 14 Dec
 2020 11:51:13 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0e::42) by VI1EUR04FT029.mail.protection.outlook.com
 (2a01:111:e400:7e0e::74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.18 via Frontend
 Transport; Mon, 14 Dec 2020 11:51:13 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:E245AFE2734EA7A2F122D15776ECD004E98FA192F7A0E4CA31B80650002295EA;UpperCasedChecksum:9A02B3A5DD853F6C93C9DF7AE6464E9A02B5C4D061448CC8F3474417F02A837D;SizeAsReceived:8985;Count:47
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772%3]) with mapi id 15.20.3654.021; Mon, 14 Dec 2020
 11:51:13 +0000
Subject: Re: [OE-core] Strange segfault on native Go binaries
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
 <CAMKF1sqj0epXj_cFBniiEvYmfTgcVuCxaAfLh7_Y7oPZ==Tq1w@mail.gmail.com>
 <CAP9ODKoxVgDoMtys=aQdhteAZQ3bV7fbtLN8ZUuHehW2caLgSg@mail.gmail.com>
 <CAMKF1spBFaSKMXU77Rmx-usTw-mJN-dhbAb-=PKiFSFJ1-5hSg@mail.gmail.com>
 <CAP9ODKoPuatKkZYK0Zy-6wfPh--G7HD3bz_QDRmqDR-gRhiLnA@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB47393922BAC96879D84F9A8DA8C70@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Mon, 14 Dec 2020 12:51:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAP9ODKoPuatKkZYK0Zy-6wfPh--G7HD3bz_QDRmqDR-gRhiLnA@mail.gmail.com>
X-TMN: [JhVFw+YRBmKhmr8xvxiT86LtH2k/a4n1]
X-ClientProxiedBy: AM7PR02CA0021.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::31) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <81826cb5-d811-b7ae-e4db-1b01466a4d79@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.83.178) by AM7PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:20b:100::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 11:51:12 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: c58ee8e9-1444-4d17-8be6-08d8a0268e80
X-MS-TrafficTypeDiagnostic: VI1EUR04HT226:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VSkk0nErMjahePqvgPWs7xjvgxj7g7kIksIcp15rDfU6P/p+/QX8NdXFuyMr6+kC1rc3W7hhQg7CPwalmCxl4hMAQZ//KamQ+GCN6pggRhZViaXTpd6b29R4n9+FfLSsR5xr78O5WRw3nbnx+xlM3dqhdaQuQuFigScn9aqSvi64CKrp6tx8u8g9zG+jiQbO8euXsDww68atPvHZfdm1BJllnXcnD0D9HvKrQX157lg8+M0dJjcNcUKFSvice5Eu
X-MS-Exchange-AntiSpam-MessageData: 
	zBLfyOVrr1RqRYF+k/OG6T8dH1Spcl4ij/Evt0LpOh7GivOzC26gozK3BH16rO1cIdcca3nw3qcQuDNeGPf9/2nIBS3/fK0NSwrbSVpQ5Wq7eqGLshO9J64rNTX3g3D32xCdJqpOcHSjp4oGtOCJOg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 11:51:13.1900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: c58ee8e9-1444-4d17-8be6-08d8a0268e80
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR04FT029.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT226
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I'm experiencing the same on plain Ubuntu 20.04 since 1.15.x update on=20
master (dunfell works like a charm even without any hacks) - but also=20
Ubuntu 18.04 and 16.04 based containers do show the same behavior.
This affects only the native variants.
As a partial workaround I disabled GO_DYNLINK for native - so I kind of=20
second the impression that relocation is buggy in here.

On 14.12.20 12:31, Otavio Salvador wrote:
> Hello Khem,
>=20
> Em seg., 14 de dez. de 2020 =C3=A0s 00:49, Khem Raj <raj.khem@gmail.com>=
 escreveu:
>> On Sun, Dec 13, 2020 at 6:52 AM Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>> Em s=C3=A1b., 12 de dez. de 2020 =C3=A0s 23:30, Khem Raj <raj.khem@gma=
il.com> escreveu:
>>>> On Sat, Dec 12, 2020 at 3:52 PM Otavio Salvador
>>>> <otavio.salvador@ossystems.com.br> wrote:
>>>>> And this segfault is also happening inside the build. I ran the
>>>>> readelf on them and it seems to have been modified to use the
>>>>> uninative libc loader but I am in doubt how if this is the culprit.
>>>>> Can someone shed any light on this?
>>>>
>>>> it seems relocation is not working in some cases. whats your host
>>>> distro, are you using gold linker by any chance.
>>>
>>> Ubuntu 20.04 inside Docker
>>>
>>> The features are: DISTRO_FEATURES =3D argp ipv4 ipv6 systemd ldconfig
>>
>> Does it happen outside docker ?
>=20
> Yes as it fails on our CI as well; however in this specific host I
> cannot avoid the Docker use as my host is NixOS.
>=20
> How can I debug it?
>=20
>=20
>=20
>=20
>=20
