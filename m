Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1342A74D1F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 06:28:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40707093"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 04 Jun 2018 14:28:15 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D45E74B41E87
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 14:28:12 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0399.000; Mon, 4 Jun 2018 14:28:16 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] linux-libc-headers: To fix build error when
	enable mutilib on aarch64 Big endian.
Thread-Index: AQHT9jaPNTI3Y0V1Q0SaDyUKapWgX6RPrbWA
Date: Mon, 4 Jun 2018 06:28:15 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD0170F956A2@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1526668676-26167-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1526668676-26167-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.300.84
dlp-reaction: no-action
x-originating-ip: [10.167.225.27]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: D45E74B41E87.AC2E8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] linux-libc-headers: To fix build error when enable mutilib on aarch64 Big endian.
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
X-List-Received-Date: Mon, 04 Jun 2018 06:28:17 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

cGluZw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IExlaSwgTWFvaHVpDQo+IFNlbnQ6IFNhdHVyZGF5LCBNYXkgMTksIDIwMTgg
MjozOCBBTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBDYzogTGVpLCBNYW9odWkNCj4gU3ViamVjdDogW09F
LWNvcmVdW1BBVENIXSBsaW51eC1saWJjLWhlYWRlcnM6IFRvIGZpeCBidWls
ZCBlcnJvciB3aGVuIGVuYWJsZQ0KPiBtdXRpbGliIG9uIGFhcmNoNjQgQmln
IGVuZGlhbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IExlaSBNYW9odWkgPGxl
aW1hb2h1aUBjbi5mdWppdHN1LmNvbT4NCj4gLS0tDQo+ICBtZXRhL3JlY2lw
ZXMta2VybmVsL2xpbnV4LWxpYmMtaGVhZGVycy9saW51eC1saWJjLWhlYWRl
cnMuaW5jIHwgNCArKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5l
bC9saW51eC1saWJjLWhlYWRlcnMvbGludXgtbGliYy1oZWFkZXJzLmluYw0K
PiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgtbGliYy1oZWFkZXJzL2xp
bnV4LWxpYmMtaGVhZGVycy5pbmMNCj4gaW5kZXggOTkwM2MwNi4uYjVjZjk2
ZCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eC1s
aWJjLWhlYWRlcnMvbGludXgtbGliYy1oZWFkZXJzLmluYw0KPiArKysgYi9t
ZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4LWxpYmMtaGVhZGVycy9saW51eC1s
aWJjLWhlYWRlcnMuaW5jDQo+IEBAIC03Nyw2ICs3NywxMCBAQCBkb19pbnN0
YWxsX2FwcGVuZF9hcm0gKCkgew0KPiAgCWRvX2luc3RhbGxfYXJtbXVsdGls
aWINCj4gIH0NCj4gDQo+ICtkb19pbnN0YWxsX2FwcGVuZF9hcm1lYiAoKSB7
DQo+ICsJZG9faW5zdGFsbF9hcm1tdWx0aWxpYg0KPiArfQ0KPiArDQo+ICBk
b19pbnN0YWxsX2FybW11bHRpbGliICgpIHsNCj4gIAlvZV9tdWx0aWxpYl9o
ZWFkZXIgYXNtL2F1eHZlYy5oIGFzbS9iaXRzcGVybG9uZy5oIGFzbS9ieXRl
b3JkZXIuaA0KPiBhc20vZmNudGwuaCBhc20vaHdjYXAuaCBhc20vaW9jdGxz
LmggYXNtL2t2bS5oIGFzbS9rdm1fcGFyYS5oIGFzbS9tbWFuLmgNCj4gYXNt
L3BhcmFtLmggYXNtL3BlcmZfcmVncy5oIGFzbS9icGZfcGVyZl9ldmVudC5o
DQo+ICAJb2VfbXVsdGlsaWJfaGVhZGVyIGFzbS9wb3NpeF90eXBlcy5oIGFz
bS9wdHJhY2UuaCAgYXNtL3NldHVwLmgNCj4gYXNtL3NpZ2NvbnRleHQuaCBh
c20vc2lnaW5mby5oIGFzbS9zaWduYWwuaCBhc20vc3RhdC5oICBhc20vc3Rh
dGZzLmggYXNtL3N3YWIuaA0KPiBhc20vdHlwZXMuaCBhc20vdW5pc3RkLmgN
Cj4gLS0NCj4gMS45LjENCg0KCgo=

