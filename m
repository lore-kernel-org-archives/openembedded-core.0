Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.92.69.28])
 by mx.groups.io with SMTP id smtpd.web11.9658.1613056351404507560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 07:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=fWu/V4iQ;
 spf=pass (domain: outlook.com, ip: 40.92.69.28, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKTlKWkeXIis+y2IgVZEPF1RNri6EBdkg2WAOMKQif+7v2ieVMVTnsbWCATnANDnmLP08E8YFIiVZUON2kRaXnfDu3IVyU85TWMBe7ttm6RTjnZMAEP4oN2075yHDvKzs+CWb8QuRsIUqooFfyOkytf+qHq/3qSuOVBDnWZRPVvKK0Pb+K+0my1IK7BsyeS+J1jK7VIm6B9bUiGP33hitPFyKs3IKuzrC7hFjBCirH6mBxTlProM3YTIE4OqpIbyWLv1kQ6xSX0jjjV/AXYwcRga/V8XVDyXY15sx6XUDOxMxupXM+L8NLTIS6A7PxNmySUN9IO+qpHeZWD+pxrezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyv/e+WqyElbI8pOBlIGEfmxXh/RlZN0/ruAFGVX3rE=;
 b=byppMV/IrsySYJqRZClwtHNRkW4BP/Dmfh83FE9ljGPYhTWO2qY0prQg+6BXfI6lfpJUUiZ6dxLERbgn08o2q0MYDRFPq5KPakE96iZ5J/avcf6ye8gqnE6ldEmIzTVqqJQ62GqMAHZxhofF07WrkNjzxKj4WcfU7ggqByEkVy7xJsR1Bz3kgyfhkkDc5QYdtYzMeI/9dHCfcEwLizcSs14r4imvs7H4+Zq/2xU93evG+2NhUz/RJFDgwwZHojYXQ+1t3/zG6u4wUCXYRpewS+4OmvpFGdCG44sjmD2WPXafj2NMNAcoqQg9bD77W5k/LtTVRPkbUi1NNiV3bQiYMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyv/e+WqyElbI8pOBlIGEfmxXh/RlZN0/ruAFGVX3rE=;
 b=fWu/V4iQE9qwfjm0DXBP4d9OnZCqw/gFxPvv3XzUagviJt6NJKpglwg1jttNPeNPoqM882kHhhSzzgz07InDIxap0+VczBZkCMwSyrMFP/OYKo1SS/Gmc3BXa5+aN/hWLH+WV/kMVIefhNV/JzOJ9wNd6VDZZwCOXQMGvzaQ2bY9G4m3TPqfoVj4xPzM0X/wP8t873YrYCBIfp42fytTCVGVDINeZzQSq973FH2illKIPhVTCb4IqRKDdxAVGHK4KEA6Mi2d782qoArE9NfNx64JQnKVN3RospcoX/k8wwO9GQn5zKAT9EoZs1wyMQtG5KjLZbXFZ9/DhOS33DVRnA==
Received: from HE1EUR02FT059.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1d::40) by
 HE1EUR02HT192.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1d::468)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Thu, 11 Feb
 2021 15:12:29 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e1d::4e) by HE1EUR02FT059.mail.protection.outlook.com
 (2a01:111:e400:7e1d::281) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 15:12:29 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:2AC97189FC7B2FCA19F614EC39DA9E0755F1972E1331F3D052C7C701B18BA273;UpperCasedChecksum:F919685A758F0E99BF7E569A4120F342D2F559BA7A0C67E5A238ACA078BD2906;SizeAsReceived:9201;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560%6]) with mapi id 15.20.3846.029; Thu, 11 Feb 2021
 15:12:29 +0000
Subject: Re: [OE-core] [PATCH 1/2] insane: Add test for native/nativesdk inherit order
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
 <AM9PR09MB46421810B3B2B59AAB545357A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <adeb07bdec1909082286a2dd6d16757adaf9098e.camel@linuxfoundation.org>
 <AM9PR09MB46424CCD4DD40C8DC3F59403A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <df38a497ef1c31b72445d7ae2361d3d6db676f6e.camel@linuxfoundation.org>
 <AM9PR09MB4642F1B612B2BC92D05BC20AA88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <75a09549ba5b0c04119f49c936af3e28e7ba9f80.camel@linuxfoundation.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464234C4EEEF5986AD0B77EFA88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 11 Feb 2021 16:12:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <75a09549ba5b0c04119f49c936af3e28e7ba9f80.camel@linuxfoundation.org>
X-TMN: [Y5Yw7hC6ScHCx9tS2roZfxWGtKrQFoWM]
X-ClientProxiedBy: AM5PR0601CA0036.eurprd06.prod.outlook.com
 (2603:10a6:203:68::22) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <01d4117a-1a1b-e77a-dff0-934b65ae0e19@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.90.166) by AM5PR0601CA0036.eurprd06.prod.outlook.com (2603:10a6:203:68::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27 via Frontend Transport; Thu, 11 Feb 2021 15:12:28 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 9360c3f4-cb2d-42ca-732b-08d8ce9f727a
X-MS-TrafficTypeDiagnostic: HE1EUR02HT192:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pgnTEcrhkbAgyTI0ywkUCzso4qO2wNNjX5VYKKlH/pMHD2zO/2MyrL+XNoessV9njuDnB0Ct1jYS4NLiAQmaukwN1vT//k7biwO88bxX6nHU4xrxiLqDnwcHwTEucXLgJsQjBS1VjCnF5cksQw0Gv9OnxQBVpu5teoEIaf97AajeUnb681oCukAzow9eHPf/TD6n6dr32e3tPqzz4lbXS1w7M4UVQsZabXxUoopjA4JyZgad/DA36xTyWZoY9+S++AJ8iy44uZu8o+JQTEhirm1OA2VgNuXgQPnaoF/TG+5BdVCM9TYKGDDSv80hnpsFH3qDIIWXffAlvkZqJ5wOos08zNAy0Y5li3sWstMCEixs/mPnMqpX4C5tG2ttklmMjBGOI/tPlJVfvyaaU7IQsA==
X-MS-Exchange-AntiSpam-MessageData: 
	Laf8jJ425+LdrsXgxJIwkUSSwEHY8cFcHlPta8MyTnW4cqQVFLjN5R0DvO4vPrj6r24M01IAE7V+BNS3Anp7WjBHtHJ3CCkN8WknDzwU846JvqtVviKW3mrd7jufoDIXnT70YGGSSLdebfK91E4Z3Q==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9360c3f4-cb2d-42ca-732b-08d8ce9f727a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 15:12:29.0556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR02FT059.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT192
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11.02.21 15:59, Richard Purdie wrote:
> On Thu, 2021-02-11 at 15:47 +0100, Konrad Weihmann wrote:
>>
>> On 11.02.21 14:04, Richard Purdie wrote:
>>> On Thu, 2021-02-11 at 13:10 +0100, Konrad Weihmann wrote:
>>>>
>>>> On 11.02.21 12:43, Richard Purdie wrote:
>>>>> On Thu, 2021-02-11 at 08:21 +0100, Konrad Weihmann wrote:
>>>>>> After this patch got merged I notice some "noise" in my builds.
>>>
>>> I can guarantee that making any such option available will just have
>>> people reach for it and use it. You clearly want to here when the
>>> changes needed to avoid it are probably not that difficult.
>>>
>>>> If that's not what the project wants, I'm also fine with it, but then it
>>>> would be really helpful to point to the bbappend as a culprit and not
>>>> the base recipe
>>>
>>> I understand why you'd want it, I'm just not sure if would encourage
>>> the right behaviour :(.
>>
>> Fair enough - guess I will go with the educating ppl (including myself)
>> path then
> 
> One thing to remember is that you can change ERROR_QA and WARN_QA on a
> per recipe basis, so in theory you can disable this per recipe, or
> reduce it to a warning...
> 
> Its not neat code to do it, but it isn't really meant to be!

Yeah, unfortunately all the CI tooling I use, will even reflect that 
back to the user - nvm I will figure out something

> 
> Cheers,
> 
> Richard
> 
