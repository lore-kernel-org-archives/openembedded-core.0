Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B8018744AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 10:01:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2018 03:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,431,1517904000"; d="scan'208";a="46618324"
Received: from kmsmsx153.gar.corp.intel.com ([172.21.73.88])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2018 03:01:55 -0700
Received: from pgsmsx109.gar.corp.intel.com ([169.254.14.25]) by
	KMSMSX153.gar.corp.intel.com ([169.254.5.5]) with mapi id
	14.03.0319.002; Tue, 10 Apr 2018 18:01:55 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oe-selftest: runqemu: add tests for qemu
	boot and shutdown
Thread-Index: AQHT0LAJ69rWynOjOk6YWeUh9FRdC6P5wMmA
Date: Tue, 10 Apr 2018 10:01:54 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335E01AA0@PGSMSX109.gar.corp.intel.com>
References: <1523295825-118054-1-git-send-email-ee.peng.yeoh@intel.com>
	<1523353262.2942.143.camel@linuxfoundation.org>
In-Reply-To: <1523353262.2942.143.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZWYyN2UxMDgtZjljOS00ZGEzLWIyZGQtN2MwNWYwOTU2ZTAwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE2LjUuOS4zIiwiVHJ1c3RlZExhYmVsSGFzaCI6IktjVysrXC9VK2NBSXN5NTZhXC84dVdCclRPOWV1UFVvMUVicndCVFVQVW1SUT0ifQ==
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
X-List-Received-Date: Tue, 10 Apr 2018 10:01:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KWWVzLCB3ZSBhcmUgdGVzdGluZyBhbiBhbHRlcm5hdGl2ZSB3YXkgdG8g
c3RvcCBxZW11IGhlcmUuIEZyb20gbXkgdW5kZXJzdGFuZCwgdGhlIGV4aXN0aW5nIHRlc3RjYXNl
cyBzdG9wIHFlbXUgdGhyb3VnaCBraWxsaW5nIHRoZSBxZW11IHByb2Nlc3MuIFdoaWxlIHRoaXMg
dGVzdGNhc2Ugd2FzIHRlc3RpbmcgdGhhdCBhZnRlciBleGVjdXRpbmcgdGhlIHNodXRkb3duIGNv
bW1hbmQgaW5zaWRlIHFlbXUsIHFlbXUgd2lsbCBzdG9wIGFzIGV4cGVjdGVkLiANCg0KQ3VycmVu
dGx5LCBRQSB0ZWFtIHdhcyBtYW51YWxseSB0ZXN0aW5nIHRoZSBleGVjdXRpb24gb2Ygc2h1dGRv
d24gY29tbWFuZCBvbiB2YXJpb3VzIHFlbXUgYXJjaGl0ZWN0dXJlLiBUaGUgdGVhbSBoYWQgZm91
bmQgYW4gc2h1dGRvd24gaHVuZyBpc3N1ZSBvbiBxZW11YXJtLiAgDQpodHRwczovL2J1Z3ppbGxh
LnlvY3RvcHJvamVjdC5vcmcvc2hvd19idWcuY2dpP2lkPTEyNDk5DQoNCkhvcGUgdGhpcyBleHBs
YWluIHRoZSBpbnRlbnRpb24gb2YgdGhpcyB0ZXN0Y2FzZS4gUGxlYXNlIGxldCBtZSB5b3Ugb3Bp
bmlvbiBhbmQgaW5wdXQuIA0KDQpUaGFua3MsDQpZZW9oIEVlIFBlbmcgDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVy
ZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddIA0KU2VudDogVHVlc2RheSwgQXByaWwgMTAsIDIwMTgg
NTo0MSBQTQ0KVG86IFllb2gsIEVlIFBlbmcgPGVlLnBlbmcueWVvaEBpbnRlbC5jb20+OyBvcGVu
ZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQQVRDSF0gb2Utc2VsZnRlc3Q6IHJ1bnFlbXU6IGFkZCB0ZXN0cyBmb3IgcWVtdSBib290
IGFuZCBzaHV0ZG93bg0KDQpPbiBNb24sIDIwMTgtMDQtMDkgYXQgMTA6NDMgLTA3MDAsIFllb2gg
RWUgUGVuZyB3cm90ZToNCj4gUUEgdGVhbSB3ZXJlIHRlc3RpbmcgcWVtdSBib290IGltYWdlIGFu
ZCBzaHV0ZG93biBvbiBlYWNoIHFlbXUgDQo+IGFyY2hpdGVjdHVyZSBtYW51YWxseS4gQWRkIGF1
dG9tYXRlZCB0ZXN0IHRvIHRlc3QgcWVtdSBib290IG9uDQo+IGV4dDQgYW5kIG5mcywgZmluYWxs
eSBjaGVjayB0aGF0IGl0IGNhbiBzaHV0ZG93biBwcm9wZXJseS4NCj4gDQo+IE9yaWdpbmFsIHJ1
bnFlbXUgdGVzdHMgd2FzIGRlZGljYXRlZCBmb3IgTUFDSElORT1xZW11eDg2LTY0IGFuZCBpdCB3
YXMgDQo+IHRlc3RpbmcgdmFyaW91cyBsaXZlIGltYWdlIChpc28gYW5kIGhkZGltZykgd2lsbCBi
ZSBhYmxlIHRvIGJvb3Qgd2hpbGUgDQo+IGxpdmUgaW1hZ2Ugd2FzIG5vdCBzdXBwb3J0ZWQgb24g
YWxsIHFlbXUgYXJjaGl0ZWN0dXJlLg0KPiANCj4gVGhlIG5ldyB0ZXN0cyB3ZXJlIGRlc2lnbmVk
IGFzIGEgc2VwYXJhdGUgY2xhc3MgYXMgdGhpcyB0ZXN0cyBmb2N1cyBvbiANCj4gdGVzdGluZyBx
ZW11IGJvb3QgYW5kIHNodXRkb3duIG9uIGVhY2ggcWVtdSBhcmNoaXRlY3R1cmUuDQo+IEZ1cnRo
ZXJtb3JlLCB0aGlzIHRlc3RzIGZvY3VzIG9uIHRlc3RpbmcgcWVtdSBjb3VsZCBzaHV0ZG93biBh
cyANCj4gZXhwZWN0ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZZW9oIEVlIFBlbmcgPGVlLnBl
bmcueWVvaEBpbnRlbC5jb20+DQoNCkkgZG8gaGF2ZSBvbmUgb3RoZXIgcXVlc3Rpb24gYWJvdXQg
dGhpcy4gVGhlcmUgYXJlIHZhcmlvdXMgb3RoZXIgdGVzdHMgd2hpY2ggYm9vdCBxZW11IGltYWdl
cy4gV291bGQgd2UgYmUgYWJsZSB0byBhc3N1bWUgdGhhdCBiZWNhdXNlIHRob3NlIHRlc3RzIHdv
cmssIHRoZSBzdGFydC9zdG9wIG9mIHFlbXUgaXMgd29ya2luZz8gT3IgaXMgdGhlcmUgYSB1bmlx
dWUgZWxlbWVudCB3ZSBuZWVkIHRvIHRlc3Qgc3BlY2lmaWNhbGx5IGhlcmU/DQoNCkNoZWVycywN
Cg0KUmljaGFyZA0K

