Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.2735.1598921531985093891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2020 17:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: d89Sq5Sxg+ORx6euGVV59zmVDs6FKqr6p7nOMkk7eRPLESzV1mYuO56BWA9wpVKR9t/tBwEvI5
 rvdsslIUJT6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="137131500"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="137131500"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 17:52:10 -0700
IronPort-SDR: WcPZHEwoB/TKAITvPeXlcSsEvHe0CL3zFvBb+3rO6etOD/jEXia2AZIM591664BEiumWb7Lrq8
 o0mvEB4DVccw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="297112521"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by orsmga003.jf.intel.com with ESMTP; 31 Aug 2020 17:52:09 -0700
Received: from pgsmsx603.gar.corp.intel.com (10.108.199.138) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Sep 2020 08:52:08 +0800
Received: from pgsmsx112.gar.corp.intel.com (10.108.55.201) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 1 Sep 2020 08:52:08 +0800
Received: from pgsmsx111.gar.corp.intel.com ([169.254.2.71]) by
 PGSMSX112.gar.corp.intel.com ([169.254.3.161]) with mapi id 14.03.0439.000;
 Tue, 1 Sep 2020 08:52:07 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "grembeter@gmail.com" <grembeter@gmail.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"grygorii.tertychnyi@leica-geosystems.com"
	<grygorii.tertychnyi@leica-geosystems.com>
Subject: Re: [OE-core] [PATCH] devtool: unset _PYTHON_SYSCONFIGDATA_NAME
Thread-Topic: [OE-core] [PATCH] devtool: unset _PYTHON_SYSCONFIGDATA_NAME
Thread-Index: AQHWfHOQatM4/lZjvkqQVqj4gn1kmKlLhleAgAAUWgCABod4gIAAAyAAgABP7QA=
Date: Tue, 1 Sep 2020 00:52:07 +0000
Message-ID: <88571ebc571344d02e750760cc3283b205df28f8.camel@intel.com>
References: <20200827131040.439308-1-grygorii.tertychnyi@leica-geosystems.com>
	 <CANNYZj9v3sY-XcvS3Xy1G6+789BUV3PvxWxy_W2_O1XSRfRaAg@mail.gmail.com>
	 <CAGFuAuw9USqrHR0Gzskq_4HycMK-699nG6curEqA3v++wseBKA@mail.gmail.com>
	 <CAGFuAuzhLcrN5TP0brvC29SXb6Uor=GPzsu7FMKM_LESAHtHGA@mail.gmail.com>
	 <CANNYZj9FTytpu2OWg9DKODX0UmAuucHh0tNuekaXrthxoS2Abg@mail.gmail.com>
In-Reply-To: <CANNYZj9FTytpu2OWg9DKODX0UmAuucHh0tNuekaXrthxoS2Abg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.76.43]
MIME-Version: 1.0
Return-Path: anuj.mittal@intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <35FC52AEBF77EE41B1384E83DBF01121@intel.com>
Content-Transfer-Encoding: base64

SSBzZWUgdGhlIHNhbWUgcHJvYmxlbSBvbiBGZWRvcmEgMzIgd2l0aCBQeXRob24gMy44LjUuDQoN
ClRoYW5rcywNCg0KQW51ag0KDQpPbiBNb24sIDIwMjAtMDgtMzEgYXQgMjI6MDYgKzAyMDAsIEFs
ZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPiBJIGp1c3QgcmFuIHRoaXMgb24gb3BlbnN1c2UgdHVt
Ymxld2VlZCB3aGljaCBoYXMgMy44LjUgLSBubyBpc3N1ZXMuDQo+IA0KPiBBbGV4DQo+IA0KPiBP
biBNb24sIDMxIEF1ZyAyMDIwIGF0IDIxOjU1LCBnciBlbWJldGVyIDxncmVtYmV0ZXJAZ21haWwu
Y29tPiB3cm90ZToNCj4gPiBIaQ0KPiA+IA0KPiA+ID4gT24gVGh1LCBBdWcgMjcsIDIwMjAgYXQg
NDo1OSBQTSBBbGV4YW5kZXIgS2FuYXZpbiA8DQo+ID4gYWxleC5rYW5hdmluQGdtYWlsLmNvbT4g
d3JvdGU6DQo+ID4gDQo+ID4gPiBOb3RlIHRoYXQgd2UgYWxyZWFkeSBoYWQgdGhlIHNhbWUgcGF0
Y2ggcHJvcG9zZWQgZWFybGllciBhbmQgaXQNCj4gPiB3YXMgcmVqZWN0ZWQsIGFzIHRoZSBwcm9i
bGVtDQo+ID4gPiBwb3BzIHVwIGluIHZhcmlvdXMgZGlmZmVyZW50IHBsYWNlcyBhbmQgbmVlZHMg
dG8gYmUgdW5kZXJzdG9vZA0KPiA+IGFuZCBzb2x2ZWQgcHJvcGVybHkuDQo+ID4gDQo+ID4gSSBk
aWQgbm90IGZpbmQgYW55IHBhdGNoZXMgZm9yIGRldnRvb2wuIFRoZSBwYXRjaCBmb3IgcHl0aG9u
My0NCj4gPiBuYXRpdmUNCj4gPiB3cmFwcGVyIGRvZXMgbm90IGxvb2sgInRoZSBzYW1lIi4NCj4g
PiANCj4gPiBEb2VzIGFueW9uZSBlbHNlIGV4cGVyaWVuY2UgdGhlIHNhbWUgaXNzdWUgd2l0aCBk
ZXZ0b29sPw0KPiA+IA0KPiA+ID4NCj4gPiA+ID4gQWxleA0KPiA+ID4gPg0KPiA+ID4gPiBPbiBU
aHUsIDI3IEF1ZyAyMDIwIGF0IDE1OjExLCBnciBlbWJldGVyIDxncmVtYmV0ZXJAZ21haWwuY29t
Pg0KPiA+IHdyb3RlOg0KPiA+ID4gPj4NCj4gPiA+ID4+IE9uIFVidW50dSAyMC4wNC4xIExUUyB3
aXRoIFB5dGhvbiAzLjguMiAiZGV2dG9vbCBtb2RpZnkiIGZhaWxzDQo+ID4gd2l0aA0KPiA+ID4g
Pj4gRXhjZXB0aW9uOiBNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBtb2R1bGUgbmFtZWQNCj4gPiAn
X3N5c2NvbmZpZ2RhdGEnDQo+ID4gPiA+Pg0KPiA+ID4gPj4gZS5nLjogZGV2dG9vbCBtb2RpZnkg
LS1uby1zYW1lLWRpciAtLWJyYW5jaCBmaXQgdS1ib290DQo+ID4gfi93cy93L2R0b29sL3UtYm9v
dC1maXQNCj4gPiA+ID4+DQo+ID4gPiA+PiBFUlJPUjogRXJyb3IgZXhlY3V0aW5nIGEgcHl0aG9u
IGZ1bmN0aW9uIGluIGV4ZWNfcHl0aG9uX2Z1bmMoKQ0KPiA+IGF1dG9nZW5lcmF0ZWQ6DQo+ID4g
PiA+Pg0KPiA+ID4gPj4gVGhlIHN0YWNrIHRyYWNlIG9mIHB5dGhvbiBjYWxscyB0aGF0IHJlc3Vs
dGVkIGluIHRoaXMNCj4gPiBleGNlcHRpb24vZmFpbHVyZSB3YXM6DQo+ID4gPiA+PiBGaWxlOiAn
ZXhlY19weXRob25fZnVuYygpIGF1dG9nZW5lcmF0ZWQnLCBsaW5lbm86IDIsIGZ1bmN0aW9uOg0K
PiA+IDxtb2R1bGU+DQo+ID4gPiA+PiAgICAgIDAwMDE6DQo+ID4gPiA+PiAgKioqIDAwMDI6ZGV2
dG9vbF9wb3N0X3VucGFjayhkKQ0KPiA+ID4gPj4gICAgICAwMDAzOg0KPiA+ID4gPj4gIFsuLi5d
DQo+ID4gPiA+PiBGaWxlOiAnL3Vzci9saWIvcHl0aG9uMy44L3N5c2NvbmZpZy5weScsIGxpbmVu
bzogNDIxLA0KPiA+IGZ1bmN0aW9uOiBfaW5pdF9wb3NpeA0KPiA+ID4gPj4gICAgICAwNDE3OmRl
ZiBfaW5pdF9wb3NpeCh2YXJzKToNCj4gPiA+ID4+ICAgICAgMDQxODogICAgIiIiSW5pdGlhbGl6
ZSB0aGUgbW9kdWxlIGFzIGFwcHJvcHJpYXRlIGZvcg0KPiA+IFBPU0lYIHN5c3RlbXMuIiIiDQo+
ID4gPiA+PiAgICAgIDA0MTk6ICAgICMgX3N5c2NvbmZpZ2RhdGEgaXMgZ2VuZXJhdGVkIGF0IGJ1
aWxkIHRpbWUsIHNlZQ0KPiA+IF9nZW5lcmF0ZV9wb3NpeF92YXJzKCkNCj4gPiA+ID4+ICAgICAg
MDQyMDogICAgbmFtZSA9IF9nZXRfc3lzY29uZmlnZGF0YV9uYW1lKCkNCj4gPiA+ID4+ICAqKiog
MDQyMTogICAgX3RlbXAgPSBfX2ltcG9ydF9fKG5hbWUsIGdsb2JhbHMoKSwgbG9jYWxzKCksDQo+
ID4gWydidWlsZF90aW1lX3ZhcnMnXSwgMCkNCj4gPiA+ID4+ICAgICAgMDQyMjogICAgYnVpbGRf
dGltZV92YXJzID0gX3RlbXAuYnVpbGRfdGltZV92YXJzDQo+ID4gPiA+PiAgICAgIDA0MjM6ICAg
IHZhcnMudXBkYXRlKGJ1aWxkX3RpbWVfdmFycykNCj4gPiA+ID4+ICAgICAgMDQyNDoNCj4gPiA+
ID4+ICAgICAgMDQyNTpkZWYgX2luaXRfbm9uX3Bvc2l4KHZhcnMpOg0KPiA+ID4gPj4gRXhjZXB0
aW9uOiBNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBtb2R1bGUgbmFtZWQNCj4gPiAnX3N5c2NvbmZp
Z2RhdGEnDQo+ID4gPiA+Pg0KPiA+ID4gPj4gSXQgaGFwcGVucyBiZWNhdXNlIHUtYm9vdCAoYW5k
IGxpa2VseSBvdGhlciByZWNpcGVzKQ0KPiA+IGV2ZW50dWFsbHkgaW5oZXJpdHMNCj4gPiA+ID4+
IHB5dGhvbjNuYXRpdmUuYmJjbGFzcyB0aGF0IHNldHMNCj4gPiBfUFlUSE9OX1NZU0NPTkZJR0RB
VEFfTkFNRT0iX3N5c2NvbmZpZ2RhdGEiDQo+ID4gPiA+PiBhbmQgdGhpcyBhZmZlY3RzIGhvc3Qg
UHl0aG9uLg0KPiA+ID4gPj4NCj4gPiA+ID4+IEhlbmNlLCB1bnNldCBfUFlUSE9OX1NZU0NPTkZJ
R0RBVEFfTkFNRSBmb3IgZGV2dG9vbA0KPiA+IGNvbXBsZXRlbHkuDQo+ID4gPiA+Pg0KPiA+ID4g
Pj4gU2lnbmVkLW9mZi1ieTogR3J5Z29yaWkgVGVydHljaG55aSA8DQo+ID4gZ3J5Z29yaWkudGVy
dHljaG55aUBsZWljYS1nZW9zeXN0ZW1zLmNvbT4NCj4gPiA+ID4+IC0tLQ0KPiA+ID4gPj4gIG1l
dGEvY2xhc3Nlcy9kZXZ0b29sLXNvdXJjZS5iYmNsYXNzIHwgMiArKw0KPiA+ID4gPj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPiA+ID4+DQo+ID4gPiA+PiBkaWZmIC0tZ2l0
IGEvbWV0YS9jbGFzc2VzL2RldnRvb2wtc291cmNlLmJiY2xhc3MNCj4gPiBiL21ldGEvY2xhc3Nl
cy9kZXZ0b29sLXNvdXJjZS5iYmNsYXNzDQo+ID4gPiA+PiBpbmRleCAyODBkNjAwOWYzYzIuLjk1
ZDZmZTdhMjllOCAxMDA2NDQNCj4gPiA+ID4+IC0tLSBhL21ldGEvY2xhc3Nlcy9kZXZ0b29sLXNv
dXJjZS5iYmNsYXNzDQo+ID4gPiA+PiArKysgYi9tZXRhL2NsYXNzZXMvZGV2dG9vbC1zb3VyY2Uu
YmJjbGFzcw0KPiA+ID4gPj4gQEAgLTIyLDYgKzIyLDggQEANCj4gPiA+ID4+ICBERVZUT09MX1RF
TVBESVIgPz0gIiINCj4gPiA+ID4+ICBERVZUT09MX1BBVENIX1NSQ0RJUiA9ICIke0RFVlRPT0xf
VEVNUERJUn0vcGF0Y2h3b3JrZGlyIg0KPiA+ID4gPj4NCj4gPiA+ID4+ICsjIGhvc3QgUHl0aG9u
IGZhaWxzIHRvIGltcG9ydCBjb3JyZWN0IF9zeXNjb25maWdkYXRhIGlmIHRoaXMNCj4gPiB2YXJp
YWJsZSBpcyBzZXQNCj4gPiA+ID4+ICtfUFlUSE9OX1NZU0NPTkZJR0RBVEFfTkFNRVt1bmV4cG9y
dF0gPSAiMSINCj4gPiA+ID4+DQo+ID4gPiA+PiAgcHl0aG9uKCkgew0KPiA+ID4gPj4gICAgICB0
ZW1wZGlyID0gZC5nZXRWYXIoJ0RFVlRPT0xfVEVNUERJUicpDQo+ID4gPiA+PiAtLQ0KPiA+ID4g
Pj4gMi4yNS4xDQo+IA0KPiANCg==
