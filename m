Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.16436.1609382670782635012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 18:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: OjjacEzKkjNeelYa+SwXzyJi+Xh3Zx7lXzi8naI/5qeebtA2nBRajhz6SZsMAqn4F35Yv85Iap
 cmuJhWjsH4jQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9850"; a="163725922"
X-IronPort-AV: E=Sophos;i="5.78,462,1599548400"; 
   d="scan'208";a="163725922"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2020 18:44:29 -0800
IronPort-SDR: xmGqMmu3JEScSautLos4J2X1QpAx1Gq58qbTW/u3aNz3VXXN7mTzNyS9VTI0vpMX7YwVURY3K5
 OlW22nWJj+iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,462,1599548400"; 
   d="scan'208";a="341670104"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by fmsmga007.fm.intel.com with ESMTP; 30 Dec 2020 18:44:26 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 31 Dec 2020 10:44:24 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Thu, 31 Dec 2020 10:44:24 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] p11-kit: upgrade 0.23.21 -> 0.23.22
Thread-Topic: [OE-core] [PATCH 1/2] p11-kit: upgrade 0.23.21 -> 0.23.22
Thread-Index: AQHW3opsHR0djPSxWUuE2SMs9isKx6oPLHGAgADOD4A=
Date: Thu, 31 Dec 2020 02:44:24 +0000
Message-ID: <681dca0f7f12f7534e9822615f3c6c5a61bb7c03.camel@intel.com>
References: <20201230090140.85279-1-chee.yang.lee@intel.com>
	 <CANNYZj94Fs1BAq=Fd2YMfCukPYjZRAHi_wMNV7PLPEb1ZGqJfA@mail.gmail.com>
In-Reply-To: <CANNYZj94Fs1BAq=Fd2YMfCukPYjZRAHi_wMNV7PLPEb1ZGqJfA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <339DDF484D2F39469891B775CFA91804@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTEyLTMwIGF0IDE1OjI2ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gSSBiZWxpZXZlIHRoaXMgdXBkYXRlIGJyZWFrcyBESVNUUk9fRkVBVFVSRVMgKz0gImFw
aS1kb2N1bWVudGlvbiINCj4gYnVpbGRzLCB0aGF0J3Mgd2h5IEkgdG9vayBpdCBvdXQgZnJvbSBt
eSBiYXRjaC4gSWYgeW91IGNhbiBmaXggdGhhdCwNCj4gd291bGQgYmUgYXBwcmVjaWF0ZWQuDQo+
IA0KDQpJIHRoaW5rIGl0J3MgcmVsYXRlZCB0bzoNCg0KaHR0cHM6Ly9naXRodWIuY29tL21lc29u
YnVpbGQvbWVzb24vaXNzdWVzLzIxNDgNCg0KU28gdGhlIHRhcmdldHMgbGlzdGVkIGluIGRlcGVu
ZGVuY2llcyBoZXJlOg0KDQpodHRwczovL2dpdGh1Yi5jb20vcDExLWdsdWUvcDExLWtpdC9ibG9i
L21hc3Rlci9kb2MvbWFudWFsL21lc29uLmJ1aWxkI0w3Mw0KDQphcmVuJ3QgYWN0dWFsbHkgYnVp
bHQuwqANCg0KSSB0ZXN0ZWQgYW5kIGl0IGJ1aWxkcyBmaW5lIGlmIHdlIGVuYWJsZSBtYW5wYWdl
cyBhcyB3ZWxsIGJlY2F1c2UgdGhlbg0KdGhlIHhtbHMgYXJlIGFjdHVhbGx5IGJ1aWx0IHZpYSBk
ZXBlbmRzIGZvciBhIGN1c3RvbSB0YXJnZXQ6DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9wMTEtZ2x1
ZS9wMTEta2l0L2Jsb2IvbWFzdGVyL2RvYy9tYW51YWwvbWVzb24uYnVpbGQjTDEyNQ0KDQpUaGFu
a3MsDQoNCkFudWoNCg0K
