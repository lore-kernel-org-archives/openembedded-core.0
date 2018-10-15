Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 9C65C79A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 08:47:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Oct 2018 01:47:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,384,1534834800"; d="scan'208";a="82654214"
Received: from pgsmsx108.gar.corp.intel.com ([10.221.44.103])
	by orsmga006.jf.intel.com with ESMTP; 15 Oct 2018 01:47:52 -0700
Received: from kmsmsx155.gar.corp.intel.com ([169.254.15.235]) by
	PGSMSX108.gar.corp.intel.com ([169.254.8.125]) with mapi id
	14.03.0319.002; Mon, 15 Oct 2018 16:47:51 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/5] oeqa/core/runner: refactor for OEQA to
	write json testresult
Thread-Index: AQHUZFptXr2ueXSleU+0ap6JWxaneaUfcmWAgACLbuA=
Date: Mon, 15 Oct 2018 08:47:51 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335ECB214@KMSMSX155.gar.corp.intel.com>
References: <1539588294-5532-1-git-send-email-ee.peng.yeoh@intel.com>
	<9d6783fcc08d063e63a44f8dc5b9048ce2a698f2.camel@linuxfoundation.org>
In-Reply-To: <9d6783fcc08d063e63a44f8dc5b9048ce2a698f2.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDI4MDEzYTktNmQ4Ni00ZTU0LWI2MTEtMmQwZWQ1OGIwYmU2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNk9YQ0YxUHFXNWVTMzNxcGx5TWhqd29Hdjg1SENMVEhjUkVyTzBHREJHR09oazlPR0drWTVMclFIRHBGMHpGaSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] oeqa/core/runner: refactor for OEQA to write json testresult
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
X-List-Received-Date: Mon, 15 Oct 2018 08:47:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGhlIHNoYXJpbmchIEkgd2ls
bCBtYWtlIHRoZSByZXF1aXJlIGVuaGFuY2VtZW50IGFzYXAuDQoNClRoYW5rcywNClllb2ggRWUg
UGVuZyANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmcgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnXSANClNlbnQ6IE1vbmRheSwgT2N0b2JlciAxNSwgMjAxOCA0OjI1IFBNDQpUbzogWWVv
aCwgRWUgUGVuZyA8ZWUucGVuZy55ZW9oQGludGVsLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvNV0g
b2VxYS9jb3JlL3J1bm5lcjogcmVmYWN0b3IgZm9yIE9FUUEgdG8gd3JpdGUganNvbiB0ZXN0cmVz
dWx0DQoNCk9uIE1vbiwgMjAxOC0xMC0xNSBhdCAxNToyNCArMDgwMCwgWWVvaCBFZSBQZW5nIHdy
b3RlOg0KPiBSZWZhY3RvciB0aGUgb3JpZ2luYWwgX2dldERldGFpbHNOb3RQYXNzZWQgbWV0aG9k
IHRvIHJldHVybiB0ZXN0cmVzdWx0IA0KPiBkZXRhaWxzICh0ZXN0IHN0YXR1cyBhbmQgbG9nKSwg
d2hpY2ggd2lsbCBiZSByZXVzZWQgYnkgZnV0dXJlIE9FUUEgDQo+IGNvZGUgdG8gd3JpdGUganNv
biB0ZXN0cmVzdWx0Lg0KPiANCj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gY29uc29saWRhdGUg
YW5kIHNpbXBsaWZ5IHRoZSBsb2dpYyB1c2VkIHRvIA0KPiBnYXRoZXIgdGVzdCBzdGF0dXMgYW5k
IGxvZyB3aXRoaW4gdGhlIFRlc3RSZXN1bHQgaW5zdGFuY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBZZW9oIEVlIFBlbmcgPGVlLnBlbmcueWVvaEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbWV0YS9s
aWIvb2VxYS9jb3JlL3J1bm5lci5weSB8IDcwIA0KPiArKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyks
IDQxIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvbGliL29lcWEvY29yZS9y
dW5uZXIucHkgDQo+IGIvbWV0YS9saWIvb2VxYS9jb3JlL3J1bm5lci5weSBpbmRleCBlZWI2MjVi
Li41NjY2NmVlIDEwMDY0NA0KPiAtLS0gYS9tZXRhL2xpYi9vZXFhL2NvcmUvcnVubmVyLnB5DQo+
ICsrKyBiL21ldGEvbGliL29lcWEvY29yZS9ydW5uZXIucHkNCj4gQEAgLTc2LDQwICs3Niw0MyBA
QCBjbGFzcyBPRVRlc3RSZXN1bHQoX1Rlc3RSZXN1bHQpOg0KPiAgICAgICAgICBlbHNlOg0KPiAg
ICAgICAgICAgICAgbXNnID0gIiVzIC0gRkFJTCAtIFJlcXVpcmVkIHRlc3RzIGZhaWxlZCIgJSBj
b21wb25lbnQNCj4gICAgICAgICAgc2tpcHBlZCA9IGxlbihzZWxmLnNraXBwZWQpDQo+IC0gICAg
ICAgIGlmIHNraXBwZWQ6IA0KPiArICAgICAgICBpZiBza2lwcGVkOg0KPiAgICAgICAgICAgICAg
bXNnICs9ICIgKHNraXBwZWQ9JWQpIiAlIHNraXBwZWQNCj4gICAgICAgICAgc2VsZi50Yy5sb2dn
ZXIuaW5mbyhtc2cpDQo+ICANCj4gLSAgICBkZWYgX2dldERldGFpbHNOb3RQYXNzZWQoc2VsZiwg
Y2FzZSwgdHlwZSwgZGVzYyk6DQo+IC0gICAgICAgIGZvdW5kID0gRmFsc2UNCj4gKyAgICBkZWYg
X2dldFRlc3RSZXN1bHREZXRhaWxzKHNlbGYsIGNhc2UpOg0KPiArICAgICAgICByZXN1bHRfdHlw
ZXMgPSBbJ2ZhaWx1cmVzJywgJ2Vycm9ycycsICdza2lwcGVkJywgJ2V4cGVjdGVkRmFpbHVyZXMn
LCAnc3VjY2Vzc2VzJ10NCj4gKyAgICAgICAgcmVzdWx0X2Rlc2MgPSBbJ0ZBSUxFRCcsICdFUlJP
UicsICdTS0lQUEVEJywgJ0VYUEVDVEVERkFJTCcsIA0KPiArICdQQVNTRUQnXQ0KDQpUaGlzIHBh
dGNoIGlzIG11Y2ggYmV0dGVyIHRoYW5rcyEgDQoNCkl0IGNvdWxkIHN0aWxsIGRvIHdpdGggb25l
IG1vcmUgbWlub3IgdHdlYWsuIFlvdSBjYW4gdXNlIGEgZGljdCBhYm92ZSB0byBzaW1wbGZ5IHRo
aXMgY29kZSBhbmQgYXZvaWQgdXNpbmcgaW5kZXhlcyB3aGljaCBpcyBub3QgdmVyeSBweXRob25p
YywgZm9yIGV4YW1wbGUNCg0KDQpyZXN1bHRfdHlwZXMgPSB7J2ZhaWx1cmVzJyA6ICdGQUlMRUQn
LCAnZXJyb3JzJyA6ICdFUlJPUid9DQoNCnRoZW4NCg0KZm9yIHJ0eXBlIGluIHJlc3VsdF90eXBl
czoNCiAgICBbLi4uXQ0KICAgIHJldHVybiByZXN1bHRfdHlwZXNbcnR5cGVdLCBtc2cNCg0KDQpU
aGUgcmVzdCBvZiB0aGUgcGF0Y2ggbG9va3MgbGlrZSBhIG5pY2Ugc2ltcGxpZmljYXRpb24gbm93
IHRob3VnaCENCg0KQ2hlZXJzLA0KDQpSaWNoYXJkDQoNCg==

