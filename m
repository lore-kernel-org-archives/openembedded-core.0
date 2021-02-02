Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.45370.1612227636790780141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 17:00:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 73cwdTbTdFmjDku/ipvbKuk340wl/VVweFXHgSEMh9gTMkmhLe/EDj3WJNhD5AyB6Uz7FIOVoP
 ZDxpVu5kT7zg==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="242294699"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="242294699"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 17:00:33 -0800
IronPort-SDR: e4RD0HdUipcXt54+PwL18E8qH9JX1/yy9wVgWQX+pxIEB+kVdEL3B2KJLvCvSTIoCQPRhy4Sek
 ddfUnGcdLXjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; 
   d="scan'208";a="479363028"
Received: from pgsmsx602.gar.corp.intel.com ([10.108.199.137])
  by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2021 17:00:32 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx602.gar.corp.intel.com (10.108.199.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 2 Feb 2021 09:00:31 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Tue, 2 Feb 2021 09:00:31 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Jamaluddin, Khairul Rohaizzat"
	<khairul.rohaizzat.jamaluddin@intel.com>
Subject: Re: [OE-core] [PATCH] qemu: whitelist CVE-2020-15863
Thread-Topic: [OE-core] [PATCH] qemu: whitelist CVE-2020-15863
Thread-Index: AQHW+PvYE9N26+16yU2CVSInyFklAapDhYYA
Date: Tue, 2 Feb 2021 01:00:31 +0000
Message-ID: <532816f2d3929a4e2c40e14cc55f4bf4ab8a1984.camel@intel.com>
References: <1612226347-65529-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
In-Reply-To: <1612226347-65529-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <51F9AC36ECDF9B409B9049F58DD4DC29@intel.com>
Content-Transfer-Encoding: base64

DQpPbiBUdWUsIDIwMjEtMDItMDIgYXQgMDg6MzkgKzA4MDAsIEphbWFsdWRkaW4sIEtoYWlydWwg
Um9oYWl6emF0IHdyb3RlOg0KPiBGcm9tOiBLaGFpcnVsIFJvaGFpenphdCBKYW1hbHVkZGluIDwN
Cj4ga2hhaXJ1bC5yb2hhaXp6YXQuamFtYWx1ZGRpbkBpbnRlbC5jb20+DQo+IA0KPiBJdCBpcyBh
biByZXBvcnRlZCBhcyB0byBhZmZlY3Qgb24gcmMwIHJlbGVhc2Ugb2YgcWVtdS01LjEuMA0KPiBo
dHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyMC0xNTg2Mw0KPiANCj4gSXQg
d2FzIGFscmVhZHkgcGF0Y2hlZCBpbg0KPiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL2Nn
aXQvY2dpdC5jZ2kvcG9reS9jb21taXQvP2lkPWQzYzYwY2RlMDNmZDdkZTExNzc2ZWMwNGZmNTBj
NjFiNmUxZjYxNDANCj4gDQoNClRoaXMgcGF0Y2ggd2FzIGFkZGVkIGZvciA1LjAuMC7CoFRoZSB2
ZXJzaW9uIGluIG1hc3RlciByaWdodCBub3cgaXMNCjUuMi4wIC4uLg0KDQpJcyB0aGlzIENWRSBy
ZWFsbHkgYmVpbmcgZmxhZ2dlZCBieSBjdmUgY2hlY2tlciBmb3IgbWFzdGVyIGJyYW5jaD8gVGhl
DQpDUEUgZGF0YSBsb29rcyBjb3JyZWN0IHNvIHdoeSBpcyB0aGlzIHJlcXVpcmVkIHRvIGJlIHdo
aXRlbGlzdGVkPw0KDQpUaGFua3MsDQoNCkFudWoNCg0KPiBTaWduZWQtb2ZmLWJ5OiBLaGFpcnVs
IFJvaGFpenphdCBKYW1hbHVkZGluIDwNCj4ga2hhaXJ1bC5yb2hhaXp6YXQuamFtYWx1ZGRpbkBp
bnRlbC5jb20+DQo+IC0tLQ0KPiDCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5j
IHwgMyArKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgYi9tZXRhL3JlY2lw
ZXMtDQo+IGRldnRvb2xzL3FlbXUvcWVtdS5pbmMNCj4gaW5kZXggYzg5NGI4MS4uMzhmMjI4YiAx
MDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMNCj4gKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMNCj4gQEAgLTM1LDYgKzM1LDkg
QEAgVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicWVtdS0NCj4gKD9QPHB2ZXI+XGQrKFwuXGQrKSsp
XC50YXIiDQo+IMKgDQo+IMKgU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gImNiMThkODg5YjYyOGZi
ZTYzNzY3MmIwMzI2Nzg5ZDliMGUzYjgwMjdlMDQ0NWI5MzY1MzdjNzg1NDlkZjE3YmMiDQo+IMKg
DQo+ICsjYWZmZWN0ZWQgNS4xcmMwIGJ1dCBmaXhlZCBpbiA1LjENCj4gK0NWRV9DSEVDS19XSElU
RUxJU1QgKz0gIkNWRS0yMDIwLTE1ODYzIg0KPiArDQo+IMKgU1JDX1VSSV9hcHBlbmRfY2xhc3Mt
dGFyZ2V0ID0gIiBmaWxlOi8vY3Jvc3MucGF0Y2giDQo+IMKgU1JDX1VSSV9hcHBlbmRfY2xhc3Mt
bmF0aXZlc2RrID0gIiBmaWxlOi8vY3Jvc3MucGF0Y2giDQo+IMKgDQo+IA0KPiANCj4gDQoNCg==
