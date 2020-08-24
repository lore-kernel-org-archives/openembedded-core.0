Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web12.184859.1598227399618930027
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 17:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: hR+CDy2bZ0++GQD/9DrafSz0J4zImyi3ZJt4MjRYQWkWax866886FJjA1ZFP+ahaBOIbmO9/tp
 CdEHUHnP4+bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="153231512"
X-IronPort-AV: E=Sophos;i="5.76,346,1592895600"; 
   d="scan'208";a="153231512"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2020 17:03:19 -0700
IronPort-SDR: NX4gyhqPJBYDGVQiIi7VIAjdr75dv684/8Gb6g0vNFUCV14BadiUlFd0oSBWrqrFi6ZrmKHVgS
 im58W4AB2HkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,346,1592895600"; 
   d="scan'208";a="328305293"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2020 17:03:17 -0700
Received: from pgsmsx603.gar.corp.intel.com (10.108.199.138) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 24 Aug 2020 08:03:16 +0800
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 24 Aug 2020 08:03:16 +0800
Received: from pgsmsx111.gar.corp.intel.com ([169.254.2.97]) by
 PGSMSX102.gar.corp.intel.com ([169.254.6.18]) with mapi id 14.03.0439.000;
 Mon, 24 Aug 2020 08:03:16 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "liu.ming50@gmail.com"
	<liu.ming50@gmail.com>
CC: "sergio.prado@toradex.com" <sergio.prado@toradex.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"stefan.agner@toradex.com" <stefan.agner@toradex.com>,
	"max.krummenacher@toradex.com" <max.krummenacher@toradex.com>
Subject: Re: [OE-core] [PATCH] [dunfell 3/3] libubootenv: uprev to v0.3
Thread-Topic: [OE-core] [PATCH] [dunfell 3/3] libubootenv: uprev to v0.3
Thread-Index: AQHWeJgPTr9i/sJlr0uymbonD5H05qlF3J8A
Date: Mon, 24 Aug 2020 00:03:16 +0000
Message-ID: <ad755709393c57c583a79c8b9d2308f2f2c3fafa.camel@intel.com>
References: <20200822152207.32161-1-liu.ming50@gmail.com>
	 <20200822152207.32161-4-liu.ming50@gmail.com>
In-Reply-To: <20200822152207.32161-4-liu.ming50@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.145.178]
MIME-Version: 1.0
Return-Path: anuj.mittal@intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CF5BA9F5A86254E84FE775C49C0AAD5@intel.com>
Content-Transfer-Encoding: base64

T24gU2F0LCAyMDIwLTA4LTIyIGF0IDE3OjIyICswMjAwLCBNaW5nIExpdSB3cm90ZToNCj4gRnJv
bTogTWluZyBMaXUgPGxpdS5taW5nNTBAZ21haWwuY29tPg0KPiANCj4gVXBkYXRlIGxpYnVib290
ZW52IHRvIHRoZSBsYXRlc3QgMC4zIHJlbGVhc2UsIHdoaWNoIGNvbXByaXNlcyB0aGUNCj4gZm9s
bG93aW5nIGNvbW1pdHM6DQo+IA0KPiBgYGANCj4gMWVmZWQ4MyBJbmNyZWFzZSBtYXggbGVuZ3Ro
IGZvciBkZXZpY2UgbmFtZQ0KPiA2ZjRmYzFjIHVib290X2VudjogVXNlIGNhbm9uaWNhbGl6ZWQg
cGF0aG5hbWUgd2hlbiByZWFkaW5nIGRldmljZQ0KPiAyM2IzMDg2IEZpeCBidWcgaW50cm9kdWNl
ZCBieSBjb21taXQgNTJhNzAxMTQNCj4gZWQxYTUzZSBEb250IHN0b3JlIHRvIGRldmljZSBpZiBu
byB2YWx1ZSBjaGFuZ2VzDQo+IDRhMGE0NjYgTWVyZ2UgcHVsbCByZXF1ZXN0ICM3IGZyb20gVG9t
ekJlbmNoL2NtYWtlLWZpeA0KPiA2MTE3ODMxIEFkZGVkIENvdmVyaXR5IGJhZGdlDQo+IDQ5Mzcy
YTEgRml4IGNvdmVyaXR5ICMyOTM0OTYNCj4gNjlhNjgxOSBGaXggY292ZXJpdHkgIzI5MzUwMyBh
bmQgIzI5MzUwNw0KPiAyNThiZjUyIEZpeCBjb3Zlcml0eSAjMjkzNTAxDQo+IGFhNTJlNjEgRml4
IGNvdmVyaXR5ICMyOTM1MDUNCj4gNTJhNzAxMSBGaXggY292ZXJpdHkgIzI5MzUwNCBhbmQgIzI5
MzUwNg0KPiBlODIyMjE4IEZpeCBjb3Zlcml0eSAjMjkzNDk1IGFuZCAjMjkzNDk3DQo+IDIzYjMw
NWYgRml4IGNvdmVyaXR5ICMyOTM0OTkNCj4gMjVlZjFmNiBBZGQgY292ZXJpdHkgc2V0dXAgZm9y
IFRyYXZpcw0KPiA0MWI1MTg4IGZpeGVkIGluc3RhbGwgZm9yIHN0YXRpYyB0YXJnZXQsIGZpeGVk
IEJVSUxEX0RPQw0KPiBhY2tub3dsZWRnZW1lbnQNCj4gODZiZDMwYSBSZXN0b3JlIGFiaWxpdHkg
dG8gZmVlZCBzY3JpcHQgZmlsZSB2aWEgc3RkaW4sIHVzaW5nIGAtcyAtYC4NCj4gYzkxZGNjYSB1
YmksIHdyaXRlOiBmaXggaW52YWxpZCBlbnZzaXplIHB0ciB0byBVQklfSU9DVk9MVVANCj4gZjRi
OWNkZSBBbGxvdyBuZWdhdGl2ZSBvZmZzZXRzDQo+IDQ1YmY5MmEgRGV0ZWN0IHNlY3RvciBzaXpl
IGlmIG5vdCBmb3VuZCBpbiBjb25maWcNCj4gOWY1OWRiNiB1Ym9vdF9lbnY6IHJlbW92ZSB1bnVz
ZWQgdmFyaWFibGVzDQo+IDY1ZDI0M2UgUkVBRE1FOiBsaWJ1Ym9vdGVudiBpcyBub3cgaW4gb2Ut
Y29yZQ0KPiBiYTk1MmQwIEJVRzogdmFyaWFibGUgbGlzdHMgbm90IHJlbGVhc2VkIGluIGNsb3Nl
KCkNCj4gNjkwZjg2OCBWYXJpYWJsZXMgYXJlIG5vdCByZW1vdmVkIHdoZW4gbG9hZGluZyBmcm9t
IGZpbGUNCj4gOWUzNTg2YSBNYWtlIHN1cmUgdGhlcmUncyBubyBmaWxlIGRlc2NyaXB0b3IgbGVh
a2FnZSBpbiBjYXNlIG9mIGVycm9yDQo+IDAzNjQ3YzQgQ2hlY2sgY29uZmlnIGZpbGUgZGVmaW5l
cyBhIG5vbi16ZXJvIFNlY3RvciBzaXplDQo+IDNiMmQ0ZjEgQ2hlY2sgZW52aXJvbm1lbnQgc2l6
ZSBmcm9tIGZ3X2Vudi5jb25maWcNCj4gODc5YzA3MyBEbyBub3QgaGFyZGNvZGUgcGF0aCBmb3Ig
aW5zdGFsbA0KPiBkOWM2MzliIGxpYnVib290ZW52OiBhZGQgcGtnLWNvbmZpZyBzdXBwb3J0DQo+
IGNjNjI4ZWUgbGlidWJvb3Q6IHdyYXAgbGlidWJvb3QgaW4gZXh0ZXJuICJDIiBmb3IgQysrDQo+
IGBgYA0KPiANCj4gQWxzbyBhZGQgdS1ib290LWRlZmF1bHQtZW52IHRvIFJSRUNPTU1FTkRTIHNp
bmNlDQo+IC9ldGMvdS1ib290LWluaXRpYWwtZW52IGlzIGJlaW5nIHJlZmVycmVkIGluIGxpYnVi
b290ZW52IHNvdXJjZSwgYW5kDQo+IHR1cm5zIGxpYnVib290ZW52J3MgUEFDS0FHRV9BUkNIIHRv
IGJlIE1BQ0hJTkVfQVJDSCBzaW5jZQ0KPiB1LWJvb3QtZGVmYXVsdC1lbnYgaXMgYSBtYWNoaW5l
LWFyY2ggcGFja2FnZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pbmcgTGl1IDxsaXUubWluZzUw
QGdtYWlsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVy
ZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IChjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDAy
ZDU1Y2QzNWFhYzE1MDk1ZmM0NGYwY2Y4ZjllN2E3MTYzOGY0ODUpDQo+IC0tLQ0KPiAgLi4uL3Ut
Ym9vdC97bGlidWJvb3RlbnZfMC4yLmJiID0+IGxpYnVib290ZW52XzAuMy5iYn0gICAgICB8IDcN
Cj4gKysrKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gIHJlbmFtZSBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC97bGlidWJvb3RlbnZfMC4y
LmJiID0+DQo+IGxpYnVib290ZW52XzAuMy5iYn0gKDgyJSkNCj4gDQo+IGRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9saWJ1Ym9vdGVudl8wLjIuYmINCj4gYi9tZXRhL3JlY2lw
ZXMtYnNwL3UtYm9vdC9saWJ1Ym9vdGVudl8wLjMuYmINCj4gc2ltaWxhcml0eSBpbmRleCA4MiUN
Cj4gcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWJzcC91LWJvb3QvbGlidWJvb3RlbnZfMC4yLmJi
DQo+IHJlbmFtZSB0byBtZXRhL3JlY2lwZXMtYnNwL3UtYm9vdC9saWJ1Ym9vdGVudl8wLjMuYmIN
Cj4gaW5kZXggZWEyOWI2NjhlOC4uNDdlNjRmOTExNCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNp
cGVzLWJzcC91LWJvb3QvbGlidWJvb3RlbnZfMC4yLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1i
c3AvdS1ib290L2xpYnVib290ZW52XzAuMy5iYg0KPiBAQCAtMTAsOSArMTAsOCBAQCBMSUNFTlNF
ID0gIkxHUEwtMi4xIg0KPiAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTGljZW5zZXMvbGdw
bC0NCj4gMi4xLnR4dDttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMiDQo+ICBT
RUNUSU9OID0gImxpYnMiDQo+ICANCj4gLVBWID0gIjAuMitnaXQke1NSQ1BWfSINCj4gIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zYmFiaWMvbGlidWJvb3RlbnY7cHJvdG9jb2w9aHR0cHMi
DQo+IC1TUkNSRVYgPSAiZjRiOWNkZTM4MTVhYmU4NGE5ODA3OWNlZGQ1MTUyODNlYTA4YzE2YiIN
Cj4gK1NSQ1JFViA9ICJhZDI1M2NmZGIwN2M4NDkyZjJlZTQ2YTUyZmJjNjA3YWQwYjk2NDE0Ig0K
PiAgDQo+ICBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiAgDQo+IEBAIC0yNCw0ICsyMyw4IEBAIERF
UEVORFMgPSAiemxpYiINCj4gIFBST1ZJREVTICs9ICJ1LWJvb3QtZnctdXRpbHMiDQo+ICBSUFJP
VklERVNfJHtQTn0tYmluICs9ICJ1LWJvb3QtZnctdXRpbHMiDQo+ICANCj4gK1BBQ0tBR0VfQVJD
SCA9ICIke01BQ0hJTkVfQVJDSH0iDQo+ICsNCj4gK1JSRUNPTU1FTkRTXyR7UE59LWJpbl9hcHBl
bmRfY2xhc3MtdGFyZ2V0ID0gIiB1LWJvb3QtZGVmYXVsdC1lbnYiDQo+ICsNCg0KVGhpcyBjYXVz
ZXMgd29ybGQgYnVpbGRzIHRvIGZhaWwgd2hlbiB1Ym9vdCBidWlsZCBpcyBza2lwcGVkIGZvciBh
DQpNQUNISU5FIHZhbHVlIGZvciBleGFtcGxlIHdoZW4gVUJPT1RfQ09ORklHIG9yIFVCT09UX01B
Q0hJTkUgaXMgbm90DQpkZWZpbmVkLiBQZXJoYXBzIHRoaXMgcmVjaXBlIHNob3VsZCBhbHNvIGJl
IHNraXBwZWQgaW4gdGhvc2UgY2FzZXM/DQoNClRoYW5rcywNCg0KQW51ag0K
