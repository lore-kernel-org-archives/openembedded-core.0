Return-Path: <anuj.mittal@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1D47F8A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 12:42:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Nov 2019 04:42:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,322,1569308400"; d="scan'208";a="381003636"
Received: from pgsmsx108.gar.corp.intel.com ([10.221.44.103])
	by orsmga005.jf.intel.com with ESMTP; 19 Nov 2019 04:42:32 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.88]) by
	PGSMSX108.gar.corp.intel.com ([10.221.44.103]) with mapi id
	14.03.0439.000; Tue, 19 Nov 2019 20:37:46 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH 07/13] psmisc: update to 23.3
Thread-Index: AQHVnh0JeMnYKy95zUWYGXKqPr+4V6eR6diA
Date: Tue, 19 Nov 2019 12:37:45 +0000
Message-ID: <d81ce2616b381df45bc4b387e50db3754144f2a1.camel@intel.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-7-alex.kanavin@gmail.com>
In-Reply-To: <20191118142852.22981-7-alex.kanavin@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.128.81]
MIME-Version: 1.0
Subject: Re: [PATCH 07/13] psmisc: update to 23.3
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
X-List-Received-Date: Tue, 19 Nov 2019 12:42:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <84D712D3E43B9A42A7AC368A3A8BDB7C@intel.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDE5LTExLTE4IGF0IDE1OjI4ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+DQo+IC0tLQ0KPiAgLi4uYW0tY3JlYXRlLXNyYy1kaXJlY3RvcnktYmVmb3JlLWF0dGVt
cHRpbmctdC5wYXRjaCB8IDEyICsrKysrLS0tLS0NCj4gLS0NCj4gIC4uLi9wc21pc2Mve3BzbWlz
Y18yMy4yLmJiID0+IHBzbWlzY18yMy4zLmJifSAgICAgICAgfCAgMiArLQ0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+ICByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3BzbWlzYy97cHNtaXNjXzIzLjIuYmIgPT4NCj4gcHNtaXNjXzIzLjMu
YmJ9ICg4NyUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BzbWlz
Yy9wc21pc2MvMDAwMS1NYWtlZmlsZS5hbS0NCj4gY3JlYXRlLXNyYy1kaXJlY3RvcnktYmVmb3Jl
LWF0dGVtcHRpbmctdC5wYXRjaCBiL21ldGEvcmVjaXBlcy0NCj4gZXh0ZW5kZWQvcHNtaXNjL3Bz
bWlzYy8wMDAxLU1ha2VmaWxlLmFtLWNyZWF0ZS1zcmMtZGlyZWN0b3J5LWJlZm9yZS0NCj4gYXR0
ZW1wdGluZy10LnBhdGNoDQo+IGluZGV4IDRkNDQ0OTVmZDNmLi45NDUxMzAzZGQ3YiAxMDA2NDQN
Cj4gLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BzbWlzYy9wc21pc2MvMDAwMS1NYWtlZmls
ZS5hbS1jcmVhdGUtDQo+IHNyYy1kaXJlY3RvcnktYmVmb3JlLWF0dGVtcHRpbmctdC5wYXRjaA0K
PiArKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcHNtaXNjL3BzbWlzYy8wMDAxLU1ha2VmaWxl
LmFtLWNyZWF0ZS0NCj4gc3JjLWRpcmVjdG9yeS1iZWZvcmUtYXR0ZW1wdGluZy10LnBhdGNoDQo+
IEBAIC0xLDQgKzEsNCBAQA0KPiAtRnJvbSAyODU4NzdiNzc2MWQ3NDczNmFjYTI2ODdlZDliZWYy
Zjc4YjgyYzMzIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0KPiArRnJvbSBkYWMzNzVmNjQw
ZmVjZDQ1ZTYyNTRhOGQ4NzBlZTM3ZWM4ZjQxNjcwIE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAw
MQ0KPiAgRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+
ICBEYXRlOiBUaHUsIDIgTm92IDIwMTcgMTY6MjE6MjIgKzAyMDANCj4gIFN1YmplY3Q6IFtQQVRD
SF0gTWFrZWZpbGUuYW06IGNyZWF0ZSBzcmMgZGlyZWN0b3J5IGJlZm9yZSBhdHRlbXB0aW5nDQo+
IHRvIHdyaXRlDQo+IEBAIC04LDIzICs4LDIxIEBAIE90aGVyd2lzZSBvdXQgb2YgdHJlZSBidWls
ZHMgd2lsbCBmYWlsLg0KPiAgDQo+ICBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcNCj4gIFNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPg0KPiAr
DQo+ICAtLS0NCj4gICBNYWtlZmlsZS5hbSB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gIA0KPiAgZGlmZiAtLWdpdCBhL01ha2VmaWxl
LmFtIGIvTWFrZWZpbGUuYW0NCj4gLWluZGV4IDlmNjFhYjQuLmI0Y2VkN2YgMTAwNjQ0DQo+ICtp
bmRleCA0NDFhZTk0Li44ODI5NjlkIDEwMDY0NA0KPiAgLS0tIGEvTWFrZWZpbGUuYW0NCj4gICsr
KyBiL01ha2VmaWxlLmFtDQo+IC1AQCAtNzksNyArNzksNyBAQCBFWFRSQV9ESVNUID0gc3JjL3Np
Z25hbWVzLmMgUkVBRE1FLm1kDQo+ICtAQCAtODYsNyArODYsNyBAQCBFWFRSQV9ESVNUID0gc3Jj
L3NpZ25hbWVzLmMgUkVBRE1FLm1kIG1pc2MvZ2l0LQ0KPiB2ZXJzaW9uLWdlbg0KPiAgIENMRUFO
RklMRVMgPSBzcmMvc2lnbmFtZXMuaA0KPiAgIA0KPiAtIHNyYy9zaWduYW1lcy5oOiBzcmMvc2ln
bmFtZXMuYyBNYWtlZmlsZQ0KPiArIHNyYy9zaWduYW1lcy5oOiBzcmMvc2lnbmFtZXMuYyBNYWtl
ZmlsZSBzcmMvJChhbV9fZGlyc3RhbXApDQoNClRoaXMgcGF0Y2ggaXMgcHJvYmFibHkgbm90IG5l
ZWRlZCBub3cgY29uc2lkZXJpbmcgdGhpcyBuZXcgY2hhbmdlLg0KDQpodHRwczovL2dpdGxhYi5j
b20vcHNtaXNjL3BzbWlzYy9jb21taXQvYjdkYzFjNWViOTQ1OWY4M2IyMzU1YzhmMDYxOTMzYzc0
YjcxYzcyNA0KDQpUaGFua3MsDQoNCkFudWoNCg==

