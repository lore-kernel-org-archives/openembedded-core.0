Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.69])
 by mx.groups.io with SMTP id smtpd.web12.11179.1609748963268439086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 00:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=avhC1rWo;
 spf=pass (domain: arm.com, ip: 40.107.1.69, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLsg041gJ6QTA7cS88RT8uJ0KB80LOOztFG0WRTDNeo=;
 b=avhC1rWob389xgdWp7qFp/0ViLyFcVlzUcDiywuo/f+HggjVbvMtkvjVeZoPbppy8DVRwCKEdgATlC7sM0FJqeIX/uJEwYau6+FpWj+4BmXPSdv7EEsM+3a2By/uOsDjrA90MuVK9oAcjzY953hRVEahcNNpsUH0QwSFUNbwK74=
Received: from AS8PR04CA0138.eurprd04.prod.outlook.com (2603:10a6:20b:127::23)
 by HE1PR08MB2841.eurprd08.prod.outlook.com (2603:10a6:7:35::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Mon, 4 Jan
 2021 08:29:18 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::67) by AS8PR04CA0138.outlook.office365.com
 (2603:10a6:20b:127::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Mon, 4 Jan 2021 08:29:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.21 via Frontend Transport; Mon, 4 Jan 2021 08:29:17 +0000
Received: ("Tessian outbound 8b6e0bb22f1c:v71"); Mon, 04 Jan 2021 08:29:16 +0000
X-CR-MTA-TID: 64aa7808
Received: from a7532e41f794.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E3724662-86B7-4B03-988F-9045A78FF1C1.1;
	Mon, 04 Jan 2021 08:29:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7532e41f794.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 04 Jan 2021 08:29:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1ZbTpbWHHTXTX7yNoaHUeqiKz9Ngn17GOBvr/oujpCmP0x3xlJucebEb/k9rx8tUBY4siHR7+MWfExdibaD09lMgZYKkWWWwtK35XVHbsXe1ugEUeuTtaqNg/9N8CVpghn11esXN2/XIeseIZW6RIAxoUz/BGdqdrkvSKYM2O4d5SKY4gDWOL4sRMwxcWvbDr+7l52M+cu9m48kZuL6jvbLv3gVdmmvJv++I3zbqP3OqeAz8XQgBbK+MRWimdAbsHN/EuZQN40ntN3PASoJE6YEieGU3LftDgrl5SwWVl8tFZk+Wzw66uox3rhP7eWTdJ8OCR+BFygIJbYbT+NmCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLsg041gJ6QTA7cS88RT8uJ0KB80LOOztFG0WRTDNeo=;
 b=TLYEVAI5vRZrGLB2Fouicq0ugji2GuxKSJWIMvhs3WRjxV1cXKjtvVeYsySgSKwPsLPgKp97NeKrvHNKQ3ZcLRfeIaw/GMpygyMF8BuYi8XEa0IvvOU1mZF4gTSDa5VBZYJHRpyPCkvbGU/E4FTnf0Trt0z73BLstRy45jW/oN650qRf7yP6cdL+DeilBLfFII9K64w2AUNFZSiRNjEfQ9ailHeA45A2WhaJVLsda9DEhiKjxBSmJRSzRnDeQiJ0WPoW+b3Dzgg4QSt7iOiaomNATyDqD9riY24bz1LbCWBwYIqqaDiWYZy4uLGm8vaL96azbCfjeQEcEty6ZVOKdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLsg041gJ6QTA7cS88RT8uJ0KB80LOOztFG0WRTDNeo=;
 b=avhC1rWob389xgdWp7qFp/0ViLyFcVlzUcDiywuo/f+HggjVbvMtkvjVeZoPbppy8DVRwCKEdgATlC7sM0FJqeIX/uJEwYau6+FpWj+4BmXPSdv7EEsM+3a2By/uOsDjrA90MuVK9oAcjzY953hRVEahcNNpsUH0QwSFUNbwK74=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4801.eurprd08.prod.outlook.com (2603:10a6:20b:c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 08:29:10 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 08:29:10 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "max.oss.09@gmail.com" <max.oss.09@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] u-boot: set SYSROOT_DIRS to /boot and ${sysconfdir}
Thread-Topic: [OE-core] [PATCH] u-boot: set SYSROOT_DIRS to /boot and
 ${sysconfdir}
Thread-Index: AQHW1GcDCG1jmU07RkaTlzyEjOXIF6n8nf6AgBqgSYA=
Date: Mon, 4 Jan 2021 08:29:09 +0000
Message-ID: 
 <AM6PR08MB346125E7EB337EF49663069792D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <51459a27f768a62cab37aabf5a5253e2756a0644.1608204009.git.diego.sueiro@arm.com>
 <64c6a1da3b14ede2c4001a3d2e485bc54e702512.camel@gmail.com>
In-Reply-To: <64c6a1da3b14ede2c4001a3d2e485bc54e702512.camel@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 3EF429E39BE748498F8D9A590827EFB3.0
x-checkrecipientchecked: true
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ce54668a-89b8-40f7-fff7-08d8b08ad39c
x-ms-traffictypediagnostic: AM6PR08MB4801:|HE1PR08MB2841:
X-Microsoft-Antispam-PRVS: 
	<HE1PR08MB284106B9FCA197B9A427E37A92D20@HE1PR08MB2841.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 a4ZTNw9+prA7+keNIpYZ9prpqeRp+dofJJPsCWg3Ygnz2U4tc0UxVjuX3XCVt79YMk09zoUfv4gup1VVaTzMPpVf0AmyGY2E1Iqth0fZ6XW95M8ZinbDJln/g3akFxLJZ/tsUg2G7CU7Ej2ZawqnTxZch2LaZ5WOzNQ1SbBZWCNInGanAWQUtEGP3sSsKo5A/eUJhcrsFTyiSqNtDz1nAMXE776tCjxm8LbDykJrrcTfQuhSbTMU3ssRHmt+nGaE686B08u4rOV4Qy2GxxOImwcB4eHRBzWQs5k7oq71HnfHbEF5nW6Q+e/XuDQ1WHXOBBq8PkPREDo4BwSf+QGv0SHDy5AoifiIhHmKJ4XYE9m9iH7iBi/UrTGv664Ib1ENZgIlojvVWZ6UAQzyjnw37pXXTUG3f53Darsv1XmCVY2LMgGERdRewEidomIzGgQR
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(33656002)(6506007)(8936002)(5660300002)(83380400001)(86362001)(110136005)(76116006)(316002)(7696005)(26005)(186003)(478600001)(4326008)(9686003)(52536014)(55016002)(66446008)(66946007)(8676002)(66476007)(66556008)(64756008)(2906002)(71200400001)(228453006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?bis1VW9vL0luNnVRUWNnQWJQbU9DTTdCZ1dOZWlObXB0SEdhNXhoc2F2bGds?=
 =?utf-8?B?bVlpYTZUd094eXM5cmpWOWlYWDBRODRFNk50NVRMbU1LbTZGT3IrOUgrZlFu?=
 =?utf-8?B?NzlHdWw4ZTdPc0RyRFlPblQwcVBQdjJBQklMVml5RHI4Sm96c0dOSnlXUHNn?=
 =?utf-8?B?N2o2WWNIKzd4K2srcFQ2bTI3SmI0VENhcHJBaE5RZEEvOHFsRldKQ1duWE5M?=
 =?utf-8?B?ejhGU3pVUVdwSXVEdjdmaEVUbDJ0akJ4eldWM2Z1aC9HUUJaU3dWMkFBc0lP?=
 =?utf-8?B?cHd0dmlHREYxR1FnOUFjR3YybEFNbE1Vb21CYmxjd2xjMThYY3RJM0xvc0hI?=
 =?utf-8?B?enBTMTEraUhISE9pMXpkaHNXNmk0RzhJUWduYzFNSUdoaFlFaEJXUXl3d3BB?=
 =?utf-8?B?Y0VueVgrVkpRdDJRYzVQd0NDU0xORTdqbUU2cFFhZkhBS0swRUEyUy9nRUdo?=
 =?utf-8?B?Mk5zTXBlbm5QTmN1Vm5odXdncHF3Tk1DQXorNWhsLzFCNkM0L1hwR1RUZGxF?=
 =?utf-8?B?RUVBVnppeTJaYmlKTU1OUGJyZHhuWkpCUkk1SkdHZnUwMVlHQ3FoVXhRUHZ4?=
 =?utf-8?B?WDZwL2JRQTlGczV0N1czTE1RaHo5UFJyRW45WHFoR3J1cnl2cEtjNDNoSExM?=
 =?utf-8?B?Ty9PSjZBd0xsSTZoQUFkVlZaTXhGMUY2aDBoM3FyRjNOenlXL1JXQVV2S1g4?=
 =?utf-8?B?N0hxN25CQVdGNlBSMmxiWFlZaXQyWWRSREZUdHh4aDVQTlg5OUJaVDJESThx?=
 =?utf-8?B?RWhZUktISkFZQk1CVHhTd01TRzZwL0JlN3hGUXU3aUhPSUxDL2RIK015bmhU?=
 =?utf-8?B?MTZsMjljSkI0M0JxY1l0Q1JvdUN6aGREZ1F1eDlnbkUwSVB3R2h6ci9KeXVl?=
 =?utf-8?B?dUNPL2gzaERnS1VpNDU1cGhPS0JmWEdNUlhsMStQQlVuT1RzZnJ3dUZjYlZk?=
 =?utf-8?B?ZEIra3F3UzZOdXFuRkNYQnd2YXNoeDk1QmxQUFFrcUdhdW01VHp4a0dnSGQx?=
 =?utf-8?B?Z3pwa2lBL25pY0VCRUM4QmJ0VzFBYlpTNVlDakRTK1pCWjhWdHlEdi9OUWpE?=
 =?utf-8?B?Y1dNaEhuTmJpU3picDh2S3dxeUQ3YlpDalNGV250d1dJQWRzbmJsSTBIQUQr?=
 =?utf-8?B?cURKRzh3dUpsMnFNYll2YTlDaG5haWErQlkwTURCWDZpNGUxS3dBNlVMcGNK?=
 =?utf-8?B?Q0Z3SGlGc3JxbzRxZ3IzTU5WTGZ2NzN6RnNHUUEzeFlLYnNWOVYyZFNMMUZL?=
 =?utf-8?B?dEtBRE5RTUhEem4zTUFuN21kWGp2S0lBTUN2YTR6VVpIeFZhNEl5WFduNUZO?=
 =?utf-8?Q?DJIdndiGmuwOM=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4801
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	325697d7-1db4-4af7-0f33-08d8b08acf52
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l7zJMrthQSvWAcKy+aGx1U41tg2i51spaMuBC8sS0c+8x6NtRm9TUZE7LryYDBDyBXT7Ssss6kILqfc9EnWNc4kE3ass0TvfMxkwvdQ7CG/dxdYMKzijDBT+/Qe9l0Vk+7o3BDJKweHCbV37hPrM5VPwHPHLvcxn9e7W2/pGMRvLwAz4GtpTuZb8CP9WP01rkqtabfZ8ztxRRAY5IVN7Td54Jl9Wj9+62+jQbifNtGFo54+SpBTbYBcuF34pgPyyXSR/XTbyfqRmjZC9vfzxAvoyz+1ropQXCDu2RsKtt5tKWnIhb7kDKuwRGzDRxujp3Ba1p9VFKm0IMz8Yo+/yDR3vt6j6Xd312LJM2EqHiX4RlKklKiEE0YNSpcYLKCNwtRVCna466n6vVpeBYTzSldYLS/uDyDxK9pBmwWjIxCYWcMBSq5QKV9hOnfhw/QTcqmAkhsw+rmlR+TtxEVCqyndWtuFUWLT/4Cih2aQa3k0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39850400004)(46966006)(70586007)(70206006)(186003)(4326008)(110136005)(52536014)(336012)(7696005)(316002)(55016002)(81166007)(356005)(9686003)(2906002)(26005)(6506007)(83380400001)(82740400003)(33656002)(47076005)(86362001)(82310400003)(5660300002)(8676002)(8936002)(478600001)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 08:29:17.4522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce54668a-89b8-40f7-fff7-08d8b08ad39c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2841
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj5jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBNYXggS3J1bW1lbmFjaGVyIHZpYQ0KPmxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj5TZW50OiAxOCBEZWNlbWJlciAyMDIwIDA5OjUyDQo+VG86IERp
ZWdvIFN1ZWlybyA8RGllZ28uU3VlaXJvQGFybS5jb20+OyBvcGVuZW1iZWRkZWQtDQo+Y29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+Q2M6IG5kIDxuZEBhcm0uY29tPg0KPlN1YmplY3Q6IFJl
OiBbT0UtY29yZV0gW1BBVENIXSB1LWJvb3Q6IHNldCBTWVNST09UX0RJUlMgdG8gL2Jvb3QgYW5k
DQo+JHtzeXNjb25mZGlyfQ0KPg0KPkhpDQo+DQo+QW0gRG9ubmVyc3RhZywgZGVuIDE3LjEyLjIw
MjAsIDExOjIzICswMDAwIHNjaHJpZWIgRGllZ28gU3VlaXJvOg0KPj4gU2luY2UgZG9faW5zdGFs
bCBpcyBzaGlwcGluZyBmaWxlcyB0byAvYm9vdCBhbmQgJHtzeXNjb25mZGlyfSwgd2UgY2FuDQo+
PiBzZXQgU1lTUk9PVF9ESVJTIHRvIHRoZXNlIGRpcnMgYW5kIGFsbG93IHJlY2lwZXMgd2hpY2gg
ZGVwZW5kIG9uDQo+PiB1LWJvb3QgdG8gdXNlIGl0cyBpbnN0YWxsZWQgYXJ0aWZhY3RzIGZyb20g
UkVDSVBFX1NZU1JPT1QgaW5zdGVhZCBvZg0KPkRFUExPWV9ESVJfSU1BR0UuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogRGllZ28gU3VlaXJvIDxkaWVnby5zdWVpcm9AYXJtLmNvbT4NCj4+IC0tLQ0K
Pj4gIG1ldGEvcmVjaXBlcy1ic3AvdS1ib290L3UtYm9vdC5pbmMgfCAyICsrDQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtYnNwL3UtYm9vdC91LWJvb3QuaW5jDQo+PiBiL21ldGEvcmVjaXBlcy1ic3AvdS1ib290L3Ut
Ym9vdC5pbmMNCj4+IGluZGV4IDI1MTE3OGRiMzMuLjZhZjA3NjY1NzEgMTAwNjQ0DQo+PiAtLS0g
YS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC91LWJvb3QuaW5jDQo+PiArKysgYi9tZXRhL3JlY2lw
ZXMtYnNwL3UtYm9vdC91LWJvb3QuaW5jDQo+PiBAQCAtMjY2LDYgKzI2Niw4IEBAIEZJTEVTXyR7
UE59LWVudiA9ICIgXCAgIg0KPj4NCj4+ICBGSUxFU18ke1BOfSA9ICIvYm9vdCAke2RhdGFkaXJ9
Ig0KPj4gK1NZU1JPT1RfRElSUyA9ICIvYm9vdCAke3N5c2NvbmZkaXJ9Ig0KPg0KPldvdWxkbid0
IGEgKz0gYmUgbW9yZSBmdXR1cmUgcHJvb2YuIEkuZS4gbm90IGRyb3BwaW5nIHRoZSBkaXJlY3Rv
cmllcyB3aGljaA0KPmFyZSBzdGFnZWQgYnkgZGVmYXVsdC4NCj4NCj5NYXgNCg0KVGhhbmtzIGZv
ciB5b3VyIHJldmlldy4gQSB2MiBpcyB1bmRlciB3YXkuDQoNCj4NCj4+ICsNCj4+ICBSREVQRU5E
U18ke1BOfSArPSAiJHtQTn0tZW52Ig0KPj4NCj4+ICBkb19kZXBsb3kgKCkgew0KPj4NCj4+DQoN
Cg==
