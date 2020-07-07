Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.65])
 by mx.groups.io with SMTP id smtpd.web11.24247.1594150482230661504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 12:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=BztC9Pkd;
 spf=pass (domain: outlook.com, ip: 40.92.16.65, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBqgZ1/Oth1RR/qQYv/8E3x+KfH0LbE0RNKcA0b+xH0H59lPDVbiltHIVf44ZJh6he/MCZEsRN7/eioWJpsbSStHIxlTybS2FN9j+4gfvI6MZr5qmgW8eMUEMHmatAY0Ib8DkplY2WVB+KyUv5YKu0sre/kQLR6gouWlV/UBiVIOWL/c0X47n30mmHdAGC6D0tO8+c3GT+gtZRWzNCI93yxlPxliuO26Dwf6ZT/1nrHSQ47A+7/eCeqHDtrH25xsdm27LNT7OPMs0HuieGx2GYMr4TVtoex+Sfx2Pjhgv3WdVl3lQUw7cNTt5ZMHdnMIxOeQtAJ05WYW7z7gGvtAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lV4XBvZ8PHZEEevQIEjdjGSnC06RkWEZaK6cd3LyZ/w=;
 b=C7r1ru0Qx99Z7zRvoB8K4dUhjklv6HfDpcmbLck9ggLgTeUkib+TW9CbSZBhpMS2XrOGJQfzu2idvM4g2WoFPFi/pfVh3FTiWts1jB/sc3lR6WeYXoqbLGDBOE35djcLcDP4ZabSdFjjVm50I78Wcgs+vevC7SMGJFoL0wK88kBzlD14kBPzHkjVi98BnUCzpB/2CjASVe3QzfNLm6F/THHq0nePmsw+oIsdRZbKgN1ixKpILR0ZQ8IDpZ2lL57TrTx3Dz8mVqkNoxt1/F3JgfAf89o8TlJQLcMXRB9in3/2iRCRxJvnCuAotxb7X4SXKy/I73Y66d6k3rQl8JoCdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lV4XBvZ8PHZEEevQIEjdjGSnC06RkWEZaK6cd3LyZ/w=;
 b=BztC9Pkd0IiYv56LM7tWeLmPg+rJYRZl1WlZXYB6tK3VLW4/i1kapoGv0IbyDbATenT/yOBjyiCTYH2kI2XgA7rhH+/Mmve49FG7njCRbBkaky/SOf5kkbf3/ni71DM+X3NWnBx1fp7AuoO4wPMGEV/8caKiMwWxYF63kSQPa7hhw6klsTDDTw5z8oWZKy35E/yy1qjkinanVZ6q0OR8dIXbRdTjv5SL8bFPZ0stimhSNMz+bUlXGFAO08G4Zk8Cp2CM1pvrTgMYA6RXufkS9vv7fqSYSkkCkEIm5rUYUHA1ouyOivf66MVsrMdm2LhCv7iZJgQGqckJd+QoHiynVA==
Received: from DB8EUR06FT030.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::45) by
 DB8EUR06HT056.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::340)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Tue, 7 Jul
 2020 19:34:40 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc35::4c) by DB8EUR06FT030.mail.protection.outlook.com
 (2a01:111:e400:fc35::316) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24 via Frontend
 Transport; Tue, 7 Jul 2020 19:34:40 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:FF23396365831999C40BD9731BDB4112FE6B7A85584F5427B837F1642A70A2F6;UpperCasedChecksum:74336438A245B0CFF221968F46E72019A600A7267F510A93E4CA2F355C6E9C0E;SizeAsReceived:8896;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3174.021; Tue, 7 Jul 2020
 19:34:39 +0000
Subject: Re: [OE-core] [RFC][PATCH] distutils: put tests to a separate package
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <PR3PR05MB6890710E8729FAD4ED19D5F4A8660@PR3PR05MB6890.eurprd05.prod.outlook.com>
 <c16a183feaffb57121e74462dcd56816220daeac.camel@linuxfoundation.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM7PR05MB68813E4C4054D8A201FD2DACA8660@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Tue, 7 Jul 2020 21:34:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <c16a183feaffb57121e74462dcd56816220daeac.camel@linuxfoundation.org>
X-ClientProxiedBy: AM5PR0402CA0008.eurprd04.prod.outlook.com
 (2603:10a6:203:90::18) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <621a281e-8973-9a71-25d7-59e792409d80@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (79.215.7.122) by AM5PR0402CA0008.eurprd04.prod.outlook.com (2603:10a6:203:90::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Tue, 7 Jul 2020 19:34:37 +0000
X-Microsoft-Original-Message-ID: 
 <621a281e-8973-9a71-25d7-59e792409d80@outlook.com>
X-TMN: [Cl+1U4nSTqPRauXM5+QwwHdvDcZYULeX]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 00798b8d-32c4-4511-6dc5-08d822acc8e2
X-MS-TrafficTypeDiagnostic: DB8EUR06HT056:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aLTUfjgTHeA5znSKw7cCNVP8jCvnYTmJ+U/trAGYOj9yAvwKE+9wpFPXG32l5kD2lf2sDzfffAF7GcUSB1/MoP57Xrm/jNBQeSLaq/WfAmxcig+OcyjobddkNVAPYFMH97hbmFjipAWoLdsHcdqCJiuBukYgGoS6C4cySq2yQ4li9me/RUewkUgdZgJuyLfKITMH7/ZaJT0UmfUKZyZPOA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	Kd8qFHhU8ufdRWo39lEsL59vV6veWsUu0gr+ffDGt5f0dRpWxlm/ONSwdnxHr5dYz+qKJKikMgk0QZmNHd79isGJJWI7PSgxJAEFeOVjeQ7vWpqLHMa7AbM/tS86eXQoIWjo0zANbyyyYq0+pRjoNg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00798b8d-32c4-4511-6dc5-08d822acc8e2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 19:34:39.7280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR06FT030.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT056
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

That's a very good question.
I myself haven't seen python unit tests used via ptests in the wild, but 
if that is used, yes fully agree, it should be rather PN-ptests than 
PN-tests.
BTW it would also require to create a run-ptest file, which would 
complicate things even more.

Regards
Konrad

On 07.07.20 21:25, Richard Purdie wrote:
> On Tue, 2020-07-07 at 21:01 +0200, Konrad Weihmann wrote:
>> Put files from installed tests into a separate package to avoid
>> having
>> them in an image unwanted and to avoid having more runtime
>> dependencies than necessary.
>>
>> Background:
>> As setuptools is pretty much unregulated in terms what is installed
>> by some module, even tests are installed into base package, which
>> then
>> go right into production, although completely unnecessary.
>> When now trying to determine the needed runtime dependencies, more
>> than actually needed will slip into the image.
>> To give a really bad example GitPython ships its tests into
>> production
>> leading to the effect that theoretically besides the known RDEPENDS
>> python3-asyncio, python3-distutils, python3-idle, python3-misc,
>> python3-pickle, python3-shell, python3-ddt and python3-nose would be
>> required.
>> That's why I came up with the idea to package tests (if existing)
>> into
>> a separate package, which is NOT installed by default.
>> Please let me know if you see any issues with that patch
> 
> Shouldn't these be part of a PN-ptests package to match the rest of the
> system?
> 
> Cheers,
> 
> Richard
> 
> 
> 
