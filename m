Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 569976ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:21:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 07 Apr 2015 04:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,537,1422950400"; d="scan'208";a="552063762"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
	by orsmga003.jf.intel.com with ESMTP; 07 Apr 2015 04:21:13 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.2]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.100]) with mapi id
	14.03.0224.002; Tue, 7 Apr 2015 12:21:10 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH 5/5] bluetooth.bbclass: set bluez5 as the
	default BT stack
Thread-Index: AQHQb+lAzXM3Q39V6Ei+R9OGX9SXGp0/llfAgABLsICAAAWrAIAAIl6AgAFICYCAABa7gA==
Date: Tue, 7 Apr 2015 11:21:09 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F496CCF@irsmsx105.ger.corp.intel.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
	<CAJTo0LYL4Mf9L0Fnij2yRLhyJwn-sxdDV2uWUAx-FCRFBgTHmQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F4944D2@irsmsx105.ger.corp.intel.com>
	<552282D7.6040108@pabigot.com>
	<CAP9ODKobzYLZS9K55S5rSw=Z=LHOaDOTt5mkzTx3SjomMvXnXg@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB2F49465B@irsmsx105.ger.corp.intel.com>
	<20150407105521.GA2340@jama>
In-Reply-To: <20150407105521.GA2340@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Tue, 07 Apr 2015 11:21:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2VsbDoNCjEuIFRoYXQncyBhIHRoaW5nIGZvciB0aGUgZnV0dXJlDQoyLiBXaG8gd2lsbCBtYWlu
dGFpbiBzdXBwb3J0IGZvciBidWdzIHJlcG9ydGVkIHRvIEJsdWVaIDQueD8gSXQncyBhIG1hdHRl
ciBvZiByZXNvdXJjZXMuDQozLiAiUHJvamVjdHMgdXNpbmcgZGlmZmVyZW50IEJsdWV0b290aCBp
bXBsZW1lbnRhdGlvbnMiIGlzIHNvbWV0aGluZyBkaWZmZXJlbnQgZnJvbSBzd2l0Y2hpbmcgZnJv
bSBCWjQgdG8gQlo1IGFuZCB2aWNlIHZlcnNhLiBXZSBkb27igJl0IHN1cHBvcnQgbXVsdGlwbGUg
Qmx1ZXRvb3RoIHN0YWNrcywgYnV0IChpbmNvbXBhdGlibGUhKSB2YXJpYW50cyBvZiBCbHVlWi4g
VGhhdCdzIGRpZmZlcmVudC4gSW4gdGhlIGZ1dHVyZSwgd2Ugd2lsbCBubyBsb25nZXIgc3VwcG9y
dCBib3RoLCB3aHkgY29tcGxpY2F0ZSB0aGUgY29kZT8NCg0KL0NyaXN0aWFuIElvcmdhDQpZb2N0
byBQcm9qZWN0DQpJbnRlbCBDb3Jwb3JhdGlvbg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogTWFydGluIEphbnNhIFttYWlsdG86bWFydGluLmphbnNhQGdtYWlsLmNvbV0gDQpT
ZW50OiBUdWVzZGF5LCBBcHJpbCA3LCAyMDE1IDE6NTUgUE0NClRvOiBJb3JnYSwgQ3Jpc3RpYW4N
CkNjOiBPdGF2aW8gU2FsdmFkb3I7IFBldGVyIEEuIEJpZ290OyBQYXRjaGVzIGFuZCBkaXNjdXNz
aW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFU
Q0ggNS81XSBibHVldG9vdGguYmJjbGFzczogc2V0IGJsdWV6NSBhcyB0aGUgZGVmYXVsdCBCVCBz
dGFjaw0KDQpPbiBNb24sIEFwciAwNiwgMjAxNSBhdCAwMjozMjoxM1BNICswMDAwLCBJb3JnYSwg
Q3Jpc3RpYW4gd3JvdGU6DQo+IGZvciAyLjAgKHdoeSAxLjEwPz8pLCBpZiB0aGF0IHdpbGwgYmUg
dGhlIG5hbWUsIGFsbCBtZWNoYW5pc21zIGZvciANCj4gaGF2aW5nIEJsdWVaIGFsdGVybmF0aXZl
cyB3aWxsIGJlIHJlbW92ZWQsIGFuZCBCbHVlWiA1IHdpbGwgYmUgdGhlIA0KPiBvbmx5IG9mZmlj
aWFsIHN1cHBvcnRlZCBCVCBzdGFjay4NCg0Kd2h5IHdvdWxkIHlvdSByZW1vdmUgbWVjaGFuaXNt
cyBmb3IgaGF2aW5nIEJsdWVaIGFsdGVybmF0aXZlcz8NCg0KU29tZSBwcm9qZWN0cyBhcmUgc3Rp
bGwgdXNpbmcgZGlmZmVyZW50IGJsdWV0b290aCBpbXBsZW1lbnRhdGlvbnMgYW5kIGhhdmluZyB0
aGUgcG9zc2liaWxpdHkgdG8gZGlzYWJsZS9yZXBsYWNlIGJsdWV6KiBpcyBzdGlsbCB1c2VmdWwu
DQoNCkNoZWVycywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVu
ZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgDQo+IFttYWlsdG86
b3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhh
bGYgT2YgDQo+IE90YXZpbyBTYWx2YWRvcg0KPiBTZW50OiBNb25kYXksIEFwcmlsIDYsIDIwMTUg
NDoxOCBQTQ0KPiBUbzogUGV0ZXIgQS4gQmlnb3QNCj4gQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Np
b25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BB
VENIIDUvNV0gYmx1ZXRvb3RoLmJiY2xhc3M6IHNldCBibHVlejUgYXMgDQo+IHRoZSBkZWZhdWx0
IEJUIHN0YWNrDQo+IA0KPiBPbiBNb24sIEFwciA2LCAyMDE1IGF0IDk6NTcgQU0sIFBldGVyIEEu
IEJpZ290IDxwYWJAcGFiaWdvdC5jb20+IHdyb3RlOg0KPiA+IE9uIDA0LzA2LzIwMTUgMDI6MzEg
QU0sIElvcmdhLCBDcmlzdGlhbiB3cm90ZToNCj4gPg0KPiA+IEkgdGhvdWdodCBvZiAxLjkgYXMg
dGhlIHByZXBhcmF0b3J5IHN0YWdlIGZvciBjb21wbGV0ZSByZW1vdmFsIG9mIA0KPiA+IGJsdWV6
NCwgc28gdGhhdCBpbiAyLjAgaXQgd291bGQgYmUgdmVyeSBlYXN5IHRvIHJlbW92ZSB0aGUgc3Vw
cG9ydCBmb3IgYmx1ZXo0Lg0KPiA+IENvbnRpbnVpbmcgdG8gaGF2ZSBibHVlejUgYWRkZWQgdG8g
RElTVFJPX0ZFQVRVUkVTIGNyZWF0ZSB0aGUgDQo+ID4gaW1wcmVzc2lvbiB0aGF0IEJsdWVaNSBp
cyBzdGlsbCBhIHNlY29uZCBjbGFzcyBjaXRpemVuIGNvbXBhcmVkIHRvIA0KPiA+IEJsdWVaNCwg
YW5kIGl0IGlzIG5vdCBteSBpbnRlbnRpb24gdG8gc3VzdGFpbiB0aGlzIG9waW5pb24gdmlhIGNv
ZGUuDQo+ID4NCj4gPiBJIGhlcmVieSBzdGFuZHVwIGZvciBteSBzb2x1dGlvbi4gQXQgdGhlIG1v
bWVudCwgd2UgYXJlIDF0bzEuIOKAnFdlIA0KPiA+IHRoaW5r4oCdIOKAkyBXaG8gYXJlIHRoZSBv
dGhlcnMgcGVyc29ucywgUm9zcz8NCj4gPg0KPiA+IC9DcmlzdGlhbg0KPiA+DQo+ID4NCj4gPiBX
aGlsZSBJIGZ1bGx5IHN1cHBvcnQgbW92aW5nIHRvIGJsdWV6NSBhbmQgdXNlIGl0IGluIGFsbCBt
eSBpbWFnZXMsIA0KPiA+IEkgZG8gdGhpbmsgaXQncyBhIGJpdCBhYnJ1cHQgdG8gbWFrZSBpdCB0
aGUgZGVmYXVsdCBpbiB0aGUgZmlyc3QgDQo+ID4gc3RhYmxlIHJlbGVhc2UgdGhhdCBwcm92aWRl
cyBhIHVzYWJsZSBibHVlejUuICBPbiB0aGUgb3RoZXIgaGFuZCwgDQo+ID4gWW9jdG8ncyBsYXRl
IHRvIHRoZQ0KPiA+IGJsdWV6NSBwYXJ0eSBhbmQgaXQncyBnb2luZyB0byBiZSBoYXJkZXIgdG8g
c3VwcG9ydCBibHVlejQgbm93Lg0KPiA+DQo+ID4gU2l4IG9mIG9uZTsgc2lnbiBtZSB1cCBhcyB3
ZWFrIHN1cHBvcnQgZm9yIGRlbGF5aW5nIHRoZSBtb3ZlIHRvIA0KPiA+IGRlZmF1bHQNCj4gPiBi
bHVlejUgdW50aWwgMS4xMC4NCj4gPg0KPiA+IEp1c3QgYW4gb3Bpbmlvbi4NCj4gDQo+IEkgcHJl
ZmVyIGJsdWV6NSBkZWZhdWx0IGluIDEuOSBhbmQgcmVtb3ZhbCBpbiAyLjAgKG9yIDEuMTApLiBX
ZSBzaG91bGRuJ3QgYmUgc3VwcG9ydCBsZWdhY3kgd2l0aG91dCBhIHZlcnkgc3Ryb25nIHJlYXNv
biBhbmQgaWYgYW55IG1lbWJlciBzaG93cyB1cCB0byBvZmZpY2lhbGx5IHN1cHBvcnQgYmx1ZXo0
IGZvciBsb25nZXIgd2UgbWF5IGRyb3AgaXRzIHJlbW92YWwgYnV0IGJsdWV6NSBkZWZhdWx0IHNo
b3VsZCBiZSBkb25lIGFzIHNvb24gYXMgcG9zc2libGUgc28gd2UgaXJvbiBvdXQgcmVncmVzc2lv
bnMuDQo+IA0KPiAtLSANCj4gT3RhdmlvIFNhbHZhZG9yICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBPLlMuIFN5c3RlbXMNCj4gaHR0cDovL3d3dy5vc3N5c3RlbXMuY29tLmJyICAgICAgICBo
dHRwOi8vY29kZS5vc3N5c3RlbXMuY29tLmJyDQo+IE1vYmlsZTogKzU1ICg1MykgOTk4MS03ODU0
ICAgICAgICAgICAgTW9iaWxlOiArMSAoMzQ3KSA5MDMtOTc1MA0KPiAtLQ0KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtY29y
ZSBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5l
bWJlZGRlZC1jb3JlDQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCg0KLS0gDQpNYXJ0
aW4gJ0phTWEnIEphbnNhICAgICBqYWJiZXI6IE1hcnRpbi5KYW5zYUBnbWFpbC5jb20NCg==

