Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.45])
 by mx.groups.io with SMTP id smtpd.web12.12535.1608401079708135464
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 10:04:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=j40N4zno;
 spf=pass (domain: outlook.com, ip: 40.92.74.45, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnMtqhyXrlUrSUldb1D4TFX3XlFKyjnIyAdHPibL6gux+lP5tftqMk2u3rCk56zjytC7fubGG+BRe6q0w5HdfddBuMHJO8wDkESk1FXkycAbjS32CoGFjqzTZQhPvBUBLHMfhJZIGf65RMHVy+HKr66zKOehSO1u0NfbnXr2YfAhuq3J5wKWyq+FDO0x41xjcU9fe+9FsqAcfz242I/XT+9FmNZY4RXzSJZQ45mCak3xMwdq8oTZa/GFMKiQuJnbF9auQsz9puro5xJ1ZQi90aP05vr0RK6Tyxjo/Mo0mgUzb1QcHbcQI4Kztq9f/a96sntQu7mAJQhPJwEN77PgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfQJCsSA7KUmeXtqyuZBucYl5Zy0sXY2+vsHiVOfYGE=;
 b=fLAjObm49Y2zGit4kEV3w2VXHiAoyvrvPha/e6hunXwdQajdTweGgL4YxzBO6N522y3aaEun64SDvIdTVN65IiVlI9ws1ODjCJWQt9fNJr9dlxjLPfJTiMRLC7sB6ggkd+Av7aMpKy4c1OzyrYs5ymU1802U9jTts/TeO2hcysoGmB3J7NvnZidTqaLgPmCuHODKyH+0kigw2zmpEs9rgFoXB4HSbB/Y6j36hc8Zkc0sBGcQgL4/F7QUHdDKQWfyxRVkEFsmN1mIelOLacE1RC6scAwsJ4XdBkSbViv2xssUQjjqVWdjQ94H1cFi4flPCcJ3KQlYNj8oz/C0YW9/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfQJCsSA7KUmeXtqyuZBucYl5Zy0sXY2+vsHiVOfYGE=;
 b=j40N4znoJsCIMquqLGtVAGmILVnkyhHfmKj97uoBamknb40p7+TvKMrOc4fGD6qojrvNfa/iImBlliA6WgRBZRbeS18ebkLyglfxdz16T/VieztZ7pKaRooBNlbeZzgl0Gxal9pBVHqXA6ZFglH6/r/R95u9EIVXiyCnpQlY17VF3K7pmntN5l2kbFDDjFPZM/nDqsJfojYINDPrwyQ3MCE4qIix0xRos+MFvAxUHBObh6/ovbUSwZZunBkFGJTZ/HRNgB+M2BbPZY7HI5RXbfujr3SNEjBKvvXZMMmhJMg5xvI1GBv2jZjN8MsGFlX+54QF9HnvMTc7QiNO4y1tXg==
Received: from HE1EUR04FT043.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0d::4d) by
 HE1EUR04HT223.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0d::133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Sat, 19 Dec
 2020 18:04:37 +0000
Received: from DBBPR09MB4748.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0d::49) by HE1EUR04FT043.mail.protection.outlook.com
 (2a01:111:e400:7e0d::146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Sat, 19 Dec 2020 18:04:37 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:9C20002223661EDD48745AA631796BE4B5FE3935A3C038BCF4B99D2337B30EEF;UpperCasedChecksum:AB742521659062F2D2DE1D67CA1B367E781827872AFF81C43EBB780259C96123;SizeAsReceived:9056;Count:47
Received: from DBBPR09MB4748.eurprd09.prod.outlook.com
 ([fe80::8196:ade4:3e4:3dba]) by DBBPR09MB4748.eurprd09.prod.outlook.com
 ([fe80::8196:ade4:3e4:3dba%5]) with mapi id 15.20.3654.025; Sat, 19 Dec 2020
 18:04:37 +0000
Subject: Re: [OE-core] [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Shachar Menashe <shachar@vdoo.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <AM0PR08MB361713C43176BFA1C7295477C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
 <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
 <DBBPR09MB474859DDE9CBC3963BBFDA67A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
 <3d6a9cee1d07a2329c259c986fe458f4ed8a2409.camel@linuxfoundation.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <DBBPR09MB47482872A1EB65B9A9502107A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
Date: Sat, 19 Dec 2020 19:04:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <3d6a9cee1d07a2329c259c986fe458f4ed8a2409.camel@linuxfoundation.org>
X-TMN: [OGCgrtnPvJkFIPKhXArbShqhJ1qT3qaU]
X-ClientProxiedBy: AS8PR04CA0062.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::7) To DBBPR09MB4748.eurprd09.prod.outlook.com
 (2603:10a6:10:20a::11)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <c4931cc5-1ce4-cc5d-a1d8-fd16b0f8bc41@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (79.215.6.90) by AS8PR04CA0062.eurprd04.prod.outlook.com (2603:10a6:20b:313::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29 via Frontend Transport; Sat, 19 Dec 2020 18:04:37 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: c04372d0-39a0-45ac-8419-08d8a4488c91
X-MS-TrafficTypeDiagnostic: HE1EUR04HT223:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i/CUbLXbQ581BOWDZ59sBGMD5hLmainyHdwyoGFeNQlvgBcHQFr1JkD6qgSy74772jx8m/Mlo4ujRPkkodaUEyfxtd5bsy4e14Cwdww2wQ+Hex9zZpuFpOxOqgEVDhE2t4RmEAXEW48XMkK5RN3tGQQgdZ9BEtnka96F0wIQMIf27sgwbEgkarUP3mvFy5PvhTfbAklcyU7pddR1pd9Th5+R9SwA1p4obfnHRbW5PoScJEvUjuL+hqBIRfTWhPCD
X-MS-Exchange-AntiSpam-MessageData: 
	rvWlcgjRzvRU81cJo4OZIzyQ2hHIG9K9iVZy6QgvQ3RN/FxtnQPtlIbVelt9aTbQilt9wdUpKpqwe4K+pCHplJn/P+hs7ZGcXjhhZi8+tpkQygI5/uMpCBGUGsNjKtHZ4oNNly6MCehLG4OsLeIx9g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2020 18:04:37.5394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: c04372d0-39a0-45ac-8419-08d8a4488c91
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR04FT043.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR04HT223
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 19.12.20 18:58, Richard Purdie wrote:
> On Sat, 2020-12-19 at 18:53 +0100, Konrad Weihmann wrote:
>> On 19.12.20 18:36, Richard Purdie wrote:
>>>    PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
>>> +PACKAGECONFIG[no-tls1] = "no-tls1"
>>> +PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
>>>    
>>>    B = "${WORKDIR}/build"
>>>    do_configure[cleandirs] = "${B}"
>>> @@ -52,6 +54,10 @@ EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
>>>    CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
>>>    CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
>>>    
>>> +# Disable deprecated crypto algorithms
>>> +# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)
>>> +DEPRECATED_CRYPTO_FLAGS = " no-ssl no-idea no-psk no-rc2 no-rc4 no-rc5 no-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
>>> +
>>   From my perspective this breaks backward compatibility, so I would
>> rather have them all that as optional PACKAGECONFIG fields (which also
>> does make it easier for ppl, still relying on one of those algorithms,
>> for whatever reason, to re-enable them) - with the current approach all
>> one could do is to override it with a bbappend - and tbh letting ppl
>> have bbappends for this recipe, doesn't sound like the best idea in the
>> long run to "enforce" any kind of "security" or "hardening"
> 
> Having it as a variable does mean you could customise the variable and
> doesn't mean it has to be done with a bbappend, it can be set from a
> distro config too.
> 
> I'm not sure turning each one into a packageconfig is going to be more
> helpful compared to this in practise...

I'm not sure I follow, as this is a "hard" assign - if it would (in 
theory) a ??= assignment, yes then it would be fine. Still that leaves 
us with a not commonly known variable, while PACKAGECONFIG is more 
widely accepted in 3rd party layers/distros from my experience.

> 
> Cheers,
> 
> Richard
> 
