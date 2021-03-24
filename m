Received: from mx01.hilscher.com (mx01.hilscher.com [46.189.19.166])
 by mx.groups.io with SMTP id smtpd.web12.1919.1616564471954918887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 22:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: hilscher.com, ip: 46.189.19.166, mailfrom: mtrensch@hilscher.com)
Received: from maiser03.hilscher.local (192.168.100.44) by
 maiser03.hilscher.local (192.168.100.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 24 Mar 2021 06:41:07 +0100
Received: from maiser03.hilscher.local ([::1]) by maiser03.hilscher.local
 ([::1]) with mapi id 15.01.2176.009; Wed, 24 Mar 2021 06:41:07 +0100
From: "Michael Trensch" <mtrensch@hilscher.com>
To: Steve Sakoman <steve@sakoman.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] linux-firmware: Fix packaging
Thread-Topic: [OE-core] [PATCH] linux-firmware: Fix packaging
Thread-Index: AQHXGjVe76TuSylZjUWTIfF9gUDWeqqG1lMAgAAeeICAAAQ2gIAABnwAgAub54A=
Date: Wed, 24 Mar 2021 05:41:07 +0000
Message-ID: <75139c05-c7b2-9318-d126-61a163891320@hilscher.com>
References: <6409e1bf-9400-886e-cd25-76b52456c8ed@hilscher.com>
 <5dcf9ff95e74274d5cebcfe34a0c9de4ce9e886e.camel@linuxfoundation.org>
 <168e0cb1-582c-8c14-b394-d23f1119178a@hilscher.com>
 <CAOSpxdZxridvyrtK+Zc2pzjVbNM99nsVbAWKN05uU5Ur7R542Q@mail.gmail.com>
 <2fc095ba-4858-58d4-ad2f-3436af3cea5d@hilscher.com>
In-Reply-To: <2fc095ba-4858-58d4-ad2f-3436af3cea5d@hilscher.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
x-originating-ip: [84.147.84.224]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4AE1EDEAD73CD4DB05FD5AECC88206C@hilscher.com>
Content-Transfer-Encoding: base64

DQoNCk9uIDE2LjAzLjIwMjEgMjE6MjQsIE1pY2hhZWwgVHJlbnNjaCB3cm90ZToNCj4+IEFjdHVh
bGx5IGl0IGRvZXNuJ3QgYXBwbHkgdG8gZHVuZmVsbCBlaXRoZXIgKGR1bmZlbGwgYW5kIG1hc3Rl
ciBhcmUNCj4+IGJvdGggYXQgdmVyc2lvbiAyMDIxMDIwOCkNCj4+DQo+PiBTbyBiZXN0IHRvIHN1
Ym1pdCBmb3IgbWFzdGVyIGFuZCBJIHdpbGwgY2hlcnJ5LXBpY2sgdG8gZHVuZmVsbC4NCj4+DQo+
PiBUaGFua3MgZm9yIGZpeGluZyB0aGlzIQ0KPj4NCj4+IFN0ZXZlDQo+DQo+IEkgdGhpbmsgaXQg
YnJva2Ugc29tZWhvdyB3aGVuIHRyYW5zZmVycmluZyBpdCB0byBUaHVuZGVyYmlyZCBmb3IgbWFp
bGluZw0KPiBpdC4gSSBjYW5ub3QgZGlyZWN0bHkgYWNjZXNzIG91ciBtYWlsIHNlcnZlciB2aWEg
U01UUC8iZ2l0IHNlbmQtZW1haWwiIHNvIEkNCj4gdG9vayBhIGRldG91ciB2aWEgVGh1bmRlcmJp
cmQgYW5kIGV4Y2hhbmdlLiBQcm9iYWJseSB0aGlzIGJyb2tlIHRoZSBwYXRjaCwgYXMgbXkNCj4g
bG9jYWwgcGF0Y2ggZmlsZSBzdGlsbCBhcHBsaWVzIG9uIGJvdGggKGR1bmZlbGwgYW5kIG1hc3Rl
cikuDQo+DQo+IFNvcnJ5IGZvciB0aGUgY29uZnVzaW9uIC8gYWRkaXRpb25hbCB3b3JrLg0KPg0K
DQpJIGRpZCByZXNlbmQgaXQgYXMgUGF0Y2ggVjIgKGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTQ5NTg2KQ0KSG9wZSB0aGF0IGl0IGlz
IHdvcmtpbmcgb2sgbm93LCBhdCBsZWFzdCBpdCBkb2VzIGFwcGx5IGZvciBtZSBub3csIHdoZW4g
ZGlyZWN0bHkgY29waWVkIGZyb20gdGhlIGxpc3QgLyB3ZWIgaW50ZXJmYWNlLg0KDQpNaWNoYWVs
DQoNCkhpbHNjaGVyIEdlc2VsbHNjaGFmdCBmw7xyIFN5c3RlbWF1dG9tYXRpb24gbWJIICAgfCAg
UmhlaW5zdHJhc3NlIDE1ICB8ICA2NTc5NSBIYXR0ZXJzaGVpbSAgfCAgR2VybWFueSAgfCAgd3d3
LmhpbHNjaGVyLmNvbTxodHRwOi8vd3d3LmhpbHNjaGVyLmNvbT4NClNpdHogZGVyIEdlc2VsbHNj
aGFmdCAvIHBsYWNlIG9mIGJ1c2luZXNzOiBIYXR0ZXJzaGVpbSAgfCAgR2VzY2jDpGZ0c2bDvGhy
ZXIgLyBtYW5hZ2luZyBkaXJlY3RvcjogU2ViYXN0aWFuIEhpbHNjaGVyLCBIYW5zLUrDvHJnZW4g
SGlsc2NoZXINCkhhbmRlbHNyZWdpc3RlciAvIGNvbW1lcmNpYWwgcmVnaXN0ZXI6IEZyYW5rZnVy
dCBCIDI2ODczICB8ICBVc3QuIElkbnIuIC8gVkFUIE5vLjogREUxMTM4NTI3MTUNClJlZ2lzdGVy
Z2VyaWNodCAvIHJlZ2lzdGVyIGNvdXJ0OiBBbXRzZ2VyaWNodCBGcmFua2Z1cnQvTWFpbg0KDQpJ
bXBvcnRhbnQgSW5mb3JtYXRpb246DQpUaGlzIGUtbWFpbCBtZXNzYWdlIGluY2x1ZGluZyBpdHMg
YXR0YWNobWVudHMgY29udGFpbnMgY29uZmlkZW50aWFsIGFuZCBsZWdhbGx5IHByb3RlY3RlZCBp
bmZvcm1hdGlvbiBzb2xlbHkgaW50ZW5kZWQgZm9yIHRoZSBhZGRyZXNzZWUuIElmIHlvdSBhcmUg
bm90IHRoZSBpbnRlbmRlZCBhZGRyZXNzZWUgb2YgdGhpcyBtZXNzYWdlLCBwbGVhc2UgY29udGFj
dCB0aGUgYWRkcmVzc2VyIGltbWVkaWF0ZWx5IGFuZCBkZWxldGUgdGhpcyBtZXNzYWdlIGluY2x1
ZGluZyBpdHMgYXR0YWNobWVudHMuIFRoZSB1bmF1dGhvcml6ZWQgZGlzc2VtaW5hdGlvbiwgY29w
eWluZyBhbmQgY2hhbmdlIG9mIHRoaXMgZS1tYWlsIGFyZSBzdHJpY3RseSBmb3JiaWRkZW4uIFRo
ZSBhZGRyZXNzZXIgc2hhbGwgbm90IGJlIGxpYWJsZSBmb3IgdGhlIGNvbnRlbnQgb2Ygc3VjaCBj
aGFuZ2VkIGUtbWFpbHMuDQoNCldpY2h0aWdlciBIaW53ZWlzOg0KRGllc2UgRS1NYWlsIGVpbnNj
aGxpZcOfbGljaCBpaHJlciBBbmjDpG5nZSBlbnRow6RsdCB2ZXJ0cmF1bGljaGUgdW5kIHJlY2h0
bGljaCBnZXNjaMO8dHp0ZSBJbmZvcm1hdGlvbmVuLCBkaWUgbnVyIGbDvHIgZGVuIEFkcmVzc2F0
ZW4gYmVzdGltbXQgc2luZC4gU29sbHRlbiBTaWUgbmljaHQgZGVyIGJlemVpY2huZXRlIEFkcmVz
c2F0IHNlaW4sIHNvIHRlaWxlbiBTaWUgZGllcyBiaXR0ZSBkZW0gQWJzZW5kZXIgdW1nZWhlbmQg
bWl0IHVuZCBsw7ZzY2hlbiBTaWUgZGllc2UgTmFjaHJpY2h0IHVuZCBpaHJlIEFuaMOkbmdlLiBE
aWUgdW5iZWZ1Z3RlIFdlaXRlcmdhYmUsIGRhcyBBbmZlcnRpZ2VuIHZvbiBLb3BpZW4gdW5kIGpl
ZGUgVmVyw6RuZGVydW5nIGRlciBFLU1haWwgaXN0IHVudGVyc2FndC4gRGVyIEFic2VuZGVyIGhh
ZnRldCBuaWNodCBmw7xyIEluaGFsdGUgdm9uIHZlcsOkbmRlcnRlbiBFLU1haWxzLg0K
