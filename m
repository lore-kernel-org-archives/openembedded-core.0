Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.50])
 by mx.groups.io with SMTP id smtpd.web11.5047.1610610813899486561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 23:53:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0WhnnuFo;
 spf=pass (domain: arm.com, ip: 40.107.7.50, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkGHeTKSCXToaVt1VfxI7jZ1rqIGar0KwCJRxTfVvx8=;
 b=0WhnnuFoXqykE3rtOmfB1Ov9nYLdtCTbGpFbecQkefQFABCSJPkEiv/VAG30dT7shmfIG3mBP8Z7LqY+YiBRLjjfq+VUMcQPpKwOJiCtQ9IzTwxKt0oG5EmGPChs4YOG7NLC5icVULSecSag7EyUTMzvWwAyAw/Ec+BFdOI8ahU=
Received: from DB6PR1001CA0011.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::21)
 by HE1PR0802MB2314.eurprd08.prod.outlook.com (2603:10a6:3:c4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Thu, 14 Jan
 2021 07:53:17 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::f9) by DB6PR1001CA0011.outlook.office365.com
 (2603:10a6:4:b7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Thu, 14 Jan 2021 07:53:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 14 Jan 2021 07:53:16 +0000
Received: ("Tessian outbound f362b81824dc:v71"); Thu, 14 Jan 2021 07:53:16 +0000
X-CR-MTA-TID: 64aa7808
Received: from c855451ba137.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D240FE63-7046-46CA-AF9A-73DC0AA7260D.1;
	Thu, 14 Jan 2021 07:53:11 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c855451ba137.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Jan 2021 07:53:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ub/2zvVx9YrUNRL6oGGbCUqxV76amVpJfjVCzdc3gA6M9Ss3tJEIh8WfAZ8x18ifiuebRyxwIl/U4W94enzsXWz1vHS8j/RnkXX++3rNvZc8A9TayY4v0QN200EW4fR9B2NfoFQqgAxa/rlPOMZxUZWELk21kwltl/VM6jD/lP+cTCd/pRV+xvergZm8vJ2o4vsK+qPu3M3jFa6BOOnIYYMTB/13B1cr3xZPxo1AEL2kOw8623yC2IDgmVJfse8bU+Uc0ntT/moMLrnfNgmqvi160j1Lkcnxc+6FGsVP9KwU+0fdM+pKvyA4ai3F2NA86+eDQqLayf7AoydcdtNT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkGHeTKSCXToaVt1VfxI7jZ1rqIGar0KwCJRxTfVvx8=;
 b=VK5MuwJNblZ6XwjROr3xD/VQtmaOyuJKwvZZ8R7WjFpwgK0JEgPJnSjNt3amO5GsQzZoGtGO38AKOONmeCUlKomAlncoSbJ1C2fZmufnS6CYnrcRkV5o0/uMP+dvUzCQiUIbnvDFEKvvscuD4gTE02dKNhPc8OWVZScSNsAtgHdxd1838GHJFUopnaz1Ik6pL+ZxQOmlgRf3lMdvy5DkgPvv8TewlHcY2SL+bHLczvjUZToCGstHWCMJhqzSd4/KxvV3Vp2PjM2femr8kw+fTT6bzrPGXUcL6Um40HfB9NxjUVT7ir/lDbsw2OwarFSi9GFmvXIbEsyCxEUZTVmWww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkGHeTKSCXToaVt1VfxI7jZ1rqIGar0KwCJRxTfVvx8=;
 b=0WhnnuFoXqykE3rtOmfB1Ov9nYLdtCTbGpFbecQkefQFABCSJPkEiv/VAG30dT7shmfIG3mBP8Z7LqY+YiBRLjjfq+VUMcQPpKwOJiCtQ9IzTwxKt0oG5EmGPChs4YOG7NLC5icVULSecSag7EyUTMzvWwAyAw/Ec+BFdOI8ahU=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB1937.eurprd08.prod.outlook.com (2603:10a6:203:4b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 14 Jan
 2021 07:53:10 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 07:53:10 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: nd <nd@arm.com>, Diego Sueiro <Diego.Sueiro@arm.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: add /boot and ${sysconfdir} to SYSROOT_DIRS
Thread-Topic: [OE-core] [PATCH v2] u-boot: add /boot and ${sysconfdir} to
 SYSROOT_DIRS
Thread-Index: 
 AQHW4nPuyC+SLLhA4U2otVmcOQJeLaoXQ8QAgAAA+WCAABCxAIAAFefAgAAJEwCAAAMLAIAAAg+AgAXh08A=
Date: Thu, 14 Jan 2021 07:53:09 +0000
Message-ID: 
 <AM6PR08MB34616B4B0B11D4CED92DB03092A80@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <9c29138b53742ac268b54768773f72a2279f3f49.1609748975.git.diego.sueiro@arm.com>
	 <56b88a5513085b38781e02327537289d2fdd8203.camel@linuxfoundation.org>
	 <AM6PR08MB346196292FFCAE3C6499D55D92D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
	 <688508925922a91f009ed5fdb25814d3cbd1cfee.camel@linuxfoundation.org>
	 <AM6PR08MB3461DD31D010E15507D15B0892D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
	 <3b18da8aa5741857c6a0d93d8ec77c7854fa1695.camel@linuxfoundation.org>
	 <AM6PR08MB3461F2529B1767C7BF74D7F892D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <d1cd4d7e6db5c3f237469feae27fd8a1b196d7fb.camel@linuxfoundation.org>
In-Reply-To: 
 <d1cd4d7e6db5c3f237469feae27fd8a1b196d7fb.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: A35ED068F7E71449BB65CBB34029D7D3.0
x-checkrecipientchecked: true
Authentication-Results-Original: linuxfoundation.org; dkim=none (message not
 signed) header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4224bde3-5f14-479c-207f-08d8b86173bc
x-ms-traffictypediagnostic: AM5PR0801MB1937:|HE1PR0802MB2314:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB23140A08F0F6D541065585FE92A80@HE1PR0802MB2314.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 XN91El0whDVPS7opgCKzVn+CwVtfApY6JjZjYGGT4VK2Dm1FS2UUiua10soV3H2mUL/6DkcyTCIs2De+yDBFt4sH8B0f/q/WOzeYnZdPBm/KUMo24kiTfqknh6fiejmRz+dF7nuXFlOA8SgDHId3v2CUjFaQb9wrAaBPkMvMF57+0JVoi+wFw8brUqAunjgry9vlftyO6SEJva+aUYB8xLgBM/i+ISNaYHtn0Fvbr4dzQpKkO1tGGAPizgplFVZaV2AEtHJ6JRtXIOmrCxrI+zL5jIgFGwLoXh65ziJMy12MmRnc0f5Oa9eeODMrO3WdviIKj/DhisaRlzRn8+pKhNUq8cnZRGy9jz8gLXmFIlo0yJfgBZ3RDD6Z44Ld7MuiaMfE3nZRPX6gg/58Wfu+73wcw1eGy3UXNmSSeFDhoNAe29+VrqK0DD/x9NLKWMAG
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(186003)(66556008)(2906002)(66946007)(6506007)(66476007)(33656002)(66446008)(54906003)(478600001)(83380400001)(110136005)(26005)(52536014)(71200400001)(4326008)(8676002)(7696005)(55016002)(9686003)(86362001)(316002)(8936002)(76116006)(64756008)(5660300002)(228453006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?c2NFU0kyQ2w5RkhicnJaL0MyTGFRWnpYbnorMlNWd0VIYjJqc3c4N2d0Mnpr?=
 =?utf-8?B?ZHpOaktZTjJTZmIyR2FNMS9vYXM4Z0JsQ3ZwdlBINDJ4bUY5WHFlT1pONVF2?=
 =?utf-8?B?TmFaa09WeEdzdDAxRmlDcGcwS1BzWlZidS9RRG9nL2F0SXMzNHR1RHhYMGx5?=
 =?utf-8?B?eDJjenFBSm5QKzB6MEYwNFpXMVJXSmRNbzF2UDhaejF4ZmU4NVJXRGdCdXUr?=
 =?utf-8?B?SHRBS2Y3K21VL2VtQnBhdmw4Tmw3aGVOT1gzTmxNZFJzcHpBTUtvVlN0TXZi?=
 =?utf-8?B?eHE3SHFoNDZoU3lJTjNLbThtZDVDdVVFNzArVktqWEhRU05tTUJWK2NBWHJC?=
 =?utf-8?B?eHZrSVduZTZKSFpGdFljeU80cEVBNlh4NE9IUGt5SXd4aE1EYnhWYlBIRC9v?=
 =?utf-8?B?R2FSZ0IvTE0reFQvUzNsWUdwd2ZDcE42UVZ6dWhoSEdkTG04ajN6U3ZVQUNI?=
 =?utf-8?B?Qy81bEVzRjg0eFhodFhsaTFsWUM5dnNsbWRVUlNqTVVwU2dOUSs1NFoxdDZS?=
 =?utf-8?B?NldlaG51TGxEWW8wRVFGaDFoZU5WTEt0WGNOK2pPZjNwZmhLU3FXVnYwbGFk?=
 =?utf-8?B?WUpwWmFSb3NjZ084SW5uWUd3b0F1ejlZeit2RUxyN09YTUxJeUtxd241T2NJ?=
 =?utf-8?B?WE5tOWtub3JHajJZTU9FNkszQnVxWWl4aVJGK3FEUFVyS2Fmd3c0WXBRVi9l?=
 =?utf-8?B?Myt6WmZZaHY3bk9UMTVlQUgva0ZPRlRKV1dHUHg2d0s5S1VlYW5JMmNMS2RH?=
 =?utf-8?B?Z1RUbmhTSVprSjdXaGJBUDZ1SGJtRWs3UHFxTmxCcExscWo1N1J4TFlXSGJi?=
 =?utf-8?B?UTNZSnRKcmQrT2tVV3hZanZxMnNsQllvdnNOSmo5aVRjYmpOVjcvbmFhUjdF?=
 =?utf-8?B?U0t3YWFwY2hHUWNiUnhBM3UvS2FMdWQ3alF1ZWYyeitNS1VUL1VuVXRWcGpr?=
 =?utf-8?B?Z0tSQ2VaM1FQSnovcldxUUI0cUc0VHNOZjJvQVBDUmFXU2YvdVpwd0pzZVRE?=
 =?utf-8?B?MGMxblNuWHV6YWFhZFl6MWhkM3AwbHBjbERKUFhFRGlldFVvYVdaeEp0T05Y?=
 =?utf-8?B?czlCYzRiRmd2TUVuU00xT25aYkljTXREWDNhQ2J1VlExd0g3ZHVMbC9NUFFG?=
 =?utf-8?B?MXdndmRQeW9WNTA3WEQ3ZU1oTm16dDltNFhRc3VMVlhxWXhPcVVOZGhsNmtB?=
 =?utf-8?B?NFo4Rk9BS1JBd0FCM1A1azVva1k3c1VyMnBJM1JTQTBEdjI1NDI3WkRxYVlP?=
 =?utf-8?B?MUhveGszSHFCNGhHWmovaFM4ZVo5WlpvNFJsOFQ5SG9oams1WWdlL3ByNmZi?=
 =?utf-8?Q?zlJf7AOlA78js=3D?=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1937
Original-Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f75306eb-c8f7-49fd-5bb6-08d8b8616ff3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sK57pNINLyUZnC9M9J6FX/aVR6rwZMBZ6SewxVPHN5NeGxY1T4GdSz2fltpYGaNrkoF1mHN7aCOqLK7pvaHO8ZoG7BkiwwUAr12NqhTqsWR+IsGzAHAYmK4gdPQjpg/e0M467LIGwcQ2wK8MRwialLL5GpfunlfvlYFINSABxLhxI6xsouDEy1yyywC0w0MUlvmwzs17V5rkAWnlhJDgRMqQCB0Zm4ZMzHH7mVtSaTkNN26UPLxwX2XHcyG+Wi9JVhZ9kIoQK/TxGJLdjcL83F1p5Na1pvRBPW0XBB+HeEI8uPBRN9sJ7acU4i9Yl6XKPJmp6BDJ5IA6UooQ0NErk7svgQsMRAoqjdxFl0Ejd+pq15h1um9MTg9eZPGW2cB8L6Vp31eDbA0IVO14ngwvR0jR86uG2VRBO+PvJEF6LcP8YRrVTF+uB37bC//oduOPDlrvY268/nxRw3NMi9KOeMajmX0Zw7+IOlI0ntgLGTfJp2akwxXNn7kpba9RQk2oesaZk2LezytS1WyH7ukhTQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39850400004)(46966006)(2906002)(8676002)(8936002)(4326008)(336012)(186003)(52536014)(5660300002)(26005)(316002)(55016002)(70586007)(83380400001)(33656002)(7696005)(478600001)(70206006)(34020700004)(356005)(47076005)(81166007)(82310400003)(9686003)(86362001)(54906003)(82740400003)(6506007)(110136005)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 07:53:16.5902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4224bde3-5f14-479c-207f-08d8b86173bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2314
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPmNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllIHZpYQ0KPmxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj5TZW50OiAwNCBKYW51YXJ5IDIwMjEgMTM6NDENCj5UbzogRGllZ28gU3VlaXJv
IDxEaWVnby5TdWVpcm9AYXJtLmNvbT47IG9wZW5lbWJlZGRlZC0NCj5jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj5DYzogbmQgPG5kQGFybS5jb20+DQo+U3ViamVjdDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0ggdjJdIHUtYm9vdDogYWRkIC9ib290IGFuZCAke3N5c2NvbmZkaXJ9IHRvDQo+U1lT
Uk9PVF9ESVJTDQo+DQo+T24gTW9uLCAyMDIxLTAxLTA0IGF0IDEzOjM3ICswMDAwLCBEaWVnbyBT
dWVpcm8gd3JvdGU6DQo+PiA+IEp1c3QgdGhpbmtpbmcgb3V0IGxvdWQsIG1heWJlIHdlIGNhbiB1
c2UgU1lTUk9PVF9ESVJTIGlmIHdlIHVzZQ0KPj4gPiBzb21ldGhpbmcgd2hpY2ggaXMgbmFtZWQg
Y2xlYXJseSBzdWNoIHRoYXQgaXRzIG9idmlvdXMgaXQgd2lsbCBuZXZlcg0KPj4gPiBiZSBvbiB0
aGUgdGFyZ2V0IHJvb3Rmcz8NCj4+ID4NCj4+ID4gIi9ib290IiBpcyBjb25mdXNpbmcgYXMgc29t
ZSBzeXN0ZW1zIGRvIGhhdmUvdXNlIHRoYXQgYnV0IHRoZXJlIGlzDQo+PiA+IG5vdGhpbmcgc3Rv
cHBpbmcgdXMgY3JlYXRpbmcgc29tZXRoaW5nIHNwZWNpZmljIHRvIHRoaXMgcHVycG9zZS4NCj4+
ID4gV2UnZCBoYXZlIHRvIGNsZWFybHkgZG9jdW1lbnQgaXQgc2hvdWxkIG5ldmVyIGJlIHVzZWQg
Zm9yIGFueXRoaW5nDQo+PiA+IGFsc28gc2hhcmVkIHVzaW5nIGRvX2RlcGxveSBhbmQgd2FzIGZv
ciBpbnRlcm1lZGlhdGUgZmlsZXMgb25seT8NCj4+ID4NCj4+IFRoaXMgbWlnaHQgYmUgdGhlIHNp
bXBsZXN0IHNvbHV0aW9uIHdpdGggbG93IGNvZGUgYW5kIGRvY3VtZW50YXRpb24NCj4+IGltcGFj
dHMuDQo+PiBJbiBtZXRhLWFybSB3ZSBtYWtlIHVzYWdlIG9mIHRoZSAiL2Zpcm13YXJlIiBkaXJl
Y3RvcnkgdG8gaW5jbHVkZQ0KPj4gdGhlc2UgaW50ZXJtZWRpYXRlIGZpbGVzLg0KPj4gSSBzdXNw
ZWN0IHRoYXQgaW4gY2FzZSBvZiB1LWJvb3Qgd2UgY291bGQgYWxzbyBjb25zaWRlciBpdCBhcyBh
DQo+PiAiZmlybXdhcmUiIGFydGlmYWN0Pw0KPg0KPkknbSB3b25kZXJpbmcgYWJvdXQgImludGVy
bWVkaWF0ZS1kZXBsb3kiIGFzIGl0cyB0aGVuIHZlcnkgY2xlYXIgd2hhdCBpdHMgZm9yDQo+YW5k
IHRoYXQgaXRzIHNlcGFyYXRlIGZyb20gYW55IG5vcm1hbCByb290ZnMgc3RydWN0dXJlPw0KPg0K
DQpTb3JyeSBmb3IgdGhlIGRlbGF5LiBJJ2xsIGJlIHNlbmRpbmcgYW5vdGhlciBwYXRjaCBzZXJp
ZXMgc2hvcnRseS4NCg0KQ2hlZXJzLA0KDQpEaWVnbyBTdWVpcm8NCg==
