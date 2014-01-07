Return-Path: <sipke.vriend@xilinx.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe005.messaging.microsoft.com [216.32.180.188])
	by mail.openembedded.org (Postfix) with ESMTP id 609BD6CA13
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2014 22:59:19 +0000 (UTC)
Received: from mail93-co1-R.bigfish.com (10.243.78.253) by
	CO1EHSOBE001.bigfish.com (10.243.66.64) with Microsoft SMTP Server id
	14.1.225.22; Tue, 7 Jan 2014 22:59:19 +0000
Received: from mail93-co1 (localhost [127.0.0.1])	by mail93-co1-R.bigfish.com
	(Postfix) with ESMTP id 268C7D001E7;
	Tue,  7 Jan 2014 22:59:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: -4
X-BigFish: VPS-4(zzdb82h98dI9371I936eI542I1432Izz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzz8275bh8275dh1de097h186068hz2fh95h109h839h93fhd24hf0ah119dh1288h12a5h12a9h12bdh137ah13b6h1441h14ddh1504h1537h153bh162dh1631h1758h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5h2216h2336h906i1155h)
Received-SPF: pass (mail93-co1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=sipke.vriend@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail93-co1 (localhost.localdomain [127.0.0.1]) by mail93-co1
	(MessageSwitch) id 138913555453848_29124;
	Tue,  7 Jan 2014 22:59:14 +0000 (UTC)
Received: from CO1EHSMHS012.bigfish.com (unknown [10.243.78.231])	by
	mail93-co1.bigfish.com (Postfix) with ESMTP id F2C502E0047;
	Tue,  7 Jan 2014 22:59:13 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CO1EHSMHS012.bigfish.com
	(10.243.66.22) with Microsoft SMTP Server id 14.16.227.3;
	Tue, 7 Jan 2014 22:59:13 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<sipke.vriend@xilinx.com>)	id
	1W0fc9-00021u-PW; Tue, 07 Jan 2014 14:59:13 -0800
From: Sipke Vriend <sipke.vriend@xilinx.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [RFC OE-core/meta/lib] BSP Specific Qemurunner
Thread-Index: Ac8LTyM0cuP22wbdSB+YsK2jQLLpIwABYWywACfGLYAAASlFIA==
Date: Tue, 7 Jan 2014 22:59:11 +0000
References: <9bd39deb-0a32-437a-9f50-89abfe43d7d6@CO1EHSMHS004.ehs.local>
	<1389103177.6899.28.camel@ted>
In-Reply-To: <1389103177.6899.28.camel@ted>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.27]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
Message-ID: <00beaba3-2d15-4d36-936c-88fd8734ed8a@CO1EHSMHS012.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Tue, 07 Jan 2014 22:59:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KPg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+T24gV2VkbmVz
ZGF5LCA4IEphbnVhcnkgMjAxNCAxMjowMCBBTSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+DQo+
T24gVHVlLCAyMDE0LTAxLTA3IGF0IDAzOjA5ICswMDAwLCBTaXBrZSBWcmllbmQgd3JvdGU6DQo+
PiBIaSwNCj4+IA0KPj4gVGhpcyBSRkMgaXMgYSBwcm9wb3NhbCB0byBhbGxvdyBCU1AgbGF5ZXJz
IHRvIHNldHVwIHFlbXUgd2l0aCB0aGVpciBzcGVjaWZpYw0KPj4gcmVxdWlyZW1lbnRzIGZvciB0
aGUgdGVzdGltYWdlIG9lLWNvcmUgZnVuY3Rpb25hbGl0eS4NCj4+IFRoZSBzdWdnZXN0ZWQgY2hh
bmdlcyB3aWxsIGJlIGV4ZXJjaXNlZCBieSB0aGUgDQo+PiBiaXRiYWtlIC1jIHRlc3RpbWFnZSA8
aW1hZ2U+IA0KPj4gY29tbWFuZC4NCj4+IFNpbWlsYXJseSB0byB0aGUgb2VxYSB0ZXN0IGNhc2Vz
IHRoaXMgcHJvcG9zYWwgZXh0ZW5kcyB0aGUgbWV0YS9saWIvb2VxYSANCj4+IHB5dGhvbiBtb2R1
bGVzIHRvIGFsbG93IGluY2x1c2lvbiBvZiBweXRob24gdXRpbGl0eSBzY3JpcHRzIGluIHRoZSBC
U1AgDQo+PiBsYXllcnMuDQo+PiBBbnkgQlNQIGxheWVyIHdpc2hpbmcgdG8gc3VwcGx5IHRoZWly
IG93biBxZW11IHNldHVwIHdvdWxkIG5lZWQgdG8gY3JlYXRlDQo+PiBhbiBhcHByb3ByaWF0ZSBt
ZXRhLWJzcGxheWVyL2xpYi9vZXFhL3V0aWxzLzxtYWNoaW5lPnN0YXJ0ZXIucHkNCj4+IFRoZSBl
ZmZlY3QgaXMgdGhhdCB0aGUgbGliL29lcWEvdXRpbHMvcWVtdXJ1bm5lciB3aWxsIGVpdGhlciBh
bGxvdyB0aGUgDQo+PiBic3AgbGF5ZXIgcHJvdmlkZWQgPG1hY2hpbmU+c3RhcnRlciB0byBzcGF3
biBxZW11IG9yIGlmIG5vdCBwcm92aWRlZCwgDQo+PiBzcGF3biBxZW11IHZpYSBydW5xZW11IGFz
IGN1cnJlbnRseS4NCj4+IEFuIGV4YW1wbGUgYnNwIGxheWVyIGlzIGF2YWlsYWJsZSBoZXJlOg0K
Pj4gaHR0cHM6Ly9naXRodWIuY29tL3NpcGtlL21ldGEteGlsaW54L3RyZWUvc2lwa2UvcWVtdXJ1
bm5lcg0KPj4gd2l0aCBhbGwgcmVxdWlyZWQgYWRkaXRpb25zIGluIHRoZSBtZXRhLXhpbGlueC9s
aWIgZGlyZWN0b3J5Lg0KPj4gDQo+PiBUaGlzIFJGQyBpcyB0cmlnZ2VyZWQgYnkgYW5kIGluZGly
ZWN0bHkgcmVsYXRlZCB0bw0KPj4gQnVnemlsbGEgcmVwb3J0ICJydW5xZW11IHNob3VsZG4ndCBo
YXJkLWNvZGUgbWFjaGluZSBrbm93bGVkZ2UiDQo+PiBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJv
amVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTQ4MjcNCj4NCj5XaHkgd291bGQgd2UgZG8gdGhpcyBy
YXRoZXIgdGhhbiBpbXByb3ZlIHJ1bnFlbXUgdG8gYmUgZXh0ZW5kYWJsZSBmcm9tDQo+QlNQIGxh
eWVycz8NCj4NCg0KUHJvcG9zaW5nIGFzIGFuIGFkZGl0aW9uYWwgd2F5IHRvIGxhdW5jaCBxZW11
IGZvciBvZXFhIHRlc3RpbWFnZSBmdW5jdGlvbmFsaXR5LA0KSW1wcm92aW5nIHJ1bnFlbXUgY2Fu
IGFuZCBwcm9iYWJseSBzaG91bGQgc3RpbGwgaGFwcGVuLg0KIA0KVG8gY29uc2lkZXI6DQoqIGl0
IGtlZXBzIHRlc3RpbWFnZSBmdW5jdGlvbmFsaXR5IChmb3IgYnNwIGxheWVycyBzcGVjaWZpYyB0
aGluZ3MpIGluIA0KdGhlIGxpYiBkaXJlY3RseSAoc2ltaWxhciB0byB0ZXN0IGNhc2VzKSBhbmQg
YXMgcHl0aG9uLg0KKiB0ZXN0aW5nICh2aWEgdGVzdGltYWdlKSBtYXkgaGF2ZSBhIGRpZmZlcmVu
dCByZXF1aXJlbWVudCB0byB0aGF0IG9mDQpydW5uaW5nIHJ1bnFlbXUgb24gdGhlIGNvbW1hbmQg
bGluZSwgc28gYW4gYWx0ZXJuYXRlIHdheSB0byBsYXVuY2ggcWVtdSANCmNvdWxkIGJlIHVzZWZ1
bC4NCiogc2hvdWxkIHRoaXMgYXBwcm9hY2ggb2YgZXh0ZW5kaW5nIHRoZSBvZXFhIHRlc3RpbWFn
ZSBmdW5jdGlvbmFsaXR5IA0KaW50byBic3AgbGF5ZXJzIGJlIGFjY2VwdGVkLCB0aGlzIGNvdWxk
IGFsbG93IGFsc28gZm9yIGJzcCBzcGVjaWZpYyANCmhhcmR3YXJlIHNldHVwIGZvciB0ZXN0aW1h
Z2UgZnVuY3Rpb25hbGl0eSBpbiBic3AgbGF5ZXJzLg0KDQpQcmltYXJ5IGFpbSBpcyBhIHNvbHV0
aW9uIHdoaWNoIGFsbG93cyB0aGUgYnNwIGxheWVyIHRvIGNvbnRyb2wgdGhlIA0Kc2V0dXAgb2Yg
cWVtdSAoYW5kIGV2ZW50dWFsbHkgaGFyZHdhcmUpIGZvciB0ZXN0aW1hZ2UgZnVuY3Rpb25hbGl0
eS4gVGhpcyBpcyANCmEgcHJvcG9zYWwgdG93YXJkcyB0aGF0IGdvYWwuDQoNClRoYW5rcw0KU2lw
a2UNCg0KPkNoZWVycywNCj4NCj5SaWNoYXJkDQo+DQo+DQo+DQo+DQo+DQoKCg==



