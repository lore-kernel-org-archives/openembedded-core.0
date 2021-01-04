Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web11.13423.1609767486743657611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 05:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5XE+kPy8;
 spf=pass (domain: arm.com, ip: 40.107.21.48, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjDttGFD4mE1tqVJlbDfEUzvGhM2FlNOMU1rorPfImM=;
 b=5XE+kPy8s7OMwOB5FQu61hh0H77TUpL+Mn6nyckPq2TELHiIxySlOpH61C6X1hBb023g7btm5ux3ytvzw3Ova21EGYgu7tvzHDeOfHzQSjl3MTlXfuMyuSw6PQwc6tEgieKIeR6QKxeb+cGn/TXEZmARbCcvVPBaxpDbbpht6pA=
Received: from AM6P192CA0018.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::31)
 by DB7PR08MB3740.eurprd08.prod.outlook.com (2603:10a6:10:31::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 13:38:03 +0000
Received: from VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::bf) by AM6P192CA0018.outlook.office365.com
 (2603:10a6:209:83::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Mon, 4 Jan 2021 13:38:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT026.mail.protection.outlook.com (10.152.18.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.21 via Frontend Transport; Mon, 4 Jan 2021 13:38:02 +0000
Received: ("Tessian outbound 6af064f543d4:v71"); Mon, 04 Jan 2021 13:38:02 +0000
X-CR-MTA-TID: 64aa7808
Received: from 904dd2a82903.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6CE474B1-C5C7-47BC-A673-B92F4972078A.1;
	Mon, 04 Jan 2021 13:37:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 904dd2a82903.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 04 Jan 2021 13:37:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jv3/y0xO5JNw9fTdTlezotkwL3fxnO8rLXPzM8d4Rv5U1kUyLlOIQk+oupOM2e06x21KtOhqZZChoTqMUt3MBl4ZP4bZJ5C0Vb20rUX3Zy2mO9aIChWsjIATRhN+qoeZxVjtIm+8wmbW4aRIpLG+2Iit2A0i3gGxF8mhsEaxZaZ6956v4fO2u0L/qFn+OU0rNWw8iPUpuBtCZkaoBaY/zVv4pWKZPj+5IgwzxILxERVfC2jPzyebhJqvpLmuLdghj/KSI8lCnsfifmVTWAYHW1h/FowIjthOVF1xQpLM/Lale8HxNr6wYMNQQHeBf6Xw/+kVIVctlGfUH7PJ53PXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjDttGFD4mE1tqVJlbDfEUzvGhM2FlNOMU1rorPfImM=;
 b=X/UC0TGtJwqXdP+mT35ffgr2Grdqm7l8y2p3vrgZu/5Hvpqn0cZCy2GNJ3nzdbsqoP7fbHaITwzc0yBV5CptDA+amihHFCUmYeJCsG7VEgtRk6SvNhy1Rrbp0zFYTE6bKDLCN8hvDGNK3HFjRrzSjRc0Ogb/Ntq3B5cMFjdc7Z9Ms0JV72xBmftAyVMPfPCtOekdj21XXWDVdEYsIsQoCjiMHdd7vc9emZKgfCCGBC9whp9W+5kxFhSiFWz9dfHIRgfcYcbTXzEn6b1+uXy5D9iTlyXbVyIGy2X5SsCuQ5oQEkEDF/cQM5oLkRnSFqR6dcOOVseRZqqXdZa2hg4KNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjDttGFD4mE1tqVJlbDfEUzvGhM2FlNOMU1rorPfImM=;
 b=5XE+kPy8s7OMwOB5FQu61hh0H77TUpL+Mn6nyckPq2TELHiIxySlOpH61C6X1hBb023g7btm5ux3ytvzw3Ova21EGYgu7tvzHDeOfHzQSjl3MTlXfuMyuSw6PQwc6tEgieKIeR6QKxeb+cGn/TXEZmARbCcvVPBaxpDbbpht6pA=
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3878.eurprd08.prod.outlook.com (2603:10a6:20b:8b::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Mon, 4 Jan
 2021 13:37:55 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 13:37:55 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: add /boot and ${sysconfdir} to SYSROOT_DIRS
Thread-Topic: [OE-core] [PATCH v2] u-boot: add /boot and ${sysconfdir} to
 SYSROOT_DIRS
Thread-Index: 
 AQHW4nPuyC+SLLhA4U2otVmcOQJeLaoXQ8QAgAAA+WCAABCxAIAAFefAgAAJEwCAAAMLAA==
Date: Mon, 4 Jan 2021 13:37:55 +0000
Message-ID: 
 <AM6PR08MB3461F2529B1767C7BF74D7F892D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
References: 
 <9c29138b53742ac268b54768773f72a2279f3f49.1609748975.git.diego.sueiro@arm.com>
	 <56b88a5513085b38781e02327537289d2fdd8203.camel@linuxfoundation.org>
	 <AM6PR08MB346196292FFCAE3C6499D55D92D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
	 <688508925922a91f009ed5fdb25814d3cbd1cfee.camel@linuxfoundation.org>
	 <AM6PR08MB3461DD31D010E15507D15B0892D20@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <3b18da8aa5741857c6a0d93d8ec77c7854fa1695.camel@linuxfoundation.org>
In-Reply-To: 
 <3b18da8aa5741857c6a0d93d8ec77c7854fa1695.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: AE15BA35ACEA814D84A7A0B34980E126.0
x-checkrecipientchecked: true
Authentication-Results-Original: linuxfoundation.org; dkim=none (message not
 signed) header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6caabc36-16be-40c3-6dd0-08d8b0b5f56d
x-ms-traffictypediagnostic: AM6PR08MB3878:|DB7PR08MB3740:
X-Microsoft-Antispam-PRVS: 
	<DB7PR08MB3740493080DCBF7A75E5982792D20@DB7PR08MB3740.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5Vu2Mun55FLDUH/1ccw3W6KSgSJdxXxubvW/FOHDBu+GENzeIQIriretuKANGBdbcuuoiC3/8Ifrcxi9a1jubZ81j0utoJ4gdl4zva8V6HsdfrRYp21bLoNm8/8KYDEpkSSNIcPABokNbL64oR/0i5bO9Q1DiHf7T0MKYZ6B4ISeU+No7mtz5UohjXZ9Zh+yxeW0T4I6E/aQmdme/y+MbxIFQXK+tGMXYsMnip2IdPJlLep87URx1Qdwq+xpD3p0na3ZaiocyotZSv6eqZczeW/SFbL9xTeRExXnOS4THWuwiaieuVXToDcUIrF9NYkKMo2UOhqxDrSAbWnRp0DuBYi/tTD3cgfaBLuFIGfQSRByJdZ6J+8Yf4TX/48amPhAftqzzQJE5O0m2XyyX6zUinuP+LDKumccPE3n4dyeaMNLEq7hodRTFR/iroo1kYpz
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(64756008)(66446008)(76116006)(66556008)(66476007)(52536014)(83380400001)(5660300002)(2906002)(86362001)(66946007)(55016002)(478600001)(9686003)(186003)(26005)(6506007)(7696005)(8936002)(110136005)(71200400001)(8676002)(316002)(33656002)(4326008)(228453006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?dFJNajAyNENPSEpjWW9WNU9DbmROY1hIN1U4S3pldXZMSHM3Q0xRbWVRcDhw?=
 =?utf-8?B?SEpQREZPUTJWbml6c0VnZ2FHQkJ4TjhlRSs3dlZoOFU1bnhqV0ptVmdkMHBU?=
 =?utf-8?B?YXppcEkwWUx0enpZeG5JOEtKZXIrdFE3WVoxWUpQTzVWL3VzbDJ3WXpDV0U0?=
 =?utf-8?B?S1o2NG9Ia3BLaXFMUSswdDNLckdQaTc3d0VmL0NVN3hQUXF3LzAvVnhHdmNB?=
 =?utf-8?B?UEFtQjBRRDNBdndRMDAyS3loK1hrK1M0S3l0bVB0R1VseHphOWN1NHZzdm9q?=
 =?utf-8?B?SXdHTU8vNVhKN1Y0SnFYVUxkMzN4bTdqTjYvWUJzd1JkdXIzZjVvQlpZZVFZ?=
 =?utf-8?B?YTFDSERiemJNZHZucEFBdkNxK3lTcjJtdlFsS3ZNR2JVMWZyQjM3RDFWZTRM?=
 =?utf-8?B?SWM1UDl3SGsyUHZrSVRDd3BoclVPa2lINXpjS0htOXlJbm1mallTdVl0M0Vl?=
 =?utf-8?B?TlEzWkZmY2hkbldkajU3MEhwKzR2SnFXUC83cDZlY0xTVGRrSjY2REx3V2dt?=
 =?utf-8?B?bUdkQjZwYVF1eW05eUp1ZHlxL0VuOHZVa1pUQjBSV0ZTWDFyVmJiMC8wQmtk?=
 =?utf-8?B?TmQrc1hLTXQ4MHVLeFBGU09Jd2NOLzh5SFRHU2MxRzFlK2ZzN1dvelhTY1ln?=
 =?utf-8?B?cTUyUnp1Q2daNDJrTkpFMVJzMWZyNGtCcnFiY3hXSUZwUXpMcHVtc1FHUDFT?=
 =?utf-8?B?Tk4yZjhWRWZjVVdTNnhTSnRJRE9NT0wxaDdrbm5wWGcxYzBkbURXemEzdFJr?=
 =?utf-8?B?MHQ2LzR1REd5QjNBdnRvd2lneVdERGREMXN0VWVFdFFtQi83NTBGS0U3WmlO?=
 =?utf-8?B?ZXdsSi9UVUE0SUY4K3dROU5LSFhKWWQ2Y0pBZDJONmxvQUpRR0FBZWxyQ0li?=
 =?utf-8?B?bjFzZlBhZnJPcHQ3aWxYT3IrL1NBWHk5eUwzUTV3V1V0bWVzNkxudmJ2TUhp?=
 =?utf-8?B?UWVhNVFXQmc2S2tLWDZKWjhueDRiS0cvc0Zud0h1bDJWRkM2ZlB3clowa284?=
 =?utf-8?B?ak1NZmxOMWFzWGVXM0lob1ZsS3ovc1l2YWJpbnJCWWVDSzA5OGd6LzYrNTB1?=
 =?utf-8?B?Ym05dTdEU3I1WkFlQnc2U0JFaTMzb1EwbXVRZE9ZK1padWg2bE5YN3cyRjli?=
 =?utf-8?B?SjVTRThtTGVlQzg3cHZhNW5IWUZDOTFWMkZkYUVsY0c4UStaWElMOGF2QWhQ?=
 =?utf-8?B?NURQRG1XOGxUQnlBdy9rS2dlVHdwWmpxM25XcFNwaHZkVHg4eEFrbTYwQjEz?=
 =?utf-8?B?VU9Oai9OSUR4QW5ySzlJOG8wdHU2b0lQaFQ4dFpDdWJjUWkwSFAydkl0YWcy?=
 =?utf-8?Q?MPEegvrrPiy84=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3878
Original-Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c4a663a6-3a59-4637-0dfd-08d8b0b5f137
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F3pSEzm8OblVqXSieK4Igwk1x2AceZ81gGhP3ABTG+X5NKsHooNXxcKjoEk4KZ+mSerThx/X9jfEkJz7S6nFCjldkbLN3xW14YS10Xk/82b6Ix9T/Pai90Fad5PesjMW0a2UELMnzrXD7GyV0keqmvVuVIRdL0rRqkIiGnc14Xn2ZpnGLbbCt9hHgmqHtg+YZ0ACRj5Amc13UiztYaCz8x4LW6oggqO0ksb0k0NsUxTnqQIeEDn0PigInrRmeP6C6wksk/JdtnLBx68I3goCmZkAmVqdwyZJ0Vlhp07L8dmGri8wlamoCkGPvbcehXkmsTPjUEVypTuTVA8KHbXDKAW3z6gB6YsUbwRsNaJL6mpxjzjm5Ijnaw6kUex4Y3kzkZ2+9N6iWr39MpEHcQVJcuELdb7dbRDghs6maMkrfdyii4xoWG5jHbaFQKGmCe9I/aT3PscwOT5BOuxnPExw/Cf6d3eKQUv5XvHQrcNXeyU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966006)(7696005)(316002)(6506007)(110136005)(336012)(4326008)(55016002)(9686003)(478600001)(8936002)(82310400003)(86362001)(70206006)(70586007)(47076005)(33656002)(356005)(81166007)(2906002)(52536014)(83380400001)(26005)(82740400003)(5660300002)(186003)(8676002)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 13:38:02.4804
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6caabc36-16be-40c3-6dd0-08d8b0b5f56d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3740
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+U2VudDogMDQgSmFudWFyeSAyMDIxIDEz
OjIzDQo+VG86IERpZWdvIFN1ZWlybyA8RGllZ28uU3VlaXJvQGFybS5jb20+OyBvcGVuZW1iZWRk
ZWQtDQo+Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+Q2M6IG5kIDxuZEBhcm0uY29tPg0K
PlN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYyXSB1LWJvb3Q6IGFkZCAvYm9vdCBhbmQg
JHtzeXNjb25mZGlyfSB0bw0KPlNZU1JPT1RfRElSUw0KPg0KPk9uIE1vbiwgMjAyMS0wMS0wNCBh
dCAxMzowNyArMDAwMCwgRGllZ28gU3VlaXJvIHdyb3RlOg0KPj4gRm9yIHNvbWUgYXJtIGJhc2Vk
IG1hY2hpbmVzIHdlIGVuZCB1cCBnZW5lcmF0aW5nIGxvYWRzIG9mIGludGVybWVkaWF0ZQ0KPj4g
YmluYXJpZXMgd2hpY2ggd2lsbCBiZSBmdXJ0aGVyIHByb2Nlc3NlZCBhbmQgY29tYmluZWQgYXMg
c3RhbmRhbG9uZQ0KPj4gaW1hZ2VzLCBmb3IgZXhhbXBsZS4NCj4+IEkgdGhpbmsgZG9lc24ndCBt
YWtlIHNlbnNlIHRvIGhhdmUgdGhlbSBpbiB0aGUgZGVwbG95IGRpciBzaW5jZSBpdA0KPj4gd2ls
bCBtYWtlIGl0IHBvbGx1dGVkIGFuZCBJIGRvIG11Y2ggcHJlZmVyIHRvIGhhdmUgYSB0aWR5IGRl
cGxveSBkaXINCj4+IHdpdGggb25seSBhcnRpZmFjdHMgZm9yIGZsYXNoaW5nL3VwZGF0ZSB0aGUg
dGFyZ2V0LCByYXRoZXIgdGhhbiBhIGxpc3QNCj4+IG9mIHVzZWxlc3MgYXJ0aWZhY3RzIHRoYXQg
Y2FuJ3QgYmUgdXNlZCBkaXJlY3RseS4NCj4+DQo+PiBBbmQgSSBkbyBhZ3JlZSB3aXRoIHlvdSB0
aGF0IHVzaW5nIHRoZSBTWVNST09UX0RJUlMgZm9yIHRoaXMgcHVycG9zZQ0KPj4gbWlnaHQgbGVh
ZCB0b8KgIGNvbmZ1c2lvbi4gSXMgaXQgcGxhdXNpYmxlIHRvIGNvbWUgdXAgd2l0aCBhIG5ldw0K
Pj4gdmFyaWFibGUgYW5kIGRvX3BvcHVsYXRlIHJlbGF0ZWQgdGFza3MgdG8gYWRkcmVzcyB1c2Ug
Y2FzZXMgbGlrZSB0aGUNCj4+IG9uZSBJIGRlc2NyaWJlZA0KPg0KPkp1c3QgdGhpbmtpbmcgb3V0
IGxvdWQsIG1heWJlIHdlIGNhbiB1c2UgU1lTUk9PVF9ESVJTIGlmIHdlIHVzZSBzb21ldGhpbmcN
Cj53aGljaCBpcyBuYW1lZCBjbGVhcmx5IHN1Y2ggdGhhdCBpdHMgb2J2aW91cyBpdCB3aWxsIG5l
dmVyIGJlIG9uIHRoZSB0YXJnZXQNCj5yb290ZnM/DQo+DQo+Ii9ib290IiBpcyBjb25mdXNpbmcg
YXMgc29tZSBzeXN0ZW1zIGRvIGhhdmUvdXNlIHRoYXQgYnV0IHRoZXJlIGlzIG5vdGhpbmcNCj5z
dG9wcGluZyB1cyBjcmVhdGluZyBzb21ldGhpbmcgc3BlY2lmaWMgdG8gdGhpcyBwdXJwb3NlLiBX
ZSdkIGhhdmUgdG8gY2xlYXJseQ0KPmRvY3VtZW50IGl0IHNob3VsZCBuZXZlciBiZSB1c2VkIGZv
ciBhbnl0aGluZyBhbHNvIHNoYXJlZCB1c2luZyBkb19kZXBsb3kNCj5hbmQgd2FzIGZvciBpbnRl
cm1lZGlhdGUgZmlsZXMgb25seT8NCj4NClRoaXMgbWlnaHQgYmUgdGhlIHNpbXBsZXN0IHNvbHV0
aW9uIHdpdGggbG93IGNvZGUgYW5kIGRvY3VtZW50YXRpb24gaW1wYWN0cy4NCkluIG1ldGEtYXJt
IHdlIG1ha2UgdXNhZ2Ugb2YgdGhlICIvZmlybXdhcmUiIGRpcmVjdG9yeSB0byBpbmNsdWRlIHRo
ZXNlDQppbnRlcm1lZGlhdGUgZmlsZXMuDQpJIHN1c3BlY3QgdGhhdCBpbiBjYXNlIG9mIHUtYm9v
dCB3ZSBjb3VsZCBhbHNvIGNvbnNpZGVyIGl0IGFzIGEgImZpcm13YXJlIiBhcnRpZmFjdD8NCg0K
Q2hlZXJzLA0KDQpEaWVnbyBTdWVpcm8NCg==
