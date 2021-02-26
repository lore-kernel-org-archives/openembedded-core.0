Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.64])
 by mx.groups.io with SMTP id smtpd.web09.12812.1614360361818169980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 09:26:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IeOn2314;
 spf=pass (domain: windriver.com, ip: 40.107.92.64, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxW5eMnuq1CSy78aQ+m3TIb6RiL28xleM7gYps9Vfnnl3zC8yf3KAUAnRc1xWySXQ5jXHPG1tV3AcnZvdglXJG3qYMKW/EU9AThYjNBV4sKp2dlPwVhDvV86EbFNN+odc2oNsKIth9lVGOgW7k3gzjAY1aStb1/ehzLO8Lce0g9MKNGAr8mNu7rcV5g4UHrXxIolkmPZRdT2og/Xgsx8MqVUthW23hdWyuIsMlWYAJvFERVE9a9vdwdjoTinIq2rhc739rzMXRqL0/b1tGqWr2ej3Bc0/E4ThG5/Be3T1BNSIpttUvjneV3gAnxZCm2zjlr/LQx71ZZu+K+wHnWVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Da6nGIdlE+XLPinRMIlPJx6hiAroashYGeM+Lr/k080=;
 b=Jp6j9IgN0VtZMd7jj0uNvXeccAIXRF4gJy0vcBMc/jbfOq+eQNqyCsbwSEFz2akYNSX+fPbelLJcwei/imxBw40ZZ4gNSEYgaoUESQA5qkexvDFC7zGqb/zTZ9HhrwkxO3EpUdCK8dd293G+yrbTS3b1rZs3JAOgjKNigetmV9n7SU/m9ySp7bfis/Btm/VYzc+gIOfAyrXRUU/BlQuvkO14o9ifsHQmDgG6Of/nsoz67cnGTjmw4WRF09ChuN/EOp96pYiHDid0ACWPbw5Z57EC/bftdpCJD726ecz5iXLu/6JUxdrrchSWCSFwsAT2Lu7Bs7eguTbfji4kqTR/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Da6nGIdlE+XLPinRMIlPJx6hiAroashYGeM+Lr/k080=;
 b=IeOn2314pk2ugnRPloEbAeUzTcnDmTvWm/rL/CID0E5hEFCzWGwYQKn0tTmqG1XTluuFR4KouMHVgcHzPfyVkcYQUVHsNaBR8sBlCuYSVIVAHf6NmKvUTa7W2C4jGppweRgdyf/GCvTsMZwi+MWe4+lbnSdb5bsOgDMNH1qIYis=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR1101MB2261.namprd11.prod.outlook.com (2603:10b6:910:1f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Fri, 26 Feb
 2021 17:25:59 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484%4]) with mapi id 15.20.3890.020; Fri, 26 Feb 2021
 17:25:59 +0000
Subject: Re: [OE-core] [PATCH v2] toolchain-scripts.bbclass: customize prompt string for SDKs
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210225055914.34860-1-kai.kang@windriver.com>
 <CABcZANm-+8uOoAskLz7GM4DDGrYM4c2O4NZyAz2WuHhdiH7jMg@mail.gmail.com>
 <0a2eff5a-9121-e31f-abee-47c096799e85@windriver.com>
 <f073090d3108e89bfb8ef59fdccd42b472df782b.camel@linuxfoundation.org>
From: "kai" <kai.kang@windriver.com>
Message-ID: <146b6a30-f0a3-41b1-98de-32b8acbceb24@windriver.com>
Date: Sat, 27 Feb 2021 01:25:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <f073090d3108e89bfb8ef59fdccd42b472df782b.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0030.apcprd03.prod.outlook.com
 (2603:1096:203:c9::17) To CY4PR11MB1432.namprd11.prod.outlook.com
 (2603:10b6:910:5::22)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HKAPR03CA0030.apcprd03.prod.outlook.com (2603:1096:203:c9::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Fri, 26 Feb 2021 17:25:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 758648a7-3007-4940-452d-08d8da7b955e
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2261:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR1101MB2261269E16CCDD90E9157ED6959D9@CY4PR1101MB2261.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dP47IiribRrP70lc/TGG3/caVcwMiF8DnsIgVyone1SeXeQKqE6l4GVm7UHkFOYcD3CUBaQEhCWyJn0l53CHLTxiop1AHyxw0FfmfFL7tvyN4XUSJXc8DsRAT+siqHnZj+DlhJ6OlhgP0RBAywORvfFD93JeZz5Dy46jleaLqYLrRQSyzLab56Hq1GjIOC9SGW7UE0Wt0FvL1DYfcXzwn4yBOy69pIwh8fdFsAabpopAI4Ch938DtLqrFHLB3TfIRlvEnIUDkMMDUx/kyi/ykIjM+UNMR8V6LKYHkBhpe/OfsA6ZRhgfYdRflbz5bFOSx8ty7IxpN51c6E1rWoto3oUVp/Z+uNezc4Bmh3xgrw8u44o+0ujiQbA5qaPSHgad2ywJP4NeER1IQp2PniRE6nJVybdQqAc1AXGyqIcuuUIBlAcKqrOGAkU2k+Iwfzi9b14eRc952gmWmaiNHgrdh6Rzf5DTnWZ3eKhQ2VqwC+6Iny5s/HGBnM7S+WSTIffTS+5pQYBmdMHQuG1pmZFM6Sv3cj+JkHlF4EZjonzAVuCyOURsMS992d+U+U6OqFCthJva5xVDFrPIsqK0yPwWNa495OkMmGyI2fFXerLXszrnwe8PvGhlCJybEJtPiXBn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1432.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39850400004)(136003)(376002)(366004)(110136005)(8936002)(316002)(16576012)(83380400001)(478600001)(186003)(16526019)(2906002)(53546011)(8676002)(66946007)(31696002)(6666004)(4326008)(36756003)(66476007)(6486002)(6706004)(956004)(26005)(2616005)(31686004)(66556008)(52116002)(5660300002)(86362001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dVFhbnI4eVZxOFo1Q043eUtSMHJ2dkdObER0ekJoWkhSZTBKUjdFMWhQcXEy?=
 =?utf-8?B?L2ZxcUtySHNoblF5VFdoYStqNmdEa242ZnQ5Q0V5ekdjZkFiQkVaWlNpT2RG?=
 =?utf-8?B?ZDN1MjNveGZ2ZE1WYkV2SFZPSk4zNUZJTDQzU1B0ek5nQk9WdHBVNVcyVndC?=
 =?utf-8?B?dGlQcGpqaXNKeXJ5Rmd3ZkF6YUczVlV6ZnNDSm9SNE1YNkduc2htRGo0UXk5?=
 =?utf-8?B?WitDRnRzd2k1dWtSSVNGL3IvREo1czZRZFhGMzRabGxBUythMWsyTkN2VjZZ?=
 =?utf-8?B?WFl1aWpwL016aG5PMDVER0RRRDBoelJxemdpbzUvUHJnTWpMQnlXWXdIYTB3?=
 =?utf-8?B?TkZaeEhjUlRwZitpS2V3UHVVd3FuYWdIV0VsbDA4NHQycW1acUhabVNlK1lJ?=
 =?utf-8?B?ZVlRREducXBmV05yWGVGRnMxVkZVTXJpbEk3d3hRR0pNbDNJZzVpZUxrSEhR?=
 =?utf-8?B?Vmh0N1R4d0dSTXNrRnhzWFhzc0JMRXZua0N1c2tmeDdmOGtwV0RlcDZIc3RM?=
 =?utf-8?B?cVk1STZiQnc4SWRibEEyS0FVZmZyNTFpSllHS0pJaE1EYnFPZStwN1U0c3lq?=
 =?utf-8?B?ekZBNHN5ckoxZldmWFFHcTY5bDYxNS9EbzBqbitrUnJSUTgveGI4eGlSOFNY?=
 =?utf-8?B?enI4V3R3N0lYTXFidVlBZ0lXM1Jrd3k0VzcvRWU4QTBGVDZlYXhNYW5KUXkr?=
 =?utf-8?B?V2FWZExZclFtdG5mSVJoOXFmZFptMG9pdmxBMy9qWkNVQWFGVWhRQXlML2dS?=
 =?utf-8?B?Y3NPV0VWc1FiUUljNzFDTEJtNkJYbFQ3RXdHd0FOQS92RTVsa0xHdldMa2Ni?=
 =?utf-8?B?MmFybm9VZHAzaCsrQzh6bFR0cXFYQnBlVWttSVFlTnhiRFcvL3dCUGhDVEVT?=
 =?utf-8?B?ZC9Pbno2UFhnSzdIMEVnaGMvNzhrL0V6SHJmczRYV0plWGMxMmo3OXFmYWtv?=
 =?utf-8?B?c1NkNm1OekY0ajhzeDFzOFlBUmtXL0xYeXlpR0ZPZVg2cnJDd2dQb2NzSm1O?=
 =?utf-8?B?OW0xV1RzdFJhcmE5SlVnZFptZ2FOVG9sWWdZNnQ4bmwvVjF5cEJQM1phZklX?=
 =?utf-8?B?aTRYWHhZbm1tVTFIUjBLVCtYUjU0aGVZQnFvTnorbnVjaGtNK1dvdjc0OVNn?=
 =?utf-8?B?VXgzYlZtNWMwb1dvaVpmbk5PNUpLV2VtTFlPcjNFdnIrYjJ3MEltcmg5eTc2?=
 =?utf-8?B?UFIyTTRiSGd1b28yajFvcHF4UmhqRS9FUTJzd1krajJieFN0djhtUDNuOWhY?=
 =?utf-8?B?Wm04YzhZZGtUQVBRV3ZWQTBuV1ZETXFyeE9GazduYlJEUEl1eFBBdmVOK3Fa?=
 =?utf-8?B?S254L1BBa09RRXA4ZVM0UnhpQURtd1dLdGtrcmdXUDUwRTNvV29rZjFGVGNE?=
 =?utf-8?B?MU9CVGJGZGNzaGRQaytvaWg1SzQ2b2VKdXRnNWxxcU5jK2lSaFVQZnc1akYz?=
 =?utf-8?B?Y0hsOFdMY3hIL3JZSXBIbk12V3RoTjNCdFdNZURRRElRN2VkNUxQMEx2UmJD?=
 =?utf-8?B?NGs3NVVVMkNDbVAzUk50d0VkOWt1RjFmMVorZXg4T1FNMVpXb3BEaEV5VjBQ?=
 =?utf-8?B?U0FBTmsvaG9yNHpnY2JWczE1V3lPMUpLcFpoUmFzYk9QNUZETTVIU01UeVMy?=
 =?utf-8?B?VFh5UnZUWTlXQ1NEQkZtaWxkYkhQdnRoS3ZTWWJEdTBKM1g2cDk5cGpWdzgx?=
 =?utf-8?B?Z21xUThsNEUwaktPSXJqeG5JS2p6MG1qdmVoRXBPcmJwdURmZlRBVUM5Sk1Z?=
 =?utf-8?Q?ffE8bZKiNpo4iwpfMezRxzO/IBT0cKfzqRXQR7b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758648a7-3007-4940-452d-08d8da7b955e
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 17:25:59.7809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HP13L3nr23Y0F3pjfv0+FNrGpH0jCN0WSJ8fJvPtMnVI4ZR1RAVCWYfkN0042Q6CIR88/aSKtVqYQoLB4TVWuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2261
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 2/26/21 7:02 PM, Richard Purdie wrote:
> On Fri, 2021-02-26 at 09:57 +0800, Kai wrote:
>> On 2/25/21 11:29 PM, Christopher Larson wrote:
>>   
>>> Are we sure we want to completely override it rather than adding
>>> to it? I'd be rather irritated if this blows away my prompt
>>> without my asking for it. I think either it should append or
>>> have a variable controlling whether this is enabled when building
>>> the SDK.
>> The original requirement is that the PS1 after source sdk environment
>> file is as same as the original one.
>> It can not tell whether in a sdk environment.
>>
>> The default assignment of SDK_PS1 is '?=', you can set it in conf file to override it.
> I've held off this patch for a while since I think its going to
> *really* annoy a subset of users and as Chris says, it can't
> be disabled. It would really need to be disablable through configuration
> and at runtime when sourcing the script which isn't possible.
>
> I appreciate the usability issue it is trying to improve but
> I think it will cause more complaints than issues it solves.
> As such I don't think we want to do this...
I have been working on the issue Chiris says by adding a check for 
SDK_PS1. If do not want to change the current behavior,
it could done by not set SDK_PS1 by default. It is better to have a 
chance to modify sdk prompt string.

Regards,
Kai

>
> Cheers,
>
> Richard
>
>
>
>

-- 
Kai Kang
Wind River Linux

