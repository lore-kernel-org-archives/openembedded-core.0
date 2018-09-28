Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 374 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 28 Sep 2018 13:09:58 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id A182A799A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 13:09:58 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w8SD3hP0011288
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 28 Sep 2018 15:03:43 +0200
Received: from DEFTHW99ERJMSX.ww902.siemens.net
	(defthw99erjmsx.ww902.siemens.net [139.22.70.135])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id w8SD3bs5025466
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 28 Sep 2018 15:03:43 +0200
Received: from DEFTHW99ERBMSX.ww902.siemens.net (139.22.70.76) by
	DEFTHW99ERJMSX.ww902.siemens.net (139.22.70.135) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Fri, 28 Sep 2018 15:03:41 +0200
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.216]) by
	DEFTHW99ERBMSX.ww902.siemens.net ([139.22.70.76]) with mapi id
	14.03.0415.000; Fri, 28 Sep 2018 15:03:41 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] [PATCH] cmake: add CMAKE_SYSROOT to generated
	toolchain file
Thread-Index: AQHUO6a3HbelJDVjZk2JNMua/n9J0aTToOkAgDI9PyA=
Date: Fri, 28 Sep 2018 13:03:40 +0000
Message-ID: <355BE46A91031048906B695426A8D8E61B8E3BE5@DEFTHW99EH4MSX.ww902.siemens.net>
References: <20180824123346.8602-1-pascal.bach@siemens.com>
	<CAMKF1soZoK+6SSbMG=tDwdVSJBcdb0ym5-drbHagXk2aci2t+A@mail.gmail.com>
In-Reply-To: <CAMKF1soZoK+6SSbMG=tDwdVSJBcdb0ym5-drbHagXk2aci2t+A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.33]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: add CMAKE_SYSROOT to generated toolchain file
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
X-List-Received-Date: Fri, 28 Sep 2018 13:09:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBzaW5jZSBpdCB3YXMgc3RhZ2VkIGluIG9lLWNvcmUvbWFzdGVyLW5leHQsIGl0IGdvdCBpbnRv
IG15IHRlc3RpbmcgcXVldWUgYW5kDQo+IGlzIGNhdXNpbmcgc2V2ZXJhbCByZWNpcGVzIEZUQkZT
DQo+IA0KPiBzZWUNCj4gDQo+IGh0dHA6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMv
QnVpbGQvNjY4NzcvDQoNCkkgZGlkIHNvbWUgZGlnZ2luZyBhbmQgaXQgc2VlbXMgYWxsIG9mIHRo
ZXNlIGZhaWx1cmVzIGFyZSByZWxhdGVkLg0KDQpFYWNoIG9mIHRoZW0gaXMgYWRkaW5nIHRoZSBo
b3N0IHBhdGggL3Vzci9pbmNsdWRlIHNvbWV3aGVyZSB3aGljaCBzaG91bGQgbm90IGJlIHRoZSBj
YXNlIHdoZW4gY3Jvc3MgY29tcGlsaW5nLg0KR0NDIGV2ZW4gZGV0ZWN0cyB0aGlzIGFuZCBpc3N1
ZXMgd2FybmluZ3M6IGNjMTogd2FybmluZzogaW5jbHVkZSBsb2NhdGlvbiAiL3Vzci9pbmNsdWRl
IiBpcyB1bnNhZmUgZm9yIGNyb3NzLWNvbXBpbGF0aW9uIFstV3BvaXNvbi1zeXN0ZW0tZGlyZWN0
b3JpZXNdDQoNCkNNYWtlIGhhcyBzb21lIG1hZ2ljIGluc2lkZSB0aGF0IHJlbW92ZXMgImltcGxp
Y2l0IGluY2x1ZGUiIHBhdGhzLiBCeSBkZWZhdWx0IHRoaXMgaXMgc2V0IHRvICIvdXJzL2luY2x1
ZGUiIGFzIHRoaXMgbWFrZXMgc2Vuc2Ugd2hlbiBkb2luZyBub24gY3Jvc3MgY29tcGlsYXRpb24u
DQoNClNldHRpbmcgQ01BS0VfU1lTUk9PVCBjaGFuZ2VzIHRoaXMgYXMgdGhlICJpbXBsaWNpdCBp
bmNsdWRlIiBwYXRocyBhcmUgbm93IHJlIHJvb3RlZCB0byBDTUFLRV9TWVNST09ULiBUaGlzIGxl
YWRzIHRvIENNYWtlIG5vIGxvbmdlciBjb25zaWRlcmluZyAvdXNyL2luY2x1ZGUgYSBzcGVjaWFs
IHBhdGggYW5kIHRodXMgaXQgaXMgbm8gbG9uZ2VyIHJlbW92ZWQuDQoNCkluIG15IG9waW5pb24g
dGhpcyBpcyBhbiBpc3N1ZSB3aXRoIHRoZSByZWNpcGVzIHRoYXQgZmFpbGVkLiBJIGFscmVhZHkg
Zm91bmQgaG93IHRvIGZpeCBpdCBmb3Igd2lyZXNoYXJrIGFuZCBJIHdpbGwgdHJ5IHRvIGZpeCB0
aGUgb3RoZXJzIHRvbywgdGhlbiBJIHdpbGwgc2VuZCBhbiB1cGRhdGVkIHBhdGNoc2V0Lg0KDQpQ
YXNjYWwNCg0KPiBPbiBGcmksIEF1ZyAyNCwgMjAxOCBhdCA1OjM0IEFNIFBhc2NhbCBCYWNoIDxw
YXNjYWwuYmFjaEBzaWVtZW5zLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIGFscmVhZHkg
Z290IGZpeGVkIGluIHRoZSB0b29sY2hhaW4gZmlsZSB0aGF0IGlzIHVzZWQgZHVyaW5nDQo+ID4g
ZGV2ZWxvcG1lbnQgaW4NCj4gPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVkL29wZW5l
bWJlZGRlZC0NCj4gY29yZS9jb21taXQvY2I0MjgwMmYyZmUxNw0KPiA+IDYwZjg5NGE0MzViMDcy
ODZiY2EzYTIyMDM2NA0KPiA+DQo+ID4gVGhlIHRvb2xjaGFpbiBmaWxlIGdlbmVyYXRlZCBieSB0
aGUgY21ha2UuYmJjbGFzcyBob3dldmVyIGRvZXMgbm90IHNldA0KPiA+IENNQUtFX1NZU1JPT1Qu
IFVuZGVyIGNlcnRhaW4gY2lyY3Vtc3RhbmNlcyB0aGlzIGFsc28gbGVhZHMgdG8gdGhlIGVycm9y
Og0KPiA+IGAic3RkbGliLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkgI2luY2x1ZGVfbmV4
dCA8c3RkbGliLmg+ImANCj4gPiBkdXJpbmcgdGhlIGJ1aWxkIG9mIGEgcmVjaXBlLg0KPiA+DQo+
ID4gQW4gZXhhbXBsZSB3aGVyZSB0aGlzIGFjY3VyZWQgd2FzIGR1cmluZyB0aGUgdXBncmFkZSBv
ZiB0aGUgQXBhY2hlDQo+ID4gVGhyaWZ0IHJlY2lwZSBpbiBtZXRhLW9wZW5lbWJlZGRlZCB0byAw
LjExLjAuIFdpdGggdGhpcyBjaGFuZ2UgdGhlDQo+ID4gYnVpbGQgd29ya3Mgb3V0IG9mIHRoZSBi
b3guDQo+ID4NCj4gPiBDTUFLRV9TWVNST09UIG11c3Qgb25seSBiZSBzZXQgd2hlbiBjcm9zc2Nv
bXBpbGluZywgb3RoZXJ3aXNlIGl0IHdpbGwNCj4gPiBpbnRlcmZlcmUgd2l0aCB0aGUgbmF0aXZl
IGNvbXBpbGVyIGhlYWRlcnMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXNjYWwgQmFjaCA8
cGFzY2FsLmJhY2hAc2llbWVucy5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEvY2xhc3Nlcy9jbWFr
ZS5iYmNsYXNzIHwgNSArKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL2NtYWtlLmJiY2xhc3MgYi9tZXRh
L2NsYXNzZXMvY21ha2UuYmJjbGFzcw0KPiA+IGluZGV4IGZkNDBhOTg2M2UuLjI1MWRkZDlhZmUg
MTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9jbGFzc2VzL2NtYWtlLmJiY2xhc3MNCj4gPiArKysgYi9t
ZXRhL2NsYXNzZXMvY21ha2UuYmJjbGFzcw0KPiA+IEBAIC02NCw5ICs2NCwxMiBAQCBkZWYgbWFw
X3RhcmdldF9hcmNoX3RvX3VuYW1lX2FyY2godGFyZ2V0X2FyY2gpOg0KPiA+ICAgICAgICAgIHJl
dHVybiAicHBjNjQiDQo+ID4gICAgICByZXR1cm4gdGFyZ2V0X2FyY2gNCj4gPg0KPiA+ICsNCj4g
PiAgY21ha2VfZG9fZ2VuZXJhdGVfdG9vbGNoYWluX2ZpbGUoKSB7DQo+ID4gICAgICAgICBpZiBb
ICIke0JVSUxEX1NZU30iID0gIiR7SE9TVF9TWVN9IiBdOyB0aGVuDQo+ID4gICAgICAgICAgICAg
ICAgIGNtYWtlX2Nyb3NzY29tcGlsaW5nPSJzZXQoIENNQUtFX0NST1NTQ09NUElMSU5HIEZBTFNF
ICkiDQo+ID4gKyAgICAgICBlbHNlDQo+ID4gKyAgICAgICAgICAgICAgIGNtYWtlX3N5c3Jvb3Q9
InNldCggQ01BS0VfU1lTUk9PVCBcIiR7UkVDSVBFX1NZU1JPT1R9XCINCj4gKSINCj4gPiAgICAg
ICAgIGZpDQo+ID4gICAgICAgICBjYXQgPiAke1dPUktESVJ9L3Rvb2xjaGFpbi5jbWFrZSA8PEVP
RiAgIyBDTWFrZSBzeXN0ZW0gbmFtZQ0KPiA+IG11c3QgYmUgc29tZXRoaW5nIGxpa2UgIkxpbnV4
Ii4NCj4gPiBAQCAtOTUsNiArOTgsOCBAQCBzZXQoIENNQUtFX0ZJTkRfUk9PVF9QQVRIX01PREVf
UFJPR1JBTQ0KPiA+ICR7T0VDTUFLRV9GSU5EX1JPT1RfUEFUSF9NT0RFX1BST0dSQU19ICkgIHNl
dCgNCj4gPiBDTUFLRV9GSU5EX1JPT1RfUEFUSF9NT0RFX0xJQlJBUlkgT05MWSApICBzZXQoDQo+
ID4gQ01BS0VfRklORF9ST09UX1BBVEhfTU9ERV9JTkNMVURFIE9OTFkgKQ0KPiA+DQo+ID4gKyRj
bWFrZV9zeXNyb290DQo+ID4gKw0KPiA+ICAjIFVzZSBxdC5jb25mIHNldHRpbmdzDQo+ID4gIHNl
dCggRU5We1FUX0NPTkZfUEFUSH0gJHtXT1JLRElSfS9xdC5jb25mICkNCj4gPg0KPiA+IC0tDQo+
ID4gMi4xMS4wDQo+ID4NCj4gPiAtLQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+ID4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+
ID4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IGh0dHA6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUN
Cg==

