Return-Path: <zhenhua.luo@nxp.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0097.outbound.protection.outlook.com [157.55.234.97])
	by mail.openembedded.org (Postfix) with ESMTP id 55A7A6011C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 09:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=AaPJWM6be0TorOkxAQEVnp4CjpASL+uzO+cFhwufX9U=;
	b=G4Foy9tbHkJBoOL5B2Jxih3/CNWCU4neDZ+oIaOgg7QlDpSbm7DP6tKOehU6ANEsu84ciH9hcThBXYbct0pehpAfEI9cUG7OGyrksO2VUvVeZnlrscKkCqhuU4e+DFRN60pMrtZetc1tZH5tRfH5rQi6tBIza/qsGzmBdDwl9H8=
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::14) by DB3PR04MB0683.eurprd04.prod.outlook.com
	(2a01:111:e400:943c::13) with Microsoft SMTP Server (TLS) id
	15.1.443.12; Mon, 28 Mar 2016 09:21:11 +0000
Received: from DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::6154:2240:a351:cf3a]) by
	DB3PR04MB0684.eurprd04.prod.outlook.com
	([fe80::6154:2240:a351:cf3a%15]) with mapi id 15.01.0443.016;
	Mon, 28 Mar 2016 09:21:11 +0000
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] LE and BE build for the same machine in Yocto
Thread-Index: AdGGWziqA75Rm8VjSfaQ4JWTZrOnbgAFOCuAAA9AQAAAiXIzMA==
Date: Mon, 28 Mar 2016 09:21:11 +0000
Message-ID: <DB3PR04MB0684A518F6F6871139E8E5DBEE860@DB3PR04MB0684.eurprd04.prod.outlook.com>
References: <DB3PR04MB0684386FD5BEA86D54DDA26EEE830@DB3PR04MB0684.eurprd04.prod.outlook.com>
	<1458894419.3073.41.camel@linuxfoundation.org>
	<3E1653F2-219C-418A-ABB6-B537303842D2@gmail.com>
In-Reply-To: <3E1653F2-219C-418A-ABB6-B537303842D2@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [123.151.195.52]
x-ms-office365-filtering-correlation-id: e399934e-8ab1-4548-1806-08d356ea4d9e
x-microsoft-exchange-diagnostics: 1; DB3PR04MB0683;
	5:zNhxCeADIrMXMlGQ6n78ludONWUdnezzXT0/yxAZu7yyRx3iIs72GyXvEdE8CUtMo7jMJ9PaNLc5vrnDPHavEWh0/pKaA33g72mftpPP+2VmUKNYYwX2AH+lQUArQ61ojffUT00cNlh5rnjg5wQiSQ==;
	24:riYZpyRzZxFKyy8o53+cfAHp9C7qmzVEHL9cYonzE5cdkSLdcvConbrNGSxuEcz0ZYPHlx+N3D29I9YU1yH9EnRty50HrWRPBXwOBM8SNa4=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR04MB0683;
x-microsoft-antispam-prvs: <DB3PR04MB0683582F38B2085999C2B7A7EE860@DB3PR04MB0683.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:DB3PR04MB0683; BCL:0; PCL:0; RULEID:; SRVR:DB3PR04MB0683; 
x-forefront-prvs: 0895DF8FFD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(377424004)(377454003)(24454002)(13464003)(2900100001)(2950100001)(87936001)(74316001)(92566002)(6116002)(3846002)(33656002)(1220700001)(5004730100002)(11100500001)(586003)(1096002)(5008740100001)(189998001)(5001770100001)(5250100002)(81166005)(66066001)(19580395003)(19580405001)(50986999)(3280700002)(3660700001)(76576001)(86362001)(2906002)(5003600100002)(54356999)(76176999);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB3PR04MB0683;
	H:DB3PR04MB0684.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2016 09:21:11.2039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR04MB0683
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: LE and BE build for the same machine in Yocto
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
X-List-Received-Date: Mon, 28 Mar 2016 09:21:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCBhbmQgS2hlbSwgDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4gDQoNCkkg
aGF2ZSB0cmllZCB0byBidWlsZCB0aGUgTEUgdS1ib290IGZvciBCRSB0YXJnZXQgaW4gWW9jdG8s
IHRoZSB1LWJvb3QgY2FuIGJlIGJ1aWx0IHN1Y2Nlc3NmdWxseSwgSSBvbmx5IG5lZWQgdG8gcGFz
cyAiLW1saXR0bGUtZW5kaWFuIiBmb3IgY3Jvc3MgZ2NjIGFuZCBwYXNzICIgLUVMIiBmb3IgY3Jv
c3MgbGQuIA0KDQoNCkJlc3QgUmVnYXJkcywNCg0KWmhlbmh1YQ0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEtoZW0gUmFqIFttYWlsdG86cmFqLmtoZW1AZ21haWwuY29t
XQ0KPiBTZW50OiBGcmlkYXksIE1hcmNoIDI1LCAyMDE2IDExOjQ0IFBNDQo+IFRvOiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IFpoZW5o
dWEgTHVvIDx6aGVuaHVhLmx1b0BueHAuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBMRSBhbmQgQkUgYnVp
bGQgZm9yIHRoZSBzYW1lIG1hY2hpbmUgaW4gWW9jdG8NCj4gDQo+IA0KPiA+IE9uIE1hciAyNSwg
MjAxNiwgYXQgMToyNiBBTSwgUmljaGFyZCBQdXJkaWUNCj4gPHJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gT24gRnJpLCAyMDE2LTAzLTI1IGF0IDA2
OjA3ICswMDAwLCBaaGVuaHVhIEx1byB3cm90ZToNCj4gPj4gSWYgdGhlIG11bHRpbGliIGZlYXR1
cmUgaXMgZW5hYmxlZCBpbiBZb2N0bywgdHdvIGNyb3NzLWNvbXBpbGUgZ2NjDQo+ID4+IGJpbmFy
aWVzIHdpbGwgYmUgZ2VuZXJhdGVkIHRvIGRvIGJvdGggMzJiIGFuZCA2NGIgYnVpbGQgZm9yIHRo
ZSBzYW1lDQo+ID4+IG1hY2hpbmUuICBDdXJyZW50bHkgd2UgaGF2ZSByZXF1aXJlbWVudCB0byBi
dWlsZCBMRSB1LWJvb3QgYW5kIEJFDQo+ID4+IGtlcm5lbC9yb290ZnMgZm9yIHRoZSBzYW1lIG1h
Y2hpbmUsIG1heSBJIGtub3cgaWYgdGhlcmUgaXMgc2ltaWxhcg0KPiA+PiBtdWx0aWxpYiBtZWNo
YW5pc20gaW4gWW9jdG8gdG8gc3VwcG9ydCBCRSBhbmQgTEUgYnVpbGQgZm9yIHRoZSBzYW1lDQo+
ID4+IG1hY2hpbmU/DQo+ID4NCj4gPiBJZiB1LWJvb3QgZG9lc24ndCBuZWVkIGFueSBzdXBwb3J0
IGxpYnMsIHRoZSBleGlzdGluZyBjb21waWxlciBjYW4NCj4gPiBsaWtlbHkgY29wZSB3aXRoIHRo
YXQuIElmIHlvdSBuZWVkIGxpYmdjYywgdGhlbiB5b3Ugd2lsbCBuZWVkIG11bHRpbGliLg0KPiA+
DQo+ID4gSSdkIGxpa2UgdG8gZ2V0IHRvIGEgcG9pbnQgd2hlcmUgd2UgY2FuIHN1cHBvcnQgdGhp
cyB1c2luZyBtdWx0aWxpYg0KPiA+IGhvd2V2ZXIgaXQgbWlnaHQgbm90IGFsbCB3b3JrIGNvcnJl
Y3RseSB0b2RheS4gSXQgd291bGQgYmUgaW50ZXJlc3RpbmcNCj4gPiB0byB0cnkgaXQhIFRoZSBp
bnRlbnQgaXMgdG8gZ2V0IHRvIHRoZSBwb2ludCB3aGVyZSBpdCB3b3VsZCB3b3JrIGJ1dA0KPiA+
IGl0cyBub3QgY3VycmVudGx5IGEgcHJpb3JpdHkgYXMgbm90IG1hbnkgcGVvcGxlIGhhdmUgYmVl
biBhc2tpbmcgZm9yDQo+ID4gaXQuDQo+ID4NCj4gDQo+IERvIHlvdSBtZWFuIGhhdmluZyBCRS9M
RSBhcyBhIG11bHRpbGliIG9wdGlvbiA/IHRoYXQgbWlnaHQgYmUgYSBwb3NzaWJpbGl0eSBhbmQN
Cj4gd291bGQgcHJvYmFibHkgbWFrZSBzZW5zZSBmb3IgdGhpcyBraW5kIG9mIGxpbWl0ZWQgc2Nl
bmFyaW8uDQo+IA0KPiB1LWJvb3QsIGtlcm5lbCwgYXJlIHN0YW5kYWxvbmUgYXBwcywgYnV0IHNv
bWUgb2YgdGhlbSBkbyBuZWVkIGdjYyBydW50aW1lIGF0DQo+IHZhcmlvdXMgc3RhZ2VzLCBzb21l
IG5lZWQgc3RhcnR1cCBmaWxlcyBzb21lIG5lZWQgbGliZ2NjIGFzIHdlbGwuIEdvb2QgdGhpbmcg
aXMNCj4gdGhleSB3b27igJl0IHJlcXVpcmUgbGliZ2NjX3MgYnV0IHN0YXRpYyBsaWJnY2MsIHdo
aWNoIGNhbiBjb21lIGZyb20gZ2NjLWNyb3NzDQo+IGFyZWEgYW5kIHdlIGRvbuKAmXQgaGF2ZSB0
byB3b3JyeSBhYm91dCBwYWNrYWdpbmcgaXQgZm9yIHRhcmdldC4gSSB3b25kZXIgaWYgd2UNCj4g
Y291bGQgdG9vbCB0aGUgbXVsdGlsaWIgY29uZmlndXJhdGlvbiBvZiBjcm9zcy1nY2Mgc2VwYXJh
dGVseSBmcm9tIHRoZSByb290ZnMNCj4gDQo+IGhvd2V2ZXIsIHRoYXQgbWlnaHQgd29yayBmb3Ig
c3RhcnR1cCBmaWxlcyBzaW5jZSB0aGV5IGFyZSBvbmx5IG5lZWRlZCBkdXJpbmcNCj4gYnVpbGQg
YW5kIGFyZSBub3QgcGFja2FnZWQgaW50byB0YXJnZXQgcGFja2FnZSBsaWtlIGxpYmdjYyBpcy4N
Cj4gDQo+IElmIHdlIGNhbiBsaW1pdCBvdXJzZWx2ZXMgdG8gc3RhcnR1cCBmaWxlcyBhbmQgc3Rh
dGljIGxpYmdjYyB0aGVuIGEgc29sdXRpb24gY291bGQNCj4gYmVjb21lIHBvc3NpYmxlLg0K

