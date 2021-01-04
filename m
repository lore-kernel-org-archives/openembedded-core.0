Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.89])
 by mx.groups.io with SMTP id smtpd.web09.12998.1609765645378700879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 05:07:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=VKpgWHp2;
 spf=pass (domain: arm.com, ip: 40.107.20.89, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/UDfPaWLBNXHkLbqU88BA3dBYi6REicHD7CNQSs7aE=;
 b=VKpgWHp2CQWmYYioNiA3ZwsL9MVClEhR4SSXiTqil0cMX80SccQreb9yFyzaxOwdxM7dyKr9uprmSDY4P/H1KXplhgqIRvw8DdnY78qZE44/mfi6koEvQHTmVkBT/PQRP2Peue/xjPV/bX0HdbIBTSEx2W6o2zEqmj2IOR2eljM=
Received: from DB6PR1001CA0005.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::15)
 by AM6PR08MB3032.eurprd08.prod.outlook.com (2603:10a6:209:43::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Mon, 4 Jan
 2021 13:07:23 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::8d) by DB6PR1001CA0005.outlook.office365.com
 (2603:10a6:4:b7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Mon, 4 Jan 2021 13:07:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.21 via Frontend Transport; Mon, 4 Jan 2021 13:07:21 +0000
Received: ("Tessian outbound eeda57fffe7b:v71"); Mon, 04 Jan 2021 13:07:21 +0000
X-CR-MTA-TID: 64aa7808
Received: from dafbf0e9230d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B7B3BCC2-E90D-4D0B-A862-1BC3A885EE1C.1;
	Mon, 04 Jan 2021 13:07:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dafbf0e9230d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 04 Jan 2021 13:07:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAsP5RlNtn/QrcpUHNC6Ch6HqjL+j8XFrSTbUy9yB1eJsHXEmpgc1V375589b+8h1M13BdtCf1v6d2yvayqgLpHSGKTewqwMjmZPxOyGuyMAexLU7DokPVXVIOode4aUsv2L6fJgNsS8vzM0Md2B7asP5Vre8EfxcL3eXiXECfUTF4BXaRqIruowJgiflei5R0cyrb9b9FgpuP29+yLbH4IcBkVLzCPgFXL7EEvQgXVTwqDq1JekJa4S3NNLOP7hM+bKBIOIw4jsRqZaRgdUBTtwWsatRN3Jk44eCyFHGbbCs92HYbI1C3AoSRz31VIm2v/znH2qRfJaVJE0yS+12A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/UDfPaWLBNXHkLbqU88BA3dBYi6REicHD7CNQSs7aE=;
 b=OKxIw+hdx3g5sIqnUDbskLeddWty7kHytb7+itF+SyfTUS5NGU8O3O/2kQAOAGnhHcDG0HXvRQRkpZTcbvkhEE3enZ8+cz1Deg9lswmxM4mHixkxOIHnNCy2QoyLrBPOPAQ6KAwLcxHwALYup5MYqb2zCaVvXGObmsxXGSvqL/VxB0Grg2DKEkTfjqKK1oUvYE4Xq2yODdtqogNYeuT4j5QYBTcLd9x7ra1y9CNqW6NzUbBIWQm07FXNBdvOZuyGfgbV2EZxIJDnWdcHBBZxPJLFOhwDVyjE76d1fIiRw+TB5AqcJfOVvkEvDSdza73sByZvv80nyKWB47ESODQ4+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/UDfPaWLBNXHkLbqU88BA3dBYi6REicHD7CNQSs7aE=;
 b=VKpgWHp2CQWmYYioNiA3ZwsL9MVClEhR4SSXiTqil0cMX80SccQreb9yFyzaxOwdxM7dyKr9uprmSDY4P/H1KXplhgqIRvw8DdnY78qZE44/mfi6koEvQHTmVkBT/PQRP2Peue/xjPV/bX0HdbIBTSEx2W6o2zEqmj2IOR2eljM=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB5893.eurprd08.prod.outlook.com (2603:10a6:20b:23e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Mon, 4 Jan
 2021 13:07:14 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 13:07:14 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: add /boot and ${sysconfdir} to SYSROOT_DIRS
Thread-Topic: [OE-core] [PATCH v2] u-boot: add /boot and ${sysconfdir} to
 SYSROOT_DIRS
Thread-Index: AQHW4nPuyC+SLLhA4U2otVmcOQJeLaoXQ8QAgAAA+WCAABCxAIAAFefA
Date: Mon, 4 Jan 2021 13:07:14 +0000
Message-ID: 
 <AM6PR08MB3461DD31D010E15507D15B0892D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <9c29138b53742ac268b54768773f72a2279f3f49.1609748975.git.diego.sueiro@arm.com>
	 <56b88a5513085b38781e02327537289d2fdd8203.camel@linuxfoundation.org>
	 <AM6PR08MB346196292FFCAE3C6499D55D92D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <688508925922a91f009ed5fdb25814d3cbd1cfee.camel@linuxfoundation.org>
In-Reply-To: 
 <688508925922a91f009ed5fdb25814d3cbd1cfee.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: DC2F3EF0227F60449488A9289F967209.0
x-checkrecipientchecked: true
Authentication-Results-Original: linuxfoundation.org; dkim=none (message not
 signed) header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a6285248-df72-4599-ee43-08d8b0b1abf7
x-ms-traffictypediagnostic: AS8PR08MB5893:|AM6PR08MB3032:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB30328FA7985DF797A8C378CB92D20@AM6PR08MB3032.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 cUGNxhDmTsPefOWmDvQ+//X0XMcFmYVHUWzUnRkuwvY/vmQgPlrbdvGfK9eLH1YbD8sH1HnRQVF4BobrlSH6taKjfbWb1RTGG0IUEgTppIAfhh0QD2iTphgKX4GC0l3dGdHfCoNiIIMR9eRkFcLHUoVV/mUkuv3HX3RGHwcw3i8kwNF6xMfxTloArypq0qdvZzf1IPpNDQ0hpRxlbJSob63wzn0zvnIuA9sFVD7XvcZMLq1OhL/dkCJ8+wgVCvDtbwl/E0cg7a7yeWoKXSHthN+7YBViTfYgqLZxxCWOkjAXFiL9rql7f2yxDfMWvfEw9jCDuq4ho0FF0/trDrK1kE733uAztLAWemU481upc3UgxeVdsFf9paOo1sTkGVbj4cEZQzopOgUAPZFFc8hzjvnHWwNHd6rjKLsDUY51d/RXUsWvBWNkwIQ497WaCvRAnpQwT1zzYD/UuilB1LQp+I1VnaUzp+CtSRHf2R6Ljql4nOvy/vU008MnpISufbY+mN/j3G6hX5FGV/0CVWYc6A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(76116006)(66946007)(26005)(33656002)(66556008)(64756008)(66446008)(66476007)(6506007)(186003)(5660300002)(52536014)(9686003)(110136005)(316002)(55016002)(2906002)(86362001)(7696005)(83380400001)(8676002)(478600001)(71200400001)(4326008)(966005)(8936002)(228453006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?RkhjTXBoZmd0WExTYkRsTzRMeGkyY1U2NzA4WDBrcUdjMC9ITTFRTkErODNw?=
 =?utf-8?B?eTBZVFZJNWRNUDRNTlVNcHNkaW9iWVVkZWovTUIxbUw0RW9VSzJsYWx4cVpa?=
 =?utf-8?B?Zy9QZkRta1gzbzZQMEcydG44alFLNlZQbFExaExhZmVQbklOdFpNR21KMWxM?=
 =?utf-8?B?bm5xcmhTRk1ZUmdpaUlTOVZnUHdXVEJpeEljc1NoaGlQNTVJcTNaeWpWL0M3?=
 =?utf-8?B?WDBPM2RxV0hETmtJWkFlMllwUlFhN3hWKzhiL1lLSkZoMTgvbUFDcCtKRUFn?=
 =?utf-8?B?VEFZM0JCNi8xL2RaQ2FBUFNobm1HZTQrY3RBUS9iVUwwMXVzcENlYnQ0T1Qx?=
 =?utf-8?B?MTFKMU5kUGp3eGtsSlErL3E2SkF0UDllTGcvdm9kNEcxQWRlZXBkdjgrbU9W?=
 =?utf-8?B?VEw3K3U4eGZOMEl3VXZTa2tpK1lvVGpEbkpGKysxZ2JEWWh0WTBWbFNyT08x?=
 =?utf-8?B?VE9BZXJlRS9raFpIQTZaQW5KVkVoeHFUMm0vY0xwdDhYd3VEaURRM0NXSWNk?=
 =?utf-8?B?WnU5OVNLZFhTZnY3QUkrY3Uyd0dpU0FzOFU3a0RDTlVWeVlzRU4xZHhib3B2?=
 =?utf-8?B?U0ZEb1lZQmJNTWlXdXh0YWNXMnhreGoxZHlPdkRMUzB6eUQwcE5oT0NoMzdY?=
 =?utf-8?B?UHA1ZmVXUXNkWEw3ekN4ZWordk9NNGpseGhITlQyeFRBTStnTS9BaVM2TWlE?=
 =?utf-8?B?ZnBSTjcxelpwYmFuVFJ6bGhINXhIWExZbUo3b1Z5cjFtTWpmN2QwcEkvbDZw?=
 =?utf-8?B?SnBNYWdPQUlXazg3aE5kRXRBeEorNGxWRXZMVnN3bFZhNitXTDViUTJ6czRF?=
 =?utf-8?B?WlZDNzFGamJYVzlubVExY1lUbUY4YnFmQTN3QTFuQmxPRHdYMEh5MVNkRzFI?=
 =?utf-8?B?QzhXY29jalA0WjNVdGYwWCttaWRMMkNNOEtkKzdkSWJUcVBmdmJNd1ZFRjBG?=
 =?utf-8?B?bmQyWWhZdmZwb0ljSG1RL0RUcUhBYnBVbXh4dTVDcVRYQlM1V3d3K3MzMnF2?=
 =?utf-8?B?RFYwb3QyTFU1V3RzQ1NDR2szOGk0NUt3YmplUWVWYkhPdTF4UXFCRkhUbHNV?=
 =?utf-8?B?c3lqYi9UUWRSWnc4OFNqU1VuY0tzOFFYRVo0VHRjL1RRNXl4R0lMaXYwaW5B?=
 =?utf-8?B?L01sdjQ1MlVUL3M1KzBzTGI5YStZTWp0bEIybFYrK0hkMlRWZDZvaTNCSGoy?=
 =?utf-8?B?TEtOckg5V2FPK1Ywd2hTYUxUVmdRYlJuTnVZZ0lkaW8vS2VvUVNWYlQwakFt?=
 =?utf-8?B?Si8rM1JNY1dobzlsV09tY3RBb2x2Mm5CZlllWnlidGN1TjM3ZVg3eisyeEth?=
 =?utf-8?Q?Dq07/J6iouIYg=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5893
Original-Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a445a90d-2203-441e-86f6-08d8b0b1a7d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kouLvrNha3S1V8ykHy+DR3JlZUcTX6EUKBZivmlSKZD67A4NYeha74A9FyUuu4Ev0kBxcWIl8veqWVB975boa/B6kWScZ3W9Wt6O20OXNDfA1O0JsMQQy9MSNAhal/qvASIGOpiQNDtYumEPLav5+oSl6oQrKLvJ1xw5yTObIp7T+BpbuaOIgHaqC6gfYzZGwMhDFlapmdkFR95f/BK/wPmkaKY23nADir7B2znxb/I+O5YXbfI1uGsyzROwQHPTtx4reB0Xh6kPN7PjfeLw4pVcgObRlEL8hLjx3g5IYMxLJHpcH3snn2eZAjgpVQTOMgWvZojp5gY7J4ZDALmkTSlnZlQyg4JRfjFNJJf+Wo+BcbBbAHtssn3qVUQbdD732FPjERc3laiEP0CU7jupG7diOr3OVLN7/hR5RdanKAsj4YPysvtN8gO2jsDh/Q+ap34oEBidgwy1AyPmvRA7VzamV6krzgDKxRysz/j6ddkFBFlQs5N5rJdpPnxROXBqkwYNS0Y9oagjz7y5QTMfR2OcmgqC1BlCiBHEXbZLN03iG6D0Wfz8BZWP0Dgvf2K/
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966006)(5660300002)(26005)(86362001)(6506007)(316002)(82310400003)(82740400003)(966005)(478600001)(8676002)(52536014)(356005)(2906002)(81166007)(55016002)(110136005)(83380400001)(9686003)(336012)(33656002)(8936002)(186003)(70206006)(4326008)(70586007)(47076005)(7696005)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 13:07:21.3697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6285248-df72-4599-ee43-08d8b0b1abf7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3032
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+U2VudDogMDQgSmFudWFyeSAyMDIxIDEx
OjMyDQo+VG86IERpZWdvIFN1ZWlybyA8RGllZ28uU3VlaXJvQGFybS5jb20+OyBvcGVuZW1iZWRk
ZWQtDQo+Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+Q2M6IG5kIDxuZEBhcm0uY29tPg0K
PlN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYyXSB1LWJvb3Q6IGFkZCAvYm9vdCBhbmQg
JHtzeXNjb25mZGlyfSB0bw0KPlNZU1JPT1RfRElSUw0KPg0KPk9uIE1vbiwgMjAyMS0wMS0wNCBh
dCAxMDo1NiArMDAwMCwgRGllZ28gU3VlaXJvIHdyb3RlOg0KPj4NCj4+IFNvcnJ5LCBJIG1pc3Nl
ZCB5b3VyIG1lc3NhZ2UgaW4gdGhlIElSQyBhbmQgd2FzIG9uIGhvbGlkYXlzIGp1c3QNCj4+IHJl
dHVybmluZyB0b2RheS4NCj4NCj5ObyBwcm9ibGVtLCBJIHRoaW5rIHdlJ3JlIGFsbCBjYXRjaGlu
ZyB1cCBhZnRlciB0aGUgaG9saWRheXMhDQo+DQo+PiBGb3IgZXhhbXBsZSwgaW4gdHJ1c3RlZC1m
aXJtd2FyZS1hIHJlY2lwZSBpbiBtZXRhLWFybSAoDQo+PiBodHRwOi8vZ2l0LnlvY3RvcHJvamVj
dC5vcmcvY2dpdC9jZ2l0LmNnaS9tZXRhLWFybS90cmVlL21ldGEtYXJtL3JlY2lwDQo+PiBlcy1i
c3AvdHJ1c3RlZC1maXJtd2FyZS1hL3RydXN0ZWQtZmlybXdhcmUtYS5pbmMNCj4+ICksDQo+PiB3
ZSBoYXZlIGFuIG9wdGlvbiB0byBpbmNsdWRlIHRoZSB1LWJvb3QgYmluYXJ5IChhcyBCTDMzKSBp
biB0aGUgRklQDQo+PiBpbWFnZS4gQW5kIHRoaXMgaXMgYWNoaWV2ZWQgYnkgcGFzc2luZyB0aGUg
REVQTE9ZX0RJUl9JTUFHRSBwYXRoLg0KPj4NCj4+IFRoZSBpZGVhIGZvciB1c2luZyB0aGUgU1lT
Uk9PVF9ESVJTIGlzIHRvIG5vdCBkZXBlbmQgb24gdS0NCj4+IGJvb3Q6ZG9fZGVwbG95IGluIG9y
ZGVyIHRvIGJlIGFibGUgdG8gdXNlIGl0cyBnZW5lcmF0ZWQgYXJ0aWZhY3RzLiBJJ20NCj4+IGp1
c3QgdHJ5aW5nIHRvIGZvbGxvdyB0aGUgcmVjb21tZW5kYXRpb24gbGlzdGVkIGluIHRoZSBtYW51
YWw6DQo+PiBodHRwczovL3d3dy55b2N0b3Byb2plY3Qub3JnL2RvY3MvbGF0ZXN0L21lZ2EtbWFu
dWFsL21lZ2EtDQo+bWFudWFsLmh0bWwjDQo+PiBuZXctc2hhcmluZy1maWxlcy1iZXR3ZWVuLXJl
Y2lwZXMNCj4+IC4NCj4+DQo+PiBOb3RlIHRoYXQgc29tZSBvZiB0aGVzZSBhcnRpZmFjdHMgYXJl
IG5vdCBleHBlY3RlZCB0byBiZSBpbmNsdWRlZCBpbg0KPj4gdGhlIGZpbGVzeXN0ZW0uDQo+Pg0K
Pj4gSW4gbWV0YS1hcm0sIHdlIGFyZSB1c2luZyB0aGUgU1lTUk9PVF9ESVJTIGFwcHJvYWNoIGZv
ciBvdGhlciBmaXJtd2FyZQ0KPj4gcmVsYXRlZCByZWNpcGVzIHRvIHNoYXJlIGZpbGVzIGJldHdl
ZW4gdGhlbS4NCj4+DQo+PiBXZSBoYWQgc29tZSBzaXR1YXRpb25zICh3aGljaCBJIGRvbid0IHJl
bWVtYmVyIGV4YWN0bHkpIHdoZXJlDQo+PiBkZXBlbmRlbmN5IGN5Y2xlcyBvY2N1cnJlZCBiZXR3
ZWVuIGRvX2RlcGxveSB0YXNrcyB3aGVuIHRyeWluZyB0bw0KPj4gc2lnbmluZyBvciBjcmVhdGlu
ZyB3aWMgaW1hZ2VzLCBhbmQgYnkgdXNpbmcgdGhlIGNvbWJpbmF0aW9uIG9mDQo+PiBTWVNST09U
X0RJUlMgYW5kIERFUEVORFMgd2UgbWFuYWdlZCB0byBvdmVyY29tZSB0aGVzZSBpc3N1ZXMuDQo+
DQo+SSB0aGluayB5b3UgYXJlIHJlYWRpbmcgbW9yZSBpbnRvIHRoYXQgbWFudWFsIHNlY3Rpb24g
dGhhbiBpcyBpbnRlbmRlZC4NCj5Gb3IgZmlsZXMgb24gdGhlIGdlbmVyYWwgZmlsZXN5c3RlbSwg
dGhlIHN5c3Jvb3QgaXMgZGVmaW5pdGVseSB0aGUgd2F5IHRvIHNoYXJlDQo+YmV0d2VlbiByZWNp
cGVzLiBGb3IgZmlsZXMgdGhhdCBhcmUgbm90IHdpdGhpbiB0aGUgZmlsZXN5c3RlbSwgSSB0aGlu
ayBkZXBsb3kgaXMNCj5tb3JlIGFwcHJvcHJpYXRlLiBXZSBjb3VsZCBpbXByb3ZlIHRoZSBkb2Nz
IHRvIG1lbnRpb24gdGhhdC4NCj4NCj5BcyBzdWNoIEkgZG9uJ3QgcmVhbGx5IHdhbnQgdG8gYWRk
IGEgbWVjaGFuaXNtIHdoZXJlIHdlIGNvbmZ1c2UgdGhvc2UgbGluZXMNCj5pZiB3ZSBjYW4gaGVs
cCBpdCBhbmQgSSBhbSByZWx1Y3RhbnQgdG8gdGFrZSB0aGUgcGF0Y2guIGRvX2RlcGxveSB3YXMg
ZGVzaWduZWQNCj5mb3IgdGhlc2UgY2FzZXMuDQo+DQpGb3Igc29tZSBhcm0gYmFzZWQgbWFjaGlu
ZXMgd2UgZW5kIHVwIGdlbmVyYXRpbmcgbG9hZHMgb2YgaW50ZXJtZWRpYXRlIGJpbmFyaWVzDQp3
aGljaCB3aWxsIGJlIGZ1cnRoZXIgcHJvY2Vzc2VkIGFuZCBjb21iaW5lZCBhcyBzdGFuZGFsb25l
IGltYWdlcywgZm9yIGV4YW1wbGUuDQpJIHRoaW5rIGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBoYXZl
IHRoZW0gaW4gdGhlIGRlcGxveSBkaXIgc2luY2UgaXQgd2lsbCBtYWtlIGl0DQpwb2xsdXRlZCBh
bmQgSSBkbyBtdWNoIHByZWZlciB0byBoYXZlIGEgdGlkeSBkZXBsb3kgZGlyIHdpdGggb25seSBh
cnRpZmFjdHMgZm9yDQpmbGFzaGluZy91cGRhdGUgdGhlIHRhcmdldCwgcmF0aGVyIHRoYW4gYSBs
aXN0IG9mIHVzZWxlc3MgYXJ0aWZhY3RzIHRoYXQgY2FuJ3QgYmUgdXNlZA0KZGlyZWN0bHkuDQoN
CkFuZCBJIGRvIGFncmVlIHdpdGggeW91IHRoYXQgdXNpbmcgdGhlIFNZU1JPT1RfRElSUyBmb3Ig
dGhpcyBwdXJwb3NlIG1pZ2h0IGxlYWQNCnRvICBjb25mdXNpb24uIElzIGl0IHBsYXVzaWJsZSB0
byBjb21lIHVwIHdpdGggYSBuZXcgdmFyaWFibGUgYW5kIGRvX3BvcHVsYXRlIHJlbGF0ZWQNCnRh
c2tzIHRvIGFkZHJlc3MgdXNlIGNhc2VzIGxpa2UgdGhlIG9uZSBJIGRlc2NyaWJlZD8NCg0KPklm
IHlvdSBjYW4gZmluZCBvdXQgbW9yZSBkZXRhaWxzIG9mIHRoZSBpc3N1ZSB5b3Ugd2VyZSBydW5u
aW5nIGludG8gd2UgbWlnaHQNCj5iZSBhYmxlIHRvIGhlbHAgZmlndXJlIG91dCBob3cgdG8gYnJl
YWsgdGhlIGNpcmN1bGFyIGRlcGVuZGVuY2llcy4NCj4NCkFzIHNvb24gYXMgSSBjb21lIGFjcm9z
cyB0aGlzIGtpbmQgb2YgcHJvYmxlbSBJJ2xsIGxldCB5b3Uga25vdy4NCg0KPkNoZWVycywNCj4N
Cj5SaWNoYXJkDQo+DQoNCkNoZWVycywNCg0KRGllZ28gU3VlaXJvDQoNCg==
