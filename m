Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 24D9C61085
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 16:00:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2020 08:00:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,441,1574150400"; d="scan'208";a="407031637"
Received: from pgsmsx103.gar.corp.intel.com ([10.221.44.82])
	by orsmga005.jf.intel.com with ESMTP; 14 Feb 2020 08:00:54 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.77]) by
	PGSMSX103.gar.corp.intel.com ([169.254.2.78]) with mapi id
	14.03.0439.000; Sat, 15 Feb 2020 00:00:53 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Lee, Chee Yang"
	<chee.yang.lee@intel.com>
Thread-Topic: [OE-core] [PATCH v2 2/2] libxml2: Fix CVE-2019-20388
Thread-Index: AQHV4yn6Sw7TmV08ZkSWCse03HcuNKgaU2uA
Date: Fri, 14 Feb 2020 16:00:51 +0000
Message-ID: <7bd6489c601469c160a54642dc458821449a4bdf.camel@intel.com>
References: <1581679690-76669-1-git-send-email-chee.yang.lee@intel.com>
	<1581679690-76669-2-git-send-email-chee.yang.lee@intel.com>
In-Reply-To: <1581679690-76669-2-git-send-email-chee.yang.lee@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.67.29]
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] libxml2: Fix CVE-2019-20388
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
X-List-Received-Date: Fri, 14 Feb 2020 16:00:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AC2BCDF0FD5F74E80C90DF69E8C182D@intel.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTAyLTE0IGF0IDE5OjI4ICswODAwLCBjaGVlLnlhbmcubGVlQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTGVlIENoZWUgWWFuZyA8Y2hlZS55YW5nLmxlZUBpbnRlbC5jb20+
DQo+IA0KPiBzZWU6DQo+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9saWJ4bWwyL21l
cmdlX3JlcXVlc3RzLzY4DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMZWUgQ2hlZSBZYW5nIDxjaGVl
LnlhbmcubGVlQGludGVsLmNvbT4NCj4gLS0tDQo+ICAuLi4vbGlieG1sL2xpYnhtbDIvQ1ZFLTIw
MTktMjAzODgucGF0Y2ggICAgICAgICAgICB8IDM3DQo+ICsrKysrKysrKysrKysrKysrKysrKysN
Cj4gIG1ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuOS4xMC5iYiAgICAgICAgIHwg
IDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvQ1ZFLTIwMTktDQo+IDIw
Mzg4LnBhdGNoDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbGlieG1sL2xp
YnhtbDIvQ1ZFLTIwMTktMjAzODgucGF0Y2gNCj4gYi9tZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwv
bGlieG1sMi9DVkUtMjAxOS0yMDM4OC5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBp
bmRleCAwMDAwMDAwLi40ZWUyZDRmDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNp
cGVzLWNvcmUvbGlieG1sL2xpYnhtbDIvQ1ZFLTIwMTktMjAzODgucGF0Y2gNCj4gQEAgLTAsMCAr
MSwzNyBAQA0KPiArRnJvbSA3ZmZjZDQ0ZDdlNmM0NjcwNGY4YWYwMzIxZDkzMTRjZDI2ZTBlMThh
IE1vbiBTZXAgMTcgMDA6MDA6MDANCj4gMjAwMQ0KPiArRnJvbTogWmhpcGVuZyBYaWUgPHhpZXpo
aXBlbmcxQGh1YXdlaS5jb20+DQo+ICtEYXRlOiBUdWUsIDIwIEF1ZyAyMDE5IDE2OjMzOjA2ICsw
ODAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIEZpeCBtZW1vcnkgbGVhayBpbiB4bWxTY2hlbWFWYWxp
ZGF0ZVN0cmVhbQ0KPiArDQo+ICtXaGVuIGN0eHQtPnNjaGVtYSBpcyBOVUxMLCB4bWxTY2hlbWFT
QVhQbHVnLT54bWxTY2hlbWFQcmVSdW4NCj4gK2FsbG9jIGEgbmV3IHNjaGVtYSBmb3IgY3R4dC0+
c2NoZW1hIGFuZCBzZXQgdmN0eHQtPnhzaUFzc2VtYmxlDQo+ICt0byAxLiBUaGVuIHhtbFNjaGVt
YVZTdGFydC0+eG1sU2NoZW1hUHJlUnVuIGluaXRpYWxpemUNCj4gK3ZjdHh0LT54c2lBc3NlbWJs
ZSB0byAwIGFnYWluIHdoaWNoIGNhdXNlIHRoZSBhbGxvY2VkIHNjaGVtYQ0KPiArY2FuIG5vdCBi
ZSBmcmVlZCBhbnltb3JlLg0KPiArDQo+ICtGb3VuZCB3aXRoIGxpYkZ1enplci4NCj4gKw0KPiAr
VXBzdHJlYW0tU3RhdHVzOiBBY2NlcHRlZCBbDQo+IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9H
Tk9NRS9saWJ4bWwyL2NvbW1pdC83ZmZjZDQ0ZDdlNmM0NjcwNGY4YWYwMzIxZDkzMTRjZDI2ZTBl
MThhDQo+IF0NCg0KVGhlIHN0YXR1cyBoZXJlIHNob3VsZCBiZSBCYWNrcG9ydC4NCg0KVGhhbmtz
LA0KDQpBbnVqDQoNCj4gK0NWRTogQ1ZFLTIwMTktMjAzODgNCj4gKw0KPiArU2lnbmVkLW9mZi1i
eTogWmhpcGVuZyBYaWUgPHhpZXpoaXBlbmcxQGh1YXdlaS5jb20+DQo+ICtTaWduZWQtb2ZmLWJ5
OiBMZWUgQ2hlZSBZYW5nIDxjaGVlLnlhbmcubGVlQGludGVsLmNvbT4NCj4gKy0tLQ0KPiArIHht
bHNjaGVtYXMuYyB8IDEgLQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+ICsN
Cj4gK2RpZmYgLS1naXQgYS94bWxzY2hlbWFzLmMgYi94bWxzY2hlbWFzLmMNCj4gK2luZGV4IDMw
MWM4NDQ5Li4zOWQ5MjE4MiAxMDA2NDQNCj4gKy0tLSBhL3htbHNjaGVtYXMuYw0KPiArKysrIGIv
eG1sc2NoZW1hcy5jDQo+ICtAQCAtMjgwOTAsNyArMjgwOTAsNiBAQCB4bWxTY2hlbWFQcmVSdW4o
eG1sU2NoZW1hVmFsaWRDdHh0UHRyIHZjdHh0KQ0KPiB7DQo+ICsgICAgIHZjdHh0LT5uYmVycm9y
cyA9IDA7DQo+ICsgICAgIHZjdHh0LT5kZXB0aCA9IC0xOw0KPiArICAgICB2Y3R4dC0+c2tpcERl
cHRoID0gLTE7DQo+ICstICAgIHZjdHh0LT54c2lBc3NlbWJsZSA9IDA7DQo+ICsgICAgIHZjdHh0
LT5oYXNLZXlyZWZzID0gMDsNCj4gKyAjaWZkZWYgRU5BQkxFX0lEQ19OT0RFX1RBQkxFU19URVNU
DQo+ICsgICAgIHZjdHh0LT5jcmVhdGVJRENOb2RlVGFibGVzID0gMTsNCj4gKy0tIA0KPiArMi4y
NC4xDQo+ICsNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwy
XzIuOS4xMC5iYg0KPiBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuOS4xMC5i
Yg0KPiBpbmRleCA2YTQwOTdjLi4wOTdhY2ViIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMt
Y29yZS9saWJ4bWwvbGlieG1sMl8yLjkuMTAuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUv
bGlieG1sL2xpYnhtbDJfMi45LjEwLmJiDQo+IEBAIC0yMSw2ICsyMSw3IEBAIFNSQ19VUkkgPSAi
DQo+IGh0dHA6Ly93d3cueG1sc29mdC5vcmcvc291cmNlcy9saWJ4bWwyLSR7UFZ9LnRhci5nejtu
YW1lPWxpYnRhciBcDQo+ICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLU1ha2UtcHRlc3QtcnVuLXRo
ZS1weXRob24tdGVzdHMtaWYtcHl0aG9uLWlzLQ0KPiBlbmFibGVkLnBhdGNoIFwNCj4gICAgICAg
ICAgICAgZmlsZTovL2ZpeC1leGVjdXRpb24tb2YtcHRlc3RzLnBhdGNoIFwNCj4gICAgICAgICAg
ICAgZmlsZTovL0NWRS0yMDIwLTc1OTUucGF0Y2ggXA0KPiArICAgICAgICAgICBmaWxlOi8vQ1ZF
LTIwMTktMjAzODgucGF0Y2ggXA0KPiAgICAgICAgICAgICAiDQo+ICANCj4gIFNSQ19VUklbbGli
dGFyLm1kNXN1bV0gPSAiMTA5NDJhMWRjMjMxMzdhOGFhMDdmMDYzOWNiZmVjZTUiDQo+IC0tIA0K
PiAyLjcuNA0KPiANCg==

