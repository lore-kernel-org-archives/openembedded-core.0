Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.92.69.99])
 by mx.groups.io with SMTP id smtpd.web10.1454.1607021502224858486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 10:51:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=RhxdQusI;
 spf=pass (domain: outlook.com, ip: 40.92.69.99, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8oG14VEvlXlbbLnoHs5T11ph9EpojIqAS+xVEbKFbe0+V8yr3+vOr5MYu6MfyQfigbRRN2a5aNtSDrbNU2d1PiOWNoagLTp9f/2gND6lRulVEZfTTmdt686YjZvwO7lzMIMoKCrIPTIMuLHeJvXccgNE3c8xKFj21fp6+E1JsIcHt62/Tk0+2NEecnwaQwrm9HkkM9P1NZrFL4X33EKeZDI5NCcBHzG1dwYVwKKBZlsh3z2ay5D+mMqzAOAcNsKl8LEI2sJ9r0pq+2KXtByNSJqy3Em4XNscw4yiGgR34curLaFU2rgcwPCtd6H1l9Lbux1wHjgk9X7db3l4IKSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yHbtyoiBVFTvOeKgU7RelOltN1Vpvbr64sORvBnbPQ=;
 b=B9b2bULNeR47jU2wMjSAxNx0Fq6MVSwNxo1UptBzEUImqx+cpiXTC4TZY2j4JiG5trD2WqO9SR6IJ5EkiharYeXDiG63yScQ+A+6Nf2y/DFehWS2Lq5dljJlnOLMP5HL0nmSzyJc9lO2fgJYeEK70zWtEu3MmdFOAUfdSQqL4wxYMIvcynU+/YgzfEUjoblVggQqD7VJnD7SZsZOXeFKp2aRuEmD+lvHtSV7uJbemkLHosUXCdPO7dCmiSQVLEs2QsLLTWFhKvLocstg8VV9AUcdTxgdli3d1jICpTHSOEi0J5dwjTbodf/jM5QM4VuLhHQ9ItwQg6qrlrtCr2Ni+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yHbtyoiBVFTvOeKgU7RelOltN1Vpvbr64sORvBnbPQ=;
 b=RhxdQusIGf+y9LeTwkiFV5jyT2fodLBe4JvNCi/7p4SGQC5EnNR36G2fSo/l9vk+QBoFUIP9z299aI9DDiL7uSGJaVRCVyv/6a0fZ4PMr7omQ5N3CvqiEyxt4BTGjLKPYaNFbDz2qZ0Is6s8T+KHCXE0mPhKj+kvpjl6vEXI+ASfxF3UVorf43pDkQOqitzceprp7JT3s7Giprco/36/6DJ6uAWAtgPhBW6qsLkVmn1uPHJKeLxm+Y0kczA9SXVeoiCOqEoluw2++CTbZTG06WxEkR3/JGDgcSTPAEJXO7DHMtdp/HHYhDkjpw5AVIGDq+sUYoDcTLMduJzpVCTPtg==
Received: from VE1EUR02FT045.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1e::4c) by
 VE1EUR02HT033.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1e::292)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 18:51:39 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:7e1e::47) by VE1EUR02FT045.mail.protection.outlook.com
 (2a01:111:e400:7e1e::192) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 18:51:39 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:87E93DC4BD9BAFFA1AF495C8D407B370932F6807FB941C433B98FC6F00644DAA;UpperCasedChecksum:C356622E8EC9441CB194081F41BC7FFBE553F8CA495AEA0E0CA42D50F35E69E7;SizeAsReceived:8752;Count:47
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::b58c:71c0:5d82:ffdb]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::b58c:71c0:5d82:ffdb%4]) with mapi id 15.20.3632.019; Thu, 3 Dec 2020
 18:51:39 +0000
Subject: Re: [OE-core] Automatic cap on BB_NUMBER_THREADS and PARALLEL_MAKE
To: openembedded-core@lists.openembedded.org
References: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
 <CANNYZj_cQy2di0z7ianh59q-gXsDPR4uxZ0xZLQRLxx9PUu7sA@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB47394AA43211FA1CCC3F2286A8F20@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Thu, 3 Dec 2020 19:51:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CANNYZj_cQy2di0z7ianh59q-gXsDPR4uxZ0xZLQRLxx9PUu7sA@mail.gmail.com>
X-TMN: [hz/xs9ij7m/+yX2A35jsTpvVkak2w6dH]
X-ClientProxiedBy: AM7PR04CA0020.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::30) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <b19c8776-b654-0584-6d9e-deccd0330536@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.94.246) by AM7PR04CA0020.eurprd04.prod.outlook.com (2603:10a6:20b:110::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 18:51:39 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: d6cf8b9e-d063-4c21-85c0-08d897bc77f8
X-MS-TrafficTypeDiagnostic: VE1EUR02HT033:
X-MS-Exchange-MinimumUrlDomainAge: yoctoproject.org#3738
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cL/b9+1X19B2ElgbVx8hlJRqB1a2bfcv7a7si6B86N+9kRTdsMuW95sMgjlsaxNQ74xmE9b8FZIYrVbz13EJreJVROpukJ1REBcyYioUkbY5lHmUuiSakipthsjFjETSB95Wv5f31lVbNbq5zPQIytGG/SYIanMZPmwprG2s1t8FgQr+j0573lKGP489xqqv5Pxx3D9M76WOvZqSnohQ7JQ7PW8/iEkPhvYeZ9w3zU/+yPbIJ8yQ7UdgMQ4u5pFn
X-MS-Exchange-AntiSpam-MessageData: 
	pDvFufupDmRsnR05oj5qGaZXDnMmqDgpft9bBQgtBfrEbmibIXvfuGADJGLedyzX9tvSzvdflf+FspEJuKGdsV/6xzzyY9X22B+YEbp61r6L+ntAXNUXkDbml+T8w3TuZ3YhYGATisCOGGlyKfXWqQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6cf8b9e-d063-4c21-85c0-08d897bc77f8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 18:51:39.8423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT045.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT033
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

+1 for Alex's comment.
As I/O (and potentially RAM) is clearly the bottleneck here, limitation=20
to some arbitrary value doesn't address the issue at the right end.
I would rather see real resource management.
 From my point of view there is a huge difference if I package like 128=20
shell scripts in parallel or invoke 128 gcc linker runs

On 03.12.20 19:20, Alexander Kanavin wrote:
> I'd rather teach bitbake to abstain from starting new tasks when I/O or=
=20
> CPU gets tight.
>=20
> Alex
>=20
> On Thu, 3 Dec 2020 at 18:48, Ross Burton <ross@burtonini.com=20
> <mailto:ross@burtonini.com>> wrote:
>=20
>     Hi,
>=20
>     Currently, BB_NUMBER_THREADS and PARALLEL_MAKE use the number of cor=
es
>     available unless told otherwise.=C2=A0 This was a good idea six year=
s
>     ago[1] but some modern machines are moving to very large core counts=
.
>=20
>     For example, 88 core dual Xeons are fairly common. A ThunderX2 has 2=
56
>     cores (2 sockets, 4 hyperthreads per physical core). The Ampere Altr=
a
>     is dual socket 2*80=3D160 cores.
>=20
>     At this level of parallelisation the sheer amount of I/O from the
>     unpack storm is quite excessive.=C2=A0 As a strawman argument, I pro=
pose a
>     hard cap to the default BB_NUMBER_THREADS of -- and I'm literally
>     making up numbers here -- 32.=C2=A0 Maybe 64.=C2=A0 Comments?
>=20
>     Cheers,
>     Ross
>=20
>     [1]
>     http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D1529ef05=
04542145f2b81b2dba4bcc81d5dac96e
>=20
>=20
>=20
>=20
>=20
>=20
>=20
