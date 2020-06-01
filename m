Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.27798.1590975467877037582
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 18:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3sMNQ5J6x5hEenQikTJv52fDeEz8yrUs00pELhjhyrxGT8+wi0VG1QStQqmheoKToeQazvLVVS
 +yeTroDp0PKw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2020 18:37:47 -0700
IronPort-SDR: 3QULC81rCuYpFeEW1/83yNcS24Ist/CuKD2/IDsAKLgb8VY58NNN6Z7McfYNXX7Bf7l6fbNC6t
 iINHjC5JfC4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; 
   d="scan'208";a="346866781"
Received: from kmsmsx151.gar.corp.intel.com ([172.21.73.86])
  by orsmga001.jf.intel.com with ESMTP; 31 May 2020 18:37:46 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.74]) by
 KMSMSX151.gar.corp.intel.com ([169.254.10.24]) with mapi id 14.03.0439.000;
 Mon, 1 Jun 2020 09:37:45 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH 41/70] x264: upgrade to latest revision
Thread-Topic: [OE-core] [PATCH 41/70] x264: upgrade to latest revision
Thread-Index: AQHWN2O8K28yvGo7yUSlSLGuiHpweajCdZoA
Date: Mon, 1 Jun 2020 01:37:45 +0000
Message-ID: <cc365da8a2269d150ed2854c5eafea71c108b2be.camel@intel.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
	 <20200531155254.10283-41-alex.kanavin@gmail.com>
In-Reply-To: <20200531155254.10283-41-alex.kanavin@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.140.97]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <55ACE522B9AB8440B2138C2AA8D6B188@intel.com>
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDIwLTA1LTMxIGF0IDE3OjUyICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEveDI2NC94MjY0X2dpdC5i
YiB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL3gyNjQveDI2NF9n
aXQuYmIgYi9tZXRhL3JlY2lwZXMtDQo+IG11bHRpbWVkaWEveDI2NC94MjY0X2dpdC5iYg0KPiBp
bmRleCAzOTQyOWE4ODA5Li4xZmY1MzQ4YjllIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS94MjY0L3gyNjRfZ2l0LmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1l
ZGlhL3gyNjQveDI2NF9naXQuYmINCj4gQEAgLTE0LDcgKzE0LDcgQEAgU1JDX1VSSSA9DQo+ICJn
aXQ6Ly9naXRodWIuY29tL21pcnJvci94MjY0O2JyYW5jaD1zdGFibGUgXA0KPiAgICAgICAgICAg
ICAiDQo+ICBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiDQo+ICANCj4gLVNSQ1JFViA9ICIx
NzcxYjU1NmVlNDUyMDdmODcxMTc0NGNjYmQ1ZDQyYTM5NDliMTRjIg0KPiArU1JDUkVWID0gIjI5
NjQ5NGE0MDExZjU4ZjMyYWRjNTQzMDRhMjY1NDYyNzU1OGM1OWEiDQo+ICANCj4gIFBWID0gInIy
OTkxK2dpdCR7U1JDUFZ9Ig0KDQpQViB3aWxsIGFsc28gbmVlZCB0byBiZSBjaGFuZ2VkIGluIHRo
aXMgY2FzZSB0byByMjk5OStnaXQke1NSQ1BWfS4NCg0KVGhhbmtzLA0KDQpBbnVqDQo=
