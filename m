Return-Path: <yin.thong.choong@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EE47E78361
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 07:53:14 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Jun 2017 00:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,342,1493708400"; d="scan'208";a="115192297"
Received: from pgsmsx101.gar.corp.intel.com ([10.221.44.78])
	by fmsmga006.fm.intel.com with ESMTP; 15 Jun 2017 00:52:42 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.197]) by
	PGSMSX101.gar.corp.intel.com ([169.254.1.101]) with mapi id
	14.03.0319.002; Thu, 15 Jun 2017 15:52:36 +0800
From: "Choong, Yin Thong" <yin.thong.choong@intel.com>
To: Andrea Adami <andrea.adami@gmail.com>
Thread-Topic: [OE-core] [PATCH v2] image_types.bbclass: Added default
	argument for ubi and ubifs image creation
Thread-Index: AQHS5af0o7HTUxIj1kypeWFmE2alkqIliiHA
Date: Thu, 15 Jun 2017 07:52:35 +0000
Message-ID: <CF0C948DE8E2634BB64BF489FF9EF7E7CD0723@PGSMSX105.gar.corp.intel.com>
References: <1497481558-144957-1-git-send-email-yin.thong.choong@intel.com>
	<1497481558-144957-2-git-send-email-yin.thong.choong@intel.com>
	<CAAQYJAurJSt2HCD4jcDzctbNtx8MiqU16g0EGPnDh4TTSY2XYQ@mail.gmail.com>
In-Reply-To: <CAAQYJAurJSt2HCD4jcDzctbNtx8MiqU16g0EGPnDh4TTSY2XYQ@mail.gmail.com>
Accept-Language: en-SG, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "otc-pg-team@eclists.intel.com" <otc-pg-team@eclists.intel.com>, "Eggleton,
	Paul" <paul.eggleton@intel.com>, "Wold, Saul" <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] image_types.bbclass: Added default argument for ubi and ubifs image creation
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
X-List-Received-Date: Thu, 15 Jun 2017 07:53:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBnZXQgdGhlIGluZm9ybWF0aW9uIHRocnUgdGhlIG9mZmljaWFsIHViaSBhbmQgdWJpZnMgd2Vi
c2l0ZS4gaHR0cDovL3d3dy5saW51eC1tdGQuaW5mcmFkZWFkLm9yZy9mYXEvdWJpZnMuaHRtbA0K
QmVzaWRlcyBJIGFsc28gdGVzdGVkIHdpdGggY29yZS1pbWFnZS1zYXRvLXNkayBidWlsZCB3aGlj
aCByZXF1aXJlZCBtb3JlIC1jIG1heGltdW0gc2l6ZSB0byBjcmVhdGUgdGhlIGltYWdlLiBJZiB0
aGUgY29uZmlndXJhdGlvbiBzaXplIGlzIG5vIHN1ZmZpY2llbnQgZXJyb3Igd2lsbCBoaWdobGln
aHQgYW5kIGJ1aWxkIGZhaWwuDQoNCkRlZmF1bHQgLWMgaXMgMjA0Ny4gSWYgYnVpbGQgY29yZS1p
bWFnZS1zYXRvLXNkay4gLWMgcGFyYW1ldGVyIGhhcyB0byBiZSBpbmNyZWFzZWQgdG8gODc0OSB3
aGljaCB3aWxsIGJlIGhpZ2hsaWdodCBvbiB0aGUgYnVpbGQgZXJyb3IuDQoNClRoYW5rcyBhbmQg
UmVnYXJkcw0KQ2hvb25nIFlpblRob25nDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBBbmRyZWEgQWRhbWkgW21haWx0bzphbmRyZWEuYWRhbWlAZ21haWwuY29tXSANClNlbnQ6
IFRodXJzZGF5LCBKdW5lIDE1LCAyMDE3IDM6MjAgUE0NClRvOiBDaG9vbmcsIFlpbiBUaG9uZyA8
eWluLnRob25nLmNob29uZ0BpbnRlbC5jb20+DQpDYzogT0UtY29yZSA8b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IG90Yy1wZy10ZWFtQGVjbGlzdHMuaW50ZWwuY29t
OyBFZ2dsZXRvbiwgUGF1bCA8cGF1bC5lZ2dsZXRvbkBpbnRlbC5jb20+OyBXb2xkLCBTYXVsIDxz
YXVsLndvbGRAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjJdIGlt
YWdlX3R5cGVzLmJiY2xhc3M6IEFkZGVkIGRlZmF1bHQgYXJndW1lbnQgZm9yIHViaSBhbmQgdWJp
ZnMgaW1hZ2UgY3JlYXRpb24NCg0KT24gVGh1LCBKdW4gMTUsIDIwMTcgYXQgMTowNSBBTSwgIDx5
aW4udGhvbmcuY2hvb25nQGludGVsLmNvbT4gd3JvdGU6DQo+IEZyb206IENob29uZyBZaW5UaG9u
ZyA8eWluLnRob25nLmNob29uZ0BpbnRlbC5jb20+DQo+DQo+IEFkZGVkIGRlZmF1bHQgYXJndW1l
bnQgZm9yIHViaSBhbmQgdWJpZnMgaW1hZ2UgY3JlYXRpb24uDQoNCkhlbGxvLA0KDQpJcyBpdCBi
ZXR0ZXIgdG8gZXJyb3Igb3V0ICpiZWZvcmUqIG90IHRvIGNyZWF0ZSBhbiAqaW52YWxpZCogaW1h
Z2U/DQpIb3cgY2FuIHlvdSBndWVzcyBzdWNoIGRlZmF1bHRzPw0KDQpDaGVlcnMNCkFuZHJlYQ0K
DQoNCg0KPiBNS1VCSUZTX0FSR1MgYW5kIFVCSU5JWkVfQVJHUyBib3RoIGFyZ3VtZW50IHN0aWxs
IGFibGUgdG8gZWRpdCBpbiANCj4gbG9jYWwuY29uZg0KPg0KPiBbWU9DVE8gIzExNTg5XQ0KPg0K
PiBTaWduZWQtb2ZmLWJ5OiBDaG9vbmcgWWluVGhvbmcgPHlpbi50aG9uZy5jaG9vbmdAaW50ZWwu
Y29tPg0KPiAtLS0NCj4gIG1ldGEvY2xhc3Nlcy9pbWFnZV90eXBlcy5iYmNsYXNzIHwgOSArKysr
KysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdp
dCBhL21ldGEvY2xhc3Nlcy9pbWFnZV90eXBlcy5iYmNsYXNzIA0KPiBiL21ldGEvY2xhc3Nlcy9p
bWFnZV90eXBlcy5iYmNsYXNzDQo+IGluZGV4IDc3NDliMDAuLmJiZGUwOGQgMTAwNjQ0DQo+IC0t
LSBhL21ldGEvY2xhc3Nlcy9pbWFnZV90eXBlcy5iYmNsYXNzDQo+ICsrKyBiL21ldGEvY2xhc3Nl
cy9pbWFnZV90eXBlcy5iYmNsYXNzDQo+IEBAIC0yOTIsMyArMjkyLDEyIEBAIElNQUdFX0VYVEVO
U0lPTl9saXZlID0gImhkZGltZyBpc28iDQo+ICAjIFRoZSBJTUFHRV9UWVBFU19NQVNLRUQgdmFy
aWFibGUgd2lsbCBiZSB1c2VkIHRvIG1hc2sgb3V0IGZyb20gdGhlIA0KPiBJTUFHRV9GU1RZUEVT
LCAgIyBpbWFnZXMgdGhhdCB3aWxsIG5vdCBiZSBidWlsdCBhdCBkb19yb290ZnMgdGltZTogdm1k
aywgdmRpLCBxY293MiwgaGRkZGlyZWN0LCBoZGRpbWcsIGlzbywgZXRjLg0KPiAgSU1BR0VfVFlQ
RVNfTUFTS0VEID89ICIiDQo+ICsNCj4gKyMgRGVmYXVsdCBhcmd1bWVudCB0byBjcmVhdGUgdWJp
IGFuZCB1YmlmcyBpbWFnZSB3aXRoIA0KPiArY29yZS1pbWFnZS1zYXRvLXNkayANCj4gKyhodHRw
Oi8vd3d3LmxpbnV4LW10ZC5pbmZyYWRlYWQub3JnL2ZhcS91Ymlmcy5odG1sKQ0KPiArIyAtbSAy
MDQ4OiB0ZWxscyBta2ZzLnViaWZzIHRoYXQgdGhlIG1pbmltdW0gaW5wdXQvb3V0cHV0IHVuaXQg
c2l6ZSANCj4gK29mIHRoZSBmbGFzaCB0aGlzIFVCSUZTIGltYWdlIGlzIGNyZWF0ZWQgZm9yIGlz
IDIwNDggYnl0ZXMgKE5BTkQgcGFnZSANCj4gK2luIHRoaXMgY2FzZSk7ICMgLWUgMTI5MDI0OiBs
b2dpY2FsIGVyYXNlYmxvY2sgc2l6ZSBvZiB0aGUgVUJJIHZvbHVtZSB0aGlzIGltYWdlIGlzIGNy
ZWF0ZWQgZm9yOyAjIC1jIDg3NDk6IHNwZWNpZmllcyBtYXhpbXVtIGZpbGUtc3lzdGVtIHNpemUg
aW4gbG9naWNhbCBlcmFzZWJsb2NrczsgdGhpcyBtZWFucyB0aGF0IGl0IHdpbGwgYmUgcG9zc2li
bGUgdG8gdXNlIHRoZSByZXN1bHRpbmcgZmlsZS1zeXN0ZW0gb24gdm9sdW1lcyB1cCB0byB0aGlz
IHNpemUgKGxlc3Mgb3IgZXF1aXZhbGVudCk7IHNvIGluIHRoaXMgcGFydGljdWxhciBjYXNlLCB0
aGUgcmVzdWx0aW5nIEZTIG1heSBiZSBwdXQgb24gdm9sdW1lcyB1cCB0byBhYm91dCAyNTFNaUIg
KDEyOTAyNCBtdWx0aXBsaWVkIGJ5IDIwNDcpOyBTZWUgdGhpcyBzZWN0aW9uIGZvciBtb3JlIGRl
dGFpbHMuDQo+ICsjIC1wIDEyOEtpQjogdGVsbHMgdWJpbml6ZSB0aGF0IHBoeXNpY2FsIGVyYXNl
YmxvY2sgc2l6ZSBvZiB0aGUgZmxhc2ggDQo+ICtjaGlwIHRoZSBVQkkgaW1hZ2UgaXMgY3JlYXRl
ZCBmb3IgaXMgMTI4S2lCICgxMjggKiAxMDI0IGJ5dGVzKTsgIyAtcyA1MTI6IHRlbGxzIHViaW5p
emUgdGhhdCB0aGUgZmxhc2ggc3VwcG9ydHMgc3ViLXBhZ2VzIGFuZCBzdWItcGFnZSBzaXplIGlz
IDUxMiBieXRlczsgdWJpbml6ZSB3aWxsIHRha2UgdGhpcyBpbnRvIGFjY291bnQgYW5kIHB1dCB0
aGUgVklEIGhlYWRlciB0byB0aGUgc2FtZSBOQU5EIHBhZ2UgYXMgdGhlIEVDIGhlYWRlci4NCj4g
K01LVUJJRlNfQVJHUyA/Pz0gIiAtbSAyMDQ4IC1lIDEyOTAyNCAtYyA4NzQ5ICINCj4gK1VCSU5J
WkVfQVJHUyA/Pz0gIiAtcCAxMjhLaUIgLW0gMjA0OCAtcyA1MTIgIg0KPiAtLQ0KPiAyLjcuNA0K
Pg0KPiAtLQ0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=

