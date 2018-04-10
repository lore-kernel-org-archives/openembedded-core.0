Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 183F3748FF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:57:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 17:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,429,1517904000"; d="scan'208";a="219102795"
Received: from pgsmsx111.gar.corp.intel.com ([10.108.55.200])
	by fmsmga005.fm.intel.com with ESMTP; 09 Apr 2018 17:57:09 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.25]) by
	PGSMSX111.gar.corp.intel.com ([169.254.2.233]) with mapi id
	14.03.0319.002; Tue, 10 Apr 2018 08:57:09 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oe-selftest: runqemu: add tests for qemu
	boot and shutdown
Thread-Index: AQHT0AAA69rWynOjOk6YWeUh9FRdC6P5LZIA
Date: Tue, 10 Apr 2018 00:57:09 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335E017FA@PGSMSX109.gar.corp.intel.com>
References: <1523244763-108834-1-git-send-email-ee.peng.yeoh@intel.com>
	<12143047-5587-0874-4cdf-6989cab74b27@linux.intel.com>
In-Reply-To: <12143047-5587-0874-4cdf-6989cab74b27@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGZhZDJlYWEtYmMzNi00MDE3LTlhMzQtYTE0NTFiYjA2MGQ4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6Ijd4TzJ4bWFuV0VzNmxBVkVZTEdYc2QxRnBuMFkzSTJDcTFGdWN3eHBaYTg9In0=
dlp-product: dlpe-windows
dlp-version: 11.0.200.100
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH] oe-selftest: runqemu: add tests for qemu boot and shutdown
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
X-List-Received-Date: Tue, 10 Apr 2018 00:57:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Tm90ZWQsIHdpbGwgYWRkIGNvbW1lbnQgYW5kIHJlc2VuZCB0aGUgcGF0Y2guIFRoYW5rIHlvdSBm
b3IgeW91ciBpbnB1dHMuIA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gW21haWx0bzphbGV4YW5kZXIua2FuYXZpbkBsaW51eC5pbnRlbC5jb21d
IA0KU2VudDogTW9uZGF5LCBBcHJpbCA5LCAyMDE4IDg6MzQgUE0NClRvOiBZZW9oLCBFZSBQZW5n
IDxlZS5wZW5nLnllb2hAaW50ZWwuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIG9lLXNlbGZ0ZXN0OiBy
dW5xZW11OiBhZGQgdGVzdHMgZm9yIHFlbXUgYm9vdCBhbmQgc2h1dGRvd24NCg0KT24gMDQvMDkv
MjAxOCAwNjozMiBBTSwgWWVvaCBFZSBQZW5nIHdyb3RlOg0KPiBRQSB0ZWFtIHdlcmUgdGVzdGlu
ZyBxZW11IGJvb3QgaW1hZ2UgYW5kIHNodXRkb3duIG9uIGVhY2ggcWVtdSANCj4gYXJjaGl0ZWN0
dXJlIG1hbnVhbGx5LiBBZGQgYXV0b21hdGVkIHRlc3QgdG8gdGVzdCBxZW11IGJvb3Qgb24NCj4g
ZXh0NCBhbmQgbmZzLCBmaW5hbGx5IGNoZWNrIHRoYXQgaXQgY2FuIHNodXRkb3duIHByb3Blcmx5
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWWVvaCBFZSBQZW5nIDxlZS5wZW5nLnllb2hAaW50ZWwu
Y29tPg0KPiAtLS0NCj4gICBtZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL3J1bnFlbXUucHkg
fCA2MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9t
ZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL3J1bnFlbXUucHkgDQo+IGIvbWV0YS9saWIvb2Vx
YS9zZWxmdGVzdC9jYXNlcy9ydW5xZW11LnB5DQo+IGluZGV4IDQ3ZDQxZjUuLjcyODhhYjIgMTAw
NjQ0DQo+IC0tLSBhL21ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvcnVucWVtdS5weQ0KPiAr
KysgYi9tZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL3J1bnFlbXUucHkNCj4gQEAgLTMsOSAr
MywxMCBAQA0KPiAgICMNCj4gICANCj4gICBpbXBvcnQgcmUNCj4gLQ0KPiAraW1wb3J0IHRlbXBm
aWxlDQo+ICtpbXBvcnQgdGltZQ0KPiAgIGZyb20gb2VxYS5zZWxmdGVzdC5jYXNlIGltcG9ydCBP
RVNlbGZ0ZXN0VGVzdENhc2UgLWZyb20gDQo+IG9lcWEudXRpbHMuY29tbWFuZHMgaW1wb3J0IGJp
dGJha2UsIHJ1bnFlbXUsIGdldF9iYl92YXINCj4gK2Zyb20gb2VxYS51dGlscy5jb21tYW5kcyBp
bXBvcnQgYml0YmFrZSwgcnVucWVtdSwgZ2V0X2JiX3ZhciwgcnVuQ21kDQo+ICAgZnJvbSBvZXFh
LmNvcmUuZGVjb3JhdG9yLm9laWQgaW1wb3J0IE9FVGVzdElEDQo+ICAgDQo+ICAgY2xhc3MgUnVu
cWVtdVRlc3RzKE9FU2VsZnRlc3RUZXN0Q2FzZSk6DQo+IEBAIC0xMzYsMyArMTM3LDU5IEBAIFNZ
U0xJTlVYX1RJTUVPVVQgPSAiMTAiDQo+ICAgICAgICAgICBjbWQgPSAiJXMgJXMiICUgKHNlbGYu
Y21kX2NvbW1vbiwgcm9vdGZzKQ0KPiAgICAgICAgICAgd2l0aCBydW5xZW11KHNlbGYucmVjaXBl
LCBzc2g9RmFsc2UsIGxhdW5jaF9jbWQ9Y21kKSBhcyBxZW11Og0KPiAgICAgICAgICAgICAgIHNl
bGYuYXNzZXJ0VHJ1ZShxZW11LnJ1bm5lci5sb2dnZWQsICJGYWlsZWQ6ICVzIiAlIGNtZCkNCj4g
Kw0KPiArY2xhc3MgUWVtdVRlc3QoT0VTZWxmdGVzdFRlc3RDYXNlKToNCg0KUGxlYXNlIGFkZCBj
b21tZW50cyB0aGF0IGV4cGxhaW4gdGhlIG5lZWQgZm9yIGEgc2VwYXJhdGUgY2xhc3MsIHdoYXQg
dGhlIHR3byBjbGFzc2VzIGRvIGFuZCBob3cgdGhleSBkaWZmZXIuDQoNCg0KQWxleA0K

