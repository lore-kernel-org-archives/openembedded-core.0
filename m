Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DF26D79C56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 10:53:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Oct 2018 03:53:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,412,1534834800"; d="scan'208";a="83142117"
Received: from pgsmsx104.gar.corp.intel.com ([10.221.44.91])
	by orsmga007.jf.intel.com with ESMTP; 22 Oct 2018 03:53:02 -0700
Received: from kmsmsx155.gar.corp.intel.com ([169.254.15.235]) by
	PGSMSX104.gar.corp.intel.com ([169.254.3.70]) with mapi id
	14.03.0319.002; Mon, 22 Oct 2018 18:53:01 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/4] oeqa/core/runner: write testresult to
	json files
Thread-Index: AQHUaeqOsKCtwvD43EmzBN90b9Ok06UrFjog
Date: Mon, 22 Oct 2018 10:53:00 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D04335ECDFA5@KMSMSX155.gar.corp.intel.com>
References: <1540191264-12332-1-git-send-email-ee.peng.yeoh@intel.com>
	<a12cf13bca36f6573be192ada5bbf60dbaa4b902.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D04335ECDDF9@KMSMSX155.gar.corp.intel.com>
	<ef9026ca2498e333392215eb630e153908c1cedb.camel@linuxfoundation.org>
In-Reply-To: <ef9026ca2498e333392215eb630e153908c1cedb.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZGFkMjAxNDUtNGVhYy00MmJiLTlhZjMtOTc1NThiZWFlMWZjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWXJjZERkUXFVc1JUUEJWVXNCSG53UmRhK0R1ZktxWmtWU3UzeE9adk5GZXQyaWNURThEUTdMaHF5TVhuMXRqQiJ9
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
X-List-Received-Date: Mon, 22 Oct 2018 10:53:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KSSBoYWQgcmVmYWN0b3IgYW5kIGluY29ycG9yYXRlIHRoZSBpbnB1dHMg
eW91ciBwcm92aWRlZCwgc3VibWl0dGVkIHRoZSBwYXRjaGVzIGZvciB5b3VyIHJldmlldy4NClRo
YW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgYXR0ZW50aW9uIGFuZCBzaGFyaW5nIQ0KDQpodHRw
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBlcm1haWwvb3BlbmVtYmVkZGVkLWNvcmUvMjAx
OC1PY3RvYmVyLzE1Njk0NS5odG1sDQpodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBl
cm1haWwvb3BlbmVtYmVkZGVkLWNvcmUvMjAxOC1PY3RvYmVyLzE1Njk0Ni5odG1sDQpodHRwOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBlcm1haWwvb3BlbmVtYmVkZGVkLWNvcmUvMjAxOC1P
Y3RvYmVyLzE1Njk0Ny5odG1sDQpodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9waXBlcm1h
aWwvb3BlbmVtYmVkZGVkLWNvcmUvMjAxOC1PY3RvYmVyLzE1Njk0OC5odG1sDQoNClRoYW5rcywN
Clllb2ggRWUgUGVuZyANCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnXSANClNlbnQ6IE1vbmRheSwgT2N0b2JlciAyMiwgMjAxOCA1OjM0IFBN
DQpUbzogWWVvaCwgRWUgUGVuZyA8ZWUucGVuZy55ZW9oQGludGVsLmNvbT47IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BB
VENIIDEvNF0gb2VxYS9jb3JlL3J1bm5lcjogd3JpdGUgdGVzdHJlc3VsdCB0byBqc29uIGZpbGVz
DQoNCk9uIE1vbiwgMjAxOC0xMC0yMiBhdCAwODo1OSArMDAwMCwgWWVvaCwgRWUgUGVuZyB3cm90
ZToNCj4gSGkgUmljaGFyZA0KPiANCj4gQ3VycmVudCBjb2RlcyBkb2VzIGxvYWQgZXhpc3Rpbmcg
dGVzdHJlc3VsdCBqc29uIGZpbGUgaWYgaXQgZXhpc3QsIA0KPiB0aGVuIGl0IHdpbGwgd3JpdGUg
dGhlIG5ldyB0ZXN0cmVzdWx0IGludG8gaXQgYmFzZWQgb24gdGhlIHJlc3VsdF9pZC4NCj4gPiAr
ICAgIGRlZiBfZ2V0X3Rlc3RyZXN1bHRzKHNlbGYsIHdyaXRlX2Rpcik6DQo+ID4gKyAgICAgICAg
dGVzdHJlc3VsdHMgPSB7fQ0KPiA+ICsgICAgICAgIGZpbGUgPSBvcy5wYXRoLmpvaW4od3JpdGVf
ZGlyLCBzZWxmLnRlc3RyZXN1bHRfZmlsZW5hbWUpDQo+ID4gKyAgICAgICAgaWYgb3MucGF0aC5l
eGlzdHMoZmlsZSk6DQo+ID4gKyAgICAgICAgICAgIHdpdGggb3BlbihmaWxlLCAiciIpIGFzIGY6
DQo+ID4gKyAgICAgICAgICAgICAgICB0ZXN0cmVzdWx0cyA9IGpzb24ubG9hZChmKQ0KPiA+ICsg
ICAgICAgIHJldHVybiB0ZXN0cmVzdWx0cw0KDQpJIG1hbmFnZWQgdG8gbWlzcyB0aGF0IGZ1bmN0
aW9uIGFuZCBjYWxsLCBzb3JyeS4gVGhhdCBzaG91bGQgYmUgZmluZS4gSSB0aGluayB3ZSBtYXkg
d2FudCB0byBpbmxpbmUgc29tZSBvZiB0aGVzZSBmdW5jdGlvbnMgdG8gbWFrZSB0aGluZ3MgY2xl
YXJlci4NCg0KPiBJIGRpZCBoYXZlIHRoZSBzYW1lIHRoaW5raW5nIG9uIGlmIHdlIGNhbiBoYXZl
IGEgY29tbW9uIGZ1bmN0aW9uIHRvIA0KPiBtYW5hZ2UgY29uZmlndXJhdGlvbiBhbmQgcmVzdWx0
X2lkIG9yIGxldCBpbmRpdmlkdWFsIHRlc3QgY2xhc3NlcyB0byANCj4gbWFuYWdlIGl0LCBpbiB0
aGUgZW5kLCB0aGUgdGhpbmtpbmcgd2FzIGNvbmZpZ3VyYXRpb24vcmVzdWx0X2lkIHdlcmUgDQo+
IHJlYWxseSByZXNwb25zaWJpbGl0eSBvZiBlYWNoIHRlc3QgY2xhc3Nlcywgd2hlcmUgdGhlIGpz
b24gaGVscGVyIA0KPiBjbGFzcyBpbnNpZGUgcnVubmVyIHNoYWxsIG5vdCBoYXZlIHRoZSBrbm93
bGVkZ2Ugb3Iga25vdy1ob3cgb24gDQo+IGNvbmZpZ3VyYXRpb24vcmVzdWx0X2lkLiBUaHVzIHRo
ZSBkZWNpc2lvbiBpbiB0aGUgZW5kIHdhcyB0byBtYWtlIGpzb24gDQo+IGhlbHBlciBjbGFzcyBy
ZXNwb25zaWJpbGl0eSBhcyBzaW1wbGUgYXMgdG8gY29uc3VtZSB0aGUgY29uZmlndXJhdGlvbiwg
DQo+IHJlc3VsdHMsIHJlc3VsdF9pZCBpbmZvcm1hdGlvbiBwcm92aWRlZCBieSB0aGUgdGVzdCBj
bGFzc2VzLiBIb3BlIHRoaXMgDQo+IGV4cGxhaW4gdGhlIHJlYXNvbiBiZWhpbmQgY3VycmVudCBk
ZXNpZ24uDQo+IA0KPiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIGF0dGVudGlvbiAmIGtu
b3dsZWRnZSBzaGFyaW5nISANCg0KWW91IGNvdWxkIGp1c3QgZG8gd2hhdCBhbW91bnRzIHRvIGdl
dFZhcigiTE9HRElSIikgKyAiL29lcWEiIGFuZCBoYXZlIHRoYXQgYXMgdGhlIGRlZmF1bHQgdGVz
dCByZXN1bHQgbG9jYXRpb24/DQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQoNCg0K

