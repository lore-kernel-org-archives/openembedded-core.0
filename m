Return-Path: <sipke.vriend@xilinx.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe001.messaging.microsoft.com [216.32.180.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD3A600AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 02:21:32 +0000 (UTC)
Received: from mail172-va3-R.bigfish.com (10.7.14.226) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.22; Fri, 24 Jan 2014 02:21:31 +0000
Received: from mail172-va3 (localhost [127.0.0.1])	by
	mail172-va3-R.bigfish.com (Postfix) with ESMTP id BEA1E601B5;
	Fri, 24 Jan 2014 02:21:31 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: -5
X-BigFish: VPS-5(z579ehzbb2dI98dI9371I936eI146fI1432Izz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2fh95h109h839h93fhd24hf0ah119dh1288h12a5h12a9h12bdh137ah13b6h1441h14ddh1504h1537h153bh162dh1631h1758h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1fe8h1ff5h2216h2336h2438h2461h2487h24d7h906i1155h)
Received-SPF: pass (mail172-va3: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=sipke.vriend@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail172-va3 (localhost.localdomain [127.0.0.1]) by mail172-va3
	(MessageSwitch) id 1390530089475165_16275;
	Fri, 24 Jan 2014 02:21:29 +0000 (UTC)
Received: from VA3EHSMHS017.bigfish.com (unknown [10.7.14.231])	by
	mail172-va3.bigfish.com (Postfix) with ESMTP id 515A130004F;
	Fri, 24 Jan 2014 02:21:29 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by VA3EHSMHS017.bigfish.com
	(10.7.99.27) with Microsoft SMTP Server id 14.16.227.3; Fri, 24 Jan 2014
	02:21:29 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<sipke.vriend@xilinx.com>)	id
	1W6WOe-0000Fn-K5; Thu, 23 Jan 2014 18:21:28 -0800
From: Sipke Vriend <sipke.vriend@xilinx.com>
To: "Stanacar, StefanX (stefanx.stanacar@intel.com)"
	<stefanx.stanacar@intel.com>
Thread-Topic: Re: [OE-core] [PATCH] lib/oeqa: allow a layer to provide it's
	own TEST_TARGET class
Thread-Index: Ac8YjIdDvyQ/OttVRjyMGFAYl4r16g==
Date: Thu, 23 Jan 2014 22:44:19 +0000
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.27]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
Message-ID: <db401559-1f24-4d5f-8ac7-c15feefecb06@VA3EHSMHS017.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "OpenEmbedded Core Mailing List
	\(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oeqa: allow a layer to provide it's own TEST_TARGET class
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
X-List-Received-Date: Fri, 24 Jan 2014 02:21:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgU3RlZmFuLA0KDQpPbiAyMy8wMS8yMDE0IDY6MjcgUE0sIFN0YW5hY2FyLCBTdGVmYW5YIHdy
b3RlOg0KPiBIaSBTaXBrZSwNCj4NCj4gT24gVGh1LCAyMDE0LTAxLTIzIGF0IDE0OjQ4ICsxMDAw
LCBTaXBrZSBWcmllbmQgd3JvdGU6DQo+PiBIaSBTdGVmYW4sDQo+Pg0KPj4gSSBoYXZlIHN0YXJ0
ZWQgdXNpbmcgdGhpcyBwYXRjaCBpbiBtYXN0ZXIgdG8gZXh0ZW5kIHRlc3QgdGFyZ2V0cyB0byBv
dXINCj4+IGJzcCBsYXllciwgYW5kIGl0IHdvcmtzIHdlbGwuIFRoYW5rcy4NCj4+IFdpbGwgdGhl
IGV4dGVuc2lvbiBvZiBhIGNvbnRyb2xsZXJzLnB5IGZpbGUgd29yayBmb3IgbXVsdGlwbGUgYnNw
IGxheWVycw0KPj4gaW4gYSBzaW5nbGUgYnVpbGQvY29uZi9iYmxheWVycy5jb25mPw0KPj4gSSBk
aWQgYSBxdWljayB0ZXN0IGFuZCB0aGluayB0aGF0IHRoZSBmaXJzdCBjb250cm9sbGVyLnB5IGZv
dW5kIGlzIHRoZQ0KPj4gb25seSBvbmUgImV4dGVuZGVkIi4gSWYgdGhpcyBpcyB0cnVlIHRoZW4g
IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uDQo+PiBjb3VsZCBnZXQgYSBmYWxzZSBuZWdhdGl2
ZSBmb3IgYSBnaXZlbiBURVNUX1RBUkdFVCwgaWYgbW9yZSB0aGFuIG9uZQ0KPj4gbGF5ZXIgaW1w
bGVtZW50cyBjb250cm9sbGVycy5weS4NCj4NCj4gR29vZCBjYXRjaCENCj4gWW91IGFyZSByaWdo
dCwgb25seSB0aGUgZmlyc3Qgb25lIGZvdW5kIGlzIGltcG9ydGVkIChhbmQgdGhhdCBwcm9iYWJs
eQ0KPiBoYXMgdG8gZG8gd2l0aCBob3cgaW1wb3J0cyBhcmUgbWFkZSBhbmQgdGhlIG9yZGVyIG9m
IGxheWVycyAtIGxpYi8gaXMNCj4gYWRkZWQgdG8gcHl0aG9ucGF0aCBmb3IgYWxsIGxheWVycyBB
RkFJSykNCj4NCj4+DQo+PiBJIHRyaWVkIGEgbWlub3IgbW9kaWZpY2F0aW9uIHdoaWNoIGFzc3Vt
ZXMgZWFjaCB0ZXN0dGFyZ2V0IGNsYXNzIGlzIGluDQo+PiBpdHMgb3duIGZpbGUgd2l0aCB0aGUg
bmFtZSA8dGVzdHRhcmdldD4ucHkgKGxvd2VyIGNhc2UpLiBUaGlzIGV4dGVuZGVkDQo+PiBhY3Jv
c3MgbXVsdGlwbGUgbGF5ZXJzLCBhc3N1bWluZyBubyBkdXBsaWNhdGlvbiBvZiB0ZXN0IHRhcmdl
dCBuYW1lcy4gSQ0KPj4gcHV0IHRoZW0gaW4gdGhlIHV0aWxzIGRpcmVjdG9yeSBmb3IgdGhlIHRl
c3QsIGJ1dCB0aGV5IGNvdWxkIGdvIGludG8gYQ0KPj4gY29udHJvbGxlcnMgZm9sZGVyIGFzIHRo
YXQgbWlnaHQgbWFrZSBtb3JlIHNlbnNlLg0KPg0KPiBMb29rcyBnb29kLCBhbmQgeWVzLCBhIG9l
cWEuY29udHJvbGxlcnMgcGFja2FnZSBtaWdodCBtYWtlIG1vcmUgc2Vuc2UuDQo+IE5vdywgdGhl
IG9ubHkgdGhpbmcgdGhhdCBib3RoZXJzIG1lIGlzIHVzaW5nIHRlc3R0YXJnZXQncyB2YWx1ZSBh
cyB0aGUNCj4gZmlsZW5hbWUgKGFzIGl0IGlzIG5vdyBpdCB3YXMgc3VwcG9zZWQgdG8gYmUgdGhl
IGNsYXNzIG5hbWUpLiBOYW1pbmcNCj4gdGhpbmdzIGlzIGhhcmQuLi4NCj4gQW55d2F5LCBjb3Vs
ZCB5b3UgcGxlYXNlIHNlbmQgaXQgYXMgYSBwYXRjaD8NCg0KVGhlIHRlc3R0YXJnZXQgdmFsdWUg
aXMgdXNlZCBmb3IgYm90aCBmaWxlIG5hbWUgKGxvd2VyIGNhc2UpIGFuZCBjbGFzcyAoY2FtZWwg
Y2FzZSkuDQpUaGlzIG1lYW5zIHRoZXJlIHdvdWxkIGJlIG9uZSBjbGFzcyBwZXIgZmlsZSBpbiB0
aGUgY29udHJvbGxlcnMgZGlyZWN0b3J5Lg0KTm90IGF3YXJlIG9mIGEgd2F5IGFyb3VuZCBpdCwg
YnV0IHdpbGwgbG9vayBpbnRvIGl0LiBGYWlsaW5nIHRoYXQgSSdsbCBzdWJtaXQgYSBwYXRjaA0K
d2l0aCB0aGUgY29udHJvbGxlcnMgZGlyZWN0b3J5IGluY2x1ZGVkLg0KDQo+DQo+IENoZWVycywN
Cj4gU3RlZmFuDQo+DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL21ldGEvbGliL29lcWEvdGFyZ2V0Y29u
dHJvbC5weSBiL21ldGEvbGliL29lcWEvdGFyZ2V0Y29udHJvbC5weQ0KPj4gaW5kZXggNzU3Zjlk
My4uZDdjYWI3ZSAxMDA2NDQNCj4+IC0tLSBhL21ldGEvbGliL29lcWEvdGFyZ2V0Y29udHJvbC5w
eQ0KPj4gKysrIGIvbWV0YS9saWIvb2VxYS90YXJnZXRjb250cm9sLnB5DQo+PiBAQCAtMjgsMTAg
KzI4LDExIEBAIGRlZiBnZXRfdGFyZ2V0X2NvbnRyb2xsZXIoZCk6DQo+PiAgICAgICAgICAgZXhj
ZXB0IEF0dHJpYnV0ZUVycm9yOg0KPj4gICAgICAgICAgICAgICAjIG5vcGUsIHBlcmhhcHMgYSBs
YXllciBkZWZpbmVkIG9uZQ0KPj4gICAgICAgICAgICAgICB0cnk6DQo+PiAtICAgICAgICAgICAg
ICAgIG1vZHVsZSA9IF9faW1wb3J0X18oIm9lcWEudXRpbHMuY29udHJvbGxlcnMiLA0KPj4gZ2xv
YmFscygpLCBsb2NhbHMoKSwgW3Rlc3R0YXJnZXRdKQ0KPj4gKyAgICAgICAgICAgICAgICBtb2R1
bGVuYW1lID0gIm9lcWEudXRpbHMuezB9Ii5mb3JtYXQodGVzdHRhcmdldC5sb3dlcigpKQ0KPj4g
KyAgICAgICAgICAgICAgICBtb2R1bGUgPSBfX2ltcG9ydF9fKG1vZHVsZW5hbWUsIGdsb2JhbHMo
KSwgbG9jYWxzKCksDQo+PiBbdGVzdHRhcmdldF0pDQo+PiAgICAgICAgICAgICAgICAgICBjb250
cm9sbGVyID0gZ2V0YXR0cihtb2R1bGUsIHRlc3R0YXJnZXQpDQo+PiAgICAgICAgICAgICAgIGV4
Y2VwdCBJbXBvcnRFcnJvciBhcyBlOg0KPj4gLSAgICAgICAgICAgICAgICBiYi5mYXRhbCgiRmFp
bGVkIHRvIGltcG9ydCBvZXFhLnV0aWxzLmNvbnRyb2xsZXJzOlxuJXMiDQo+PiAlIHRyYWNlYmFj
ay5mb3JtYXRfZXhjKCkpDQo+PiArICAgICAgICAgICAgICAgIGJiLmZhdGFsKCJGYWlsZWQgdG8g
aW1wb3J0DQo+PiB7MH06XG57MX0iLmZvcm1hdChtb2R1bGVuYW1lLHRyYWNlYmFjay5mb3JtYXRf
ZXhjKCkpKQ0KPj4gICAgICAgICAgICAgICBleGNlcHQgQXR0cmlidXRlRXJyb3I6DQo+PiAgICAg
ICAgICAgICAgICAgICBiYi5mYXRhbCgiXCIlc1wiIGlzIG5vdCBhIHZhbGlkIHZhbHVlIGZvciBU
RVNUX1RBUkdFVCINCj4+ICUgdGVzdHRhcmdldCkNCj4+ICAgICAgICAgICByZXR1cm4gY29udHJv
bGxlcihkKQ0KPj4NCj4+IENoZWVycw0KPj4gU2lwa2UNCj4+DQo+PiBPbiAxNi8wMS8yMDE0IDEw
OjQ4IFBNLCBTdGVmYW4gU3RhbmFjYXIgd3JvdGU6DQo+Pj4gQWxsb3dzIGEgbGF5ZXIgdG8gZGVm
aW5lIG5ldyBjbGFzc2VzIGluPGxheWVyPi9saWIvb2VxYS91dGlscy9jb250cm9sbGVycy5weQ0K
Pj4+IGFuZCBjb21wbGV0ZWx5IGNvbnRyb2wgb3IgZXh0ZW5kIGRlcGxveW1lbnQgb2YgYSB0YXJn
ZXQuIChjb3JlIGN1cnJlbnRseQ0KPj4+IGhhcyBRZW11VGFyZ2V0IGFuZCBTaW1wbGVSZW1vdGVU
YXJnZXQpLg0KPj4+IFRoZSB2YWx1ZSBvZiBURVNUX1RBUkdFVCBtdXN0IGJlIHRoZSBuYW1lIG9m
IHRoZSBuZXcgY2xhc3MuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gU3RhbmFjYXI8
c3RlZmFueC5zdGFuYWNhckBpbnRlbC5jb20+DQo+Pj4gLS0tDQo+Pj4gICBtZXRhL2xpYi9vZXFh
L3RhcmdldGNvbnRyb2wucHkgIHwgMjMgKysrKysrKysrKysrKysrKysrKy0tLS0NCj4+PiAgIG1l
dGEvbGliL29lcWEvdXRpbHMvX19pbml0X18ucHkgfCAgMyArKysNCj4+PiAgIDIgZmlsZXMgY2hh
bmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1n
aXQgYS9tZXRhL2xpYi9vZXFhL3RhcmdldGNvbnRyb2wucHkgYi9tZXRhL2xpYi9vZXFhL3Rhcmdl
dGNvbnRyb2wucHkNCj4+PiBpbmRleCBkZWUzOGVjLi43NTdmOWQzIDEwMDY0NA0KPj4+IC0tLSBh
L21ldGEvbGliL29lcWEvdGFyZ2V0Y29udHJvbC5weQ0KPj4+ICsrKyBiL21ldGEvbGliL29lcWEv
dGFyZ2V0Y29udHJvbC5weQ0KPj4+IEBAIC04LDE4ICs4LDMzIEBAIGltcG9ydCBvcw0KPj4+ICAg
aW1wb3J0IHNodXRpbA0KPj4+ICAgaW1wb3J0IHN1YnByb2Nlc3MNCj4+PiAgIGltcG9ydCBiYg0K
Pj4+IC0NCj4+PiAraW1wb3J0IHRyYWNlYmFjaw0KPj4+ICAgZnJvbSBvZXFhLnV0aWxzLnNzaGNv
bnRyb2wgaW1wb3J0IFNTSENvbnRyb2wNCj4+PiAgIGZyb20gb2VxYS51dGlscy5xZW11cnVubmVy
IGltcG9ydCBRZW11UnVubmVyDQo+Pj4NCj4+Pg0KPj4+ICAgZGVmIGdldF90YXJnZXRfY29udHJv
bGxlcihkKToNCj4+PiAtICAgIGlmIGQuZ2V0VmFyKCJURVNUX1RBUkdFVCIsIFRydWUpID09ICJx
ZW11IjoNCj4+PiArICAgIHRlc3R0YXJnZXQgPSBkLmdldFZhcigiVEVTVF9UQVJHRVQiLCBUcnVl
KQ0KPj4+ICsgICAgIyBvbGQsIHNpbXBsZSBuYW1lcw0KPj4+ICsgICAgaWYgdGVzdHRhcmdldCA9
PSAicWVtdSI6DQo+Pj4gICAgICAgICAgIHJldHVybiBRZW11VGFyZ2V0KGQpDQo+Pj4gLSAgICBl
bGlmIGQuZ2V0VmFyKCJURVNUX1RBUkdFVCIsIFRydWUpID09ICJzaW1wbGVyZW1vdGUiOg0KPj4+
ICsgICAgZWxpZiB0ZXN0dGFyZ2V0ID09ICJzaW1wbGVyZW1vdGUiOg0KPj4+ICAgICAgICAgICBy
ZXR1cm4gU2ltcGxlUmVtb3RlVGFyZ2V0KGQpDQo+Pj4gICAgICAgZWxzZToNCj4+PiAtICAgICAg
ICBiYi5mYXRhbCgiUGxlYXNlIHNldCBhIHZhbGlkIFRFU1RfVEFSR0VUIikNCj4+PiArICAgICAg
ICAjIHVzZSB0aGUgY2xhc3MgbmFtZQ0KPj4+ICsgICAgICAgIHRyeToNCj4+PiArICAgICAgICAg
ICAgIyBpcyBpdCBhIGNvcmUgY2xhc3MgZGVmaW5lZCBoZXJlPw0KPj4+ICsgICAgICAgICAgICBj
b250cm9sbGVyID0gZ2V0YXR0cihfX25hbWVfXywgdGVzdHRhcmdldCkNCj4+PiArICAgICAgICBl
eGNlcHQgQXR0cmlidXRlRXJyb3I6DQo+Pj4gKyAgICAgICAgICAgICMgbm9wZSwgcGVyaGFwcyBh
IGxheWVyIGRlZmluZWQgb25lDQo+Pj4gKyAgICAgICAgICAgIHRyeToNCj4+PiArICAgICAgICAg
ICAgICAgIG1vZHVsZSA9IF9faW1wb3J0X18oIm9lcWEudXRpbHMuY29udHJvbGxlcnMiLCBnbG9i
YWxzKCksIGxvY2FscygpLCBbdGVzdHRhcmdldF0pDQo+Pj4gKyAgICAgICAgICAgICAgICBjb250
cm9sbGVyID0gZ2V0YXR0cihtb2R1bGUsIHRlc3R0YXJnZXQpDQo+Pj4gKyAgICAgICAgICAgIGV4
Y2VwdCBJbXBvcnRFcnJvciBhcyBlOg0KPj4+ICsgICAgICAgICAgICAgICAgYmIuZmF0YWwoIkZh
aWxlZCB0byBpbXBvcnQgb2VxYS51dGlscy5jb250cm9sbGVyczpcbiVzIiAlIHRyYWNlYmFjay5m
b3JtYXRfZXhjKCkpDQo+Pj4gKyAgICAgICAgICAgIGV4Y2VwdCBBdHRyaWJ1dGVFcnJvcjoNCj4+
PiArICAgICAgICAgICAgICAgIGJiLmZhdGFsKCJcIiVzXCIgaXMgbm90IGEgdmFsaWQgdmFsdWUg
Zm9yIFRFU1RfVEFSR0VUIiAlIHRlc3R0YXJnZXQpDQo+Pj4gKyAgICAgICAgcmV0dXJuIGNvbnRy
b2xsZXIoZCkNCj4+Pg0KPj4+DQo+Pj4gICBjbGFzcyBCYXNlVGFyZ2V0KG9iamVjdCk6DQo+Pj4g
ZGlmZiAtLWdpdCBhL21ldGEvbGliL29lcWEvdXRpbHMvX19pbml0X18ucHkgYi9tZXRhL2xpYi9v
ZXFhL3V0aWxzL19faW5pdF9fLnB5DQo+Pj4gaW5kZXggZTY5ZGUyOS4uOGVkYTkyNyAxMDA2NDQN
Cj4+PiAtLS0gYS9tZXRhL2xpYi9vZXFhL3V0aWxzL19faW5pdF9fLnB5DQo+Pj4gKysrIGIvbWV0
YS9saWIvb2VxYS91dGlscy9fX2luaXRfXy5weQ0KPj4+IEBAIC0wLDAgKzEsMyBAQA0KPj4+ICsj
IEVuYWJsZSBvdGhlciBsYXllcnMgdG8gaGF2ZSBtb2R1bGVzIGluIHRoZSBzYW1lIG5hbWVkIGRp
cmVjdG9yeQ0KPj4+ICtmcm9tIHBrZ3V0aWwgaW1wb3J0IGV4dGVuZF9wYXRoDQo+Pj4gK19fcGF0
aF9fID0gZXh0ZW5kX3BhdGgoX19wYXRoX18sIF9fbmFtZV9fKQ0KPj4+DQo+Pg0KPj4NCj4NCgoK



