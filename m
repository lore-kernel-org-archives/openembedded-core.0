Received: from esa3.bmw.c3s2.iphmx.com (esa3.bmw.c3s2.iphmx.com [68.232.133.150])
 by mx.groups.io with SMTP id smtpd.web10.10166.1590665441267085093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 04:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=CtbQn/g9;
 spf=pass (domain: bmw.de, ip: 68.232.133.150, mailfrom: prvs=4107ed6de=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1590665442; x=1622201442;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kDk0Co7M3LjESegWM5iqC4oKJhxtc1enN+cCPUvPwLQ=;
  b=CtbQn/g9BpSJd8ZJbYPGk7t94tkTQH4isWunV6xToW/YDW92QA6onmVK
   iFNHjI0ZfJoNWdONENiXC7Xvfe4Pd2G9UIhx9IMDFxHNPSNg40JP+T7Uu
   r6a9zIhOYiFb9+T136BtyrqJXnY7W3LRt/O7gr/wF5X3Epl7vfhQQRl3P
   Y=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa3.bmw.c3s2.iphmx.com with ESMTP/TLS; 28 May 2020 13:30:40 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw5.muc with ESMTP/TLS;
 28 May 2020 13:30:38 +0200
Received: from smucm09m.bmwgroup.net (HELO smucm09m.europe.bmw.corp) ([160.48.96.45])
 by esabb2.muc with ESMTP/TLS; 28 May 2020 13:30:36 +0200
Received: from smucm09k.europe.bmw.corp (160.48.96.43) by smucm09m.europe.bmw.corp
 (160.48.96.45) with Microsoft SMTP Server (TLS;
 Thu, 28 May 2020 13:30:36 +0200
Received: from smucm09k.europe.bmw.corp ([160.48.96.43]) by
 smucm09k.europe.bmw.corp ([160.48.96.43]) with mapi id 15.00.1497.006; Thu,
 28 May 2020 13:30:36 +0200
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <sakoman@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] package_rpm.bbclass: respect package overrides for the main package
Thread-Topic: [OE-core] [PATCH] package_rpm.bbclass: respect package overrides
 for the main package
Thread-Index: AQHWMmiHD/PNNGfF5UiuLApEVWAsgqi6eIGAgALpfQA=
Date: Thu, 28 May 2020 11:30:36 +0000
Message-ID: <5483300D-5E77-4407-8C5F-317F33B4FD56@bmw.de>
References: <1590392749-329454-1-git-send-email-michael.ho@bmw.de>
 <CAGDS+n=SfCk_+DeBghVu80=f+RfEJ39Hg72xPG2iUyTwz6WY7A@mail.gmail.com>
In-Reply-To: <CAGDS+n=SfCk_+DeBghVu80=f+RfEJ39Hg72xPG2iUyTwz6WY7A@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"
Content-ID: <48ADC8D4C616624288117C25DBA677C3@bmwmail.corp>
Content-Transfer-Encoding: base64

SGkgU3RldmUsDQoNCk5vdCBzdXJlIGlmIHRoYXQgcXVlc3Rpb24gd2FzIGZvciBtZSBvciB0aGUg
Z2VuZXJhbCBjb21tdW5pdHkuIEkgdGhpbmsgdGhlIGZvbGxvdy1vbiBzZXJpZXMgZml4aW5nIHRo
ZSBzc3RhdGUtY2FjaGluZyBtaWdodCBiZSBuaWNlIGluIGR1bmZlbGwgYnV0IEknZCBkZWZlciBq
dWRnZW1lbnQgdG8gdGhlIGNvbW11bml0eSBhYm91dCB0aGlzIG9uZSBhcyBpdCdzIGFib3V0IGNo
YW5naW5nIGEgYmVoYXZpb3IgaW4gdGhlIHJlY2lwZXMgYW5kIEkgZG9uJ3Qga25vdyB3aGF0IExU
UyBndWlkZWxpbmVzIHRoZXJlIGFyZSBpbiBwbGFjZSBpbiB0aGUgcHJvamVjdC4NCg0KU2hvdWxk
IEkgaW4gdGhlIGZ1dHVyZSBhZGRyZXNzIHBhdGNoZXMgdG8gdGhlIGR1bmZlbGwgYnJhbmNoPyAo
V2hlcmUgbWlnaHQgSSBmaW5kIHRoZSBndWlkZWxpbmVzIGZvciBzdWJtaXR0aW5nIHRvIGR1bmZl
bGwgdnMgbWFzdGVyKS4NCg0KVGhhbmtzLg0KDQpLaW5kIHJlZ2FyZHMsDQpNaWNoYWVsDQoNCi0t
IA0KQk1XIENhciBJVCBHbWJIDQpNaWNoYWVsIEhvDQpTcGV6aWFsaXN0IEVudHdpY2tsdW5nIOKA
kyBCdWlsZCBhbmQgUmVsZWFzZSBFbmdpbmVlcmluZw0KTGlzZS1NZWl0bmVyLVN0cmHDn2UgMTQN
Cjg5MDgxIFVsbQ0KDQpUZWwuOiDCrSs0OS03MzEtMzc4MDQtMDcxDQpNb2JpbDogKzQ5LTE1Mi01
NDk4MC00NzENCkZheDogKzQ5LTczMS0zNzgwNC0wMDENCk1haWw6IG1pY2hhZWwuaG9AYm13LWNh
cml0LmRlIA0KV2ViOiBodHRwOi8vd3d3LmJtdy1jYXJpdC5kZSA8aHR0cDovL3d3dy5ibXctY2Fy
aXQuZGUvPg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KQk1XIENhciBJVCBHbWJIDQpHZXNjaMOkZnRzZsO8
aHJlcjogS2FpLVV3ZSBCYWxzenV3ZWl0IHVuZCBNaWNoYWVsIELDtnR0cmljaA0KU2l0eiB1bmQg
UmVnaXN0ZXJnZXJpY2h0OiBNw7xuY2hlbiBIUkIgMTM0ODEwDQotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQog
DQoNCu+7v09uIDI2LjA1LjIwLCAxOTowMiwgIlN0ZXZlIFNha29tYW4iIDxzYWtvbWFuQGdtYWls
LmNvbT4gd3JvdGU6DQoNCiAgICBEb2VzIHRoaXMgcGF0Y2ggKGFuZCB0aGUgZm9sbG93LW9uIHNl
cmllcykgbWFrZSBzZW5zZSBmb3IgaW5jbHVzaW9uIGluIGR1bmZlbGw/DQoNCiAgICBTdGV2ZQ0K
DQogICAgT24gU3VuLCBNYXkgMjQsIDIwMjAgYXQgOTo0NiBQTSBNaWNoYWVsIEhvIDxNaWNoYWVs
LkhvQGJtdy5kZT4gd3JvdGU6DQogICAgPg0KICAgID4gRnJvbTogTWljaGFlbCBIbyA8TWljaGFl
bC5Ib0BibXcuZGU+DQogICAgPg0KICAgID4gQXBwbHkgJHtQTn0gdG8gT1ZFUlJJREVTIHdoZW4g
ZGV0ZXJtaW5pbmcgdGhlIGJhc2UgcGFja2FnZSBzcGVjIHZhcmlhYmxlcy4NCiAgICA+IFdpdGhv
dXQgdGhpcywgdGhlcmUgaXMgYSBtaXNtYXRjaCBpbiBiZWhhdmlvdXIgd2hlcmUgb3ZlcnJpZGVz
IGZvciB0aGUgYmFzZQ0KICAgID4gcGFja2FnZSBoYXZlIG5vIGVmZmVjdCB3aGlsZSBvdmVycmlk
ZXMgZm9yIHN1YnBhY2thZ2VzIGRvLiBUaGUgc3VicGFja2FnZXMNCiAgICA+IHNob3VsZCBub3Qg
YmUgYWZmZWN0ZWQgYnkgdGhpcyBvdmVycmlkZSBhcyB0aGV5IGFwcGx5IHRoZWlyIG93biBwYWNr
YWdlDQogICAgPiBvdmVycmlkZXMgYW5kIHdpbGwgYnkgZGVmYXVsdCBmZXRjaCB0aGUgYmFzZSB2
YXJpYWJsZXMgYW5kIGFwcGx5IHRoZW0gaW4NCiAgICA+IHRoZSBzcGVjIGZpbGUuDQogICAgPg0K
ICAgID4gVGhpcyBtYWtlcyB0aGUgYmVoYXZpb3VyIGZvciBwYWNrYWdlIG92ZXJyaWRlcyBtYXRj
aCB0aGUgaW1wbGVtZW50YXRpb24NCiAgICA+IGluIHBhY2thZ2VfZGViLmJiY2xhc3MgYW5kIHBh
Y2thZ2VfaXBrLmJiY2xhc3MuDQogICAgPg0KICAgID4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBI
byA8TWljaGFlbC5Ib0BibXcuZGU+DQogICAgPiAtLS0NCiAgICA+ICBtZXRhL2NsYXNzZXMvcGFj
a2FnZV9ycG0uYmJjbGFzcyB8IDIyICsrKysrKysrKysrKy0tLS0tLS0tLS0NCiAgICA+ICAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQogICAgPg0KICAg
ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9wYWNrYWdlX3JwbS5iYmNsYXNzIGIvbWV0YS9j
bGFzc2VzL3BhY2thZ2VfcnBtLmJiY2xhc3MNCiAgICA+IGluZGV4IDlhNGJlMmUuLjUxOWMyMmIg
MTAwNjQ0DQogICAgPiAtLS0gYS9tZXRhL2NsYXNzZXMvcGFja2FnZV9ycG0uYmJjbGFzcw0KICAg
ID4gKysrIGIvbWV0YS9jbGFzc2VzL3BhY2thZ2VfcnBtLmJiY2xhc3MNCiAgICA+IEBAIC0yODYs
MTYgKzI4NiwxOCBAQCBweXRob24gd3JpdGVfc3BlY2ZpbGUgKCkgew0KICAgID4NCiAgICA+ICAg
ICAgIyBDb25zdHJ1Y3QgdGhlIFNQRUMgZmlsZS4uLg0KICAgID4gICAgICBzcmNuYW1lICAgID0g
ZC5nZXRWYXIoJ1BOJykNCiAgICA+IC0gICAgc3Jjc3VtbWFyeSA9IChkLmdldFZhcignU1VNTUFS
WScpIG9yIGQuZ2V0VmFyKCdERVNDUklQVElPTicpIG9yICIuIikNCiAgICA+IC0gICAgc3JjdmVy
c2lvbiA9IGQuZ2V0VmFyKCdQS0dWJykucmVwbGFjZSgnLScsICcrJykNCiAgICA+IC0gICAgc3Jj
cmVsZWFzZSA9IGQuZ2V0VmFyKCdQS0dSJykNCiAgICA+IC0gICAgc3JjZXBvY2ggICA9IChkLmdl
dFZhcignUEtHRScpIG9yICIiKQ0KICAgID4gLSAgICBzcmNsaWNlbnNlID0gZC5nZXRWYXIoJ0xJ
Q0VOU0UnKQ0KICAgID4gLSAgICBzcmNzZWN0aW9uID0gZC5nZXRWYXIoJ1NFQ1RJT04nKQ0KICAg
ID4gLSAgICBzcmNtYWludGFpbmVyICA9IGQuZ2V0VmFyKCdNQUlOVEFJTkVSJykNCiAgICA+IC0g
ICAgc3JjaG9tZXBhZ2UgICAgPSBkLmdldFZhcignSE9NRVBBR0UnKQ0KICAgID4gLSAgICBzcmNk
ZXNjcmlwdGlvbiA9IGQuZ2V0VmFyKCdERVNDUklQVElPTicpIG9yICIuIg0KICAgID4gLSAgICBz
cmNjdXN0b210YWdzY2h1bmsgPSBnZXRfcGFja2FnZV9hZGRpdGlvbmFsX21ldGFkYXRhKCJycG0i
LCBkKQ0KICAgID4gKyAgICBsb2NhbGRhdGEgPSBiYi5kYXRhLmNyZWF0ZUNvcHkoZCkNCiAgICA+
ICsgICAgbG9jYWxkYXRhLnNldFZhcignT1ZFUlJJREVTJywgZC5nZXRWYXIoIk9WRVJSSURFUyIs
IEZhbHNlKSArICI6IiArIHNyY25hbWUpDQogICAgPiArICAgIHNyY3N1bW1hcnkgPSAobG9jYWxk
YXRhLmdldFZhcignU1VNTUFSWScpIG9yIGxvY2FsZGF0YS5nZXRWYXIoJ0RFU0NSSVBUSU9OJykg
b3IgIi4iKQ0KICAgID4gKyAgICBzcmN2ZXJzaW9uID0gbG9jYWxkYXRhLmdldFZhcignUEtHVicp
LnJlcGxhY2UoJy0nLCAnKycpDQogICAgPiArICAgIHNyY3JlbGVhc2UgPSBsb2NhbGRhdGEuZ2V0
VmFyKCdQS0dSJykNCiAgICA+ICsgICAgc3JjZXBvY2ggICA9IChsb2NhbGRhdGEuZ2V0VmFyKCdQ
S0dFJykgb3IgIiIpDQogICAgPiArICAgIHNyY2xpY2Vuc2UgPSBsb2NhbGRhdGEuZ2V0VmFyKCdM
SUNFTlNFJykNCiAgICA+ICsgICAgc3Jjc2VjdGlvbiA9IGxvY2FsZGF0YS5nZXRWYXIoJ1NFQ1RJ
T04nKQ0KICAgID4gKyAgICBzcmNtYWludGFpbmVyICA9IGxvY2FsZGF0YS5nZXRWYXIoJ01BSU5U
QUlORVInKQ0KICAgID4gKyAgICBzcmNob21lcGFnZSAgICA9IGxvY2FsZGF0YS5nZXRWYXIoJ0hP
TUVQQUdFJykNCiAgICA+ICsgICAgc3JjZGVzY3JpcHRpb24gPSBsb2NhbGRhdGEuZ2V0VmFyKCdE
RVNDUklQVElPTicpIG9yICIuIg0KICAgID4gKyAgICBzcmNjdXN0b210YWdzY2h1bmsgPSBnZXRf
cGFja2FnZV9hZGRpdGlvbmFsX21ldGFkYXRhKCJycG0iLCBsb2NhbGRhdGEpDQogICAgPg0KICAg
ID4gICAgICBzcmNkZXBlbmRzICAgICA9IGQuZ2V0VmFyKCdERVBFTkRTJykNCiAgICA+ICAgICAg
c3JjcmRlcGVuZHMgICAgPSBbXQ0KICAgID4gLS0NCiAgICA+IDIuNy40DQogICAgPg0KICAgID4g
DQoNCg==
