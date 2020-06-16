Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.5485.1592291806359181785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 00:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ZOScFXOvO6ISTVT8yqxq6ToDAc/0xRVmQbWWF+d5u6Z4N9Q5r4nh4+LRGH6hyfWEFSd8o40Sup
 G8V+qTPT2jOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2020 00:16:45 -0700
IronPort-SDR: ker8wQcADtwc1pwoKc/NBio8pT0NYunmRboer9DTa0ZCw5ZMCGozpHSi+kkha53ZFv/7Njx7tZ
 e9qYaDJEuIlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,518,1583222400"; 
   d="scan'208";a="262940776"
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jun 2020 00:16:44 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.74]) by
 PGSMSX111.gar.corp.intel.com ([169.254.2.204]) with mapi id 14.03.0439.000;
 Tue, 16 Jun 2020 15:16:44 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "arthur.she@linaro.org"
	<arthur.she@linaro.org>
CC: "denis@denix.org" <denis@denix.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add new package
Thread-Topic: [OE-core][PATCH] igt-gpu-tools: add new package
Thread-Index: AQHWQtpSd32PhNtzjEODodwpgD2vTKjYxguAgAADLACAAVy3AIAAJwYAgAADZgA=
Date: Tue, 16 Jun 2020 07:16:42 +0000
Message-ID: <9f5397898511c51c6a388fa602e8bdba1a702560.camel@intel.com>
References: <20200615060025.171354-1-arthur.she@linaro.org>
	 <CANNYZj9RLRjTgB-Qy4Rzx9iWN4PMGzay-XxgZGEei_HC8gEq=w@mail.gmail.com>
	 <20200615075646.GU17660@denix.org>
	 <CAJ8hLzH2JMoJ7QspxnjAZ1ZwKshj+REUu=HrE7A2tspu_pH=Zw@mail.gmail.com>
	 <CANNYZj8n5b46zVCL1Kt4NdweQb0tvZh3SmCype4p6BxzD7_T7Q@mail.gmail.com>
In-Reply-To: <CANNYZj8n5b46zVCL1Kt4NdweQb0tvZh3SmCype4p6BxzD7_T7Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.147.177]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <827D0CCCD37FCC4687BC87CE3CAC2B1B@intel.com>
Content-Transfer-Encoding: base64

SGkgQWxleA0KDQpPbiBUdWUsIDIwMjAtMDYtMTYgYXQgMDk6MDQgKzAyMDAsIEFsZXhhbmRlciBL
YW5hdmluIHdyb3RlOg0KPiBVc3VhbGx5IGl0J3MgdGhlIG90aGVyIHdheSBhcm91bmQgLSB3aGF0
IGlzIHRoZSByZWFzb24gdG8gaGF2ZSB0aGlzDQo+IHJlY2lwZSBpbiBjb3JlPw0KPiANCg0KSSBo
YWQgcmVxdWVzdGVkIEFydGh1ciB0byBzZW5kIHRoaXMgdG8gb2UtY29yZSBzaW5jZSB0aGlzIHBy
b3ZpZGVzDQphIGNvcmUgdmFsaWRhdGlvbiBmdW5jdGlvbmFsaXR5IHRoYXQgaXMgbmVlZGVkIGJ5
IGFsbCBwcm92aWRpbmcgRFJNDQpkcml2ZXJzIGFuZCBpcyBhcHBsaWNhYmxlIG5vdCBqdXN0IHRv
IGEgc2luZ2xlIGFyY2guDQoNCkl0J3MgYSB3ZWxsIG1haW50YWluZWQgcHJvamVjdCBhbmQgSSBj
YW4ga2VlcCB0aGUgcmVjaXBlIHVwZGF0ZWQgYW5kDQp3b3JraW5nLiBJZiBpdCBjYW4gYmUgaW4g
b2UtY29yZSwgSSBjYW4gcmVtb3ZlIGl0IGZyb20gbWV0YS1pbnRlbCBsYXllcg0KYW5kIGF2b2lk
IGhhdmluZyBhIGR1cGxpY2F0ZSByZWNpcGUuDQoNClRoYW5rcywNCg0KQW51ag0KDQo+IEFsZXgN
Cj4gDQo+IE9uIFR1ZSwgMTYgSnVuIDIwMjAgYXQgMDY6NDUsIEFydGh1ciBTaGUgPGFydGh1ci5z
aGVAbGluYXJvLm9yZz4NCj4gd3JvdGU6DQo+ID4gSGkgQWxleGFuZGVyIGFuZCBEZW55cywNCj4g
PiBUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suDQo+ID4gSSBoYXZlIG5vIHByb2JsZW0gc3VibWl0
dGluZyBpdCB0byBtZXRhLW9lLg0KPiA+IFNpbmNlIHRoZSBtZXRhLWludGVsIG1haW50YWluZXIg
cmVxdWVzdGVkIHRvIHN1Ym1pdCBpdCB0byBvZS1jb3JlLA0KPiA+IGRvIHlvdSBtaW5kIHNoYXJp
bmcgc29tZSB0aG91Z2h0IGFib3V0IHRoZSByZWFzb24/DQo+ID4gDQo+ID4gVGhhbmsgeW91IHNv
IG11Y2gsDQo+ID4gQXJ0aHVyDQo+ID4gDQo+ID4gT24gTW9uLCBKdW4gMTUsIDIwMjAgYXQgMTI6
NTYgQU0gRGVueXMgRG15dHJpeWVua28gPGRlbmlzQGRlbml4Lm9yZw0KPiA+ID4gd3JvdGU6DQo+
ID4gPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwv
dG9waWMvNzQ3NzUyOTQNCj4gPiA+IA0KPiA+ID4gQnV0IEkgdGVuZCB0byBhZ3JlZS4NCj4gPiA+
IA0K
