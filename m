Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id F1EBB605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 09:47:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Oct 2018 02:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,411,1534834800"; d="scan'208";a="80600184"
Received: from pgsmsx102.gar.corp.intel.com ([10.221.44.80])
	by fmsmga008.fm.intel.com with ESMTP; 22 Oct 2018 02:47:24 -0700
Received: from kmsmsx155.gar.corp.intel.com ([169.254.15.235]) by
	PGSMSX102.gar.corp.intel.com ([169.254.6.129]) with mapi id
	14.03.0319.002; Mon, 22 Oct 2018 17:47:23 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/4] oeqa/core/runner: write testresult to
	json files
Thread-Index: AQHUaeqOsKCtwvD43EmzBN90b9Ok06UrAykQ
Date: Mon, 22 Oct 2018 09:47:22 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335ECDF22@KMSMSX155.gar.corp.intel.com>
References: <1540191264-12332-1-git-send-email-ee.peng.yeoh@intel.com>
	<a12cf13bca36f6573be192ada5bbf60dbaa4b902.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D04335ECDDF9@KMSMSX155.gar.corp.intel.com>
	<ef9026ca2498e333392215eb630e153908c1cedb.camel@linuxfoundation.org>
In-Reply-To: <ef9026ca2498e333392215eb630e153908c1cedb.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDhmYWYxNmYtZWE0Yi00NWQ1LWJjZWUtZWEyNTM4ODlhOWU5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUzh1WTAydTlaR2JEQzdqTkxSTTJ5TDlTUk9idU9KZ1JyU3pHcEZtWmFPa0hWWWxoT2hpYmc0QWtXdDA1dGppVSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] oeqa/core/runner: write testresult to json files
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
X-List-Received-Date: Mon, 22 Oct 2018 09:47:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KWW91IGFyZSByaWdodCwgdGhlIGN1cnJlbnQgY29kZXMgYW5kIGZ1bmN0
aW9ucyBkb2VzIG5vdCBleHByZXNzIGNsZWFybHkgd2hhdCBpdCBkb2VzLCBlc3BlY2lhbGx5IG9u
IGdldHRpbmcgZXhpc3RpbmcgdGVzdHJlc3VsdCwgbGV0IG1lIHJlZmFjdG9yIHRoaXMgdG8gbWFr
ZSBpdCBjbGVhcmVyLiANCg0KWWVzLCBsZXQgbWUgdXNlIGdldFZhcigiTE9HRElSIikgKyAiL29l
cWEiIGFzIGRlZmF1bHQgcmVzdWx0X2Rpci4gRG8geW91IHRoaW5rIHdlIHNoYWxsIGhhdmUgT0VR
QV9KU09OX1JFU1VMVF9ESVIgdmFyaWFibGUgZm9yIHVzZXIgdG8gZGVmaW5lIGN1c3RvbSByZXN1
bHRfZGlyPyANCg0KVGhhbmtzLA0KWWVvaCBFZSBQZW5nIA0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZyBbbWFpbHRv
OnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddIA0KU2VudDogTW9uZGF5LCBPY3Rv
YmVyIDIyLCAyMDE4IDU6MzQgUE0NClRvOiBZZW9oLCBFZSBQZW5nIDxlZS5wZW5nLnllb2hAaW50
ZWwuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVj
dDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS80XSBvZXFhL2NvcmUvcnVubmVyOiB3cml0ZSB0ZXN0
cmVzdWx0IHRvIGpzb24gZmlsZXMNCg0KT24gTW9uLCAyMDE4LTEwLTIyIGF0IDA4OjU5ICswMDAw
LCBZZW9oLCBFZSBQZW5nIHdyb3RlOg0KPiBIaSBSaWNoYXJkDQo+IA0KPiBDdXJyZW50IGNvZGVz
IGRvZXMgbG9hZCBleGlzdGluZyB0ZXN0cmVzdWx0IGpzb24gZmlsZSBpZiBpdCBleGlzdCwgDQo+
IHRoZW4gaXQgd2lsbCB3cml0ZSB0aGUgbmV3IHRlc3RyZXN1bHQgaW50byBpdCBiYXNlZCBvbiB0
aGUgcmVzdWx0X2lkLg0KPiA+ICsgICAgZGVmIF9nZXRfdGVzdHJlc3VsdHMoc2VsZiwgd3JpdGVf
ZGlyKToNCj4gPiArICAgICAgICB0ZXN0cmVzdWx0cyA9IHt9DQo+ID4gKyAgICAgICAgZmlsZSA9
IG9zLnBhdGguam9pbih3cml0ZV9kaXIsIHNlbGYudGVzdHJlc3VsdF9maWxlbmFtZSkNCj4gPiAr
ICAgICAgICBpZiBvcy5wYXRoLmV4aXN0cyhmaWxlKToNCj4gPiArICAgICAgICAgICAgd2l0aCBv
cGVuKGZpbGUsICJyIikgYXMgZjoNCj4gPiArICAgICAgICAgICAgICAgIHRlc3RyZXN1bHRzID0g
anNvbi5sb2FkKGYpDQo+ID4gKyAgICAgICAgcmV0dXJuIHRlc3RyZXN1bHRzDQoNCkkgbWFuYWdl
ZCB0byBtaXNzIHRoYXQgZnVuY3Rpb24gYW5kIGNhbGwsIHNvcnJ5LiBUaGF0IHNob3VsZCBiZSBm
aW5lLiBJIHRoaW5rIHdlIG1heSB3YW50IHRvIGlubGluZSBzb21lIG9mIHRoZXNlIGZ1bmN0aW9u
cyB0byBtYWtlIHRoaW5ncyBjbGVhcmVyLg0KDQo+IEkgZGlkIGhhdmUgdGhlIHNhbWUgdGhpbmtp
bmcgb24gaWYgd2UgY2FuIGhhdmUgYSBjb21tb24gZnVuY3Rpb24gdG8gDQo+IG1hbmFnZSBjb25m
aWd1cmF0aW9uIGFuZCByZXN1bHRfaWQgb3IgbGV0IGluZGl2aWR1YWwgdGVzdCBjbGFzc2VzIHRv
IA0KPiBtYW5hZ2UgaXQsIGluIHRoZSBlbmQsIHRoZSB0aGlua2luZyB3YXMgY29uZmlndXJhdGlv
bi9yZXN1bHRfaWQgd2VyZSANCj4gcmVhbGx5IHJlc3BvbnNpYmlsaXR5IG9mIGVhY2ggdGVzdCBj
bGFzc2VzLCB3aGVyZSB0aGUganNvbiBoZWxwZXIgDQo+IGNsYXNzIGluc2lkZSBydW5uZXIgc2hh
bGwgbm90IGhhdmUgdGhlIGtub3dsZWRnZSBvciBrbm93LWhvdyBvbiANCj4gY29uZmlndXJhdGlv
bi9yZXN1bHRfaWQuIFRodXMgdGhlIGRlY2lzaW9uIGluIHRoZSBlbmQgd2FzIHRvIG1ha2UganNv
biANCj4gaGVscGVyIGNsYXNzIHJlc3BvbnNpYmlsaXR5IGFzIHNpbXBsZSBhcyB0byBjb25zdW1l
IHRoZSBjb25maWd1cmF0aW9uLCANCj4gcmVzdWx0cywgcmVzdWx0X2lkIGluZm9ybWF0aW9uIHBy
b3ZpZGVkIGJ5IHRoZSB0ZXN0IGNsYXNzZXMuIEhvcGUgdGhpcyANCj4gZXhwbGFpbiB0aGUgcmVh
c29uIGJlaGluZCBjdXJyZW50IGRlc2lnbi4NCj4gDQo+IFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9y
IHlvdXIgYXR0ZW50aW9uICYga25vd2xlZGdlIHNoYXJpbmchIA0KDQpZb3UgY291bGQganVzdCBk
byB3aGF0IGFtb3VudHMgdG8gZ2V0VmFyKCJMT0dESVIiKSArICIvb2VxYSIgYW5kIGhhdmUgdGhh
dCBhcyB0aGUgZGVmYXVsdCB0ZXN0IHJlc3VsdCBsb2NhdGlvbj8NCg0KQ2hlZXJzLA0KDQpSaWNo
YXJkDQoNCg0KDQo=

