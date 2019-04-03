Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 57826 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 04 Apr 2019 23:26:04 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780043.outbound.protection.outlook.com [40.107.78.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD947D4F7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 23:26:04 +0000 (UTC)
Received: from BN8PR02MB5762.namprd02.prod.outlook.com (20.179.78.28) by
	DM6PR02MB5772.namprd02.prod.outlook.com (20.179.54.202) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1750.20; Thu, 4 Apr 2019 01:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eT1mPPZ8CIiwszX31gW9w8YHwNzJQxKf6jv/nQnZWfw=;
	b=qOjVNybQvZp1Aw0m249Cx/LBvlvPAkIAIRELsKW+6sP/VSJDKklSmh3iw9gm/a9m7WlA7acYXhb3NIk1cBcZkryub9AxhAr+JmUnm9oIfk6QCo+M4+msHN7PMzOCPMKccWTA6O7KxXAJvlXtVLv99iJQquQefFzoAwUpcsm69rM=
Received: from BN8PR02MB6001.namprd02.prod.outlook.com (20.179.97.149) by
	BN8PR02MB5762.namprd02.prod.outlook.com (20.179.78.28) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1750.15; Wed, 3 Apr 2019 22:41:29 +0000
Received: from BN8PR02MB6001.namprd02.prod.outlook.com
	([fe80::9052:ec0d:55f3:b11b]) by
	BN8PR02MB6001.namprd02.prod.outlook.com
	([fe80::9052:ec0d:55f3:b11b%5]) with mapi id 15.20.1750.017;
	Wed, 3 Apr 2019 22:41:29 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Philip Balister <philip@balister.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 2/2] kernel-fitimage.bbclass: Introduce a way
	to provide external dtb
Thread-Index: AQHUyXI75r3YpIHqLUuVfrdaM0EPXqXpno6AgABP4QCAQQX3AIAAVT5A
Date: Wed, 3 Apr 2019 22:41:28 +0000
Message-ID: <BN8PR02MB600152367E3C2348A414DC11B9570@BN8PR02MB6001.namprd02.prod.outlook.com>
References: <1550192184-13460-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<1550192184-13460-2-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<679c61e2-f179-c986-b6ca-b69b95b5e22a@balister.org>
	<BYAPR02MB6005274C95E7FE6ACA65292DB97C0@BYAPR02MB6005.namprd02.prod.outlook.com>
	<6fe6cbadaf29e01975ec71a1b005d2fdb7885484.camel@linuxfoundation.org>
	<BYAPR02MB6005A0C02E838863D370C7B4B97E0@BYAPR02MB6005.namprd02.prod.outlook.com>
	<853fdac8bdfc6fc7222fce906172b08852a4eed3.camel@linuxfoundation.org>
	<2fa17d30-9a97-635f-541b-89313ee63793@balister.org>
In-Reply-To: <2fa17d30-9a97-635f-541b-89313ee63793@balister.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8e010f2-5359-4ca0-f366-08d6b8858349
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BN8PR02MB5762; 
X-MS-TrafficTypeDiagnostic: BN8PR02MB5762:|BN8PR02MB5762:|DM6PR02MB5772:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR02MB5762A050829C35EC3060EEF3B9570@BN8PR02MB5762.namprd02.prod.outlook.com>
x-forefront-prvs: 0996D1900D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(366004)(136003)(346002)(39850400004)(376002)(189003)(199004)(13464003)(86362001)(486006)(256004)(4326008)(76176011)(5660300002)(66066001)(81166006)(53936002)(105586002)(81156014)(106356001)(8936002)(14444005)(74316002)(6246003)(6436002)(446003)(11346002)(476003)(55016002)(186003)(99286004)(7696005)(2906002)(102836004)(72206003)(71200400001)(52536014)(71190400001)(26005)(97736004)(316002)(9686003)(6306002)(478600001)(68736007)(229853002)(53546011)(14454004)(8676002)(966005)(3846002)(33656002)(7736002)(6506007)(110136005)(6116002)(25786009)(305945005)(93886005)(43043002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR02MB5762;
	H:BN8PR02MB6001.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: efn5SY0RgwTogDtmrd2xfmiUPiW6uezJkecNOTVB+hJDbBKhi7MFvm3lKnM/g9+QG/ydj2ZBXQv/arDDg1QcKUDZb4uScgeM4E0qyBauY2QxM8HcQ68k0RD2ps3WQ1WRW/Nd7On8bDcwvdajzXEut5umwu7JBFGHOQDScAojlRusHw6ob0ac9MXjen3BIcPfWDjtZ392OBmBojDmoZTYJGOMKV7fO9tA+TYhfjRk8q3xK2c+sy42QI6kHBFa00AGQBV4d+tw1e9lH6XrkrwkUsZBFZthhEiwTaf+WpSb49f0vq3R3V8LXywKZeZvEp8FAU+X/7gw9anWszl9W24QC3n+r1gn24wFDA5G9GKvUtaxAVUqjVlzqbJt0iEUOnfReDjdT9rtkv8nXw888g7VUOKDD4sJ+9L5CfYH8zOLhNY=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e010f2-5359-4ca0-f366-08d6b8858349
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2019 22:41:29.0535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5762
X-OriginatorOrg: xilinx.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel-fitimage.bbclass: Introduce a way to provide external dtb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2019 23:26:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUGhpbGlwLA0KDQpJdCB3YXMgYmVlbiBtZXJnZWQgaW4gbWFzdGVyLCBuZWVkIHRvIGJhY2tw
b3J0IHRvIFRodWQNCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvb3BlbmVtYmVkZGVk
LWNvcmUvY29tbWl0LzA4NGY0ZGU0ZGJhZjk4MjE1MTZmYzAyNTRkMzVmNGZiMDQzMTFkMjcjZGlm
Zi0wODhiOWMyNzBjMDRkNjU3Yzc0YjE4MmRlMWY4ZTlmNg0KDQpUaGFua3MsDQpNYW5qdQ0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUGhpbGlwIEJhbGlzdGVyIFttYWlsdG86
cGhpbGlwQGJhbGlzdGVyLm9yZ10gDQpTZW50OiBXZWRuZXNkYXksIEFwcmlsIDMsIDIwMTkgMTA6
MzYgQU0NClRvOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9u
Lm9yZz47IE1hbmp1a3VtYXIgSGFydGhpa290ZSBNYXRoYSA8TUFOSlVLVU1AeGlsaW54LmNvbT4N
CkNjOiBvcGVuZW1iZWRkZWQtY29yZSA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDIvMl0ga2VybmVsLWZpdGlt
YWdlLmJiY2xhc3M6IEludHJvZHVjZSBhIHdheSB0byBwcm92aWRlIGV4dGVybmFsIGR0Yg0KDQpJ
IGFwcHJlY2lhdGUgdGhlIG5hZ2dpbmcgYWJvdXQgdGVzdGluZywgYnV0IEkganVzdCBkaWQgYW4g
dXBkYXRlIGFuZCByZWFsaXplZCB0aGVzZSBwYXRjaGVzIG5ldmVyIG1hZGUgaXQgaW50byBtYXN0
ZXIgc28gSSBjb3VsZCByZXF1ZXN0IHRoZXkgbW92ZSBpbnRvIHRodWQuDQoNClBoaWxpcA0KDQpP
biAwMi8yMS8yMDE5IDAzOjM3IEFNLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToNCj4gT24gVGh1LCAy
MDE5LTAyLTIxIGF0IDAzOjUzICswMDAwLCBNYW5qdWt1bWFyIEhhcnRoaWtvdGUgTWF0aGEgd3Jv
dGU6DQo+PiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmddDQo+Pj4gT24gVHVlLCAyMDE5LTAyLTE5IGF0IDE5OjM0ICswMDAwLCBN
YW5qdWt1bWFyIEhhcnRoaWtvdGUgTWF0aGENCj4+Pg0KPj4+Pj4gUFJFRkVSUkVEX1BST1ZJREVS
X3ZpcnR1YWwvZHRiID0gImRldmljZXRyZWUiDQo+Pj4+Pg0KPj4+Pg0KPj4+PiBZZXMsIEkgc2hv
dWxkIGhhdmUgYWRkZWQgdGhpcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIEkgd2lsbCB1cGRhdGUg
DQo+Pj4+IGl0IGFuZCByZS1zZW5kIFYyDQo+Pj4NCj4+PiBXaGF0IG1heSBhbHNvIGhlbHAgYSBs
b3QgaGVyZSB3b3VsZCBiZSBzb21lIHRlc3RzLiBUaGlzIGlzIGN1cnJlbnRseSANCj4+PiBhIGJs
YWNraG9sZSBpbiB0aGUgdGVzdHMgOigNCj4+Pg0KPj4gQXJlIHRoZXJlIGV4YW1wbGVzIG9mIGhh
dmluZyB0ZXN0cyBvbmx5IGZvciBiYmNsYXNzIGluIE9FLUNvcmU/IA0KPiANCj4gVGhlcmUgYXJl
LiBTZWUgbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy93aWMucHkNCj4gDQo+IEkgYXBwcmVj
aWF0ZSB3aWMgaXMgYSB0b29sLCBub3QgYSBjbGFzcyBidXQgdGhlIGV4YW1wbGVzIHRoZXJlIHNo
b3VsZCANCj4gaGVscC4gWW91IGNhbiB0cmlnZ2VyIHRoZW0gd2l0aCBvZS1zZWxmdGVzdCAtciB3
aWMuDQo+IA0KPiBBbm90aGVyIGV4YW1wbGUgd2hpY2ggaXMgYSBiYmNsYXNzIGlzIHNlbGZ0ZXN0
L2Nhc2VzL2FyY2hpdmVyLnB5IHdoaWNoIA0KPiBkb2VzIHVzZSBhIGNsYXNzIGluaGVyaXQuDQo+
IA0KPj4gV2UgbmVlZCBhIHJlY2lwZSBvciBjcmVhdGUtb25lIHRvIGluaGVyaXQgdGhpcyBjbGFz
cyBhbmQgcHJvYmFibHkgYWRkIA0KPj4gdGhhdCBhcyBhIHRlc3RjYXNlLg0KPj4gSSBhbSBub3Qg
c3VyZSBob3cgdG8gcHJvY2VlZCwgYW55IGV4YW1wbGUgd291bGQgaGVscCB0byBpbXBsZW1lbnQg
dGhlIA0KPj4gc2FtZQ0KPiANCj4gU2VlIGFib3ZlLCB0aGV5IHNob3cgaG93IHRvIGFkZCBzbWFs
bCBjb25maWcgZnJhZ21lbnRzLiBJZiB5b3UgZG8gbmVlZCANCj4gYSBmdWxsIHJlY2lwZSwgdGhl
biB0aGUgbWV0YS1zZWxmdGVzdCBsYXllciBvZiBPRS1Db3JlIHNob3VsZCBiZSBhYmxlIA0KPiB0
byBoZWxwIHRvby4NCj4gDQo+IElmIHlvdSBoYXZlIGFueSBvdGhlciBxdWVzdGlvbnMgb3IgcnVu
IGludG8gaXNzdWVzIHBsZWFzZSBkbyBhc2shDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJk
DQo+IA0KPiANCj4gDQo+IA0K

