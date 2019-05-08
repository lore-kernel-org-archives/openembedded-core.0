Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 63183 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 May 2019 08:45:29 UTC
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50107.outbound.protection.outlook.com [40.107.5.107])
	by mail.openembedded.org (Postfix) with ESMTP id B48E87D0FB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 08:45:29 +0000 (UTC)
Received: from VI1PR10MB1709.EURPRD10.PROD.OUTLOOK.COM (10.165.194.30) by
	AM5PR10MB1698.EURPRD10.PROD.OUTLOOK.COM (10.161.65.15) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1856.14; Wed, 8 May 2019 18:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=B57bsI8py7UY8gRj1BNF4IV1iGaDwix0bDr9AU5D8j0=;
	b=EvNj2zXvBtCFP240VYD3XWsd1qewNZM2ZGdKcgkL9Zp7q8Q39Jwz4xEcduSm7GmLpVPUxfWz7p+76ERUy/jlbhw4r22SGfLrMxSLSWN8NqniHE9yK/QqFpcFz4MWux+boPpUD1Efhe1ycB0CdAaj5ZI7/lqQUx8r3TEd0YP7nME=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
	VI1PR10MB1709.EURPRD10.PROD.OUTLOOK.COM (10.165.194.30) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1856.10; Wed, 8 May 2019 14:38:44 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1856.012;
	Wed, 8 May 2019 14:38:44 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "Mikko.Rapeli@bmw.de" <Mikko.Rapeli@bmw.de>, "bunk@stusta.de"
	<bunk@stusta.de>
Thread-Topic: [OE-core] [PATCH 2/2] openssh: usable sshd depends on rngd from
	rng-tools
Thread-Index: AQHVBadnGqBrwa0KAEut1wg6tYlc8aZhR6MAgAAEg4A=
Date: Wed, 8 May 2019 14:38:44 +0000
Message-ID: <24616adf-6d73-ec86-e506-85f860f43731@prevas.dk>
References: <1557321969-28686-1-git-send-email-mikko.rapeli@bmw.de>
	<1557321969-28686-2-git-send-email-mikko.rapeli@bmw.de>
	<20190508140708.GC25917@localhost> <20190508142232.GC3459@hiutale>
In-Reply-To: <20190508142232.GC3459@hiutale>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P189CA0014.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::27)
	To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be1baec9-503b-4055-ccf0-08d6d3c2defb
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
	SRVR:VI1PR10MB1709; 
X-MS-TrafficTypeDiagnostic: VI1PR10MB1709:|VI1PR10MB1709:|AM5PR10MB1698:|AM5PR10MB1698:
x-microsoft-antispam-prvs: <VI1PR10MB170924894B72BA124856F15D8A320@VI1PR10MB1709.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(366004)(136003)(396003)(39850400004)(346002)(189003)(199004)(256004)(5660300002)(66066001)(4326008)(25786009)(8676002)(8936002)(52116002)(81156014)(81166006)(73956011)(2906002)(2501003)(3846002)(71200400001)(71190400001)(6116002)(31696002)(305945005)(76176011)(99286004)(7736002)(6486002)(72206003)(6436002)(68736007)(66556008)(66446008)(110136005)(74482002)(66476007)(66946007)(64756008)(316002)(229853002)(478600001)(31686004)(26005)(102836004)(6506007)(386003)(42882007)(8976002)(6246003)(53936002)(6512007)(2616005)(486006)(44832011)(36756003)(14454004)(476003)(186003)(446003)(11346002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB1709;
	H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FDa84La4CvbD54XhmWqU6ZtTWJnZ2ZvvrlW5GeXisqxKUJkOyUPw2P5zRf/g1KGTN1T6c688qpfVyupAlasW+8HD7nwPbIaUAa2YER1A+fYP+Wx4gEdpbznTX+SM8Ftj6ID9grYlXMFkSvQx0096UWTksldlYoYJwreQrlZ4X21RqhaVMhUqS14Hgt3PQQIKX61HlC7GT71kjmHmYubzGcGGrtzHdKIlbMZ5BFkKusbQP4LaokAy+U+SW7hlwNjhUu1KCi1d/a91LbW+q2jQXGfKUpuDdVQ4HmODZmaYrblvwYlafe0heoQG5YDTi4MLsUyjZIZ/GRnB1bPiBgvuJVq94CeiJFXcu6Xaqvf2f1TbK5qrLn8BDsCEcO9coTY/bzIzg8A0Dig0Yw6grUuLoPOAQdRK9dfU3+UZGdOqryk=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: be1baec9-503b-4055-ccf0-08d6d3c2defb
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 14:38:44.0976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1709
X-OriginatorOrg: prevas.dk
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] openssh: usable sshd depends on rngd from rng-tools
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
X-List-Received-Date: Thu, 09 May 2019 08:45:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <240D4834D6B1CD458E22773BF283024A@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

T24gMDgvMDUvMjAxOSAxNi4yMiwgTWlra28uUmFwZWxpQGJtdy5kZSB3cm90ZToNCj4gT24gV2Vk
LCBNYXkgMDgsIDIwMTkgYXQgMDU6MDc6MDhQTSArMDMwMCwgQWRyaWFuIEJ1bmsgd3JvdGU6DQo+
PiBPbiBXZWQsIE1heSAwOCwgMjAxOSBhdCAwNDoyNjowOVBNICswMzAwLCBNaWtrbyBSYXBlbGkg
d3JvdGU6DQo+Pj4gU2luY2Ugb3BlbnNzbCAxLjEuMSBhbmQgb3BlbnNzaCB3aGljaCB1c2VzIGl0
LCBzc2hkDQo+Pj4gc3RhcnR1cCBpcyBkZWxheWVkLiBUaGUgZGVsYXlzIHJhbmdlIGZyb20gZmV3
IHNlY29uZHMNCj4+PiB0byBtaW51dGVzIGFuZCBldmVuIHRvIGhvdXJzLiBUaGUgZGVsYXlzIGFy
ZSB2aXNpYmxlDQo+Pj4gaW4gaG9zdCBrZXlzIGdlbmVyYXRpb24gYW5kIHdoZW4gc3NoZCBwcm9j
ZXNzIGlzIHN0YXJ0ZWQNCj4+PiBpbiByZXNwb25zZSB0byBpbmNvbWluZyBUQ1AgY29ubmVjdGlv
biBidXQgaXMgZmFpbGluZw0KPj4+IHRvIHByb3ZpZGUgU1NIIHZlcnNpb24gc3RyaW5nIGFuZCBj
bGllbnRzIG9yIHRlc3RzIHRpbWUgb3V0Lg0KPj4+DQo+Pj4gSW4gYWxsIGNhc2VzIHRyYWNlcyBz
aG93IHRoYXQgc3NoZCBpcyB3YWl0aW5nIGZvciBnZXRlbnRyb3B5KCkNCj4+PiBzeXN0ZW0gY2Fs
bCB0byByZXR1cm4gZnJvbSBMaW51eCBrZXJuZWwsIHdoaWNoIHJldHVybnMgb25seQ0KPj4+IGFm
dGVyIGtlcm5lbCBzaWRlIHJhbmRvbSBudW1iZXIgcG9vbCBpcyBpbml0aWFsaXplZC4gVGhlIHBv
b2wNCj4+PiBpcyBpbml0aWFsaXplZCB2aWEgdmFyaW91cyBlbnRyb3B5IHNvdXJjZSB3aGljaCBt
YXkgYmUNCj4+PiBtaXNzaW5nIG9uIGVtYmVkZGVkIGRldmVsb3BtZW50IGJvYXJkcyBvciB2aWEg
cm5nZCBmcm9tDQo+Pj4gcm5nLXRvb2xzIHBhY2thZ2UgZnJvbSB1c2Vyc3BhY2UuIEhXIHJhbmRv
bSBudW1iZXIgZ2VuZXJhdGlvbg0KPj4+IGFuZCBrZXJuZWwgc3VwcG9ydCBoZWxwIGJ1dCBybmdk
IGlzIHRpbGwgbmVlZGVkIHRvIGZlZWQgdGhhdCBkYXRhDQo+Pj4gYmFjayB0byB0aGUgTGludXgg
a2VybmVsLg0KPj4+DQo+Pj4gRXhhbXBsZSBmcm9tIGFuIE5YUCBpbXg4IGJvYXJkIHNob3dzIHRo
YXQga2VybmVsIHJhbmRvbSBudW1iZXIgcG9vbA0KPj4+IGluaXRpYWxpemF0aW9uIGNhbiB0YWtl
IG92ZXIgNDAwIHNlY29uZHMgd2l0aG91dCBybmdkLA0KPj4+IGFuZCB3aXRoIHJuZ2QgaXQgaXMg
aW5pdGlhbGl6ZWQgYXQgYXJvdW5kIDQgc2Vjb25kcyBhZnRlciBib290Lg0KPj4+IFRoZSBjb21w
bGV0aW9uIG9mIGluaXRpYWxpemF0aW9uIGlzIHZpc2libGUgaW4ga2VybmVsIGRtZXNnIHdpdGgg
bGluZQ0KPj4+ICJyYW5kb206IGNybmcgaW5pdCBkb25lIi4NCj4+PiAuLi4NCj4+PiAtLS0gYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2gvb3BlbnNzaF83LjlwMS5iYg0KPj4+ICsr
KyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzaC9vcGVuc3NoXzcuOXAxLmJiDQo+
Pj4gQEAgLTE0OCw2ICsxNDgsNyBAQCBGSUxFU18ke1BOfS1rZXlnZW4gPSAiJHtiaW5kaXJ9L3Nz
aC1rZXlnZW4iDQo+Pj4gIA0KPj4+ICBSREVQRU5EU18ke1BOfSArPSAiJHtQTn0tc2NwICR7UE59
LXNzaCAke1BOfS1zc2hkICR7UE59LWtleWdlbiINCj4+PiAgUkRFUEVORFNfJHtQTn0tc3NoZCAr
PSAiJHtQTn0ta2V5Z2VuICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAn
cGFtJywgJ3BhbS1wbHVnaW4ta2V5aW5pdCBwYW0tcGx1Z2luLWxvZ2ludWlkJywgJycsIGQpfSIN
Cj4+PiArUkRFUEVORFNfJHtQTn0tc3NoZCArPSAicm5nLXRvb2xzIg0KPj4+IC4uLg0KPj4NCj4+
IFRoaXMgc2hvdWxkIG9ubHkgYmUgYW4gUlJFQ09NTUVORFMgc28gdGhhdCBwZW9wbGUgY2FuIG9w
dCBvdXQgb2YgaXQuDQo+Pg0KPj4gRS5nLiBDT05GSUdfUkFORE9NX1RSVVNUX0NQVSBpbiB0aGUg
a2VybmVsIGNhbiBzb2x2ZSB0aGUgc2FtZSANCj4+IHByb2JsZW0gd2l0aG91dCB1c2luZyBybmct
dG9vbHMgb24gc29tZSBwbGF0Zm9ybXMuDQo+IA0KPiBJIHRoaW5rIHRoaXMgaXMgYSBzdHJvbmdl
ciBkZXBlbmRlbmN5IHRoYW4ganVzdCBSUkVDT01NRU5EUy4gV2UgYnVpbGQNCj4gaW1hZ2VzIGFu
ZCBkaXNhYmxlIHJlY29tbWVuZHMgYnV0IHdlIGNhcmUgdGhhdCBzc2hkIHN0YXJ0cyBhcyBmYXN0
IGFzIGluDQo+IHN1bW8gYW5kIGVhcmxpZXIgeW9jdG8gcmVsZWFzZXMgZm9yIHRlc3RpbmcgZXRj
IHB1cnBvc2VzLg0KDQpCdXQgd2h5IHNob3VsZCBib2FyZHMgd2l0aG91dCBhIGh3cm5nIGJlIGZv
cmNlZCB0byBzcGVuZCBkaXNrIHNwYWNlIGFuZA0KcnVuLXRpbWUgcmVzb3VyY2VzIG9uIGEgZGFl
bW9uIHdoaWNoIHRoZXkgZG9uJ3QgYmVuZWZpdCBmcm9tIGF0IGFsbD8NCg0KSSBkb24ndCB0aGlu
ayBSQU5ET01fVFJVU1RfQ1BVIHdvcmtzLCB0aG91Z2guIFRoYXQncyBqdXN0IGZvciBzdHVmZiBs
aWtlDQpyZHJhbmQoKSwgaS5lLiBpbnN0cnVjdGlvbnMgYnVpbHQgaW50byB0aGUgQ1BVIC0gbm90
IGZvciBzb21lIG90aGVyDQpvbi1jaGlwIGh3cm5nLiBXaGV0aGVyIHRob3NlIGFyZSB1c2VkIGZv
ciBzZWVkaW5nIGVhcmx5IG9uIChpLmUuLA0Kd2l0aG91dCBybmdkIGRvaW5nIGl0cyB0aGluZykg
ZGVwZW5kcyBvbiB0aGUgLT5xdWFsaXR5IHBhcmFtZXRlciBzZXQgYnkNCnRoZSBpbmRpdmlkdWFs
IGh3cm5nIGRyaXZlcnMuIFZlcnkgZmV3IHNldCBvbmUsIHNvIHRoZXkgZ2V0IGFzc2lnbmVkIHRo
ZQ0KZGVmYXVsdF9xdWFsaXR5LCB3aGljaCBpcyBhIG1vZHVsZSBwYXJhbWV0ZXIgdGhhdCBkZWZh
dWx0cyB0byAwLg0KDQpJT1csIEkgdGhpbmsgKGJ1dCBJIGhhdmVuJ3QgZ290IGFyb3VuZCB0byB0
ZXN0aW5nIHRoaXMpIG9uZSBzaG91bGQgc2V0DQpybmdfY29yZS5kZWZhdWx0X3F1YWxpdHk9NTEy
IChvciBzb21ldGhpbmcpIG9uIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lDQp0byBtYWtlIHRoZSBr
ZXJuZWwgc3RhcnQgdGhlIGh3cm5nX2ZpbGwgdGhyZWFkIHRoYXQgd2lsbCBzZWVkIHRoZQ0KZW50
cm9weSBwb29sIGZyb20gdGhlIGh3cm5nLiBBdCBsZWFzdCBpZiBJJ20gcmVhZGluZw0KZHJpdmVy
cy9jaGFyL2h3X3JhbmRvbS9jb3JlLmMgY29ycmVjdGx5Lg0KDQpSYXNtdXMNCg0KDQoNCg0K

