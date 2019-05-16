Return-Path: <chee.yang.lee@intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 May 2019 11:55:10 UTC
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDAA6B067
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 11:55:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2019 04:48:05 -0700
X-ExtLoop1: 1
Received: from pgsmsx108.gar.corp.intel.com ([10.221.44.103])
	by fmsmga006.fm.intel.com with ESMTP; 16 May 2019 04:48:04 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.93]) by
	PGSMSX108.gar.corp.intel.com ([169.254.8.77]) with mapi id
	14.03.0415.000; Thu, 16 May 2019 19:48:03 +0800
From: "Lee, Chee Yang" <chee.yang.lee@intel.com>
To: "trini@konsulko.com" <trini@konsulko.com>
Thread-Topic: [OE-core] [PATCH 0/4] add wic based image installer
Thread-Index: AQHVC45LE07e76mEQUyhb0dZOcItrqZsg4eAgAEfygA=
Date: Thu, 16 May 2019 11:48:02 +0000
Message-ID: <04877C8C-9026-4832-9B81-49E0B07DB163@intel.com>
References: <F8C782DB-A692-407F-A6DF-AFAC51D14854@intel.com>
	<20190516023759.GP22232@bill-the-cat>
In-Reply-To: <20190516023759.GP22232@bill-the-cat>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.a.190512
x-originating-ip: [172.30.199.100]
MIME-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] add wic based image installer
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
X-List-Received-Date: Thu, 16 May 2019 11:55:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <178C4C97FF078043BD061136E3971171@intel.com>
Content-Transfer-Encoding: base64

SSBjb3VsZG7igJl0IGZpZ3VyZSBvdXQgaG93IHRvIG1ha2UgaXQgd2l0aCBzZGltYWdlLWJvb3Rw
YXJ0LndrcywgY2FuIHlvdSB0ZWxsIG1lIHdoYXQgZGlkIHlvdSBzZXQgZm9yIElNQUdFX0JPT1Rf
RklMRVMgPw0KDQpUbyBmdXJ0aGVyIGV4cGxhaW4gdGhlIGlkZWEsICBJJ20gdHJ5aW5nIHRvIHVz
ZSB0aGUgbmV3IHNvdXJjZSBwbHVnaW4gYW5kIC53a3MuaW4gdG8gYnVpbGQgYSB3aWMgaW1hZ2Ug
dGhhdCAibWltaWMiIGEgaGRkaW1nLCB3aGVyZSBJIGNhbiBkZCB0aGUgd2ljIGltYWdlIHRvIGFu
IFVTQiBkcml2ZSBhbmQgdXNlIHRoYXQgdXNiIGRyaXZlIHRvIGluc3RhbGwgaW1hZ2UgdG8gbXkg
dGFyZ2V0IG1hY2hpbmUgKGxpa2UgaGRkaW1nIGRpZCApLiANCmZpcnN0IHBhcnRpdGlvbiBhbGxv
dyB0byBib290IGludG8gaW5pdHJhbWZzIGFuZCBpdCB3aWxsIGV4ZWN1dGUgdGhlIGluc3RhbGwg
c2NyaXB0LiBUaGUgc2NyaXB0IHdpbGwgdGhlbiBpbnN0YWxsIHN5c3RlbS1ib290IGNvbmZpZ3Vy
YXRpb24sIGVmaSwga2VybmVsLCByb290ZnMuaW1nIGFuZCBpbml0cmQgZnJvbSBzZWNvbmQgcGFy
dGl0aW9uIHRvIHRhcmdldCBtYWNoaW5lLiANCg0KTXkgc2FtcGxlIGltYWdlIGhlcmU6IA0KaHR0
cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xYzFGQ0oyZ2hXTnpzWEsxemJPQVZ6MWJ6Nkcz
SDV6eDUvdmlldz91c3A9c2hhcmluZw0KDQoNCu+7v09uIDUvMTYvMTksIDEwOjM4IEFNLCAiVG9t
IFJpbmkiIDx0cmluaUBrb25zdWxrby5jb20+IHdyb3RlOg0KDQogICAgT24gVGh1LCBNYXkgMTYs
IDIwMTkgYXQgMDI6MjM6MDVBTSArMDAwMCwgTGVlLCBDaGVlIFlhbmcgd3JvdGU6DQogICAgPiBI
aSBUb20sIA0KICAgID4gDQogICAgPiBXb3VsZCB5b3UgbWluZCB0byBzaGFyZSB3aXRoIG1lIGhv
dyB5b3UgbWFrZSB0aGUgaW5zdGFsbGVyIGltYWdlIHVzaW5nIHdpYz8gDQogICAgDQogICAgSSBl
bmRlZCB1cCB1c2luZyBzZGltYWdlLWJvb3RwYXJ0LndrcyBhbmQgSU1BR0VfQk9PVF9GSUxFUyB0
byBwb3B1bGF0ZQ0KICAgIHRoZSBwYXJ0aXRpb24gYXMgbmVlZGVkLiAgSSBjYW4ndCBwYXN0ZSB0
aGUgZXhhY3QgaW1hZ2UgYXMgaXQgd2FzIGRvbmUNCiAgICBmb3IgYSBjdXN0b21lci4NCiAgICAN
CiAgICA+IA0KICAgID4gICAgIC0tLS0tLS0tIEZvcndhcmRlZCBNZXNzYWdlIC0tLS0tLS0tDQog
ICAgPiAgICAgRnJvbTogVG9tIFJpbmkgPHRyaW5pQGtvbnN1bGtvLmNvbT4NCiAgICA+ICAgICBU
bzogY2hlZS55YW5nLmxlZUBpbnRlbC5jb20NCiAgICA+ICAgICBDYzogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KICAgID4gICAgIFN1YmplY3Q6IFJlOiBbT0UtY29y
ZV0gW1BBVENIIDAvNF0gYWRkIHdpYyBiYXNlZCBpbWFnZSBpbnN0YWxsZXINCiAgICA+ICAgICBE
YXRlOiBXZWQsIDE1IE1heSAyMDE5IDExOjMzOjQzIC0wNDAwDQogICAgPiAgICAgDQogICAgPiAg
ICAgT24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDI6NDA6NThQTSArMDgwMCwgY2hlZS55YW5nLmxl
ZUBpbnRlbC5jb20NCiAgICA+ICAgICB3cm90ZToNCiAgICA+ICAgICANCiAgICA+ICAgICA+IEZy
b206IENoZWUgWWFuZyBMZWUgPGNoZWUueWFuZy5sZWVAaW50ZWwuY29tPg0KICAgID4gICAgID4g
DQogICAgPiAgICAgPiBFeGlzdGluZyBpbnN0YWxsYWJsZSBpbWFnZSAoaGRkaW1nL0lTTykgaGFz
IGxpbWl0IG9mIDRHQiBzaXplLCBzbyB0bw0KICAgID4gICAgID4gYnVpbGQgbGFyZ2VyIGluc3Rh
bGxhYmxlIGltYWdlLCB3ZSBjYW4gYnVpbGQgaXQgaW4gd2ljIGJhc2VkIGltYWdlLg0KICAgID4g
ICAgID4gDQogICAgPiAgICAgPiAyIHBhcnRpdGlvbiBuZWVkZWQgZm9yIGluc3RhbGxhYmxlIGlt
YWdlDQogICAgPiAgICAgPiAgLSBmaXJzdCBwYXJ0aXRpb24gYnVpbGQgdXNpbmcgc291cmNlIHBs
dWdpbiBib290aW1nLWVmaSBhbmQNCiAgICA+ICAgICA+IGNvbmZpZ3VyZSB0byBydW4gaW5zdGFs
bA0KICAgID4gICAgID4gIC0gc2Vjb25kIHBhcnRpdGlvbiBidWlsZCB3aXRoIHJvb3QuaW1nLCBz
eXN0ZW1kLWJvb3QgYW5kIGtlcm5lbCB0bw0KICAgID4gICAgID4gYmUgaW5zdGFsbCBvbiB0YXJn
ZXQgbWFjaGluZSAodGhpcyBwYXJ0aXRpb24gYnVpbGQgdXNpbmcgbmV3IHNvdXJjZQ0KICAgID4g
ICAgID4gcGx1Z2luIGluc3RhbGxlci1wYXJ0aXRpb24pDQogICAgPiAgICAgPiANCiAgICA+ICAg
ICA+IFRoZXNlIHBhdGNoZXM6DQogICAgPiAgICAgPiAgLSBhZGQgbmV3IHNvdXJjZSBwbHVnaW4g
Zm9yIHNlY29uZCBwYXJ0aXRpb24NCiAgICA+ICAgICA+ICAtIGFkZCBuZXcgLndrcw0KICAgID4g
ICAgID4gIC0gYWRkIG5ldyB3aWMgZGVwZW5kZW5jeSBhbmQgc2V0IGRlZmF1bHQgdmFsdWUgZm9y
IHJlcXVpcmVkIHZhcmlhYmxlDQogICAgPiAgICAgPiAgLSBhbGxvdyBzb3VyY2UgcGx1Z2luIGJv
b3RpbWctZWZpIHRvIGNvbmZpZ3VyZSB0byBpbnN0YWxsDQogICAgPiAgICAgPiANCiAgICA+ICAg
ICA+IA0KICAgID4gICAgID4gVG8gYnVpbGQgdGhlIGltYWdlLCBzZXQgV0tTX0ZJTEU9IndpYy1p
bnN0YWxsZXIud2tzLmluIiBpbg0KICAgID4gICAgID4gbG9jYWwuY29uZi4NCiAgICA+ICAgICAN
CiAgICA+ICAgICBJJ20gY29uZnVzZWQgYXMgdG8gd2h5IHdlIG5lZWQgbW9zdCBvZiB0aGVzZSBj
aGFuZ2VzIHRvIHN1cHBvcnQgdGhlIGVuZA0KICAgID4gICAgIGdvYWwuICBUaGUgZW5oYW5jZW1l
bnQgdG8gYm9vdGltZy1lZmkgbWFrZXMgY29uY2VwdHVhbCBzZW5zZS4gIEkgZG9uJ3QNCiAgICA+
ICAgICBzZWUgd2h5IHdlIG5lZWQgYSBuZXcgcGx1Z2luIHRvIGRvIHRoZSByZXN0LCBob3dldmVy
LiAgV2hhdCdzIGJlaW5nDQogICAgPiAgICAgZG9uZQ0KICAgID4gICAgIGhlcmUgdGhhdCB3ZSBk
b24ndCBhbHJlYWR5IGRvIHRvZGF5PyAgSSBzYXkgdGhpcyBoYXZpbmcgbWFkZSBpbnN0YWxsZXIN
CiAgICA+ICAgICBpbWFnZXMgZm9yIEVGSSBtYWNoaW5lcyB1c2luZyB3aWMgKGluIHN1bW8sIGV2
ZW4pLiAgVGhhbmtzIQ0KICAgID4gICAgIA0KICAgID4gICAgIC0tIA0KICAgID4gICAgIFRvbQ0K
ICAgID4gICAgIC0tIA0KICAgID4gICAgIF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQogICAgPiAgICAgT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0
DQogICAgPiAgICAgT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KICAg
ID4gICAgIGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bmVtYmVkZGVkLWNvcmUNCiAgICA+ICAgICANCiAgICA+ICAgICANCiAgICA+IA0KICAgIA0KICAg
IC0tIA0KICAgIFRvbQ0KICAgIA0KDQo=

