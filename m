Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5EFCB60E68
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 11:59:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Mar 2014 04:55:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,764,1389772800"; d="scan'208";a="483931530"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by orsmga001.jf.intel.com with ESMTP; 31 Mar 2014 04:59:53 -0700
Received: from irsmsx101.ger.corp.intel.com (163.33.3.153) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 31 Mar 2014 12:58:49 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.78]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.248]) with mapi id
	14.03.0123.003; Mon, 31 Mar 2014 12:58:49 +0100
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/1] core-image-lsb: enforce pam as a needed
	distro feature
Thread-Index: AQHPTMfj9wOynF5xo0S32k3QBN01F5r7BvCA
Date: Mon, 31 Mar 2014 11:58:49 +0000
Message-ID: <1396267153.6418.5.camel@firebird.rb.intel.com>
References: <cover.1396259433.git.cristian.iorga@intel.com>
	<9e2ace2e2747ecda37004ea44d2e70de0586e185.1396259433.git.cristian.iorga@intel.com>
	<1396259888.14790.58.camel@ted>
In-Reply-To: <1396259888.14790.58.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.160]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] core-image-lsb: enforce pam as a needed distro feature
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
X-List-Received-Date: Mon, 31 Mar 2014 11:59:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1C8E3065C07F840A37A8E95F209D05B@intel.com>
Content-Transfer-Encoding: base64

DQoNCg0KT24gTW9uLCAyMDE0LTAzLTMxIGF0IDEwOjU4ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3
cm90ZToNCj4gT24gTW9uLCAyMDE0LTAzLTMxIGF0IDEyOjUxICswMzAwLCBDcmlzdGlhbiBJb3Jn
YSB3cm90ZToNCj4gPiBjb3JlLWltYWdlLWxzYiBvbmx5IGdhdmUgYSB3YXJuaW5nOg0KPiA+ICJX
QVJOSU5HOiBCdWlsZGluZyBsaWJwYW0gYnV0ICdwYW0nIGlzbid0IGluIERJU1RST19GRUFUVVJF
UywNCj4gPiBQQU0gd29uJ3Qgd29yayBjb3JyZWN0bHkiDQo+ID4gd2hlbiB0aGUgcHJvcGVyIERJ
U1RSTyB3YXMgbm90IHNldCBmb3IgaXQuDQo+ID4gZGVmYXVsdCBjaG9pY2Ugd291bGQgYmUgRElT
VFJPID0gInBva3ktbHNiIiwNCj4gPiBidXQgbm90IG5lY2Vzc2FyaWx5LCBkZXBlbmRpbmcgb24g
ZWFjaCBjdXN0b20gZGlzdHJvLg0KPiA+IA0KPiA+IFRoaXMgZml4IHdpbGwgZW5mb3JjZSB0aGUg
cHJvcGVyIHVzYWdlIG9mIHBhbQ0KPiA+IGFzIGEgZGlzdHJvIGZlYXR1cmUgZm9yIGNvcmUtaW1h
Z2UtbHNiIGJ5IGdpdmluZw0KPiA+IGFuIGVycm9yIGluc3RlYWQgb2YganVzdCBhIHdhcm5pbmcu
DQo+ID4gDQo+ID4gRml4ZXMgW1lPQ1RPICM2MDczXQ0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IENyaXN0aWFuIElvcmdhIDxjcmlzdGlhbi5pb3JnYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4g
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9pbWFnZXMvY29yZS1pbWFnZS1sc2IuYmIgfCA0ICsrKy0N
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvaW1hZ2VzL2NvcmUtaW1h
Z2UtbHNiLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2ltYWdlcy9jb3JlLWltYWdlLWxzYi5i
Yg0KPiA+IGluZGV4IGVkMzE2YTYuLmFiNjFjNmUgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2ltYWdlcy9jb3JlLWltYWdlLWxzYi5iYg0KPiA+ICsrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9pbWFnZXMvY29yZS1pbWFnZS1sc2IuYmINCj4gPiBAQCAtOSw0ICs5LDYg
QEAgSU1BR0VfSU5TVEFMTCA9ICJcDQo+ID4gICAgICBwYWNrYWdlZ3JvdXAtY29yZS1sc2IgXA0K
PiA+ICAgICAgIg0KPiA+ICANCj4gPiAtaW5oZXJpdCBjb3JlLWltYWdlDQo+ID4gK2luaGVyaXQg
Y29yZS1pbWFnZSBkaXN0cm9fZmVhdHVyZXNfY2hlY2sNCj4gPiArDQo+ID4gK1JFUVVJUkVEX0RJ
U1RST19GRUFUVVJFUyA9ICJwYW0iDQo+IA0KPiANCj4gSSBoYXZlIGEgZmVlbGluZyB0aGUgYXV0
b2J1aWxkZXIgYnVpbGRzIGNvcmUtaW1hZ2UtbHNiIGluIHNpdHVhdGlvbnMNCj4gd2hlcmUgRElT
VFJPPXBva3ksIGFsdGhvdWdoIEkgY291bGQgYmUgd3JvbmcuIEhhdmUgeW91IGNoZWNrZWQ/DQo+
IA0KDQpGV0lXLCBhbGwgdGhlIC1sc2IgYnVpbGRzZXRzIGFyZSBkb25lIHdpdGggRElTVFJPPXBv
a3ktbHNiIG9uIHRoZSBBQi4NClVuZm9ydHVudGVseSB3ZSBkbyBoYXZlIG9uZSBwcm9ibGVtYXRp
YyBidWlsZC4NClNvIHRoZSBhbnN3ZXIgdG8geW91ciBxdWVzdGlvbiBpczogd2UgZG9uJ3QgaGF2
ZSBjb3JlLWltYWdlLWxzYiBidWlsZHMNCndpdGggRElTVFJPPXBva3kgYnV0IHdlIGRvIGhhdmUg
YSBsaWI2NC1jb3JlLWltYWdlLWxzYi1zZGsgaW1hZ2UgYnVpbHQNCndpdGggRElTVFJPPXBva3kg
YW5kIG5vIHBhbSBpbiBESVNUUk9fRkVBVFVSRVMsIHNlZSB0aGUgbGFzdCBidWlsZCBvbg0Kbmln
aHRseS1tdWx0aWxpYi4uLiA6KA0KDQpDaGVlcnMsDQpTdGVmYW4NCg0KPiBDaGVlcnMsDQo+IA0K
PiBSaWNoYXJkDQo+IA0KDQo=

