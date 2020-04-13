Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web10.1267.1586819184822016100
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2020 16:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: yP7SFRZveo4xEXgHvqkZ8UYlChWoDAoWo3BM7vANhdL23uvzgBw/TrCqL2QApNEyDUMr+zPG7Y
 Vb5PTSY8xIIA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2020 16:06:23 -0700
IronPort-SDR: QV2vMS0+4lzQX1QdBIPM+2RftttTcqwhVFBh7R9Oeup16x93qoz/XdNo8YGATr51S9Cbdn3s8T
 Q8y+BE2NLt9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,380,1580803200"; 
   d="scan'208";a="453333814"
Received: from kmsmsx156.gar.corp.intel.com ([172.21.138.133])
  by fmsmga005.fm.intel.com with ESMTP; 13 Apr 2020 16:06:22 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.234]) by
 KMSMSX156.gar.corp.intel.com ([169.254.1.224]) with mapi id 14.03.0439.000;
 Tue, 14 Apr 2020 07:03:27 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [zeus][PATCH 00/13] zeus pull request - cover letter only
Thread-Topic: [OE-core] [zeus][PATCH 00/13] zeus pull request - cover letter
 only
Thread-Index: AQHWDuZXCnzXgdLgXkS6uP4gDihnvKh3K5EA
Date: Mon, 13 Apr 2020 23:03:27 +0000
Message-ID: <43d867c7356c57dc560951b56f96e7603e9105f4.camel@intel.com>
References: <160456EE2C65ED08.7555@lists.openembedded.org>
In-Reply-To: <160456EE2C65ED08.7555@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.148.175]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF511B2CBFEC8B4C82137C39C1104D7E@intel.com>
Content-Transfer-Encoding: base64

UGluZw0KDQpPbiBGcmksIDIwMjAtMDQtMTAgYXQgMTE6MTUgKzA4MDAsIEFudWogTWl0dGFsIHdy
b3RlOg0KPiBQbGVhc2UgcHVsbCB0aGVzZSBjaGFuZ2VzIGZvciB6ZXVzLiBhLWZ1bGwgcGFzc2Vk
IG9uIGF1dG9idWlsZGVyLg0KPiANCj4gVGhhbmtzLA0KPiANCj4gQW51ag0KPiANCj4gVGhlIGZv
bGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdA0KPiAwNzQzZGNkMGNkNzBkZWU4N2E0OWQzYmNk
MDE3MTY4MzUyZTYwOTgyOg0KPiANCj4gICB3aWMvZGlyZWN0OiByZXNlcnZlIDIgc2VjdG9yIGZv
ciBleHRlbmRlZCBwYXJ0aXRpb24gKDIwMjAtMDMtMjYNCj4gMDc6MzM6MDcgKzA4MDApDQo+IA0K
PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoNCj4gDQo+ICAgZ2l0Oi8v
cHVzaC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlLWNvbnRyaWIgc3RhYmxlL3pl
dXMtDQo+IG5leHQNCj4gDQo+IEphbiBMdWViYmUgKDUpOg0KPiAgIGxpYi9vZS9wYWNrYWdlX21h
bmFnZXI6IG1ha2Ugc3VyZSB0byBub3QgcmVtb3ZlIHBhY2thZ2VzIGluIGFwdA0KPiAgICAgaW5z
dGFsbA0KPiAgIGxpYi9vZS9wYWNrYWdlX21hbmFnZXI6IGZpeCBoYW5kbGluZyBvZiBsYXN0IHBh
Y2thZ2UNCj4gICBsaWIvb2UvcGFja2FnZV9tYW5hZ2VyOiBjb2xsZWN0IHByb3ZpZGVkIHBhY2th
Z2UgbmFtZXMgd2hlbiB1c2luZw0KPiBkZWJzDQo+ICAgbGliL29lL3BhY2thZ2VfbWFuYWdlcjog
YXZvaWQgaW5zdGFsbGluZyBwcm92aWRlZCBwYWNrYWdlcyB2aWEgYXB0DQo+ICAgbGliL29lL3Bh
Y2thZ2VfbWFuYWdlcjogZG9uJ3QgdHJ5IHRvIHJtIC92YXIvbGliL29wa2cNCj4gDQo+IEplcmVt
eSBQdWhsbWFuICgxKToNCj4gICBidXN5Ym94OiBvbiB1cGdyYWRlIHNhdmUgYnVzeWJveCBpZiBp
dCBpcyB0aGUgbGFzdCBzaGVsbA0KPiANCj4gSm9zaHVhIFdhdHQgKDEpOg0KPiAgIHUtYm9vdC10
b29sczogU3BsaXQgb3V0IGluYyBmaWxlDQo+IA0KPiBNYXJlayBWYXN1dCAoMik6DQo+ICAgd2Fm
ZmxlOiBubyBuZWVkIHRvIGRlcGVuZCBvbiB0YXJnZXQgcHl0aG9uMw0KPiAgIGx0dG5nLW1vZHVs
ZXM6IHVwZGF0ZSB0byAyLjEwLjE0DQo+IA0KPiBQYXVsIEJhcmtlciAoMyk6DQo+ICAga2VybmVs
LXlvY3RvLmJiY2xhc3M6IFN1cHBvcnQgY29uZmlnIGZyYWdtZW50cyB3aXRoIGV4dGVybmFsc3Jj
DQo+ICAgcGVyZjogRml4IGV4dGVybmFsc3JjIHN1cHBvcnQNCj4gICBrZXJuZWxzcmMuYmJjbGFz
czogRml4IGV4dGVybmFsc3JjIHN1cHBvcnQNCj4gDQo+IGhhaXFpbmcgKDEpOg0KPiAgIGdsaWIt
Mi4wOiBmaXggQ1ZFLTIwMjAtNjc1MA0KPiANCj4gIG1ldGEvY2xhc3Nlcy9rZXJuZWwteW9jdG8u
YmJjbGFzcyAgICAgICAgICAgICB8ICAgMyArLQ0KPiAgbWV0YS9jbGFzc2VzL2tlcm5lbHNyYy5i
YmNsYXNzICAgICAgICAgICAgICAgIHwgICAyICstDQo+ICBtZXRhL2xpYi9vZS9wYWNrYWdlX21h
bmFnZXIucHkgICAgICAgICAgICAgICAgfCAgMzcgKy0NCj4gIG1ldGEvcmVjaXBlcy1ic3AvdS1i
b290L3UtYm9vdC10b29scy5pbmMgICAgICB8ICA2NSArKw0KPiAgLi4uL3UtYm9vdC91LWJvb3Qt
dG9vbHNfMjAxOS4wNy5iYiAgICAgICAgICAgIHwgIDY3ICstDQo+ICBtZXRhL3JlY2lwZXMtY29y
ZS9idXN5Ym94L2J1c3lib3guaW5jICAgICAgICAgfCAgNDMgKw0KPiAgLi4uL2dsaWItMi4wL2ds
aWItMi4wL0NWRS0yMDIwLTY3NTAucGF0Y2ggICAgIHwgNzQxDQo+ICsrKysrKysrKysrKysrKysr
Kw0KPiAgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi42MC43LmJiIHwgICAx
ICsNCj4gIG1ldGEvcmVjaXBlcy1ncmFwaGljcy93YWZmbGUvd2FmZmxlXzEuNi4wLmJiICB8ICAg
NSArDQo+ICAuLi5vcHMtd2hlbi10cmFjZS1zdW5ycGNfdGFzay1ldmVudHMtaW4ucGF0Y2ggfCAg
OTQgLS0tDQo+ICAuLi5ycGNfY2xudC1kZXJlZmVyZW5jZS1pbi1ycGNfdGFza19xdWUucGF0Y2gg
fCAgNDQgLS0NCj4gIC4uLnJwYy11c2Utc2lnbmVkLWludGVnZXItZm9yLWNsaWVudC1pZC5wYXRj
aCB8IDEwNSAtLS0NCj4gIC4uLm5ycGMtaW50cm9kdWNlLWx0dG5nX2dldF9jbGlkLWhlbHBlci5w
YXRjaCB8IDEzMCAtLS0NCj4gIC4uLmVzXzIuMTAuMTEuYmIgPT4gbHR0bmctbW9kdWxlc18yLjEw
LjE0LmJifSB8ICAxMiArLQ0KPiAgbWV0YS9yZWNpcGVzLWtlcm5lbC9wZXJmL3BlcmYuYmIgICAg
ICAgICAgICAgIHwgICAyICstDQo+ICAxNSBmaWxlcyBjaGFuZ2VkLCA4ODcgaW5zZXJ0aW9ucygr
KSwgNDY0IGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1i
c3AvdS1ib290L3UtYm9vdC10b29scy5pbmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMC9DVkUtMjAyMC0NCj4gNjc1MC5wYXRjaA0KPiAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxl
cy8wMDAxLUZpeC0NCj4gU1VOUlBDLUZpeC1vb3BzLXdoZW4tdHJhY2Utc3VucnBjX3Rhc2stZXZl
bnRzLWluLnBhdGNoDQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWtlcm5lbC9s
dHRuZy9sdHRuZy1tb2R1bGVzLzAwMDItRml4LQ0KPiBzdW5ycGMtbnVsbC1ycGNfY2xudC1kZXJl
ZmVyZW5jZS1pbi1ycGNfdGFza19xdWUucGF0Y2gNCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRh
L3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLW1vZHVsZXMvMDAwMy1GaXgtDQo+IHN1bnJwYy11
c2Utc2lnbmVkLWludGVnZXItZm9yLWNsaWVudC1pZC5wYXRjaA0KPiAgZGVsZXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctbW9kdWxlcy8wMDA0LQ0KPiBzdW5y
cGMtaW50cm9kdWNlLWx0dG5nX2dldF9jbGlkLWhlbHBlci5wYXRjaA0KPiAgcmVuYW1lIG1ldGEv
cmVjaXBlcy1rZXJuZWwvbHR0bmcve2x0dG5nLW1vZHVsZXNfMi4xMC4xMS5iYiA9PiBsdHRuZy0N
Cj4gbW9kdWxlc18yLjEwLjE0LmJifSAoNzUlKQ0KPiANCj4gDQo=
