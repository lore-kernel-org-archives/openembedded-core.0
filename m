Return-Path: <rasmus.villemoes@prevas.dk>
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05on2111.outbound.protection.outlook.com [40.107.21.111])
	by mail.openembedded.org (Postfix) with ESMTP id 1E9BD60B91
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 18:55:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=LAefbvCnDoaRxyfYb8SA763GVf1db3CHVy+qQbhUo6u95/xNwBf7jlC3ehUhjQfbsncIsrA9RSJUnzCHd5CXpfLxXrpO2lMwjRxyfpqCHXvyGGbrlaLidVZ5rJWL9/v/sAVYxc0z9PwvjSTNGPawHZG1j5Qer8b46kUkEu7xBFj/GCAeNAiYoPFBwx4muwX4EowaoKurqqzwylqpbp6otyzr2QfeQiOcKpetO8hNWyrqCMDsX6sA2utou4YBztS6bKax3aD5IEN1z1sSPraS8DuEAL7dRqEpP+AYJSBZ8i2KKegYWbxlqEQN0kYh2+6c9qgBYAHFrkQ8/O9Smy8edw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JRX+IDvqkvTx/oSe1Ewzta2YGSh7gCDzEsDj+CHpUMY=;
	b=Oe7oc8LuLMcyb8ZWDsl4Q5vysBYguUYUo0cvWiUszTAuo1uEt6Er0CVSfSv9FChvEAYuD5E2ao3fFbRDYWLyywJsIcw2DGjM2VRqmHOv01QRfP/er2w7VhW+mODqBPnIs/m08tz+5zDgh/hGcCxhWqUETKi9CxZKmBww8Y30PI9XUk5+6Uq1g6rD3k3n/Srsx3Erd254raNED3hKJCs+qbPGrKH/qX7ToCrOR7SzgNlYkRUda/Bbx3mMrzqsmYfzY5epjt+kfrVu6JfrLyPQa77xYW0v/r/oEmDevvAq28AW95EcQRSlu8GDwhyImrnvMyzM3tltSTKbqMIkl9muZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk; 
	dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JRX+IDvqkvTx/oSe1Ewzta2YGSh7gCDzEsDj+CHpUMY=;
	b=fFtwKcg7UXDuXKSu3NXG0/9mcBTh+YqSlLXQjspHwVNuQfXlE+XozPZqqc54R2QkvuLgacJCIdcy3oA4pcoI6BHqxh1228HtiWHoW3dGsMoXjjMc0pq31LDnC/c20pPpOtluJCAf/eTWzOQOi+iKX/qaf3HG97Po5OlZY+aP8Jc=
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (20.178.126.85) by
	VI1PR10MB2398.EURPRD10.PROD.OUTLOOK.COM (20.177.61.76) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2686.29; Mon, 3 Feb 2020 18:55:18 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	([fe80::8175:5aa2:2870:766d]) by
	VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	([fe80::8175:5aa2:2870:766d%6]) with mapi id 15.20.2686.031;
	Mon, 3 Feb 2020 18:55:18 +0000
Received: from [192.168.1.149] (5.186.115.54) by
	AM6P191CA0077.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.30
	via Frontend Transport; Mon, 3 Feb 2020 18:55:17 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [PATCH v2] glibc: don't ignore global LDFLAGS settings
Thread-Index: AQHVz3M5G9BLSb/lB0upqgzk1nY10KfzsY+AgBY2fAA=
Date: Mon, 3 Feb 2020 18:55:18 +0000
Message-ID: <b7d087ce-79c3-66d0-6abe-98466391e8e6@prevas.dk>
References: <20200120072801.16603-1-rasmus.villemoes@prevas.dk>
	<20200120092258.32254-1-rasmus.villemoes@prevas.dk>
	<CAMKF1so2RcV_qzS3if53Z-xhAchan1piCUrAaUn2Gb-3M3VwYA@mail.gmail.com>
In-Reply-To: <CAMKF1so2RcV_qzS3if53Z-xhAchan1piCUrAaUn2Gb-3M3VwYA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P191CA0077.EURP191.PROD.OUTLOOK.COM
	(2603:10a6:209:8a::18) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:e1::21)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=rasmus.villemoes@prevas.dk; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [5.186.115.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89d66783-2c6b-4491-4a4e-08d7a8da9c9d
x-ms-traffictypediagnostic: VI1PR10MB2398:
x-microsoft-antispam-prvs: <VI1PR10MB239815CCA0A588F7E9DCF80593000@VI1PR10MB2398.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0302D4F392
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(199004)(189003)(81166006)(81156014)(2616005)(956004)(71200400001)(66476007)(66556008)(31686004)(66946007)(16576012)(8676002)(64756008)(54906003)(6916009)(86362001)(44832011)(66446008)(6486002)(36756003)(53546011)(8976002)(26005)(2906002)(186003)(8936002)(31696002)(52116002)(498600001)(5660300002)(15974865002)(16526019)(4326008)(18886075002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2398;
	H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: prevas.dk does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m18Zojb5Z4GellTaikMMUGKvwzAL+UA65AchG6TvqxzWXzyMrxXvHCJ8ydhJaUf8mh+aCvDapBxKMojraED6pq5eR9FzVoyFyA9YeyxTPcnGy0M4T5zO5T/Z+YJrju0QBb+VA7XQf+3F3FooKfoE41os99Z3I+FRdNHZvjRNSgUVu9VMi29oeXhJwMdzgJ9Qd34YOc7OaKW4FsnoUsXFxu98vKfxvyQUelYF27u7DGW0k3jDaNgDHktG6fJZp4tm+sOPlg86KCMSiaKEJGOBx1+1Av9Q8YunEsUaeOexS8qi/sGIClKmRfsp1D6zkqbpZ0q1xHVKkAAXTiYEUT5wPmuFJOoH065N79XvaaKCLw5UAHNKCUTrDGG8dZgdGJxSQ+/uQLE9yCuXRIb6zGqUbzxYz+eWGG9xvi0o6arOcqKkYss9meQeqCPCLkNbOTGfYDo954Aqih1RKS8h8JZHer1u+D/NgBQhwXaEP88qp6ZNJ7vBbpeNxVeMQs7Bmf7u3aOOq2bAXJM/Sslsu2vZIDqNsdTpby+CpREqh41GmqCC7NuUu4RksbA065Vd0FiW+udspy+z0i1AwLFYcf1uaQ==
x-ms-exchange-antispam-messagedata: yl75vZBXv8rPBHr9r6HWi57l8Rv5/D5Yrc7bkdg/Hiijq6vAN3UXKOXMk2MfrLlQeXyxrashPpP6O1TB3YCgQ4DvEMStqI0OwjigNuExUYte+EWfJ4V+8mOcmpLFihnIH9Zm/3ac0k/Utvi4Runujg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d66783-2c6b-4491-4a4e-08d7a8da9c9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2020 18:55:18.2194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5gmEixY5QORuDPt0oBk26ViZKa090EwM2dgQtbHttTH3I4HhZTFKdG2KOz7KSs10iUejTatTY1D72Pv4gRuv5I1qKCFBVjjTTMvdw4mP+GM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2398
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glibc: don't ignore global LDFLAGS settings
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
X-List-Received-Date: Mon, 03 Feb 2020 18:55:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E7E99652BDD8A42ADBEE53EFBDD6633@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

cGluZw0KDQpPbiAyMC8wMS8yMDIwIDE2LjQyLCBLaGVtIFJhaiB3cm90ZToNCj4gdGhpcyBwYXRj
aCBpcyBvayBidXQgSSBoYXZlIHJlc2VydmF0aW9ucyBzaW5jZSAgKz0gbm93IG1lYW5zIGdsb2Jh
bA0KPiBsZGZsYWdzIHdpbGwgYmUgYXBwbGllZA0KPiBzbyBpdCB3b3VsZCBuZWVkIHNvbWUgdGVz
dGluZyB0byBlbnN1cmUgaXQgd29ya3Mgd2VsbC4NCj4gDQo+IE9uIE1vbiwgSmFuIDIwLCAyMDIw
IGF0IDE6MjMgQU0gUmFzbXVzIFZpbGxlbW9lcw0KPiA8cmFzbXVzLnZpbGxlbW9lc0BwcmV2YXMu
ZGs+IHdyb3RlOg0KPj4NCj4+IFR3byB0aGluZ3M6IFRoZSAtV2wsLXJwYXRoLWxpbmsgY29tbWVu
dCBpcyBzdGFsZSAoZHVlIHRvIHBlci1yZWNpcGUNCj4+IHN0YWdpbmcpLCBzbyB3ZSBubyBsb25n
ZXIgbmVlZCB0byBzZXQgb3VyIG93biBMREZMQUdTIHRvIGF2b2lkDQo+PiAtV2wsLXJwYXRoLWxp
bmsgYmVpbmcgaW4gdGhlcmUuIFNlY29uZCwgb3ZlcnJpZGluZyBMREZMQUdTIHNob3VsZCBiZQ0K
Pj4gZG9uZSBhdCB0aGUgcmVjaXBlIGxldmVsIHNvICJiaXRiYWtlIC1lIiBjYW4gc2hvdyB3aGF0
IGlzIGdvaW5nIG9uLg0KPj4gT3RoZXJ3aXNlIGRlYnVnZ2luZyB3aHkgb25lJ3MgZ2xvYmFsIExE
RkxBR1MgdHdlYWtzIGFyZSBiZWluZyBpZ25vcmVkDQo+PiBpcyBuZWVkbGVzc2x5IHBhaW5mdWwu
DQo+Pg0KPj4gU28gcHVsbCBvdXQgdGhlIExERkxBR1Mgc2V0dGluZyBmcm9tIGRvX2NvbXBpbGUs
IGFuZCBjaGFuZ2UgaXQgdG8gYW4NCj4+IGFwcGVuZCBpbnN0ZWFkIG9mIGFzc2lnbm1lbnQuDQo+
Pg0KPj4gRm9yIHRoZSBiZW5lZml0IG9mIGZ1dHVyZSBnaXQgYmxhbWU6IHRoZSAtZnVzZS1sZD1i
ZmQgc2V0dGluZyB3YXMNCj4+IGFkZGVkIGJ5IGFjNjRjM2I5NmIgKGdsaWJjOiBhbHdheXMgdXNl
IGJmZCBsaW5rZXIpLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPHJh
c211cy52aWxsZW1vZXNAcHJldmFzLmRrPg0KPj4gLS0tDQo+PiB2MjogUmViYXNlIHRvIHJlYWwg
dXBzdHJlYW0gbWFzdGVyLiBOb3RlIHRvIHNlbGY6ICJnaXQgcHVsbCIgYmVmb3JlIHJlYmFzaW5n
IHRvIG1hc3Rlci4NCj4+DQo+PiAgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4zMS5i
YiB8IDMgKy0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9u
cygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliY18y
LjMxLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4zMS5iYg0KPj4gaW5kZXgg
YjhjNTcwZGI1Mi4uY2ZiYTRkZTQ5YiAxMDA2NDQNCj4+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWJjL2dsaWJjXzIuMzEuYmINCj4+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2ds
aWJjXzIuMzEuYmINCj4+IEBAIC05Myw5ICs5Myw4IEBAIGRvX2NvbmZpZ3VyZSAoKSB7DQo+PiAg
ICAgICAgICBDUFBGTEFHUz0iIiBvZV9ydW5jb25mDQo+PiAgfQ0KPj4NCj4+ICtMREZMQUdTICs9
ICItZnVzZS1sZD1iZmQiDQo+PiAgZG9fY29tcGlsZSAoKSB7DQo+PiAtICAgICAgICMgLVdsLC1y
cGF0aC1saW5rIDxzdGFnaW5nPi9saWIgaW4gTERGTEFHUyBjYW4gY2F1c2UgYnJlYWthZ2UgaWYg
YW5vdGhlciBnbGliYyBpcyBpbiBzdGFnaW5nDQo+PiAtICAgICAgIExERkxBR1M9Ii1mdXNlLWxk
PWJmZCINCj4+ICAgICAgICAgYmFzZV9kb19jb21waWxlDQo+PiAgICAgICAgIGVjaG8gIkFkanVz
dCBsZGQgc2NyaXB0Ig0KPj4gICAgICAgICBpZiBbIC1uICIke1JUTERMSVNUfSIgXQ0KPj4gLS0N
Cj4+IDIuMjMuMA0KPj4NCg0KDQotLSANClJhc211cyBWaWxsZW1vZXMNClNvZnR3YXJlIERldmVs
b3Blcg0KUHJldmFzIEEvUw0KSGVkZWFnZXIgMw0KREstODIwMCBBYXJodXMgTg0KKzQ1IDUxMjEw
Mjc0DQpyYXNtdXMudmlsbGVtb2VzQHByZXZhcy5kaw0Kd3d3LnByZXZhcy5kaw0K

