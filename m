Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.309.1594165418405755629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 16:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 2mvmW8nQZ8GRFB2w582gX/ZtTQs7nD139HB1WqXbgCHTYG5Hcm8diPg5qub2pHo2X2PA1bIgdh
 Jm14BzArC4HQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="212655836"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; 
   d="scan'208";a="212655836"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2020 16:43:37 -0700
IronPort-SDR: v8Lq3nrvJQUyii6o15QZ/W4NcoZKQYeuoIm4fdEas5OCpbNmUlGWkvfcmy+LwH2MywC6QjaPA4
 8kqBKR7Yg4eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; 
   d="scan'208";a="305837149"
Received: from kmsmsx155.gar.corp.intel.com ([172.21.73.106])
  by fmsmga004.fm.intel.com with ESMTP; 07 Jul 2020 16:43:36 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.140]) by
 KMSMSX155.gar.corp.intel.com ([169.254.15.69]) with mapi id 14.03.0439.000;
 Wed, 8 Jul 2020 07:43:35 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "arthur.she@linaro.org"
	<arthur.she@linaro.org>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: Add PACKAGECONFIG for Chamelium support
Thread-Topic: [OE-core][PATCH] igt-gpu-tools: Add PACKAGECONFIG for
 Chamelium support
Thread-Index: AQHWVKMgLudVvzdYm06fl1dld/vuV6j8QXgA
Date: Tue, 7 Jul 2020 23:43:35 +0000
Message-ID: <511a56908795531f547003a26af933a02c711583.camel@intel.com>
References: <20200707210917.231615-1-arthur.she@linaro.org>
In-Reply-To: <20200707210917.231615-1-arthur.she@linaro.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.182.72]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E48C92D56C9A240947110953D600C31@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTA3LTA3IGF0IDE0OjA5IC0wNzAwLCBBcnRodXIgU2hlIHdyb3RlOg0KPiBD
aGFtZWxpdW0gaXMgYSBoYXJkd2FyZSBkZXZpY2UgdGhhdCBjYW4gYmUgdXNlZCBmb3IgZXh0ZXJu
YWwgZGlzcGxheQ0KPiB0ZXN0IGF1dG9tYXRpb24gWzFdLg0KPiBJdCBpcyBkaXNhYmxlZCBieSBk
ZWZhdWx0IGFuZCBjYW4gYmUgdHVybmVkIG9uIHRocm91Z2ggUEFDS0FHRUNPTkZJRy4NCj4gDQo+
IFsxXSBodHRwczovL3d3dy5jaHJvbWl1bS5vcmcvY2hyb21pdW0tb3MvdGVzdGluZy9jaGFtZWxp
dW0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFydGh1ciBTaGUgPGFydGh1ci5zaGVAbGluYXJvLm9y
Zz4NCj4gLS0tDQo+ICBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaWd0LWdwdS10b29scy9pZ3QtZ3B1
LXRvb2xzX2dpdC5iYiB8IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfZ2l0LmJiIA0KPiBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfZ2l0LmJiDQo+IGluZGV4IGY2MDg4
MGMyOTIuLjI5MDMxZTY0ZGMgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9p
Z3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfZ2l0LmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfZ2l0LmJiDQo+IEBAIC0yMCw3ICsy
MCw5IEBAIFJERVBFTkRTXyR7UE59LXRlc3RzICs9ICJiYXNoIg0KPiAgDQo+ICBQQUNLQUdFX0JF
Rk9SRV9QTiA9ICIke1BOfS1iZW5jaG1hcmtzICR7UE59LXRlc3RzIg0KPiAgDQo+IC1FWFRSQV9P
RU1FU09OID0gIi1EZG9jcz1kaXNhYmxlZCAtRHJ1bm5lcj1lbmFibGVkIg0KPiArUEFDS0FHRUNP
TkZJR1tjaGFtZWxpdW1dID0gIi1EY2hhbWVsaXVtPWVuYWJsZWQsLQ0KPiBEY2hhbWVsaXVtPWRp
c2FibGVkLGdzbCB4bWxycGMtYyINCj4gKw0KPiArRVhUUkFfT0VNRVNPTiA9ICItRGRvY3M9ZGlz
YWJsZWQgLURydW5uZXI9ZW5hYmxlZA0KPiAtRGNoYW1lbGl1bT1kaXNhYmxlZCINCg0KVGhpcyBp
cyBkaXNhYmxpbmcgY2hhbWVsaXVtIGV2ZW4gaWYgaXQncyBlbmFibGVkIHVzaW5nIFBBQ0tBR0VD
T05GSUcuDQoNClRoYW5rcywNCg0KQW51ag0K
