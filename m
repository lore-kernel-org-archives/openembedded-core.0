Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.8267.1611039443857609627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:57:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ERLdeNjcN3/V4eDD9wx4XjIQ7POsTDu3IPc1kZZlyxxBcT3C7bj1+gMxKwR9ktv9qZvTvZtynv
 jL89xLFceJpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="165976730"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="165976730"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:57:19 -0800
IronPort-SDR: Y/l70avsRiD+V7IhTNgjXS1oQ7JOSTCfHCuze8XDnV2oLBSqxRKzZLGjm9lz1Wg4oXoj8sEFgi
 vwSkLD4g47EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="353710254"
Received: from kmsmsx602.gar.corp.intel.com ([172.21.219.142])
  by orsmga006.jf.intel.com with ESMTP; 18 Jan 2021 22:57:18 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx602.gar.corp.intel.com (172.21.219.142) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 19 Jan 2021 14:57:17 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Tue, 19 Jan 2021 14:57:17 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "wangmy@cn.fujitsu.com"
	<wangmy@cn.fujitsu.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: CVE-2020-35965 Security Advisory
Thread-Topic: [OE-core] [PATCH] ffmpeg: CVE-2020-35965 Security Advisory
Thread-Index: AQHW7iZastPy9YLjlkGwJto1rlyVfaot/jsA
Date: Tue, 19 Jan 2021 06:57:16 +0000
Message-ID: <51e230b88e7401cc4141f5f3cb0e93e0e8e2da50.camel@intel.com>
References: <1611035125-38834-1-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1611035125-38834-1-git-send-email-wangmy@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5FB80AFB87FC846A9C8CF6F198C76F0@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIxLTAxLTE5IGF0IDEzOjQ1ICswODAwLCBXYW5nIE1pbmd5dSB3cm90ZToNCj4g
LUZyb20gM2U1OTU5YjM0NTdmN2YxODU2ZDk5NzI2MWU2YWM2NzJiYmE0OWU4YiBNb24gU2VwIDE3
IDAwOjAwOjAwDQo+IDIwMDENCj4gLUZyb206IE1pY2hhZWwgTmllZGVybWF5ZXIgPG1pY2hhZWxA
bmllZGVybWF5ZXIuY2M+DQo+IC1EYXRlOiBTYXQsIDI0IE9jdCAyMDIwIDIyOjIxOjQ4ICswMjAw
DQo+IC1TdWJqZWN0OiBbUEFUQ0hdIGF2Y29kZWMvZXhyOiBDaGVjayB5bWluIHZzLiBoDQo+ICtT
dWJqZWN0OiBbUEFUQ0hdIENWRS0yMDIwLTM1OTY1DQo+ICsNCj4gK2NvbW1pdCBpZDozZTU5NTli
MzQ1N2Y3ZjE4NTZkOTk3MjYxZTZhYzY3MmJiYTQ5ZThiDQo+ICthdmNvZGVjL2V4cjogQ2hlY2sg
eW1pbiB2cy4gaDoNCj4gwqANCj4gwqBGaXhlczogb3V0IG9mIGFycmF5IGFjY2Vzcw0KPiDCoEZp
eGVzOiAyNjUzMi9jbHVzdGVyZnV6ei10ZXN0Y2FzZS1taW5pbWl6ZWQtDQo+IGZmbXBlZ19BVl9D
T0RFQ19JRF9FWFJfZnV6emVyLTU2MTM5MjU3MDg4NTczNDQNCj4gwqBGaXhlczogMjc0NDMvY2x1
c3RlcmZ1enotdGVzdGNhc2UtbWluaW1pemVkLQ0KPiBmZm1wZWdfQVZfQ09ERUNfSURfRVhSX2Z1
enplci01NjMxMjM5ODEzNTk1MTM2DQo+IMKgDQo+IC1Gb3VuZC1ieTogY29udGludW91cyBmdXp6
aW5nIHByb2Nlc3MNCj4gaHR0cHM6Ly9naXRodWIuY29tL2dvb2dsZS9vc3MtZnV6ei90cmVlL21h
c3Rlci9wcm9qZWN0cy9mZm1wZWcNCj4gLVNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgTmllZGVybWF5
ZXIgPG1pY2hhZWxAbmllZGVybWF5ZXIuY2M+DQo+IC0NCj4gLVVwc3RyZWFtLVN0YXR1czogQmFj
a3BvcnQNCj4gW2h0dHBzOi8vZ2l0aHViLmNvbS9GRm1wZWcvRkZtcGVnL2NvbW1pdC8zZTU5NTli
MzQ1N2Y3ZjE4NTZkOTk3MjYxZTZhYzY3MmJiYTQ5ZThiDQo+IF0NCj4gK2NvbW1pdCBpZDpiMGE4
YjQwMjk0ZWEyMTJjMTkzODM0OGZmMTEyZWYxYjliZjE2YmIzDQo+ICthdmNvZGVjL2V4cjogc2tp
cCBib3R0b20gY2xlYXJpbmcgbG9vcCB3aGVuIGl0cyBvdXRzaWRlIHRoZSBpbWFnZToNCj4gwqAN
Cj4gLUNWRTogQ1ZFLTIwMjAtMzU5NjUNCj4gK0ZpeGVzOiBzaWduZWQgaW50ZWdlciBvdmVyZmxv
dzogMTYzMzc3MTgwOSAqIDMyOTYwIGNhbm5vdCBiZQ0KPiByZXByZXNlbnRlZCBpbiB0eXBlICdp
bnQnDQo+ICtGaXhlczogMjY1MzIvY2x1c3RlcmZ1enotdGVzdGNhc2UtbWluaW1pemVkLQ0KPiBm
Zm1wZWdfQVZfQ09ERUNfSURfRVhSX2Z1enplci01NjEzOTI1NzA4ODU3MzQ0DQo+IMKgDQo+ICtG
b3VuZC1ieTogY29udGludW91cyBmdXp6aW5nIHByb2Nlc3MNCj4gaHR0cHM6Ly9naXRodWIuY29t
L2dvb2dsZS9vc3MtZnV6ei90cmVlL21hc3Rlci9wcm9qZWN0cy9mZm1wZWcNCj4gwqBTaWduZWQt
b2ZmLWJ5OiBNaWNoYWVsIE5pZWRlcm1heWVyIDxtaWNoYWVsQG5pZWRlcm1heWVyLmNjPg0KPiAt
U2lnbmVkLW9mZi1ieTogS2hhaXJ1bCBSb2hhaXp6YXQgSmFtYWx1ZGRpbg0KPiA8a2hhaXJ1bC5y
b2hhaXp6YXQuamFtYWx1ZGRpbkBpbnRlbC5jb20+DQoNCkl0IGxvb2tzIGxpa2UgeW91IGFyZSBy
ZW1vdmluZyB0aGUgQ1ZFIGFuZCBVcHN0cmVhbS1TdGF0dXMgdGFnIGZyb20NCnRoaXMgcGF0Y2gu
wqANCg0KSXQgbWlnaHQgYmUgYmV0dGVyIHRvIGJhY2twb3J0IHRoZSBzZWNvbmQgY29tbWl0IGFz
IGEgc2VwYXJhdGUgcGF0Y2gNCmluc3RlYWQgb2Ygc3F1YXNoaW5nIGl0IHdpdGggdGhlIGZpcnN0
IG9uZSAuLi4NCg0KVGhhbmtzLA0KDQpBbnVqDQo=
