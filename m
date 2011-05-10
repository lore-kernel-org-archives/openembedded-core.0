Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1QJf9e-0001BY-Cp
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:06:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 May 2011 22:03:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,344,1301900400"; d="scan'208";a="640473626"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga002.jf.intel.com with ESMTP; 09 May 2011 22:03:55 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 10 May 2011 13:03:51 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 10 May 2011 13:03:51 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Tue, 10 May 2011 13:03:49 +0800
From: "He, Qing" <qing.he@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2011 13:03:48 +0800
Thread-Topic: [OE-core] [PATCH 1/1] rsync (GPLv2): fix security
	vulnerability CVE-2007-4091
Thread-Index: AcwOz2u6cySzauQ3SzaVyjxzpisIzwAAB0yw
Message-ID: <1865303E0DED764181A9D882DEF65FB6933502FCC3@shsmsx502.ccr.corp.intel.com>
References: <cover.1304995908.git.dexuan.cui@intel.com>
	<29a6f5e598717a6c701495174db9ef4f448e64e7.1304995908.git.dexuan.cui@intel.com>
	<4DC8C6C3.6070000@linux.intel.com>
In-Reply-To: <4DC8C6C3.6070000@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] rsync (GPLv2): fix security vulnerability CVE-2007-4091
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
X-List-Received-Date: Tue, 10 May 2011 05:06:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogb3BlbmVtYmVkZGVkLWNvcmUtYm91
bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+W21haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBTYXVsDQo+V29sZA0K
PlNlbnQ6IDIwMTHE6jXUwjEwyNUgMTM6MDINCj5UbzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMg
YWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINCj5TdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAx
LzFdIHJzeW5jIChHUEx2Mik6IGZpeCBzZWN1cml0eSB2dWxuZXJhYmlsaXR5DQo+Q1ZFLTIwMDct
NDA5MQ0KPg0KPk9uIDA1LzA5LzIwMTEgMDc6NTQgUE0sIERleHVhbiBDdWkgd3JvdGU6DQo+PiBG
cm9tOiBEZXh1YW4gQ3VpPGRleHVhbi5jdWlAaW50ZWwuY29tPg0KPj4NCj4+IEFkZGVkIGEgcGF0
Y2ggdG8gZml4DQo+PiBodHRwOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1
bG5JZD1DVkUtMjAwNy00MDkxDQo+Pg0KPlRoaXMgaXMgbWlzc2luZyBhIFtZT0NUTyAjYnVnaWRd
LCBwbGVhc2UgYWRkIGFuZCByZXNlbmQuICh1cGRhdGUgYnJhbmNoDQo+aXMgT0spLg0KDQpTYXVs
LA0KCUJlZm9yZSB0aGUgb3RoZXIgdHdvIENWRXMgYXJlIHNwZWNpZmljYWxseSBhZGRyZXNzZWQs
IEkgZG9uJ3QgdGhpbmsgd2UgY2FuIGNhbGwgYSBjbG9zZSBvbiB0aGlzIGJ1Zy4NCg0KVGhhbmtz
LA0KUWluZw0KDQo+DQo+U2F1IQ0KPg0KPj4gU2lnbmVkLW9mZi1ieTogRGV4dWFuIEN1aTxkZXh1
YW4uY3VpQGludGVsLmNvbT4NCj4+IC0tLQ0KPj4gICAuLi4vcnN5bmMvcnN5bmMtMi42LjkvcnN5
bmMtMi42LjktZm5hbWUtb2JvLnBhdGNoICB8ICAgNzANCj4rKysrKysrKysrKysrKysrKysrKw0K
Pj4gICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvcnN5bmNfMi42LjkuYmIgICAgICAgICB8
ICAgIDMgKy0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9ucygtKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQNCj5tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cnN5bmMvcnN5bmMtMi42LjkvcnN5bmMtMi42LjktZm5hbWUtb2JvLnBhdGNoDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3luYy0yLjYuOS9yc3luYy0y
LjYuOS1mbmFtZS1vYm8ucGF0Y2gNCj5iL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3lu
Yy0yLjYuOS9yc3luYy0yLjYuOS1mbmFtZS1vYm8ucGF0Y2gNCj4+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+PiBpbmRleCAwMDAwMDAwLi5mMDU0NDUyDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnN5bmMvcnN5bmMtMi42LjkvcnN5bmMtMi42LjktZm5h
bWUtb2JvLnBhdGNoDQo+PiBAQCAtMCwwICsxLDcwIEBADQo+PiArVXBzdHJlYW0tU3RhdHVzOiBC
YWNrcG9ydCBbIFRoZSBwYXRjaCBpcyByc3luYy0yLjYuOSBzcGVjaWZpYyBdDQo+PiArDQo+PiAr
VGhlIHBhdGNoIGlzIGZyb20gaHR0cHM6Ly9pc3N1ZXMucnBhdGguY29tL2Jyb3dzZS9SUEwtMTY0
NyBhbmQgaXMgdXNlZCB0bw0KPj4gK2FkZHJlc3MgaHR0cDovL3dlYi5udmQubmlzdC5nb3Yvdmll
dy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMDctNDA5MQ0KPj4gKw0KPj4gK0RhdGU6ICAgVHVl
IE1heSAxMCAxMDowNzozNiAyMDExICswODAwDQo+PiArRGV4dWFuIEN1aTxkZXh1YW4uY3VpQGlu
dGVsLmNvbT4NCj4+ICsNCj4+ICtkaWZmIC0tZ2l0IGEvc2VuZGVyLmMgYi9zZW5kZXIuYw0KPj4g
K2luZGV4IDZmY2FhNjUuLjA1M2E4ZjEgMTAwNjQ0DQo+PiArLS0tIGEvc2VuZGVyLmMNCj4+ICsr
KysgYi9zZW5kZXIuYw0KPj4gK0BAIC0xMjMsNiArMTIzLDcgQEAgdm9pZCBzdWNjZXNzZnVsX3Nl
bmQoaW50IG5keCkNCj4+ICsgCWNoYXIgZm5hbWVbTUFYUEFUSExFTl07DQo+PiArIAlzdHJ1Y3Qg
ZmlsZV9zdHJ1Y3QgKmZpbGU7DQo+PiArIAl1bnNpZ25lZCBpbnQgb2Zmc2V0Ow0KPj4gKysJc2l6
ZV90IGwgPSAwOw0KPj4gKw0KPj4gKyAJaWYgKG5keDwgIDAgfHwgbmR4Pj0gdGhlX2ZpbGVfbGlz
dC0+Y291bnQpDQo+PiArIAkJcmV0dXJuOw0KPj4gK0BAIC0xMzMsNiArMTM0LDIwIEBAIHZvaWQg
c3VjY2Vzc2Z1bF9zZW5kKGludCBuZHgpDQo+PiArIAkJCQkgICAgZmlsZS0+ZGlyLnJvb3QsICIv
IiwgTlVMTCk7DQo+PiArIAl9IGVsc2UNCj4+ICsgCQlvZmZzZXQgPSAwOw0KPj4gKysNCj4+ICsr
CWwgPSBvZmZzZXQgKyAxOw0KPj4gKysJaWYgKGZpbGUpIHsNCj4+ICsrCQlpZiAoZmlsZS0+ZGly
bmFtZSkNCj4+ICsrCQkJbCArPSBzdHJsZW4oZmlsZS0+ZGlybmFtZSk7DQo+PiArKwkJaWYgKGZp
bGUtPmJhc2VuYW1lKQ0KPj4gKysJCQlsICs9IHN0cmxlbihmaWxlLT5iYXNlbmFtZSk7DQo+PiAr
Kwl9DQo+PiArKw0KPj4gKysJaWYgKGw+PSBzaXplb2YoZm5hbWUpKSB7DQo+PiArKwkJcnByaW50
ZihGRVJST1IsICJPdmVybG9uZyBwYXRobmFtZVxuIik7DQo+PiArKwkJZXhpdF9jbGVhbnVwKFJF
UlJfRklMRVNFTEVDVCk7DQo+PiArKwl9DQo+PiArKw0KPj4gKyAJZl9uYW1lKGZpbGUsIGZuYW1l
ICsgb2Zmc2V0KTsNCj4+ICsgCWlmIChyZW1vdmVfc291cmNlX2ZpbGVzKSB7DQo+PiArIAkJaWYg
KGRvX3VubGluayhmbmFtZSkgPT0gMCkgew0KPj4gK0BAIC0yMjQsNiArMjM5LDcgQEAgdm9pZCBz
ZW5kX2ZpbGVzKHN0cnVjdCBmaWxlX2xpc3QgKmZsaXN0LCBpbnQgZl9vdXQsIGludCBmX2luKQ0K
Pj4gKyAJZW51bSBsb2djb2RlIGxvZ19jb2RlID0gbG9nX2JlZm9yZV90cmFuc2ZlciA/IEZMT0cg
OiBGSU5GTzsNCj4+ICsgCWludCBmX3hmZXIgPSB3cml0ZV9iYXRjaDwgIDAgPyBiYXRjaF9mZCA6
IGZfb3V0Ow0KPj4gKyAJaW50IGksIGo7DQo+PiArKwlzaXplX3QgbCA9IDA7DQo+PiArDQo+PiAr
IAlpZiAodmVyYm9zZT4gIDIpDQo+PiArIAkJcnByaW50ZihGSU5GTywgInNlbmRfZmlsZXMgc3Rh
cnRpbmdcbiIpOw0KPj4gK0BAIC0yNTksNiArMjc1LDIwIEBAIHZvaWQgc2VuZF9maWxlcyhzdHJ1
Y3QgZmlsZV9saXN0ICpmbGlzdCwgaW50IGZfb3V0LCBpbnQgZl9pbikNCj4+ICsgCQkJCWZuYW1l
W29mZnNldCsrXSA9ICcvJzsNCj4+ICsgCQl9IGVsc2UNCj4+ICsgCQkJb2Zmc2V0ID0gMDsNCj4+
ICsrDQo+PiArKwkJbCA9IG9mZnNldCArIDE7DQo+PiArKwkJaWYgKGZpbGUpIHsNCj4+ICsrCQkJ
aWYgKGZpbGUtPmRpcm5hbWUpDQo+PiArKwkJCQlsICs9IHN0cmxlbihmaWxlLT5kaXJuYW1lKTsN
Cj4+ICsrCQkJaWYgKGZpbGUtPmJhc2VuYW1lKQ0KPj4gKysJCQkJbCArPSBzdHJsZW4oZmlsZS0+
YmFzZW5hbWUpOw0KPj4gKysJCX0NCj4+ICsrDQo+PiArKwkJaWYgKGw+PSBzaXplb2YoZm5hbWUp
KSB7DQo+PiArKwkJCXJwcmludGYoRkVSUk9SLCAiT3ZlcmxvbmcgcGF0aG5hbWVcbiIpOw0KPj4g
KysJCQlleGl0X2NsZWFudXAoUkVSUl9GSUxFU0VMRUNUKTsNCj4+ICsrCQl9DQo+PiArKw0KPj4g
KyAJCWZuYW1lMiA9IGZfbmFtZShmaWxlLCBmbmFtZSArIG9mZnNldCk7DQo+PiArDQo+PiArIAkJ
aWYgKHZlcmJvc2U+ICAyKQ0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
c3luYy9yc3luY18yLjYuOS5iYg0KPmIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5j
XzIuNi45LmJiDQo+PiBpbmRleCA0MzM3OTgyLi4xN2MxOGE0IDEwMDY0NA0KPj4gLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3JzeW5jL3JzeW5jXzIuNi45LmJiDQo+PiArKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcnN5bmMvcnN5bmNfMi42LjkuYmINCj4+IEBAIC04LDYgKzgsNyBAQCBQ
UklPUklUWSA9ICJvcHRpb25hbCINCj4+ICAgREVQRU5EUyA9ICJwb3B0Ig0KPj4NCj4+ICAgU1JD
X1VSSSA9ICJodHRwOi8vcnN5bmMuc2FtYmEub3JnL2Z0cC9yc3luYy9zcmMvcnN5bmMtJHtQVn0u
dGFyLmd6IFwNCj4+ICsgICAgICAgICAgIGZpbGU6Ly9yc3luYy0yLjYuOS1mbmFtZS1vYm8ucGF0
Y2ggXA0KPj4gICAgICAgICAgICAgIGZpbGU6Ly9yc3luY2QuY29uZiINCj4+DQo+PiAgIGluaGVy
aXQgYXV0b3Rvb2xzDQo+PiBAQCAtMjIsNCArMjMsNCBAQCBFWFRSQV9PRU1BS0U9J1NUUklQPSIi
Jw0KPj4gICBMSUNFTlNFID0gIkdQTHYyKyINCj4+ICAgTElDX0ZJTEVTX0NIS1NVTSA9DQo+ImZp
bGU6Ly9DT1BZSU5HO21kNT02ZDVhOWQ0YzRkM2FmMjVjZDY4ZmQ4M2U4YThjYjA5YyINCj4+DQo+
PiAtUFIgPSAicjIiDQo+PiArUFIgPSAicjMiDQo+DQo+X19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj5PcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QN
Cj5PcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+aHR0cDovL2xpc3Rz
LmxpbnV4dG9nby5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3Jl
DQo=


