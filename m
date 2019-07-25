Return-Path: <anuj.mittal@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 10E187F1CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 04:15:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2019 21:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,305,1559545200"; d="scan'208";a="170126927"
Received: from pgsmsx106.gar.corp.intel.com ([10.221.44.98])
	by fmsmga008.fm.intel.com with ESMTP; 24 Jul 2019 21:15:30 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.22]) by
	PGSMSX106.gar.corp.intel.com ([169.254.9.31]) with mapi id
	14.03.0439.000; Thu, 25 Jul 2019 12:15:29 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ricardo@ribalda.com"
	<ricardo@ribalda.com>
Thread-Topic: [OE-core] [PATCH] packagegroup-core-base-utils: Make it
	machine specific
Thread-Index: AQHVQp+X6/05crKn6EW21N7DFbUbrw==
Date: Thu, 25 Jul 2019 04:15:29 +0000
Message-ID: <8ef2c6da3338af5ff5de8a34bd96f30e8ac232dc.camel@intel.com>
References: <20190723123750.24125-1-ricardo@ribalda.com>
In-Reply-To: <20190723123750.24125-1-ricardo@ribalda.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.190.98]
MIME-Version: 1.0
Subject: Re: [PATCH] packagegroup-core-base-utils: Make it machine specific
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
X-List-Received-Date: Thu, 25 Jul 2019 04:15:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD08CADC1BBECC4DA789D75C0F04431B@intel.com>
Content-Transfer-Encoding: base64

VGhpcyBpcyBjYXVzaW5nIGVycm9yczoNCg0KUGFyc2luZyByZWNpcGVzLi4uRVJST1I6IC9ob21l
L3Bva3lidWlsZC95b2N0by0NCndvcmtlci9tdWx0aWxpYi9idWlsZC9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtDQpjb3JlLWJhc2UtdXRpbHMuYmI6IFBs
ZWFzZSBlbnN1cmUgcmVjaXBlIC9ob21lL3Bva3lidWlsZC95b2N0by0NCndvcmtlci9tdWx0aWxp
Yi9idWlsZC9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAt
DQpjb3JlLWJhc2UtdXRpbHMuYmIgc2V0cyBQQUNLQUdFX0FSQ0ggYmVmb3JlIGluaGVyaXQgcGFj
a2FnZWdyb3VwDQpFUlJPUjogL2hvbWUvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9tdWx0aWxpYi9i
dWlsZC9tZXRhL3JlY2lwZXMtDQpleHRlbmRlZC9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1j
b3JlLWJhc2UtdXRpbHMuYmI6IFBsZWFzZSBlbnN1cmUNCnJlY2lwZSAvaG9tZS9wb2t5YnVpbGQv
eW9jdG8td29ya2VyL211bHRpbGliL2J1aWxkL21ldGEvcmVjaXBlcy0NCmV4dGVuZGVkL3BhY2th
Z2Vncm91cHMvcGFja2FnZWdyb3VwLWNvcmUtYmFzZS11dGlscy5iYiBzZXRzDQpQQUNLQUdFX0FS
Q0ggYmVmb3JlIGluaGVyaXQgcGFja2FnZWdyb3VwDQpFUlJPUjogL2hvbWUvcG9reWJ1aWxkL3lv
Y3RvLXdvcmtlci9tdWx0aWxpYi9idWlsZC9tZXRhL3JlY2lwZXMtDQpleHRlbmRlZC9wYWNrYWdl
Z3JvdXBzL3BhY2thZ2Vncm91cC1jb3JlLWJhc2UtdXRpbHMuYmI6IFBsZWFzZSBlbnN1cmUNCnJl
Y2lwZSAvaG9tZS9wb2t5YnVpbGQveW9jdG8td29ya2VyL211bHRpbGliL2J1aWxkL21ldGEvcmVj
aXBlcy0NCmV4dGVuZGVkL3BhY2thZ2Vncm91cHMvcGFja2FnZWdyb3VwLWNvcmUtYmFzZS11dGls
cy5iYiBzZXRzDQpQQUNLQUdFX0FSQ0ggYmVmb3JlIGluaGVyaXQgcGFja2FnZWdyb3VwDQpkb25l
Lg0KDQpodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxk
ZXJzLzQ0L2J1aWxkcy84Nzkvc3RlcHMvOC9sb2dzL3N0ZXA2Yg0KDQpUaGFua3MsDQoNCkFudWoN
Cg0KT24gVHVlLCAyMDE5LTA3LTIzIGF0IDE0OjM3ICswMjAwLCBSaWNhcmRvIFJpYmFsZGEgRGVs
Z2FkbyB3cm90ZToNCj4gUmVjaXBlIG1ha2VzIHVzZSBvZiB0aGUgdmFyaWFibGUgTUFDSElORV9G
RUFUVVJFUywgd2hpY2ggaXMgbWFjaGluZQ0KPiBzcGVjaWZpYzoNCj4gDQo+ICAgJHtAYmIudXRp
bHMuY29udGFpbnMoIk1BQ0hJTkVfRkVBVFVSRVMiLCAia2V5Ym9hcmQiLCAia2JkIiwgIiIsIGQp
fQ0KPiANCj4gVGhpcyBwYXRjaCBhdm9pZHMgbXVsdGljb25maWcgZXJyb3JzIHN1Y2ggYXM6DQo+
IA0KPiBFUlJPUjogbWM6cXQ1MjIyOnBhY2thZ2Vncm91cC1jb3JlLWJhc2UtdXRpbHMtMS4wLXIw
DQo+IGRvX3BhY2thZ2VfcWFfc2V0c2NlbmU6IEVycm9yIGV4ZWN1dGluZyBhIHB5dGhvbiBmdW5j
dGlvbiBpbg0KPiBleGVjX3B5dGhvbl9mdW5jKCkgYXV0b2dlbmVyYXRlZDoNCj4gDQo+IFRoZSBz
dGFjayB0cmFjZSBvZiBweXRob24gY2FsbHMgdGhhdCByZXN1bHRlZCBpbiB0aGlzDQo+IGV4Y2Vw
dGlvbi9mYWlsdXJlIHdhczoNCj4gRmlsZTogJ2V4ZWNfcHl0aG9uX2Z1bmMoKSBhdXRvZ2VuZXJh
dGVkJywgbGluZW5vOiAyLCBmdW5jdGlvbjoNCj4gPG1vZHVsZT4NCj4gICAgICAwMDAxOg0KPiAg
KioqIDAwMDI6ZG9fcGFja2FnZV9xYV9zZXRzY2VuZShkKQ0KPiAgICAgIDAwMDM6DQo+IEZpbGU6
ICcvd29ya2Rpci9yZXBvL3Bva3kvbWV0YS9jbGFzc2VzL2luc2FuZS5iYmNsYXNzJywgbGluZW5v
OiAxMDI2LA0KPiBmdW5jdGlvbjogZG9fcGFja2FnZV9xYV9zZXRzY2VuZQ0KPiAgICAgIDEwMjI6
U1NUQVRFVEFTS1MgKz0gImRvX3BhY2thZ2VfcWEiDQo+ICAgICAgMTAyMzpkb19wYWNrYWdlX3Fh
W3NzdGF0ZS1pbnB1dGRpcnNdID0gIiINCj4gICAgICAxMDI0OmRvX3BhY2thZ2VfcWFbc3N0YXRl
LW91dHB1dGRpcnNdID0gIiINCj4gICAgICAxMDI1OnB5dGhvbiBkb19wYWNrYWdlX3FhX3NldHNj
ZW5lICgpIHsNCj4gICoqKiAxMDI2OiAgICBzc3RhdGVfc2V0c2NlbmUoZCkNCj4gICAgICAxMDI3
On0NCj4gICAgICAxMDI4OmFkZHRhc2sgZG9fcGFja2FnZV9xYV9zZXRzY2VuZQ0KPiAgICAgIDEw
Mjk6DQo+ICAgICAgMTAzMDpweXRob24gZG9fcWFfc3RhZ2luZygpIHsNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFJpY2FyZG8gUmliYWxkYSBEZWxnYWRvIDxyaWNhcmRvQHJpYmFsZGEuY29tPg0KPiAt
LS0NCj4gIC4uLi9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1jb3JlLWJhc2UtdXRpbHMuYmIg
ICAgICAgICAgICAgICB8IDINCj4gKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFja2FnZWdyb3Vw
cy9wYWNrYWdlZ3JvdXAtY29yZS0NCj4gYmFzZS11dGlscy5iYiBiL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC0NCj4gY29yZS1iYXNlLXV0aWxzLmJiDQo+
IGluZGV4IDYxMWUwY2FmY2MuLjkzNTMyMmNmZTAgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1jb3JlLWJhc2UtDQo+IHV0aWxz
LmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vn
cm91cC1jb3JlLWJhc2UtDQo+IHV0aWxzLmJiDQo+IEBAIC05LDYgKzksOCBAQCBpbmhlcml0IHBh
Y2thZ2Vncm91cA0KPiAgDQo+ICBWSVJUVUFMLVJVTlRJTUVfdmltID89ICJ2aW0tdGlueSINCj4g
IA0KPiArUEFDS0FHRV9BUkNIID0gIiR7TUFDSElORV9BUkNIfSINCj4gKw0KPiAgUkRFUEVORFNf
JHtQTn0gPSAiXA0KPiAgICAgIGJhc2UtcGFzc3dkIFwNCj4gICAgICBiYXNoIFwNCj4gLS0gDQo+
IDIuMjAuMQ0KPiANCg==

