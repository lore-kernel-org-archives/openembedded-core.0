Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.300.1596690295785974338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 22:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: JqWAvplkbYqOpA56Ac5fsmVRgCL8D4+f80HdQi1ennj2aBscqt4J9n7A9S/HEDoCWr1c/ofgWg
 JPkKozf5rusQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9704"; a="217065505"
X-IronPort-AV: E=Sophos;i="5.75,440,1589266800"; 
   d="scan'208";a="217065505"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2020 22:04:54 -0700
IronPort-SDR: PePntbYZCz/54VVzxOopEc11YF0dS452rbgknXzSmRq+ESNeefVg62rUOn6IwjPHpGdRMHv9/X
 oRfDoymdGqAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,440,1589266800"; 
   d="scan'208";a="467716256"
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143])
  by orsmga005.jf.intel.com with ESMTP; 05 Aug 2020 22:04:53 -0700
Received: from kmsmsx603.gar.corp.intel.com (172.21.219.143) by
 kmsmsx603.gar.corp.intel.com (172.21.219.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 6 Aug 2020 13:04:52 +0800
Received: from pgsmsx105.gar.corp.intel.com (10.221.44.96) by
 kmsmsx603.gar.corp.intel.com (172.21.219.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 6 Aug 2020 13:04:52 +0800
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.74]) by
 PGSMSX105.gar.corp.intel.com ([169.254.4.104]) with mapi id 14.03.0439.000;
 Thu, 6 Aug 2020 13:04:52 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "kexin.hao@windriver.com" <kexin.hao@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, "Jon.Mason@arm.com"
	<Jon.Mason@arm.com>, "ross@burtonini.com" <ross@burtonini.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] kernel/yocto: conslidated pull request
Thread-Topic: [OE-core] [PATCH 0/4] kernel/yocto: conslidated pull request
Thread-Index: AQHWaxkYungTTTzOs0eRMyun3o7/QKkqAeyA
Date: Thu, 6 Aug 2020 05:04:51 +0000
Message-ID: <cc48a8ec9e8066248c2c29662bc9e28dd3d7645f.camel@intel.com>
References: <cover.1594989620.git.bruce.ashfield@gmail.com>
	 <16285A84D29254CC.27500@lists.openembedded.org>
	 <7af01e4c3d12d960a7c8820f773f77658d6d59e5.camel@linuxfoundation.org>
In-Reply-To: <7af01e4c3d12d960a7c8820f773f77658d6d59e5.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.139.88]
MIME-Version: 1.0
Return-Path: anuj.mittal@intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E67A43BF10E0AE469C8AB745CD163C01@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTA4LTA1IGF0IDEyOjEwICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gV2VkLCAyMDIwLTA4LTA1IGF0IDEyOjA2ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB2aWEN
Cj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBPbiBGcmksIDIwMjAtMDctMTcg
YXQgMDg6NTYgLTA0MDAsIGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbSB3cm90ZToNCj4gPiA+IEhl
cmUncyBteSBsYXRlc3Qgc2V0IG9mIHBhdGNoZXMuDQo+ID4gPiANCj4gPiA+IEZvciA1LjQ6IGEg
LXN0YWJsZSB1cGRhdGUsIGFuZCAtcnQgYnVnIGZpeA0KPiA+ID4gDQo+ID4gPiBGb3IgdGhlIGJ1
aWxkOiBhIHR3ZWFrIHRvIHRoZSBjb25maWcgZ2VuZXJhdGlvbiAoYXMgcmVwb3J0ZWQNCj4gPiA+
IGFuZCBkaXNjdXNzZWQgb24gdGhlIG1haWxpbmcgbGlzdCkNCj4gPiA+IA0KPiA+ID4gRm9yIDUu
OCAoYWthIHRoZSBuZXh0IHJlZmVyZW5jZSBrZXJuZWwpOiBhIGZpeCBmb3IgZGV2c3JjIGFuZA0K
PiA+ID4gb24gdGFyZ2V0IGtlcm5lbCBidWlsZGluZy4gV2l0aCB0aGlzIHR3ZWFrLCBJIGhhdmUg
YWxsIG9mIHRoZQ0KPiA+ID4gcmVmcmVuY2VzIGJvb3RpbmcgYW5kIHBhc3NpbmcgbW9zdCB0ZXN0
cyBvbiA1LjgsIHNvIHdlIGFyZSBpbg0KPiA+ID4gZ29vZCBzaGFwZSBvbiB0aGF0IGZyb250LiBJ
J2xsIGJlIGRvaW5nIGxpYmMtaGVhZGVycyB0ZXN0aW5nDQo+ID4gPiBuZXh0Lg0KPiA+ID4gDQo+
ID4gPiBJIHJhbiB0aGVzZSB0aHJvdWdoIHRoZSBBQiBhbmQgbG9jYWwgdGVzdGluZywgbm8gaXNz
dWVzIHBvcHBlZA0KPiA+ID4gdXAsIGV4Y2VwdCBhIHdhcm5pbmcgb24gcWVtdWFybS1hbHQgaW4g
bXkgbGFzdCBydW4uIEl0IHdhcw0KPiA+ID4gYWJvdXQgYSBjb25zb2xlIGxvZ2luIGFuZCBkaWRu
J3QgbG9vayByZWxhdGVkIHRvIHRoZSBjaGFuZ2UsDQo+ID4gPiBidXQgSSdtIGtlZXBpbmcgbXkg
ZXllIG9uIGl0Lg0KPiA+IA0KPiA+IFRoYW5rcywgSSByYW4gdGhpcyBjb21iaW5lZCB3aXRoIEto
ZW0ncyBiaW51dGlscyBjaGFuZ2UgdGhyb3VnaCB0aGUNCj4gPiBhdXRvYnVpbGRlciBhbmQgeW91
ciBjaGFuZ2VzIGFyZSBsaWtlbHkgZmluZSBidXQgd2UgbmVlZCBtb3JlIHdvcmsNCj4gPiB0bw0K
PiA+IGdldCBiaW51dGlscyBpbi4gQmFzaWNhbGx5Og0KPiA+IA0KPiA+ICogbWV0YS1hcm0gbmVl
ZHMgdG8gYWRkIHRoZSBrZXJuZWwgcGF0Y2ggZm9yIHBlcmYNCj4gPiAqIG1ldGEtaW50ZWwgbmVl
ZHMgdG8gYWRkIHRoZSBrZXJuZWwgcGF0Y2ggZm9yIHBlcmYNCj4gPiAqIHRoZSBoYXJkd2FyZSBC
U1BzIG5lZWQgdG8gYWRkIHRoZSBrZXJuZWwgcGF0Y2ggZm9yIHBlcmYNCj4gPiANCj4gPiBJJ3Zl
IGFkZGVkIGEgZmV3IG1haW50YWluZXJzL3Blb3BsZSB0byB0aGUgYWRkcmVzcyBsaXN0IHRvIHRy
eSBhbmQNCj4gPiBzb3J0DQo+ID4gdGhhdCBvdXQuIFdobyBpcyBnb2luZyB0byBoYW5kbGUgdGhl
IGhhcmR3YXJlIHBsYXRmb3Jtcz8NCj4gDQo+IFNvcnJ5LCB0aGUgdXJsIGZvciB0aGUgZmFpbGlu
ZyBidWlsZHM6DQo+IA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlw
aG9vbi8jL2J1aWxkZXJzLzgzL2J1aWxkcy8xMjMxDQo+IA0KPiBUaGUga2VybmVsIHR3ZWFrIG5l
ZWRlZCBmb3IgYmludXRpbHMgMi4zNToNCj4gDQo+IGh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9y
Zy9jZ2l0L2NnaXQuY2dpL2xpbnV4LXlvY3RvL2NvbW1pdC8/aD12NS40L3N0YW5kYXJkL2Jhc2Um
aWQ9MWZlNGVlN2Y2ODBjM2Y2OWY2MjBkNjhhNWQyZjczNDFlOGRiNjkzYg0KPiANCg0KVGhhbmtz
IFJpY2hhcmQuIEkgaGF2ZSBpbmNsdWRlZCB0aGUgcGF0Y2ggaW4gbWV0YS1pbnRlbC4NCg0KVGhh
bmtzLA0KDQpBbnVqDQo=
