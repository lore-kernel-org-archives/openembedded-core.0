Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RZ5y4-0006OP-Nn
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:18:50 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2011 11:11:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94468939"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2011 11:11:50 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi; Fri, 9 Dec 2011
	11:11:50 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 9 Dec 2011 11:11:49 -0800
Thread-Topic: [OE-core] [CONSOLIDATED PULL 06/15] pulseaudio: fix
	compilation with x32 toolchain
Thread-Index: Acy2ouDs74fBkNPVQ2KTm2gq9Mv8BwAA1Otw
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E3FA863A@orsmsx504.amr.corp.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
	<2f2356128ec56b43a886c8004ad5c8aafb433153.1323454935.git.sgw@linux.intel.com>
	<1323456388.25802.8.camel@mattotaupa>
In-Reply-To: <1323456388.25802.8.camel@mattotaupa>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 06/15] pulseaudio: fix compilation with x32 toolchain
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
X-List-Received-Date: Fri, 09 Dec 2011 19:18:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGF1bCBNZW56ZWwgW21h
aWx0bzpwYXVsZXBhbnRlckB1c2Vycy5zb3VyY2Vmb3JnZS5uZXRdDQo+IFNlbnQ6IEZyaWRheSwg
RGVjZW1iZXIgMDksIDIwMTEgMTA6NDYgQU0NCj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IEthbWJsZSwgTml0aW4gQQ0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtDT05TT0xJREFURUQgUFVMTCAwNi8xNV0gcHVsc2VhdWRpbzogZml4DQo+IGNv
bXBpbGF0aW9uIHdpdGggeDMyIHRvb2xjaGFpbg0KPiANCj4gRGVhciBOaXRpbiwNCj4gDQo+IA0K
PiBBbSBGcmVpdGFnLCBkZW4gMDkuMTIuMjAxMSwgMTA6MjMgLTA4MDAgc2NocmllYiBTYXVsIFdv
bGQ6DQo+ID4gRnJvbTogTml0aW4gQSBLYW1ibGUgPG5pdGluLmEua2FtYmxlQGludGVsLmNvbT4N
Cj4gPg0KPiA+IFRoaXMgY29tbWl0IG1ha2VzIGFzc2VtYmx5IHN5bnRheCBjb21wYXRpYmxlIHdp
dGggeDMyIHRvb2xjaGFpbiB0bw0KPiA+IGF2b2lkIHgzMiBnY2MgZXJyb3JzLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogTml0aW4gQSBLYW1ibGUgPG5pdGluLmEua2FtYmxlQGludGVsLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgLi4uL3B1bHNlYXVkaW8vcHVsc2VhdWRvX2ZpeF9mb3JfeDMyLnBhdGNo
ICAgICAgICAgfCAgMjI1DQo+ICsrKysrKysrKysrKysrKysrKysrDQo+ID4gIC4uLi9wdWxzZWF1
ZGlvL3B1bHNlYXVkaW9fMS4xLmJiICAgICAgICAgICAgICAgICAgIHwgICAgMyArLQ0KPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDIyNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9ucygtKSAgY3JlYXRl
IG1vZGUNCj4gPiAxMDA2NDQNCj4gPiBtZXRhL3JlY2lwZXMtDQo+IG11bHRpbWVkaWEvcHVsc2Vh
dWRpby9wdWxzZWF1ZGlvL3B1bHNlYXVkb19maXhfZm9yX3gzMi5wYQ0KPiA+IHRjaA0KPiA+DQo+
ID4gZGlmZiAtLWdpdA0KPiA+IGEvbWV0YS9yZWNpcGVzLQ0KPiBtdWx0aW1lZGlhL3B1bHNlYXVk
aW8vcHVsc2VhdWRpby9wdWxzZWF1ZG9fZml4X2Zvcl94MzIuDQo+ID4gcGF0Y2gNCj4gPiBiL21l
dGEvcmVjaXBlcy0NCj4gbXVsdGltZWRpYS9wdWxzZWF1ZGlvL3B1bHNlYXVkaW8vcHVsc2VhdWRv
X2ZpeF9mb3JfeDMyLg0KPiA+IHBhdGNoDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBp
bmRleCAwMDAwMDAwLi4yMmZlMmU3DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL21ldGEv
cmVjaXBlcy0NCj4gbXVsdGltZWRpYS9wdWxzZWF1ZGlvL3B1bHNlYXVkaW8vcHVsc2VhdWRvX2Zp
eF9mb3JfDQo+ID4gKysrIHgzMi5wYXRjaA0KPiA+IEBAIC0wLDAgKzEsMjI1IEBADQo+ID4gK1Vw
c3RyZWFtU3RhdHVzOiBQZW5kaW5nDQo+ID4gKw0KPiA+ICtUaGlzIHBhdGNoIG1ha2VzIGFzc2Vt
Ymx5IHN5bnRheCBjb21wYXRpYmxlIHRvIHRoZSB4MzIgdG9vbGNoYWluLg0KPiA+ICsNCj4gPiAr
VGhpcyBmaXhlcyBjb21waWxhdGlvbnMgZXJyb3JzIHdpdGggeDMyIGdjYy4NCj4gDQo+IEkgd291
bGQgdm9sdW50ZWVyIHRvIHNlbmQgdGhpcyBwYXRjaCB1cHN0cmVhbS4gQSBtb3JlIGVsYWJvcmF0
ZSBjb21taXQNCj4gbWVzc2FnZSBhbHNvIHN1aXRlZCBmb3Igbm9uLU9FIHVzZXJzIHdvdWxkIGJl
IGhlbHBmdWwuIFRoYXQgbWVhbnMgd2hhdA0KPiBkb2VzIHRoZSB4MzIgdG9vbCBjaGFpbiBkbyBh
bmQgYSBwYXN0ZSBvZiB0aGUgZXJyb3JzIHlvdSBnb3QuDQoNClRoYW5rIHlvdSBmb3Igdm9sdW50
ZWVyaW5nIGZvciBwdXNoaW5nIGl0IHVwc3RyZWFtLg0KDQo+IA0KPiA+ICtTaWduZWQtT2ZmLUJ5
OiBOaXRpbiBBIEthbWJsZSA8bml0aW4uYS5rYW1ibGVAaW50ZWwuY29tPiAyMDExLzEyLzAzDQo+
ID4gK0luZGV4OiBwdWxzZWF1ZGlvLTEuMS9zcmMvcHVsc2Vjb3JlL3N2b2x1bWVfbW14LmMNCj4g
DQo+IFvigKZdDQo+IA0KPiBQbGVhc2Ugb25seSBtZXJnZSB0aGlzLCB3aGVuIHRoaXMgaGFzIGJl
ZW4gaW1wcm92ZWQuDQoNCg0KSW1wcm92ZWQgY29tbWl0IGhhcyBiZWVuIHB1c2hlZCB0byB0aGUg
bml0aW4veDMyIGNvbnRyaWIgYnJhbmNoLg0KDQpOaXRpbg0KDQo+IA0KPiANCj4gVGhhbmtzLA0K
PiANCj4gUGF1bA0K


