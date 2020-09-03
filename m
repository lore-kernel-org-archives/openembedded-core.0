Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.7493.1599111643714414224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 22:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: leimaohui@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,385,1592841600"; 
   d="scan'208";a="98862738"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Sep 2020 13:40:34 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 6961D48990D2;
	Thu,  3 Sep 2020 13:40:33 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 3 Sep 2020 13:40:32 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::9e9:bb8f:d60e:bb94])
 by G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::9e9:bb8f:d60e:bb94%14]) with
 mapi id 15.00.1497.006; Thu, 3 Sep 2020 13:40:33 +0800
From: "leimaohui" <leimaohui@cn.fujitsu.com>
To: Chen Qi <Qi.Chen@windriver.com>, "Richard Purdie
 (richard.purdie@linuxfoundation.org)" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] rpm: fix nativesdk's default var location
Thread-Topic: [OE-core][PATCH] rpm: fix nativesdk's default var location
Thread-Index: AQHWWz5YJNaYuhiTF0yaVuN1wj1/5alWf/6g
Date: Thu, 3 Sep 2020 05:40:32 +0000
Message-ID: <a3f71396a0fa4f298cecd67fb3240e09@G08CNEXMBPEKD05.g08.fujitsu.local>
References: <20200716065632.33861-1-Qi.Chen@windriver.com>
In-Reply-To: <20200716065632.33861-1-Qi.Chen@windriver.com>
Accept-Language: en-AU, zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 6961D48990D2.A9159
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGksDQoNCkknbSBzb3JyeSBidXQgSSBkb24ndCB1bmRlcnN0YW5kIHRoaXMg
cGF0Y2guIA0KDQo+ICAgIGVycm9yOiBjYW5ub3Qgb3BlbiBQYWNrYWdlcyBp
bmRleCB1c2luZyBkYjUgLSBQZXJtaXNzaW9uIGRlbmllZCAoMTMpDQo+ICAg
IGVycm9yOiBjYW5ub3Qgb3BlbiBQYWNrYWdlcyBkYXRhYmFzZSBpbiAvdmFy
L2xpYi9ycG0NCg0KSSB0aGluayB0aGVzZSB0d28gZXJyb3IgbWVzc2FnZXMg
aXMganVzdCBiZWNhdXNlIGludm9raW5nIG5hdGl2ZXNkay1ycG0gd2l0aG91
dCAiLS1yb290PSI6DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQokIC9vcHQvcG9reS8zLjErc25hcHNob3Qv
c3lzcm9vdHMveDg2XzY0LXBva3lzZGstbGludXgvdXNyL2Jpbi9ycG0gLXFw
bHYgYXR0ci0yLjQuNDgtcjAuY29yZTJfNjQucnBtDQplcnJvcjogY2Fubm90
IG9wZW4gUGFja2FnZXMgaW5kZXggdXNpbmcgZGI1IC0gUGVybWlzc2lvbiBk
ZW5pZWQgKDEzKQ0KZXJyb3I6IGNhbm5vdCBvcGVuIFBhY2thZ2VzIGRhdGFi
YXNlIGluIC9vcHQvcG9reS8zLjErc25hcHNob3Qvc3lzcm9vdHMveDg2XzY0
LXBva3lzZGstbGludXgvdmFyL2xpYi9ycG0NCmRyd3hyLXhyLXggICAgMiBy
b290ICAgICByb290ICAgICAgICAgICAgICAgICAgICAgICAgMCBKdW4gMTkg
IDIwMTggL2V0Yw0KLXJ3LXItLXItLSAgICAxIHJvb3QgICAgIHJvb3QgICAg
ICAgICAgICAgICAgICAgICAgNjQyIEp1biAxOSAgMjAxOCAvZXRjL3hhdHRy
LmNvbmYNCi4uLg0KDQpTYW1lIGFzIG5hdGl2ZXNkay1nY2MgYWRkaW5nICIt
LXN5c3Jvb3Q9IiwgbmF0aXZlc2RrLXJwbSBzaG91bGQgYmUgaW52b2tlZCB3
aXRoICItLXJvb3Q9IjoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQokIC9vcHQvcG9reS8zLjErc25hcHNo
b3Qvc3lzcm9vdHMveDg2XzY0LXBva3lzZGstbGludXgvdXNyL2Jpbi9ycG0g
LXFwbHYgYXR0ci0yLjQuNDgtcjAuY29yZTJfNjQucnBtIC0tcm9vdD0vaG9t
ZS9sZWltaC90ZXN0LXJvb3Rmcy8NCmRyd3hyLXhyLXggICAgMiByb290ICAg
ICByb290ICAgICAgICAgICAgICAgICAgICAgICAgMCBKdW4gMTkgIDIwMTgg
L2V0Yw0KLXJ3LXItLXItLSAgICAxIHJvb3QgICAgIHJvb3QgICAgICAgICAg
ICAgICAgICAgICAgNjQyIEp1biAxOSAgMjAxOCAvZXRjL3hhdHRyLmNvbmYN
Ci4uLi4uLg0KDQpCdXQgbm93IHdpdGggdGhpcyBwYXRjaCwgIi0tcm9vdD0i
IGRvZXNuJ3Qgd29yayBmb3IgbmF0aXZlc2RrLXJwbS4gRXZlbiBJIHVzZSBu
YXRpdmVzZGstcnBtIHdpdGggIi0tcm9vdD0iLCB0aGUgZGF0YWJhc2Ugb2Yg
bmF0aXZlc2RrLXJwbSBzdGlsbCBpcyB3cml0dGVuIHRvICR7U0RLX0lOVEFM
TF9ESVJ9L3Zhci9saWIvcnBtLywgIG5vdCB0aGUgZGlyZWN0b3J5IHRoYXQg
SSBzZXQgYnkgIi0tcm9vdD0iLg0KDQoNCkJlc3QgcmVnYXJkcw0KTGVpDQoN
Cg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5l
bWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBC
ZWhhbGYgT2YgQ2hlbiBRaQ0KPiBTZW50OiBUaHVyc2RheSwgSnVseSAxNiwg
MjAyMCAyOjU3IFBNDQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFtPRS1jb3JlXVtQQVRDSF0g
cnBtOiBmaXggbmF0aXZlc2RrJ3MgZGVmYXVsdCB2YXIgbG9jYXRpb24NCj4g
DQo+IEZvciBub3csIHRoZSBuYXRpdmVzZGstcnBtJ3MgJV92YXIgaW4gL3Vz
ci9saWIvcnBtL21hY3JvcyBpcyAnL3ZhcicuIFRoaXMgaXMNCj4gY2F1c2lu
ZyBlcnJvciB3aGVuIHJ1bm5pbmcgYHJwbSAtcXBsdiBBLnJwbScuDQo+IA0K
PiAgICBlcnJvcjogY2Fubm90IG9wZW4gUGFja2FnZXMgaW5kZXggdXNpbmcg
ZGI1IC0gUGVybWlzc2lvbiBkZW5pZWQgKDEzKQ0KPiAgICBlcnJvcjogY2Fu
bm90IG9wZW4gUGFja2FnZXMgZGF0YWJhc2UgaW4gL3Zhci9saWIvcnBtDQo+
IA0KPiBUaGUgcnBtIGluIFNESyBzaG91bGQgYmUgdXNpbmcgaXRzIG93biBk
YXRhYmFzZS4gU28gd2Ugc2hvdWxkIHJlbW92ZSB0aGlzDQo+IGNvbmZpZ3Vy
ZSBvcHRpb24sIGxldHRpbmcgdGhlIFNESydzIG5hdGl2ZSBzeXNyb290IHBy
ZWZpeCB0byBiZSB0aGVyZSBpbiAlX3Zhci4gSW4NCj4gZmFjdCwgJyVfdXNy
JyBpbiBtYWNyb3MgaGFzIGFscmVhZHkgZ290IHRoZSBwcmVmaXguDQo+IEFm
dGVyIHRoaXMgY2hhbmdlLCB3ZSBoYXZlIGluIHRoZSBtYWNyb3MgZmlsZSBs
aW5lcyBsaWtlIGJlbG93Lg0KPiANCj4gIiIiDQo+ICVfdXNyICAgICAgICAg
ICAgICAgICAgIC9vcHQvd2luZHJpdmVyL3dybGludXgvMjAuMjkvc3lzcm9v
dHMveDg2XzY0LXdybGludXhzZGstDQo+IGxpbnV4L3Vzcg0KPiAlX3VzcnNy
YyAgICAgICAgICAgICAgICAle191c3J9L3NyYw0KPiAlX3ZhciAgICAgICAg
ICAgICAgICAgICAvb3B0L3dpbmRyaXZlci93cmxpbnV4LzIwLjI5L3N5c3Jv
b3RzL3g4Nl82NC13cmxpbnV4c2RrLQ0KPiBsaW51eC92YXINCj4gIiIiDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZl
ci5jb20+DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS9y
cG1fNC4xNS4xLmJiIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS9ycG1fNC4xNS4xLmJiIGIvbWV0
YS9yZWNpcGVzLQ0KPiBkZXZ0b29scy9ycG0vcnBtXzQuMTUuMS5iYg0KPiBp
bmRleCBjYmUxYWNmZmUyLi5iNWEwYWM5MzgyIDEwMDY0NA0KPiAtLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnBtL3JwbV80LjE1LjEuYmINCj4gKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JwbS9ycG1fNC4xNS4xLmJiDQo+
IEBAIC02Nyw3ICs2Nyw3IEBAIEVYVFJBX09FQ09ORl9hcHBlbmRfbGliYy1t
dXNsID0gIiAtLWRpc2FibGUtbmxzIC0tDQo+IGRpc2FibGUtb3Blbm1wIg0K
PiAgIyBEaXNhYmxlIGRidXMgZm9yIG5hdGl2ZSwgc28gdGhhdCBycG0gZG9l
c24ndCBhdHRlbXB0IHRvIGluaGliaXQgc2h1dGRvd24gdmlhDQo+IHNlc3Np
b24gZGJ1cyBldmVuIHdoZW4gcGx1Z2lucyBzdXBwb3J0IGlzIGVuYWJsZWQu
DQo+ICAjIEFsc28gZGlzYWJsZSBwbHVnaW5zIGJ5IGRlZmF1bHQgZm9yIG5h
dGl2ZS4NCj4gIEVYVFJBX09FQ09ORl9hcHBlbmRfY2xhc3MtbmF0aXZlID0g
IiAtLXN5c2NvbmZkaXI9L2V0YyAtLQ0KPiBsb2NhbHN0YXRlZGlyPS92YXIg
LS1kaXNhYmxlLXBsdWdpbnMiDQo+IC1FWFRSQV9PRUNPTkZfYXBwZW5kX2Ns
YXNzLW5hdGl2ZXNkayA9ICIgLS1zeXNjb25mZGlyPS9ldGMgLS0NCj4gbG9j
YWxzdGF0ZWRpcj0vdmFyIC0tZGlzYWJsZS1wbHVnaW5zIg0KPiArRVhUUkFf
T0VDT05GX2FwcGVuZF9jbGFzcy1uYXRpdmVzZGsgPSAiIC0tc3lzY29uZmRp
cj0vZXRjIC0tZGlzYWJsZS0NCj4gcGx1Z2lucyINCj4gDQo+ICBCQkNMQVNT
RVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiDQo+IA0KPiAtLQ0KPiAyLjE3
LjENCj4gDQo+IA0KDQoKCg==
