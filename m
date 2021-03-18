Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.41])
 by mx.groups.io with SMTP id smtpd.web10.9079.1616075322080092520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 06:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=RpOtFH5c;
 spf=pass (domain: topicproducts.com, ip: 40.107.2.41, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6la31D6z2EDRkBARBOOXX+QL/ueeEzhKASCtu7K31w=;
 b=RpOtFH5cMwvLAfO+yLhlHv8q3S0f9BIEEO4LDbwLbj2NLu4kcd+0cwFW9vjalE1KGTEYXWyjl5QkjeGULVp/wWPdV60NRzvoeEM4uNioa2e7KNZmukkfVPeko2tYqoXN8IBQW8GiVloWdRbU0YfeuHl/CXdsL7n+eGYusJB/Cn0=
Received: from AM6PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:20b:2e::38)
 by AM6PR04MB4071.eurprd04.prod.outlook.com (2603:10a6:209:47::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 13:48:38 +0000
Received: from VE1EUR01FT014.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::82) by AM6PR05CA0025.outlook.office365.com
 (2603:10a6:20b:2e::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 13:48:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 VE1EUR01FT014.mail.protection.outlook.com (10.152.2.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 13:48:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.111) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 18 Mar 2021 13:48:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g04Q3xPTaJel0oq7duSJ3ubeKaJTuMLMJ/1OKt46P8HycCD0OX7JLZ09oeGLPnxFVWNUAuahbmcttUNV8nRp8dBA4bOc8dM6QIw213XfQazgkaK1vQSsLcSFcDRfWNoCse7DefvoYO/E1OpeOtDs8fR3DbA1sbJlhzo5RLBCmCSSVbeg3frguZBEEAcLZnxMuwhd1/GtmcrvsiUp2TX5irnHyXpv1dAKLCteGlEiGD7TulDYd+LI/FC0t3rxUqMCbqM9ucSaf1pzLDNd0FFgsA7QSSvKf4W27pwmzqaAnLGjZjbKgqZufjw0drHf1zL9g35gJLNrkVTUWOfZJlYYXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRw/Gqpz4wq1RV85NTqKPGHbR/BTVUQc5TsR6FIZvJE=;
 b=F0zkgzkxKYH3gTxu+ookrQRlrcj8j+tawXgNfc02qNqSIZtgzjUeXF+O5xh+VeYXXdpjaFhwukw7NrRg/y/3Jr+KQBpeTXcg8jt/Tl0S/raPUEF7PvsA9r7KFzq292ngM3qVHG9dx+U6ojsYAtn6Z6ofYOD1Ye0wY0u7gehmUsURI4nF2uQd9dTQdS6Wv1qYw4gQ+153N7AGI2GKCKeNrQhek0qSuJR4sIkjB0ZL3X1PMxX1DrpD/zGp+dsa4lreXF9vgEZnRX1eK/4AhkwnOvVtckqi943tOksPtmgOxn7w3b5dhw8AwaqkeZcc+SR5B1YpMxB6RoBdlfXFQA0yxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB7PR04MB5945.eurprd04.prod.outlook.com (2603:10a6:10:87::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Thu, 18 Mar
 2021 13:48:35 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 13:48:35 +0000
Subject: Re: [OE-core] Build the "boot" partition image (just like the rootfs)
To: openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.8fe74b17-765d-490b-bd80-d5971d41488f@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1e9416a1-3cc9-4dc0-8334-9bfb06079d86@emailsignatures365.codetwo.com>
 <4e1a212c-32d2-b474-3bc4-06b271e68f82@topic.nl>
 <19f19fd4-a80e-45ae-3fcc-36016baf8754@denx.de>
 <073fe5f4-0a45-aaa5-39f8-2f0c0b3c30d0@topic.nl>
 <f988e8a8-eba4-63d0-334f-caabb0e86a83@denx.de>
 <166C8D08E44901C2.29251@lists.openembedded.org>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <0d5a12b2-c486-787a-3c1c-49536ee944a8@topic.nl>
Date: Thu, 18 Mar 2021 14:48:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <166C8D08E44901C2.29251@lists.openembedded.org>
X-Originating-IP: [81.173.50.109]
X-ClientProxiedBy: PR3P189CA0070.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::15) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.80.121] (81.173.50.109) by PR3P189CA0070.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 13:48:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3338f2a-7c3c-47cb-bea7-08d8ea148826
X-MS-TrafficTypeDiagnostic: DB7PR04MB5945:|AM6PR04MB4071:
X-Microsoft-Antispam-PRVS: 
	<AM6PR04MB40717A0C49290F95DA5FCF5996699@AM6PR04MB4071.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mE6LXX9byeinz3AYYkwyW1HQu1BFEbDY4dg3bCqq6d0l+dXdhfBVnf3JD8Sofw8cilUQMkPoz/HhvIhl0+V4l+4CSHaqnc4oiXAtPu+af3zPctgnpjaxX3axAvJtEktUTdCn53KlHVllrFRVMI8wpuFFYSyiT4XHdbCjdUgPXXuTJKu8vbrfXniVs9weDdXQ/CPtEv0JusNw6h07vOkyzWxRiOXMF22Szff11hAQeTNcFJauWeBRi25o2xXKmuCENc9+HpsOC5nv00aEfzAeBZlT1/dQGnjRy2gzxQ3Do7+MQA0wDJ7siTwvBSTlWLmoHk8AKlS5Do3836nAVD/VSl7tfvWidz0d9S0jPvxoNM1Y8fNR5VvS1W17npAZvm1JBeNrfV05JME1W1QFTAGUMndoMj9ahzil5omgqnh+Ut5SSBY91w2pq8GarSdUDujrkGLosXWq/8eq0HjAXqjPmdgJNxqbSUCYak78mSBlpnw3ADFxboAs6LxPmvNfyns/ig3CH3omYawsNORntu/Ir2hn3rSFTtaw2uvF7CFKZ1jeQOy5YhsDANeTpzSIJNCd6jt1dFZuUhNGot/QgOmR+UUbHNimjgEuT/AmKcgHMfzN6uTbh0edMtwAARNHtc/PKBh/l7ESXGIY1a3D/NaDw1Xq24eZoha16H8JlmnDjad5MD9l9Eq7lHqkAcHFFYlt
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39840400004)(346002)(136003)(366004)(376002)(2906002)(6486002)(16576012)(8936002)(52116002)(44832011)(478600001)(66556008)(6916009)(8676002)(36916002)(83170400001)(31696002)(42882007)(38100700001)(956004)(2616005)(66946007)(53546011)(66476007)(316002)(5660300002)(26005)(83380400001)(16526019)(31686004)(36756003)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VW45OXJDVFR1RnMzd1drT3U2V2pTTVZNN2dmK0E5dzh5c0hRZWNvYTh6TDBO?=
 =?utf-8?B?ZWc3Sncra0liaXlERmljbnhMNHp3NWpueEJmVnFZaWVKKzJPZEt2clJxTDR0?=
 =?utf-8?B?aHp6TERXYWI1QXVGelZLYzlUdVNTSW1HQjExNHdrcHZRcWlTTkNlNVRJRFdi?=
 =?utf-8?B?TXp3L3QrQURVUml0Z2Y5ME1PS2hPdzh2VDY0UWJKVkZTRGZhanY4aTVFbG1U?=
 =?utf-8?B?TTFzMzBpYlVsWXJEcW5CN29rc3R0bWdkZFNZNHBhQmk1dnV6Q09zOVVPOVhR?=
 =?utf-8?B?a1IzOGJzNitnMjB3OHozeG9IcHRueWY5SFdNbW82SjdkMzRlemZ3TWJoNkNE?=
 =?utf-8?B?RkJwdklicXRxOXo5SzRHeEVqWHgvVFFBN1ZqMmwyY2ZhRGQvVVBCeWthOElC?=
 =?utf-8?B?aUIzR0FCbVBPL041TFhyaWRKU2JIV293NVNqSnVuNHVMWmxpUlVKckxwTkNz?=
 =?utf-8?B?L3JjSURuRFc1SS9KVTFqUXZVcnRxbG5VQ0QwZmttTFdlQjhIVmIzMFo0Vk1J?=
 =?utf-8?B?WnJweTRnR0xXV0ZVMnZ5cEtoN2t4dzNBQ1Z0dWJkUEVNMERoZFM5SjhzKzhi?=
 =?utf-8?B?S2JQVDAvaGNqNzdmY01DRktXejJjbDMrY3NXalpLL0dBSmQyTnpFcEx5c3du?=
 =?utf-8?B?RXJUSTZvN0l3czNRdDBSelo2OXgzcFphUGNwNCtObnZ3cUpwdHhld0h4M2Nz?=
 =?utf-8?B?ZXlBbU5XUnljOFFwdWYwQUdXV3BhUFUxZlh5eTZlTHVHVmlkREN0U1dYeENG?=
 =?utf-8?B?YktRWW9pNEJlWVp6cHlTNkd4T3d5NlNRMWVyTCtWay91RWViVWNjVGRCaU9I?=
 =?utf-8?B?cXFwUEZwUHlFdjBSMnJtTDRBWEMxKzdaSVNLSzZhTXVQZFp2Y3BrcHJwTUo4?=
 =?utf-8?B?UXFHaVJFTmQ1c25IZVBvdHprcHFGWWlDQlJ6NkRVTHRBY0h6dmY5eDY3NDN0?=
 =?utf-8?B?SStwN2ovTUdTampUd2VUckhOTkpleUphbjlpMU9HTUFnV0pkOW13R1dHL0Fy?=
 =?utf-8?B?MTVwRTJYS0x6c0M3NVRHQkllMnZxTjhVUHJNUlpIRThDVFNaZnVPZkxqeEdr?=
 =?utf-8?B?QWZvMitaQlJzdXZLMEY3L1VDT0Nxd25oc3RsWWdzRERDY2MyZVFuQ3J1SkE1?=
 =?utf-8?B?bzMrd3gzV2lpN1IzdTdRNi9XaVo3eVh2cDRGNGN3TzV1WHVyWW9LL3c4cFJo?=
 =?utf-8?B?WXc4ZkFyUCtSVWZ0RDN3SEpPV1Jhd25yRXUrVFk4NUVlSHR5a1FzdEZBdUZ2?=
 =?utf-8?B?SFlla1FOc0hGVlBpcGlBVm43b2NrSUNNZkVldWdLUVpId3NQT3ozdUJTaVQv?=
 =?utf-8?B?OG9nd0VzZ0doeVBIWHZOaTl3S1R6WHh6cm00akhSNlMwSjFKbGgzb2lWNnZM?=
 =?utf-8?B?Zit5WkEyYnRnTS9IeXJtRlI0bHo3MmlkdU1ZZkNsbm5scUtYVVNleTZnZjVn?=
 =?utf-8?B?WkNiY0pNT0gwbFc0TW9rU1U0aHI2c2hQd1ZjQlVHbzBYb01aSHRqaXpHNitN?=
 =?utf-8?B?eTE0UzQwbkp2ZVFBUkovMEhKMFFLT21OTkMwMHcxWElJUk9qazFCV1MwZXdo?=
 =?utf-8?B?L05aay85NEg2dkorWDhBSUl2bDlzSzI1dEd5MEFHaVFWc1ZkcHFSSkNKbkRV?=
 =?utf-8?B?RFN1eE9RNVdPOWljOG5UTEFpTHBTZ1d5ZzMxOWpXcTEvMitLRVd2ZnZ6cGlj?=
 =?utf-8?B?NyswK0VwQXJFSTRKVlBoMm9MamVwc1cvSUlLNmhNZUpLVVJad1lxVDNKeFA3?=
 =?utf-8?Q?ER2ozJd0J5pb8rWkEFH1SbHAQMUOua2DVjR6Sao?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5945
X-CodeTwo-MessageID: 35a7f02d-6151-4b7b-b65b-66203eb4bc51.20210318134836@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR01FT014.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	32631c24-986e-42d0-1f90-08d8ea148661
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LFuhAbUh5coCpXvmjoHfDruGVH+jZQH2qvecU1r5IYyIn/xJCJnRTbmKYSVkCR22DHQhp9J06gyP9EqXyr9nMsUrVmNDu3k+A7ZguFDjheojzPxyzZIb6Ce3nqFzeEdUpJAoA4JvYEz0VSjljX4YTOKSqc/AZPigxzc+JxGEKIUwAeBZo7bvLwN7xyHwJhxnGQWOBG4hGXiigsibAR3G75m7MwGcaTmkoe82JbayDOo/m1mw7Nx/Luhs782waDGd1fIEcr/me7aHf8hWdxl9EAV33NaOwh0hCUJIvJPwamqehuA+W1TPhVMKeNUQe7/Tv4bOUt5QWWyvc+hQiVk6l2Ynf40w7rmM0V3TLGRJUeLxNsalER3m4UkDOeP9zZo99guoIZlKfIGbqcBITrzoW0/+/1sunu/Kn39oeS30j9/BOHRBTWS/705tcrHFbkV4xXyHN8Ge0nWTVJ/Otw+10Fd8+mXPQNqWmKuglrt29a48Zcz4kQapbKOEanDqPn4DuS7zGG1NnIYnaD/zXh0sT+LHdUZHiAVDHpL7peCCLmZ/nV7cW6st8BB+06gQ+hFcOeVhb8ZaE5bdEoMBt64TUv2uA86imbYXmflrasvkgBCdKC1kMugpE4LPtNUOCb0lRE78nJuM8NyGhs5sS6PFqQ4vJrq7css67xXcpoIFisRh1IYS9dgdhfuu4ZEJi6u0mv3WjhcIsnR7iimJT2OiTAuK+JTR+FWaECCLgjfiv7uwGPODGpV7lCe2KYwQvVIajaYGWJObVyfDNbjLd4jXoA==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(396003)(376002)(346002)(39840400004)(136003)(36840700001)(46966006)(316002)(31696002)(2616005)(44832011)(478600001)(42882007)(956004)(336012)(36860700001)(15974865002)(47076005)(2906002)(70206006)(83380400001)(16576012)(36916002)(83170400001)(8676002)(70586007)(31686004)(5660300002)(36756003)(356005)(6486002)(16526019)(7636003)(7596003)(82310400003)(8936002)(26005)(6916009)(186003)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 13:48:37.6841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3338f2a-7c3c-47cb-bea7-08d8ea148826
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT014.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4071
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 15-03-2021 16:17, Mike Looijmans via lists.openembedded.org wrote:
>>>>>
>>>>> If I create a WIC image, the boot partition is in there with the prop=
er=20
>>>>> files (from IMAGE_BOOT_FILES) so I would really like to re-use that c=
ode.=20
>>>>> I could create the wic image and then cut out the part I want, but th=
at=20
>>>>> doesn't seem particularly nice.
>>>>
>>>> You can add vfat support for IMAGE_FSTYPES, and then you can build an=
=20
>>>> image (you can just take the files you have in IMAGE_BOOT_FILES).
>>>
>>> But that's *exactly* my problem: How do I get these IMAGE_BOOT_FILES in=
to=20
>>> an image of sorts? Just setting IMAGE_FSTYPE=3D"vfat" will put the root=
fs=20
>>> contents in there, not the bootfiles I'm after.
>>
>> rpi-bootfiles inherit nopackage, so you should write a recipe that inste=
ad=20
>> of simply deploying the files as this recipe does, install them. You sho=
uld=20
>> then install it into /, as this is where they are put on the VFAT partit=
ion.=20
>> If they are in the package, you can write an image recipe to install it =
via=20
>> IMAGE_INSTALL, and via post process command you drop what is not necessa=
ry=20
>> (/etc,...).
>>
>> Anyway, as far as I know, an IMAGE_FSTYPES +=3D "vfat" is not supported,=
 you=20
>> have also to add support for it.
>=20
> rpi-bootfiles provides only part of the file set. The issue is that=20
> IMAGE_BOOT_FILES, which lists much more than what rpi-bootfiles provides,=
 can=20
> be modified in the image recipe itself. It contains the kernel, devicetre=
es=20
> and configuration files as well.

What I did for now was just insert a task before swuimage that depends on t=
he=20
wic image, and just extracts the FAT partition using "dd". I'm not=20
particularly proud of that, but it works/
