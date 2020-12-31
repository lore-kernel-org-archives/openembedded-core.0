Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.18524.1609401312393220088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 23:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: 7EAQengp9iDTo3ldR5AzObezhygYGekwKeBewMiEVs+Y7ut5uDs2yeTUrdk3xQbEpSzkZh9mCD
 lCg3FmRZo8Ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9850"; a="195187808"
X-IronPort-AV: E=Sophos;i="5.78,463,1599548400"; 
   d="scan'208";a="195187808"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2020 23:55:11 -0800
IronPort-SDR: mAGX1WAzuQT8VgBO56xB4Vcz9U2WIen+mfPS6teGRyMNxFcOgv7+KRc22hBQzUv79Xzvu990t+
 tZ2MHNhsBQzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,463,1599548400"; 
   d="scan'208";a="376699893"
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136])
  by orsmga008.jf.intel.com with ESMTP; 30 Dec 2020 23:55:09 -0800
Received: from kmsmsx603.gar.corp.intel.com (172.21.219.143) by
 pgsmsx601.gar.corp.intel.com (10.108.199.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 31 Dec 2020 15:55:08 +0800
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143]) by
 kmsmsx603.gar.corp.intel.com ([172.21.219.143]) with mapi id 15.01.1713.004;
 Thu, 31 Dec 2020 15:55:08 +0800
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Trevor Woerner
	<twoerner@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Ross Burton <ross.burton@arm.com>, Jon Mason <Jon.Mason@arm.com>
Subject: Re: [OE-core] [master-next][PATCH 1/3] PSPLASH_FIFO_DIR: refactor
Thread-Topic: [OE-core] [master-next][PATCH 1/3] PSPLASH_FIFO_DIR: refactor
Thread-Index: AQHW2gnUamdWWbjvEkGyZZP4pYgcvqoPMMiAgAGvasA=
Date: Thu, 31 Dec 2020 07:55:08 +0000
Message-ID: <2ef921246adf4a5eace5ccb72294ef82@intel.com>
References: <20201224153105.21211-1-twoerner@gmail.com>
 <fbcefecc76d5cd481c661b57f0d394520ff646a3.camel@linuxfoundation.org>
In-Reply-To: <fbcefecc76d5cd481c661b57f0d394520ff646a3.camel@linuxfoundation.org>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBSaWNoYXJkIFB1cmRpZQ0KPiBTZW50OiBXZWRu
ZXNkYXksIERlY2VtYmVyIDMwLCAyMDIwIDEwOjEwIFBNDQo+IFRvOiBUcmV2b3IgV29lcm5lciA8
dHdvZXJuZXJAZ21haWwuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gQ2M6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPjsgSm9uIE1h
c29uDQo+IDxKb24uTWFzb25AYXJtLmNvbT47IFNhaW5pLCBOYXZlZW4gS3VtYXINCj4gPG5hdmVl
bi5rdW1hci5zYWluaUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW21hc3Rl
ci1uZXh0XVtQQVRDSCAxLzNdIFBTUExBU0hfRklGT19ESVI6DQo+IHJlZmFjdG9yDQo+IA0KPiBP
biBUaHUsIDIwMjAtMTItMjQgYXQgMTA6MzEgLTA1MDAsIFRyZXZvciBXb2VybmVyIHdyb3RlOg0K
PiA+IEFkZCBhbiBlbnRyeSBmb3IgdGhlIHBzcGxhc2ggZmlmbyBkaXJlY3RvcnkgdG8gL2V0Yy9k
ZWZhdWx0L3JjUyBhbmQNCj4gPiBoYXZlIHRoZSBwaWVjZXMgb2YgY29kZSB0aGF0IG5lZWQgaXQg
c291cmNlIGl0IGZyb20gdGhlcmUgcmF0aGVyIHRoYW4NCj4gPiBkdXBsaWNhdGluZyB0aGUgZGVm
aW5pdGlvbiBpbiBtdWx0aXBsZSBwbGFjZXMgdGhyb3VnaG91dCB0aGUgY29kZS4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFRyZXZvciBXb2VybmVyIDx0d29lcm5lckBnbWFpbC5jb20+DQo+ID4g
LS0tDQo+ID4gwqBtZXRhL3JlY2lwZXMtY29yZS9wc3BsYXNoL2ZpbGVzL3BzcGxhc2gtaW5pdMKg
wqDCoCB8IDQgKysrLQ0KPiA+IMKgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdmluaXQvc3lzdmluaXQv
cmPCoMKgwqDCoMKgwqDCoMKgwqAgfCA1ICsrKy0tDQo+ID4gwqBtZXRhL3JlY2lwZXMtY29yZS9z
eXN2aW5pdC9zeXN2aW5pdC9yY1MtZGVmYXVsdCB8IDIgKysNCj4gPiDCoDMgZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gVW5mb3J0dW5hdGVseSB0
aGlzIGRvZXNuJ3Qgc2VlbSB0byBidWlsZCBvbiBhcm0gaG9zdHMsIHNvbWV0aGluZyB0byBkbyB3
aXRoDQo+IHRoZSBmaWZvIEknZCBndWVzcywgZS5nLjoNCj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxk
ZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvOTcvYnVpbGRzLzIxNzkNCj4g
DQo+IEkndmUgbm90IGxvb2tlZCBhbnkgZnVydGhlciBkdWUgdG8gaG9saWRheXMgYnV0IHRoaXMg
cHJvYmFibHkgbmVlZHMgYSBidWd6aWxsYQ0KPiBlbnRyeSBhbmQgZnVydGhlciBpbnZlc3RpZ2F0
aW9uLiBTZXJpZXMgaXMgb24gaG9sZCB1bnRpbCB3ZSBnZXQgdG8gdGhlIGJvdHRvbQ0KPiBvZiB0
aGlzLg0KW1NXQVRdIGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MTQxNzMNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCj4gDQoNCg==
