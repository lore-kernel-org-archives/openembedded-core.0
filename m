Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RTiX0-00052A-7m
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 00:16:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Nov 2011 15:10:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="79751156"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 24 Nov 2011 15:10:02 -0800
Received: from pgsmsx103.gar.corp.intel.com (10.221.44.82) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 25 Nov 2011 07:10:01 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX103.gar.corp.intel.com (10.221.44.82) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 25 Nov 2011 07:10:01 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 25 Nov 2011 07:10:00 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 25 Nov 2011 07:09:59 +0800
Thread-Topic: [OE-core] [PATCH 2/4] gcc-package-target.inc: add the symbol
	link /lib/cpp
Thread-Index: AcyqxWIBdpUxQocgTwykrl2nBKzTIgAOKq9w
Message-ID: <1865303E0DED764181A9D882DEF65FB6E81DE44122@shsmsx502.ccr.corp.intel.com>
References: <cover.1322128489.git.dexuan.cui@intel.com>
	<d4724b4050931ff51499a8808287f04b0091e93e.1322128489.git.dexuan.cui@intel.com>
	<1322133692.24143.10.camel@ted>
	<1865303E0DED764181A9D882DEF65FB6E81DE4410E@shsmsx502.ccr.corp.intel.com>
	<1322151795.10928.4.camel@ted>
In-Reply-To: <1322151795.10928.4.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] gcc-package-target.inc: add the symbol link /lib/cpp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Nov 2011 23:16:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmljaGFyZCBQdXJkaWUgd3JvdGUgb24gMjAxMS0xMS0yNToNCj4gT24gVGh1LCAyMDExLTExLTI0
IGF0IDIzOjM3ICswODAwLCBDdWksIERleHVhbiB3cm90ZToNCj4+IFJpY2hhcmQgUHVyZGllIHdy
b3RlIG9uIDIwMTEtMTEtMjQ6DQo+Pj4gT24gVGh1LCAyMDExLTExLTI0IGF0IDE4OjA4ICswODAw
LCBEZXh1YW4gQ3VpIHdyb3RlOg0KPj4+PiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Nj
L2djYy1wYWNrYWdlLXRhcmdldC5pbmMNCj4+Pj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2djYy9nY2MtcGFja2FnZS10YXJnZXQuaW5jDQo+Pj4+IEBAIC0xMjIsNiArMTIyLDggQEAgZG9f
aW5zdGFsbCAoKSB7DQo+Pj4+ICAJbG4gLXNmICR7VEFSR0VUX1BSRUZJWH1nKysgZysrDQo+Pj4+
ICAJbG4gLXNmICR7VEFSR0VUX1BSRUZJWH1nY2MgZ2NjDQo+Pj4+ICAJbG4gLXNmICR7VEFSR0VU
X1BSRUZJWH1jcHAgY3BwDQo+Pj4+ICsJaW5zdGFsbCAtZCAke0R9JHtiYXNlX2xpYmRpcn0NCj4+
Pj4gKwlsbiAtc2YgJHtiaW5kaXJ9LyR7VEFSR0VUX1BSRUZJWH1jcHAgJHtEfSR7YmFzZV9saWJk
aXJ9L2NwcA0KPj4+PiAgCWxuIC1zZiBnKysgYysrDQo+Pj4+ICAJbG4gLXNmIGdjYyBjYw0KPj4+
IA0KPj4+IFdoeSBkbyB3ZSBuZWVkIHRoaXMgY2hhbmdlPw0KPj4gV2hlbiBJIHdhcyB0cnlpbmcg
c2VsZi1ob3N0ZWQtaW1hZ2UsIGVnbGliYydzIGRvX2luc3RhbGwgZmFpbGVkIGluIHRoZQ0KPj4g
dGFyZ2V0OiBFUlJPUjogY2Fubm90IHN0YXQgYm9vdHBhcmFtX3Byb3QuaDogdGhlIGNhdXNlIGlz
OiBycGNnZW4NCj4+IGRvZXNuJ3Qgd29yayBwcm9wZXJseTogcnBjZ2VuIGNhbid0IGV4ZWMgL2xp
Yi9jcHAgc2luY2UgaXQgZG9lc24ndA0KPj4gZXhpc3QuDQo+PiANCj4+IEFjY29yZGluZyB0bw0K
Pj4gaHR0cDovL3RsZHAub3JnL0xEUC9MaW51eC1GaWxlc3lzdGVtLUhpZXJhcmNoeS9odG1sL2xp
Yi5odG1sLA0KPiAiaWYgYSBDIHByZXByb2Nlc3NvciBpcyBpbnN0YWxsZWQsIC9saWIvY3BwIG11
c3QgYmUgYSByZWZlcmVuY2UgdG8gaXQsDQo+IGZvciBoaXN0b3JpY2FsIHJlYXNvbnMuIFRoZSB1
c3VhbCBwbGFjZW1lbnQgb2YgdGhpcyBiaW5hcnkgaXMgL3Vzci9iaW4vY3BwIi4NCj4+IA0KPj4g
VHlwaWNhbCBkaXN0cm9zLCBsaWtlIFVidW50dSwgb3BlblN1U0UsIEZlZG9yYSwgUkhFTCwgYWxs
IGNvbXBseSB3aXRoDQo+PiB0aGUgcnVsZS4NCj4+IA0KPj4gQWN0dWFsbHkgaW4gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2djYy9nY2MtcGFja2FnZS10YXJnZXQuaW5jLCB3ZSBkbw0KPj4gdHJ5IHRv
DQo+IHBhY2thZ2UgJHtiYXNlX2xpYmRpcn0vY3BwOg0KPj4gIEZJTEVTX2NwcCA9ICJcDQo+PiAg
ICR7YmluZGlyfS8ke1RBUkdFVF9QUkVGSVh9Y3BwIFwNCj4+ICAgJHtiYXNlX2xpYmRpcn0vY3Bw
IFwNCj4+ICAgJHtsaWJleGVjZGlyfS9nY2MvJHtUQVJHRVRfU1lTfS8ke0JJTlZ9L2NjMSINCj4+
IEJ1dCB1bmx1Y2tpbHkgd2UgZGlkbid0IHRvIGNyZWF0ZSBhIHN5bWJvbCBsaW5rIGluIGRvX2lu
c3RhbGwuIFRoaXMNCj4+IHBhdGNoDQo+IGFkZHMgdGhlIHN5bWJvbCBsaW5rLg0KPiANCj4gT2ss
IHRoaXMgc291bmRzIGdyZWF0LiBQdXQgdGhpcyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhvdWdo
IHBsZWFzZSENCkhpIFJQLA0KUGxlYXNlIHVzZSB0aGUgbmV3IGNvbW1pdCh0aGUgb25seSBjaGFu
Z2UgaXMgdGhlIHVwZGF0ZWQgY29tbWl0IG1lc3NhZ2UpOg0KaHR0cDovL2dpdC55b2N0b3Byb2pl
Y3Qub3JnL2NnaXQvY2dpdC5jZ2kvcG9reS1jb250cmliL2NvbW1pdC8/aD1kY3VpL3NlbGYtaG9z
dGVkLXYyJmlkPWY2MDAxZjBiMTJjYjU2MWY1ZTA4ZDNhNWIwZDYxYWI1ZmE5MjRmNDANCg0KVGhh
bmtzLA0KLS0gRGV4dWFuDQoNCg==


