Return-Path: <sipke.vriend@xilinx.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe002.messaging.microsoft.com [216.32.181.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2B06028A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 23:30:10 +0000 (UTC)
Received: from mail211-ch1-R.bigfish.com (10.43.68.245) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.22; Thu, 9 Jan 2014 23:30:10 +0000
Received: from mail211-ch1 (localhost [127.0.0.1])	by
	mail211-ch1-R.bigfish.com (Postfix) with ESMTP id 4A7CF2A01D0;
	Thu,  9 Jan 2014 23:30:10 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:62.221.5.235; KIP:(null); UIP:(null); IPV:NLI;
	H:xir-gw1; RD:unknown-62-221-5-235.ipspace.xilinx.com; EFVD:NLI
X-SpamScore: -5
X-BigFish: VPS-5(zzdb82h98dI9371I936eI542I1432Izz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzz8275bh8275dh1de097h186068hz2fh95h109h839h93fhd24hf0ah119dh1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh162dh1631h1758h18e1h1946h19b5h1b0ah1be0h224fh1d0ch1d2eh1d3fh1dfeh1dffh1fe8h1ff5h2216h2336h2438h1155h)
Received-SPF: pass (mail211-ch1: domain of xilinx.com designates 62.221.5.235
	as permitted sender) client-ip=62.221.5.235;
	envelope-from=sipke.vriend@xilinx.com; helo=xir-gw1 ;
	helo=xir-gw1 ; 
Received: from mail211-ch1 (localhost.localdomain [127.0.0.1]) by mail211-ch1
	(MessageSwitch) id 1389310208115246_12429;
	Thu,  9 Jan 2014 23:30:08 +0000 (UTC)
Received: from CH1EHSMHS005.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.229])	by mail211-ch1.bigfish.com (Postfix) with ESMTP id
	3DA0A4A006C;	Thu,  9 Jan 2014 23:29:56 +0000 (UTC)
Received: from xir-gw1 (62.221.5.235) by CH1EHSMHS005.bigfish.com (10.43.70.5)
	with Microsoft SMTP Server id 14.16.227.3;
	Thu, 9 Jan 2014 23:29:50 +0000
Received: from [172.21.6.17] (port=56014 helo=xir-smtp1)	by xir-gw1 with esmtp
	(Exim 4.63)	(envelope-from <sipke.vriend@xilinx.com>)	id
	1W1P2s-0001bT-A7; Thu, 09 Jan 2014 23:29:50 +0000
From: Sipke Vriend <sipke.vriend@xilinx.com>
To: "Stanacar, StefanX" <stefanx.stanacar@intel.com>
Thread-Topic: [OE-core] [RFC OE-core/meta/lib] BSP Specific Qemurunner
Thread-Index: Ac8LTyM0cuP22wbdSB+YsK2jQLLpIwABYWywACfGLYAAASlFIAAvfbeAAAFklgAABH0cUAAqi6AAAAaJaoA=
Date: Thu, 9 Jan 2014 23:29:46 +0000
References: <9bd39deb-0a32-437a-9f50-89abfe43d7d6@CO1EHSMHS004.ehs.local>
	<00beaba3-2d15-4d36-936c-88fd8734ed8a@CO1EHSMHS012.ehs.local>
	<1389186761.6899.99.camel@ted> <3240985.EsWr8javTQ@helios>
	<9217bc49-4fb4-4640-a7ae-1babd6cf17a8@DB8EHSMHS004.ehs.local>
	<1389270021.29779.29.camel@firebird.rb.intel.com>
In-Reply-To: <1389270021.29779.29.camel@firebird.rb.intel.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.27]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
X-RCIS-Action: ALLOW
Message-ID: <71abf22b-4059-42e3-9331-62462d0ff719@CH1EHSMHS005.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
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
X-List-Received-Date: Thu, 09 Jan 2014 23:30:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgU3RlZmFuLA0KDQpPbiBUaHVyc2RheSwgOSBKYW51YXJ5IDIwMTQgMTA6MTkgUE0sIFN0YW5h
Y2FyLCBTdGVmYW5YIHdyb3RlOg0KPk9uIFRodSwgMjAxNC0wMS0wOSBhdCAwMDowMSArMDAwMCwg
U2lwa2UgVnJpZW5kIHdyb3RlOg0KPj4gT24gV2VkbmVzZGF5LCA4IEphbnVhcnkgMjAxNCAxMTo1
MyBQTSBQYXVsIEVnZ2xldG9uIHdyb3RlOg0KPj4gPg0KPj4gPk9uIFdlZG5lc2RheSAwOCBKYW51
YXJ5IDIwMTQgMTM6MTI6NDEgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+PiA+PiBPbiBUdWUsIDIw
MTQtMDEtMDcgYXQgMjI6NTkgKzAwMDAsIFNpcGtlIFZyaWVuZCB3cm90ZToNCj4+ID4+ID4gSGkg
UmljaGFyZCwNCj4+ID4+ID4gDQo+PiA+PiA+ID4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
Pj4gPj4gPiA+T24gV2VkbmVzZGF5LCA4IEphbnVhcnkgMjAxNCAxMjowMCBBTSwgUmljaGFyZCBQ
dXJkaWUgd3JvdGU6DQo+PiA+PiA+ID4NCj4+ID4+ID4gPk9uIFR1ZSwgMjAxNC0wMS0wNyBhdCAw
MzowOSArMDAwMCwgU2lwa2UgVnJpZW5kIHdyb3RlOg0KPj4gPj4gPiA+PiBIaSwNCj4+ID4+ID4g
Pj4gDQo+PiA+PiA+ID4+IFRoaXMgUkZDIGlzIGEgcHJvcG9zYWwgdG8gYWxsb3cgQlNQIGxheWVy
cyB0byBzZXR1cCBxZW11IHdpdGggdGhlaXINCj4+ID4+ID4gPj4gc3BlY2lmaWMgcmVxdWlyZW1l
bnRzIGZvciB0aGUgdGVzdGltYWdlIG9lLWNvcmUgZnVuY3Rpb25hbGl0eS4NCj4+ID4+ID4gPj4g
VGhlIHN1Z2dlc3RlZCBjaGFuZ2VzIHdpbGwgYmUgZXhlcmNpc2VkIGJ5IHRoZQ0KPj4gPj4gPiA+
PiBiaXRiYWtlIC1jIHRlc3RpbWFnZSA8aW1hZ2U+DQo+PiA+PiA+ID4+IGNvbW1hbmQuDQo+PiA+
PiA+ID4+IFNpbWlsYXJseSB0byB0aGUgb2VxYSB0ZXN0IGNhc2VzIHRoaXMgcHJvcG9zYWwgZXh0
ZW5kcyB0aGUNCj4+ID4+ID4gPj4gbWV0YS9saWIvb2VxYQ0KPj4gPj4gPiA+PiBweXRob24gbW9k
dWxlcyB0byBhbGxvdyBpbmNsdXNpb24gb2YgcHl0aG9uIHV0aWxpdHkgc2NyaXB0cyBpbiB0aGUg
QlNQDQo+PiA+PiA+ID4+IGxheWVycy4NCj4+ID4+ID4gPj4gQW55IEJTUCBsYXllciB3aXNoaW5n
IHRvIHN1cHBseSB0aGVpciBvd24gcWVtdSBzZXR1cCB3b3VsZCBuZWVkIHRvDQo+PiA+PiA+ID4+
IGNyZWF0ZQ0KPj4gPj4gPiA+PiBhbiBhcHByb3ByaWF0ZSBtZXRhLWJzcGxheWVyL2xpYi9vZXFh
L3V0aWxzLzxtYWNoaW5lPnN0YXJ0ZXIucHkNCj4+ID4+ID4gPj4gVGhlIGVmZmVjdCBpcyB0aGF0
IHRoZSBsaWIvb2VxYS91dGlscy9xZW11cnVubmVyIHdpbGwgZWl0aGVyIGFsbG93IHRoZQ0KPj4g
Pj4gPiA+PiBic3AgbGF5ZXIgcHJvdmlkZWQgPG1hY2hpbmU+c3RhcnRlciB0byBzcGF3biBxZW11
IG9yIGlmIG5vdCBwcm92aWRlZCwNCj4+ID4+ID4gPj4gc3Bhd24gcWVtdSB2aWEgcnVucWVtdSBh
cyBjdXJyZW50bHkuDQo+PiA+PiA+ID4+IEFuIGV4YW1wbGUgYnNwIGxheWVyIGlzIGF2YWlsYWJs
ZSBoZXJlOg0KPj4gPj4gPiA+PiBodHRwczovL2dpdGh1Yi5jb20vc2lwa2UvbWV0YS14aWxpbngv
dHJlZS9zaXBrZS9xZW11cnVubmVyDQo+PiA+PiA+ID4+IHdpdGggYWxsIHJlcXVpcmVkIGFkZGl0
aW9ucyBpbiB0aGUgbWV0YS14aWxpbngvbGliIGRpcmVjdG9yeS4NCj4+ID4+ID4gPj4gDQo+PiA+
PiA+ID4+IFRoaXMgUkZDIGlzIHRyaWdnZXJlZCBieSBhbmQgaW5kaXJlY3RseSByZWxhdGVkIHRv
DQo+PiA+PiA+ID4+IEJ1Z3ppbGxhIHJlcG9ydCAicnVucWVtdSBzaG91bGRuJ3QgaGFyZC1jb2Rl
IG1hY2hpbmUga25vd2xlZGdlIg0KPj4gPj4gPiA+PiBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJv
amVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTQ4MjcNCj4+ID4+ID4gPg0KPj4gPj4gPiA+V2h5IHdv
dWxkIHdlIGRvIHRoaXMgcmF0aGVyIHRoYW4gaW1wcm92ZSBydW5xZW11IHRvIGJlIGV4dGVuZGFi
bGUgZnJvbQ0KPj4gPj4gPiA+QlNQIGxheWVycz8NCj4+ID4+ID4gDQo+PiA+PiA+IFByb3Bvc2lu
ZyBhcyBhbiBhZGRpdGlvbmFsIHdheSB0byBsYXVuY2ggcWVtdSBmb3Igb2VxYSB0ZXN0aW1hZ2UN
Cj4+ID4+ID4gZnVuY3Rpb25hbGl0eSwgSW1wcm92aW5nIHJ1bnFlbXUgY2FuIGFuZCBwcm9iYWJs
eSBzaG91bGQgc3RpbGwgaGFwcGVuLg0KPj4gPj4gPiANCj4+ID4+ID4gVG8gY29uc2lkZXI6DQo+
PiA+PiA+ICogaXQga2VlcHMgdGVzdGltYWdlIGZ1bmN0aW9uYWxpdHkgKGZvciBic3AgbGF5ZXJz
IHNwZWNpZmljIHRoaW5ncykgaW4NCj4+ID4+ID4gdGhlIGxpYiBkaXJlY3RseSAoc2ltaWxhciB0
byB0ZXN0IGNhc2VzKSBhbmQgYXMgcHl0aG9uLg0KPj4gPj4gPiAqIHRlc3RpbmcgKHZpYSB0ZXN0
aW1hZ2UpIG1heSBoYXZlIGEgZGlmZmVyZW50IHJlcXVpcmVtZW50IHRvIHRoYXQgb2YNCj4+ID4+
ID4gcnVubmluZyBydW5xZW11IG9uIHRoZSBjb21tYW5kIGxpbmUsIHNvIGFuIGFsdGVybmF0ZSB3
YXkgdG8gbGF1bmNoIHFlbXUNCj4+ID4+ID4gY291bGQgYmUgdXNlZnVsLg0KPj4gPj4gPiAqIHNo
b3VsZCB0aGlzIGFwcHJvYWNoIG9mIGV4dGVuZGluZyB0aGUgb2VxYSB0ZXN0aW1hZ2UgZnVuY3Rp
b25hbGl0eQ0KPj4gPj4gPiBpbnRvIGJzcCBsYXllcnMgYmUgYWNjZXB0ZWQsIHRoaXMgY291bGQg
YWxsb3cgYWxzbyBmb3IgYnNwIHNwZWNpZmljDQo+PiA+PiA+IGhhcmR3YXJlIHNldHVwIGZvciB0
ZXN0aW1hZ2UgZnVuY3Rpb25hbGl0eSBpbiBic3AgbGF5ZXJzLg0KPj4gPj4gPiANCj4+ID4+ID4g
UHJpbWFyeSBhaW0gaXMgYSBzb2x1dGlvbiB3aGljaCBhbGxvd3MgdGhlIGJzcCBsYXllciB0byBj
b250cm9sIHRoZQ0KPj4gPj4gPiBzZXR1cCBvZiBxZW11IChhbmQgZXZlbnR1YWxseSBoYXJkd2Fy
ZSkgZm9yIHRlc3RpbWFnZSBmdW5jdGlvbmFsaXR5LiBUaGlzDQo+PiA+PiA+IGlzIGEgcHJvcG9z
YWwgdG93YXJkcyB0aGF0IGdvYWwuDQo+PiA+PiANCj4+ID4+IEkgdGhvdWdodCBTdGVmYW4gd2Fz
IGFscmVhZHkgYWxzbyB3b3JraW5nIG9uIHNvbWV0aGluZyB0b3dhcmRzIHRoaXMNCj4+ID4+IGdv
YWwuIEknZCBsaWtlIHRvIGVuc3VyZSB3ZSBkb24ndCBlbmQgdXAgd2l0aCB0d28gdGhpbmdzIGRv
aW5nIHRoZSBzYW1lDQo+PiA+PiB0aGluZy4NCj4+ID4+IA0KPj4gPj4gU3RlZmFuPw0KPj4gPj4g
DQo+PiANCj4+IEFncmVlZC4gT25lIHNvbHV0aW9uIGlzIGRlc2lyZWQuIEhhcHB5IHRvIGNvb3Jk
aW5hdGUgd2l0aCBhbmQgYXNzaXN0IFN0ZWZhbiwNCj4+IGVpdGhlciBpbXBsZW1lbnRpbmcgcGFy
dCBvZiBhIHNvbHV0aW9uIChwcm9wb3NlZCBvbmUgb3IgYW5vdGhlcikgYW5kL29yIA0KPj4gdGVz
dGluZyB3aGF0ZXZlciBTdGVmYW4gY29tZXMgdXAgd2l0aCBhZ2FpbnN0IG91ciBic3AgbGF5ZXIu
DQo+DQo+SSdtIHNvcnJ5IGZvciByZXBseWluZyBzbyBsYXRlLCB0aGlzIGhhcyBiZWVuIGEgc2xv
dyB3ZWVrLiBJJ20gYSBiaXQNCj5jb25mdXNlZCBiZWNhdXNlIGxhc3QgdGltZSBJIGNoZWNrZWQg
SSB3YXNuJ3Qgd29ya2luZyBvbiBzb21ldGhpbmcNCj5zaW1pbGFyIDopIChsYXllci1jb250cm9s
bGVkIHFlbXUvYnNwIHNldHVwKSwgYnV0IEknbSBoYXBweSB0byBoZWxwLg0KPg0KDQpObyB3b3Jy
aWVzLCB5b3UncmUgbm90IGxhdGUgYW5kIHNvcnJ5IGZvciBoYXZpbmcgaW5hZHZlcnRlbnRseSBk
cmFnZ2VkIA0KeW91IGluIGl0IHNlZW1zIDopDQoNCj5JJ3ZlIGxvb2tlZCBhdCB0aGUgcGF0Y2hl
cyB0aGVtc2VsdmVzLCBhbmQgdGhleSBhcmUgb2theSwgYnV0IEknbSBub3QNCj5zdXJlIGEgbGF5
ZXItc3BlY2lmaWMgcWVtdSBzZXR1cCBmb3IgdGVzdGltYWdlIGlzIHdoYXQgd2Ugc2hvdWxkIGRv
IGluDQo+dGhlIGxvbmcgdGVybS4gDQo+Tm93LCBJIGNhbiBzZWUgdGhlIHByb2JsZW0geW91IGFy
ZSB0cnlpbmcgdG8gZml4IGhlcmUgYW5kDQo+d2h5IHlvdSBuZWVkIHRoaXMuLi4gSSBhbHdheXMg
YXNzdW1lZCB0aGF0IGEgQlNQIGxheWVyIGlzIG1vc3RseSBhYm91dA0KPnJlYWwgaHcgYW5kIHRo
YXQgcnVucWVtdSB3aWxsIGRlYWwgd2l0aCBhbnkgcWVtdSBtYWNoaW5lLiBTbywgYXMgUmljaGFy
ZA0KPnNhaWQsIHdlIHNob3VsZCBwcm9iYWJseSBmaXggcnVucWVtdS4NCj4NCg0KT2ssIGxldCdz
IGZpeCBydW5xZW11IGZvciBxZW11IHNldHVwLCBhbmQgc2VlIGZyb20gdGhhdCB3aGV0aGVyIGFu
eSANCmNoYW5nZXMgYXJlIHJlcXVpcmVkIHdpdGhpbiBxZW11cnVubmVyLnB5IG9yIG5vdC4gSSBj
YW4gZW52aXNhZ2UgdGhlcmUgDQptaWdodCBiZSB0byByZW1vdmUgc29tZSBkZXBlbmRlbmNpZXMg
b24gaW5mcmFzdHJ1Y3R1cmUgc2V0dXAsIA0KYnV0IHdpbGwgbm90IGtub3cgZm9yIHN1cmUgdGls
bCB0aGUgd29yayBpcyBzdGFydGVkLg0KSGFzIHNvbWVvbmUgc3RhcnRlZCBhbmQgaXMgdGhlcmUg
YSBicmFuY2ggYXZhaWxhYmxlIHRvIHRyYWNrIHRoaXMgd29yaz8NCg0KPk5vdywgSSByZWFsbHkg
bGlrZSB0aGUgaWRlYSBvZiBhIGxheWVyLWNvbnRyb2xsZWQvZXh0ZW5kYWJsZSB0YXJnZXQNCj5z
ZXR1cCAoYmUgaXQgcWVtdSBvciBoYXJkd2FyZSkgYW5kIEkgdGhpbmsgd2Ugc2hvdWxkIGFsbG93
IGEgbGF5ZXIgdG8NCj5leHRlbmQgbGliL29lcWEvdGFyZ2V0Y29udHJvbC5weSBhbmQgcHJvdmlk
ZSAob3IgZXh0ZW5kKSBpdHMgb3duDQo+VEVTVF9UQVJHRVQgKGJlc2lkZXMgcWVtdSBhbmQgc2lt
cGxlcmVtb3RlKS4gVGhhdCB3aWxsIHByb3ZlIG1vcmUgdXNlZnVsDQo+Zm9yIGh3IHN0dWZmIGFu
ZCBpdCB3aWxsIGFsbG93IGEgbGF5ZXIgdG8gY29tcGxldGVseSBjb250cm9sIGRlcGxveW1lbnQN
Cj5vZiBhIHFlbXUgdGFyZ2V0IHRvbyAoZGVwbG95LCBzdGFydCwgc3RvcCwgcnVubmluZyBjb21t
YW5kcywgZXRjKS4gRS5nOg0KPnBlcmhhcHMgYSBsYXllciBkb2Vzbid0IGxpa2UgdGhlIHVzZSBv
ZiB0aGUgZXh0MyBpbWFnZXMgZm9yIHFlbXUgYW5kDQo+bmVlZHMgdG8gdXNlIHNvbWV0aGluZyBl
bHNlLiBUaG91Z2h0cz8NCj4NCg0KR3JlYXQsIEkgbGlrZSBpdC4gV2lsbCBnaXZlIGl0IHNvbWUg
bW9yZSB0aG91Z2h0LCBidXQgZXZlbiB0aGUgc2ltcGxlDQphZGRpdGlvbiBvZiBhbGxvd2luZyBh
IGJzcCBsYXllciB0byBwcm92aWRlIGl0cyBvd24gVEVTVF9UQVJHRVQgY2xhc3MgaXMgYQ0KZ3Jl
YXQgc3RlcCBmb3J3YXJkLg0KDQpUaGFua3MNClNpcGtlDQoNCg0KPkNoZWVycywNCj5TdGVmYW4N
Cj4NCgoK



