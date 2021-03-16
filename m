Received: from mx01.hilscher.com (mx01.hilscher.com [46.189.19.166])
 by mx.groups.io with SMTP id smtpd.web10.6.1615923963273850648
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 12:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: hilscher.com, ip: 46.189.19.166, mailfrom: mtrensch@hilscher.com)
Received: from maiser03.hilscher.local (192.168.100.44) by
 maiser03.hilscher.local (192.168.100.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 16 Mar 2021 20:45:59 +0100
Received: from maiser03.hilscher.local ([::1]) by maiser03.hilscher.local
 ([::1]) with mapi id 15.01.2176.009; Tue, 16 Mar 2021 20:45:59 +0100
From: "Michael Trensch" <mtrensch@hilscher.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] linux-firmware: Fix packaging
Thread-Topic: [OE-core] [PATCH] linux-firmware: Fix packaging
Thread-Index: AQHXGjVe76TuSylZjUWTIfF9gUDWeqqG1lMAgAAeeIA=
Date: Tue, 16 Mar 2021 19:45:59 +0000
Message-ID: <168e0cb1-582c-8c14-b394-d23f1119178a@hilscher.com>
References: <6409e1bf-9400-886e-cd25-76b52456c8ed@hilscher.com>
 <5dcf9ff95e74274d5cebcfe34a0c9de4ce9e886e.camel@linuxfoundation.org>
In-Reply-To: <5dcf9ff95e74274d5cebcfe34a0c9de4ce9e886e.camel@linuxfoundation.org>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
x-originating-ip: [84.147.84.224]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3C228D456F33C428DE5EDD1D1C6A4EB@hilscher.com>
Content-Transfer-Encoding: base64

DQoNCk9uIDE2LjAzLjIwMjEgMTg6NTYsIFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPiBPbiBUdWUs
IDIwMjEtMDMtMTYgYXQgMDc6MjQgKzAwMDAsIE1pY2hhZWwgVHJlbnNjaCB3cm90ZToNCj4+IFVw
c3RyZWFtIGRpcmVjdG9yeSBsYXlvdXQgaGFzIGNoYW5nZWQgYWZ0ZXIgdXBkYXRlIGluIGNvbW1p
dCAyMGE5ODNiOWM0MDViNDgzMTUyZjFjNjAwZDc2N2UwNDY4M2RmYWJmLA0KPj4gICByZXN1bHRp
bmcgaW4gc29tZSBwYWNrYWdlIHRvIHB1bGwgaW4gbGludXgtZmlybXdhcmUgYmFzZSBwYWNrYWdl
Lg0KPj4gVGhpcyBtYXkgY2F1c2UgYW4gaW1hZ2Ugc2l6ZSBpbmNyZWFzZSBvZiBhcHByb3hpbWF0
ZWx5IDcwME1CLg0KPg0KPiBUaGlzIHBhdGNoIGRvZXNuJ3Qgc2VlbSB0byBhcHBseSBhZ2FpbnN0
IG1hc3RlciwgY291bGQgeW91IHJlYmFzZQ0KPiBhbmQgcmVzZW5kIHBsZWFzZT8NCg0KU29ycnks
IEkgZm9yZ290IHRvIG1lbnRpb24gdGhpcyBvbmUgd2FzIGZvciBkdW5mZWxsLiBTaGFsbCBJIHJl
c2VuZCB0aGlzDQpvbmUgd2l0aCBhIGR1bmZlbGwgbWFya2VyIG9yIGlzIGl0IE9LLCB3aXRoIHRo
aXMgYW5zd2VyLg0KDQpBZGRpdGlvbmFsbHkgSSB3aWxsIHJlLWNoZWNrIGlmIG1hc3RlciBpcyBh
bHNvIGFmZmVjdGVkIGFuZCBzZW5kIGEgcGF0Y2gNCmlmIG5lY2Vzc2FyeS4NCg0KUmVnYXJkcywN
Cg0KTWljaGFlbA0KDQpIaWxzY2hlciBHZXNlbGxzY2hhZnQgZsO8ciBTeXN0ZW1hdXRvbWF0aW9u
IG1iSCAgIHwgIFJoZWluc3RyYXNzZSAxNSAgfCAgNjU3OTUgSGF0dGVyc2hlaW0gIHwgIEdlcm1h
bnkgIHwgIHd3dy5oaWxzY2hlci5jb208aHR0cDovL3d3dy5oaWxzY2hlci5jb20+DQpTaXR6IGRl
ciBHZXNlbGxzY2hhZnQgLyBwbGFjZSBvZiBidXNpbmVzczogSGF0dGVyc2hlaW0gIHwgIEdlc2No
w6RmdHNmw7xocmVyIC8gbWFuYWdpbmcgZGlyZWN0b3I6IFNlYmFzdGlhbiBIaWxzY2hlciwgSGFu
cy1Kw7xyZ2VuIEhpbHNjaGVyDQpIYW5kZWxzcmVnaXN0ZXIgLyBjb21tZXJjaWFsIHJlZ2lzdGVy
OiBGcmFua2Z1cnQgQiAyNjg3MyAgfCAgVXN0LiBJZG5yLiAvIFZBVCBOby46IERFMTEzODUyNzE1
DQpSZWdpc3RlcmdlcmljaHQgLyByZWdpc3RlciBjb3VydDogQW10c2dlcmljaHQgRnJhbmtmdXJ0
L01haW4NCg0KSW1wb3J0YW50IEluZm9ybWF0aW9uOg0KVGhpcyBlLW1haWwgbWVzc2FnZSBpbmNs
dWRpbmcgaXRzIGF0dGFjaG1lbnRzIGNvbnRhaW5zIGNvbmZpZGVudGlhbCBhbmQgbGVnYWxseSBw
cm90ZWN0ZWQgaW5mb3JtYXRpb24gc29sZWx5IGludGVuZGVkIGZvciB0aGUgYWRkcmVzc2VlLiBJ
ZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgYWRkcmVzc2VlIG9mIHRoaXMgbWVzc2FnZSwgcGxl
YXNlIGNvbnRhY3QgdGhlIGFkZHJlc3NlciBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIHRoaXMgbWVz
c2FnZSBpbmNsdWRpbmcgaXRzIGF0dGFjaG1lbnRzLiBUaGUgdW5hdXRob3JpemVkIGRpc3NlbWlu
YXRpb24sIGNvcHlpbmcgYW5kIGNoYW5nZSBvZiB0aGlzIGUtbWFpbCBhcmUgc3RyaWN0bHkgZm9y
YmlkZGVuLiBUaGUgYWRkcmVzc2VyIHNoYWxsIG5vdCBiZSBsaWFibGUgZm9yIHRoZSBjb250ZW50
IG9mIHN1Y2ggY2hhbmdlZCBlLW1haWxzLg0KDQpXaWNodGlnZXIgSGlud2VpczoNCkRpZXNlIEUt
TWFpbCBlaW5zY2hsaWXDn2xpY2ggaWhyZXIgQW5ow6RuZ2UgZW50aMOkbHQgdmVydHJhdWxpY2hl
IHVuZCByZWNodGxpY2ggZ2VzY2jDvHR6dGUgSW5mb3JtYXRpb25lbiwgZGllIG51ciBmw7xyIGRl
biBBZHJlc3NhdGVuIGJlc3RpbW10IHNpbmQuIFNvbGx0ZW4gU2llIG5pY2h0IGRlciBiZXplaWNo
bmV0ZSBBZHJlc3NhdCBzZWluLCBzbyB0ZWlsZW4gU2llIGRpZXMgYml0dGUgZGVtIEFic2VuZGVy
IHVtZ2VoZW5kIG1pdCB1bmQgbMO2c2NoZW4gU2llIGRpZXNlIE5hY2hyaWNodCB1bmQgaWhyZSBB
bmjDpG5nZS4gRGllIHVuYmVmdWd0ZSBXZWl0ZXJnYWJlLCBkYXMgQW5mZXJ0aWdlbiB2b24gS29w
aWVuIHVuZCBqZWRlIFZlcsOkbmRlcnVuZyBkZXIgRS1NYWlsIGlzdCB1bnRlcnNhZ3QuIERlciBB
YnNlbmRlciBoYWZ0ZXQgbmljaHQgZsO8ciBJbmhhbHRlIHZvbiB2ZXLDpG5kZXJ0ZW4gRS1NYWls
cy4NCg==
