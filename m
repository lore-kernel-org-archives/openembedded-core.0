Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.13789.1604678680039180614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 08:04:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: wzqjHzlTR2c4GB7r7q6mnZl2C1iKWhIUyWOGaFUzf29skvHnQO2OiTXuUt+XT7LiBvYW5o40Os
 6/9xKcq+ZFlg==
X-IronPort-AV: E=McAfee;i="6000,8403,9797"; a="233726303"
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="233726303"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2020 08:04:38 -0800
IronPort-SDR: KhoqDKvNMsXI0zIdyPKM3RAujgC4MMD2qNoxebHW2drnT4BE72oqTnRlok+bjh02tF+jeoJysj
 inO5kwzRzA4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,457,1596524400"; 
   d="scan'208";a="354781762"
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143])
  by fmsmga004.fm.intel.com with ESMTP; 06 Nov 2020 08:04:37 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx603.gar.corp.intel.com (172.21.219.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 7 Nov 2020 00:04:36 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Sat, 7 Nov 2020 00:04:36 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [gatesgarth][PATCH 22/22] update_udev_hwdb: clean hwdb.bin
Thread-Topic: [OE-core] [gatesgarth][PATCH 22/22] update_udev_hwdb: clean
 hwdb.bin
Thread-Index: AQHWtFPXz5CB1nfA40GIgxNvOJRVO6m6vj4A
Date: Fri, 6 Nov 2020 16:04:36 +0000
Message-ID: <9f21fe25eee1d915590f9398a8e91d67feb5c00f.camel@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
	 <1bc33490ef6c48a3665bee69be398866ffd2d76a.1604643684.git.anuj.mittal@intel.com>
	 <CAOSpxdbqAbYhhHfR3sHUzOMakcvcECmM6UpjHUdKYw-Vi+_wmw@mail.gmail.com>
In-Reply-To: <CAOSpxdbqAbYhhHfR3sHUzOMakcvcECmM6UpjHUdKYw-Vi+_wmw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6A533AC1669464BBAF9C8E1A0B9197A@intel.com>
Content-Transfer-Encoding: base64

SGkgU3RldmUsDQoNCk9uIEZyaSwgMjAyMC0xMS0wNiBhdCAwNTo0NSAtMTAwMCwgU3RldmUgU2Fr
b21hbiB3cm90ZToNCj4gVGhpcyBpcyBhbm90aGVyIHBhdGNoIEkgZG9uJ3Qgc2VlIGluIG1hc3Rl
ciAtLSBqdXN0IGluIGNhc2UgdGhlcmUgaXMNCj4gYQ0KPiAibWFzdGVyIGZpcnN0IiBwb2xpY3kg
Zm9yIGdhdGVzZ2FydGguDQo+IA0KDQpZZXMsIGl0IHNob3VsZCBiZSBtYXN0ZXIgZmlyc3QuIEkg
Y2FuIHNlZSBpdCBoZXJlOg0KDQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dp
dC5jZ2kvcG9reS9jb21taXQvP2lkPTk5NGNhNjVlNmY4MjhkZDM4ZTBkN2QwOWZiNTI0MzE0N2Jh
NGUzNmINCg0KVGhhbmtzLA0KDQpBbnVqDQoNCj4gU3RldmUNCj4gDQo+IE9uIFRodSwgTm92IDUs
IDIwMjAgYXQgODoyOSBQTSBBbnVqIE1pdHRhbCA8YW51ai5taXR0YWxAaW50ZWwuY29tPg0KPiB3
cm90ZToNCj4gPiANCj4gPiBGcm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29t
Pg0KPiA+IA0KPiA+IFN0ZXBzIHRvIHJlcHJvZHVjZToNCj4gPiBlY2hvICJJTUFHRV9JTlNUQUxM
X2FwcGVuZCA9IFwiIHVkZXYtaHdkYiBsaWIzMi11ZGV2LWh3ZGJcIiIgPj4NCj4gPiBjb25mL2xv
Y2FsLmNvbmYNCj4gPiANCj4gPiBXaGVuIGluc3RhbGwgYm90aCB1ZGV2LWh3ZGIgYW5kIGxpYjMy
LXVkZXYtaHdkYiBhcyBhYm92ZSwNCj4gPiB0aGVyZSBjb21lcyBiZWxvdyBkb19wb3B1bGF0ZV9z
ZGsgZXJyb3I6DQo+ID4gwqAkIGJpdGJha2UgY29yZS1pbWFnZS1zYXRvwqAgLWMgcG9wdWxhdGVf
c2RrDQo+ID4gwqBFUlJPUjogVGFzayAoL3BhdGgvY29yZS1pbWFnZS1zYXRvLmJiOmRvX3BvcHVs
YXRlX3NkaykgZmFpbGVkIHdpdGgNCj4gPiBleGl0IGNvZGUgJzEzNCcNCj4gPiDCoE5PVEU6IFRh
c2tzIFN1bW1hcnk6IEF0dGVtcHRlZCA1NTU0IHRhc2tzIG9mIHdoaWNoIDAgZGlkbid0IG5lZWQN
Cj4gPiB0byBiZSByZXJ1biBhbmQgMSBmYWlsZWQuDQo+ID4gDQo+ID4gwqAkIGNhdCAvcGF0aC90
bXAvd29yay9xZW11eDg2XzY0LXBva3ktbGludXgvY29yZS1pbWFnZS1zYXRvLzEuMC0NCj4gPiBy
NS9wc2V1ZG8vcHNldWRvLmxvZw0KPiA+IMKgW3NuaXBdDQo+ID4gwqBpbm9kZSBtaXNtYXRjaDog
Jy9wYXRoL3RtcC93b3JrL3FlbXV4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLQ0KPiA+IHNh
dG8vMS4wLXI1L3Nkay9pbWFnZS91c3IvbG9jYWwvb2Vjb3JlLXg4Nl82NC9zeXNyb290cy9jb3Jl
Mi02NC0NCj4gPiBwb2t5LWxpbnV4L2xpYi91ZGV2L2h3ZGIuYmluJyBpbm8gNDI3MzgzMDQwIGlu
IGRiLCA0MjczODMwNDIgaW4NCj4gPiByZXF1ZXN0Lg0KPiA+IMKgW3NuaXBdDQo+ID4gDQo+ID4g
SXQgaXMgYmVjYXVzZSBib3RoIHVkZXYtaHdkYiBhbmQgbGliMzItdWRldi1od2RiIHdpbGwgZ2Vu
ZXJhdGUNCj4gPiAke1NES19PVVRQVVR9LyR7U0RLVEFSR0VUU1lTUk9PVH0vbGliL3VkZXYvaHdk
Yi5iaW4gZHVyaW5nDQo+ID4gZG9fcG9wdWxhdGVfc2RrDQo+ID4gYW5kIGl0IHRyaWdnZXJzIHBz
ZXVkbyBlcnJvci4NCj4gPiANCj4gPiBTbyBjbGVhbiBod2RiLmJpbiBiZWZvcmUgZ2VuZXJhdGUg
aHdkYi5iaW4gdG8gYXZvaWQgY29uZmxpY3QgdG8NCj4gPiBmaXggdGhlIGFib3ZlIGRvX3BvcHVs
YXRlX3NkayBlcnJvci4NCj4gPiANCj4gPiAoRnJvbSBPRS1Db3JlIHJldjogYzc0NzI5MjVmZWI1
M2NlOTJjMTc5OWZlYmEyYjdhOTEwNGUzZjM4ZikNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBN
aW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJp
Y2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiA+IChj
aGVycnkgcGlja2VkIGZyb20gY29tbWl0DQo+ID4gOTk0Y2E2NWU2ZjgyOGRkMzhlMGQ3ZDA5ZmI1
MjQzMTQ3YmE0ZTM2YikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVqIE1pdHRhbCA8YW51ai5taXR0
YWxAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKgc2NyaXB0cy9wb3N0aW5zdC1pbnRlcmNlcHRz
L3VwZGF0ZV91ZGV2X2h3ZGIgfCAxICsNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9zY3JpcHRzL3Bvc3RpbnN0LWludGVyY2VwdHMv
dXBkYXRlX3VkZXZfaHdkYg0KPiA+IGIvc2NyaXB0cy9wb3N0aW5zdC1pbnRlcmNlcHRzL3VwZGF0
ZV91ZGV2X2h3ZGINCj4gPiBpbmRleCAxMDJlOTliOTQ3Li44MDc2YjhhZTZmIDEwMDY0NA0KPiA+
IC0tLSBhL3NjcmlwdHMvcG9zdGluc3QtaW50ZXJjZXB0cy91cGRhdGVfdWRldl9od2RiDQo+ID4g
KysrIGIvc2NyaXB0cy9wb3N0aW5zdC1pbnRlcmNlcHRzL3VwZGF0ZV91ZGV2X2h3ZGINCj4gPiBA
QCAtMTcsNSArMTcsNiBAQCBjYXNlICIke1BSRUZFUlJFRF9QUk9WSURFUl91ZGV2fSIgaW4NCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOzsNCj4gPiDCoGVzYWMNCj4gPiANCj4g
PiArcm0gLWYgJEQke1VERVZMSUJESVJ9L3VkZXYvaHdkYi5iaW4NCj4gPiDCoFBTRVVET19VTkxP
QUQ9MSAke2JpbnByZWZpeH1xZW11d3JhcHBlciAtTCAkRA0KPiA+ICREJHtsaWJleGVjZGlyfS8k
e2JpbnByZWZpeH11ZGV2YWRtIGh3ZGIgLS11cGRhdGUgLS1yb290ICREDQo+ID4gJHtVREVWX0VY
VFJBX0FSR1N9DQo+ID4gwqBjaG93biByb290OnJvb3QgJEQke1VERVZMSUJESVJ9L3VkZXYvaHdk
Yi5iaW4NCj4gPiAtLQ0KPiA+IDIuMjguMA0KPiA+IA0KPiA+IA0KPiA+IA0KPiA+IA0KPiANCj4g
DQo+IA0KDQo=
