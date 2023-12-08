Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB9DC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 19:32:15 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.99])
 by mx.groups.io with SMTP id smtpd.web11.20307.1702063932080737782
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 11:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=KL6dF3sG;
 spf=pass (domain: ni.com, ip: 40.107.102.99, mailfrom: alex.stewart@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNSvj9HcrGR9FHwRhcB2fqa9aVcWsHceDyzNPJCY4VkEDz2D14FGBCmo+f163KZbxxOvcRB3al3oxndBCXGwjuFNTYMNU/TrAY9eUSZ98sHTHiEzrPcv5AT1iqiZQWyjc5TFOz2H+tGu+jgOQnF+mz40omPM7/cfr36PAJj7kqXg6endXemic4Gl2uJ2VFFb8kp6tu0wmCQCGTq3vYS+O3f48LIv5UURtjSFlmW4aIr9kGEgXqEvCCpem9LGMti8HKzpmXVXz8Ls7P5XRnJuNgSVHu2fEni+3F03TZQxATPj9zrVCTBipzry771mNRpK7/Aud0YpPsms+IYoli7UlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDn8BQ1DP58WuWnIkdJrkjyj1eeNag+aAphGJdjwoG0=;
 b=issg/+U1bXqNgGSsnYTAFMGG5OAta7NjusMYa2rE1IvxlZai++rcmpGCr9mq3hlRmyVj3NA1EG0wN8R2qGuf0Xg+jDSbfK7T74lk4YJ+UARTSCpGje2aWnYxuAd+4WHfsi6wDVjo4cLNZCV7M8WyrJLbiCGVht3d4CTN7hmV7ZJhy3WDpbMjnDB9+PNjTXQx2j6gVYi3rtqJcLeUdlil1V0UzKnPrYao0kf1KfMOzxSBOSb2oVwuw7YyCmOptbJPJj/JdchQyFNMy9K8J/lnLYsqrki77LS8Cqfd67IfZ6GiSfh5yGSloGdQnINGdDE7E0d7DFgKtOjF67ag5aIxoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDn8BQ1DP58WuWnIkdJrkjyj1eeNag+aAphGJdjwoG0=;
 b=KL6dF3sGyvEnVYr18sm6E33VUMzYKfnag4ODivtFCBLLOH8hNftpDi3fzXjDfsbHDwvq5jGAN9pqD4BHPy1+8nzbZ+cEwd+Vf9pE+YiI3Owa+nRYBEdVgilj7DHd8Ucn/0kVULHbd/W16QQUnHuXXpH7dgE5WB/RcYw1Me5LSJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by CH2PR04MB6854.namprd04.prod.outlook.com (2603:10b6:610:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 19:32:08 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a92f:7f56:2b46:402]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a92f:7f56:2b46:402%6]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 19:32:08 +0000
Message-ID: <da571d66-d295-43f9-a25d-87df63902a95@ni.com>
Date: Fri, 8 Dec 2023 14:32:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 0/8] Add new packagefeed recipe class -
 RETRACTED
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, alexandre.belloni@bootlin.com
References: <117ae053-969d-47ac-b0dd-f75d4c4198ac@ni.com>
 <CANNYZj-N6iSpgLuWfkBqnpW1L5cqTJhOJq85mgYC3K4RtJctcQ@mail.gmail.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <CANNYZj-N6iSpgLuWfkBqnpW1L5cqTJhOJq85mgYC3K4RtJctcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::15) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|CH2PR04MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: b910fc36-8ce3-418e-3f80-08dbf8245dce
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yqYuUkColdM0OH7bm3O3YKOzO5OxjGO3+13N7VoGDPfzNH7e2gxCtS+yWgu+euUechl2+req7XnypBtcAsOYjsMUB7XgFcfAZt2QDFzmpga4JVTm7kdx8BmL0j8INS3XTZojIJh3CTDGEhN+qzvlyRXTLZP4EktN1VxbQfpquJZ2ZHxj6jaI3EdxZ8Pqts49CizfddJyxCu5aWF9jykSagvsIaaOH/zzlqFytLNA3q/KO+cLpTZKy3FdGtkB6VWRAH3chsJ/wQJXEoL3ac3Q6pU4fm628RAInXqs0l84CHzsZjkVH7yBDgL7kxOTuMRAE/OyXXaYseMwCEHDFMqLw8YHiMhmXNjalaADM2tJp+39hhPJ7cUdDvgUrynBXOdi49nYG7/BEONI3eHEA0IaqlH1KKAEmHgH9RK5IeHCq1D4Dwjn/SXfVY3JzPqOupNhfNwYywceLglOvbwQ+LAzsop8h606jP5LuP3da1kKu2IC2K7cMjW5doIiLBw/cOadBPCBhtQh2T5N4OALsddx3Erl3HPrmRpehmy3ncsPI3WgthcPvwIdBm0XhrAcPSyQ18DWqj2klu7D+Cr17DDajohIOLB/ubzLSAxWzgfANfNwQvXytjZ5RyPqdNawjOvz1dynhm/cJlO8DS4gI6wiNQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(366004)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(31686004)(6506007)(66899024)(6486002)(6512007)(478600001)(53546011)(4326008)(8676002)(8936002)(2616005)(38100700002)(26005)(966005)(36916002)(6916009)(66476007)(66556008)(66946007)(83380400001)(316002)(6666004)(2906002)(36756003)(44832011)(31696002)(86362001)(41300700001)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dWtycVVvNklZOUl2WFNIVGgzcnBQSFhicDhkOWZGR0Nob3AyK1V4ZWxGZWFs?=
 =?utf-8?B?MHJpSmpYV21pZlA0UHlwZ3RxZWFHQnRpbEluNHFkZUFjOTRzd3Vsamk2RlVk?=
 =?utf-8?B?TmVaUUJzMm5SVGN1VWlLU0Q2Wm43SEJnMk8vVmJsZjM1SDUycHpCL2lPNVdh?=
 =?utf-8?B?dUdoYVg1dktNTlVNbExvaFFuZGJhWTdya3F6RGhSeFdiRVAyZ2JnWXpGMXht?=
 =?utf-8?B?SGExRkN2Nks5WEY2OXQ4ZjNhZEJqUG1UclhIYTB4TEZhU3FsUndSQy91MmVC?=
 =?utf-8?B?RW1PNmVReWFsVDJzSFZIbmt2Uy9MT3drajVEWXpOYTBIVktDbDJTb3JORm9l?=
 =?utf-8?B?UEthWi9UNHNxamhDRzVnb29GbU5xVDNKUGIzdUYxeW1HK1FZanFFWHJXOC8r?=
 =?utf-8?B?VWRoZkZ2N1RQcjhwcnNkSytuckFXaFdYQUhoUzRYVnA2QU5oRUFLUDBjR3pt?=
 =?utf-8?B?bU5iWFRMS2tBcElXTFpvZlRCT015cUxQR2ZoelFvaGZ3QzcrRlN2UHpLVVNG?=
 =?utf-8?B?UXFhQlppaTJzMGxWeXdteDNNSmZkWVdVSFlVRGdKUjJ5d1dMT252YWZxM3JE?=
 =?utf-8?B?eFJ2TjlMY0h0aEFObGNJczQyVGFCdnFDbzlodnF2WUJFMmhrbVNQbUEySHlJ?=
 =?utf-8?B?VDkyVlRrQ0JPT2hmODRUbkt4WGgrTmhzY2R4eE9qYU1jUFZ1VC9OSHprQ0hB?=
 =?utf-8?B?Rk12T1JtN3dsUzJrS1BrcHZENFhNdzVKUVJwdGZLM1VxZFY5TXA1d3k2Y1oy?=
 =?utf-8?B?cWhManNmQjcyTHF1NzZBSlhrdTMrcGVqMlMyMEFWMDhRTUJHbTh6YTZYK3JE?=
 =?utf-8?B?bWJ2M3h3ZE9qd2JKVGNxVHFRdHpsVGFmaDlYdVV4aUpDYTMwTVBYeG9HT1dQ?=
 =?utf-8?B?MnZncThadTVGWWFHVFh3ZzhTY2U4ME1GUEIvbDh4L2xRbmxHSk41MnNId1BK?=
 =?utf-8?B?a3FicnVZdTdVaFBCdmRHazdESHR1cTUrZEZGa2liY2dlSzA5TEpRQzNRdnFJ?=
 =?utf-8?B?dEdZS3o5T0ZwSzRXWE5sOG5iVmJVSnVGTzZSNForN09oNWNISWZmS3NXaktl?=
 =?utf-8?B?MUpwSzVuOXJSU0tWWVFRTWRyNkhlYXlPYVQ1TnlCZFpRVis4QnpNeW5lbUZW?=
 =?utf-8?B?NmwwSVlRUlJyZ2o0dDlrQWxTWGR6Tkhhc3poOWFESHhCVGRiQnE4Wm9aR2gy?=
 =?utf-8?B?TUd4K3FWelNnUCt1YkxlM3JuOE96UnRxTy8vTHNvUS9LeDRDSlMxS2hURjdt?=
 =?utf-8?B?Z2lwYlhybjhTcVFyT0k5Y3lHWVBmTUgxcm1qMUEwQVpXbFE4bExuQyt0V1BL?=
 =?utf-8?B?ZkZnNjQ2WkdSZ3dQK3dPUEUwaWJJV3RWbWh1Q1htRlB2SnBZUEtiSHlVZTk0?=
 =?utf-8?B?bkorOGpRQ2Z4WlJQYXBaTW5hSnB2c3dVR25pU3JaS3c1bDdWVzl0OHJmY0tK?=
 =?utf-8?B?ZzhraGF5UTRBbjY3QzJJY3RWRmQ0dllTSmJtOUJUaGsyWFV2U0FKYjNFWDBU?=
 =?utf-8?B?WWZVbEhRREc1dFpxOGdPSHl2ejFINGcvTHgvU0FxNTNBVHlsckgwemtDZVZZ?=
 =?utf-8?B?MXZMdmFZdTN1c1hWdS9HNHBZcHZMcFZmRzJBRVpna3JzVDFUSDZiSnNTQlFw?=
 =?utf-8?B?bE5tUXpiS2RLaUc3Y2hjM2dIODNkUTI1SWJxVmVsQ0NVZHVPTUVGYS9iWG5t?=
 =?utf-8?B?SS9NWEdyYS9zZGtvSTRDaStqN1Y4QnMyT3gyamFtN1ZNSmNybkYzT1kvdVBh?=
 =?utf-8?B?QjFyMDdBSW5YTDFEUFF3VXJ1K1ZOejNzUm40cHBwczlHaW9SYkYraFliQXlt?=
 =?utf-8?B?QXI1Y20yUjUvY0lPWHh3UGJsRnpyMkRucUJOQnJvVThnWjBsd0hEajBmNG9k?=
 =?utf-8?B?ak40Q3ZwaVE4MW12RE5EaS9vYkJxbVpoNWNHdmVhQ2xFckxqV1hJQllCNkQ4?=
 =?utf-8?B?YXRnTWNzQU1WSEtjRkVwekllWjdqQlBVWmN2ZVBNKzI5OFNFQTJqK2xUOFpj?=
 =?utf-8?B?UGJFOUI5NGFQQlhQSTR0eXhqK2t5VTVCUUdvZWNOSm5zVHpPNEJqRUpFNy9P?=
 =?utf-8?B?Y2hXQ2NkQzlHRHBVK2dxWXBRS00xVGNkYkdta0ZVcnhJVmhSYU9RV1VPNUR3?=
 =?utf-8?Q?66Jz57V6VBVEEi7vhIujTAffq?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b910fc36-8ce3-418e-3f80-08dbf8245dce
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 19:32:08.1248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUNuTZrehvyyPInoOv5iILzkSd7RhrcTTTybWHAOOY6eICUJexLp1gHVWYwLkW3ANqOnKq1KNGkQ2NqGQ0pPuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6854
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 19:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192084

Sure. I've pushed the patchset here.

https://github.com/amstewart/openembedded-core/tree/dev/packagefeed

On 12/8/23 14:28, Alexander Kanavin wrote:
> Perhaps you can publish the final version somewhere like github so we
> can easily refer to it, should someone express interest in it?
>
> Alex
>
> On Fri, 8 Dec 2023 at 17:56, Alex Stewart <alex.stewart@ni.com> wrote:
>> Hopefully, the reply-to has worked here.
>>
>> This patchset was originally submitted by Charlie Johnston while he
>> worked at NI, and was then adopted by me after he left. Now adjustments
>> within NI have left me with much less bandwidth and I cannot continue to
>> support getting this patchset upstreamed.
>>
>> https://lists.openembedded.org/g/openembedded-core/message/186383
>>
>> So unfortunately, I'm retracting this patchset indefinitely.
>>
>> Thank you to everyone who has helped along the way.
>>
>> Thanks,
>>
>> --
>> Alex Stewart
>> Software Engineer - NI Real-Time OS
>> NI (National Instruments)
>>
>> alex.stewart@ni.com
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#192079): https://lists.openembedded.org/g/openembedded-core/message/192079
>> Mute This Topic: https://lists.openembedded.org/mt/103058646/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


