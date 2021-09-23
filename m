Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.2580.1632392831960143694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 03:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Nwpqq57g;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1632392833;
  x=1663928833;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=86InkUkfPVe3ftMs1ZSl+0j13tGiI3ql0xpHz79OWuM=;
  b=Nwpqq57gcmt/ElWNg7qwpcJKUluqgfE6jYTHCmkaiywDKcYuA9XBMpu2
   OTBzAPH0RBfJ/h8s3bqNoDg6wUhV4fkNMKUMteaQANyLfF9/9beBryEQn
   In0Uv1NpZylVkS9WJJx4jiuLf+QHnrxmTVL+hhizQ/kCXsy9RDQXxYYxw
   IrTztxinyf0BI12c0dwvKB28rWPk1xVD3jG5grlHwNY9kj//9rD4k4c6s
   jMUjFS8hR89Z/bLFTme7jC8lEbiz/FRSGutD8iNY7+3qh3qzWCtdDTbfD
   A4atDZxk314yytCE/1NfrkC23C/7SgPtHrP70CSUvWrcG+PehboQ3J11B
   A==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Konrad Weihmann <kweihmann@outlook.com>, Saul Wold
	<Saul.Wold@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "JPEWhacker@gmail.com"
	<JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH] create-spdx: Don't collect natives sources
Thread-Topic: [OE-core] [PATCH] create-spdx: Don't collect natives sources
Thread-Index: AQHXr/9ADT7X6igwDUCPi/FM7X7/0auxJw4AgAA800A=
Date: Thu, 23 Sep 2021 10:27:09 +0000
Message-ID: <1d6ac5dd187543559fc07e12be5f9536@axis.com>
References: <20210922221420.4115636-1-saul.wold@windriver.com>
 <AM9PR09MB4642D180F4CE760601B2A4D4A8A39@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB4642D180F4CE760601B2A4D4A8A39@AM9PR09MB4642.eurprd09.prod.outlook.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEtvbnJhZCBXZWlobWFubg0KPiBTZW50OiBkZW4gMjMg
c2VwdGVtYmVyIDIwMjEgMTA6MjQNCj4gVG86IFNhdWwgV29sZCA8U2F1bC5Xb2xkQHdpbmRyaXZl
ci5jb20+OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgSlBF
V2hhY2tlckBnbWFpbC5jb20NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGNyZWF0
ZS1zcGR4OiBEb24ndCBjb2xsZWN0IG5hdGl2ZXMgc291cmNlcw0KPiANCj4gDQo+IA0KPiBPbiAy
My4wOS4yMSAwMDoxNCwgU2F1bCBXb2xkIHdyb3RlOg0KPiA+IFdoZW4gdGhlIGNvbGxlY3RfZGVw
X3NvdXJjZXMoKSBydW5zLCBpdCBjb2xsZWN0cyBzb3VyY2VzIGZyb20gYm90aA0KPiBuYXRpdmUN
Cj4gPiBhbmQgbm9uLW5hdGl2ZSByZWNpcGVzLiBMYXRlciB3aGVuIHRoZSBHRU5FUkFURURfRlJP
TSBtYXRjaGluZyBvY2N1cnMgaXQNCj4gPiBtYXkgZmluZCB0aGUgZmlsZSAodmlhIGNoZWNrc3Vt
KSBmcm9tIHRoZSBuYXRpdmUgcmVjaXBlIHNpbmNlIGl0J3MgdGhlDQo+ID4gc2FtZSBjaGVja3N1
bSBhcyB0aGUgdGFyZ2V0IGZpbGUuIFRoZSB0aGF0IGFyZSBnZW5lcmF0ZWQgRG9jdW1lbnRSZWZz
DQo+ID4gcG9pbnQgdG8gdGhlIG5hdGl2ZSByZWNpcGUgcmF0aGVyIHRoYW4gdGhlIHRhcmdldCBy
ZWNpcGUgRG9jdW1lbnRSZWYuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYXVsIFdvbGQgPHNh
dWwud29sZEB3aW5kcml2ZXIuY29tPg0KPiA+IC0tLQ0KPiA+ICAgbWV0YS9jbGFzc2VzL2NyZWF0
ZS1zcGR4LmJiY2xhc3MgfCA0ICsrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMvY3JlYXRlLXNwZHguYmJj
bGFzcyBiL21ldGEvY2xhc3Nlcy9jcmVhdGUtDQo+IHNwZHguYmJjbGFzcw0KPiA+IGluZGV4IDNj
NzNjMjFjMDQuLjhmN2ZhZTQzZjEgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9jbGFzc2VzL2NyZWF0
ZS1zcGR4LmJiY2xhc3MNCj4gPiArKysgYi9tZXRhL2NsYXNzZXMvY3JlYXRlLXNwZHguYmJjbGFz
cw0KPiA+IEBAIC0zMzYsNiArMzM2LDEwIEBAIGRlZiBjb2xsZWN0X2RlcF9zb3VyY2VzKGQsIGRl
cF9yZWNpcGVzKToNCj4gPg0KPiA+ICAgICAgIHNvdXJjZXMgPSB7fQ0KPiA+ICAgICAgIGZvciBk
ZXAgaW4gZGVwX3JlY2lwZXM6DQo+ID4gKyAgICAgICAgIyBEb24ndCBjb2xsZWN0IHNvdXJjZXMg
ZnJvbSBuYXRpdmUgcmVjaXBlcyBhcyB0aGV5DQo+ID4gKyAgICAgICAgIyBtYXRjaCBub24tbmF0
aXZlIHNvdXJjZXMgYWxzby4NCj4gPiArICAgICAgICBpZiAiLW5hdGl2ZSIgaW4gZGVwLnJlY2lw
ZS5uYW1lOg0KPiANCj4gVGhhdCBsb29rcyBhIGJpdCB0b28gZnV6enkgdG8gbWUgLSBJIHdvdWxk
IGhhdmUgZXhwZWN0ZWQNCj4gDQo+IGlmIGRlcC5yZWNpcGUubmFtZS5lbmRzd2l0aCgiLW5hdGl2
ZSIpOg0KPiANCj4gaGVyZS4gT3RoZXJ3aXNlIHRoaXMgaXMgdmVyeSBwcm9uZSB0byBmYWxzZSBw
b3NpdGl2ZXMNCg0KQWJzb2x1dGVseS4gRS5nLiwgd2UgaGF2ZSBhIHJlY2lwZSBjYWxsZWQgY3Jh
dGUtbmF0aXZlLXRscyBmb3IgDQp0aGUgbmF0aXZlLXRscyBSdXN0IGNyYXRlLg0KDQpBdCB0aGUg
c2FtZSB0aW1lIEkgaGF0ZSBhbGwgdGhlc2UgaGFyZGNvZGVkIHRlc3RzIGZvciByZWNpcGUgdHlw
ZXMgDQphbGwgb3ZlciBPRSBDb3JlIGFzIHRoZXkgYXNzdW1lIG9ubHkgdGhlIHR5cGVzIHRoYXQg
YXJlIGluIE9FIENvcmUgDQpleGlzdCB3aXRob3V0IGFueSAoZWFzeSkgd2F5IG9mIGV4dGVuZGlu
ZyB0aGUgdGVzdHMgZm9yIG5vbi1PRSBDb3JlIA0KcmVjaXBlIHR5cGVzLg0KDQpXb3VsZCBpdCBp
bnN0ZWFkIGJlIHBvc3NpYmxlIHRvIGFkZCB0aGUgaXNfbmF0aXZlIGluIGRvX2NyZWF0ZV9zcGR4
KCkgDQp0byB0aGUgcmVjaXBlIG9iamVjdCBzbyB0aGF0IGl0IGlzIGF2YWlsYWJsZSBoZXJlPw0K
DQo+ID4gKyAgICAgICAgICAgIGNvbnRpbnVlDQo+ID4gICAgICAgICAgIHJlY2lwZV9maWxlcyA9
IHNldChkZXAucmVjaXBlLmhhc0ZpbGVzKQ0KPiA+DQo+ID4gICAgICAgICAgIGZvciBzcGR4X2Zp
bGUgaW4gZGVwLmRvYy5maWxlczoNCg0KLy9QZXRlcg0KDQo=
