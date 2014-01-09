Return-Path: <nathan.rossi@xilinx.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe004.messaging.microsoft.com [213.199.154.207])
	by mail.openembedded.org (Postfix) with ESMTP id 98D056D1C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 03:54:16 +0000 (UTC)
Received: from mail55-am1-R.bigfish.com (10.3.201.249) by
	AM1EHSOBE014.bigfish.com (10.3.207.136) with Microsoft SMTP Server id
	14.1.225.22; Thu, 9 Jan 2014 03:54:16 +0000
Received: from mail55-am1 (localhost [127.0.0.1])	by mail55-am1-R.bigfish.com
	(Postfix) with ESMTP id 7F57738046F;
	Thu,  9 Jan 2014 03:54:16 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: -6
X-BigFish: VPS-6(z579ehz98dI9371I1431J936eI542I1432Izz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah1fc6hzz1de098h8275bh8275dh1de097hz2fh95h109h839h93fhd24hf0ah119dh1288h12a5h12a9h12bdh137ah13b6h1441h14ddh1504h1537h153bh162dh1631h1758h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dfeh1dffh1e1dh1fe8h1ff5h2216h2336h2438h906i1155h)
Received-SPF: pass (mail55-am1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=nathan.rossi@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail55-am1 (localhost.localdomain [127.0.0.1]) by mail55-am1
	(MessageSwitch) id 1389239654890136_12425;
	Thu,  9 Jan 2014 03:54:14 +0000 (UTC)
Received: from AM1EHSMHS019.bigfish.com (unknown [10.3.201.237])	by
	mail55-am1.bigfish.com (Postfix) with ESMTP id CBC8560048;
	Thu,  9 Jan 2014 03:54:14 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by AM1EHSMHS019.bigfish.com
	(10.3.207.157) with Microsoft SMTP Server id 14.16.227.3;
	Thu, 9 Jan 2014 03:54:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<nathan.rossi@xilinx.com>)	id
	1W16hB-0004Lx-T2; Wed, 08 Jan 2014 19:54:13 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] ptest.bblass: Fix package QA issues when
	disabled
Thread-Index: AQHPDHFcbQxBCLJCbEqnfquyxOxRTJp7vslw
Date: Thu, 9 Jan 2014 03:54:11 +0000
References: <d7cb4e9a-2926-44a2-b789-a31612162a44@TX2EHSMHS014.ehs.local>
	<1389185889.6899.96.camel@ted>
In-Reply-To: <1389185889.6899.96.camel@ted>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.164.59]
MIME-Version: 1.0
X-RCIS-Action: ALLOW
Message-ID: <9312228c-9258-4154-ac00-aa54b832f9b3@AM1EHSMHS019.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ptest.bblass: Fix package QA issues when disabled
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
X-List-Received-Date: Thu, 09 Jan 2014 03:54:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFp
bHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgSmFudWFyeSAwOCwgMjAxNCAxMDo1OCBQTQ0KPiBUbzogTmF0aGFuIFJvc3NpDQo+IENjOiBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIXSBwdGVzdC5iYmxhc3M6IEZpeCBwYWNrYWdlIFFBIGlzc3VlcyB3aGVu
DQo+IGRpc2FibGVkDQo+IA0KPiBPbiBXZWQsIDIwMTQtMDEtMDggYXQgMTc6MDUgKzEwMDAsIE5h
dGhhbiBSb3NzaSB3cm90ZToNCj4gPiBXaGVuIHRoZSBwdGVzdCBkaXN0cm8gZmVhdHVyZSBpcyBk
aXNhYmxlZCwgYSBwdGVzdCBkaXJlY3RvcnkgaXMgc3RpbGwNCj4gPiBjcmVhdGVkIGluIHRoZSBp
bnN0YWxsIHBoYXNlLCBUaGlzIGRpcmVjdG9yeSBpcyBub3QgY2xlYW5lZCB1cCBvcg0KPiA+IGNv
bnN1bWVkIGJ5IGFueSBwYWNrYWdlIGFuZCB3aWxsIHRocm93IGEgUUEgZXJyb3IsIGUuZy4NCj4g
Pg0KPiA+IEVSUk9SOiBRQSBJc3N1ZTogZ2xpYi0yLjA6IEZpbGVzL2RpcmVjdG9yaWVzIHdlcmUg
aW5zdGFsbGVkIGJ1dCBub3QNCj4gPiBzaGlwcGVkDQo+ID4gICAvdXNyL2xpYi9nbGliLTIuMC9w
dGVzdA0KPiA+IEVSUk9SOiBRQSBydW4gZm91bmQgZmF0YWwgZXJyb3JzLiBQbGVhc2UgY29uc2lk
ZXIgZml4aW5nIHRoZW0uDQo+ID4gRVJST1I6IEZ1bmN0aW9uIGZhaWxlZDogZG9fcGFja2FnZV9x
YQ0KPiA+DQo+ID4gVGhpcyBpcyBjYXVzZWQgYnkgdGhlIGRvX2luc3RhbGxfcHRlc3RfYmFzZVtj
bGVhbmRpcnNdIHRhc2sgZmxhZyB3aGljaA0KPiA+IGlzIG5vdCBzZXR1cCB0byBiZSBjb25kaXRp
b25hbCBvbiBwdGVzdCBiZWluZyBlbmFibGVkLiBUaGlzIHBhdGNoDQo+ID4gY2hhbmdlcyB0aGUg
dGFzayBmbGFnIHRvIGVtaXQgdGhlIGNsZWFuZGlycyBwYXRoIG9ubHkgd2hlbiB0aGUgcHRlc3QN
Cj4gPiBkaXN0cm8gZmVhdHVyZSBpcyBlbmFibGVkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
TmF0aGFuIFJvc3NpIDxuYXRoYW4ucm9zc2lAeGlsaW54LmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0
YS9jbGFzc2VzL3B0ZXN0LmJiY2xhc3MgfCAgICAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEv
Y2xhc3Nlcy9wdGVzdC5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL3B0ZXN0LmJiY2xhc3MNCj4gPiBp
bmRleCBlYzEwZjgwLi4zNDUwMDg1IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY2xhc3Nlcy9wdGVz
dC5iYmNsYXNzDQo+ID4gKysrIGIvbWV0YS9jbGFzc2VzL3B0ZXN0LmJiY2xhc3MNCj4gPiBAQCAt
NDksNyArNDksNyBAQCBkb19pbnN0YWxsX3B0ZXN0X2Jhc2UoKSB7DQo+ID4gICAgICBmaQ0KPiA+
ICB9DQo+ID4NCj4gPiAtZG9faW5zdGFsbF9wdGVzdF9iYXNlW2NsZWFuZGlyc10gPSAiJHtEfSR7
UFRFU1RfUEFUSH0iDQo+ID4gK2RvX2luc3RhbGxfcHRlc3RfYmFzZVtjbGVhbmRpcnNdID0gIiR7
QFsnJywNCj4gJyR7RH0ke1BURVNUX1BBVEh9J11bKGQuZ2V0VmFyKCdQVEVTVF9FTkFCTEVEJywg
VHJ1ZSkgb3IgJycpID09ICcxJ119Ig0KPiA+DQo+ID4gIGFkZHRhc2sgY29uZmlndXJlX3B0ZXN0
X2Jhc2UgYWZ0ZXIgZG9fY29uZmlndXJlIGJlZm9yZSBkb19jb21waWxlDQo+ID4gIGFkZHRhc2sg
Y29tcGlsZV9wdGVzdF9iYXNlICAgYWZ0ZXIgZG9fY29tcGlsZSAgIGJlZm9yZSBkb19pbnN0YWxs
DQo+IA0KPiBIb3cgYWJvdXQgd2UgdXNlIHRoZSBuZXcgYWRkL2RlbHRhc2sgYXBpIHRvIGNvbmRp
dGlvbmFsbHkgYWRkIHRoZXNlDQo+IHRhc2tzIG9ubHkgd2hlbiBwdGVzdCBpcyBlbmFibGVkPw0K
DQpKdXN0IHdhbnRlZCB0byBkb3VibGUgY2hlY2ssIGJ5IGFkZC9kZWx0YXNrIHlvdSBhcmUgcmVm
ZXJyaW5nIHRvIGNhbGxpbmcgdGhlIGJiLmJ1aWxkLip0YXNrKCkgZnVuY3Rpb25zIGluIGFuIGFu
b255bW91cyBmdW5jdGlvbiBjb3JyZWN0Pw0KDQo+IA0KPiBUaGUgbnVtYmVyIG9mIGNvbmRpdGlv
bmFscyBpbiB0aGVyZSBpcyBnZXR0aW5nIHNpbGx5Li4uDQoNCldoZW4gSSByZXNwaW4gdGhlIHBh
dGNoIEkgd2lsbCByZWZhY3RvciB0aGUgb3RoZXIgY29uZGl0aW9uYWxzIHN1Y2ggdGhhdCBpdCBy
ZW1vdmVzIGFsbCBwdGVzdF9iYXNlIHRhc2tzIHdoZW4gZGlzYWJsZWQgaW5zdGVhZCBvZiB0aGUg
Y29uZGl0aW9uYWwgY2hlY2tzIGluIGVhY2ggdGFzay4NCg0KUmVnYXJkcywNCk5hdGhhbg0KDQoK
Cg==



