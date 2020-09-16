Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.75])
 by mx.groups.io with SMTP id smtpd.web10.17619.1600243596252383569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 01:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UPRnyPnB;
 spf=pass (domain: windriver.com, ip: 40.107.100.75, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8lhDMnW8884UmPyErEg1hvkwZJflyEQnIzfn5ww9Zl27cilVQJf5TDPJFayKuT5JtWx3gTZ+szG1u24GLWV4U9y2gzCe32+0AoXNWX3+bkfjVT3OtMbfpqqFhgB5wWJqq75rloR08pUE0KiGLYwXSB1ZmYvtLFKqkqtDEqjAYUzQi6PMgZTq2dIrZhIjnchtSpD2ZZGq3/feeoD/HHhjPhvRk21JmnVIVSstnNHFF1lWWj31OoOvd5JplgtmNh17o243ywljwmxyP7XwBbeHD8k/BC17u472v0PuQd0uzEYyGPEmUEUPRcrWISZ3vlnoT15U1pYw20reVrlx0HqJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqFIPIGX4ykut24+JLjqfS+FNrtmxHsLCgd46SKOX/I=;
 b=EID3hgyNY61VxDq/CyacfzHkQXVdpaJu8B1P9H96aEsciUog2gNuUGz1Mn70pzer1OjV+hEu2SeLQ9E94bqh5lTifIrrzrsgsPvVhq0L8k6J/zINIDvXdn3ImXzFl29639djksoqHFxxSsJU4ucDthujbEedHaybEFmt3pdl5mAfeGGB1M3JBQTjUhQon8j5BJNRIJ332haqIgNfXQFbyF9ff+WCdco2bWJMQ+qCvIfEF0CB1xtQQJuyjU0JHznYYdugQgUx668sHwz/xyCnX/kaK8fqhYo71icHy+6tRjkW1VQ9jPtzqGKwGZdFOAVPqNAFsT+0Y8IHHUJvGSGXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqFIPIGX4ykut24+JLjqfS+FNrtmxHsLCgd46SKOX/I=;
 b=UPRnyPnBzyIJjsUmD8awunzuBLSmA4yNi00zrfTaZ+qkf5SlhZZ8eGLbhWa2sas9xRfhvn1IJa/STxFSSuH6P4XOzc+lWd25wfrb2deQ5qew/xN5jragdkHQ/Vbqkk/w48jZY5r08+wKrVxZVxkRwOwPf3hz/XwJj8eGwxVdKF0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3254.namprd11.prod.outlook.com (2603:10b6:a03:7c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.18; Wed, 16 Sep
 2020 08:06:33 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::fc6b:8198:e199:c0dc]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::fc6b:8198:e199:c0dc%7]) with mapi id 15.20.3370.019; Wed, 16 Sep 2020
 08:06:33 +0000
Subject: Re: [OE-core] [PATCH] qemu: always define unknown_lock_type
To: Ross Burton <ross@burtonini.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200910025728.3868717-1-mingli.yu@windriver.com>
 <CAAnfSTsTmAE5fbvTck6m9rsQGa_FebUMWmAXEvKkCfq2TWjiZw@mail.gmail.com>
 <26851540-6c95-c58e-7ae9-87d2ba546478@windriver.com>
 <236780a1-589b-589e-3e76-00d829868a0a@gmail.com>
 <3d6f9248-f819-debb-0d71-de29ee312ead@windriver.com>
 <eabcd7ed-88a8-8453-18dc-af4fcc92c9d8@gmail.com>
 <dc5035a2-5051-ceb5-310e-ed6d7dff8fd1@windriver.com>
 <CAMKF1srYA5s5et4j7HbX6BQ0+zY4WXciagffTh2X3yMKy2vUZQ@mail.gmail.com>
 <CAAnfSTvE_wrt6DUGxPGQefJ4uF_0CZaPvpAtUsBJzoVUqbfjRA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <378f4a7f-b201-daed-6f2d-8bec94fc82dd@windriver.com>
Date: Wed, 16 Sep 2020 16:02:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAAnfSTvE_wrt6DUGxPGQefJ4uF_0CZaPvpAtUsBJzoVUqbfjRA@mail.gmail.com>
X-ClientProxiedBy: SLXP216CA0056.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:5::18) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by SLXP216CA0056.KORP216.PROD.OUTLOOK.COM (2603:1096:100:5::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend Transport; Wed, 16 Sep 2020 08:06:31 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cce7bb9-adde-49f1-7065-08d85a176cc1
X-MS-TrafficTypeDiagnostic: BYAPR11MB3254:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3254FD3068C34AFF2D7D3C1AF1210@BYAPR11MB3254.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JFFcBtqm88g0LT+e9JLlh0JPP5wGZhjPCBkq5tORzHuFqvHEDN01ofC3fzDyaUmJR7lCtqdkAd7gr6qjmEvhoxL+bgHy5bcKcgHkikDb3nqxID6Ns0U5+xu8H3O8gOQqSxXkcqTLlcdQfnVHEZ3sLiqqgjOuxKw7HjL3GKTTDXWbIhe0Oq/S9yZP+sWIk+rtx9Pg5r37SHnzY3btJeMxeO8DpuCyZqFhT1XkfxPTbz+opASWL6SVAnjNH1+RT8wENkM0YAvP18+Pm5adY3hynurTifRO4tgoQkd7zfGU4Sd/XR+zPVt8+ut6mRaNGkRjdimx3BNn+BIF80fjShxewiIUw6RVebOdi7YSYGlbQnd4ZzfREmGoNRWKfe0bTE68bTo6cBwVk54hx+uR+rg9ayVEsnmTcJgRSwLxAEMrtzFDg28e8p7At0Jys098cf4eWRmV0FinPQn0vQcNVAP2FcuOtOX2xAzS7hbx7w48/gY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39850400004)(366004)(5660300002)(6486002)(66556008)(66946007)(6666004)(66476007)(83380400001)(6706004)(26005)(478600001)(16526019)(86362001)(53546011)(31696002)(2616005)(956004)(186003)(31686004)(52116002)(2906002)(316002)(16576012)(110136005)(4326008)(8676002)(8936002)(966005)(36756003)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	pbtJUFmUB8XC024h8buInpr8p0gBYpFZTerLrx380gKj6lUQHqOLQLHZLHUfxw/BvDaaHdd0H9DfFyRJ2s4zg+FO6oL6v2Fpd174TAKl3Uh7L+Ug5rDPgWeK+evJGwF7dk6dvaV7YWa7N+9BJS+Vg2Q15AtZvKlU9kvtOomP1/GtxJJCzpTWgWtxM9cwgQD9z8TRqF+8SxwX3v+68Tbhwv/HvUwc/CvJ33Jyp847EIf7yF1kooXImTKzgRIWHAqGgDki2ScT6jW6KAikIyOWKNLlUsYeUa3gvVk4h6LEaBoEfpVQEjQLzVWgUOHhNj7JmdW61rFuq/TPsC8m6yAYeofbEXh6MtC3DimHlug46otv66iJyjfYe1imDls7ZpfdemCFreCkyrXa8XxTP5gDKw/AEJQ8VQ3GmMf0G4s6s9QhHQ8A5HA6HwW9IFgUlFd1L2XEBRxhNd+0NttzqFE9DP+PxILbPsP9ME9S+qryjcPlslfV7bXily913ZfrNxG4Dbi0y9dIiK0EF7Tr8jrlz9TVGaMIDYdTnOcB7FVkT365l54Frm25OoSdsz9y+NfJBeeerM/AuT54JtGC1qM8FEAqWcUZ1XF652Lo+azboLhdi4nx+tCwsxQ4IGLE/pGVTJYVjGHjIAr+oK1qK7sYow==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cce7bb9-adde-49f1-7065-08d85a176cc1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 08:06:33.3666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0zOhZ+zhIT571GnB6OgGFQ1XYM3seCyaEWcWBcnZEY/WBk945KZom9iBAptU8DhcxLQJF51oYTTSrWVVvYINw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3254
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/15/20 6:26 PM, Ross Burton wrote:
> On Mon, 14 Sep 2020 at 16:23, Khem Raj <raj.khem@gmail.com> wrote:
> 
>>>> perhaps you are not using one of -O<n> option ?
>>>
>>> -Og passed to the compiler as DEBUG_BUILD = "1" defined in local.conf.
>>
>> Does qemu work when built with -Og
> 
> This is the pertinent question.  If qemu doesn't run after
> un-upstreamable patches when built with -Og, what's the point?
> Debuggable code that you can't execute serves no purpose.
> 
> If qemu *needs* to be optimised to actually execute then override
> DEBUG_BUILD to optimise at the lowest usable level.

Thanks! Will sent a patch to override DEBUG_BUILD for qemu.

> 
> Ross
> 
> 
> 
> 
