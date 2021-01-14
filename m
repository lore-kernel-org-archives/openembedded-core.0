Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.85])
 by mx.groups.io with SMTP id smtpd.web12.1064.1610629602280690723
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 05:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=YJuZRk+I;
 spf=pass (domain: arm.com, ip: 40.107.22.85, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2GfkRNNcZVUoy80V3PP2PSgzvA7ORTaGLRA8xzPVKw=;
 b=YJuZRk+I6cW6MYMhCJ6vVHUNXn0MMoIAjM2Tuim19UUfkVbAg2jyOAWyQZmRfV86ydqKjvI9MiRBm0B2ahWrTh/wG302v1PR7VVvfu4eoWp9RTzbNWKgYq2suj6am6tjLlQEZzX3Hf2YOKLhugyFHtqkqAYtOdDl5l1p6NrQ/P8=
Received: from AM0PR03CA0002.eurprd03.prod.outlook.com (2603:10a6:208:14::15)
 by PAXPR08MB6416.eurprd08.prod.outlook.com (2603:10a6:102:152::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 13:06:40 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:14:cafe::de) by AM0PR03CA0002.outlook.office365.com
 (2603:10a6:208:14::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Thu, 14 Jan 2021 13:06:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 14 Jan 2021 13:06:39 +0000
Received: ("Tessian outbound 587c3d093005:v71"); Thu, 14 Jan 2021 13:06:38 +0000
X-CR-MTA-TID: 64aa7808
Received: from 7482c3744741.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3C28E63D-E129-41C2-BCE0-5C61D56B5AD4.1;
	Thu, 14 Jan 2021 13:06:33 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7482c3744741.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Jan 2021 13:06:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jzj9E43YpQ+CaAq5kEIedpe5SbjRAz3fOOR7jVmOV+gbV1SYkFlyQftCUhC8PORem4Gp8N/dyd/ZsogIYzVVCxqjBES/e9dLepDn/WOiwYN8lVYcs/G9yjo225idZ1XL49JJJCwIhxSm+5jKSAWi4DuuY1Ru8GvHn3KFzSkl2aIvsoGF75GdqA3TTvuLNkHWW8QnB60T5DxXRYnslq1o2Jf9EIeZk69s0Hm6/l/avIhKgAD4mArROywZMjSNcFfAGh3TepjAMFswwvnNfkhjs1jxPkXhLXbbK044v1/BRN0K7a7h0TmOy6wy3MbxiIeFYUn5c7WzHhpRgKRvSWtwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2GfkRNNcZVUoy80V3PP2PSgzvA7ORTaGLRA8xzPVKw=;
 b=ZHnZOQQINuSRbbylJdLddKHXAs9Q27nMu+jN2Q4Nu9+cWR20TK5eZb4nbCze7BwksDFbJJ88b3I/r6lKdgkl63TelpAJZjyFKs+IEShTFIb55Zyhus8vIWkZ6DmgNVI8RXcXrmIf1a3F6t+3ew4bkXLJ8vV29d4BChY2pdVPb79BZPmthZeDT+gJNgCV9ZMXmE7RUUOrFvOHXyc9S3TykbwPA3Pl4WGtCbrDsGlVmqUxPTInBW+dgdh8AvyOdUrqtGw3Kse8CJnpBXlFOl8LJtVSXbxwQfsgGu0BBQvbP+oglcO+ygmMOXliWgQD3m9Xo5nPch+bQ/2J+FiIoPphhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2GfkRNNcZVUoy80V3PP2PSgzvA7ORTaGLRA8xzPVKw=;
 b=YJuZRk+I6cW6MYMhCJ6vVHUNXn0MMoIAjM2Tuim19UUfkVbAg2jyOAWyQZmRfV86ydqKjvI9MiRBm0B2ahWrTh/wG302v1PR7VVvfu4eoWp9RTzbNWKgYq2suj6am6tjLlQEZzX3Hf2YOKLhugyFHtqkqAYtOdDl5l1p6NrQ/P8=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 14 Jan
 2021 13:06:32 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 13:06:32 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] classes: Introduce intermediate-deploy.bbclass
Thread-Topic: [OE-core] [PATCH 1/2] classes: Introduce
 intermediate-deploy.bbclass
Thread-Index: AQHW6kwiRO4QiKORbUO6hCOIylydsaonBhiAgAALhIA=
Date: Thu, 14 Jan 2021 13:06:32 +0000
Message-ID: 
 <AM6PR08MB3461D404A67176C477DE723E92A80@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <830757c5aad2db5f7524e7a99f3b97e309592517.1610611154.git.diego.sueiro@arm.com>
 <01f36254e19849396ad43d6eed745b178f2080fd.camel@linuxfoundation.org>
In-Reply-To: 
 <01f36254e19849396ad43d6eed745b178f2080fd.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: FCF213A025F3054FB00CCC4A5E6B87B5.0
x-checkrecipientchecked: true
Authentication-Results-Original: linuxfoundation.org; dkim=none (message not
 signed) header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aa004afb-c0f4-4927-4495-08d8b88d3b1f
x-ms-traffictypediagnostic: AM6PR08MB4934:|PAXPR08MB6416:
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB641686AC845FA8330694D9A592A80@PAXPR08MB6416.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ckx1vL1ojjmlcyGxosfDUH2FK10DolM2dwgD1nb9FAwm8hbhsquVhhm7h8tTL5Qh98buMrsU4e1zhcEbCzm9OaI/Cto8ISWwMtpUpMRvv8PqAD1bhCo9ctOB+GHS1jgzKwFCp5vs1MCzVh+6VBcR5YK9HV+Kr+0sVxESPZGBUPqD8btEqxF3A+UsL5ZeynExISQd44nPtnmyYg2e8M+ws5ktt/AMwRBtIE/SD8Z31ltj71ltjnyEVRpLlrjGTmA7xDsJm+O09mdjLNZ2cPQZR8KSFyWWUda8997AUGdoLlydLt9ggNmyfkKW/cDnGVC/3D6O/GFxpqwnqRm6sYdL9z0KWKFW1CgyeU+tLlfTAVRAidzsmEX49d4e8dQVd1bzPk/T/Vy+OoOMQzfOfBBT6A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(2906002)(316002)(8936002)(52536014)(33656002)(86362001)(26005)(71200400001)(110136005)(186003)(5660300002)(66476007)(55016002)(66556008)(66946007)(9686003)(8676002)(64756008)(7696005)(478600001)(6506007)(66446008)(76116006)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?MVF6Z0pjdXMyaUJxNDgxeW9kaHlIV0xlQTBHUHR3OG9mSzhVc1ZCUnA2RSsx?=
 =?utf-8?B?MVhkdkk2QkZjTmZyN2hyWHhFdGdGZWlmakt4MGM1dnlUWVNEcWNSSVVEL2JG?=
 =?utf-8?B?QXQxaHJmT1pyVzBKaU9LTGJ6OEZaVUI2QUs1RzNtaXhLVW5DRVVzZlh0eDFX?=
 =?utf-8?B?TFNWU2R2dHVVUFgzZlJZdUhONCtRcFQzUjZTSlFlTzJLSEZxZE0zMDRJaHg4?=
 =?utf-8?B?WXVyMStNUnowOURsY3E0dElHNWdKVVJ4UXZNR3dZcGl4d0Vna2VOVkZJZnl4?=
 =?utf-8?B?QzJhdEZMaGtYYUp5VTFpak9WdmVSRkZGdDBzSk1KdlVwZFdhZE85OUM0Qnc2?=
 =?utf-8?B?WlQrNktWK0xpWklPQlllSDM0NnpaNVVxWFIzWHUrYlQ2Qm9XbGhKWHhzTEJw?=
 =?utf-8?B?YUJOY2FUUEhqdng1Z21aNnpaRzRjRlluVW1nbWNDbTBCWVRZeGlySzB2T3c4?=
 =?utf-8?B?NWJxaTdVTkZiYTh2cFUyYmt5UWt3ZU5CYUN4THBMQ2w2UXF3STdTRVpMMzFy?=
 =?utf-8?B?OXBSSy9xbVlCbFNFaUZsV3RsOFVzcSszZ2FGRjZJMEZ6djZKc1FJcFhYUmxU?=
 =?utf-8?B?RU11UzQyL3VIc3Q5a1FpTWZLNkxGSGowZGdva0ZHT1kwRXEzVGRERVBZRzR5?=
 =?utf-8?B?NDJxOUhqQkNuRk1jSmcwaW5MTDZ1S25kV1NPUng5ak4zMEhRdWJmSjZsemRj?=
 =?utf-8?B?U1U5L2F6TDduYndtYTVSVmRPYkppaGpqSFRvdUNsdEJYK1E5WHRGNCsrRVhv?=
 =?utf-8?B?TlpQY2tLL0E1YThxbkc4MUkxL3pEaTc4Wi82dXFIbTAxUWk0MTBOVlU5NHZY?=
 =?utf-8?B?QVZnakRtV2ZiR0lzVEZVSEIvVWNYZnErN3l1c2RHOEJZOGZBYkpmaGJ1ajk2?=
 =?utf-8?B?cHZOTkRQVmpDSEZpV1Z2ejNIWTJTOW5VWVRFeEk5UGlYK21QL3RpSE8xeG4z?=
 =?utf-8?B?Vno3WjNyNEI1alhOU3JuYk1nemhWdDV2cXBMcmQvOW80dk1uRE9NMFA5Yksr?=
 =?utf-8?B?ai85RW9PU0FRV2ZzdW40SGh1YUFwajZXT1lqdTBmWERJc3ZvazZYZllPVmxx?=
 =?utf-8?B?eU1ISzh4K0dyWVh2aFBXVUNaTHZwcUdDTVJxdTdZU0doeDNHb3VLUmRBM3hw?=
 =?utf-8?B?YnUwUk9kVEprak10MmhKSFpqNFQvM2tlL094TnI4cFh4ZjV5SEoxRU1HWEFC?=
 =?utf-8?B?TzVZajdXZ2xSYXlKOCtlS0VYNUVuYW5qVmR5K3VVYlpKb0VLMVJQdmtLQkph?=
 =?utf-8?B?ZGFnZG5xWkVJU3VZZkhqbW9zTlhwSVdVMTJLR3lxNU4zRDZ2dGlPMGx6RGZC?=
 =?utf-8?Q?MBmVcvzz9XYRw=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4934
Original-Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	33e8ef25-0d47-4277-815a-08d8b88d36d7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zv5pU5N56QgrUduwmMi8O6t4faywwP0wO0PNsU6WAGLalAw0aIrj2jvVcPzXslYecxvQeh0ZuC4pNZ+cUiTM/62kLaGxoRrMoOPhd26Hf6Yp2LKbzknCwFLy8EsBvfi3dOfhn4qBAb+jPrXTKP5oOMq0dTl1UMaprg7tZJkfUvj+byQYmsUndwV2x8xl7r1mPFPbyAeG/h4cTJEBj1g4Z1xyMROCDPs1xent915K6xh1wXMVlKnyAnwhfXAQyrjUZEPUJQj38aStKMr9s/tIydzZvKT5SakHMO2kycbcBYUAWb+3a5aj6o+ltaQX9A776piD4tlZyvRGAQ7wve7cKEWgJ/E7rpFdMl22W70ycgFURHck1q5L7vuzBKFl7Z5qibhGesB6f9+X/G5Czm1Iz/Xzidn18t7M01BnJYQiyT3/BanrVYMYSh0YhAVfwXbTyDNidNNoZ2+dowQMYB+IMoTFuQlOC2VLi1M5xjdY9iuC4x5DZ0HgKDyVatMi1JT7
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966006)(8676002)(8936002)(83380400001)(26005)(336012)(33656002)(478600001)(70206006)(110136005)(34020700004)(82310400003)(47076005)(6506007)(52536014)(356005)(186003)(7696005)(9686003)(81166007)(316002)(5660300002)(70586007)(2906002)(82740400003)(55016002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 13:06:39.4109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa004afb-c0f4-4927-4495-08d8b88d3b1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6416
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPmNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllIHZpYQ0KPmxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj5TZW50OiAxNCBKYW51YXJ5IDIwMjEgMTI6MDQNCj5UbzogRGllZ28gU3VlaXJv
IDxEaWVnby5TdWVpcm9AYXJtLmNvbT47IG9wZW5lbWJlZGRlZC0NCj5jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj5TdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAxLzJdIGNsYXNzZXM6
IEludHJvZHVjZSBpbnRlcm1lZGlhdGUtDQo+ZGVwbG95LmJiY2xhc3MNCj4NCj5PbiBUaHUsIDIw
MjEtMDEtMTQgYXQgMDg6MDYgKzAwMDAsIERpZWdvIFN1ZWlybyB3cm90ZToNCj4+IFRoZSBpbnRl
cm1lZGlhdGUtZGVwbG95IGNsYXNzIGlzIHRvIGJlIGluaGVyaXRlZCBieSByZWNpcGVzIHRoYXQN
Cj4+IGluc3RhbGwgaW50ZXJtZWRpYXRlIGFydGlmYWN0cyB3aGljaCBhcmUgbm90IHByZXNlbnQg
aW4gdGhlIGZpbGVzeXN0ZW0NCj4+IHRvIGJlIGZ1cnRoZXIgcHJvY2Vzc2VkIGJ5IG90aGVyIHJl
Y2lwZXMuDQo+Pg0KPj4gVGhlIElOVEVSTUVESUFURV9ERVBMT1lfRElSUyB2YXJpYWJsZSBpcyBh
IHNwYWNlIHNlcGFyYXRlZCBsaXN0IG9mDQo+PiBkaXJuYW1lcyBmcm9tICR7RH0gd2hpY2ggaW5j
bHVkZSB0aGUgaW50ZXJtZWRpYXRlIGFydGlmYWN0cy4NCj4+DQo+PiBDaGFuZ2UtSWQ6IEkzMTQ5
ODc1ODdjMWNmMGU0Y2RiMjhmYmYxMTQ2M2YxZmViMzc1MDRiDQo+PiAtLS0NCj4+ICBtZXRhL2Ns
YXNzZXMvaW50ZXJtZWRpYXRlLWRlcGxveS5iYmNsYXNzIHwgMjUNCj4+ICsrKysrKysrKysrKysr
KysrKysrKysrKw0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspDQo+PiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IG1ldGEvY2xhc3Nlcy9pbnRlcm1lZGlhdGUtZGVwbG95LmJiY2xhc3MN
Cj4NCj5JIHRoaW5rIEkgc2hvdWxkIGhhdmUgYmVlbiBjbGVhcmVyIGFib3V0IHdoYXQgSSB3YXMg
dGhpbmtpbmcsIHNvcnJ5Lg0KPg0KPkkgd2FzIHdvbmRlcmluZyBhYm91dCBhbiAiaW50ZXJtZWRp
YXRlLWRlcGxveSIgZGlyZWN0b3J5IHdpdGhpbiB0aGUgZXhpc3RpbmcNCj5TWVNST09UX0RJUlMs
IHNvIHRoZSBzeXNyb290IGNvdWxkIGNvbnRhaW4gYW4gImludGVybWVkaWF0ZS0gZGVwbG95L2Jv
b3QvIg0KPmFuZCAiaW50ZXJtZWRpYXRlLWRlcGxveS9maXJtd2FyZSIuDQo+DQoNCkp1c3QgdHJ5
aW5nIHRvIHNlZSBpZiBJIGdvdCBpdCByaWdodCB0aGlzIHRpbWUuDQpBcmUgeW91IHByb3Bvc2lu
ZyB0byBtb3ZlIGAke0R9L2Jvb3RgIHRvIGAke0R9L2ludGVybWVkaWF0ZS1kZXBsb3kvYm9vdGAg
YW5kDQpoYXZlIFNZU1JPT1RfRElSUyArPSAiL2ludGVybWVkaWF0ZS1kZXBsb3kgIj8NCg0KQnV0
LCBJZiBpdCBpcyBqdXN0IGEgY29weSBoYXZpbmcgd2l0aGluICR7RH0gLCBJJ2xsIGhhdmUgdG8g
aGF2ZQ0KYFBBQ0tBR0VTXyR7UE59ICs9ICIke1BOfS1pbnRlcm1lZGlhdGUtZGVwbG95ImAgYW5k
DQpGSUxFU18ke1BOfS1pbnRlcm1lZGlhdGUtZGVwbG95ID0gIi9pbnRlcm1lZGlhdGUtZGVwbG95
IiB0byBubyBmYWlsIHdpdGgNCiJpbnN0YWxsZWQtdnMtc2hpcHBlZCIgaW4gdGhlIHBhY2thZ2Ug
cWEuDQoNClRoZSB3YXkgdGhpcyBjbGFzcyBpcyBpbXBsZW1lbnRlZCBpcyBqdXN0IGNvcHlpbmcg
dGhlIGRpcnMgZnJvbSAkRCBsaXN0ZWQgaW4NCiRJTlRFUk1FRElBVEVfREVQTE9ZX0RJUlMgdG8g
dGhlICRTWVNST09UX0RFU1RESVIgYW5kIGNhbid0IHVzZSBTWVNST09UX0RJUlMNCnZhcmlhYmxl
IGRpcmVjdGx5IGJlY2F1c2UgdGhlIHN5c3Jvb3Rfc3RhZ2VfYWxsIGZ1bmN0aW9uIGNvcGllcyBm
cm9tICRELg0KDQoNCj5JJ20gbm90IHBhcnRpY3VsYXJseSBsaWtpbmcgdGhlIG5hbWUuIE1heWJl
ICJ1bnBhY2thZ2VkL2Jvb3QiIG9yICJub24tDQo+dGFyZ2V0L2Jvb3QiPyBJJ20gb3BlbiB0byBp
ZGVhcy4NCj4NCj5UaGUgaWRlYSBpcyB0byBtYWtlIGl0IHJlYWxseSBjbGVhciB0aGVzZSBhcmUg
ZmlsZXMgd2hpY2ggYXJlIG5vdCBwYXJ0IG9mIHRoZQ0KPnRhcmdldCByb290ZnMgdGhvdWdoLi4u
DQo+DQoNCkkgYWxzbyBkb27igJl0IGxpa2UgdGhpcyBuYW1lIGVpdGhlci4gTWF5YmUgIm5vbi1m
aWxlc3lzdGVtL2Jvb3QiPw0KDQpDaGVlcnMsDQpEaWVnbyBTdWVpcm8NCg0KSU1QT1JUQU5UIE5P
VElDRTogVGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyBhcmUg
Y29uZmlkZW50aWFsIGFuZCBtYXkgYWxzbyBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0
aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRl
bHkgYW5kIGRvIG5vdCBkaXNjbG9zZSB0aGUgY29udGVudHMgdG8gYW55IG90aGVyIHBlcnNvbiwg
dXNlIGl0IGZvciBhbnkgcHVycG9zZSwgb3Igc3RvcmUgb3IgY29weSB0aGUgaW5mb3JtYXRpb24g
aW4gYW55IG1lZGl1bS4gVGhhbmsgeW91Lg0K
