Return-Path: <bevenson@melinkcorp.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0123.outbound.protection.outlook.com [65.55.169.123])
	by mail.openembedded.org (Postfix) with ESMTP id 04D7F6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 15:46:26 +0000 (UTC)
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) by
	BN3PR0501MB1092.namprd05.prod.outlook.com (25.160.113.139) with
	Microsoft
	SMTP Server (TLS) id 15.1.160.19; Mon, 11 May 2015 15:46:26 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) with
	mapi id 15.01.0160.009; Mon, 11 May 2015 15:46:26 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Thread-Topic: [OE-core] [PATCH 00/70] Proposed changes for fido
Thread-Index: AQHQi8YxfjT5UyP0vk2NI6IG2I3yup12tURQgAArl4CAAAqOoA==
Date: Mon, 11 May 2015 15:46:26 +0000
Message-ID: <BN3PR0501MB10903E487EB8EF0EB8D3D03EBBDB0@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <cover.1431326066.git.joshua.lock@collabora.co.uk>
	<BN3PR0501MB1090244F8445D0795045EC21BBDB0@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<1431356851.3086.12.camel@collabora.co.uk>
In-Reply-To: <1431356851.3086.12.camel@collabora.co.uk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: collabora.co.uk; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0501MB1092;
x-microsoft-antispam-prvs: <BN3PR0501MB109207E5675061E38C15E01FBBDB0@BN3PR0501MB1092.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0501MB1092; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1092; 
x-forefront-prvs: 05739BA1B5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(24454002)(377424004)(51704005)(164054003)(87936001)(102836002)(122556002)(19580405001)(62966003)(77156002)(2656002)(5001960100002)(15975445007)(110136002)(189998001)(40100003)(19580395003)(99286002)(1720100001)(92566002)(66066001)(33656002)(2950100001)(54356999)(76176999)(46102003)(2900100001)(106116001)(50986999)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1092;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2015 15:46:26.4277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1092
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/70] Proposed changes for fido
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
X-List-Received-Date: Mon, 11 May 2015 15:46:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Sm9zaHVhLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvc2h1YSBM
b2NrIFttYWlsdG86am9zaHVhLmxvY2tAY29sbGFib3JhLmNvLnVrXQ0KPiBTZW50OiBNb25kYXks
IE1heSAxMSwgMjAxNSAxMTowOCBBTQ0KPiBUbzogQnJ5YW4gRXZlbnNvbg0KPiBDYzogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQQVRDSCAwMC83MF0gUHJvcG9zZWQgY2hhbmdlcyBmb3IgZmlkbw0KPiANCj4gSGkgQnJ5
YW4sDQo+IA0KPiBPbiBNb24sIDIwMTUtMDUtMTEgYXQgMTI6NDAgKzAwMDAsIEJyeWFuIEV2ZW5z
b24gd3JvdGU6DQo+ID4gPiBCcnlhbiBFdmVuc29uICgxKToNCj4gPiA+ICAgdXRpbC1saW51eDog
QWRkIGxhc3RiIHRvIGFsdGVybmF0aXZlcw0KPiA+DQo+ID4gVGhlcmUgaXMgYSByZWZpbmVkIHZl
cnNpb24gb2YgdGhpcyBwYXRjaCBhdmFpbGFibGUgdGhhdCB3YXMgc3VibWl0dGVkDQo+ID4gdG8g
dGhlIG1haWxpbmcgbGlzdCBoZXJlOg0KPiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L3BpcGVybWFpbC9vcGVuZW1iZWRkZWQtY29yZS8yMDE1DQo+ID4gLUFwcmlsLzEwNDEzMi5odG1s
LiAgSXQgdXNlcyBQQUNLQUdFQ09ORklHIHRvIHJlbW92ZSBsYXN0LCBsYXN0YiBhbmQNCj4gPiB0
aGUgbWFuIHBhZ2VzIGZvciBsYXN0IGFuZCBsYXN0YiBmcm9tIHRoZSB1dGlsLWxpbnV4IGJ1aWxk
IGlmICdsYXN0Jw0KPiA+IGlzIG5vdCBpbiBQQUNLQUdFQ09ORklHLiAgSXQgYWxzbyBhZGRzICds
YXN0JyB0byBQQUNLQUdFQ09ORklHIGJ5DQo+ID4gZGVmYXVsdCB3aGljaCBtaW1pY3MgcHJldmlv
dXMgYmVoYXZpb3IuICBJJ20gc3RpbGwgYSBsaXR0bGUgdW5jbGVhciBvbg0KPiA+IHRoZSBwYXRj
aCBhcHByb3ZhbCBwcm9jZXNzLCBzbyBJIGFzc3VtZSB0aGUgdXBkYXRlZCBwYXRjaCB3b3VsZCBu
ZWVkDQo+ID4gdG8gYmUgYWNjZXB0ZWQgaW50byBtYXN0ZXIgYmVmb3JlIGJlaW5nIGJhY2twb3J0
ZWQgaW50byBmaWRvPw0KPiANCj4gVW5sZXNzIHRoZSBwYXRjaCBpcyBzcGVjaWZpYyB0byB0aGUg
c3RhYmxlIGJyYW5jaCB3ZSBvbmx5IHB1bGwgaW4gY2hhbmdlcyBpbnRvIGENCj4gc3RhYmxlIGJy
YW5jaCBvbmNlIHRoZXkgaGF2ZSBiZWVuIHJldmlld2VkIGFuZCBhY2NlcHRlZCBpbnRvIHRoZSBt
YXN0ZXINCj4gYnJhbmNoLg0KPiANCj4gSXMgdGhpcyBjaGFuZ2UgdmFsdWFibGUgd2l0aG91dCB0
aGUgcmVmaW5lZCBwYXRjaD8gT3Igc2hvdWxkIEkgcHVsbCBpdCB1bnRpbCBJIGNhbg0KPiBtZXJn
ZSBib3RoPw0KDQpJdCBkb2VzIGhhdmUgdmFsdWUgYXMgaXQgc3RhbmRzLiAgSXQgZml4ZXMgc29t
ZSB1cGdyYWRlIGNhc2VzIEkgd2FzIHNlZWluZyB3aGljaCB3YXMgZm9yY2luZyBtZSB0byBydW4g
b3BrZyB3aXRoICItLWZvcmNlLW92ZXJ3cml0ZSIgc2V0LiAgVGhlIHJlZmluZWQgcGF0Y2ggcmVt
b3ZlcyBsYXN0IGFuZCBsYXN0YiBmcm9tIHV0aWwtbGludXggaWYgc29tZW9uZSBkb2VzIG5vdCB3
YW50IGl0IHRoZXJlOyBnb29kIHRvIGRvIGJ1dCBub3QgYXMgY3JpdGljYWwgYXMgZml4aW5nIGEg
cGFja2FnZSBtYW5hZ2VtZW50IGlzc3VlLiAgU28gaW4gbXkgb3BpbmlvbiBpdCdkIGJlIHdvcnRo
IG1lcmdpbmcgdGhlIHByb3Bvc2VkIHBhdGNoIGludG8gZmlkby4NCg0KSWYgdGhlcmUgaXMgc29t
ZXRoaW5nIG1vcmUgdGhhdCBJIG5lZWQgdG8gZG8gdG8gZ2V0IG15IHVwZGF0ZWQgcGF0Y2ggdG8g
bWFzdGVyPw0KDQpUaGFua3MsDQpCcnlhbg0KDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBKb3NodWEN
Cg==

