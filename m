Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.3928.1612832412617263670
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 17:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,163,1610380800"; 
   d="scan'208";a="104348531"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Feb 2021 09:00:06 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id CB3994CE6F92;
	Tue,  9 Feb 2021 09:00:04 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 9 Feb 2021 09:00:03 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::102a:9d25:2025:53fa])
 by G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::102a:9d25:2025:53fa%14]) with
 mapi id 15.00.1497.010; Tue, 9 Feb 2021 09:00:03 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Steve Sakoman <steve@sakoman.com>, Ross Burton <ross@burtonini.com>
Subject: Re: [OE-core] [PATCH] qemu: CVE-2018-18438 Security Advisory
Thread-Topic: [OE-core] [PATCH] qemu: CVE-2018-18438 Security Advisory
Thread-Index: AQHW8MeuIWVkLH95mEeznRznFMUf0qpPG2wg
Date: Tue, 9 Feb 2021 01:00:03 +0000
Message-ID: <2c6f7db933684f339dfec0a2251f6e56@G08CNEXMBPEKD05.g08.fujitsu.local>
References: <1611299746-47965-1-git-send-email-wangmy@cn.fujitsu.com>
	 <165C8656186C2541.12911@lists.openembedded.org>
 <1353ad48939fcde5e0a549020fec51553560dace.camel@linuxfoundation.org>
In-Reply-To: <1353ad48939fcde5e0a549020fec51553560dace.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.33]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: CB3994CE6F92.AB0BD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KPiBJIHdlbnQgZGlnZ2luZyBhbmQgd2FzIHBvaW50
ZWQgdG8NCj4gDQo+IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93
X2J1Zy5jZ2k/aWQ9MTYwOTAxNQ0KSW4gdGhlIGRpc2N1c3Npb24sICJwYXRj
aGVzIHdlcmUgYXBwbGllZCB1cHN0cmVhbSB0byBwcmV2ZW50IGZ1dHVyZSBj
aGFuZ2VzIGludHJvZHVjaW5nIHN1Y2ggZmxhbWVzIiB3YXMgZXhwbGFpbmVk
LiANCkl0IHNlZW1zIHRoYXQgQ1ZFIGRvZXNuJ3QgdGhpbmsgdGhpcyBpcyBh
IHByb2JsZW0sIGJ1dCB0aGUgdXBzdHJlYW0gc3RpbGwgYXBwbGllZCB0aGlz
IHBhdGNoLiANCkluIHRoaXMgY2FzZSwgaXMgaXQgbmVlZCB0byBzdWJtaXQg
Q1ZFIHBhdGNoPyBPciBzdWJtaXQgaXQgYXMgYSBub3JtYWwgcGF0Y2g/DQoN
CkJlc3QgcmVnYXJkcywNCldhbmdteQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1
cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTZW50OiBGcmlkYXksIEph
bnVhcnkgMjIsIDIwMjEgMTA6MDYgUE0NCj4gVG86IFdhbmcsIE1pbmd5dS/n
josg6bij55GcIDx3YW5nbXlAY24uZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBTdGV2
ZSBTYWtvbWFuIDxzdGV2ZUBzYWtvbWFuLmNvbT47IFJvc3MgQnVydG9uDQo+
IDxyb3NzQGJ1cnRvbmluaS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29y
ZV0gW1BBVENIXSBxZW11OiBDVkUtMjAxOC0xODQzOCBTZWN1cml0eSBBZHZp
c29yeQ0KPiANCj4gT24gRnJpLCAyMDIxLTAxLTIyIGF0IDEwOjE0ICswMDAw
LCBSaWNoYXJkIFB1cmRpZSB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyB3cm90ZToNCj4gPiBPbiBGcmksIDIwMjEtMDEtMjIgYXQgMTU6MTUgKzA4
MDAsIFdhbmcgTWluZ3l1IHdyb3RlOg0KPiA+ID4NCj4gPiA+IGRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L0NWRS0yMDE4
LTE4NDM4LnBhdGNoDQo+ID4gPiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUvQ1ZFLTIwMTgtMTg0MzgucGF0Y2gNCj4gPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+ID4gPiBpbmRleCAwMDAwMDAwMDAwLi5iNmNlOGZh
NTdkDQo+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiArKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L0NWRS0yMDE4LTE4NDM4LnBhdGNo
DQo+ID4gPiBAQCAtMCwwICsxLDY5NyBAQA0KPiA+ID4gK0Zyb206CVBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpDQo+ID4gPiArU3ViamVjdDoJW1FlbXUtZGV2
ZWxdIFtQQVRDSCB2MiAwNy8xMV0gY2hhcmRldjogTGV0IElPUmVhZEhhbmRs
ZXINCj4gdXNlIHVuc2lnbmVkIHR5cGUNCj4gPiA+ICtEYXRlOglGcmksIDEy
IE9jdCAyMDE4IDAyOjIyOjEzICswMjAwDQo+ID4gPiArDQo+ID4gPiArVGhl
IG51bWJlciBvZiBieXRlcyBjYW4gbm90IGJlIG5lZ2F0aXZlIG5vciB6ZXJv
Lg0KPiA+ID4gKw0KPiA+ID4gK0ZpeGVkIDIgZm9ybWF0IHN0cmluZzoNCj4g
PiA+ICstIGh3L2NoYXIvc3BhcHJfdnR5LmMNCj4gPiA+ICstIGh3L3VzYi9j
Y2lkLWNhcmQtcGFzc3RocnUuYw0KPiA+DQo+ID4gTm8gVXBzdHJlYW0tU3Rh
dHVzLg0KPiA+DQo+ID4gSXRzIGFsc28gdW5jbGVhciB3aGF0IHRoZSBzdGF0
dXMgb2YgdGhlc2UgcGF0Y2hlcyBpcyB1cHN0cmVhbSwgdGhleSdyZQ0KPiA+
IHN1Ym1pdHRlZCwgdGhlcmUgd2FzIGRpc2N1c3Npb24gYnV0IHRoZXkgd2Vy
ZW4ndCBtZXJnZWQuIEknbSBhbHNvDQo+ID4gd29uZGVyaW5nIHdoZXRoZXIg
dGhlcmUgYXJlIG1vcmUgb2YgdGhlIDExIHBhdGNoZXMgaW4gdGhlIHNlcmll
cw0KPiA+IG5lZWRlZCB0byBhZGRyZXNzIHRoZSBpc3N1ZT8gT3IgcGVyaGFw
cyB0aGUgaXNzdWUgd2FzIHVsdGltYXRlbHkNCj4gPiBhZGRyZXNzZWQgYnkg
b3RoZXIgcGF0Y2hlcz8NCj4gDQo+IEkgd2VudCBkaWdnaW5nIGFuZCB3YXMg
cG9pbnRlZCB0bw0KPiANCj4gaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29t
L3Nob3dfYnVnLmNnaT9pZD0xNjA5MDE1DQo+IA0KPiBpLmUuIHFlbXUgdXBz
dHJlYW0gYW5kIFJlZGhhdCBiZWxpZXZlIHRoaXMgaXMgbm90IGFuIGlzc3Vl
DQo+IA0KPiBTdGV2ZTogV2hhdCBkbyB3ZSBkbyBoZXJlPyBXaGl0ZWxpc3Q/
IERvIHdlIHJlcG9ydCB1cHN0cmVhbSBzb21laG93Pw0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gUmljaGFyZA0KPiANCj4gDQoNCgoK
