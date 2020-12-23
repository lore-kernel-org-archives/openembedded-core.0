Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.11683.1608742648021388771
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 08:57:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: vqiXBqvP7kC2aFu5P+JypnkB599h1EahjdixmRvC8XHXKiVauITRhexbec5Ektww4RVldObEfI
 GXZG8SwT3Lkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9844"; a="163763124"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="163763124"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 08:57:22 -0800
IronPort-SDR: 8bE/hTJowBgXwjqEbZHL6a8PRCVUJACBhl8cSfhB7Bi+7D+VGaTGIxYiaMYPM5BD6/zS2MNBXW
 y8pnHQovhDNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374058340"
Received: from pgsmsx603.gar.corp.intel.com ([10.108.199.138])
  by orsmga008.jf.intel.com with ESMTP; 23 Dec 2020 08:57:19 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 pgsmsx603.gar.corp.intel.com (10.108.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 24 Dec 2020 00:57:18 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.1713.004;
 Thu, 24 Dec 2020 00:57:18 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Jon.Mason@arm.com"
	<Jon.Mason@arm.com>, "ross.burton@arm.com" <ross.burton@arm.com>
Subject: Re: [PATCH 0/9] kernel: consolidated pull request
Thread-Topic: [PATCH 0/9] kernel: consolidated pull request
Thread-Index: AQHW2Sew0tAV0+Tv6U6ch+9pd828F6oEKScAgAA3xIA=
Date: Wed, 23 Dec 2020 16:57:18 +0000
Message-ID: <e5acc8bd1c69b98a98d83328cee9ed33b64c75f7.camel@intel.com>
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
	 <ef75b7d902ee23f65adf34742a71b1b8ee8c64cb.camel@linuxfoundation.org>
	 <CADkTA4NJEXWs3DeXKaM_215Ue5g=ZoCrR6O-7CyvSytRv3z5jg@mail.gmail.com>
In-Reply-To: <CADkTA4NJEXWs3DeXKaM_215Ue5g=ZoCrR6O-7CyvSytRv3z5jg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BE5F2D3BDA0114AA227C6DC84EADB90@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIwLTEyLTIzIGF0IDA4OjM3IC0wNTAwLCBCcnVjZSBBc2hmaWVsZCB3cm90ZToN
Cj4gT24gV2VkLCBEZWMgMjMsIDIwMjAgYXQgNzozMiBBTSBSaWNoYXJkIFB1cmRpZQ0KPiA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+ID4gDQo+ID4gQW51ai9S
b3NzL0pvbjogU2VlIGJlbG93DQo+ID4gDQo+ID4gT24gVHVlLCAyMDIwLTEyLTIyIGF0IDA5OjI4
IC0wNTAwLCBicnVjZS5hc2hmaWVsZEBnbWFpbC5jb23CoHdyb3RlOg0KPiA+ID4gVGhpcyBpcyBs
YXJnZWx5IGEgcmVzZW5kIG9mIHRoZSBjb25maWd1cmF0aW9uIGNoYW5nZXMgYW5kIGtlcm5lbA0K
PiA+ID4gdmVyc2lvbiBidW1wIHRoYXQgSSBoYWQgcHJldmlvdXNseSBzZW50Lg0KPiA+ID4gDQo+
ID4gPiBUaGUga2Vybi10b29scyBTUkNSRVYgYnVtcCBoYXMgYSB0d2VhayBpbiB0aGUgdG9vbHMg
ZnJvbSB0aGUNCj4gPiA+IHByZXZpb3VzDQo+ID4gPiB2ZXJzaW9uLCBhbmQgdGhlcmUgYXJlIHNw
ZWNpZmljIGZpeHVwcyBmb3IgdGhlIHdhcm5pbmdzIHRoYXQgdGhlDQo+ID4gPiB0b29scyB3ZXJl
IG5vdyBleHBvc2luZy4gSSBoYWQgdG8gYmFsYW5jZSB0aW55IGFuZCBzdGFuZGFyZA0KPiA+ID4g
bmVlZGluZw0KPiA+ID4gZGlmZmVyZW50IHZhbHVlcyBmb3Igc29tZSBjb21tb24gb3B0aW9ucyEN
Cj4gPiA+IA0KPiA+ID4gVGhlIEFCIHJ1biB0aGF0IEkgZGlkIGlzIGhlcmU6wqAgDQo+ID4gPiBo
dHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzg1
L2J1aWxkcy8xMjcwDQo+ID4gPiANCj4gPiA+IEV2ZXJ5dGhpbmcgbG9va3MgZ29vZCB0byBtZSAo
YnV0IEkgb25seSBqdXN0IHJlYWxpemVkIHRoYXQgdGhlcmUNCj4gPiA+IGFyZQ0KPiA+ID4gbm93
IG11bHRpcGxlIHBhZ2VzIHRvIGNoZWNrKSA6KS4NCj4gPiANCj4gPiBUaGFua3MgQnJ1Y2UuIFRo
aXMgZG9lcyBub3cgd29yayBvbiB0aGUgYXV0b2J1aWxkZXIsIGl0IGRvZXMgYWxzbw0KPiA+IGV4
cG9zZSB3YXJuaW5ncyBpbiBtZXRhLWludGVsIGFuZCBtZXRhLWFybToNCj4gPiANCj4gPiBodHRw
czovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzExMy9i
dWlsZHMvNTYwDQo+ID4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhv
b24vIy9idWlsZGVycy8xMDAvYnVpbGRzLzEwMzENCj4gPiANCj4gDQo+IEknbGwgdHdlYWsgdGhl
IHY1LjQgbWV0YSBkYXRhIGFuZCBzZW5kIGl0IGFzIGEgc2VwYXJhdGUgcGF0Y2guDQo+IA0KDQpU
aGFua3MgYSBsb3QgQnJ1Y2UhIEkgaGF2ZSB1cGRhdGVkIHRoZSBtZXRhIHJldmlzaW9uIGZvciB0
aGUgSW50ZWwNCmtlcm5lbCBpbiBtZXRhLWludGVsIHRvIHRoZSBvbmUgdGhhdCB5b3UganVzdCBz
ZW50LiBUaGlzIGZpeGVzIHRoZQ0Ka2VybmVsIHdhcm5pbmdzIGZvciBtZXRhLWludGVsLg0KDQpU
aGFua3MsDQoNCkFudWoNCg0K
