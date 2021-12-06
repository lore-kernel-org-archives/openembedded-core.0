Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12BAC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 16:47:08 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.74])
 by mx.groups.io with SMTP id smtpd.web08.54329.1638809226780375652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 08:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=vWqp8dP/;
 spf=pass (domain: outlook.com, ip: 40.92.73.74,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXP1oR2BQUpaSjo9SDz8y8HlZy4t81qylmquod4/gQljaugW5uuObulba/LkN1dHhZSCsFjJ30xQXXFSYFV9rACu+ocwYA4FOxDULSYNbcDDmVC4v2By5NTLzH9B+0ayU4i+IF4PhBylquiSiDX9+HyFtqZ520Wx8JvlF8uMDcdkZsbl0JDcuUQC/oUwZJXo9Z0pN1k1/IHxqFgofSNP2XQ5CP3w+rsXJGJukrtCWErr8Pywu5tVGn4fyEiUTIR1aZluViIPPbdlbW2zBzkgHaVKf+bYUa80A2PqVWbzrFsmP5twaTla8mLeia2OwBX1RGZYF1Zrf14vCYHH63F+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSaEo8Fm63ogEg3D7qTMFqF3+adrUi3sqSedlX8XDxk=;
 b=a8nF666HVHgo6Ifljv3ELEL3E1dhAeuABQtUQ5Ox0mKsEnBBteCCCvflqP9VXX42yxLmJKvPY0u2Rr5F6KBe6tA4anWQbJxFxziASUHbSex7rxsbtXE1f5jKnnIW/CUDg+3ZyuH6gflnKM5OtQvMCx0Azk1WyaU/ucBtjFhqrkil688IjVVRdRUNzYdCd94QabQhvL0TMn2JNK9aFmCfFlCeSW3nERTNixfRYoBwtdKfUxPsZL1fqojUt5qP2BoRTDWi2MrTe4OiqTl25IZqItc5PhrPLEqHiJ+9z9U3/UaJwxbbte19TpZ2Kpc2K7D1ka0hzWwOkqcuP9UtmClPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSaEo8Fm63ogEg3D7qTMFqF3+adrUi3sqSedlX8XDxk=;
 b=vWqp8dP//hDQ7LEcogJYwrug4kLOBh8O7INBXi4IOhIyXgFKG7T7OCAOAr7vowGpncssC1YyzPYbHCiK+brwwsdpn7SawZg2p5cQ/DaPlohQMy24bM2SO5Kn+5yFa8kO1kTbX5mU/dBAF10o2c6OrW4+VS/06Zi8LTAx4K8LzZKN/7E/bN9AJDmIjMoutWB7/3/qUSfCHxnDGPtNV7V05+U705Pw9ZdmDY1g8IqzrABawz5HFHd2078J2AUb+bPDXMf3Piq/y7ZV6G3qu0b64n1l6IbtheCY9PdxiItq3BTMF23uswdlKvm+xAlihGVU28eKTZvY4NAxH6quqqBwqg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4212.eurprd09.prod.outlook.com (2603:10a6:208:195::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 6 Dec
 2021 16:47:04 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 16:47:04 +0000
Subject: Re: [OE-core] [PATCH 26/26] serf: mark patches as inappropriate for
 upstream submission
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-26-alex@linutronix.de>
 <CAAnfSTu4iCqOneHeDgTKvG5ao+rOnxV5EWXN6pfFaRVRhPv_3w@mail.gmail.com>
 <CANNYZj95RL+FwZSpSSVurmypf1wXWDzkjV18Ee4zrDxs03F7mw@mail.gmail.com>
 <CAAnfSTurVLUFAPSVtoD1hvvqOdKWduAiD0Qgc6L38Fh8A_YdTg@mail.gmail.com>
 <16BE34F09726DD19.18170@lists.openembedded.org>
 <CANNYZj-B7LY5egzLTb8h4ApXVe_d0XdUJQjM8tfH+Q6KSfiOCw@mail.gmail.com>
 <0bc6a9322d9ec2fd38047e2223b337596306c098.camel@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642A5C1D094F44DEEAE3020A86D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 6 Dec 2021 17:47:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <0bc6a9322d9ec2fd38047e2223b337596306c098.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [0C/eEXMtDHr/lVtQH1HZxnMss4kO3dJJ/4nAX940BZrrKAqse2r1PMRV7UNATPy5]
X-ClientProxiedBy: AM9P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::29) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <5305bc4d-f512-c65d-4e5a-a4ea7c790bec@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM9P250CA0024.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::29) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 16:47:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 731687e9-40e6-445b-1474-08d9b8d8080d
X-MS-TrafficTypeDiagnostic: AM0PR09MB4212:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QiLOQyPr83iAH4hxY+T4uG+SuoBHS6XPKI6vjdpUbcowOKu2L2yUaLhve+mDCRrux+jvVB5QeZUs4KgQNJgkOozORgU69sk31VByBdytW/ikZmRQ7Ikmu32xk7LoUBTtGWT4cspdSpjspheiDVDaVkcE5xJstho9jKR1dW3R4qvHPfysrh5M+JUhJR1dKKWyefObbwPrKprYoi1R+FO+o1qd+6VavO0RDoWY2EagqFuRaFNTV6uF6RrZAFQjuUOsMfEw9/jjwdKiVk9dHylUJFnA5B9vIM9OxIsRGGLZe/DsGQ7MKKcqVSiUaEiiEJ88hgCltQhtSf2u/mfq8qXhVq6plqPGbZkpKtmqYTNoD0TKpFKj1FBf9xLhQ+aZ8W/Zsggs3ABrWBuLr+x507pGy6Zm69Tu06UesgZhWZodPQH/RaLy/REmXiGmpfghSstaUdE/vSUF10nNxdyekAfNTth30GenbhhZhx7yeMa9OHnNLemr5UKvC4RpRV72YmsHs1hbvoOUhiEJS8ksBkFSHDzlNgFaNci9BjVwpYW+4odIdZxkVXhf7DfylO1pttaEj9j3uAA1IUx7ueozCOpZl93qspxkc8XTsGyGU1cTy+R46r5/x1jIBv00cyzIllAoNg+01C8bCjyHKZqJk/vbeLS5pLlKJ3lim5vyyMW8WjE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UUl0RnpzamlJNk9NVHBydzA2QTJET2d0cEpZUFo3Z1d2Mml1SFI1Z0QyQ082?=
 =?utf-8?B?VlhIVUxaS0Q4NmszSCtsU0ppK2EyMjFEL21zb1cvZjVJcWM4VzlmVUxDcTI1?=
 =?utf-8?B?dnA2UjZrN0dyeEtoYVNqVzJkdXhrc3paYkpNRXhKZXNyWlBaTS9mMkkwNDBC?=
 =?utf-8?B?Q3BHcVFCWnExa0w1eEFyQkJ2NGZpZzN4UkdIbFI2SHpGT1FWUUV3RGFpUWJs?=
 =?utf-8?B?b3I2ejRHTTBnd2tPTXphclN1R1pUWUIzZE1WR2xha0xPQzdPVE9VL1ROYUdy?=
 =?utf-8?B?WE1Tb0YvZ3hmZG5DVXAzbVVSeUIyQlR4UkdsTDNkb3FOS3pUSk1lS1JHY2Jx?=
 =?utf-8?B?Y0ttZWVEVlBnZEhPcUdBNXVEaVdaVTJTNDRmQ1hrWitJdTRVZks0VW5Od2sx?=
 =?utf-8?B?V3QxcHBwQUMrSVVMMEYvTjE5enBnU2JZZDBVQURzVVloZ0cxOUdpejdKTHhB?=
 =?utf-8?B?ZkRzZGR0Nm5EUGFQQUI1d012V2pwM1BQU21YNXZCL1c2QnZiZFZlUVl3MHo0?=
 =?utf-8?B?bW1XNFlEMmt3Tjhzb1Z6eC9tdnBGc3c1SnlOQmtJbmgzNGVRSWF6UjY5UndI?=
 =?utf-8?B?Skp0SWFDQlBEU0hKdE5BcjY5SEpuMThyZExBR1pTR2lMZ2t4WFRUaTJpa1pi?=
 =?utf-8?B?NC85NUZiSG5zblVaSHlCUWZFU0NQS3lyWDRubnUwU2xKZVo2cUFsVTBCeUlP?=
 =?utf-8?B?Ri9FeW9LQ21nUUsyWUkvcCtKZ0tYWU9QZ3Q4SUY2UlBiRDUwMEdsK21aY2FB?=
 =?utf-8?B?SHFqbDNuVkpPTG1jQlpsYzFOUE5jT2ZKME5UL0c3eTVpaUpFQWQ5Tk5iK2x1?=
 =?utf-8?B?VXNBbjRNMmNrY0lnSjFXRTZ6WCt4amZIS2ZHSTcvOTRBMmJJbDFUYTJ4RUJp?=
 =?utf-8?B?Y0JvUEJBelJsMmZKbEhCSHMrSkhLaGt2QVkvQ1lKR0Rsd0w3MVhLMmZGaE91?=
 =?utf-8?B?aEZFMWg5YTNCMG5xRnExc3oyNzMwZkpNcW8xd1VGNWs0b3JqQnV5LzZxcWlV?=
 =?utf-8?B?RlRWWGRWZ2pUZmRza3ZvWHhnRkFUWTl6Z0tUOHcwNjlzWnVTS1g1LzJXWU1z?=
 =?utf-8?B?TTFyTS9UWkM3V3dleldqclJYY2UvVHJJKzJFWThmbmxkQ0x3WGdvZEQzTzBQ?=
 =?utf-8?B?OXZQM3lLSEJLVW5kdmkxMFQ1MHJXQm5nN2U1T3BuRXNub0cvb3dOZHRLbEZJ?=
 =?utf-8?B?TVl5QU8vUkM3bUR3QjJEblRmekg4aWlrTmc2YmpjM241NTU4U1kwakVZZ01I?=
 =?utf-8?B?WVBqWWl3TkUrNmlDQTJIcXdFRnRRZnowN0hjdUU0U3pvR1FPaVFKOXd1QVhB?=
 =?utf-8?B?L3pway82RlNVVTV2Yy9URzhxTU5sY1A1azlOcHRuY1k1WWhWTVpkMytpejdY?=
 =?utf-8?B?VnFiVGZreFkyRFE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 731687e9-40e6-445b-1474-08d9b8d8080d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 16:47:04.1231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 16:47:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159259

To quote the documentation:

   Inappropriate [reason]
   - The patch is not appropriate for upstream, include a brief reason 
on the
     same line enclosed with []
     reason can be:
	...
       no upstream (the upstream is no longer available -- dead project)

so I think this is already covered, but I think we need to enforce the 
usage of machine readable reasoning within the square brackets.

And if we need a more fine grained classification here, I would suggest 
to add a new item at Inappropriate

On 06.12.21 17:41, Richard Purdie wrote:
> On Mon, 2021-12-06 at 16:50 +0100, Alexander Kanavin wrote:
>> I mean, if you insisit, we can add Upstream-Status: Defunct, but I do not
>> think keeping patches in Pending state when there is no upstream is right
>> either.
> 
> Maybe we should add an Upstream-Inactive status?
> 
> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159256): https://lists.openembedded.org/g/openembedded-core/message/159256
> Mute This Topic: https://lists.openembedded.org/mt/87494788/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

