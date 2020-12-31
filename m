Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.18013.1609395427595812422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 22:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: RwMbeDHuLwPoskmyi/I9x3JiErzqTyN35dzTj0iy8ldn0zeUsXu3/i2NMQGWYXGwzm1pOtx6zN
 XebDx7+RJ/Bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9850"; a="164384906"
X-IronPort-AV: E=Sophos;i="5.78,463,1599548400"; 
   d="scan'208";a="164384906"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2020 22:17:06 -0800
IronPort-SDR: YADMu8skLsLBpIPm4XC5GCoxNbMuY5EWTTfgvNC1pcSwkODrk9a7d+yBUMy+qUurkmTZNCQknz
 lw1SirmXjUfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,463,1599548400"; 
   d="scan'208";a="460734015"
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2020 22:17:04 -0800
Received: from kmsmsx603.gar.corp.intel.com (172.21.219.143) by
 pgsmsx601.gar.corp.intel.com (10.108.199.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 31 Dec 2020 14:17:04 +0800
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143]) by
 kmsmsx603.gar.corp.intel.com ([172.21.219.143]) with mapi id 15.01.1713.004;
 Thu, 31 Dec 2020 14:17:03 +0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] selftest/reproducible: Add useradd-staticids to reproducible builds tests
Thread-Topic: [OE-core] [PATCH 2/2] selftest/reproducible: Add
 useradd-staticids to reproducible builds tests
Thread-Index: AQHW3Ek2v8Mal+wfDEyg/iEchWPoP6oKZA0AgATQjACAAYhz8A==
Date: Thu, 31 Dec 2020 06:17:03 +0000
Message-ID: <013d105f15954164a361363912173659@intel.com>
References: <20201227120952.139650-1-richard.purdie@linuxfoundation.org>
	 <20201227120952.139650-2-richard.purdie@linuxfoundation.org>
	 <CANNYZj8Ag7L1k-ZMpnKefTcHA9Lf0q=O=Ek_XqSxOPfWQEzXYg@mail.gmail.com>
 <be95f599b85aec68418a272ea514696d49b3ce14.camel@linuxfoundation.org>
In-Reply-To: <be95f599b85aec68418a272ea514696d49b3ce14.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwg
RGVjZW1iZXIgMzAsIDIwMjAgMTA6NDAgUE0NCj4gVG86IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZzsgU2FpbmksIE5hdmVlbiBLdW1hcg0KPiA8bmF2ZWVuLmt1bWFyLnNhaW5pQGlu
dGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMi8yXSBzZWxmdGVzdC9y
ZXByb2R1Y2libGU6IEFkZCB1c2VyYWRkLQ0KPiBzdGF0aWNpZHMgdG8gcmVwcm9kdWNpYmxlIGJ1
aWxkcyB0ZXN0cw0KPiANCj4gT24gU3VuLCAyMDIwLTEyLTI3IGF0IDE0OjA4ICswMTAwLCBBbGV4
YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4gPiBJIHdvbmRlciBpZiB0aGlzIGFsc28gYWRkcmVzc2Vz
IHNvbWUgb2YgdGhlIGV4aXN0aW5nIGVudHJpZXMgb24gdGhlDQo+ID4gZXhjZXB0aW9uIGxpc3Q/
DQo+IA0KPiBJJ3ZlIHdvbmRlcmVkIHRoYXQgdG9vLiBXZSBwcm9iYWJseSBuZWVkIHRvIGFuYWx5
c2UgdGhlIHJlc3VsdHMgb2Ygc29tZSBvZg0KPiB0aGUgYnVpbGRzIGFuZCBzZWUgaWYgYW55IGFy
ZSByZXByb2R1Y2luZyB0aGF0IGRpZG4ndCBwcmV2aW91c2x5Li4uDQo+IA0KPiBXZSBkbyBoYXZl
IGEgY291cGxlIG9mIGludGVybWl0dGVudCBpc3N1ZXMgdGhhdCBhcmUgc2hvd2luZyBpbiB3b3Js
ZCBidWlsZHMsDQo+IG9uZSBpbiBncnViOg0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0
by5pby9wdWIvcmVwcm8tZmFpbC9vZS1yZXByb2R1Y2libGUtMjAyMDEyMjgtDQo+IG1jb2k1cWsw
L3BhY2thZ2VzL2RpZmYtaHRtbC8NCj4gDQo+IGxvb2tpbmcgbGlrZWx5IGR1ZSB0byBjaGFuZ2Vz
IGluOg0KPiANCj4gL3Vzci9zcmMvZGVidWcvZ3J1Yi1lZmkvMi4wNC1yMC9ncnViLTIuMDQvZ3J1
Yi1jb3JlL3VuaWRhdGEuYw0KPiANCj4gYW5kIG9uZSBpbiBpbml0cmFtZnMtYmFzZToNCj4gDQo+
IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vcHViL3JlcHJvLWZhaWwvb2UtcmVwcm9kdWNp
YmxlLTIwMjAxMjIzLQ0KPiBvZzZ2MWhuMS9wYWNrYWdlcy9kaWZmLWh0bWwvDQo+IA0KPiB3aGVy
ZSB0aGUgd3JpdGUgYml0cyBhcmUgbWFza2VkIG91dCBvbiAvZGV2L2NvbnNvbGUsIHNvbWV0aGlu
ZyB0byBkbyB3aXRoDQo+IHVtYXNrIGhhbmRsaW5nIGluIHBzZXVkbyBvbiB0dW1ibGV3ZWVkLXR5
LTMuDQo+IA0KPiBJIHRoaW5rIG9uZSBoYXMgYSBidWcsIHRoZSBvdGhlciBkb2VzIG5vdCAoeWV0
KS4NCltTV0FUXSBBbHJlYWR5IHJhaXNlZCBidWdzIGZvciBib3RoLg0KZ3J1YiA6IGh0dHBzOi8v
YnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTQxNjcNCkluaXRyYW1m
cy1ib290OiBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lk
PTE0MTYyDQoNClJlY2VudGx5IG9uZSBtb3JlIHJlcHJvZHVjaWJpbGl0eSBmYWlsdXJlIG9ic2Vy
dmVkIHdpdGggbWFuLWRiIHBhY2thZ2UuIA0KTG9va3MgbGlrZSBPd25lciBhbmQgR3JvdXAgb2Yg
ZmlsZXMgJy91c3IvYmluL21hbicgYW5kICcvdXNyL2Jpbi9tYW5kYicgYXJlIG1pc3NpbmcvZGlm
ZmVybmV0Lg0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0by5pby9wdWIvcmVwcm8tZmFpbC9vZS1y
ZXByb2R1Y2libGUtMjAyMDEyMzAtY21ycGp6Y3AvcGFja2FnZXMvZGlmZi1odG1sLw0KDQpSYWlz
ZWQgZm9yIHRoaXMgdG9vLg0KaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3df
YnVnLmNnaT9pZD0xNDE3Mg0KDQpBbHJlYWR5IGEgYnVnIzE0MTU5IGV4aXN0cyBmb3IgbWFuLWRi
LWRvYyBwYWNrYWdlLiANCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQo=
