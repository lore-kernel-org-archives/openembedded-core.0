Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.51])
 by mx.groups.io with SMTP id smtpd.web10.16248.1607246100378325031
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Dec 2020 01:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=GsQpzanM;
 spf=pass (domain: outlook.com, ip: 40.92.90.51, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/JvdkBKmdztzfUlK3XitdWo/oVkyvCyRcQUb0jIB/y9+Nu3xMBbj+pxBVmjU6Cy2Tv6O/1azDP3JQbi9hkJsZ0v+6pJBDnISyDHQ4UQnSJhLI1y9CdNl8RLcnRV2d+67rxUHX+Uf+BqekumtOfjOISxQeGiZWGXAVgyNMm+39myELBy2EQ1JumvndcVNao73kwU9OBNeOxeHqcog6Ker4Qn1/jY7ygdjv5tFLmFIQmUOvgZ3cYcoBJpPo0Z70i9EbPp2aFWo3oXMqGHrwH8XQZEtJJfxLAMsWyCfyOJPJJn4QJ0KNWKz/5pUjP2OrE2V46GC+tOMcEZvkA+ImizeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEFFau4ndBtSgGC8Ga1f9BD/ftpDonaXC9ap+Nuv2PI=;
 b=lggNdzr3g+UwwuTK01f5swhcKHlXZWmdAdUqOIF+vzPVRFqLCx1JrebsvRCBTPePTUiuLMGEeiEgZrRdNciRujtJZY0I2NZQ0Z4lfa6JqZ79n0FMWM0qwlAICuCe/KGLJwvGho4kp/TQdP6nhDZotWCNMkR452zRdAYXZ/tI8Jk6qLQumzoBzspYHlxH3Lheqizm0IlMC7wDkWjvCPM+qnoT8lyVOVTlXQE/QdA3GmEZzYWIn+JMm7jHdWkgjkLjXJQiBDNV1BsJegVF3kQULzFDRI3SGpBv+Zs5e7nMh1ieQCCPn5V4lQ4pFERuRFduvqZQMMLU+teL+W9jpBtvjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEFFau4ndBtSgGC8Ga1f9BD/ftpDonaXC9ap+Nuv2PI=;
 b=GsQpzanMrPbKDKBp2T2UkmaK0+rgfuw23GgYHYMrbk4I5b7N4FL/iZOD8RtGwFiBcQbamp2yhrkssyIojEnDRPBd3U93qEluxL2EPwpJBanO92Kn8VlVWcfZHxiRuSHdU9zFQQk9wedanTqSV7RSfnupegGbWebJRrgx3oFn5Se1YQU/U/I9LtoagJbqKQdnrLYRU3gWGzNNNtjAe8L2HQDYbC1ocAphtoAVtjSoIGyYaviUUv6h5+sw4hds+gN7JMz2ctAPQGfXveFkjroBEwWIZehDoxmxnzKF9eXy9h+w+Z6gXIG/EoI0nCp3beK8pdoFwX/8Z+qkx81poU8frA==
Received: from VI1EUR05FT061.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::4a) by
 VI1EUR05HT120.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::167)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Sun, 6 Dec
 2020 09:14:57 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:fc12::45) by VI1EUR05FT061.mail.protection.outlook.com
 (2a01:111:e400:fc12::254) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Sun, 6 Dec 2020 09:14:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:0F68390D7921F7FBB74EB8763A1D936B469A895F85E08BEB8258F57DB64086F9;UpperCasedChecksum:8B330009CA0F4A04636ECBEA1C858DD2BBE6BE76142A4EABFC30C7FFF801BC9A;SizeAsReceived:8730;Count:47
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::b58c:71c0:5d82:ffdb]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::b58c:71c0:5d82:ffdb%4]) with mapi id 15.20.3632.023; Sun, 6 Dec 2020
 09:14:57 +0000
Subject: Re: [OE-core] Python packaging without setup.py (PEP-517)
To: openembedded-core@lists.openembedded.org,
 "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>
References: <CANx9H-DhYETCc5qAcneZkyBvPTAL7qg6M8+3n4RAjG331B6eTQ@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB47391C6ECF73C6C19CF76B3BA8CF0@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Sun, 6 Dec 2020 10:14:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CANx9H-DhYETCc5qAcneZkyBvPTAL7qg6M8+3n4RAjG331B6eTQ@mail.gmail.com>
X-TMN: [eQ0cZwomHNyPxI23IrP5+HoW8rzOanAs]
X-ClientProxiedBy: AM6PR02CA0032.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::45) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <190473d9-a88b-edd3-72df-7164525918f9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (79.215.14.29) by AM6PR02CA0032.eurprd02.prod.outlook.com (2603:10a6:20b:6e::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Sun, 6 Dec 2020 09:14:57 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4c3d697c-6382-4b02-2014-08d899c766b3
X-MS-TrafficTypeDiagnostic: VI1EUR05HT120:
X-MS-Exchange-MinimumUrlDomainAge: yoctoproject.org#3741
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OnNQkmTDhrLxqXzpGK2ZAFd0b+mclIZhIurjqAlU1ZsrHxcxSR2My3kizZiDrPlKcFTsSMiue26UVMh6e2RTnlfK+o2Xu5fsmXNODwAbH6fEsa5GIsRxdnMowufutGS3wPQCFpymeciAjYg5KEubeHO5GthSQp9JMgwWW0uyTPUdZBzDsRJa3vO4AQN01RTWwiggOQrZb783ismMMQ2JZLDhHIJwpXffCD0B6gBY0GZuQUWcZ4oJydHGz4phnBPm
X-MS-Exchange-AntiSpam-MessageData: 
	9mBUsK8x04IeYkGnzl91fhw20QMGk9tQuXkzeV/lm3aHvplqsJJP3XK1ioJQFold0dtni/E2pZMBiZi7I2WKWNKwNrq4rjF0OcvaRkMuxogwoenz6flkR158Y/4mH7SbTMZH7JwFWuNQkDAFAQ1dyw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3d697c-6382-4b02-2014-08d899c766b3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2020 09:14:57.6518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR05FT061.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT120
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Thanks Tim, for taking this discussion. I'm really glad to see that=20
upstream finally recognizes our use case. Unfortunately as that looks=20
pretty "beta" to me so I will keep on with the tiring process of filing=20
tickets at upstream.
Same goes btw for missing license information in the distribution=20
tarballs (or now upcoming wheels).
Also I'm slightly worried that it will all spiral into requiring always=20
the latest of e.g. setuptools, which could turn into a problem for=20
non-master branches (already have these issue on zeus a lot lately)

On 06.12.20 00:40, Tim Orling wrote:
> Thanks to Konrad Weihmann, we have some communication occurring=C2=A0wit=
h the=20
> Python pypa folks about an important change in Python packaging [1][2].=
=20
> This change is defined in PEP 517 [3][4]. Essentially, setup.py files=20
> will go away and wheels will be preferred over eggs. To make this more=
=20
> straight forward for distros, the pypa folks have created pypa/build=20
> [5][6]. Currently, there is no installer for wheels other than pip, but=
=20
> this is under active development [7].
>=20
> I have begun a WIP branch to support this new packaging mechanism [8].=
=20
> Folks in our OE/YP Python community have actually been wishing for a way=
=
=20
> to install wheels for a while now... no promises on that working=20
> (installing random wheels off the internet is not a design goal), but we=
=
=20
> will at least be able to build wheels.
>=20
> Cheers,
>=20
> --TIm "moto-timo" Orling
>=20
> [1] https://github.com/pypa/packaging/issues/369
> [2] https://www.yoctoproject.org/irc/%23yocto.2020-12-05.log.html
> [3] https://www.python.org/dev/peps/pep-0517/
> [4] https://discuss.python.org/t/pep-517-workflow-for-distributions/5959
> [5] https://pypa-build.readthedocs.io/en/latest/
> [6] https://github.com/pypa/build
> [7] https://github.com/pradyunsg/installer
> [8]=20
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dtimo/pyt=
hon-pep-517
>=20
>=20
>=20
>=20
