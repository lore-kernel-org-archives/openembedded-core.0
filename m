Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R4XBE-00022g-OJ
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 14:06:05 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Sep 2011 05:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,393,1312182000"; d="scan'208";a="52262360"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2011 05:00:42 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 16 Sep 2011 20:00:42 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Fri, 16 Sep 2011 20:00:41 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Mark Hatle
	<mark.hatle@windriver.com>
Date: Fri, 16 Sep 2011 20:00:40 +0800
Thread-Topic: Multilib status
Thread-Index: Acx0U43ghLifgdTUTpOZqlYt+SlgWgAFDjRQ
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12D84DF2AF@shsmsx501.ccr.corp.intel.com>
References: <1316165543.25993.59.camel@ted>
In-Reply-To: <1316165543.25993.59.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Multilib status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2011 12:06:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCBhbmQgTWFyaywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmddDQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDE2LCAyMDExIDU6MzIgUE0NCj4gVG86
IE1hcmsgSGF0bGUNCj4gQ2M6IFh1LCBEb25neGlhbzsgb3BlbmVtYmVkZGVkLWNvcmUNCj4gU3Vi
amVjdDogTXVsdGlsaWIgc3RhdHVzDQo+IA0KPiBIaSBNYXJrL0Rvbmd4YWlvLA0KPiANCj4gV2Ug
cmVhbGx5IG5lZWQgdG8gZ2V0IHRoZSByZW1haW5kZXIgb2YgdGhlIG11bHRpbGliIGJ1Z3Mgd3Jh
cHBlZCB1cC4gSSB0aGluaw0KPiB0aGVyZSBpcyBzb21lIGNvbmZ1c2lvbiBhYm91dCB0aGUgZXhh
Y3QgYXBwcm9hY2ggdG8gdGFrZSB0byBmaXggc29tZSBvZiB0aGVtIHNvDQo+IEknbSBob3Bpbmcg
dG8gdHJ5IGFuZCBzdW1tYXJpc2UgdGhlIHByb2JsZW1zIGhlcmUgc28gd2UgY2FuIHdvcmsgb3V0
IHNvbWUNCj4gcmVzb2x1dGlvbnMuDQo+IA0KPiBQcm9ibGVtIEENCj4gPT09PT09PT09DQo+IA0K
PiBXZSBjYW4gaGF2ZSBtdWx0aXBsZSBmb3JtcyBvZiAibWFjaGluZSBzcGVjaWZpYyIgcGFja2Fn
ZXMgbm93LCBvbmUgZm9yIGVhY2gNCj4gbXVsdGlsaWIgZS5nLjoNCj4gDQo+IHRhc2stY29yZS14
MTEtYmFzZS0xLjAtcjM0LnFlbXV4ODZfNjQucnBtICgibm9ybWFsIikNCj4gdGFzay1jb3JlLXgx
MS1iYXNlLTEuMC1yMzQucWVtdXg4Nl82NC5ycG0gKCJsaWI2NCIpDQo+IHRhc2stY29yZS14MTEt
YmFzZS0xLjAtcjM0LnFlbXV4ODZfNjQucnBtICgibGliMzIiKQ0KPiANCj4gKGxldHMgYXNzdW1l
IHRoZSBmaXJzdCB1c2VzIC9saWIvLCB0aGUgc2Vjb25kIC9saWI2NC8gYW5kIHRoZSB0aHJpZCAv
bGliMzIvLCBhbg0KPiBhcnRpZmljaWFsIGV4YW1wbGUgSSByZWFsaXNlKQ0KPiANCj4gSSBrbm93
IG9uZSBwcm9wb3NhbCB3YXMgdG8gbWFwOg0KPiANCj4gdGFzay1jb3JlLXgxMS1iYXNlLTEuMC1y
MzQubGliMzJfcWVtdXg4Nl82NC5ycG0gdG8NCj4gdGFzay1jb3JlLXgxMS1iYXNlLTEuMC1yMzQu
bGliMzJfcWVtdXg4Ni5ycG0gYnV0IHRoaXMgaXNuJ3QgY29ycmVjdCBzaW5jZSB0aGUNCj4gbGli
cmFyeSBkaXJlY3RvcmllcyBhcmUgZGlmZmVyZW50LiBJbiB0aGlzIHNwZWNpZmljIGNhc2UgaXQg
bWlnaHQgbm90IG1hdHRlciBidXQgaW4NCj4gZ2VuZXJhbCBpdCB3b3VsZC4gV2hhdCBpcyBhbHNv
IGltcG9ydGFudCBpcyB0aGF0IHRoZSBkaWZmZXJlbnQgdmVyc2lvbnMgaW1wbHkNCj4gZGlmZmVy
ZW50IGRlcGVuZGVuY2llcy4gVGhlIGxpYjY0IGJpdCB2ZXJzaW9uIHdvdWxkIHB1bGwgaW4gYW5k
IHNlbGVjdCBsaWI2NCBiaXQNCj4gbGlicy4gSXRzIHRoZXNlIGRlcGVuZGVuY2llcyB3aGljaCBh
cmUgYSBrZXkgcmVhc29uIHRoZXNlIGFyZSBub3QgImFsbCIgYXJjaA0KPiBwYWNrYWdlcy4NCj4g
DQo+IFRoZSBlbmQgcmVzdWx0IGlzIHRoZXJlZm9yZSB3ZSBsaWtlbHkgd2FudDoNCj4gDQo+IHRh
c2stY29yZS14MTEtYmFzZS0xLjAtcjM0LnFlbXV4ODZfNjQucnBtDQo+IHRhc2stY29yZS14MTEt
YmFzZS0xLjAtcjM0LmxpYjY0X3FlbXV4ODZfNjQucnBtDQo+IHRhc2stY29yZS14MTEtYmFzZS0x
LjAtcjM0LmxpYjMyX3FlbXV4ODZfNjQucnBtDQo+IA0KPiBhbmQgSSBiZWxpZXZlIHRoZXJlIGFy
ZSBzb21lIHBhdGNoZXMgRG9uZ3hpYW8gaGFzIGNyZWF0ZWQgd2hpY2ggZG8gdGhpcy4NCj4gDQo+
IFByb2JsZW0gQg0KPiA9PT09PT09PT0NCj4gDQo+IElmIHdlIGluc3RhbGwgdGFzay1jb3JlLXgx
MS1iYXNlLTEuMC1yMzQucWVtdXg4Nl82NC5ycG0gd2hpY2ggZGVwZW5kcyBvbg0KPiAiY29ubm1h
biIsIGhvdyBkb2VzIHRoZSBzeXN0ZW0gZmlndXJlIG91dCB0byBhc3NvY2lhdGUgdGhpcyB0byBt
ZWFuIHdlIHdhbnQNCj4gdGhlICJ4ODZfNjQiIGFyY2hpdGVjdHVyZSBwYWNrYWdlcyBpbnN0YWxs
ZWQ/DQo+IA0KPiBBcyBmYXIgYXMgSSBjYW4gdGVsbCB0aGVyZSBhcmUgdHdvIHByb3Bvc2FscyBh
cm91bmQ6DQo+IA0KPiAxKSBTZXQgdGhlIGFyY2hpdGVjdHVyZSBpbiB0aGUgcGFja2FnZSBwcm92
aWRlcyBhbmQgZGVwZW5kcyAoYSBiaXQgdWdseSkNCj4gDQo+IDIpIENvbmZpZ3VyZSBsaWJ6eXBw
IHRvIHVuZGVyc3RhbmQgdGhhdCBxZW11eDg2XzY0IGRvZXMgcmVhbGx5IG1hcCB0bw0KPiB4ODZf
NjQgYXJjaGl0ZWN0dXJlIGFuZCBpbXBseSB4ODZfNjQgZGVwZW5kZW5jaWVzLg0KDQpJbiBvdXIg
Y3VycmVudCByb290ZnNfcnBtIGxvZ2ljLCB3ZSBkb24ndCB1c2UgenlwcGVyIHRvb2wgdG8gbWFr
ZSB0aGUgZmlsZSBzeXN0ZW0sIHdoYXQgd2UgdXNlIGlzIHB1cmUgcnBtIHBsdXMgZGIuDQpJIGFt
IG5vdCBzdXJlIHdoZXRoZXIgdGhlIHJwbSBkYXRhYmFzZSBvciBzYXQtc29sdmVyIGhhcyBzdWNo
IGtpbmQgb2YgYmluZGluZ3MgYmV0d2VlbiBkaWZmZXJlbnQgcmVwbyBmb2xkZXJzPyAobGlrZSBx
ZW11eDg2XzY0IGFuZCB4ODZfNjQpDQoNClRoYW5rcywNCkRvbmd4aWFvDQoNCj4gDQo+IFNvbHZp
bmcgcHJvYmxlbSBBIGFib3ZlIGlzIHRoZSBmaXJzdCBzdGVwIHRvd2FyZHMgcmVzb2x2aW5nIHRo
aXMgZWl0aGVyIHdheSBidXQNCj4gd2UgZG9uJ3Qgc2VlbSB0byBoYXZlIGEgcmVzb2x1dGlvbiBv
biB0aGlzIHNlY29uZCBwYXJ0Lg0KPiANCj4gRm9yIHJlZmVyZW5jZSwgd2UgcmVhbGx5IGRvIHdh
bnQgdGhlc2UgdGFzayBwYWNrYWdlcyB0byBoYXZlIGFuIGFzc29jaWF0ZWQNCj4gYXJjaGl0ZWN0
dXJlIHNvIHRoZSB1c2VyIGNhbiBlYXNpbHkgYnVpbGQgdXAgYmxvY2tzIG9mIHRoZSBzeXN0ZW0g
dXNpbmcgYSBnaXZlbg0KPiBBQkkuDQo+IA0KPiANCj4gDQo+IFdoYXQgSSByZWFsbHkgbmVlZCBu
b3cgaXMgYW4gaWRlYSBvZiB3aGljaCBwYXRjaGVzIHlvdSBib3RoIGFncmVlIG9uIHRoYXQgd2UN
Cj4gbmVlZCB0byBtZXJnZSAoSSB0aGluayB3ZSBoYXZlIHNvbWUgZm9yIHByb2JsZW0gQSkgYW5k
IGEgcmVzb2x1dGlvbiBvbg0KPiBwcm9ibGVtIEIgYWxvbmcgd2l0aCBzb21lIHBhdGNoZXMgc28g
d2UgY2FuIGNsb3NlIHRoaXMgc2V0IG9mIGlzc3VlcyBvdXQuDQo+IA0KPiBJZiB0aGVyZSBhcmUg
ZnVydGhlciBpc3N1ZXMgY2FuIHlvdSByZXBseSB0byB0aGlzIGVtYWlsIGVpdGhlciB3aXRoIHRo
ZSBkZXRhaWxzIG9yIGENCj4gcG9pbnRlciB0byB0aGUgc3BlY2lmaWMgYWRkaXRpb25hbCBwcm9i
bGVtcy4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCj4gDQoNCg==


