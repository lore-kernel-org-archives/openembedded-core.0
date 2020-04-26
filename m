Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.6161.1587875040607708874
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 21:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: abS7zAFsskVnZMOfcENYfS+xapeyQNfsS3Z0p9Ahh9mhoxVIpF92uInu0xK3CTdFqV3pw1qzE9
 Gi6Ph/kWLp0g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 21:24:00 -0700
IronPort-SDR: 3D/gu0D1byNI6scdAnSM2604D9pC+hTwubyqezRos6aZzD6KAIE3vivJmD+j7L92Kv0LaHkxl5
 Gi8RFqH93+YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,318,1583222400"; 
   d="scan'208";a="458402887"
Received: from kmsmsx151.gar.corp.intel.com ([172.21.73.86])
  by fmsmga006.fm.intel.com with ESMTP; 25 Apr 2020 21:23:59 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.234]) by
 KMSMSX151.gar.corp.intel.com ([169.254.10.192]) with mapi id 14.03.0439.000;
 Sun, 26 Apr 2020 12:23:58 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"bartlomiej.burdukiewicz@gmail.com" <bartlomiej.burdukiewicz@gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] libva: Removed virtual/mesa dependency
Thread-Topic: [OE-core] [meta-oe][PATCH] libva: Removed virtual/mesa
 dependency
Thread-Index: AQHWGkls20apd9+qPk68Tnfx8zSjZqiIvjqAgAD5ZwCAAJKvAA==
Date: Sun, 26 Apr 2020 04:23:57 +0000
Message-ID: <e5e73ac7edc8c2695ca5dd0d31e9d800480a4e8c.camel@intel.com>
References: <7de2a86b-e32c-35ae-716d-505845a837b2@gmail.com>
	 <28192.1587843536617759309@lists.openembedded.org>
In-Reply-To: <28192.1587843536617759309@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.149.228]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <A62485CCC2E7A04BAEF20C7915F9157F@intel.com>
Content-Transfer-Encoding: base64

T24gU2F0LCAyMDIwLTA0LTI1IGF0IDEyOjM4IC0wNzAwLCBCYXJ0xYJvbWllaiBCdXJkdWtpZXdp
Y3ogd3JvdGU6DQo+IE9uIFNhdCwgQXByIDI1LCAyMDIwIGF0IDA2OjQ2IEFNLCBLaGVtIFJhaiB3
cm90ZToNCj4gDQo+ID4gT24gNC8yNC8yMCA4OjAxIEFNLCBCYXJ0xYJvbWllaiBCdXJkdWtpZXdp
Y3ogd3JvdGU6ID4gTWVzYSBjYW4gYmUNCj4gPiBjb21waWxlZCB3aXRoIGxpYnZhIHN1cHBvcnQs
IGluIG9yZGVyIHRvIGF2b2lkIHJlY3Vyc2l2ZSA+DQo+ID4gZGVwZW5kZW5jeSBiZXR3ZWVuIG1l
c2EgYW5kIGxpYnZhLCB2aXJ0dWFsL21lc2EgbXVzdCBiZSByZW1vdmVkID4NCj4gPiBmcm9tIGxp
YnZhIHJlY2lwZS4gPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnTFgm9taWVqIEJ1cmR1a2lld2ljeg0K
PiA+IGJhcnRsb21pZWouYnVyZHVraWV3aWN6QGdtYWlsLmNvbSA+IC0tLSA+IG1ldGEvcmVjaXBl
cy0NCj4gPiBncmFwaGljcy9saWJ2YS9saWJ2YV8yLjYuMS5iYiB8IDIgKy0gPiAxIGZpbGUgY2hh
bmdlZCwgMQ0KPiA+IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKSA+ID4gZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy0NCj4gPiBncmFwaGljcy9saWJ2YS9saWJ2YV8yLjYuMS5iYiBiL21ldGEv
cmVjaXBlcy0NCj4gPiBncmFwaGljcy9saWJ2YS9saWJ2YV8yLjYuMS5iYiA+IGluZGV4IDkyY2Vh
ODNiYzEuLmMxYTQ0MWExOGIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvbGlidmEvbGlidmFfMi42LjEuYmIgPiArKysNCj4gPiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9saWJ2YS9saWJ2YV8yLjYuMS5iYiA+IEBAIC0yMyw3ICsyMyw3IEBADQo+ID4gU1JDX1VSSVtz
aGEyNTZzdW1dID0NCj4gPiAiNmM1N2ViNjQyZDgyOGFmMjQxMWFhMzhmNTVkYzEwMTExZThjOTg5
NzZkYmFiOGZkNjJlNDg2Mjk0MCA+ID4NCj4gPiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6
Ly9naXRodWIuY29tL2ludGVsL2xpYnZhL3JlbGVhc2VzIiA+ID4NCj4gPiAtREVQRU5EUyA9ICJs
aWJkcm0gdmlydHVhbC9tZXNhIiA+ICtERVBFTkRTID0gImxpYmRybSINCj4gPiANCj4gPiBJIGFt
IG5vdCBzdXJlIGhvdyBpdCB3aWxsIHdvcmsgd2l0aCBub24tbWVzYSBncmFwaGljcyBzdGFja3Mu
IE9yIGlzDQo+ID4gaXQgbm9uLWlzc3VlID8NCj4gPiANCj4gDQo+IEl0IGxvb2tzIGxpa2UgbGli
dmEgaXMgZGVzaWduZWQgdG8gd29yayB3aXRob3V0IG1lc2EgKG9yIG90aGVyDQo+IGdyYXBoaWNh
bCBzdGFja3MpLCBzaW5jZSBpdCdzIHVzaW5nIGxpYmRybSB0byBkaXNwYXRjaCBrZXJuZWwgY2Fs
bHMuIA0KPiBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9EaXJlY3RfUmVuZGVyaW5nX01h
bmFnZXIjL21lZGlhL0ZpbGU6RFJNX2FyY2hpdGVjdHVyZS5zdmcNCj4gDQo+IFRoZXJlIGlzIGFs
c28gZWJ1aWxkIGluIEdlbnRvbyBmb3IgbGlidmEgZG8gbm90IGRlcGVuZCBvbiBtZXNhICgNCj4g
aHR0cHM6Ly9kYXRhLmdwby56dWdhaW5hLm9yZy9nZW50b28veDExLWxpYnMvbGlidmEvbGlidmEt
Mi42LjEuZWJ1aWxkDQo+ICkgb3Igb3RoZXIgZ3JhcGhpY2FsIHN0YWNrcyAobGlrZSBudmlkaWEt
ZHJpdmVycyBvciBldGMuKS4NCg0KSSBzZWUgYSBERVBFTkQgb24gb3BlbmdsIHRoZXJlIHdoaWNo
IGlzIHdoYXQgZ2x4IGJhY2tlbmQgaW4gbGlidmENCmV4cGVjdHM6DQoNCmh0dHBzOi8vZ2l0aHVi
LmNvbS9pbnRlbC9saWJ2YS9ibG9iL21hc3Rlci9tZXNvbi5idWlsZCNMOTUNCg0KSnVzdCByZW1v
dmluZyB0aGUgZGVwZW5kZW5jeSB3aWxsIGZvcmNlIGdseCBiYWNrZW5kIHRvIG5vdCBiZSBidWls
dC4gSXMNCnRoZXJlIHNvZnR3YXJlIG91dCB0aGVyZSB0aGF0IGV4cGVjdHMgbGlidmEtZ2x4IHRv
IGJlIHByZXNlbnQ/DQoNClRoYW5rcywNCg0KQW51ag0K
