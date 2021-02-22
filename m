Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.92.68.94])
 by mx.groups.io with SMTP id smtpd.web08.32944.1613986320779035518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 01:32:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=CaeFMOBd;
 spf=pass (domain: outlook.com, ip: 40.92.68.94, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FSanIZXGi0U3xi+pBU25Lg5HS8nZc4wzsz3ertTiDo4OcVHXfm37iEcJaoY63/ltOKpMobfhzu89c2a+g2ipIiodoP+lcYl35HN3w9CtTMe/EV533CNuurl8GyVAV8fNFR3EXSGKkUzM8rMVoZChjxr6H3XtxCFzq3CHY9f0LZYgUVs4HQtjqHSXu4vJHXCqnvbFhaNUcbqMkGvh8ulxC2zBEJSLRJokSSpX3NCEZArCiSqBjlRJ6Bajt//6Sfug9RtUHNDpwKuAxoLhnwyuU6biV64LVE5GSo4D0TXtDHa37fJlhlQzZYHyQilcUXznwL3DTqot4auXD/XgDY4c9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKxmIIxcZxLYb61XgYGJWSi/eC7Y9RVwphrFL7u81Bw=;
 b=XzyFM0GOeXx5ViGzIxn57Fkv7UnbWHX+kq/W6oKiSvnY25TelTk/tjDfr3F9c2q7SaIx2SvhCxtOTJHsZLeIG+s6nUubLzFcrdXg9aXprUY+2eIXqjtBXNlj2ZfIIOhBbvXBcp8Ybv/x7YIiWwOB76N6hJT2qCyVS54NyZi7eZj7+G0kSXQZEtlfZkLZ5N5POE8PQwlZIX9ZgNrXrHInZpv50qmepJclN982Q93najQKEEA7t2RceN7DNAbqLjD70DYxYizWIJDxyiib+e5algOfhlVV6guJMN8xEDA05edj18ijKAPqugPHWO0plqJ/APTcd+Ca1s4mFgb1CgauFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKxmIIxcZxLYb61XgYGJWSi/eC7Y9RVwphrFL7u81Bw=;
 b=CaeFMOBd3fQT/pTeZKcFFA/7J6yi/vTKWfZ9rvpMsfHlinEr8a0LJnmT9oQEksNX0JH1o6tg/PwZzUpXtPGtztAgCa1029laQ1XmNQwWcdMeCXc6fN2W9RdS6v9fUc+4s9Bu5o/k7p4QVKaCZ7qqB2p82DscmQbCxrOa1tjqYwWsl1ZDFCru2+lFFVKJhXSuqmhkudkl4Gh1dnzOpON7l4zobZCEJnR+tKyJqHwIfYRG0flcK21fpFODiG2TaL6CQAJ0KZx16xerOiMQnEa95svH8leMtsAbo9izLkTqA42cVIRycsiX3QZ7m2ewspOfzVGCFzF3WJUFR3GIdZK/Cg==
Received: from VE1EUR02FT045.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1e::4c) by
 VE1EUR02HT051.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1e::274)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Mon, 22 Feb
 2021 09:31:58 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e1e::46) by VE1EUR02FT045.mail.protection.outlook.com
 (2a01:111:e400:7e1e::192) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 09:31:58 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:A2393D9911C5639231724B9F96CFE902E5B03389DCF586D24E16186C48B5E5E0;UpperCasedChecksum:2639CEBF0A74EE32BBCC0715073E5D474F2A39D6FE2742E3F7E72B8BD343A1AD;SizeAsReceived:9199;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4%4]) with mapi id 15.20.3868.028; Mon, 22 Feb 2021
 09:31:58 +0000
Subject: Re: [OE-core] [PATCH 1/2] insane: Add test for native/nativesdk inherit order
To: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
 <AM9PR09MB46421810B3B2B59AAB545357A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <adeb07bdec1909082286a2dd6d16757adaf9098e.camel@linuxfoundation.org>
 <AM9PR09MB46424CCD4DD40C8DC3F59403A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <df38a497ef1c31b72445d7ae2361d3d6db676f6e.camel@linuxfoundation.org>
 <AM9PR09MB4642F1B612B2BC92D05BC20AA88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <75a09549ba5b0c04119f49c936af3e28e7ba9f80.camel@linuxfoundation.org>
 <1662BA34B045612A.24722@lists.openembedded.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464297663C3664FD80067A2EA8819@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 22 Feb 2021 10:31:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1662BA34B045612A.24722@lists.openembedded.org>
X-TMN: [fLOaEnwYjRfvWQ269FV5R7QKnhL+BNAX]
X-ClientProxiedBy: BEXP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::19)
 To AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <59d9c101-89d9-c459-106a-0d73c714a979@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.94.135) by BEXP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.8 via Frontend Transport; Mon, 22 Feb 2021 09:31:57 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b6cbd655-10df-470b-23dd-08d8d714b2c5
X-MS-TrafficTypeDiagnostic: VE1EUR02HT051:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cRjUxuFJMCpigtKpA0S0BBA8upDe96ZcDgo2gaG/YaB5w80UXCcycBOEUea8JiUMh01kbrdGwhaj/0nFDe6Ycp4Yfva/dvQKKiNjyBSTUFZTn5uAjVq/FWZnw5oUiyr7vGOO3r0mmGxhMwSQyay2PItPlU2+oiDSHxSjE9DHE0rhaSxUx+YKB6shgU9itf8mtpgtSusoJG8FrGmFay0y3koCiKtJ5iRNWCA/2YOQ48cW9d/XSu1bCPq/1/O2gkksoDbi3FxqrNBkXHjIV30mNa0ac23LsrmpqnMfsmpWN9W54LxKbIBsLi7UkVKiFdff04DPGMmgeavccrtlUnv7q1ZNMf/7YOAB1LQY4OZT+z6vTEF8Iqc2eTzBF/ENcB6jlZPa+JEuIvj1BMI76Mei6iEI/UKyXczy3jq0+P0nOiVTouL/tyNrcW81NwovKyoz
X-MS-Exchange-AntiSpam-MessageData: 
	xr0QGEN+msrGqJBNLCBdFE8uiimNDnIR8uFXRwxp/n8yubUkJDn9tEmdAExelurr8z43hzcctnTsDAq3iwupFZq8KbYCzMZYvM8CNIThlNLSPR8ifl4uPSckVCoLUCH3CHISt0IdgNPMb+SnTDSG/g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cbd655-10df-470b-23dd-08d8d714b2c5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 09:31:57.9790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT045.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT051
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Another point where I encounter this warning is when using devtool, as 
externalsrc is injected via bbappend.
After browsing through the code here [1] I was wondering if all that is 
like it is supposed to be - if I understand the code correctly [2] the 
bbappends should be applied before the BBCLASSEXTEND will be computed, 
so the inherit order should be correct - just want to be sure that there 
isn't something more subtle hidden in all that

[1] 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/bitbake/lib/bb/parse/ast.py#n387
[2] 
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/bitbake/lib/bb/parse/ast.py#n393


On 11.02.21 16:12, Konrad Weihmann wrote:
> 
> 
> On 11.02.21 15:59, Richard Purdie wrote:
>> On Thu, 2021-02-11 at 15:47 +0100, Konrad Weihmann wrote:
>>>
>>> On 11.02.21 14:04, Richard Purdie wrote:
>>>> On Thu, 2021-02-11 at 13:10 +0100, Konrad Weihmann wrote:
>>>>>
>>>>> On 11.02.21 12:43, Richard Purdie wrote:
>>>>>> On Thu, 2021-02-11 at 08:21 +0100, Konrad Weihmann wrote:
>>>>>>> After this patch got merged I notice some "noise" in my builds.
>>>>
>>>> I can guarantee that making any such option available will just have
>>>> people reach for it and use it. You clearly want to here when the
>>>> changes needed to avoid it are probably not that difficult.
>>>>
>>>>> If that's not what the project wants, I'm also fine with it, but 
>>>>> then it
>>>>> would be really helpful to point to the bbappend as a culprit and not
>>>>> the base recipe
>>>>
>>>> I understand why you'd want it, I'm just not sure if would encourage
>>>> the right behaviour :(.
>>>
>>> Fair enough - guess I will go with the educating ppl (including myself)
>>> path then
>>
>> One thing to remember is that you can change ERROR_QA and WARN_QA on a
>> per recipe basis, so in theory you can disable this per recipe, or
>> reduce it to a warning...
>>
>> Its not neat code to do it, but it isn't really meant to be!
> 
> Yeah, unfortunately all the CI tooling I use, will even reflect that 
> back to the user - nvm I will figure out something
> 
>>
>> Cheers,
>>
>> Richard
>>
> 
> 
> 
> 
