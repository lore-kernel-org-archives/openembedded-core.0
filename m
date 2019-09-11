Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 906177F296
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 07:43:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Sep 2019 00:43:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="187107162"
Received: from pgsmsx112-dag.png.intel.com (HELO PGSMSX112.gar.corp.intel.com)
	([10.108.55.234])
	by orsmga003.jf.intel.com with ESMTP; 11 Sep 2019 00:43:57 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.57]) by
	PGSMSX112.gar.corp.intel.com ([169.254.3.2]) with mapi id
	14.03.0439.000; Wed, 11 Sep 2019 15:38:03 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "li.zhou@windriver.com" <li.zhou@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] qemu: Security Advisory - qemu - CVE-2019-15890
Thread-Index: AQHVaGa2vngLr0uUSkma/OjYetQM4qclkMOA
Date: Wed, 11 Sep 2019 07:38:02 +0000
Message-ID: <8d42e3a265dcb8c3dc5398d0f6056df9f0d7940e.camel@intel.com>
References: <1568181773-91288-1-git-send-email-li.zhou@windriver.com>
In-Reply-To: <1568181773-91288-1-git-send-email-li.zhou@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.128.76]
MIME-Version: 1.0
Subject: Re: [PATCH] qemu: Security Advisory - qemu - CVE-2019-15890
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
X-List-Received-Date: Wed, 11 Sep 2019 07:43:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA3D53963DAD4A43AE5A26F036E3CA7B@intel.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE5LTA5LTExIGF0IDE0OjAyICswODAwLCBMaSBaaG91IHdyb3RlOg0KPiBCYWNr
cG9ydGluZyBwYXRjaCBmcm9tDQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9zbGly
cC9saWJzbGlycC9jb21taXQvYzU5Mjc5NDMNCj4gdG8gc29sdmUgQ1ZFLTIwMTktMTU4OTAuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBMaSBaaG91IDxsaS56aG91QHdpbmRyaXZlci5jb20+DQo+IC0t
LQ0KPiAgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgICAgICAgICAgICAgICAg
fCAgMSArDQo+ICAuLi4vcWVtdS9xZW11L0NWRS0yMDE5LTE1ODkwLnBhdGNoICAgICAgICAgICAg
ICAgICB8IDQ4DQo+ICsrKysrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NDkgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvQ1ZFLTIwMTktDQo+IDE1ODkwLnBhdGNoDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgYi9tZXRhL3JlY2lwZXMtDQo+
IGRldnRvb2xzL3FlbXUvcWVtdS5pbmMNCj4gaW5kZXggMjQxZjlkYi4uZGUyMWQzMCAxMDA2NDQN
Cj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMNCj4gKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMNCj4gQEAgLTIzLDYgKzIzLDcgQEAgU1JD
X1VSSSA9ICINCj4gaHR0cHM6Ly9kb3dubG9hZC5xZW11Lm9yZy8ke0JQTn0tJHtQVn0udGFyLnh6
IFwNCj4gICAgICAgICAgICAgZmlsZTovLzAwMDgtbGludXgtdXNlci1GaXgtd2Via2l0Z3RrLWhh
bmdzLW9uLTMyLWJpdC14ODYtDQo+IHRhcmdldC5wYXRjaCBcDQo+ICAgICAgICAgICAgIGZpbGU6
Ly8wMDA5LUZpeC13ZWJraXRndGstYnVpbGRzLnBhdGNoIFwNCj4gICAgICAgICAgICAgZmlsZTov
LzAwMTAtY29uZmlndXJlLUFkZC1wa2ctY29uZmlnLWhhbmRsaW5nLWZvci0NCj4gbGliZ2NyeXB0
LnBhdGNoIFwNCj4gKyAgICAgICAgICAgZmlsZTovL0NWRS0yMDE5LTE1ODkwLnBhdGNoIFwNCj4g
ICAgICAgICAgICAgIg0KPiAgVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicWVtdS0oP1A8cHZlcj5c
ZCsoXC5cZCspKylcLnRhciINCj4gIA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS9DVkUtMjAxOS0xNTg5MC5wYXRjaA0KPiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvQ1ZFLTIwMTktMTU4OTAucGF0Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gaW5kZXggMDAwMDAwMC4uMWQ4OTQzMQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvQ1ZFLTIwMTktMTU4OTAucGF0Y2gNCj4gQEAg
LTAsMCArMSw0OCBAQA0KPiArRnJvbSA0ZmMwZDIzZThmNmQ3OTVjNjc5NjIzZDJlZDJjYmU2YTdh
MTdiOWM3IE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0KPiArRnJvbTogTGkgWmhvdSA8bGku
emhvdUB3aW5kcml2ZXIuY29tPg0KDQpDYW4geW91IHBsZWFzZSBmaXggdGhlIGF1dGhvciBuYW1l
IGhlcmU/DQoNClRoYW5rcywNCg0KQW51ag0K

