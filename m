Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.92.70.100])
 by mx.groups.io with SMTP id smtpd.web12.6235.1590068903180197895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 06:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=aTCSECrd;
 spf=pass (domain: outlook.com, ip: 40.92.70.100, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxGtu+XY3kwB58PtUjnVGSGN3fzEEvXDPR0bk2B/nKgw8P4ILq+BW1OaoP4gVeYTp46Z/k0onhDpEFGZnUTAPYjc02+XGzhoYmR8FN5lyGKNjCLS0PcJF6J3S0cXVMz3f4AQqAWUiIW7FswFwzlBH/806SEDfAao6L4/VqLTrRFYK3/xC3kau1AxnnFyUhhETgKpSQOyQyuHmTymvZXckyS9KME+Ji7aswzXN/7br/NZHk0P+mxoRTkmCjMHRGXKcSxBTjAGfv55ND2Btf46p1/TMhr06QYDryWjpV14/iCc3YF+OleAh6PZ8z2c2lb0Co4l6TxttJ/Be14P9S5wPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7EKwe7MG1gkW6hNivqGGknNXV2j/T/wyVmWCFwPTww=;
 b=GUhoHmjaaK94MPRqgGmj6+5TxUPOrMEum0zxRCJ/6KDPYO1Xkja10+dNO6RySPB3sI7jWa6Iww+7fojEq30mLsk8J7hG2bNkpbb3zHwbSGxVWv12cstqprWKUr4s9BIZYT5tZZ7j7vEQcpBYBxOagTJrNsoBSPYI0uE83Q6RrQTidrtavHtq0y9Jsq13ij4PZg8JXKeuaojIsok79aRffKhoaJyJ3vceIcWqKk2wIaXOXFsx/OILAOY7bmUbJPmOeAIUoNtwaYbZgpjlV3zt8ZrOVfMxUFRPOq3FrB3EbDIxprTtFaBvwSYO0/V8t1nojQsSlzRnuDLqcVDZEYpmEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7EKwe7MG1gkW6hNivqGGknNXV2j/T/wyVmWCFwPTww=;
 b=aTCSECrd8XhNpJuQlDcSDeVISdHXJX6a3X/cfVZMw26v7q7NqAIQuqzZdbcYYi+Inu3npiDiTG9nlFqaeD1hHsZ/L8uw6elklXLWzZBTIQFlUoDBam1rXvlXhjtxS7K7Zu4N++qDOzw+U4FWQdLungGoBBg9LFeejIRIorTGRyrtaEsxBFo1fR713/QZUO6X5dfuZY+ON7VCeyfKVe14sgNv0ovQkXIsoNtAYSpFH+IahwSeADboaM3VErflFOEiBj7N8p7uYIlxF4/sebcwtW0XcyzEDQJIbRATeKi3P+LBHsvPx4kDyEAoQo8YfBJkGOZ6lrfMAmULypWZ0ROBFw==
Received: from AM5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2a01:111:e400:7e08::47) by
 AM5EUR03HT165.eop-EUR03.prod.protection.outlook.com (2a01:111:e400:7e08::500)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Thu, 21 May
 2020 13:48:21 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e08::52) by AM5EUR03FT044.mail.protection.outlook.com
 (2a01:111:e400:7e08::312) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Thu, 21 May 2020 13:48:21 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:4B6E9D30A8B5F604C99B36788BAEBD575C4EA48D98DDB849048AF1E7DE0D2210;UpperCasedChecksum:0A1C9AB1D9B3CC89E1608CD67AD8AEB1A0753706DC6F1EDA2C81227797E200F5;SizeAsReceived:9100;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%6]) with mapi id 15.20.3021.026; Thu, 21 May 2020
 13:48:21 +0000
Subject: Re: [OE-core] [PATCH] package_ipk.bbclass: print opkg output on error
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <AM7PR05MB68813C6F4A99F236D682914CA8B90@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <4c0bdb8031119a16004ecf9aa5d1a19dc0ec397d.camel@linuxfoundation.org>
 <AM7PR05MB68818CD461CF14303C8BCA71A8B60@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <7a02c0387c1d4f12c9e72189c1a6260a85191fca.camel@linuxfoundation.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM7PR05MB6881562875D2D579337A1517A8B70@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Thu, 21 May 2020 15:48:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <7a02c0387c1d4f12c9e72189c1a6260a85191fca.camel@linuxfoundation.org>
X-ClientProxiedBy: AM6P192CA0040.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::17) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <ca23fe57-d1b2-4d9d-5d1a-c2980241c490@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (87.141.92.91) by AM6P192CA0040.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Thu, 21 May 2020 13:48:20 +0000
X-Microsoft-Original-Message-ID: 
 <ca23fe57-d1b2-4d9d-5d1a-c2980241c490@outlook.com>
X-TMN: [tkgW4E8tCoPcOnCjoeKhrSxIEH3TYoEB]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 3763758b-eb00-4bdf-bd41-08d7fd8d9fd5
X-MS-TrafficTypeDiagnostic: AM5EUR03HT165:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wBVT/fauvRCJ/ZvP4PBWmjWV4vzMohWzF7+Qsv4lrPho3TMn3ZwF8GjiI3WOrqg21YqPU5CmxWJ+TeoxHfiPIUjjY4Gkwwb1oDPJqS+ggGGhhtMfwF+1OHi/gNPnCk0ScBoiIU8Ii0/Z9OHuky6xR7v3jg32QFiZwJMxIzUKXBy3cx1OVFrxwxieJHbeZK5wBufDAziuDUSll31igxfn4Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	2pVQKopoXeHAkcG+DpCcpBEa2RnTlR6xDQ2ykSDhysLF1Kd4RUnS7kVFad0nRtxztvHAjvBmdUuf4eWV2rhPRRx29X/m9jQxoXiB2jZqP0uXsRbpljcFuJ+5Hd2YcqheHNa68B5mMtf83nn1uIRKrA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3763758b-eb00-4bdf-bd41-08d7fd8d9fd5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 13:48:21.4137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT165
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Yeah you're right 244cbcce0ecc4691a9ddfb0a44dc487ff7af0670 should 
already fix that. The last time I encountered this issue was on thud, 
where this fix never got applied - so all should be fine, patch can be 
ignored, as all branches starting from warrior are safe, there is really 
no need for any action here

On 21.05.20 15:24, Richard Purdie wrote:
> On Wed, 2020-05-20 at 22:17 +0200, Konrad Weihmann wrote:
>> On a second thought it should be bb.error not bb.fatal - are all
>> okay with fixing just this one for now?
> 
> I think the problem here is specific to the way parallelism is done
> with oe.utils.multiprocess_launch.
> 
> A quick grep shows a few users:
> 
> meta/classes/package.bbclass:        results = oe.utils.multiprocess_launch(oe.package.is_elf, checkelflinks.values(), d)
> meta/classes/package.bbclass:        results = oe.utils.multiprocess_launch(oe.package.is_elf, checkelf.keys(), d)
> meta/classes/package.bbclass:        results = oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles), d, extraargs=(dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d))
> meta/classes/package.bbclass:                results = oe.utils.multiprocess_launch(splitstaticdebuginfo, staticlibs, d, extraargs=(dvar, debugstaticdir, debugstaticlibdir, debugstaticappend, debugsrcdir, d))
> meta/classes/package.bbclass:        oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
> meta/classes/package.bbclass:        oe.utils.multiprocess_launch(inject_minidebuginfo, list(elffiles), d,
> meta/classes/package.bbclass:    processed = oe.utils.multiprocess_launch(oe.package.filedeprunner, pkglist, d)
> meta/classes/package.bbclass:            results = oe.utils.multiprocess_launch(linux_so, linuxlist, d, extraargs=(pkg, pkgver, d))
> meta/classes/package_ipk.bbclass:    oe.utils.multiprocess_launch(ipk_write_pkg, packages.split(), d, extraargs=(d,))
> meta/classes/package_deb.bbclass:    oe.utils.multiprocess_launch(deb_write_pkg, packages.split(), d, extraargs=(d,))
> 
> and I think any subprocess usage within any of these functions is at
> risk from this issue.
> 
> Is there some way we could add a fix to oe.utils.multiprocess_launch()
> ?
> 
> Cheers,
> 
> Richard
> 
