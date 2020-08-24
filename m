Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.187536.1598239294167005375
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 20:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +gjr6TIAVzwGvUtg2k4ehonLiL/WfkusHwvYXjfSTZCk4743QUszOhLi3ziapULKNfaGoVHY1J
 hD+p+olTGa0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="220103754"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="220103754"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2020 20:21:33 -0700
IronPort-SDR: 812hIgzs3xQPzCuCJOykpzNZFG8bkoR9fVy1NXXT+SnMTTeMERIyRZOWH6V2no79IyCVaLDEdN
 6Jx8OCwahQfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="402131429"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2020 20:21:32 -0700
Received: from pgsmsx603.gar.corp.intel.com (10.108.199.138) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 24 Aug 2020 11:21:31 +0800
Received: from kmsmsx153.gar.corp.intel.com (172.21.73.88) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 24 Aug 2020 11:21:31 +0800
Received: from pgsmsx111.gar.corp.intel.com ([169.254.2.97]) by
 KMSMSX153.gar.corp.intel.com ([169.254.5.77]) with mapi id 14.03.0439.000;
 Mon, 24 Aug 2020 11:21:30 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] linux-yocto/5.8: update to v5.8.2
Thread-Topic: [OE-core] [PATCH 3/3] linux-yocto/5.8: update to v5.8.2
Thread-Index: AQHWd+2ptxpiu9LkEkCJs3SiBP/PYalDRCkAgAKY0oCAADNugIAABO+A
Date: Mon, 24 Aug 2020 03:21:30 +0000
Message-ID: <227946a676d142f2a1d15ba3b8eaab85800212fc.camel@intel.com>
References: <cover.1598036283.git.bruce.ashfield@gmail.com>
	 <c9d0bb421a2f7c6783f2c2bbf47c95da5537985d.1598036283.git.bruce.ashfield@gmail.com>
	 <CAMKF1sr-JshybsWtqUv9ACo873VoabioyzQipS8EFmeHB96XZA@mail.gmail.com>
	 <4b7d45f691efa80b05f3405cbf716a2bce1c13d8.camel@intel.com>
	 <CADkTA4NApf+0cxP21pQ=JykJbazGk1M-si6etrqPFvQ0oE6STw@mail.gmail.com>
In-Reply-To: <CADkTA4NApf+0cxP21pQ=JykJbazGk1M-si6etrqPFvQ0oE6STw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.145.178]
MIME-Version: 1.0
Return-Path: anuj.mittal@intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D75AA8E9EBCBE840816B29688FCDC905@intel.com>
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDIwLTA4LTIzIGF0IDIzOjAzIC0wNDAwLCBCcnVjZSBBc2hmaWVsZCB3cm90ZToN
Cj4gDQo+IA0KPiBPbiBTdW4sIEF1ZyAyMywgMjAyMCBhdCA3OjU5IFBNIE1pdHRhbCwgQW51aiA8
YW51ai5taXR0YWxAaW50ZWwuY29tPg0KPiB3cm90ZToNCj4gPiBPbiBTYXQsIDIwMjAtMDgtMjIg
YXQgMDE6MjAgLTA3MDAsIEtoZW0gUmFqIHdyb3RlOg0KPiA+ID4gSGkgQnJ1Y2UNCj4gPiA+IA0K
PiA+ID4gT24gcnY2NCBJIGFtIHNlZWluZyBhbiBlcnJvciB3aGlsZSBidWlsZGluZyBsdHRuZw0K
PiA+ID4gDQo+ID4gPiAgI2Vycm9yICJMVFRuZy1tb2R1bGVzIHJlcXVpcmVzIENPTkZJR19LUFJP
QkVTIG9uIGtlcm5lbHMgPj0NCj4gPiA1LjcuMCINCj4gPiA+ID4gICAgMjAgfCAjIGVycm9yICJM
VFRuZy1tb2R1bGVzIHJlcXVpcmVzIENPTkZJR19LUFJPQkVTIG9uDQo+ID4ga2VybmVscw0KPiA+
ID4gPiA+PSA1LjcuMCINCj4gPiA+ID4gICAgICAgfCAgIF5+fn5+DQo+ID4gPiANCj4gPiA+IEkg
d29uZGVyIGlmIHdlIG5lZWQgdG8gdXBkYXRlIGRlZmNvbmZpZw0KPiA+IA0KPiA+IEkgc2VlIHRo
ZSBzYW1lIGZhaWx1cmUgd2l0aCBsaW51eC15b2N0by1ydCBrZXJuZWwgYXMgd2VsbC4NCj4gPiAN
Cj4gDQo+IC1ydCBkb2Vzbid0IGVuYWJsZSBrcHJvYmVzLCBzbyB5ZXMsIHdpdGggdGhlIGxhdGVz
dCBsdHRuZywgaXQgd291bGQNCj4gdHJpZ2dlciB0aGF0IGlzc3VlLg0KPiANCj4gVHJhZGl0aW9u
YWxseSAtcnQgaGFkIGlzc3VlcyB3aXRoIGtwcm9iZXMsIGJ1dCB0aGF0IGlzIHJlc29sdmVkIG5v
dy4NCj4gUmF0aGVyIHRoYW4gYWRkaW5nIHRoZSBvdmVyaGVhZCwgdGhlIGVuYWJsZW1lbnQgaXMg
c3RpbGwgb24gZGVtYW5kDQo+IGZvciAtcnQuDQo+IA0KPiBUaGF0IGJlaW5nIHNhaWQsIGl0IGxv
b2tzIGxpa2UgbHR0bmcgaGFzIGZvcmNlZCBteSBoYW5kLCBJIGp1c3QNCj4gZW5hYmxlZCB0aGUg
Y29uZmlnIGJ5IGRlZmF1bHQgaW4gLXJ0IGFuZCBkb24ndCBzZWUgYW55IGlzc3Vlcy4gDQo+IA0K
PiBJJ2xsIHNlbmQgYSBwYXRjaCBvbiBNb25kYXkgdG8gZml4IGl0IHVwLg0KDQoNClRoYW5rcyBC
cnVjZS4gU2hvdWxkIFBSRUZFUlJSRURfVkVSU0lPTiBvZiBsaW51eC15b2N0by1ydCBzaG91bGQg
YWxzbw0KYmUgZXhwbGljaXRseSBzZXQgbGlrZSB0aGF0IG9mIGxpbnV4LXlvY3RvPyBJIHdhcyB3
b25kZXJpbmcgaWYgdGhlcmUgaXMNCmEgc3BlY2lmaWMgcmVhc29uIHdoeSB3ZSBkb24ndCBzZXQg
dmVyc2lvbiBmb3IgdGhhdCBrZXJuZWwgZm9yIHFlbXUgYW5kDQpCU1BzPw0KDQpUaGFua3MsDQoN
CkFudWoNCg==
