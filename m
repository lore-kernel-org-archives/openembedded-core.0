Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.107.0.71])
 by mx.groups.io with SMTP id smtpd.web12.823.1610628319337572483
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 04:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=M36jE9Ed;
 spf=pass (domain: arm.com, ip: 40.107.0.71, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLYQnmyRWx9yv6zmArFU9bWQiS36pysd3RMMsSCnSs4=;
 b=M36jE9Ed6fh9uXhhaKu68BU9K/6Z3JgPwR+F3korxeAeltiitRoHO9ry4kzKsTFInmYi4ChtXTEW9A9ZIq0vfTyCkU+ScA7sizSncoePOtEVzHQauf0dQNraipF7T3S/Yvi1MkzDO3lFDBVYyIxwlpiK4SkOUIceSlLs3VG2aNs=
Received: from DU2PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:10:3b::20)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 12:45:16 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::fa) by DU2PR04CA0015.outlook.office365.com
 (2603:10a6:10:3b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Thu, 14 Jan 2021 12:45:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 14 Jan 2021 12:45:16 +0000
Received: ("Tessian outbound 28c96a6c9d2e:v71"); Thu, 14 Jan 2021 12:45:16 +0000
X-CR-MTA-TID: 64aa7808
Received: from a97262b72c9b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 66974F3F-17CE-4F90-B909-92C3DA495CBB.1;
	Thu, 14 Jan 2021 12:45:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a97262b72c9b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Jan 2021 12:45:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRss1BO35YX24CcdOFt2d/fmmukGGPjAS3YxwOw2i0yvPoqwOwR5ZbAplwHqM600SRot9yFErbUKpqhAz7WIj967YKNV/voJbU50N5rV27JGDE/ymQ1S5BeNBdKwGVzan3B2FwRtq6cQ4zwGIIfSaBOJ/71VsWgeyvD237I0NKaVz9UnhH5+aWzJ09zymeZggr+KHXbcELHQ7+t3SIAz5Hw/kESh7IiHbnaLMqQL6RqMENDArw5wraRqADmGkx9+AHg9RGP7PdGCyP492tNd6D1UEK5JaeQajvgwa+ZkYwqv3mt4fXBAeuAad4flpi0VN8hCMqJGQkJAiYf16Ls07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLYQnmyRWx9yv6zmArFU9bWQiS36pysd3RMMsSCnSs4=;
 b=gUqyAYCgEP5FKAWx/TYk/HOF6JPd1Slneod9hFpRXFWkRfXr47E65jU55MnOnoZxw/+wXss5B+XX3oqdUoOj45Mmxrt/Ziwo6R/KrvxLk0mvHsWLLEx/cWtybtewWouquKwTLMzI147QmTNeyeK5ihxoB/jtnA6BkIeGzHCiwUpKBnKuBRHvPBinmw0G8MzB+Ntq22nf0YKaX3apU5Ooy9M5Hl8pTq1yMaKGu8PpZfEKyVbtFp6gwaqNpQNcKVHlFjryllnxfh7DZsQkPh1tLuHQfDHuouwK8Z2iLMsW+bGg+mdekcL09ESGRV18bvPd5xmU5oyniDQfR8vm5FHbXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLYQnmyRWx9yv6zmArFU9bWQiS36pysd3RMMsSCnSs4=;
 b=M36jE9Ed6fh9uXhhaKu68BU9K/6Z3JgPwR+F3korxeAeltiitRoHO9ry4kzKsTFInmYi4ChtXTEW9A9ZIq0vfTyCkU+ScA7sizSncoePOtEVzHQauf0dQNraipF7T3S/Yvi1MkzDO3lFDBVYyIxwlpiK4SkOUIceSlLs3VG2aNs=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AS8PR08MB6535.eurprd08.prod.outlook.com (2603:10a6:20b:336::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 14 Jan
 2021 12:45:10 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 12:45:10 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Purdie, Richard"
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] classes: Introduce intermediate-deploy.bbclass
Thread-Topic: [OE-core] [PATCH 1/2] classes: Introduce
 intermediate-deploy.bbclass
Thread-Index: AQHW6kwiRO4QiKORbUO6hCOIylydsaonBCAAgAANMdA=
Date: Thu, 14 Jan 2021 12:45:09 +0000
Message-ID: 
 <AM6PR08MB3461999C01D85C12EECF933192A80@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <830757c5aad2db5f7524e7a99f3b97e309592517.1610611154.git.diego.sueiro@arm.com>
 <CAP9ODKrAHAYfPvF=xjZk1aPPXuwP2_zOcg11U71sKiiR1o6kRw@mail.gmail.com>
In-Reply-To: 
 <CAP9ODKrAHAYfPvF=xjZk1aPPXuwP2_zOcg11U71sKiiR1o6kRw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: F376E79EA791C8479FBF513263A4ACFA.0
x-checkrecipientchecked: true
Authentication-Results-Original: ossystems.com.br; dkim=none (message not
 signed) header.d=none;ossystems.com.br; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 07f698e5-78be-4b62-4fe1-08d8b88a3e61
x-ms-traffictypediagnostic: AS8PR08MB6535:|PA4PR08MB6032:
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB603278FBF3C0036B77DA05E592A80@PA4PR08MB6032.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rYX2DDgW32p4HBXoWrcL3bNqLZlKzuhTHq1TZOtwMrWnybWEyMoP0FR9GVm3xor7+ANBmpENTnbiDqDcUcpHxcqlFcUkpZdiC5qK33NII6+otYuWAUoHuDnxCKG7b6YbnocrUxPiFg/EEM9bd/dx6qMqqpY6durlQW75b13nLielowZBegSgnRL6keBpbCbrbp6VgpnFDIxQpb+0WqjZcpUzortQr2/mFHLa26nRXH3ILdGUJEDqZqdqrXfrxE7e6V1dJhC/HBL+Y+9ut6LiBiwwY3oUmzm2JSWTas5pQB1yOv0sLG2Iw6/0Qb0elVBBaLul0gosbicjYQ6mD9ZAdhjk5fWDtXQ8jF5vZjBhcjo/FgMEw6EYePTqe0vzqdyo1MXSDmwDVHx/qmK1gboMdw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(2906002)(316002)(8936002)(52536014)(33656002)(86362001)(26005)(71200400001)(4326008)(6916009)(54906003)(186003)(5660300002)(66476007)(55016002)(66556008)(66946007)(9686003)(8676002)(7696005)(64756008)(478600001)(6506007)(66446008)(76116006)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?eUQwVkdjNURNLzl0ZlNkY2R6YkxtR2RXWFY1S25SOC8vTEw2UnR3dDNqa3hH?=
 =?utf-8?B?V2Z6TzkzaUNBNDBTL1YyVWhWdG0rOGU2VWJKNExFU3VHY25sNENyTVRON2dY?=
 =?utf-8?B?YzVHcXZZQStrVzR3OFNGRkdVOUdxRC8zcTRicW1qYVM2Rm1COHcvTGpOV3BD?=
 =?utf-8?B?NDdGWEpkL01rQ1hza3pJcDRNSUw0cHVxSFI2ZnhFeEZkQTFrckwwY09IVmZW?=
 =?utf-8?B?MjV6Rk56dDhSTjNDbWtoWXlwUFFWUEtVU2xWaWNJYS9hQngxU29vYUFtdjB0?=
 =?utf-8?B?QTBsclQzNWJsOERrSXNIckZtbFBpVHg4Z1dCZHJUTzQxSktzMzVJRVBjeVdH?=
 =?utf-8?B?UENQRFhIZzlFWFJoalYveWw5Y1Awc3FXWStjL3llODFndUZ3U2d2MUk0azNu?=
 =?utf-8?B?eVNuSWxQQlpLcFBmQjY2QTQ3ZDkrT0RsWGhoREJjWmNHRTFlZFZhdDA2TUx6?=
 =?utf-8?B?V1dCVGtqMzJhd0wzNUVkVFE3amtROEZQTWE0THVGQUVxdFUxb1hTbzlMam5o?=
 =?utf-8?B?NlhLaU5sWWhJTFZGQnFVdnRud1k1ZjI5VCtWTXBnWU9ZNE5SV1V1aGJ3VmVP?=
 =?utf-8?B?eTRkYjJmemtyNFFqMkg4TElReDlNMTRSVitpSDFHd00wWEg5RVh0QnhCU1lL?=
 =?utf-8?B?LzRXVEVxdHBITUl0TS9EK3hKN1M5KzBMYTdtdWpYNGNuRXdjelhKT3VTTDBU?=
 =?utf-8?B?Z1hYeWp1MEdPRng4S2VtWkVROGpzMGEzTkVzNHBxc3JyTEJRT0wyWm9UczFC?=
 =?utf-8?B?R2lKNTRjQXpIWnU5TVYwNkFNYW1EMkQxSUNqSkJFdHhsVHBxV2RYY0pxUThD?=
 =?utf-8?B?SlEvTFRwdjRyWUxGUWxoTkhQRTFReGVPbVAzelFKR25YRlFaSFhQb1VQWFZM?=
 =?utf-8?B?SDVLSnBma2pINE1VWFVUMkNKMm1heWlDR0FpUWJCZnBuKzZBZXFLdFBxTkFF?=
 =?utf-8?B?Rm4vWC9mMVd3Y3JKVGpGUE0wTGVkMW44dWdkdjNsQTJwM3JzYzU4d0hySUd6?=
 =?utf-8?B?Z0R4dU1sTUJRb2lpQUh3c3o0UW8vbEpMTzhhcVpueTIwV0czdmovOHNHWVp4?=
 =?utf-8?B?aVZ3Q1ZUd3I2eDNRdGZiSzJVbnQxdTJRL0tnTXhIT204VFZ4Unh0Tk5mSE9o?=
 =?utf-8?B?azRabE1WTUFLMWpGcTlZZ3FXYzVzN0tlaFZaSkU4RkVPc3gvamdlR3ZRYnJ4?=
 =?utf-8?B?OW1Ub0JTYnZTc1hyZktCaXcvVE16amlyMEZnT3dQS1pIT2Z0Q1RubGFneC9M?=
 =?utf-8?B?SU5vTXc0clcwK1kvY2JRK2laVittSHBOSTNoWlhGUlBKOWlTM2hRUHltcjY5?=
 =?utf-8?Q?THmmRhnL7Jpaw=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6535
Original-Authentication-Results: ossystems.com.br; dkim=none (message not signed)
 header.d=none;ossystems.com.br; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bbdaddd6-8407-4110-cc49-08d8b88a3a92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	niNYZa3LKJfzg3ddhViMyltsB0IhPkf9C4Qbuu44eFMxN2w0QvTDBfkENsuqdeS4yU8VXsElVBuKl5OdSfJbyePoRD/gbZ/93pwr8KrIZJJnc5RPiGmrllanLzVefc4mugERJJF4CBjTnm+u4YcmwhW4n30SbBruhnYEMlpFn9AFjvvMs33HaxOw+7TkpWhkIa+RgtkWTtqaLov8w5WMygQ2yd7hFrALwNT7AUgPf8tX6gQMF6dNZB4gJMNQ+lcoHFJWoeujJ49kVlz/LuCqIIAgREE8ZIQqcUsZrftXyIj8HknoU2aVAanhOtUHZN+jT+4i/G1QYsiJDDgfidHf4Zwxp0v0x8u6v8VW3WRVGt/mRmFoYU3hE4jpzHlaS/xHSodit5YNKUnDF32svJC3l8I8RDnDMVH+E35D6iISlG7FUMp8+6hG55DbyfVCIvCi5uCDPGTffROWYhAqGl8dQZjLbji+1kjNqS3nZZtwrgXb8q8OVOWd+kXPR/LiR1tJ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966006)(33656002)(47076005)(2906002)(8676002)(316002)(70586007)(336012)(26005)(478600001)(52536014)(81166007)(356005)(107886003)(82310400003)(55016002)(7696005)(6506007)(70206006)(186003)(82740400003)(8936002)(34020700004)(9686003)(6862004)(4326008)(5660300002)(54906003)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 12:45:16.4427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f698e5-78be-4b62-4fe1-08d8b88a3e61
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogT3RhdmlvIFNhbHZhZG9yIDxvdGF2
aW8uc2FsdmFkb3JAb3NzeXN0ZW1zLmNvbS5icj4NCj5TZW50OiAxNCBKYW51YXJ5IDIwMjEgMTE6
NTcNCj5UbzogRGllZ28gU3VlaXJvIDxEaWVnby5TdWVpcm9AYXJtLmNvbT4NCj5DYzogUGF0Y2hl
cyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXIgPG9wZW5lbWJlZGRlZC0N
Cj5jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBQdXJkaWUsIFJpY2hhcmQNCj48cmljaGFy
ZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj5TdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQ
QVRDSCAxLzJdIGNsYXNzZXM6IEludHJvZHVjZSBpbnRlcm1lZGlhdGUtDQo+ZGVwbG95LmJiY2xh
c3MNCj4NCj5FbSBxdWkuLCAxNCBkZSBqYW4uIGRlIDIwMjEgw6BzIDA1OjA2LCBEaWVnbyBTdWVp
cm8gPGRpZWdvLnN1ZWlyb0Bhcm0uY29tPg0KPmVzY3JldmV1Og0KPj4NCj4+IFRoZSBpbnRlcm1l
ZGlhdGUtZGVwbG95IGNsYXNzIGlzIHRvIGJlIGluaGVyaXRlZCBieSByZWNpcGVzIHRoYXQNCj4+
IGluc3RhbGwgaW50ZXJtZWRpYXRlIGFydGlmYWN0cyB3aGljaCBhcmUgbm90IHByZXNlbnQgaW4g
dGhlIGZpbGVzeXN0ZW0NCj4+IHRvIGJlIGZ1cnRoZXIgcHJvY2Vzc2VkIGJ5IG90aGVyIHJlY2lw
ZXMuDQo+Pg0KPj4gVGhlIElOVEVSTUVESUFURV9ERVBMT1lfRElSUyB2YXJpYWJsZSBpcyBhIHNw
YWNlIHNlcGFyYXRlZCBsaXN0IG9mDQo+PiBkaXJuYW1lcyBmcm9tICR7RH0gd2hpY2ggaW5jbHVk
ZSB0aGUgaW50ZXJtZWRpYXRlIGFydGlmYWN0cy4NCj4+DQo+PiBDaGFuZ2UtSWQ6IEkzMTQ5ODc1
ODdjMWNmMGU0Y2RiMjhmYmYxMTQ2M2YxZmViMzc1MDRiDQo+Li4uDQo+PiArICAgICAgICBmb3Ig
ZGlyIGluICR7SU5URVJNRURJQVRFX0RFUExPWV9ESVJTfTsgZG8NCj4+ICsgICAgICAgICAgICBk
aXI9IiR7ZGlyJS99Ig0KPj4gKyAgICAgICAgICAgIGRpcj0iJHtkaXIjL30iDQo+DQo+RG9lcyB0
aGlzIHdvcmsgd2l0aCBkYXNoPyBJIGJlbGlldmUgdGhpcyBpcyBiYXNoaXNtLg0KPg0KDQpJIHRo
aW5rIHNvIHNpbmNlIG9uIG15IGhvc3QgSSBoYXZlICIvYmluL3NoIC0+IGRhc2giLg0KSU1QT1JU
QU5UIE5PVElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50
cyBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJl
IG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1t
ZWRpYXRlbHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBl
cnNvbiwgdXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3Jt
YXRpb24gaW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K
