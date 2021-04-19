Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.5806.1618818504245721413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 00:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: z+poIhLolpReAIU9tKithsRdwvDp9fH+F7MSuNM5uzpzMDudaYIdFNBEkxLxuRgbGFmEp2XRdX
 AespThwXe2CA==
X-IronPort-AV: E=McAfee;i="6200,9189,9958"; a="280608076"
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; 
   d="scan'208";a="280608076"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2021 00:48:23 -0700
IronPort-SDR: x9usEUkLlmamhYrlaVLNoLSvVl5dBDFiMwHCXmkTc4KVvVMA9B89zcpH5J+IQTcLTmHnrHs3bA
 7uXffG7a7+oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,233,1613462400"; 
   d="scan'208";a="445082683"
Received: from kmsmsx601.gar.corp.intel.com ([172.21.219.141])
  by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2021 00:48:23 -0700
Received: from kmsmsx603.gar.corp.intel.com (172.21.219.143) by
 kmsmsx601.gar.corp.intel.com (172.21.219.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 19 Apr 2021 15:48:22 +0800
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143]) by
 kmsmsx603.gar.corp.intel.com ([172.21.219.143]) with mapi id 15.01.2106.013;
 Mon, 19 Apr 2021 15:48:22 +0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: Khem Raj <raj.khem@gmail.com>, Paulo Cesar Zaneti <paulo.zaneti@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] perl: fix startperl configuration option for perl-native
Thread-Topic: [OE-core] [PATCH] perl: fix startperl configuration option for
 perl-native
Thread-Index: AQHXMw/gnFcqMbJFMkyRp2hRyWz8baq4SNcAgAMwnoA=
Date: Mon, 19 Apr 2021 07:48:22 +0000
Message-ID: <4145ce915f734aae9f53ab2575521f2d@intel.com>
References: <20210416222834.273394-1-paulo.zaneti@gmail.com>
 <CAMKF1soMF+Ep-bgaFBmGcVsuNVrzoPixwtcW081JPvhNBovWGw@mail.gmail.com>
In-Reply-To: <CAMKF1soMF+Ep-bgaFBmGcVsuNVrzoPixwtcW081JPvhNBovWGw@mail.gmail.com>
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

W1NXQVRdIA0KQUIgZmFpbHVyZSBsaW5rOg0KaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2pl
Y3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy84My9idWlsZHMvMjA1MA0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBP
biBCZWhhbGYgT2YgS2hlbSBSYWoNCj4gU2VudDogU2F0dXJkYXksIEFwcmlsIDE3LCAyMDIxIDEx
OjAxIFBNDQo+IFRvOiBQYXVsbyBDZXNhciBaYW5ldGkgPHBhdWxvLnphbmV0aUBnbWFpbC5jb20+
DQo+IENjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllciA8
b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW1BBVENIXSBwZXJsOiBmaXggc3RhcnRwZXJsIGNvbmZpZ3VyYXRpb24g
b3B0aW9uIGZvcg0KPiBwZXJsLW5hdGl2ZQ0KPiANCj4gSSBhbSBzZWVpbmcgZmFpbHVyZSBpbiBu
YXRpdmUgcmVjaXBlcyBlLmcuIG9wa2ctdXRpbHMtbmF0aXZlDQo+IA0KPiANCj4gfCAvdXNyL2Jp
bi9lbnY6IOKAmG5hdGl2ZXBlcmwtbmF0aXZlL3BlcmzigJk6IE5vIHN1Y2ggZmlsZSBvciBkaXJl
Y3RvcnkNCj4gfCBtYWtlOiAqKiogW01ha2VmaWxlOjI2OiBvcGtnLWJ1aWxkLjFdIEVycm9yIDEy
Nw0KPiB8IFdBUk5JTkc6DQo+IHwgL21udC9iL3lvZS9tYXN0ZXIvYnVpbGQvdG1wL3dvcmsveDg2
XzY0LWxpbnV4L29wa2ctdXRpbHMtbmF0aXZlLzAuNC4zLQ0KPiB8IHIwL3RlbXAvcnVuLmRvX2Nv
bXBpbA0KPiBlLjIyNDQ5ODI6MTg3IGV4aXQgMSBmcm9tICdleGl0IDEnDQo+IA0KPiBPbiBGcmks
IEFwciAxNiwgMjAyMSBhdCAzOjI5IFBNIFBhdWxvIENlc2FyIFphbmV0aSA8cGF1bG8uemFuZXRp
QGdtYWlsLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBVbmxpa2UgdmFuaWxsYSBQZXJsICJDb25m
aWd1cmUiIHNjcmlwdCwgcGVybC1jcm9zcyAiY29uZmlndXJlIiBkb2VzDQo+ID4gbm90IGRlcml2
ZSAic3RhcnRwZXJsIiBmcm9tICJiaW4iLiBJdCBpbnN0ZWFkIGRlcml2ZXMgZnJvbSAicGVybHBh
dGgiLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBhaW1zIHRvIGZpeCAic3RhcnRwZXJsIiBjb25maWd1
cmF0aW9uIG9wdGlvbiBmb3INCj4gPiBwZXJsLW5hdGl2ZSBieSBjb3JyZWN0bHkgc2V0dGluZyAi
cGVybHBhdGgiIG9uIHBlcmwtY3Jvc3MgImNvbmZpZ3VyZSIgc2NyaXB0Lg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogUGF1bG8gQ2VzYXIgWmFuZXRpIDxwYXVsby56YW5ldGlAZ21haWwuY29tPg0K
PiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuMzIuMS5iYiB8
IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJsXzUuMzIuMS5iYg0KPiA+IGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvcGVybF81LjMyLjEuYmINCj4gPiBpbmRleCBiMjgw
NDBjN2ZiLi44MmMyOTIyMDY2IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9wZXJsL3BlcmxfNS4zMi4xLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bl
cmwvcGVybF81LjMyLjEuYmINCj4gPiBAQCAtOTUsNiArOTUsNyBAQCBkb19jb25maWd1cmVfY2xh
c3MtbmF0aXZlc2RrKCkgew0KPiA+ICBkb19jb25maWd1cmVfY2xhc3MtbmF0aXZlKCkgew0KPiA+
ICAgICAgLi9jb25maWd1cmUgLS1wcmVmaXg9JHtwcmVmaXh9IFwNCj4gPiAgICAgIC1EYmluPSR7
YmluZGlyfS9wZXJsLW5hdGl2ZSBcDQo+ID4gKyAgICAtRHBlcmxwYXRoPSR7YmluZGlyfS9wZXJs
LW5hdGl2ZS9wZXJsIFwNCj4gPiAgICAgIC1EdXNlc2hycGxpYiBcDQo+ID4gICAgICAtRHNvbmFt
ZT1saWJwZXJsLnNvLjUgXA0KPiA+ICAgICAgLUR2ZW5kb3JwcmVmaXg9JHtwcmVmaXh9IFwNCj4g
PiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo+ID4NCj4gPg0KPiA+DQo=
