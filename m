Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.2283.1594258160962871581
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 18:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: STsetTYte0Eo1lHrGSdIoRoDhC2pn8vd5xxxWBEhSzQUuWMUg7MrJpHHu/9C5gpUV9GNpIjHkR
 3PezoWmjv5CQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="166021478"
X-IronPort-AV: E=Sophos;i="5.75,330,1589266800"; 
   d="scan'208";a="166021478"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2020 18:29:20 -0700
IronPort-SDR: VALr7/PhEWif6t76HVYKDrKLiSYkjb+Al5aho6HjoMpYOM2uaRsccjE0rnctbsDFxoM5DKAatd
 gbDCBUyPOPcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,330,1589266800"; 
   d="scan'208";a="323090287"
Received: from pgsmsx112.gar.corp.intel.com ([10.108.55.201])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2020 18:29:19 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.140]) by
 PGSMSX112.gar.corp.intel.com ([169.254.3.215]) with mapi id 14.03.0439.000;
 Thu, 9 Jul 2020 09:29:18 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "arthur.she@linaro.org" <arthur.she@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: Add PACKAGECONFIG for Chamelium support
Thread-Topic: [OE-core][PATCH] igt-gpu-tools: Add PACKAGECONFIG for
 Chamelium support
Thread-Index: AQHWVKMgLudVvzdYm06fl1dld/vuV6j8QXgAgAAV3gCAAZn/AA==
Date: Thu, 9 Jul 2020 01:29:17 +0000
Message-ID: <3b9022a2bc437d6df7d2adecd951bc4988af9d32.camel@intel.com>
References: <20200707210917.231615-1-arthur.she@linaro.org>
	 <511a56908795531f547003a26af933a02c711583.camel@intel.com>
	 <CAJ8hLzGd7Yvxz6=56FSLXs3VMpX4vr5gcY3WwwVrYBzEuka0hA@mail.gmail.com>
In-Reply-To: <CAJ8hLzGd7Yvxz6=56FSLXs3VMpX4vr5gcY3WwwVrYBzEuka0hA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.73.221]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4434E07F4E41F44AFD953B8100A35D2@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTA3LTA3IGF0IDE4OjAxIC0wNzAwLCBBcnRodXIgU2hlIHdyb3RlOg0KPiBI
aSBBbnVqLA0KPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KPiBJIGRvbid0IG5lZWQgdG8gcHV0
ICItRGNoYW1lbGl1bT1kaXNhYmxlZCIgaW4gdGhlIEVYVFJBX09FTUVTT04uDQo+IEJlY2F1c2Ug
Y2hhbWVsaXVtIGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQuDQo+IElzIGl0IGNvcnJlY3Q/DQoNClll
cywgc2luY2UgaXQncyBkaXNhYmxlZCBieSBkZWZhdWx0LCAtRGNoYW1lbGl1bT1kaXNhYmxlZCBp
cyBhbHJlYWR5DQpiZWluZyBwYXNzZWQgdG8gRVhUUkFfT0VNRVNPTi4NCg0KSW4gdGhpcyBjaGFu
Z2UsIGlmIHlvdSBhZGQgY2hhbWVsaXVtIHRvIFBBQ0tBR0VDT05GSUcsIGl0IHdpbGwgcGFzcw0K
Ym90aCAtRGNoYW1lbGl1bT1lbmFibGVkIGFuZCAtRGNoYW1lbGl1bT1kaXNhYmxlZCB0byBFWFRS
QV9PRU1FU09ODQp3aGljaCBpcyBpbmNvcnJlY3QuIEl0IHByb2JhYmx5IHdvcmtzIGZvciB5b3Ug
YmVjYXVzZSBQQUNLQUdFQ09ORklHDQphcmd1bWVudHMgYXJlIGFkZGVkIGxhc3QgLi4uDQoNClRo
YW5rcywNCg0KQW51ag0KDQo+IA0KPiBUaGFua3MsDQo+IEFydGh1cg0KPiANCj4gT24gVHVlLCBK
dWwgNywgMjAyMCBhdCA0OjQzIFBNIE1pdHRhbCwgQW51aiA8YW51ai5taXR0YWxAaW50ZWwuY29t
Pg0KPiB3cm90ZToNCj4gPiBPbiBUdWUsIDIwMjAtMDctMDcgYXQgMTQ6MDkgLTA3MDAsIEFydGh1
ciBTaGUgd3JvdGU6DQo+ID4gPiBDaGFtZWxpdW0gaXMgYSBoYXJkd2FyZSBkZXZpY2UgdGhhdCBj
YW4gYmUgdXNlZCBmb3IgZXh0ZXJuYWwNCj4gPiBkaXNwbGF5DQo+ID4gPiB0ZXN0IGF1dG9tYXRp
b24gWzFdLg0KPiA+ID4gSXQgaXMgZGlzYWJsZWQgYnkgZGVmYXVsdCBhbmQgY2FuIGJlIHR1cm5l
ZCBvbiB0aHJvdWdoDQo+ID4gUEFDS0FHRUNPTkZJRy4NCj4gPiA+IA0KPiA+ID4gWzFdIGh0dHBz
Oi8vd3d3LmNocm9taXVtLm9yZy9jaHJvbWl1bS1vcy90ZXN0aW5nL2NoYW1lbGl1bQ0KPiA+ID4g
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBcnRodXIgU2hlIDxhcnRodXIuc2hlQGxpbmFyby5vcmc+
DQo+ID4gPiAtLS0NCj4gPiA+ICBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaWd0LWdwdS10b29scy9p
Z3QtZ3B1LXRvb2xzX2dpdC5iYiB8IDQNCj4gPiArKystDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0LWdwdS0NCj4gPiB0b29s
c19naXQuYmIgDQo+ID4gPiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3QtZ3B1LXRvb2xzL2ln
dC1ncHUtdG9vbHNfZ2l0LmJiDQo+ID4gPiBpbmRleCBmNjA4ODBjMjkyLi4yOTAzMWU2NGRjIDEw
MDY0NA0KPiA+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2lndC1ncHUtdG9vbHMvaWd0
LWdwdS10b29sc19naXQuYmINCj4gPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9pZ3Qt
Z3B1LXRvb2xzL2lndC1ncHUtdG9vbHNfZ2l0LmJiDQo+ID4gPiBAQCAtMjAsNyArMjAsOSBAQCBS
REVQRU5EU18ke1BOfS10ZXN0cyArPSAiYmFzaCINCj4gPiA+ICANCj4gPiA+ICBQQUNLQUdFX0JF
Rk9SRV9QTiA9ICIke1BOfS1iZW5jaG1hcmtzICR7UE59LXRlc3RzIg0KPiA+ID4gIA0KPiA+ID4g
LUVYVFJBX09FTUVTT04gPSAiLURkb2NzPWRpc2FibGVkIC1EcnVubmVyPWVuYWJsZWQiDQo+ID4g
PiArUEFDS0FHRUNPTkZJR1tjaGFtZWxpdW1dID0gIi1EY2hhbWVsaXVtPWVuYWJsZWQsLQ0KPiA+
ID4gRGNoYW1lbGl1bT1kaXNhYmxlZCxnc2wgeG1scnBjLWMiDQo+ID4gPiArDQo+ID4gPiArRVhU
UkFfT0VNRVNPTiA9ICItRGRvY3M9ZGlzYWJsZWQgLURydW5uZXI9ZW5hYmxlZA0KPiA+ID4gLURj
aGFtZWxpdW09ZGlzYWJsZWQiDQo+ID4gDQo+ID4gVGhpcyBpcyBkaXNhYmxpbmcgY2hhbWVsaXVt
IGV2ZW4gaWYgaXQncyBlbmFibGVkIHVzaW5nDQo+ID4gUEFDS0FHRUNPTkZJRy4NCj4gPiANCj4g
PiBUaGFua3MsDQo+ID4gDQo+ID4gQW51ag0K
