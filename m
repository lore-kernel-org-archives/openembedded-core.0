Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.51])
 by mx.groups.io with SMTP id smtpd.web08.7264.1607427659345532704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 03:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=TQOnrX4D;
 spf=pass (domain: arm.com, ip: 40.107.8.51, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSqajGHsmNYkW8gFbBAUj7eXDdi+zliF46g0lRJ+UfA=;
 b=TQOnrX4DfsMSKPJejihmVWCVeADCKxvwCdpMcFKaZN8kOQYj8APpDrghHrFrKKsMQtrwskZGBFZJgHh0uRI1BfnpxxKkY+ettfUHhBuEBugtSuU1qIygQEUxnQPbDftGsiWhDEd3YBzB4TvVZo5gJ9btVsoTG+7JfyxpE0wjiXk=
Received: from DB7PR05CA0072.eurprd05.prod.outlook.com (2603:10a6:10:2e::49)
 by DB8PR08MB5500.eurprd08.prod.outlook.com (2603:10a6:10:11e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Tue, 8 Dec
 2020 11:40:56 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::bc) by DB7PR05CA0072.outlook.office365.com
 (2603:10a6:10:2e::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 8 Dec 2020 11:40:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 11:40:55 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71"); Tue, 08 Dec 2020 11:40:55 +0000
X-CR-MTA-TID: 64aa7808
Received: from e1c236365d58.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FB0AD8F0-CD43-49E4-AA85-F966268D47FC.1;
	Tue, 08 Dec 2020 11:40:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e1c236365d58.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Dec 2020 11:40:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8BrC5qxs1KpCK3NnKPCFJr0Yoorn/upmhlIpqyACqEztidYsFjhjWRFjetIbSwttJ/ctArbneysUFUdxrkGGQaEQglNMEOC/fXMStsT0HaICgMBTenFfbIjAHeDWBTra15ObnOl7458DB+VnGGyhbkrjQ3/fU/pYfeUFD3p4MWxNrrFRdDzHLumpEnrnSjAr2xuDU1BeLVW+EUpUaE2cGHKGGC5XFa06sR5KBZH5jt/5GGMvu1AhH8Oj/FJN5PvrGu5SytAY4/+Xx1jDsdvFoBwux3iinAP+fQf8CQX+CZghai/2O/Yp/EAadNmy8uD+48aSdc9h64hJtOAgdrq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSqajGHsmNYkW8gFbBAUj7eXDdi+zliF46g0lRJ+UfA=;
 b=QtTC2C+5KEWK/6xNjOze3jmUjXYHRGZcqAmtyjqq6wp35+RzemClUSib5Wpe4YiSugzFNh9S8p4WY6mPOL+dNgRv+5EcVvdRzdG97MxrBYuC2zBFE6pHzkJQyHLVnFWApxW8n7a6nvmEGOAtES+U7edP2jE4zgPGeVHqp18jX8ENrAh3HdbM2Vr0mMZnWmZSbWuySDzgCWmm2pxqnU23ZCEBh3iBo8K9MwR2DC/+7Nv8pNKraeIBSOpR30tKf5fAj7Ks4JFJAt61VLIr2sRA5h0dlRt7xHR4T3IDz2ZhLDMUpoNdimweutNVQwGp86gw8aYJmkc9mEoptKc+8a9BjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSqajGHsmNYkW8gFbBAUj7eXDdi+zliF46g0lRJ+UfA=;
 b=TQOnrX4DfsMSKPJejihmVWCVeADCKxvwCdpMcFKaZN8kOQYj8APpDrghHrFrKKsMQtrwskZGBFZJgHh0uRI1BfnpxxKkY+ettfUHhBuEBugtSuU1qIygQEUxnQPbDftGsiWhDEd3YBzB4TvVZo5gJ9btVsoTG+7JfyxpE0wjiXk=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB2003.eurprd08.prod.outlook.com (2603:10a6:203:4a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 11:40:49 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%5]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 11:40:49 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] wic: Introduce empty plugin to create unformatted empty partitions
Thread-Topic: [OE-core] [PATCH] wic: Introduce empty plugin to create
 unformatted empty partitions
Thread-Index: AQHWyYn8g+JFriHOfUmuqsJJp6/3Cqnl/GoAgAceMjA=
Date: Tue, 8 Dec 2020 11:40:48 +0000
Message-ID: 
 <AM6PR08MB346187B060A4DA408A15CB8B92CD0@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <cbb0c77415bba971194ff9c18577646d12a66250.1607009672.git.diego.sueiro@arm.com>
 <b287bb4773b60bb624813704fff24201fa6b1c6f.camel@linuxfoundation.org>
In-Reply-To: 
 <b287bb4773b60bb624813704fff24201fa6b1c6f.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 14DD4CC4BB347C4CA55DE0866712FE52.0
x-checkrecipientchecked: true
Authentication-Results-Original: linuxfoundation.org; dkim=none (message not
 signed) header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bc4972eb-496e-4c9f-e3f1-08d89b6e2008
x-ms-traffictypediagnostic: AM5PR0801MB2003:|DB8PR08MB5500:
X-Microsoft-Antispam-PRVS: 
	<DB8PR08MB5500B601C4044F04DDF0193A92CD0@DB8PR08MB5500.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 N1Oxbf91qJQfo1iHlOq7+NrmwZZVTlmGw/DYMADCA2kJqt/aZAQiCgEtc2+Ge4osfGOSmOtOkHO+Q0fooqrhBTbAyNrnrFzgPxRszgsEDastmW9898Wd26aaV0HcSCM6xyjgUthkQ1IHojc79khsakvjtXNNKQGHgQEJVXmU0N+pUcs+hobRb5eqkYvPz2+JaNgOoZ7x9SC8aXqvG8pb5fpYxbP3OyR6G7leurePJ/wRedZBIit3m5KS10HQQMDxkp8WBCfi0uUWgfp/muMgJaMhuhz5rFcFWG0EkoTV7NtgRhBPiMxku52O+U4hyL/+VFUDFvybG/z0UL/ozraH3w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(33656002)(5660300002)(55016002)(26005)(110136005)(6506007)(4326008)(66446008)(64756008)(7696005)(52536014)(83380400001)(66946007)(71200400001)(66476007)(2906002)(86362001)(66556008)(8676002)(508600001)(9686003)(186003)(8936002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?bGI1Z2RXS0ZjSVhjTDZtMXlCQWJMZkp5Mm9STkVROE5aaTZGYWlZYnJZYzkr?=
 =?utf-8?B?clh1TjBCS3pYMUx6WFFPNSs4dEFhSkpxYStRd0Yvc3VPZnpYT2VYK2xUTk44?=
 =?utf-8?B?V3VkMmxmY1Rjc09XMW9JLzVOTG15NlBGRzdyeUVJODlDS3UvMWo3OVhITERJ?=
 =?utf-8?B?OTRmekNJQi9hSGdoNEZKaFRteTU2K25VbTlnbEROTUh0cEJ4NDBuRDVkU0Nq?=
 =?utf-8?B?TzBzaGVYL3lnMWU4UDZTTFRuYnU3MnIwMCtYNFdoUGhDSWgrTDlOYnNCOVZn?=
 =?utf-8?B?U09INGlwMnYwZzBPUEkrRG9PZWpLQ3NvaTYvcTQ0am1Wai9FUFIwRHQ2RTUz?=
 =?utf-8?B?cUpCUnZLeHI3S3h1RGFUTmlnckFLbFlBaGFkZDU1MmpySUFxWWFhRzNYN0tr?=
 =?utf-8?B?NHppZGN6YVowa1BscExocmswb3c5Y1dDYzM0TGMvUVJMYkg2bGN4VE9YcHNh?=
 =?utf-8?B?bThPb2hMMG9VLytkTmZOZ2xZYWlQRDVJQ3R0T2pUSXN2RXNoU0hYazZwemhy?=
 =?utf-8?B?OXIwVlhGejc3Rko3Y2dXOXNyMnJsdVpqVmRTNDJnS1MvanNqY3ZaZVVKZTNZ?=
 =?utf-8?B?WXhlay9jSkZnMXNSTkhKYmpWb1YvY2JNMVR2bC9SdUd6d1h0TWhhWXRBcG9o?=
 =?utf-8?B?eHRkWTk1anNLSWNEdXZYajlxbm1NL3RYbWVwa1pnZFBtbHdzaFBoeVJaTEt0?=
 =?utf-8?B?U3BWK04xSVgzS3p2aldFUXNvZ1VoL2gwbGJHajdCNTQyZ1BSNjJEQXZxS09v?=
 =?utf-8?B?QmFNU2diNU13azVMTW85L2dJTzZUTDRUYUwwYzVCTHRudGUyWUJVbG84OEJX?=
 =?utf-8?B?QlQxR2YvampqMC9hN0o0UDZhNlUwTk82eFJZTW4xOG1rRUxxNHA3ZkVmYnow?=
 =?utf-8?B?VFpsN0FNMFBZcHlwSTJOTVIzSERlbERxdllncXcrbWF3bHRhS2pRMFJXWDA5?=
 =?utf-8?B?MTFUZmVMZmFSblduMGxRZ2VxdE5CdStyYWhDZkhIcm5MYUxOY1pFYlplb1ly?=
 =?utf-8?B?TUJobDBKVXhIVWFHNkhrSHY3VG03SXNPY0xXTmV5eFRqREpCRjVHMkl4b1hJ?=
 =?utf-8?B?Z1ZMWDlGR2ZuVHBsd2xEY0RJZjcyNWdZbkNJQjNLSXA3eFRIR2dXckRrTDVK?=
 =?utf-8?B?NHcvMU9wbXZEcVRhZzRJWHBFV3pEVStQQkk4VVNOcEpVeTlyZitveFU0dUpl?=
 =?utf-8?B?RndxamhUbXNqM2ZiWHNWZ2Noem1tbWx3TXcxeEt0bmdhNUJqTDlScy9ubDBY?=
 =?utf-8?B?MDBvM1R6OU1PS2FYSDlLMVY0eG1TSFBXSTdTN253ZGtYTlhsQ3VRVlVzUThl?=
 =?utf-8?Q?1kel+OT09MaiU=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2003
Original-Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eb652d8c-60fb-4fbf-ddac-08d89b6e1c00
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OFFAU/t3Uiqxlz8LcZ5B0UxNWxL4lrXYScIfCrHYGU8ctDqCNrsFEjsn9JlhpeX477Sdcyy+SkLeCug0UlHXO6FIFPzQARUZzwjOU66kCnTHUwvARuKJqzKnxEh206vPLN656+yJGeyMX1n0ySM4GPDrPk/USE6miu/XP4ykSw+xmRif5K1ymADd2B8dno9XgOle/PvXE4+rqH44eRDX2y5x9XoixnX11njpi1kS6uxnmg8/S/ovjrJoWWcGTP5XFY1qHgLjTFp5LA1oatnzX7UsmD54qYXo9htzOmniJjQrI60FDL8T5oqyQ7mkelu/PCKFNMr+pME/INww317JzyiDUlwXu+didcn1F+0jZWEnTWN2RwI+yYglLujWeFH31N8XJIxI9NjpDVP3wl+8Ow==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(46966005)(9686003)(82310400003)(186003)(55016002)(4326008)(8936002)(336012)(26005)(356005)(7696005)(110136005)(81166007)(86362001)(83380400001)(8676002)(5660300002)(508600001)(47076004)(70586007)(2906002)(6506007)(52536014)(33656002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 11:40:55.9026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4972eb-496e-4c9f-e3f1-08d89b6e2008
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5500
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+U2VudDogMDMgRGVjZW1iZXIgMjAyMCAy
Mjo1OA0KPlRvOiBEaWVnbyBTdWVpcm8gPERpZWdvLlN1ZWlyb0Bhcm0uY29tPjsgb3BlbmVtYmVk
ZGVkLQ0KPmNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPkNjOiBuZCA8bmRAYXJtLmNvbT4N
Cj5TdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gd2ljOiBJbnRyb2R1Y2UgZW1wdHkgcGx1
Z2luIHRvIGNyZWF0ZQ0KPnVuZm9ybWF0dGVkIGVtcHR5IHBhcnRpdGlvbnMNCj4NCj5PbiBUaHUs
IDIwMjAtMTItMDMgYXQgMTU6MzUgKzAwMDAsIERpZWdvIFN1ZWlybyB3cm90ZToNCj4+IFRoZSBl
bXB0eSB3aWMgcGx1Z2luIGlzIHVzZWQgdG8gY3JlYXRlIHVuZm9ybWF0dGVkIGVtcHR5IHBhcnRp
dGlvbnMNCj4+IGZvciB3aWMgaW1hZ2VzLg0KPj4NCj4+IFRvIHVzZSBpdCB5b3UgbXVzdCBwYXNz
ICJlbXB0eSIgYXMgYXJndW1lbnQgZm9yIHRoZSAiLS1zb3VyY2UiDQo+PiBwYXJhbWV0ZXIgaW4g
dGhlIHdrcyBmaWxlLiBGb3IgZXhhbXBsZToNCj4+ICAgICBwYXJ0IGZvbyAtLXNvdXJjZSBlbXB0
eSAtLW9uZGlzayBzZGEgLS1zaXplPSIxMDI0IiAtLWFsaWduIDEwMjQNCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBEaWVnbyBTdWVpcm8gPGRpZWdvLnN1ZWlyb0Bhcm0uY29tPg0KPj4gLS0tDQo+PiAg
c2NyaXB0cy9saWIvd2ljL3BsdWdpbnMvc291cmNlL2VtcHR5LnB5IHwgMzINCj4+ICsrKysrKysr
KysrKysrKysrKysrKysrKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQ0K
Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzY3JpcHRzL2xpYi93aWMvcGx1Z2lucy9zb3VyY2UvZW1w
dHkucHkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9saWIvd2ljL3BsdWdpbnMvc291cmNl
L2VtcHR5LnB5DQo+PiBiL3NjcmlwdHMvbGliL3dpYy9wbHVnaW5zL3NvdXJjZS9lbXB0eS5weQ0K
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAuLjA0MTYxN2Q2NDgN
Cj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL3NjcmlwdHMvbGliL3dpYy9wbHVnaW5zL3NvdXJj
ZS9lbXB0eS5weQ0KPj4gQEAgLTAsMCArMSwzMiBAQA0KPj4gKyMNCj4+ICsjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBNSVQNCj4+ICsjDQo+PiArDQo+PiArIyBUaGUgZW1wdHkgd2ljIHBsdWdp
biBpcyB1c2VkIHRvIGNyZWF0ZSB1bmZvcm1hdHRlZCBlbXB0eSBwYXJ0aXRpb25zDQo+PiArZm9y
IHdpYyAjIGltYWdlcy4NCj4+ICsjIFRvIHVzZSBpdCB5b3UgbXVzdCBwYXNzICJlbXB0eSIgYXMg
YXJndW1lbnQgZm9yIHRoZSAiLS1zb3VyY2UiDQo+PiArcGFyYW1ldGVyIGluICMgdGhlIHdrcyBm
aWxlLiBGb3IgZXhhbXBsZToNCj4+ICsjIHBhcnQgZm9vIC0tc291cmNlIGVtcHR5IC0tb25kaXNr
IHNkYSAtLXNpemU9IjEwMjQiIC0tYWxpZ24gMTAyNA0KPj4gKw0KPj4gK2ltcG9ydCBsb2dnaW5n
DQo+PiArDQo+PiArZnJvbSB3aWMucGx1Z2luYmFzZSBpbXBvcnQgU291cmNlUGx1Z2luDQo+PiAr
DQo+PiArbG9nZ2VyID0gbG9nZ2luZy5nZXRMb2dnZXIoJ3dpYycpDQo+PiArDQo+PiArY2xhc3Mg
RW1wdHlQYXJ0aXRpb25QbHVnaW4oU291cmNlUGx1Z2luKToNCj4+ICsgICAgIiIiDQo+PiArICAg
IFBvcHVsYXRlIHVuZm9ybWF0dGVkIGVtcHR5IHBhcnRpdGlvbi4NCj4+ICsgICAgIiIiDQo+PiAr
DQo+PiArICAgIG5hbWUgPSAnZW1wdHknDQo+PiArDQo+PiArICAgIEBjbGFzc21ldGhvZA0KPj4g
KyAgICBkZWYgZG9fcHJlcGFyZV9wYXJ0aXRpb24oY2xzLCBwYXJ0LCBzb3VyY2VfcGFyYW1zLCBj
ciwgY3Jfd29ya2RpciwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9lX2J1aWxk
ZGlyLCBib290aW1nX2Rpciwga2VybmVsX2RpciwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJvb3Rmc19kaXIsIG5hdGl2ZV9zeXNyb290KToNCj4+ICsgICAgICAgICIiIg0KPj4g
KyAgICAgICAgQ2FsbGVkIHRvIGRvIHRoZSBhY3R1YWwgY29udGVudCBwb3B1bGF0aW9uIGZvciBh
IHBhcnRpdGlvbiBpLmUuIGl0DQo+PiArICAgICAgICAncHJlcGFyZXMnIHRoZSBwYXJ0aXRpb24g
dG8gYmUgaW5jb3Jwb3JhdGVkIGludG8gdGhlIGltYWdlLg0KPj4gKyAgICAgICAgIiIiDQo+PiAr
ICAgICAgICByZXR1cm4NCj4NCj4NCj5UaGFua3MsIHRoZSB3aWMgdGVzdCBjb3ZlcmFnZSBpcyBw
cmV0dHkgY29tcHJlaGVuc2l2ZSwgY291bGQgeW91IGFkZCBhIHRlc3QNCj5mb3IgdGhpcyBwbGVh
c2UgKCJvZS1zZWxmdGVzdCAtciB3aWMiIGlzIHRoZSB0ZXN0IGNvbW1hbmQpLg0KDQpTdXJlLiBJ
J20gc2VuZGluZyBhIFYyIHNob3J0bHkuDQoNCj4NCj5DaGVlcnMsDQo+DQo+UmljaGFyZA0KPg0K
DQo=
