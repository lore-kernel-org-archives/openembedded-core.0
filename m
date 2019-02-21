Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A8DDC7CB2B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 01:24:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2019 17:24:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,393,1544515200"; d="scan'208";a="135920686"
Received: from pgsmsx101.gar.corp.intel.com ([10.221.44.78])
	by orsmga002.jf.intel.com with ESMTP; 20 Feb 2019 17:24:52 -0800
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.167]) by
	PGSMSX101.gar.corp.intel.com ([169.254.1.233]) with mapi id
	14.03.0415.000; Thu, 21 Feb 2019 09:24:50 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/2 v7] test-case-mgmt
Thread-Index: AQHUxttIuwYb6D1IKEyU0QOXDjzg8qXjv9EAgABRY4CABCopgIAAe7eAgADDmHA=
Date: Thu, 21 Feb 2019 01:24:50 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D043481875AA@PGSMSX109.gar.corp.intel.com>
References: <1550123438-37723-1-git-send-email-ee.peng.yeoh@intel.com>
	<f26f1ce6b9b79817950b93f9aa0e38d32671e78f.camel@linuxfoundation.org>
	<8f788c03bb214b6b23dacec18b9efbc32d6bf81c.camel@linuxfoundation.org>
	<8f156c0c1b0cc7fe18bd25a03a8f5f0cdc4f422d.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D04348186FF8@PGSMSX109.gar.corp.intel.com>
	<1df4a2505898ca691f430d96f4391f18133d357e.camel@linuxfoundation.org>
In-Reply-To: <1df4a2505898ca691f430d96f4391f18133d357e.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDVlMzA5Y2QtNWVlMy00OTUwLThmMDQtYWMyYWI3ZDc3NmEyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTDNvNm50Uyt1S0QwT2tNSElleGhlUmtJc3V4SnJHUHBySmdYemJkdlwvY2k1dVJcL1ArQ2t5Y2crZlB4MjQrMXA3In0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH 0/2 v7] test-case-mgmt
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
X-List-Received-Date: Thu, 21 Feb 2019 01:24:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUlAsDQoNCk5vdGVkLCB0aGFuayB5b3Ugb25jZSBhZ2FpbiBmb3IgeW91ciBncmVhdCBoZWxw
IGFuZCBpbnB1dHMhIFJlYWxseSBnbGFkIHRvIGhlYXIgdGhhdCByZXN1bHR0b29sIHdhcyByZWFk
eSEgDQpXZSBzaGFsbCBwbGFuIGZvcndhcmQgZm9yIGZ1dHVyZSBpbXByb3ZlbWVudCBpbiBodG1s
IHJlcG9ydHMgYW5kIGdyYXBocy4gQWxzbyB3ZSBzaGFsbCBsb29rIGludG8gZnV0dXJlIHRlc3Qg
Y2FzZSBkZXZlbG9wbWVudCBpZiBuZWVkZWQuDQoNCkNoZWVycywNClllb2ggRWUgUGVuZw0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXSANClNlbnQ6IFRodXJzZGF5LCBGZWJy
dWFyeSAyMSwgMjAxOSA1OjQ0IEFNDQpUbzogWWVvaCwgRWUgUGVuZyA8ZWUucGVuZy55ZW9oQGlu
dGVsLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCkNjOiBC
dXJ0b24sIFJvc3MgPHJvc3MuYnVydG9uQGludGVsLmNvbT47IEVnZ2xldG9uLCBQYXVsIDxwYXVs
LmVnZ2xldG9uQGludGVsLmNvbT4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDAvMiB2
N10gdGVzdC1jYXNlLW1nbXQNCg0KSGkgRWUgUGVuZywNCg0KT24gV2VkLCAyMDE5LTAyLTIwIGF0
IDA2OjI3ICswMDAwLCBZZW9oLCBFZSBQZW5nIHdyb3RlOg0KPiBUaGFuayB5b3UgdmVyeSBtdWNo
IGZvciBhbGwgeW91ciBoZWxwIGFuZCBpbnB1dHMhIA0KPiBXb3VsZCB5b3UgbGlrZSB1cyB0byB0
YWtlIGFsbCB0aGUgaW1wcm92ZW1lbnRzIGZyb20geW91ciBicmFuY2ggdG8gDQo+IG1lcmdlIG9y
IHNxdWFzaCB3aXRoIHRoZSBiYXNlIHBhdGNoc2V0IGFuZCBtb3ZlIGZvcndhcmQgd2l0aCB0aGUg
b25lIA0KPiByZW1haW5pbmcgaW1wcm92ZW1lbnQgYmVsb3c/DQoNCkkndmUgZG9uZSBzb21lIGZ1
cnRoZXIgd29yayBvbiB0aGlzIHRvZGF5IGFuZCB0aGUgZ29vZCBuZXdzIGlzIEkgd2FzIGFibGUg
dG8gc29ydCBvdXQgdGhlIGdpdCByZXBvIGhhbmRsaW5nIHBpZWNlcyBhbmQgZml4IHRoZSB0ZXN0
IGNhc2VzLg0KV2l0aCB0d28gb2YgdGhlIHRlc3QgY2FzZXMgSSBlbmRlZCB1cCByZW1vdmluZyB0
aGVtIGFzIEkndmUgY2hhbmdlZCB0aGUgZnVuY3Rpb25hbGl0eSBlbm91Z2ggdGhhdCB0aGV5J2Qg
bmVlZCB0byBiZSByZXdyaXR0ZW4uDQoNCkkndmUgc2VudCBvdXQgYSBwYXRjaCBvbiB0b3Agb2Yg
eW91ciBvcmlnaW5hbCB3b3JrIGFzIHdlbGwgYXMgYSBzZWNvbmQgcGF0Y2ggdG8gbW92ZSBzb21l
IGZ1bmN0aW9uYWxpdHkgaW50byBsaWJyYXJ5IGZ1bmN0aW9ucyB0byBhbGxvdyB1cyB0byB1c2Ug
aXQgZnJvbSB0aGUgbmV3IGNvZGUuIEkgdGhpbmsgdGhpcyBjb21iaW5hdGlvbiBvZiBwYXRjaGVz
IHNob3VsZCBub3cgYmUgcmVhZHkgdG8gbWVyZ2UuDQoNClRoZXJlIHdpbGwgYmUgZml4ZXMgYW5k
IGltcHJvdmVtZW50cyBvbiB0b3Agb2YgdGhpcywgZS5nLiBJJ2QgbG92ZSB0byBnZXQgc29tZSBo
dG1sIHJlcG9ydHMgYW5kIGdyYXBocyBidXQgdGhvc2UgYXJlIHRoaW5ncyB0aGF0IGNvbWUgbGF0
ZXIuDQoNClRoZSBuZXh0IHN0ZXAgb25jZSB0aGlzIGlzIG1lcmdlZCBpcyB0byBzdGFydCBzdG9y
aW5nIGF1dG9idWlsZGVyIHRlc3QgcmVzdWx0IGRhdGEsIGdlbmVyYXRpbmcgcmVwb3J0cyBhbmQg
cmVncmVzc2lvbiByZXBvcnRzIGF1dG9tYXRpY2FsbHkgZnJvbSBlYWNoIHRlc3QgcnVuLg0KDQpJ
dHMgZ3JlYXQgdG8gc2VlIHRoaXMgYWxsIGNvbWluZyB0b2dldGhlciENCg0KQ2hlZXJzLA0KDQpS
aWNoYXJkDQoNCg==

