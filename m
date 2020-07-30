Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.3821.1596067833683446418
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 17:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 75ttnujdDWwrWi3ZQoqmuZYfHdYN23rdtXkJXJ7nMDQfjYHf276TLad/5Xrkf//CNDgCwNIe5k
 SceX1ShVJf2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="150690730"
X-IronPort-AV: E=Sophos;i="5.75,412,1589266800"; 
   d="scan'208";a="150690730"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 17:10:32 -0700
IronPort-SDR: XIBv7Oaw2AM3fq9mL3SU9kmr+4EbPWunhcV7L6kRs9ftt0s1pvr+tcxm49ItQOXfNyMDYyIho9
 3LnxPC6pU9eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,412,1589266800"; 
   d="scan'208";a="434854013"
Received: from pgsmsx102.gar.corp.intel.com ([10.221.44.80])
  by orsmga004.jf.intel.com with ESMTP; 29 Jul 2020 17:10:30 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.74]) by
 PGSMSX102.gar.corp.intel.com ([169.254.6.170]) with mapi id 14.03.0439.000;
 Thu, 30 Jul 2020 08:10:30 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "saloni.jain@kpit.com"
	<saloni.jain@kpit.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "Rahul.Taya@kpit.com" <Rahul.Taya@kpit.com>, "anuj.chougule@kpit.com"
	<anuj.chougule@kpit.com>, "nisha.parrakat@kpit.com" <nisha.parrakat@kpit.com>
Subject: Re: [OE-core] [poky][zeus][PATCH] libpcre: Add fix for CVE-2020-14155
Thread-Topic: [OE-core] [poky][zeus][PATCH] libpcre: Add fix for
 CVE-2020-14155
Thread-Index: AQHWZaegcympJHoHsU2h/8bVkVeh9akeuj0A
Date: Thu, 30 Jul 2020 00:10:28 +0000
Message-ID: <4231da79c401a7314dbdfa3988889f2f38be8060.camel@intel.com>
References: <1596027345-16076-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1596027345-16076-1-git-send-email-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.75.191]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A759A684296F74FA0D9F74D6EE9440A@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTA3LTI5IGF0IDE4OjI1ICswNTMwLCBzYWxvbmkgd3JvdGU6DQo+IEZyb206
IFJhaHVsIFRheWEgPFJhaHVsLlRheWFAa3BpdC5jb20+DQo+IA0KPiBBZGRlZCBiZWxvdyBwYXRj
aCBpbiBsaWJwY3JlDQo+IENWRS0yMDIwLTE0MTU1LnBhdGNoDQo+IA0KPiBUaGlzIHBhdGNoIGZp
eGVzIGJlbG93IGVycm9yOg0KPiBQQ1JFIGNvdWxkIGFsbG93IGEgcmVtb3RlIGF0dGFja2VyIHRv
IGV4ZWN1dGUgYXJiaXRyYXJ5DQo+IGNvZGUgb24gdGhlIHN5c3RlbSwgY2F1c2VkIGJ5IGFuIGlu
dGVnZXIgb3ZlcmZsb3cgaW4NCj4gbGlicGNyZSB2aWEgYSBsYXJnZSBudW1iZXIgYWZ0ZXIgKD9D
IHN1YnN0cmluZy4NCj4gQnkgc2VuZGluZyBhIHJlcXVlc3Qgd2l0aCBhIGxhcmdlIG51bWJlciwg
YW4gYXR0YWNrZXINCj4gY2FuIGV4ZWN1dGUgYXJiaXRyYXJ5IGNvZGUgb24gdGhlIHN5c3RlbSBv
cg0KPiBjYXVzZSB0aGUgYXBwbGljYXRpb24gdG8gY3Jhc2guDQo+IA0KPiBVcHN0cmVhbS1TdGF0
dXM6IFBlbmRpbmcNCj4gDQo+IFRlc3RlZC1ieTogUmFodWwgVGF5YSA8UmFodWwuVGF5YUBrcGl0
LmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogU2Fsb25pIEphaW4gPFNhbG9uaS5KYWluQGtwaXQuY29t
Pg0KPiAtLS0NCj4gIC4uLi9saWJwY3JlL2xpYnBjcmUvQ1ZFLTIwMjAtMTQxNTUucGF0Y2ggICAg
ICAgICAgIHwgNDANCj4gKysrKysrKysrKysrKysrKysrKysrKw0KPiAgbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlicGNyZS9saWJwY3JlXzguNDQuYmIgICAgICAgfCAgMyArLQ0KDQp6ZXVzIGhhcyBs
aWJwY3JlIHZlcnNpb24gOC40My4gQWxzbyBpdCBsb29rcyBsaWtlIHRoaXMgc3BlY2lmaWMgZml4
IGlzDQphbHJlYWR5IGlzIDguNDQuDQoNClNvIHBsZWFzZSB0ZXN0IGFuZCBzZW5kIGFnYWluIGZv
ciBwcm9wZXIgdmVyc2lvbiAmIGJyYW5jaC4NCg0KVGhhbmtzLA0KDQpBbnVqDQo=
