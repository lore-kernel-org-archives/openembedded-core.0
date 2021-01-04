Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.84])
 by mx.groups.io with SMTP id smtpd.web12.12183.1609757776326880626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 02:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=nLh3WW2k;
 spf=pass (domain: arm.com, ip: 40.107.20.84, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ws5jMzPb/lJ+pCDoxoJZZkPA6whv4jvq3DSLXXSA3w=;
 b=nLh3WW2k7dm1SC9/8KK58/NFIMUTl8pKHAPO39KZbznRcI63DXQrUwcCZE3Q92fZvuu7q5561ojFBkaQpuS1OzZHLWc5FE1pLbw5dyh+eBbT8m4DR/S2JGdTcj0MUbCLSG0VnAEtri20fed4BjVZ4WclJuNKMeGp65gFDS/NyPE=
Received: from AM6PR08CA0031.eurprd08.prod.outlook.com (2603:10a6:20b:c0::19)
 by DB6PR0801MB2021.eurprd08.prod.outlook.com (2603:10a6:4:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Mon, 4 Jan
 2021 10:56:13 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::72) by AM6PR08CA0031.outlook.office365.com
 (2603:10a6:20b:c0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Mon, 4 Jan 2021 10:56:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.21 via Frontend Transport; Mon, 4 Jan 2021 10:56:12 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71"); Mon, 04 Jan 2021 10:56:12 +0000
X-CR-MTA-TID: 64aa7808
Received: from 68944e7a2add.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6F9C4FC0-B83E-4F2C-8F47-AD0D0F1D65D9.1;
	Mon, 04 Jan 2021 10:56:07 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 68944e7a2add.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 04 Jan 2021 10:56:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ht7YV+SgInheg6gJF1omi+i3U0SuizY61cZqmy2cieVwJVFDlOZNVFLxvlG6/nLZoadXssB4Md+lMGFgoN9hHFucPXVJNgredpnrGJMFL/nRDXTGWU/4Vh62S2njI/8tF/inuPlcjOCOW+MC9hKp6bQWQ0JYzhilKgcnYWFe4uMDZg5fli2jcqeGEUE8PStmHA5jc1zWXMjVdKo6erd9/+9UbDfqfjGsP1dsS09VUDBUAVLvRDTHH04JulW8rrOtK2AUrGKgTWoGxHwKn/5VheWKTyfbpy1ELcftKWIUzs4UZ+SnzoNptqces3JaPSUxyd8rp2zw7FGWgdP+g57AYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ws5jMzPb/lJ+pCDoxoJZZkPA6whv4jvq3DSLXXSA3w=;
 b=fMNpTPoDYpR0UpU2oHYi+/atXqrM0N9ut1I0X8WX8VZIaZ9DoYyj3XLOMhUignjq9r5OS8EZpYJVwyN557muKOJtkvczgpPyqWvko/OyXc+qJ6AkKyzyEplkKmg9sI0c+HY13/cFaD0Vw/aXS/+iq4bMdwCsoqV4BfRbfe/nXfHQw+GjFIPzCGmicxsye+dXw9ePe8uHnT5PMDqKqxFfckSxx7TsCMKSgZ6OICS2j6vG4Xc70BpKw8fQ8I+EPcv1WMI95DJk+gUolr9AypFVKJuwSYv/d/yDLwHIpGzsm0IV2N/Nyau4tpbDC6AiImELIoIhLUZ4VINwg8kJFdV0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ws5jMzPb/lJ+pCDoxoJZZkPA6whv4jvq3DSLXXSA3w=;
 b=nLh3WW2k7dm1SC9/8KK58/NFIMUTl8pKHAPO39KZbznRcI63DXQrUwcCZE3Q92fZvuu7q5561ojFBkaQpuS1OzZHLWc5FE1pLbw5dyh+eBbT8m4DR/S2JGdTcj0MUbCLSG0VnAEtri20fed4BjVZ4WclJuNKMeGp65gFDS/NyPE=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB1812.eurprd08.prod.outlook.com (2603:10a6:203:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Mon, 4 Jan
 2021 10:56:06 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 10:56:05 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: add /boot and ${sysconfdir} to SYSROOT_DIRS
Thread-Topic: [OE-core] [PATCH v2] u-boot: add /boot and ${sysconfdir} to
 SYSROOT_DIRS
Thread-Index: AQHW4nPuyC+SLLhA4U2otVmcOQJeLaoXQ8QAgAAA+WA=
Date: Mon, 4 Jan 2021 10:56:05 +0000
Message-ID: 
 <AM6PR08MB346196292FFCAE3C6499D55D92D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <9c29138b53742ac268b54768773f72a2279f3f49.1609748975.git.diego.sueiro@arm.com>
 <56b88a5513085b38781e02327537289d2fdd8203.camel@linuxfoundation.org>
In-Reply-To: 
 <56b88a5513085b38781e02327537289d2fdd8203.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 3A22C90965BF384B9F7F27C2E1B543C9.0
x-checkrecipientchecked: true
Authentication-Results-Original: linuxfoundation.org; dkim=none (message not
 signed) header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 02700bfc-f2a8-443b-3180-08d8b09f59a9
x-ms-traffictypediagnostic: AM5PR0801MB1812:|DB6PR0801MB2021:
X-Microsoft-Antispam-PRVS: 
	<DB6PR0801MB20216F5D160BD25EE902944892D20@DB6PR0801MB2021.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0670RiS92odomz/uWxn2NM1Id4ISEoycwLkR54gU05Lioo8pendAP/njJ1rIYbZtSs3kh38TfIbUX3/iHXj3lwrY9lV4dx12dCoJGZ6fnGkfmRiq0N2JrCZlYpYQYY0RI7jEIFpFNEHZN6v9zjxQe4m+5z7XsD0KTrKhXCE2iIP/hpLhWJTrcwj710chUyGPSYu7meK5uK/INN12zAc+Bb0Ma1RKr1EW1aeMIHLWf975s0Y01Hq3O3HlcqWTh21ml5BPyZ20XElWhQCAI36+La8kMElgHRCSlSUe7cgrpY5knNMYFWEDBL3XblcsbCMJ0jGKb4tq16JIpHMEbWuhtCBFAPZ9FyW5gQazrmFEA3f18pvkc1J6kr37Lqs7jQdHlARmzDmtKjlw+QpGvGpRI56K/LsjS3vk9FTabl08B6qPtyJDONJrnhd4e+rn2FO9CS3Y0s6xsPNF7V5e8qBS/gjq1uTkxBV/V0doGWIfSJFDFUZWpF60UCsT06FIrEMLgfyrf5h61tbBBZbFo2p04Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(8676002)(6506007)(86362001)(966005)(71200400001)(186003)(26005)(4326008)(2906002)(478600001)(33656002)(66446008)(66946007)(64756008)(83380400001)(76116006)(55016002)(7696005)(9686003)(52536014)(66476007)(66556008)(5660300002)(316002)(8936002)(110136005)(228453006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?M3hIRWY5SEVtVUFXaUpUNVo0b1Mvcm11bml1bUs1TFc5NzBCWE8vSGNaak5p?=
 =?utf-8?B?dldGNXZmMUl0d1RaRHFteU52OUQySmVPanBOdWloUmdEdk9Jc2R6WTBpS1Bt?=
 =?utf-8?B?em81dk90THRNSDdSM0tMUWdtQlJsc3ZTMjJxQXZZZXowcVlNVUd5NXBVb2VV?=
 =?utf-8?B?bnhnSlg4M3p3OWU1Q052d0IzUXlEbWlqYjlCNGdMcUlPYnpkQktLUjhSVFg2?=
 =?utf-8?B?ai9xZFA4ckMrKzFqUUhrOFhERTR5aFl1RTVvczdpWXJnNmwzRWtuMkVIVTA3?=
 =?utf-8?B?SWs3Z1o1QnBEVmdPQ0hvMmxvRm5qWitKdFNTcVpWT1hYcUR5RE9lSk1OU2hO?=
 =?utf-8?B?dWJ1WUlzU3hFajV1ODEzYUVLK3A0S1JkUWlHa0pKVExtNjlBS2Z1MzlKTmdJ?=
 =?utf-8?B?Mko5cDI3S0xUMjNHWlc1bmZXeTNRUUVFalFtd0JvbXE4NHdWenRmK0pHUDBS?=
 =?utf-8?B?d1JsT3VOYWdYMmFieXBBSG9lZ3pDNlpsNW4xYy9HbG5Sc1lUOXQ4eUNxbVky?=
 =?utf-8?B?WDRocFoycmNodXd5NTl2aVV3cXM1dWhRc3ZBZEltbHVBb1ZSRzRCWGwzUG9D?=
 =?utf-8?B?amhoME5saEpaNTFJaUppR2MzaXdLSXppdUFYRHh0QjlQRERKSzgxUEVsdm5m?=
 =?utf-8?B?c2FWTkxNNE12d003Uk96ZFRkQnkyL3RpZURsVzliMjZGT2hodmVNU0g4dUdE?=
 =?utf-8?B?enVPb3A2Zm9wQzlPY09Ja0cyYTkzVXVqVERpVTByQjhYTmhPakJkZ2U3Y3l6?=
 =?utf-8?B?UUJ0ZlQ3OGJ4UVMvTmZ3VHkwWjZ0cXpWeXFINUVDYlpRNFdCRVIrMlRNZHA1?=
 =?utf-8?B?RExSbzlkWlpqMlZXMUZGQjhmb013c0V0QmZ2YVF2SjMzM2VLMWViZ0g5S1Nq?=
 =?utf-8?B?d2dGbjY2T25rOWE1dU1valNxSSsvbFdONlVnSTE4R0lVYW85bGEzdm8vbVZH?=
 =?utf-8?B?Z1NOUHpXUmdoMzZqaXZlTGZ2ZVRzSVJJOFE4Z0d2SzF4K0V3Tys2UWRJNDBU?=
 =?utf-8?B?bzFSN3hvNE9GTWJ2ZGxQZGtCdERTQU14a0dSbHQyOXJrUVZOaG1ZSU45SU1P?=
 =?utf-8?B?L0xjOS8yRm9TZ01HYkdINkpReVdvZXJpamVIOCtpRGVrUm1pREcyMmVjellq?=
 =?utf-8?B?Z1FWVGJpb1pJK1lYMVIvWGthdGF1WkJTYXNBQWFSTmxiWXd1WTBnb1dFekRu?=
 =?utf-8?B?TExoSGFueUJzSFQvRWJXMUJIR3JFU292MXdyK215ZnJIVmxCdm5RN0RaaGV4?=
 =?utf-8?B?alE1Visvbk1ML0lOWHdHWGhVVDZUcWdDV2xRajdHUmRCNVhhMkNqQWN5cnRB?=
 =?utf-8?Q?xnCasqZCuQXHY=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1812
Original-Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	89f544fb-45b9-4b3c-56b1-08d8b09f55d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rlTz9ZeDXeNPC5/KUgzeTAQDUDxOX4M9kpJrq/P9kKSrmEZBhC0LC+23ItCHvebuvn219ONpdDaToVmmhcEOt2Ag2HmdbtNJ6QxRI3Dx0In/vOznqx/b+sJxTFcy1N+ikScuWUgKPEGZFsosyG3Vb8gBOs+DJoFyzFCXGai9P3xcVLj81/nEZgXVPysJcGtUlNCPT3VOOH/ZYBKQVK4+/wKn7dIoxNE62aBA3EZ1L7/q8YZBvSYyS94PXfxF+pgpsPqEtZfYHUp88xb0HAXiJU8ogM/BqqSD1CeqSbEPoJrDNr00+jwLtD0iOOwcaCsmuRfFmHyH7cgw/pYWO6Ujc5kBIYEDn4TnCO7QAka2sZb/yJTd3wSHDzzFDhRgKUqbzqUFcEXAYnIoXXaUW92ZZwkCB6B876SPk2hj7w9tHHsDvbUWaH3ME5BYNFb/afUtJ2dyrH8mH7qAmCu0munP4aa5ANGUfbl6ArhgRrQFa1iOPpQ89aXpg9m+pcYON64c6hJz0aShaJEx1naFL8ESl4Wq1Q6wbipGdyowAOah4vRqQM+ZjNPQWKwQUeVcm8xr
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966006)(33656002)(966005)(4326008)(86362001)(7696005)(356005)(52536014)(8676002)(81166007)(478600001)(70206006)(83380400001)(82740400003)(70586007)(47076005)(2906002)(316002)(55016002)(8936002)(82310400003)(6506007)(186003)(9686003)(110136005)(336012)(5660300002)(26005)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 10:56:12.2184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02700bfc-f2a8-443b-3180-08d8b09f59a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2021
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+U2VudDogMDQgSmFudWFyeSAyMDIxIDEw
OjI4DQo+VG86IERpZWdvIFN1ZWlybyA8RGllZ28uU3VlaXJvQGFybS5jb20+OyBvcGVuZW1iZWRk
ZWQtDQo+Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+Q2M6IG5kIDxuZEBhcm0uY29tPg0K
PlN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYyXSB1LWJvb3Q6IGFkZCAvYm9vdCBhbmQg
JHtzeXNjb25mZGlyfSB0bw0KPlNZU1JPT1RfRElSUw0KPg0KPk9uIE1vbiwgMjAyMS0wMS0wNCBh
dCAwODozMCArMDAwMCwgRGllZ28gU3VlaXJvIHdyb3RlOg0KPj4gU2luY2UgZG9faW5zdGFsbCBp
cyBzaGlwcGluZyBmaWxlcyB0byAvYm9vdCBhbmQgJHtzeXNjb25mZGlyfSwgd2UgY2FuDQo+PiBp
bmNsdWRlIHRoZXNlIGRpcnMgdG8gU1lTUk9PVF9ESVJTIGFuZCBhbGxvdyByZWNpcGVzIHdoaWNo
IGRlcGVuZCBvbg0KPj4gdS1ib290IHRvIHVzZSBpdHMgaW5zdGFsbGVkIGFydGlmYWN0cyBmcm9t
IFJFQ0lQRV9TWVNST09UIGluc3RlYWQgb2YNCj4+IERFUExPWV9ESVJfSU1BR0UuDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogRGllZ28gU3VlaXJvIDxkaWVnby5zdWVpcm9AYXJtLmNvbT4NCj4+IC0t
LQ0KPj4gwqBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3QuaW5jIHwgMiArKw0KPj4gwqAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC5pbmMgYi9tZXRhL3JlY2lwZXMtYnNwL3UtDQo+PiBi
b290L3UtYm9vdC5pbmMgaW5kZXggMjUxMTc4ZGIzMy4uYzUzYmNkMDVjYyAxMDA2NDQNCj4+IC0t
LSBhL21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC5pbmMNCj4+ICsrKyBiL21ldGEvcmVj
aXBlcy1ic3AvdS1ib290L3UtYm9vdC5pbmMNCj4+IEBAIC0yNjYsNiArMjY2LDggQEAgRklMRVNf
JHtQTn0tZW52ID0gIiBcDQo+PiDCoCINCj4+DQo+PiDCoEZJTEVTXyR7UE59ID0gIi9ib290ICR7
ZGF0YWRpcn0iDQo+PiArU1lTUk9PVF9ESVJTICs9ICIvYm9vdCAke3N5c2NvbmZkaXJ9Ig0KPj4g
Kw0KPj4gwqBSREVQRU5EU18ke1BOfSArPSAiJHtQTn0tZW52Ig0KPj4NCj4+IMKgZG9fZGVwbG95
ICgpIHsNCj4NCj5JIHRoaW5rIEkgZGlkIGFzayBhYm91dCB0aGlzIG9uIGlyYyBidXQgd2UgbmV2
ZXIgbWFuYWdlZCB0byBkaXNjdXNzLg0KPg0KPkknbSBhIGJpdCB3b3JyaWVkIGFib3V0IHRoaXMg
Y3JlYXRpbmcgY29uZnVzaW9uIGFib3V0IHdoZXJlIGZpbGVzIGFyZSBwbGFjZWQNCj4oZGVwbG95
IG9yIHN5c3Jvb3QpLiBJIHBhcnRpY3VsYXJseSB3YW50IHRvIGF2b2lkIHBsYWNpbmcgZmlsZXMg
aW4gYm90aC4NCj4NCj5BcmUgdGhlc2UgZmlsZXMgaW4gL2Jvb3Qgbm9ybWFsbHkgYXZhaWxhYmxl
IGluIHRoZSByb290ZnMgYXQgdGhpcyBsb2NhdGlvbj8gSWYgc28sDQo+dGhlIHBhdGNoIHByb2Jh
Ymx5IG1ha2VzIHNlbnNlIGJ1dCBpZiBub3QsIEkgdGhpbmsgaXRzIGNyZWF0aW5nIGRpc3Bhcml0
eQ0KPmJldHdlZW4gdGhlIHRhcmdldCBmaWxlc3lzdGVtIGFuZCB0aGUgYnVpbGQgb25lIGFuZCBJ
J20gYSBsb3QgbW9yZSByZWx1Y3RhbnQNCj50byBkbyB0aGF0Lg0KPg0KPkNoZWVycywNCj4NCj5S
aWNoYXJkDQoNCkhpIFJpY2hhcmQsDQoNClNvcnJ5LCBJIG1pc3NlZCB5b3VyIG1lc3NhZ2UgaW4g
dGhlIElSQyBhbmQgd2FzIG9uIGhvbGlkYXlzIGp1c3QgcmV0dXJuaW5nIHRvZGF5Lg0KDQpGb3Ig
ZXhhbXBsZSwgaW4gdHJ1c3RlZC1maXJtd2FyZS1hIHJlY2lwZSBpbiBtZXRhLWFybSAoaHR0cDov
L2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kvbWV0YS1hcm0vdHJlZS9tZXRhLWFy
bS9yZWNpcGVzLWJzcC90cnVzdGVkLWZpcm13YXJlLWEvdHJ1c3RlZC1maXJtd2FyZS1hLmluYyks
DQp3ZSBoYXZlIGFuIG9wdGlvbiB0byBpbmNsdWRlIHRoZSB1LWJvb3QgYmluYXJ5IChhcyBCTDMz
KSBpbiB0aGUgRklQIGltYWdlLiBBbmQgdGhpcw0KaXMgYWNoaWV2ZWQgYnkgcGFzc2luZyB0aGUg
REVQTE9ZX0RJUl9JTUFHRSBwYXRoLg0KDQpUaGUgaWRlYSBmb3IgdXNpbmcgdGhlIFNZU1JPT1Rf
RElSUyBpcyB0byBub3QgZGVwZW5kIG9uIHUtYm9vdDpkb19kZXBsb3kgaW4gb3JkZXINCnRvIGJl
IGFibGUgdG8gdXNlIGl0cyBnZW5lcmF0ZWQgYXJ0aWZhY3RzLiBJJ20ganVzdCB0cnlpbmcgdG8g
Zm9sbG93IHRoZSByZWNvbW1lbmRhdGlvbg0KbGlzdGVkIGluIHRoZSBtYW51YWw6IGh0dHBzOi8v
d3d3LnlvY3RvcHJvamVjdC5vcmcvZG9jcy9sYXRlc3QvbWVnYS1tYW51YWwvbWVnYS1tYW51YWwu
aHRtbCNuZXctc2hhcmluZy1maWxlcy1iZXR3ZWVuLXJlY2lwZXMuDQoNCk5vdGUgdGhhdCBzb21l
IG9mIHRoZXNlIGFydGlmYWN0cyBhcmUgbm90IGV4cGVjdGVkIHRvIGJlIGluY2x1ZGVkIGluIHRo
ZSBmaWxlc3lzdGVtLg0KDQpJbiBtZXRhLWFybSwgd2UgYXJlIHVzaW5nIHRoZSBTWVNST09UX0RJ
UlMgYXBwcm9hY2ggZm9yIG90aGVyIGZpcm13YXJlIHJlbGF0ZWQNCnJlY2lwZXMgdG8gc2hhcmUg
ZmlsZXMgYmV0d2VlbiB0aGVtLg0KDQpXZSBoYWQgc29tZSBzaXR1YXRpb25zICh3aGljaCBJIGRv
bid0IHJlbWVtYmVyIGV4YWN0bHkpIHdoZXJlIGRlcGVuZGVuY3kgY3ljbGVzDQpvY2N1cnJlZCBi
ZXR3ZWVuIGRvX2RlcGxveSB0YXNrcyB3aGVuIHRyeWluZyB0byBzaWduaW5nIG9yIGNyZWF0aW5n
IHdpYyBpbWFnZXMsIGFuZA0KYnkgdXNpbmcgdGhlIGNvbWJpbmF0aW9uIG9mIFNZU1JPT1RfRElS
UyBhbmQgREVQRU5EUyB3ZSBtYW5hZ2VkIHRvIG92ZXJjb21lDQp0aGVzZSBpc3N1ZXMuDQo=
