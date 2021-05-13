Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.92.71.58])
 by mx.groups.io with SMTP id smtpd.web10.2001.1620936176917993920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 13:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=V9dmT+n+;
 spf=pass (domain: outlook.com, ip: 40.92.71.58, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVbLaK7HyuR05blIMz0LOUDzkH8Sh8o5Cv8K/2XCLTr/B5hxcqyQ6iH+tcoCA6tIZhrTyFVq0CG24LyDmAvvQiWJLbCBcm67abzSxpaaLXv6mQfk9q8390ZJ4KcMbQKb/v8LX8BVUW9q8fjnvGl0JkxG0n6QWgddYY4vLDtmKVdIN4rCp8oaHOpEyxe/np56XM+bXncmthVPRijjjJdtDayoweq9PKUNlA9W9AZntIqFJL8+4+KAH7dd5Y4K+5ASmNTkk9OaFwoSt8qH2ixYRY2DNZnAto2UyhWYOnK1jYi42We8qYcASMhRdttu/hAhjuNWMwOJJU0G/LQY2J2doA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuT9yHB/mVVJdxepslED+byeDww1J4ruCvzZrkHFzO8=;
 b=LKsft4n1qNYIjrZBZQenlFRCZS6+YLf8EO7ekClgTozCyPVF2YKRbIZGNZfTMyr9TvFwHRtFzaX1nI0HjeU6SMdEc+l0yzL+PYcLcm4rTpbHPbqdeXS1HDydur3uXxO9cCu3K+7ULugyepnZ8YnzWC8B6wsv3V/7ZV4n7NtY1KmxJibJL+/9LMvvd+nFvVmU5nmekGj2uOFpgXouM7rHZnkk2tu+iibYSoTzrsvbgSwn7mjlnwxGriCK2YbBN2NOIG+bW3RenR4WRkvOwGDj97lDZQQ3aXPE5WNsqtkSzVn0e4lJpe8opD9oSmnERMUFQqZSPIcVIJEtisXbsKgIsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kuT9yHB/mVVJdxepslED+byeDww1J4ruCvzZrkHFzO8=;
 b=V9dmT+n+6u9pZR9ZR14mmm+/Ks5UgAdo7XXMdU+umd7VResRQz/JK3h6oYo1QgVIycp8gjMjHV/WIRoUa3ElmK91+hHdmbYHHak6syINuK7M+wHMreOvRlzDHVphVCtu1Ca9Z0dBbt0rHmiuXU0E/w+u5dfdtWKl7yR5+ckhGY8yaSFoeSJfPxhzh9A6AX/Xm4DKvpOt5a9EAoucTA9e0sDBOiyPjXqMaUovmVlDsrn+0vCajSfrirDGHLQttg+C7Wk8saMgw1SZNgE7Lj6Akl5p7niRiuDfaZJUgTQzxhA2nnVKSae4QvIrUc3AjoZO/pq036s5q8IdPQqrPRvdrg==
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2a01:111:e400:7e0a::4f) by
 DB5EUR03HT173.eop-EUR03.prod.protection.outlook.com (2a01:111:e400:7e0a::314)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 20:02:55 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0a::43) by DB5EUR03FT003.mail.protection.outlook.com
 (2a01:111:e400:7e0a::157) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Thu, 13 May 2021 20:02:55 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:746A7D3A6A1F1D8BA4F0DF29B2C46E3451119D8DB247F3BC74D4C5260D578227;UpperCasedChecksum:B8E8CC16F1846CFBA408430FF8FE1F9278F0A819AF1D9FFAB4BDE09BCD91E43A;SizeAsReceived:8718;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::9c9b:9858:17df:de84%6]) with mapi id 15.20.4129.026; Thu, 13 May 2021
 20:02:55 +0000
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: openembedded-core@lists.openembedded.org, bgilbert@backtick.net
References: <CANNYZj_LDz9xV9iCW-N03xcGho0S12AaCQEvLb54UJw40FYPMw@mail.gmail.com>
 <5132.1620935649772798876@lists.openembedded.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB4642551E3722EA1674326F80A8519@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 13 May 2021 22:02:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <5132.1620935649772798876@lists.openembedded.org>
X-TMN: [VQC3hmbch+8yIxUj9SD7RZblQuQ0KhXS]
X-ClientProxiedBy: AM6P192CA0007.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::20) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <02c36809-f12d-75a1-cfd8-a5fb60b22c5d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.89.54) by AM6P192CA0007.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Thu, 13 May 2021 20:02:54 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: d4b37863-7ac5-4ebf-4aab-08d9164a18a9
X-MS-TrafficTypeDiagnostic: DB5EUR03HT173:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BWQCkXmvKojVj7MKn+tfopdSqWgtBi/jsN5S4+oeZ5JwrW1eFyZTL7KQHfBwA5iJdy4G0GW5TR7+TINIWXlmTyLnYVq4bteVDuv/W+SDF5n/KExe6DAzNbPc6mt1W05EPeqeVX8N06kSN4GRdKaIIwlxRMiMBCeUBE3CBNxstr07aOaICeRd+1sOPwXNItJ+sHy6xIEE8ZmeZo5Vt1bvFAIJINFDT1IA7Lv4P4KieImWq3NornslGP3VX+N2PDQZQG58409s2ORTGfUIJJL9arwTSLK9yqjMf0ZVN13hqXplopuhS73zYBJy01wPxrSxfLywrZCYuYmwITRxXt34Rw2loxLPPdU1cidnepSqWHGQbFAsCp8YfWXLAKx+AUWq2Wj2ROrHp4MILcvMA0NEmrZCxsFAQABhD9fA9fhhbcDMaZ7UMBDmWsnf7eezF81l/wTXJQ6jyOIF7/kSuAElL23anN/ff6zmTrtW5+ze3bo=
X-MS-Exchange-AntiSpam-MessageData: 
	YYKjyjREuGovoEzzY8eiwXKX5H78PhxGBkU8KygSXI/FKujLLPJRn3P03in5iRUFGjOhmi9KRto73+zUt0dmCnegfHAaly++l/zuKobMB4+RNIeYgNA0oRBwgiPnpWMFNcbrFD9ENK40KImwllTLag==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b37863-7ac5-4ebf-4aab-08d9164a18a9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 20:02:54.9492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT173
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 13.05.21 21:54, Benjamin Gilbert wrote:
> On Thu, May 13, 2021 at 12:36 PM, Alexander Kanavin wrote:
>=20
>     They're not useless though. As a layer maintainer I absolutely want
>     those checks, as I want to be aware of any branch configuration
>     changes upstream, and to ensure I'm not accepting a change in source
>     revision that points to an unattached commit, or one from a branch
>     that's not supposed to be used at all.
>=20
> Yup, if downstream packagers want to manually review such cases, no=20
> objection from me.=C2=A0 My concern is upstream getting bug reports that=
 say=20
> "please reinstate this branch and never delete it again or you'll break=
=20
> our builds".=C2=A0 See https://github.com/ostreedev/ostree/issues/2360=
=20
> <https://github.com/ostreedev/ostree/issues/2360> and=20
> https://github.com/coreos/go-systemd/issues/371=20
> <https://github.com/coreos/go-systemd/issues/371> for examples.

But the genie has been out of the bottle already - revision x was=20
published on branch y - so for me changing the (branch, revision) tuple=20
is as suspicious as a forced rewrite.

>=20
> Best,
> --Benjamin Gilbert
>=20
>=20
>=20
>=20
