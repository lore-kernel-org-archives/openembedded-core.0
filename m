Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.92.69.53])
 by mx.groups.io with SMTP id smtpd.web09.35080.1607954748889020963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:05:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=nl46980r;
 spf=pass (domain: outlook.com, ip: 40.92.69.53, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLof3yBzjovAUI57ISPxHyRTIDsubEBrliLp09CDc3ceamT3Gu4AnkkScBZ1LhgKgHVWpazY7CUXglycC97mIDTnBZRo6/7F9LUfTiPEDcfLJku/yAPSshfAi9D8mLpNDgWUUlehDzuV/ktcei1nyHXJd7U6s0jDcCeXo7eRVMIaJWJloTZ/nszWCsiHP32yzcpmw5gqr98pOeyAnqNecJUSQXjGVXHzkcE26ncbg9Hj5porspTVjcjULUeJEQiTu/aFiZlYy/hK5aPIoLMrxgBNnC1/nI4t8CZj0CQzoXkxEfI8c8oY8WOeQ/KTai6JeyH+UHDTqhnsV8JkTxudvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gF9pUE3WjVdcix8+JPfea7BmvkDrfx46K4VgszZHro=;
 b=GYwSPRNPOF4z/ZAKzlDTajSAosOJPyMOF1YrJZ2v/onyfDJAG1/bukKBiwoCHgnSWX0lgg0r1LaUyC50xm62X3J1uhL6DzfZuTUDN9uHG2UxQnzuwsaPLiztwO3kFxjymUy34X5q/Zs4iy251DuhEK02xbq3mmzj0mOdZEKR8xjloe2Oxt2ZO3Fq9rqZY31gLgD6toHxZgzfAMCmGDGeiV9bSJU+h5NU4vyxiESunnkYoE8Yh5UYGROoPdf8b4/iCnlnnDOdqR9ol+Chth/Q28kJwxiLR8Di++gUlyS7rgBqdhAiCKE/ljf7Z8jVEdg6pdYbkiOWOWJK5rmcYw3scg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gF9pUE3WjVdcix8+JPfea7BmvkDrfx46K4VgszZHro=;
 b=nl46980rdduLzRBeUTEEMTIoVsdWBQz1I8Ks9UwZgPReenasO3psskOe4H/OmtBGDQtT4txqcrWNQXI/lIo/Plqvn9UrFdX7KAj2JrpdKv/lgWLqPftzv052lf8acb5mdQ+eWkb7q6TTBkSNgnw/4dfDPAhpi2IMlz9GnrDI8X9/HhrHIPeQ0jSVCi+pFoH5E4kXOqncfuQzcSsq9gNTShi/3pPeVZZ4u8RlPpTsnb+1o/LEfItGHHi82OM7us71dFWyPeTeoRWK6HAST+7aCdcw+QiGAG9sRVZ/ZoQ64ZKZ9qKOPFrhEYX8SPKR/GR83au2KwPk2CbJVsON8yY+9g==
Received: from VE1EUR02FT005.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1e::53) by
 VE1EUR02HT032.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1e::476)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.18; Mon, 14 Dec
 2020 14:05:46 +0000
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 (2a01:111:e400:7e1e::46) by VE1EUR02FT005.mail.protection.outlook.com
 (2a01:111:e400:7e1e::218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Mon, 14 Dec 2020 14:05:46 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:905FC300124077E09379F8112EDB445776AA3A9CDAD655528EABE0DD2D7221E1;UpperCasedChecksum:42CE3C116BCFB0D97B76B65303EFFD7EFD4F9967E303B2E5ED550ADFBD9DF144;SizeAsReceived:9306;Count:48
Received: from AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772]) by AM9PR09MB4739.eurprd09.prod.outlook.com
 ([fe80::f948:8335:6703:e772%3]) with mapi id 15.20.3654.021; Mon, 14 Dec 2020
 14:05:46 +0000
Subject: Re: [OE-core] Strange segfault on native Go binaries
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
 "Purdie, Richard" <richard.purdie@linuxfoundation.org>
CC: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
 <CAMKF1sqj0epXj_cFBniiEvYmfTgcVuCxaAfLh7_Y7oPZ==Tq1w@mail.gmail.com>
 <CAP9ODKoxVgDoMtys=aQdhteAZQ3bV7fbtLN8ZUuHehW2caLgSg@mail.gmail.com>
 <CAMKF1spBFaSKMXU77Rmx-usTw-mJN-dhbAb-=PKiFSFJ1-5hSg@mail.gmail.com>
 <CAP9ODKoPuatKkZYK0Zy-6wfPh--G7HD3bz_QDRmqDR-gRhiLnA@mail.gmail.com>
 <AM9PR09MB47393922BAC96879D84F9A8DA8C70@AM9PR09MB4739.eurprd09.prod.outlook.com>
 <CAP9ODKrCw15pXVTTqcZm3C12ZZR+i0bxKHC5UbdOQC8VvewNgQ@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM9PR09MB4739F7F2E5541EEA191395AAA8C70@AM9PR09MB4739.eurprd09.prod.outlook.com>
Date: Mon, 14 Dec 2020 15:05:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAP9ODKrCw15pXVTTqcZm3C12ZZR+i0bxKHC5UbdOQC8VvewNgQ@mail.gmail.com>
X-TMN: [IlmPMC40oq0I56+iq69nQ23EpMxlM3cj]
X-ClientProxiedBy: AM7PR03CA0004.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::14) To AM9PR09MB4739.eurprd09.prod.outlook.com
 (2603:10a6:20b:282::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <e0ac0ad6-93fb-f251-2abb-415468f222a8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.83.178) by AM7PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:20b:130::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 14:05:46 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: c43e7b7b-96fc-485b-5ed8-08d8a0395a97
X-MS-TrafficTypeDiagnostic: VE1EUR02HT032:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8RFnfqfcN93bwwz0HFNRvvReiEClTHOu3X82eBqOoIK8zjf7UF+P+K+3gz59C+V9jVQsZ9F0mxg18A0OowBEVuISaDuhIaFK+kPHp/IrVPyLgbTu5obL/x+TMqxY5T8UxXR2eiT3LxLxtfDJ5wsRzlcfNvsPiFXNqTM+BpIYlMO4DE3vMw7hmHMsurODaDEUvPWrRP7H0EH42N9awliZWA==
X-MS-Exchange-AntiSpam-MessageData: 
	ENyRemB8IzoIFbsBkGyySkhhxFJ0J9QXStg6PgmSvubVW/EyTrKTdDuE3rUGYDHQOuxWla8NcCnn2RvNYu+opu66Qc2S1S2hMSbardNTaOaTj36UcpRJOfz/nDUt5zxCU8pnlP6YXiDwOELqj8I68A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 14:05:46.5219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: c43e7b7b-96fc-485b-5ed8-08d8a0395a97
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT005.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT032
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Had that at a bunch of my tools in meta-sca - as I couldn't rule out my=20
own fault, I help myself with the static linking workaround

On 14.12.20 15:03, Otavio Salvador wrote:
> Hello Konrad,
>=20
> Em seg., 14 de dez. de 2020 =C3=A0s 09:51, Konrad Weihmann
> <kweihmann@outlook.com> escreveu:
>> I'm experiencing the same on plain Ubuntu 20.04 since 1.15.x update on
>> master (dunfell works like a charm even without any hacks) - but also
>> Ubuntu 18.04 and 16.04 based containers do show the same behavior.
>> This affects only the native variants.
>=20
> Indeed; reverting to 1.14 "fixes" it here as well.
>=20
>> As a partial workaround I disabled GO_DYNLINK for native - so I kind of
>> second the impression that relocation is buggy in here.
>=20
> Where you did it? I tried in the 'glide-native' case but it did not work =
out.
>=20
