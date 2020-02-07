Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0094A6027A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 04:14:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Feb 2020 20:14:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,411,1574150400"; d="scan'208";a="432445436"
Received: from kmsmsx153.gar.corp.intel.com ([172.21.73.88])
	by fmsmga006.fm.intel.com with ESMTP; 06 Feb 2020 20:14:52 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.131]) by
	KMSMSX153.gar.corp.intel.com ([169.254.5.66]) with mapi id
	14.03.0439.000; Fri, 7 Feb 2020 12:14:51 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "crg7475@mailbox.org"
	<crg7475@mailbox.org>
Thread-Topic: [OE-core] [PATCH] gstreamer1.0-plugins-good: change
	EXTRA_OECONF -> EXTRA_OEMESON
Thread-Index: AQHV3OOmv1edMmzvYky+SXV2dlJ/D6gOmmWA
Date: Fri, 7 Feb 2020 04:14:51 +0000
Message-ID: <265ac69eb8eb8d129d9f66f6d037d44242c42e57.camel@intel.com>
References: <20200206075334.835418-1-anuj.mittal@intel.com>
	<b7ce05ce-aaf7-068c-ab42-235f8844350c@mailbox.org>
In-Reply-To: <b7ce05ce-aaf7-068c-ab42-235f8844350c@mailbox.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.177.191]
MIME-Version: 1.0
Subject: Re: [PATCH] gstreamer1.0-plugins-good: change EXTRA_OECONF -> EXTRA_OEMESON
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Feb 2020 04:14:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CE0A1FB68D86842BB3CC2B480371BC4@intel.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTAyLTA2IGF0IDEyOjQxICswMTAwLCBDYXJsb3MgUmFmYWVsIEdpYW5pIHdy
b3RlOg0KPiBTaG91bGRuJ3QgdGhpcyBiZSBzcGxpdCBpbnRvIHR3byBjb21taXRzLCBvbmUgdGhh
dCBmaXhlcw0KPiBFWFRSQV9PRUNPTkYsIA0KPiBhbmQgb25lIHRoYXQgZml4ZXMgdGhlIHF0NSBz
dXBwb3J0Pw0KPiANCj4gQWxzbywgYXJlIHdlIHN1cmUgdGhhdCBtZXNvbidzIHF0NSBtb2MvcmNj
L3VpYyBhdXRvZGV0ZWN0aW9uIHdvbid0DQo+IGNhdXNlIA0KPiBhbnkgcHJvYmxlbXMgaW4gT0U/
DQo+IFR5cGljYWxseSwgd2UgZGlzYWJsZSBzdWNoICJhdXRvbWFnaWNhbCIgZGV0ZWN0aW9ucyB0
byBlbnN1cmUgDQo+IGRldGVybWluaXN0aWMgYnVpbGRzLg0KDQpSaWdodC4gSSB3aWxsIHNlbmQg
djIgYW5kIGtlZXAgaXQgZGlzYWJsZWQgZXhwbGljaXRseS4NCg0KVGhhbmtzLA0KDQpBbnVqDQoN
Cj4gDQo+IE9uIDA2LjAyLjIwIDA4OjUzLCBBbnVqIE1pdHRhbCB3cm90ZToNCj4gPiBVc2UgdGhl
IGNvcnJlY3QgdmFyaWFibGUgc28gb3B0aW9ucyBhY3R1YWxseSBnZXQgdXNlZC4NCj4gPiANCj4g
PiBxdDUgc3VwcG9ydCBpcyBjdXJyZW50bHkgYXV0b21hZ2ljYWxseSBkZXRlY3RlZCB3aXRoIG1l
c29uIGFuZA0KPiA+IGhhdmluZyBhbg0KPiA+IGV4cGxpY2l0IGRpc2FibGVkIGRvZXNuJ3QgZG8g
YW55dGhpbmcuIFJlbW92ZSBpdCBzbyBpdCBjYW4gYmUNCj4gPiBoYW5kbGVkDQo+ID4gaW4gcXQg
bGF5ZXIgd2l0aCBhcHByb3ByaWF0ZSBERVBFTkRTIGFkZGVkLg0KPiA+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEFudWogTWl0dGFsIDxhbnVqLm1pdHRhbEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4g
ICAuLi4vZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2RfMS4xNi4xLmJiICAgICAg
ICAgIHwgNw0KPiA+ICsrKy0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtDQo+ID4gcGx1Z2lucy1nb29kXzEuMTYu
MS5iYiBiL21ldGEvcmVjaXBlcy0NCj4gPiBtdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1nb29kXzEuMTYuMS5iYg0KPiA+IGluZGV4IGE2ZWI5OTg2ZGQuLmU3ODE2MjE3
MmEgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLQ0KPiA+IGdvb2RfMS4xNi4xLmJiDQo+ID4gKysrIGIvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLQ0KPiA+IGdv
b2RfMS4xNi4xLmJiDQo+ID4gQEAgLTUwLDEyICs1MCwxMiBAQCBQQUNLQUdFQ09ORklHW3ZweF0g
ICAgICAgID0gIi1EdnB4PWVuYWJsZWQsLQ0KPiA+IER2cHg9ZGlzYWJsZWQsbGlidnB4Ig0KPiA+
ICAgUEFDS0FHRUNPTkZJR1t3YXZwYWNrXSAgICA9ICItRHdhdnBhY2s9ZW5hYmxlZCwtDQo+ID4g
RHdhdnBhY2s9ZGlzYWJsZWQsd2F2cGFjayINCj4gPiAgIFBBQ0tBR0VDT05GSUdbeDExXSAgICAg
ICAgPQ0KPiA+ICIke1gxMUVOQUJMRU9QVFN9LCR7WDExRElTQUJMRU9QVFN9LCR7WDExREVQRU5E
U30iDQo+ID4gICANCj4gPiAtIyBxdDUgc3VwcG9ydCBpcyBkaXNhYmxlZCwgYmVjYXVzZSBpdCBp
cyBub3QgcHJlc2VudCBpbiBPRSBjb3JlLA0KPiA+IGFuZCByZXF1aXJlcyBtb3JlIHdvcmsgdGhh
bg0KPiA+IC0jIGp1c3QgYWRkaW5nIGEgcGFja2FnZWNvbmZpZyAoaXQgcmVxdWlyZXMgYWNjZXNz
IHRvIG1vYywgdWljLA0KPiA+IHJjYywgYW5kIHFtYWtlIHBhdGhzKS4NCj4gPiArIyBxdDUgc3Vw
cG9ydCBpcyBkaXNhYmxlZCBieSBkZWZhdWx0IHVubGVzcyBkZXBlbmRlbmNpZXMgYXJlDQo+ID4g
cHJlc2VudC4gRW5hYmxpbmcgaXQgcmVxdWlyZXMNCj4gPiArIyBtb3JlIHdvcmsgdGhhbiBqdXN0
IGFkZGluZyBhIHBhY2thZ2Vjb25maWcgKGl0IHJlcXVpcmVzIGFjY2Vzcw0KPiA+IHRvIG1vYywg
dWljLCByY2MsIGFuZCBxbWFrZSBwYXRocykuDQo+ID4gICAjIFRoaXMgaXMgYmV0dGVyIGRvbmUg
aW4gYSBzZXBhcmF0ZSBxdDUgbGF5ZXIgKHdoaWNoIHRoZW4gc2hvdWxkDQo+ID4gYWRkIGEgInF0
NSIgcGFja2FnZWNvbmZpZw0KPiA+ICAgIyBpbiBhIGdzdHJlYW1lcjEuMC1wbHVnaW5zLWdvb2Qg
YmJhcHBlbmQpLg0KPiA+ICAgDQo+ID4gLUVYVFJBX09FQ09ORiArPSAiIFwNCj4gPiArRVhUUkFf
T0VNRVNPTiArPSAiIFwNCj4gPiAgICAgICAtRGFhbGliPWRpc2FibGVkIFwNCj4gPiAgICAgICAt
RGRpcmVjdHNvdW5kPWRpc2FibGVkIFwNCj4gPiAgICAgICAtRGR2PWRpc2FibGVkIFwNCj4gPiBA
QCAtNjQsNyArNjQsNiBAQCBFWFRSQV9PRUNPTkYgKz0gIiBcDQo+ID4gICAgICAgLURvc3M0PWRp
c2FibGVkIFwNCj4gPiAgICAgICAtRG9zeGF1ZGlvPWRpc2FibGVkIFwNCj4gPiAgICAgICAtRG9z
eHZpZGVvPWRpc2FibGVkIFwNCj4gPiAtICAgIC1EcXQ9ZGlzYWJsZWQgXA0KPiA+ICAgICAgIC1E
c2hvdXQyPWRpc2FibGVkIFwNCj4gPiAgICAgICAtRHR3b2xhbWU9ZGlzYWJsZWQgXA0KPiA+ICAg
ICAgIC1Ed2F2ZWZvcm09ZGlzYWJsZWQgXA0K

