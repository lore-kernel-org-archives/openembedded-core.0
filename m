Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.46812.1612234678525500407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 18:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: xHFVzJuFz3plTyERUNb0ulBg4Hx5MVDbfrV7fXyfW3CafmDVGojn95VsKlmIE9/5RvhHpzOCW1
 M/xNUCwvSj1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="199698478"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="199698478"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 18:57:56 -0800
IronPort-SDR: +P8ruj+nNsmrRHhHDGhR2m6rIf31WDVJt9dpnRiF9RgBi1bJDLsZwLYbY8gcSdiwTMLrOL1uBG
 lQvOo669AnHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="356133121"
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143])
  by orsmga003.jf.intel.com with ESMTP; 01 Feb 2021 18:57:54 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx603.gar.corp.intel.com (172.21.219.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 2 Feb 2021 10:57:53 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Tue, 2 Feb 2021 10:57:53 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "JPEW.hacker@gmail.com" <JPEW.hacker@gmail.com>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add procps-lib to RDEPENDS
Thread-Topic: [OE-core][PATCH] igt-gpu-tools: add procps-lib to RDEPENDS
Thread-Index: AQHW7umjAEMHnc7uXECF5PxUvisj7apDPsulgAB7qgA=
Date: Tue, 2 Feb 2021 02:57:53 +0000
Message-ID: <39f0c1745d9a3d31c7256f7851267b49e7f7c3d5.camel@intel.com>
References: <20210120050318.10376-1-Qi.Chen@windriver.com>
	 <165F4E547FA339C3.13584@lists.openembedded.org>
	 <165F4F23A9F2744A.13584@lists.openembedded.org>
	 <260643e582bbeee2748e08e1fd7ebee4adbef888.camel@linuxfoundation.org>
In-Reply-To: <260643e582bbeee2748e08e1fd7ebee4adbef888.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B8165B50C5E944CBADC5B872580412B@intel.com>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMDIxLTAyLTAxIGF0IDExOjM0ICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gU3VuLCAyMDIxLTAxLTMxIGF0IDExOjU2ICswMDAwLCBSaWNoYXJkIFB1cmRpZSB2aWEN
Cj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBPbiBTdW4sIDIwMjEtMDEtMzEg
YXQgMTE6NDEgKzAwMDAsIFJpY2hhcmQgUHVyZGllIHZpYQ0KPiA+IGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDIwMjEtMDEtMjAgYXQgMTM6MDMgKzA4MDAsIENo
ZW4gUWkgd3JvdGU6DQo+ID4gPiA+IEJ1aWxkIGVycm9yIG9jY3VycyBhcyBiZWxvdzoNCj4gPiA+
ID4gDQo+ID4gPiA+IMKgwqBFUlJPUjogaWd0LWdwdS10b29scy0xLjI1K2dpdEFVVE9JTkMrZDE2
YWQwN2U3Zi1yMA0KPiA+ID4gPiBkb19wYWNrYWdlX3FhOg0KPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqBRQSBJc3N1ZTogL3Vzci9saWIvbGliaWd0LnNvLjAgY29udGFpbmVkIGluIHBhY2thZ2UN
Cj4gPiA+ID4gaWd0LWdwdS10b29scw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgIHJlcXVpcmVz
IGxpYnByb2Nwcy5zby44KExJQlBST0NQU18wKSg2NGJpdCksIGJ1dCBubw0KPiA+ID4gPiBwcm92
aWRlcnMNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCBmb3VuZCBpbiBSREVQRU5EU19pZ3QtZ3B1
LXRvb2xzPyBbZmlsZS1yZGVwc10NCj4gPiA+ID4gDQo+ID4gPiA+IEFkZCBwcm9jcHMtbGliIHRv
IFJERVBFTkRTIHRvIHNvbHZlIHRoaXMgaXNzdWUuDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+
ID4gPiDCoG1ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNf
Z2l0LmJiIHwgMg0KPiA+ID4gPiArLQ0KPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtDQo+ID4gPiA+IHRvb2xz
X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtDQo+
ID4gPiA+IHRvb2xzX2dpdC5iYg0KPiA+ID4gPiBpbmRleCA4OTQ4MGQ3OWQyLi5iMDEyZGJmNThl
IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaWd0LWdwdS10b29s
cy9pZ3QtZ3B1LXRvb2xzX2dpdC5iYg0KPiA+ID4gPiArKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvaWd0LWdwdS10b29scy9pZ3QtZ3B1LXRvb2xzX2dpdC5iYg0KPiA+ID4gPiBAQCAtMTUsNyAr
MTUsNyBAQCBTUkNfVVJJID0NCj4gPiA+ID4gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL2lndC1ncHUtDQo+ID4gPiA+IHRvb2xzLmdpdDtwcm90b2NvbD1odHRwcyINCj4gPiA+ID4g
wqBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiA+ID4gPiDCoA0KPiA+ID4gPiDCoERFUEVORFMgKz0g
ImxpYmRybSBsaWJwY2lhY2Nlc3MgY2Fpcm8gdWRldiBnbGliLTIuMCBwcm9jcHMNCj4gPiA+ID4g
bGlidW53aW5kIGttb2Qgb3BlbnNzbCBlbGZ1dGlscyBhbHNhLWxpYiBqc29uLWMgYmlzb24tbmF0
aXZlIg0KPiA+ID4gPiAtUkRFUEVORFNfJHtQTn0gKz0gImJhc2giDQo+ID4gPiA+ICtSREVQRU5E
U18ke1BOfSArPSAiYmFzaCBwcm9jcHMtbGliIg0KPiA+ID4gPiDCoFJERVBFTkRTXyR7UE59LXRl
c3RzICs9ICJiYXNoIg0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiBZb3UgYXJlIGNv
cnJlY3QgYWJvdXQgdGhpcyBhbmQgSSBzZWUgdGhlIHNhbWUgaXNzdWUgaWYgSSBidWlsZCBpdA0K
PiA+ID4gbG9jYWxseS4gV2hhdCB3b3JyaWVzIG1lIGlzIHdoeSB3ZSBkb24ndCBzZWUgdGhpcyBv
biB0aGUNCj4gPiA+IGF1dG9idWlsZGVyIGluDQo+ID4gPiB3b3JsZCBidWlsZHM/DQo+ID4gPiAN
Cj4gPiA+IENjJ2luZyBBbnVqIGFzIHRoZSBtYWludGFpbmVyLg0KPiA+IA0KPiA+IExvb2tpbmcg
YXQgdGhlIGF1dG9idWlsZGVyIGxvZ3MsIEkgdGhpbmsgSSBjYW4gZ3Vlc3MgdGhlIHByb2JsZW0s
IEkNCj4gPiB0aGluayBpdHMgYSBoYXNoIGVxdWl2YWxlbmNlIGlzc3VlLg0KPiA+IA0KPiA+IEVy
cm9ycyByYWlzZWQgYnkgZG9fcGFja2FnZV9xYSBhcmVuJ3QgcmVmbGVjdGVkIGluIHRoZSBvdXRw
dXQgc28gaXQNCj4gPiB3b3VsZCBlcnJvciBvbmNlIGFuZCB0aGVuIG5ldmVyIGFnYWluIGFzIHRo
ZSBvdXRwdXQgd291bGRuJ3Qgc2Vlbg0KPiA+IGNoYW5nZWQgbmV4dCB0aW1lIDooDQo+ID4gDQo+
ID4gV2UnbGwgaGF2ZSB0byBmaXggdGhpcywgaXRzIG5hc3R5Lg0KPiA+IA0KPiA+IENjOiBKb3No
dWENCj4gDQo+IEl0cyBub3QgYSBoYXNoZXF1aXYgaXNzdWUgZGlyZWN0bHkgYWx0aG91Z2ggdGhl
IFFBIHdhcm5pbmdzIG5vdCBiZWluZw0KPiBjYWNoZWQgaXMgYW0gdW5yZWxhdGVkIHByb2JsZW0u
DQo+IA0KPiBJdCBzZWVtcyBpZiB5b3UgYnVpbGQgaWd0LWdwdS10b29scyB3aXRoIC91c3IvbGli
NjQvIGl0IHdvcmtzIChhcyBvbg0KPiB0aGUgYXV0b2J1aWxkZXIgd2hlcmUgbXVsdGlsaWIgaXMg
ZW5hYmxlZCksIGlmIHlvdSBidWlsZCB3aXRoDQo+IC91c3IvbGliLw0KPiBpdCBnaXZlcyB0aGUg
UUEgd2FybmluZyBkZXNwaXRlIGFjdHVhbGx5IGhhdmluZyB0aGUgcmlnaHQgUkRFUEVORFMNCj4g
YW55d2F5Lg0KDQpJIHNlZSB0aGUgc2FtZSBmYWlsdXJlIGxvY2FsbHkgZXZlbiB3aGVuIHVzaW5n
IHRoZSBhdXRvYnVpbGRlcg0KY29uZmlndXJhdGlvbiBzbyBpdCdzIHByb2JhYmx5IG5vdCByZWxh
dGVkIHRvIG11bHRpbGliLg0KDQpJIGd1ZXNzIGl0J3MgaGFwcGVuaW5nIGJlY2F1c2UgcHJvY3Bz
IHdhcyBzcGxpdCB1cCByZWNlbnRseSB0byBoYXZlIHRoZQ0KbGliIGluc3RhbGxlZCBpbiBhIHNl
cGFyYXRlIHBhY2thZ2UgYW5kIHRoYXQgZGlkbid0IHJlc3VsdCBpbiBhIHJlYnVpbGQNCm9mIGln
dC1ncHUtdG9vbHM/DQoNClRoYW5rcywNCg0KQW51ag0K
