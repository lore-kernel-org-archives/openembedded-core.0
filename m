Return-Path: <Luca.Boccassi@microsoft.com>
X-Greylist: delayed 45534 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 29 Jun 2019 08:03:09 UTC
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50113.outbound.protection.outlook.com [40.107.5.113])
	by mail.openembedded.org (Postfix) with ESMTP id 502797C426
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 08:03:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=gesI5hyLBEpCf2hv7iLres/fjgX3qssDtcLAxpzw3tGiOk8JDOTh/adOQOVrKcEJQhhnNVs5ofNIIMmIQiJ8Ltmy9w6hgcz0M3twfPXvdkPtJUHYRYkJ6WiYGcM58IgmfO9+Sg7+KhE8YST9JXpFYoHImsKFJq7PoDmKXQR42q6y0LBDVhCYqXr4dHKBSQfMkCpX2vtFpn/Lv4JxlBn78kS3AuRzVezq0uMmnpmmPMuDkeOy09ouY3IZ9QakvYlpzWW25B/1Gunb1liJVLjMDL+4E2+iX/yLjaMK+40k5p6BIBLb7gfUS6tgCSMr+AUYQ6AkNrus//69ncJeSHKSQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qq6/S8o/DumlLvIC0y/E8DsAp7L4zNLv9133tyxbIyw=;
	b=Xt+QTywZ6j0auupm+E6u6fgB+h5hztIhyLU0usAXwanPWpPRvazUtV8+SacuXPqGTZft3s5ZvBZg0Y6amKC2Jw2OSHdXds3P+9951Tve99kn4eCzyl03a2mAckt12R+ygrEeZcZWX749uF4nDq+fdiTEGXewbmIb+2WJiQWdAZ+wNp7R4GKVPiw9RnELFVg+sudI5VWa51mVjSbw9gEiljc1kwQc+xttfCVnfFMQxAfbpNxBdrhrn/XDddBGYL43HqeO0zyQNuoLT3fFk0iSUVNW/+eiZ7NA/Xhg+SB2PuPf4OdbCTWLBVyDk5GQ2x1u/3CM2btSHE6AVfKWz7IQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=microsoft.com;dmarc=pass action=none
	header.from=microsoft.com;dkim=pass header.d=microsoft.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qq6/S8o/DumlLvIC0y/E8DsAp7L4zNLv9133tyxbIyw=;
	b=ZR8yZTe7/gsZKhBhG3dg4gYHHzSwExWS8SQqXNz+m/9Dy4o+DBNjD4OsQI5j1+yWqlyA0aX5FIxoPjS2vDmCJytFPz/eWgoe6fgt4F3eVBBiy4iWnRM9cFIKD0sxWleoHomx0WcdhoRqCRXbK5YASoqBJmUyPq13eq2nMh8SQ5c=
Received: from HE1PR8303MB0092.EURPRD83.prod.outlook.com (129.75.142.219) by
	HE1PR8303MB0075.EURPRD83.prod.outlook.com (129.75.142.214) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2052.4; Fri, 28 Jun 2019 17:08:03 +0000
Received: from HE1PR8303MB0092.EURPRD83.prod.outlook.com
	([fe80::1888:c619:efc6:749d]) by
	HE1PR8303MB0092.EURPRD83.prod.outlook.com
	([fe80::1888:c619:efc6:749d%6]) with mapi id 15.20.2052.003;
	Fri, 28 Jun 2019 17:08:03 +0000
From: Luca Boccassi <Luca.Boccassi@microsoft.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow
	correct operation with opkg
Thread-Index: AQHVLdHVeMUfzMcN1EGX2ods0QZRWqaxSaOAgAACzoA=
Date: Fri, 28 Jun 2019 17:08:03 +0000
Message-ID: <66b042728223390987877549b5b88732bf47bf77.camel@microsoft.com>
References: <81618ab958486def551d22764d960944fb09b73d.camel () linuxfoundation
	! org>	
	<3fe59bbe44185ac5436afc8d48d2c2e313686ae9.camel@microsoft.com>
	<343e1b128636193717015cd16ac87e688007eef5.camel@linuxfoundation.org>
In-Reply-To: <343e1b128636193717015cd16ac87e688007eef5.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Luca.Boccassi@microsoft.com; 
x-originating-ip: [88.98.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b7ecab2-61a2-41d1-a10f-08d6fbeb2e6e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:HE1PR8303MB0075; 
x-ms-traffictypediagnostic: HE1PR8303MB0075:
x-microsoft-antispam-prvs: <HE1PR8303MB00757DFDB361E4C23A42CD9EF1FC0@HE1PR8303MB0075.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(199004)(189003)(6506007)(66066001)(7736002)(10090500001)(305945005)(76116006)(6116002)(8936002)(66946007)(66446008)(3846002)(66556008)(64756008)(5660300002)(73956011)(66476007)(478600001)(107886003)(186003)(2351001)(8676002)(25786009)(10290500003)(86362001)(72206003)(99286004)(22452003)(81166006)(81156014)(2616005)(76176011)(14454004)(446003)(102836004)(486006)(2906002)(71200400001)(71190400001)(476003)(256004)(54906003)(6916009)(2501003)(4326008)(316002)(68736007)(5640700003)(229853002)(26005)(118296001)(36756003)(53936002)(6246003)(6486002)(6512007)(6436002)(14444005)(11346002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR8303MB0075;
	H:HE1PR8303MB0092.EURPRD83.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JwnHyosytJLmfEExKoYe4uT7VDvY+QIc7tAb+SWxe/mZpafC7nf/5DwXP822eW36p86XuvgsaXI3VRvJnOHvMrFb4zZS4KR3ZEzcoLpACpbTBEmP94zR/AZXmK5CWTjE9rPw3o530bfVwILL5StJn9cuIVm1Mv6Q9o13Vt9OyVn7XgHwSntBqlQOYG7Rbhj9yci7/Jdf7VxLN6ti7rQxP56mFTrJYVwwNdnTlgyryZSRd5XMpSg5QGGZdBfbOKi4HDxJwmby/Be/jNHhjyLYUvZvCxr+MrroH/IZDGjvKDzJl5TmD8RwTZapdQzKZyEyvnXz1oA1gMP/+mtUC2J8tKq2UIt9IU8OSEYgl8HPg0vnQYWWekzkgDo8S/RaiHFOz7VfberxCzjEW2c1yIyWYquM9XFjhp8uiB4CbNRkY7g=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7ecab2-61a2-41d1-a10f-08d6fbeb2e6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 17:08:03.1773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: luboccas@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR8303MB0075
Cc: Sinan Kaya <Sinan.Kaya@microsoft.com>,
	Anatol Belski <Anatol.Belski@microsoft.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
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
X-List-Received-Date: Sat, 29 Jun 2019 08:03:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D88D47B90228C64796FCFD471D3F4F9E@EURPRD83.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE5LTA2LTI4IGF0IDE3OjU3ICswMTAwLCByaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnDQp3cm90ZToNCj4gT24gRnJpLCAyMDE5LTA2LTI4IGF0IDE2OjUyICswMDAw
LCBMdWNhIEJvY2Nhc3NpIHdyb3RlOg0KPiA+IDIwMTktMDYtMjdUMTM6MTg6NTQuNTU5MjQxNVog
W1dBUk5dIFsxNTkwMl0gUmVhZGluZyBwYWNrYWdlDQo+ID4gbGlzdHMuLi4NCj4gPiAyMDE5LTA2
LTI3VDEzOjE4OjU0LjU1OTI2MjhaIFtXQVJOXSBbMTU5MDNdIEJ1aWxkaW5nIGRlcGVuZGVuY3kN
Cj4gPiB0cmVlLi4uDQo+ID4gMjAxOS0wNi0yN1QxMzoxODo1NC41NTkzMTI0WiBbV0FSTl0gWzE1
OTA0XSBTb21lIHBhY2thZ2VzIGNvdWxkIG5vdA0KPiA+IGJlIGluc3RhbGxlZC4gVGhpcyBtYXkg
bWVhbiB0aGF0IHlvdSBoYXZlDQo+ID4gMjAxOS0wNi0yN1QxMzoxODo1NC41NTkzNTI2WiBbV0FS
Tl0gWzE1OTA1XSByZXF1ZXN0ZWQgYW4gaW1wb3NzaWJsZQ0KPiA+IHNpdHVhdGlvbiBvciBpZiB5
b3UgYXJlIHVzaW5nIHRoZSB1bnN0YWJsZQ0KPiA+IDIwMTktMDYtMjdUMTM6MTg6NTQuNTU5Mzg5
M1ogW1dBUk5dIFsxNTkwNl0gZGlzdHJpYnV0aW9uIHRoYXQgc29tZQ0KPiA+IHJlcXVpcmVkIHBh
Y2thZ2VzIGhhdmUgbm90IHlldCBiZWVuIGNyZWF0ZWQNCj4gPiAyMDE5LTA2LTI3VDEzOjE4OjU0
LjU1OTk5NjJaIFtXQVJOXSBbMTU5MDddIG9yIGJlZW4gbW92ZWQgb3V0IG9mDQo+ID4gSW5jb21p
bmcuDQo+ID4gMjAxOS0wNi0yN1QxMzoxODo1NC41NjAwNDE1WiBbV0FSTl0gWzE1OTA4XSBUaGUg
Zm9sbG93aW5nDQo+ID4gaW5mb3JtYXRpb24gbWF5IGhlbHAgdG8gcmVzb2x2ZSB0aGUgc2l0dWF0
aW9uOg0KPiA+IDIwMTktMDYtMjdUMTM6MTg6NTQuNTYwMDgzNFogW1dBUk5dIFsxNTkwOV0gVGhl
IGZvbGxvd2luZyBwYWNrYWdlcw0KPiA+IGhhdmUgdW5tZXQgZGVwZW5kZW5jaWVzOg0KPiA+IDIw
MTktMDYtMjdUMTM6MTg6NTQuNTYwMTM4M1ogW1dBUk5dIFsxNTkxMF0gIHRhcmdldC1zZGstcHJv
dmlkZXMtDQo+ID4gZHVtbXkgOiBDb25mbGljdHM6IGJhc2gNCj4gPiAyMDE5LTA2LTI3VDEzOjE4
OjU0LjU2MDE3MjRaIFtXQVJOXQ0KPiA+IFsxNTkxMV0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBDb25mbGljdHM6IGNvcmV1dGlscw0KPiA+IDIwMTktMDYtMjdUMTM6MTg6NTQuNTYwMjI0
NlogW1dBUk5dDQo+ID4gWzE1OTEyXSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENvbmZs
aWN0czogY29yZXV0aWxzLWRldg0KPiA+IDIwMTktMDYtMjdUMTM6MTg6NTQuNTYwMjU5MFogW1dB
Uk5dDQo+ID4gWzE1OTEzXSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENvbmZsaWN0czog
cGVybA0KPiA+IDIwMTktMDYtMjdUMTM6MTg6NTQuNTYwMzE0N1ogW1dBUk5dDQo+ID4gWzE1OTE0
XSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENvbmZsaWN0czogcGVybC1tb2R1bGUtc3Ry
aWN0DQo+ID4gMjAxOS0wNi0yN1QxMzoxODo1NC41NjAzOTg5WiBbV0FSTl0NCj4gPiBbMTU5MTVd
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ29uZmxpY3RzOiBwZXJsLW1vZHVsZS12YXJz
DQo+ID4gMjAxOS0wNi0yN1QxMzoxODo1NC41NjA1MzQ2WiBbV0FSTl0NCj4gPiBbMTU5MTZdICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgQ29uZmxpY3RzOiBwZXJsLW1vZHVsZS0NCj4gPiB3
YXJuaW5ncw0KPiA+IDIwMTktMDYtMjdUMTM6MTg6NTQuNTYwNjA5MFogW1dBUk5dIFsxNTkxN10g
RTogVW5hYmxlIHRvIGNvcnJlY3QNCj4gPiBwcm9ibGVtcywgeW91IGhhdmUgaGVsZCBicm9rZW4g
cGFja2FnZXMuDQo+ID4gDQo+ID4gU2FtZSBjb25maWcgd29ya2VkIGZpbmUgaW4gc3Vtby4NCj4g
PiANCj4gPiBBbnkgc3VnZ2VzdGlvbiBvbiBob3cgdG8gZml4IGl0PyBJcyBpdCBwb3NzaWJsZSB0
byBlbnRlciB0aGUNCj4gPiB3b3JraW5nDQo+ID4gZGlyZWN0b3J5IHRvIHJ1biBhcHQgbWFudWFs
bHksIHNvIHRoYXQgSSBjYW4gZGlnIGZ1cnRoZXIgaW50byB0aGUNCj4gPiBkZXBlbmRlbmN5IGlz
c3VlPw0KPiANCj4gU2FkbHkgc3VjaCAiZW50ZXIgYSBzaGVsbCIgZnVuY3Rpb25hbGl0eSBoYXMg
bmV2ZXIgYmVlbiBpbXBsZW1lbnRlZA0KPiBzbw0KPiB0aGF0IGlzbid0IHBvc3NpYmxlLg0KPiAN
Cj4gVGhlIG1lc3NhZ2UgaXMgYmFzaWNhbGx5IHNheWluZyB0aGF0IHRoZXJlIGFyZSBjb25mbGlj
dGVkIHByb3ZpZGVycw0KPiBvZg0KPiBzb21lIHRoaW5ncyB0aGUgU0RLIGlzIHRyeWluZyB0byBy
ZW1vdmUgKGxpa2UgYmFzaCwgcGVybCkuIEl0cyBsaWtlbHkNCj4gdGhlIGR1bW15IHJlY2lwZSBp
c24ndCBwcm92aWRpbmcgc29tZXRoaW5nIHdoaWNoIGl0IG5lZWRzIHRvIHdoaWNoDQo+IHdvdWxk
IHRoZW4gc3RvcCB0aGUgb3RoZXIgcHJvdmlkZXIgYmVpbmcgcHVsbGVkIGluLg0KPiANCj4gSG93
IHRvIGlzb2xhdGUgd2hhdCB0aGF0IGlzLCBJJ20gbGVzcyBzdXJlIGFib3V0LCB0aGVyZSBpc24n
dCBhbiBlYXN5DQo+IHdheS4gSSd2ZSBqdXN0IGRvbmUgaXQgZnJvbSBwYWNrYWdlIGluc3BlY3Rp
b24gaW4gdGhlIHBhc3QuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNClRoYW5rcyAt
IEknbGwgdHJ5IHRvIGdldCB0aGUgcGFja2FnZXMgb3V0IG9mIHRoZSBidWlsZCBkaXJlY3Rvcnkg
YW5kDQpyZWNyZWF0ZSB0aGUgYXB0IHN0YXRlIGluIGEgY2hyb290Lg0KDQpJcyB0aGVyZSBhIHRl
c3QgYnVpbGQgb2YgdGhlIFNESyB3aXRoIGEgcGFja2FnZXNfZGViIGNvbmZpZ3VyYXRpb24/IFRo
ZQ0KZGlzdHJvIGNvbmYgd2UgdXNlIHRoYXQgdHJpZ2dlcnMgdGhpcyBmYWlsdXJlIGlzIG5vdCB0
aGF0IGVzb3RlcmljIC0NCnByZXR0eSBtdWNoIHN0YW5kYXJkIHN0dWZmLg0KDQotLSANCktpbmQg
cmVnYXJkcywNCkx1Y2EgQm9jY2Fzc2kNCg==

