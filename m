Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF4C749F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 07:29:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42861599"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2018 15:29:10 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4D6F24B69E1E;
	Tue, 31 Jul 2018 15:29:09 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0399.000; Tue, 31 Jul 2018 15:29:08 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] cross-canadian/libgcc: fix aarch64's
	multilib SDK
Thread-Index: AQHUH85vaijWjam9PEqVXqY2aw1VxKSfFpQAgALYGICABxFz0A==
Date: Tue, 31 Jul 2018 07:29:14 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD019455DD4B@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1529965666-49307-1-git-send-email-leimaohui@cn.fujitsu.com>
	<b86b2fc6-d464-7c79-1c87-ef5f9d8ffb74@windriver.com>
	<e30c95ce-8e5e-1978-6bb4-7a4cbe78f1cd@gmail.com>
In-Reply-To: <e30c95ce-8e5e-1978-6bb4-7a4cbe78f1cd@gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.300.84
dlp-reaction: no-action
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 4D6F24B69E1E.AAAA6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH v2] cross-canadian/libgcc: fix aarch64's multilib SDK
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
X-List-Received-Date: Tue, 31 Jul 2018 07:29:30 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBQbGVhc2UgdGVzdCB0aGlzIHBhdGNoIHdpdGggbXVzbCB0YXJnZXQgcHJl
ZmVyYWJseSBhcm0vYWFyY2g2NCBhbmQgYWxzbw0KPiBwcGMvZ2xpYmMgYnkg
Z2VuZXJhdGluZyBTREtzDQoNCk9rLCBJJ2xsIHRlc3QgaXQuDQoNCkJlc3Qg
cmVnYXJkcy4NCkxlaQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IEtoZW0gUmFqIFttYWlsdG86cmFqLmtoZW1AZ21haWwuY29t
XQ0KPiBTZW50OiBGcmlkYXksIEp1bHkgMjcsIDIwMTggMTE6MzEgQU0NCj4g
VG86IFJvYmVydCBZYW5nOyBMZWksIE1hb2h1aTsgb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFtQQVRDSCB2Ml0gY3Jvc3MtY2FuYWRpYW4vbGliZ2NjOiBmaXgg
YWFyY2g2NCdzIG11bHRpbGliDQo+IFNESw0KPiANCj4gDQo+IA0KPiBPbiA3
LzI1LzE4IDE6MDQgQU0sIFJvYmVydCBZYW5nIHdyb3RlOg0KPiA+IEhpIE1h
b2h1aSwNCj4gPg0KPiA+IFRoYW5rcyBmb3Igc2VuZGluZyBpdCwgSSBkbyB0
aGluayB0aGF0IG9lLWNvcmUgbmVlZHMgdGhpcyBwYXRjaC4NCj4gPg0KPiA+
IC8vIFJvYmVydA0KPiA+DQo+ID4gT24gMDYvMjYvMjAxOCAwNjoyNyBBTSwg
TGVpIE1hb2h1aSB3cm90ZToNCj4gPj4gVGhlIGFybSB0b29sY2hhaW4gaGFz
IGEgIi1nbnVlYWJpIiBzdWZmaXgsIGJ1dCBhYXJjaDY0IGRvZXNuJ3QsIHRo
aXMNCj4gPj4gbWFrZXMgbXVsdGlsaWIgc2RrIGRvZXNuJ3Qgd29yaywgdGhl
cmUgd2lsbCBiZSBlcnJvciBhcyBmb2xsb3dpbmc6DQo+ID4+DQo+ID4+IC4u
Li91c3IvbGliZXhlYy9hcm1lYi1wb2t5LWxpbnV4LWd1eC1saW51eC1nbnVl
YWJpLzcuMy4wL3JlYWwtbGQ6DQo+ID4+IGNhbm5vdCBmaW5kIGNydGJlZ2lu
Uy5vOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0bw0KPiA+PiAuLi4vdXNyL2xp
YmV4ZWMvYXJtZWItcG9reS1saW51eC1ndXgtbGludXgtZ251ZWFiaS83LjMu
MC9yZWFsLWxkOg0KPiA+PiBjYW5ub3QgZmluZCAtbGdjYw0KPiA+PiAuLi4v
dXNyL2xpYmV4ZWMvYXJtZWItcG9reS1saW51eC1ndXgtbGludXgtZ251ZWFi
aS83LjMuMC9yZWFsLWxkOg0KPiA+PiBjYW5ub3QgZmluZCAtbGdjYw0KPiA+
PiBjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMN
Cj4gPj4NCj4gDQo+IFBsZWFzZSB0ZXN0IHRoaXMgcGF0Y2ggd2l0aCBtdXNs
IHRhcmdldCBwcmVmZXJhYmx5IGFybS9hYXJjaDY0IGFuZCBhbHNvDQo+IHBw
Yy9nbGliYyBieSBnZW5lcmF0aW5nIFNES3MNCj4gDQo+ID4+IFNpZ25lZC1v
ZmYtYnk6IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29t
Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9odWlA
Y24uZnVqaXRzdS5jb20+DQo+ID4+IC0tLQ0KPiA+PiDCoCBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZ2NjL2xpYmdjYy1jb21tb24uaW5jIHwgMjMNCj4gPj4g
KysrKysrKysrKysrKysrKystLS0tLS0NCj4gPj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDE3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4+DQo+
ID4+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2xp
YmdjYy1jb21tb24uaW5jDQo+ID4+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2djYy9saWJnY2MtY29tbW9uLmluYw0KPiA+PiBpbmRleCA4NDhhNDc2Li5h
NDlmYzk4IDEwMDY0NA0KPiA+PiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZ2NjL2xpYmdjYy1jb21tb24uaW5jDQo+ID4+ICsrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9nY2MvbGliZ2NjLWNvbW1vbi5pbmMNCj4gPj4gQEAg
LTE0NSwxMSArMTQ1LDIyIEBAIGZha2Vyb290IHB5dGhvbiBkb19leHRyYV9z
eW1saW5rcygpIHsNCj4gPj4gwqDCoMKgwqDCoCBpZiBiYi5kYXRhLmluaGVy
aXRzX2NsYXNzKCduYXRpdmVzZGsnLCBkKToNCj4gPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybg0KPiA+PiDCoCAtwqDCoMKgIHRhcmdldHN5cyA9IGQu
Z2V0VmFyKCdCQVNFVEFSR0VUX1NZUycpDQo+ID4+ICvCoMKgwqAgYmFzZV90
YXJnZXRzeXMgPSBkLmdldFZhcignQkFTRVRBUkdFVF9TWVMnKQ0KPiA+PiAr
wqDCoMKgIHRhcmdldHN5cyA9IGQuZ2V0VmFyKCdUQVJHRVRfU1lTJykNCj4g
Pj4gKw0KPiA+PiArwqDCoMKgIGlmIGJhc2VfdGFyZ2V0c3lzICE9IHRhcmdl
dHN5czoNCj4gPj4gK8KgwqDCoMKgwqDCoMKgIGRlc3QgPSBkLmdldFZhcign
RCcpICsgZC5nZXRWYXIoJ2xpYmRpcicpICsgJy8nICsNCj4gPj4gK2Jhc2Vf
dGFyZ2V0c3lzDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBkZXN0X2xpc3QgPSBb
ZGVzdF0NCj4gPj4gK8KgwqDCoMKgwqDCoMKgICMgRm9yIG11bHRpbGliIGxp
a2UgYWFyY2g2NCArIGFybSwgbmVlZCAyIHN5bWxpbmtzOg0KPiA+PiArwqDC
oMKgwqDCoMKgwqAgIyAxKSBCQVNFVEFSR0VUX1NZUyBhcyB1c3VhbA0KPiA+
PiArwqDCoMKgwqDCoMKgwqAgIyAyKSBCQVNFVEFSR0VUX1NZUyArICItZ251
ZWFiaSIgZm9yIG11bHRpbGliDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCBsaWJj
ZSA9IGQuZ2V0VmFyKCdMSUJDRVhURU5TSU9OJykNCj4gPj4gK8KgwqDCoMKg
wqDCoMKgIGFiaWUgPSBkLmdldFZhcignQUJJRVhURU5TSU9OJykNCj4gPj4g
K8KgwqDCoMKgwqDCoMKgIGlmIGFiaWUgYW5kIGxpYmNlIGFuZCB0YXJnZXRz
eXMuZW5kc3dpdGgobGliY2UgKyBhYmllKToNCj4gPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZGVzdF9saXN0LmFwcGVuZChkZXN0ICsgbGliY2UgKyBh
YmllKQ0KPiA+PiArwqDCoMKgwqDCoMKgwqAgc3JjID0gdGFyZ2V0c3lzDQo+
ID4+ICvCoMKgwqDCoMKgwqDCoCBmb3IgZGlyIGluIGRlc3RfbGlzdDoNCj4g
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgbm90IG9zLnBhdGgubGV4
aXN0cyhkaXIpIGFuZA0KPiA+PiBvcy5wYXRoLmxleGlzdHMoZC5nZXRWYXIo
J0QnLCBUcnVlKSArIGQuZ2V0VmFyKCdsaWJkaXInLCBUcnVlKSk6DQo+ID4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb3Muc3ltbGluayhz
cmMsIGRpcikNCj4gPj4gwqAgLcKgwqDCoCBpZiB0YXJnZXRzeXMgIT0gZC5n
ZXRWYXIoJ1RBUkdFVF9TWVMnKToNCj4gPj4gLcKgwqDCoMKgwqDCoMKgIGRl
c3QgPSBkLmdldFZhcignRCcpICsgZC5nZXRWYXIoJ2xpYmRpcicpICsgJy8n
ICsgdGFyZ2V0c3lzDQo+ID4+IC3CoMKgwqDCoMKgwqDCoCBzcmMgPSBkLmdl
dFZhcignVEFSR0VUX1NZUycpDQo+ID4+IC3CoMKgwqDCoMKgwqDCoCBpZiBu
b3Qgb3MucGF0aC5sZXhpc3RzKGRlc3QpIGFuZA0KPiA+PiBvcy5wYXRoLmxl
eGlzdHMoZC5nZXRWYXIoJ0QnKSArIGQuZ2V0VmFyKCdsaWJkaXInKSk6DQo+
ID4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9zLnN5bWxpbmsoc3JjLCBk
ZXN0KQ0KPiA+PiDCoCB9DQo+ID4+DQoNCgoK

