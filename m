Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.23372.1625324148215554760
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jul 2021 07:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10034"; a="230534661"
X-IronPort-AV: E=Sophos;i="5.83,322,1616482800"; 
   d="scan'208";a="230534661"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2021 07:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,322,1616482800"; 
   d="scan'208";a="459166684"
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136])
  by fmsmga008.fm.intel.com with ESMTP; 03 Jul 2021 07:55:45 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx601.gar.corp.intel.com (10.108.199.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sat, 3 Jul 2021 22:55:42 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2242.008;
 Sat, 3 Jul 2021 22:55:42 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "peter@berginkonsult.se"
	<peter@berginkonsult.se>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"liu.ming50@gmail.com" <liu.ming50@gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
Thread-Topic: [OE-core] [PATCH] Revert "libubootenv: inherit uboot-config"
Thread-Index: AQHXbzm0dRf4kFWDY06Zd4FK+4QYDqsw0myA
Date: Sat, 3 Jul 2021 14:55:42 +0000
Message-ID: <bc5cdd46cfb003f45c1ed7762ee140c0f4f5cca5.camel@intel.com>
References: <20210702115900.19417-1-peter@berginkonsult.se>
In-Reply-To: <20210702115900.19417-1-peter@berginkonsult.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5E147BBE0319A48A328C55FAAB7854C@intel.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIxLTA3LTAyIGF0IDEzOjU5ICswMjAwLCBQZXRlciBCZXJnaW4gd3JvdGU6DQo+
IFRoaXMgcmV2ZXJ0cyBjb21taXQgMTBhYTEyOTE5NzlmYjkwYmVkMWJlYjQ5YmU0ZDQwNmVkMGUx
ZTRkNS4NCj4gDQo+IEFzIHRoZXJlIGlzIG5vIGJ1aWxkIGRlcGVuZGVuY3kgYmV0d2VlbiBsaWJ1
Ym9vdGVudiBhbmQgdGhlDQo+IGNvbmZpZ3VyYXRpb24NCj4gb2YgdS1ib290IHRoZXJlIGlzIG5v
IHJlYXNvbiB0byBjaGVjayBmb3IgVUJPT1RfQ09ORklHIG9yIFVCT09UX01BQ0hJTkUNCj4gYnkg
YWRkaW5nIHRoZSBjbGFzcyB1Ym9vdC1jb25maWcuIFJldmVydCB0aGlzIGluIG9yZGVyIHRvIHJl
bW92ZQ0KPiB1c2VsZXNzDQo+IHdvcmthcm91bmQgaW4gYnNwIGxheWVyIChtZXRhLWZyZWVzY2Fs
ZSkuDQoNClRoaXMgd2FzIGFkZGVkIHRvIGFkZHJlc3MgZmFpbHVyZXMgaW4gd29ybGQgYnVpbGRz
Og0KDQpodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9t
ZXNzYWdlLzE0MTc1Nw0KDQpJZiB0aGlzIGlzIG5vdCByZXF1aXJlZCwgdGhlbiBJIHRoaW5rIHdl
J2QgbmVlZCB0byBhZGRyZXNzIHRob3NlDQpmYWlsdXJlcy4NCg0KVGhhbmtzLA0KDQpBbnVqDQoN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEJlcmdpbiA8cGV0ZXJAYmVyZ2lua29uc3VsdC5z
ZT4NCj4gLS0tDQo+IMKgbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvbGlidWJvb3RlbnZfMC4zLjIu
YmIgfCAyICstDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvbGlidWJvb3Rl
bnZfMC4zLjIuYmINCj4gYi9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9saWJ1Ym9vdGVudl8wLjMu
Mi5iYg0KPiBpbmRleCAyY2Y4N2M3OTRlLi4zMDYyOTY5MjJjIDEwMDY0NA0KPiAtLS0gYS9tZXRh
L3JlY2lwZXMtYnNwL3UtYm9vdC9saWJ1Ym9vdGVudl8wLjMuMi5iYg0KPiArKysgYi9tZXRhL3Jl
Y2lwZXMtYnNwL3UtYm9vdC9saWJ1Ym9vdGVudl8wLjMuMi5iYg0KPiBAQCAtMTUsNyArMTUsNyBA
QCBTUkNSRVYgPSAiYmE3NTY0ZjUwMDZkMDliZWM1MTA1OGNmNGY1YWM5MGQ0ZGMxOGIzYyINCj4g
wqANCj4gwqBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiDCoA0KPiAtaW5oZXJpdCB1Ym9vdC1jb25m
aWcgY21ha2UgbGliX3BhY2thZ2UNCj4gK2luaGVyaXQgY21ha2UgbGliX3BhY2thZ2UNCj4gwqAN
Cj4gwqBFWFRSQV9PRUNNQUtFID0gIi1EQ01BS0VfQlVJTERfVFlQRT1SZWxlYXNlIg0KPiDCoA0K
PiANCj4gDQo+IA0KDQo=
