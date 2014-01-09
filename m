Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BAA2E61587
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 12:19:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2014 04:19:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,630,1384329600"; d="scan'208";a="456041103"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jan 2014 04:19:19 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.215]) by
	IRSMSX101.ger.corp.intel.com ([163.33.3.153]) with mapi id
	14.03.0123.003; Thu, 9 Jan 2014 12:19:18 +0000
From: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
To: "sipke.vriend@xilinx.com" <sipke.vriend@xilinx.com>
Thread-Topic: [OE-core] [RFC OE-core/meta/lib] BSP Specific Qemurunner
Thread-Index: Ac8LTyM0cuP22wbdSB+YsK2jQLLpIwABYWywABcCpIAAEtgagAAdzuKAAAFklgAAFUicgAAZyYOA
Date: Thu, 9 Jan 2014 12:19:18 +0000
Message-ID: <1389270021.29779.29.camel@firebird.rb.intel.com>
References: <9bd39deb-0a32-437a-9f50-89abfe43d7d6@CO1EHSMHS004.ehs.local>
	<00beaba3-2d15-4d36-936c-88fd8734ed8a@CO1EHSMHS012.ehs.local>
	<1389186761.6899.99.camel@ted> <3240985.EsWr8javTQ@helios>
	<9217bc49-4fb4-4640-a7ae-1babd6cf17a8@DB8EHSMHS004.ehs.local>
In-Reply-To: <9217bc49-4fb4-4640-a7ae-1babd6cf17a8@DB8EHSMHS004.ehs.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.105.156]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC OE-core/meta/lib] BSP Specific Qemurunner
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
X-List-Received-Date: Thu, 09 Jan 2014 12:19:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7ABFE406578D142B50D9B7E0D191B9E@intel.com>
Content-Transfer-Encoding: base64

DQoNCg0KT24gVGh1LCAyMDE0LTAxLTA5IGF0IDAwOjAxICswMDAwLCBTaXBrZSBWcmllbmQgd3Jv
dGU6DQo+IE9uIFdlZG5lc2RheSwgOCBKYW51YXJ5IDIwMTQgMTE6NTMgUE0gUGF1bCBFZ2dsZXRv
biB3cm90ZToNCj4gPg0KPiA+T24gV2VkbmVzZGF5IDA4IEphbnVhcnkgMjAxNCAxMzoxMjo0MSBS
aWNoYXJkIFB1cmRpZSB3cm90ZToNCj4gPj4gT24gVHVlLCAyMDE0LTAxLTA3IGF0IDIyOjU5ICsw
MDAwLCBTaXBrZSBWcmllbmQgd3JvdGU6DQo+ID4+ID4gSGkgUmljaGFyZCwNCj4gPj4gPiANCj4g
Pj4gPiA+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gPiA+T24gV2VkbmVzZGF5LCA4
IEphbnVhcnkgMjAxNCAxMjowMCBBTSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+ID4+ID4gPg0K
PiA+PiA+ID5PbiBUdWUsIDIwMTQtMDEtMDcgYXQgMDM6MDkgKzAwMDAsIFNpcGtlIFZyaWVuZCB3
cm90ZToNCj4gPj4gPiA+PiBIaSwNCj4gPj4gPiA+PiANCj4gPj4gPiA+PiBUaGlzIFJGQyBpcyBh
IHByb3Bvc2FsIHRvIGFsbG93IEJTUCBsYXllcnMgdG8gc2V0dXAgcWVtdSB3aXRoIHRoZWlyDQo+
ID4+ID4gPj4gc3BlY2lmaWMgcmVxdWlyZW1lbnRzIGZvciB0aGUgdGVzdGltYWdlIG9lLWNvcmUg
ZnVuY3Rpb25hbGl0eS4NCj4gPj4gPiA+PiBUaGUgc3VnZ2VzdGVkIGNoYW5nZXMgd2lsbCBiZSBl
eGVyY2lzZWQgYnkgdGhlDQo+ID4+ID4gPj4gYml0YmFrZSAtYyB0ZXN0aW1hZ2UgPGltYWdlPg0K
PiA+PiA+ID4+IGNvbW1hbmQuDQo+ID4+ID4gPj4gU2ltaWxhcmx5IHRvIHRoZSBvZXFhIHRlc3Qg
Y2FzZXMgdGhpcyBwcm9wb3NhbCBleHRlbmRzIHRoZQ0KPiA+PiA+ID4+IG1ldGEvbGliL29lcWEN
Cj4gPj4gPiA+PiBweXRob24gbW9kdWxlcyB0byBhbGxvdyBpbmNsdXNpb24gb2YgcHl0aG9uIHV0
aWxpdHkgc2NyaXB0cyBpbiB0aGUgQlNQDQo+ID4+ID4gPj4gbGF5ZXJzLg0KPiA+PiA+ID4+IEFu
eSBCU1AgbGF5ZXIgd2lzaGluZyB0byBzdXBwbHkgdGhlaXIgb3duIHFlbXUgc2V0dXAgd291bGQg
bmVlZCB0bw0KPiA+PiA+ID4+IGNyZWF0ZQ0KPiA+PiA+ID4+IGFuIGFwcHJvcHJpYXRlIG1ldGEt
YnNwbGF5ZXIvbGliL29lcWEvdXRpbHMvPG1hY2hpbmU+c3RhcnRlci5weQ0KPiA+PiA+ID4+IFRo
ZSBlZmZlY3QgaXMgdGhhdCB0aGUgbGliL29lcWEvdXRpbHMvcWVtdXJ1bm5lciB3aWxsIGVpdGhl
ciBhbGxvdyB0aGUNCj4gPj4gPiA+PiBic3AgbGF5ZXIgcHJvdmlkZWQgPG1hY2hpbmU+c3RhcnRl
ciB0byBzcGF3biBxZW11IG9yIGlmIG5vdCBwcm92aWRlZCwNCj4gPj4gPiA+PiBzcGF3biBxZW11
IHZpYSBydW5xZW11IGFzIGN1cnJlbnRseS4NCj4gPj4gPiA+PiBBbiBleGFtcGxlIGJzcCBsYXll
ciBpcyBhdmFpbGFibGUgaGVyZToNCj4gPj4gPiA+PiBodHRwczovL2dpdGh1Yi5jb20vc2lwa2Uv
bWV0YS14aWxpbngvdHJlZS9zaXBrZS9xZW11cnVubmVyDQo+ID4+ID4gPj4gd2l0aCBhbGwgcmVx
dWlyZWQgYWRkaXRpb25zIGluIHRoZSBtZXRhLXhpbGlueC9saWIgZGlyZWN0b3J5Lg0KPiA+PiA+
ID4+IA0KPiA+PiA+ID4+IFRoaXMgUkZDIGlzIHRyaWdnZXJlZCBieSBhbmQgaW5kaXJlY3RseSBy
ZWxhdGVkIHRvDQo+ID4+ID4gPj4gQnVnemlsbGEgcmVwb3J0ICJydW5xZW11IHNob3VsZG4ndCBo
YXJkLWNvZGUgbWFjaGluZSBrbm93bGVkZ2UiDQo+ID4+ID4gPj4gaHR0cHM6Ly9idWd6aWxsYS55
b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD00ODI3DQo+ID4+ID4gPg0KPiA+PiA+ID5X
aHkgd291bGQgd2UgZG8gdGhpcyByYXRoZXIgdGhhbiBpbXByb3ZlIHJ1bnFlbXUgdG8gYmUgZXh0
ZW5kYWJsZSBmcm9tDQo+ID4+ID4gPkJTUCBsYXllcnM/DQo+ID4+ID4gDQo+ID4+ID4gUHJvcG9z
aW5nIGFzIGFuIGFkZGl0aW9uYWwgd2F5IHRvIGxhdW5jaCBxZW11IGZvciBvZXFhIHRlc3RpbWFn
ZQ0KPiA+PiA+IGZ1bmN0aW9uYWxpdHksIEltcHJvdmluZyBydW5xZW11IGNhbiBhbmQgcHJvYmFi
bHkgc2hvdWxkIHN0aWxsIGhhcHBlbi4NCj4gPj4gPiANCj4gPj4gPiBUbyBjb25zaWRlcjoNCj4g
Pj4gPiAqIGl0IGtlZXBzIHRlc3RpbWFnZSBmdW5jdGlvbmFsaXR5IChmb3IgYnNwIGxheWVycyBz
cGVjaWZpYyB0aGluZ3MpIGluDQo+ID4+ID4gdGhlIGxpYiBkaXJlY3RseSAoc2ltaWxhciB0byB0
ZXN0IGNhc2VzKSBhbmQgYXMgcHl0aG9uLg0KPiA+PiA+ICogdGVzdGluZyAodmlhIHRlc3RpbWFn
ZSkgbWF5IGhhdmUgYSBkaWZmZXJlbnQgcmVxdWlyZW1lbnQgdG8gdGhhdCBvZg0KPiA+PiA+IHJ1
bm5pbmcgcnVucWVtdSBvbiB0aGUgY29tbWFuZCBsaW5lLCBzbyBhbiBhbHRlcm5hdGUgd2F5IHRv
IGxhdW5jaCBxZW11DQo+ID4+ID4gY291bGQgYmUgdXNlZnVsLg0KPiA+PiA+ICogc2hvdWxkIHRo
aXMgYXBwcm9hY2ggb2YgZXh0ZW5kaW5nIHRoZSBvZXFhIHRlc3RpbWFnZSBmdW5jdGlvbmFsaXR5
DQo+ID4+ID4gaW50byBic3AgbGF5ZXJzIGJlIGFjY2VwdGVkLCB0aGlzIGNvdWxkIGFsbG93IGFs
c28gZm9yIGJzcCBzcGVjaWZpYw0KPiA+PiA+IGhhcmR3YXJlIHNldHVwIGZvciB0ZXN0aW1hZ2Ug
ZnVuY3Rpb25hbGl0eSBpbiBic3AgbGF5ZXJzLg0KPiA+PiA+IA0KPiA+PiA+IFByaW1hcnkgYWlt
IGlzIGEgc29sdXRpb24gd2hpY2ggYWxsb3dzIHRoZSBic3AgbGF5ZXIgdG8gY29udHJvbCB0aGUN
Cj4gPj4gPiBzZXR1cCBvZiBxZW11IChhbmQgZXZlbnR1YWxseSBoYXJkd2FyZSkgZm9yIHRlc3Rp
bWFnZSBmdW5jdGlvbmFsaXR5LiBUaGlzDQo+ID4+ID4gaXMgYSBwcm9wb3NhbCB0b3dhcmRzIHRo
YXQgZ29hbC4NCj4gPj4gDQo+ID4+IEkgdGhvdWdodCBTdGVmYW4gd2FzIGFscmVhZHkgYWxzbyB3
b3JraW5nIG9uIHNvbWV0aGluZyB0b3dhcmRzIHRoaXMNCj4gPj4gZ29hbC4gSSdkIGxpa2UgdG8g
ZW5zdXJlIHdlIGRvbid0IGVuZCB1cCB3aXRoIHR3byB0aGluZ3MgZG9pbmcgdGhlIHNhbWUNCj4g
Pj4gdGhpbmcuDQo+ID4+IA0KPiA+PiBTdGVmYW4/DQo+ID4+IA0KPiANCj4gQWdyZWVkLiBPbmUg
c29sdXRpb24gaXMgZGVzaXJlZC4gSGFwcHkgdG8gY29vcmRpbmF0ZSB3aXRoIGFuZCBhc3Npc3Qg
U3RlZmFuLA0KPiBlaXRoZXIgaW1wbGVtZW50aW5nIHBhcnQgb2YgYSBzb2x1dGlvbiAocHJvcG9z
ZWQgb25lIG9yIGFub3RoZXIpIGFuZC9vciANCj4gdGVzdGluZyB3aGF0ZXZlciBTdGVmYW4gY29t
ZXMgdXAgd2l0aCBhZ2FpbnN0IG91ciBic3AgbGF5ZXIuDQoNCkknbSBzb3JyeSBmb3IgcmVwbHlp
bmcgc28gbGF0ZSwgdGhpcyBoYXMgYmVlbiBhIHNsb3cgd2Vlay4gSSdtIGEgYml0DQpjb25mdXNl
ZCBiZWNhdXNlIGxhc3QgdGltZSBJIGNoZWNrZWQgSSB3YXNuJ3Qgd29ya2luZyBvbiBzb21ldGhp
bmcNCnNpbWlsYXIgOikgKGxheWVyLWNvbnRyb2xsZWQgcWVtdS9ic3Agc2V0dXApLCBidXQgSSdt
IGhhcHB5IHRvIGhlbHAuDQoNCkkndmUgbG9va2VkIGF0IHRoZSBwYXRjaGVzIHRoZW1zZWx2ZXMs
IGFuZCB0aGV5IGFyZSBva2F5LCBidXQgSSdtIG5vdA0Kc3VyZSBhIGxheWVyLXNwZWNpZmljIHFl
bXUgc2V0dXAgZm9yIHRlc3RpbWFnZSBpcyB3aGF0IHdlIHNob3VsZCBkbyBpbg0KdGhlIGxvbmcg
dGVybS4gTm93LCBJIGNhbiBzZWUgdGhlIHByb2JsZW0geW91IGFyZSB0cnlpbmcgdG8gZml4IGhl
cmUgYW5kDQp3aHkgeW91IG5lZWQgdGhpcy4uLiBJIGFsd2F5cyBhc3N1bWVkIHRoYXQgYSBCU1Ag
bGF5ZXIgaXMgbW9zdGx5IGFib3V0DQpyZWFsIGh3IGFuZCB0aGF0IHJ1bnFlbXUgd2lsbCBkZWFs
IHdpdGggYW55IHFlbXUgbWFjaGluZS4gU28sIGFzIFJpY2hhcmQNCnNhaWQsIHdlIHNob3VsZCBw
cm9iYWJseSBmaXggcnVucWVtdS4NCg0KTm93LCBJIHJlYWxseSBsaWtlIHRoZSBpZGVhIG9mIGEg
bGF5ZXItY29udHJvbGxlZC9leHRlbmRhYmxlIHRhcmdldA0Kc2V0dXAgKGJlIGl0IHFlbXUgb3Ig
aGFyZHdhcmUpIGFuZCBJIHRoaW5rIHdlIHNob3VsZCBhbGxvdyBhIGxheWVyIHRvDQpleHRlbmQg
bGliL29lcWEvdGFyZ2V0Y29udHJvbC5weSBhbmQgcHJvdmlkZSAob3IgZXh0ZW5kKSBpdHMgb3du
DQpURVNUX1RBUkdFVCAoYmVzaWRlcyBxZW11IGFuZCBzaW1wbGVyZW1vdGUpLiBUaGF0IHdpbGwg
cHJvdmUgbW9yZSB1c2VmdWwNCmZvciBodyBzdHVmZiBhbmQgaXQgd2lsbCBhbGxvdyBhIGxheWVy
IHRvIGNvbXBsZXRlbHkgY29udHJvbCBkZXBsb3ltZW50DQpvZiBhIHFlbXUgdGFyZ2V0IHRvbyAo
ZGVwbG95LCBzdGFydCwgc3RvcCwgcnVubmluZyBjb21tYW5kcywgZXRjKS4gRS5nOg0KcGVyaGFw
cyBhIGxheWVyIGRvZXNuJ3QgbGlrZSB0aGUgdXNlIG9mIHRoZSBleHQzIGltYWdlcyBmb3IgcWVt
dSBhbmQNCm5lZWRzIHRvIHVzZSBzb21ldGhpbmcgZWxzZS4gVGhvdWdodHM/DQoNCkNoZWVycywN
ClN0ZWZhbg0KDQoNCg0KDQoNCg0KDQoNCg==

