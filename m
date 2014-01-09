Return-Path: <sipke.vriend@xilinx.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0189.outbound.messaging.microsoft.com [213.199.154.189])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDA26D23C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 00:02:05 +0000 (UTC)
Received: from mail61-db8-R.bigfish.com (10.174.8.254) by
	DB8EHSOBE019.bigfish.com (10.174.4.82) with Microsoft SMTP Server id
	14.1.225.22; Thu, 9 Jan 2014 00:02:05 +0000
Received: from mail61-db8 (localhost [127.0.0.1])	by mail61-db8-R.bigfish.com
	(Postfix) with ESMTP id 30E50120175;
	Thu,  9 Jan 2014 00:02:05 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: -5
X-BigFish: VPS-5(zzdb82h98dI9371I936eI542I1432I1418Izz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzz8275bh8275dh1de097h186068hz2fh95h109h839h93fhd24hf0ah119dh1288h12a5h12a9h12bdh137ah13b6h1441h14ddh1504h1537h153bh162dh1631h1758h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5h2216h2336h2438h906i1155h)
Received-SPF: pass (mail61-db8: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=sipke.vriend@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail61-db8 (localhost.localdomain [127.0.0.1]) by mail61-db8
	(MessageSwitch) id 1389225722775830_4848;
	Thu,  9 Jan 2014 00:02:02 +0000 (UTC)
Received: from DB8EHSMHS004.bigfish.com (unknown [10.174.8.245])	by
	mail61-db8.bigfish.com (Postfix) with ESMTP id B8ED4A8004E;
	Thu,  9 Jan 2014 00:02:02 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by DB8EHSMHS004.bigfish.com
	(10.174.4.14) with Microsoft SMTP Server id 14.16.227.3; Thu, 9 Jan 2014
	00:02:01 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<sipke.vriend@xilinx.com>)	id
	1W134T-0001mO-8M; Wed, 08 Jan 2014 16:02:01 -0800
From: Sipke Vriend <sipke.vriend@xilinx.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [RFC OE-core/meta/lib] BSP Specific Qemurunner
Thread-Index: Ac8LTyM0cuP22wbdSB+YsK2jQLLpIwABYWywACfGLYAAASlFIAAvfbeAAAFklgAABH0cUA==
Date: Thu, 9 Jan 2014 00:01:59 +0000
References: <9bd39deb-0a32-437a-9f50-89abfe43d7d6@CO1EHSMHS004.ehs.local>
	<00beaba3-2d15-4d36-936c-88fd8734ed8a@CO1EHSMHS012.ehs.local>
	<1389186761.6899.99.camel@ted> <3240985.EsWr8javTQ@helios>
In-Reply-To: <3240985.EsWr8javTQ@helios>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.27]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
Message-ID: <9217bc49-4fb4-4640-a7ae-1babd6cf17a8@DB8EHSMHS004.ehs.local>
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
X-List-Received-Date: Thu, 09 Jan 2014 00:02:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkbmVzZGF5LCA4IEphbnVhcnkgMjAxNCAxMTo1MyBQTSBQYXVsIEVnZ2xldG9uIHdyb3Rl
Og0KPg0KPk9uIFdlZG5lc2RheSAwOCBKYW51YXJ5IDIwMTQgMTM6MTI6NDEgUmljaGFyZCBQdXJk
aWUgd3JvdGU6DQo+PiBPbiBUdWUsIDIwMTQtMDEtMDcgYXQgMjI6NTkgKzAwMDAsIFNpcGtlIFZy
aWVuZCB3cm90ZToNCj4+ID4gSGkgUmljaGFyZCwNCj4+ID4gDQo+PiA+ID4tLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPj4gPiA+T24gV2VkbmVzZGF5LCA4IEphbnVhcnkgMjAxNCAxMjowMCBB
TSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+PiA+ID4NCj4+ID4gPk9uIFR1ZSwgMjAxNC0wMS0w
NyBhdCAwMzowOSArMDAwMCwgU2lwa2UgVnJpZW5kIHdyb3RlOg0KPj4gPiA+PiBIaSwNCj4+ID4g
Pj4gDQo+PiA+ID4+IFRoaXMgUkZDIGlzIGEgcHJvcG9zYWwgdG8gYWxsb3cgQlNQIGxheWVycyB0
byBzZXR1cCBxZW11IHdpdGggdGhlaXINCj4+ID4gPj4gc3BlY2lmaWMgcmVxdWlyZW1lbnRzIGZv
ciB0aGUgdGVzdGltYWdlIG9lLWNvcmUgZnVuY3Rpb25hbGl0eS4NCj4+ID4gPj4gVGhlIHN1Z2dl
c3RlZCBjaGFuZ2VzIHdpbGwgYmUgZXhlcmNpc2VkIGJ5IHRoZQ0KPj4gPiA+PiBiaXRiYWtlIC1j
IHRlc3RpbWFnZSA8aW1hZ2U+DQo+PiA+ID4+IGNvbW1hbmQuDQo+PiA+ID4+IFNpbWlsYXJseSB0
byB0aGUgb2VxYSB0ZXN0IGNhc2VzIHRoaXMgcHJvcG9zYWwgZXh0ZW5kcyB0aGUNCj4+ID4gPj4g
bWV0YS9saWIvb2VxYQ0KPj4gPiA+PiBweXRob24gbW9kdWxlcyB0byBhbGxvdyBpbmNsdXNpb24g
b2YgcHl0aG9uIHV0aWxpdHkgc2NyaXB0cyBpbiB0aGUgQlNQDQo+PiA+ID4+IGxheWVycy4NCj4+
ID4gPj4gQW55IEJTUCBsYXllciB3aXNoaW5nIHRvIHN1cHBseSB0aGVpciBvd24gcWVtdSBzZXR1
cCB3b3VsZCBuZWVkIHRvDQo+PiA+ID4+IGNyZWF0ZQ0KPj4gPiA+PiBhbiBhcHByb3ByaWF0ZSBt
ZXRhLWJzcGxheWVyL2xpYi9vZXFhL3V0aWxzLzxtYWNoaW5lPnN0YXJ0ZXIucHkNCj4+ID4gPj4g
VGhlIGVmZmVjdCBpcyB0aGF0IHRoZSBsaWIvb2VxYS91dGlscy9xZW11cnVubmVyIHdpbGwgZWl0
aGVyIGFsbG93IHRoZQ0KPj4gPiA+PiBic3AgbGF5ZXIgcHJvdmlkZWQgPG1hY2hpbmU+c3RhcnRl
ciB0byBzcGF3biBxZW11IG9yIGlmIG5vdCBwcm92aWRlZCwNCj4+ID4gPj4gc3Bhd24gcWVtdSB2
aWEgcnVucWVtdSBhcyBjdXJyZW50bHkuDQo+PiA+ID4+IEFuIGV4YW1wbGUgYnNwIGxheWVyIGlz
IGF2YWlsYWJsZSBoZXJlOg0KPj4gPiA+PiBodHRwczovL2dpdGh1Yi5jb20vc2lwa2UvbWV0YS14
aWxpbngvdHJlZS9zaXBrZS9xZW11cnVubmVyDQo+PiA+ID4+IHdpdGggYWxsIHJlcXVpcmVkIGFk
ZGl0aW9ucyBpbiB0aGUgbWV0YS14aWxpbngvbGliIGRpcmVjdG9yeS4NCj4+ID4gPj4gDQo+PiA+
ID4+IFRoaXMgUkZDIGlzIHRyaWdnZXJlZCBieSBhbmQgaW5kaXJlY3RseSByZWxhdGVkIHRvDQo+
PiA+ID4+IEJ1Z3ppbGxhIHJlcG9ydCAicnVucWVtdSBzaG91bGRuJ3QgaGFyZC1jb2RlIG1hY2hp
bmUga25vd2xlZGdlIg0KPj4gPiA+PiBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcv
c2hvd19idWcuY2dpP2lkPTQ4MjcNCj4+ID4gPg0KPj4gPiA+V2h5IHdvdWxkIHdlIGRvIHRoaXMg
cmF0aGVyIHRoYW4gaW1wcm92ZSBydW5xZW11IHRvIGJlIGV4dGVuZGFibGUgZnJvbQ0KPj4gPiA+
QlNQIGxheWVycz8NCj4+ID4gDQo+PiA+IFByb3Bvc2luZyBhcyBhbiBhZGRpdGlvbmFsIHdheSB0
byBsYXVuY2ggcWVtdSBmb3Igb2VxYSB0ZXN0aW1hZ2UNCj4+ID4gZnVuY3Rpb25hbGl0eSwgSW1w
cm92aW5nIHJ1bnFlbXUgY2FuIGFuZCBwcm9iYWJseSBzaG91bGQgc3RpbGwgaGFwcGVuLg0KPj4g
PiANCj4+ID4gVG8gY29uc2lkZXI6DQo+PiA+ICogaXQga2VlcHMgdGVzdGltYWdlIGZ1bmN0aW9u
YWxpdHkgKGZvciBic3AgbGF5ZXJzIHNwZWNpZmljIHRoaW5ncykgaW4NCj4+ID4gdGhlIGxpYiBk
aXJlY3RseSAoc2ltaWxhciB0byB0ZXN0IGNhc2VzKSBhbmQgYXMgcHl0aG9uLg0KPj4gPiAqIHRl
c3RpbmcgKHZpYSB0ZXN0aW1hZ2UpIG1heSBoYXZlIGEgZGlmZmVyZW50IHJlcXVpcmVtZW50IHRv
IHRoYXQgb2YNCj4+ID4gcnVubmluZyBydW5xZW11IG9uIHRoZSBjb21tYW5kIGxpbmUsIHNvIGFu
IGFsdGVybmF0ZSB3YXkgdG8gbGF1bmNoIHFlbXUNCj4+ID4gY291bGQgYmUgdXNlZnVsLg0KPj4g
PiAqIHNob3VsZCB0aGlzIGFwcHJvYWNoIG9mIGV4dGVuZGluZyB0aGUgb2VxYSB0ZXN0aW1hZ2Ug
ZnVuY3Rpb25hbGl0eQ0KPj4gPiBpbnRvIGJzcCBsYXllcnMgYmUgYWNjZXB0ZWQsIHRoaXMgY291
bGQgYWxsb3cgYWxzbyBmb3IgYnNwIHNwZWNpZmljDQo+PiA+IGhhcmR3YXJlIHNldHVwIGZvciB0
ZXN0aW1hZ2UgZnVuY3Rpb25hbGl0eSBpbiBic3AgbGF5ZXJzLg0KPj4gPiANCj4+ID4gUHJpbWFy
eSBhaW0gaXMgYSBzb2x1dGlvbiB3aGljaCBhbGxvd3MgdGhlIGJzcCBsYXllciB0byBjb250cm9s
IHRoZQ0KPj4gPiBzZXR1cCBvZiBxZW11IChhbmQgZXZlbnR1YWxseSBoYXJkd2FyZSkgZm9yIHRl
c3RpbWFnZSBmdW5jdGlvbmFsaXR5LiBUaGlzDQo+PiA+IGlzIGEgcHJvcG9zYWwgdG93YXJkcyB0
aGF0IGdvYWwuDQo+PiANCj4+IEkgdGhvdWdodCBTdGVmYW4gd2FzIGFscmVhZHkgYWxzbyB3b3Jr
aW5nIG9uIHNvbWV0aGluZyB0b3dhcmRzIHRoaXMNCj4+IGdvYWwuIEknZCBsaWtlIHRvIGVuc3Vy
ZSB3ZSBkb24ndCBlbmQgdXAgd2l0aCB0d28gdGhpbmdzIGRvaW5nIHRoZSBzYW1lDQo+PiB0aGlu
Zy4NCj4+IA0KPj4gU3RlZmFuPw0KPj4gDQoNCkFncmVlZC4gT25lIHNvbHV0aW9uIGlzIGRlc2ly
ZWQuIEhhcHB5IHRvIGNvb3JkaW5hdGUgd2l0aCBhbmQgYXNzaXN0IFN0ZWZhbiwNCmVpdGhlciBp
bXBsZW1lbnRpbmcgcGFydCBvZiBhIHNvbHV0aW9uIChwcm9wb3NlZCBvbmUgb3IgYW5vdGhlcikg
YW5kL29yIA0KdGVzdGluZyB3aGF0ZXZlciBTdGVmYW4gY29tZXMgdXAgd2l0aCBhZ2FpbnN0IG91
ciBic3AgbGF5ZXIuDQoNCj4+IFRvIGJlIGNsZWFyLCBJIHdvdWxkIGxpa2UgdG8gc2VlIHJ1bnFl
bXUgZW5oYW5jZWQgc28gQlNQIGxheWVycyBjYW4NCj4+IGV4dGVuZCBpdCwgSSB0aGluayB0aGF0
IHdvdWxkIGJlIHVzZWZ1bCBmb3IgZXZlcnlvbmUuIE9uY2Ugd2UndmUgZG9uZQ0KPj4gdGhhdCwg
SSdkIGxpa2UgdG8gcmV2aXNpdCB0aGUgcWVtdSBhYnN0cmFjdGlvbiBpbiB0ZXN0aW1hZ2UgYW5k
IGZpZ3VyZQ0KPj4gb3V0IHdoYXQgY2hhbmdlcyBpdCBuZWVkcy4gU29tZSBtYXkgYmUgcmVxdWly
ZWQsIHNvbWUgbWF5IG5vdCBpZiB3ZSBmaXgNCj4+IHJ1bnFlbXUgZmlyc3QsIEknbSB1bmNsZWFy
IGZyb20gdGhlc2UgY29tbWl0cyB3aGF0IHRob3NlIHdvdWxkIGJlDQo+PiB0aG91Z2guDQo+DQo+
RldJVyBJIGFncmVlLCB3ZSBuZWVkIHRvIGhhdmUgdGhlIEJTUC1zcGVjaWZpYyBmdW5jdGlvbmFs
aXR5IGluIHJ1bnFlbXUgYW5kIA0KPnRoZW4gd2hhdCB3ZSBkbyB3aXRoIFFlbXVSdW5uZXIgd2ls
bCBmb2xsb3cgb24gZnJvbSB0aGF0LiBJIHRoaW5rIHRoZSBvdGhlciANCg0KSG9wZWZ1bGx5IHRo
ZSBCU1Atc3BlY2lmaWMgcGFydHMgKGNvbmZpZyBmaWxlcyBvciBzY3JpcHRzKSB3aWxsIGJlIGlu
IHRoZSBic3ANCmxheWVyLg0KSXMgdGhlIEVUQSBvZiB0aGlzIHN0aWxsIDEuNi1NND8NCg0KPnBh
dGNoZXMgaW4gdGhlIHNlcmllcyB0byBkbyB3aXRoIHNldHRpbmcgdXNlci9wb3J0IHNob3VsZCBi
ZSBPSyB0byBjb25zaWRlciANCj5pbmRlcGVuZGVudGx5IG9mIHRoaXMsIHRob3VnaC4NCj4NCj5D
aGVlcnMsDQo+UGF1bA0KPg0KPi0tIA0KPg0KPlBhdWwgRWdnbGV0b24NCj5JbnRlbCBPcGVuIFNv
dXJjZSBUZWNobm9sb2d5IENlbnRyZQ0KPg0KPg0KCgo=



