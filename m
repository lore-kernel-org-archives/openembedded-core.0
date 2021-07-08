Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.8423.1625724979543629838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 23:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="196725640"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="196725640"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2021 23:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; 
   d="scan'208";a="564320114"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2021 23:16:16 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 8 Jul 2021 14:16:16 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2242.008;
 Thu, 8 Jul 2021 14:16:15 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "peter@berginkonsult.se"
	<peter@berginkonsult.se>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>
Subject: Re: [RFC][PATCH] libubootenv: exclude from world build if no u-boot config
Thread-Topic: [RFC][PATCH] libubootenv: exclude from world build if no u-boot
 config
Thread-Index: AQHXcn91LbV3bejsLEaaRrLGvGNF7qs4FmiA
Date: Thu, 8 Jul 2021 06:16:15 +0000
Message-ID: <d1df793b3b79b43e8af92dd51887571f38c43b83.camel@intel.com>
References: <20210706155551.8958-1-peter@berginkonsult.se>
In-Reply-To: <20210706155551.8958-1-peter@berginkonsult.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8DA6FF22C68314BA7E3F0D3CBBF8520@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIxLTA3LTA2IGF0IDE3OjU1ICswMjAwLCBQZXRlciBCZXJnaW4gd3JvdGU6DQo+
IEFzIGEgZml4IGZvciBmYWlsaW5nIHRoZSB3b3JsZCBidWlsZCBmb3IgdGFyZ2V0cyBub3QgdXNp
bmcgdS1ib290DQo+IGFzIGJvb3QgbG9hZGVyIGxpYnVib290ZW52IGlzIGV4Y2x1ZGVkIGZyb20g
d29ybGQgYnVpbGRzIGlmDQo+IGJvdGggVUJPT1RfTUFDSElORSBhbmQgVUJPT1RfQ09ORklHIHZh
cmlhYmxlcyBhcmUgZW1wdHkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBCZXJnaW4gPHBl
dGVyQGJlcmdpbmtvbnN1bHQuc2U+DQo+IC0tLQ0KPiDCoG1ldGEvcmVjaXBlcy1ic3AvdS1ib290
L2xpYnVib290ZW52XzAuMy4yLmJiIHwgMyArKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvbGli
dWJvb3RlbnZfMC4zLjIuYmINCj4gYi9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9saWJ1Ym9vdGVu
dl8wLjMuMi5iYg0KPiBpbmRleCAzMDYyOTY5MjJjLi42Nzc0MjkwZWE1IDEwMDY0NA0KPiAtLS0g
YS9tZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9saWJ1Ym9vdGVudl8wLjMuMi5iYg0KPiArKysgYi9t
ZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9saWJ1Ym9vdGVudl8wLjMuMi5iYg0KPiBAQCAtMjgsMyAr
MjgsNiBAQCBQQUNLQUdFX0FSQ0ggPSAiJHtNQUNISU5FX0FSQ0h9Ig0KPiDCoFJSRUNPTU1FTkRT
XyR7UE59LWJpbl9hcHBlbmRfY2xhc3MtdGFyZ2V0ID0gIiB1LWJvb3QtZGVmYXVsdC1lbnYiDQo+
IMKgDQo+IMKgQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUiDQo+ICsNCj4gKyMgRXhjbHVkZSB0aGlz
IHBhY2thZ2UgZnJvbSB3b3JsZCBidWlsZCBpZiB0aGVyZSBpcyBubyBjb25maWcgZm9yIHUtDQo+
IGJvb3QNCj4gK0VYQ0xVREVfRlJPTV9XT1JMRCA9ICIke0AnMScgaWYgbm90IGQuZ2V0VmFyKCdV
Qk9PVF9NQUNISU5FJykgYW5kDQo+IG5vdCAoZC5nZXRWYXIoJ1VCT09UX0NPTkZJRycpIG9yICcn
KS5zcGxpdCgpIGVsc2UgJzAnfSINCg0KVGhpcyBsb29rcyBnb29kIHRvIG1lLiBUaGlzIHJlY2lw
ZSB3YXMgYmVpbmcgc2tpcHBlZCBpbiB3b3JsZCBidWlsZHMNCmZvciBzdWNoIHRhcmdldHMgYW55
d2F5IGJlZm9yZSB3ZSByZW1vdmVkIHRoZSB1Ym9vdC1jb25maWcgaW5oZXJpdC4NCg0KVGhhbmtz
LA0KDQpBbnVqDQo=
