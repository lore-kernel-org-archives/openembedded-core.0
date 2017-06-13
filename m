Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 21D4C72F67
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 12:32:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2017 05:32:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="1159891336"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2017 05:32:33 -0700
Received: from irsmsx156.ger.corp.intel.com (10.108.20.68) by
	IRSMSX153.ger.corp.intel.com (163.33.192.75) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Tue, 13 Jun 2017 13:32:32 +0100
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.126]) by
	IRSMSX156.ger.corp.intel.com ([169.254.3.48]) with mapi id
	14.03.0319.002; Tue, 13 Jun 2017 13:32:33 +0100
From: "Valluri, Amarnath" <amarnath.valluri@intel.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 7/8] image: create symlinks needed for
	merged /usr
Thread-Index: AQHS5EEgCgiSA4/5D0CE/NnR70Kt6g==
Date: Tue, 13 Jun 2017 12:32:31 +0000
Message-ID: <1497357195.39827.12.camel@intel.com>
References: <1497336760-36835-1-git-send-email-amarnath.valluri@intel.com>
	<1497336760-36835-8-git-send-email-amarnath.valluri@intel.com>
	<5b5d7bf2edde4d1a9bcffe8c9e6c6644@XBOX02.axis.com>
In-Reply-To: <5b5d7bf2edde4d1a9bcffe8c9e6c6644@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.170]
MIME-Version: 1.0
Subject: Re: [PATCH v3 7/8] image: create symlinks needed for merged /usr
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
X-List-Received-Date: Tue, 13 Jun 2017 12:32:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <49BAF4318169C44C99F75ECA3EFA8E71@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE3LTA2LTEzIGF0IDA4OjA1ICswMDAwLCBQZXRlciBLamVsbGVyc3RlZHQgd3Jv
dGU6DQo+ID4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBvcGVu
ZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBbbWFpbHRv
Om9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVo
YWxmDQo+ID4gT2YNCj4gPiBBbWFybmF0aCBWYWxsdXJpDQo+ID4gU2VudDogZGVuIDEzIGp1bmkg
MjAxNyAwODo1Mw0KPiA+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+ID4gU3ViamVjdDogW09FLWNvcmVdIFtQQVRDSCB2MyA3LzhdIGltYWdlOiBjcmVhdGUg
c3ltbGlua3MgbmVlZGVkIGZvcg0KPiA+IG1lcmdlZCAvdXNyDQo+ID4gDQo+ID4gUHJlcGFyZSB0
aGUgc3ltbGlua3MgcmVxdWlyZWQgZm9yIG1lcmdlZCAvdXNyIGF0IHRoZSB0aW1lIG9mIHJvb3Rm
cw0KPiA+IGNyZWF0aW9uLg0KPiA+IA0KPiA+IFRoZSBsaW5rcyBjcmVhdGVkIGluIHJvb3RmcyBh
cmU6DQo+ID4gL2JpbiAtLT4gL3Vzci9zYmluDQo+ID4gL3NiaW4gLS0+IC91c3Ivc2Jpbg0KPiA+
IC9saWIgLS0+IC91c3IvbGliDQo+ID4gL2xpYjY0IC0tPiAvdXNyL2xpYjY0DQo+ID4gDQo+ID4g
V2UgY2Fubm90IG1ha2UgdGhlc2Ugc3ltbGlua3MgYXMgcGFydCBvZiAnYmFzZS1maWxlcycgb3Ig
c29tZSBvdGhlcg0KPiA+IHBhY2thZ2UuDQo+ID4gQmVjYXVzZSBhdCByb290ZnMgY3JlYXRpb24s
IGluc3RhbGxhdGlvbiBvZiB0aGUgcGFja2FnZShzYXkga2VybmVsKQ0KPiA+IHRoYXQgZGVwZW5k
cw0KPiA+IG9uIHRoZXNlIHJvb3QgZm9sZGVycy9saW5rcyBmYWlscywgaWYgcGFja2FnZSBtYW5h
Z2VyIGluc3RhbGxzIHRoaXMNCj4gPiBwYWNrYWdlDQo+ID4gcHJpb3IgdG8gYmFzZS1maWxlcy4N
Cj4gPiANCj4gPiBUaGVzZSBzeW1ib2xpYyBsaW5rcyBpbiB0b3AgbGV2ZWwgZm9sZGVyIHNob3Vs
ZCBwcmVzZW50IGFzIGxvbmcgYXMNCj4gQ2hhbmdlICJzaG91bGQiIHRvICJzaG91bGQgYmUiLg0K
PiANCj4gPiANCj4gPiDCoC0ga2VyZW5sIHRvb2xzIHVzZSAvbGliL3ttb2R1bGUsZmlybXdhcmV9
DQo+IENoYW5nZSAia2VyZW5sIiB0byAia2VybmVsIi4NCj4gDQo+ID4gDQo+ID4gwqAtIHNoZWxs
IHNjcmlwdHMgdXNlcyAiIyEvYmluL3NoIg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEFtYXJu
YXRoIFZhbGx1cmkgPGFtYXJuYXRoLnZhbGx1cmlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+IMKg
bWV0YS9jbGFzc2VzL2ltYWdlLmJiY2xhc3MgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKw0K
PiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvbWV0YS9jbGFzc2VzL2ltYWdlLmJiY2xhc3MNCj4gPiBiL21ldGEvY2xhc3Nlcy9pbWFn
ZS5iYmNsYXNzDQo+ID4gaW5kZXggODVmNmI5YS4uZjA4ZTNlMSAxMDA2NDQNCj4gPiAtLS0gYS9t
ZXRhL2NsYXNzZXMvaW1hZ2UuYmJjbGFzcw0KPiA+ICsrKyBiL21ldGEvY2xhc3Nlcy9pbWFnZS5i
YmNsYXNzDQo+ID4gQEAgLTYxNywzICs2MTcsMjYgQEAgZG9fYnVuZGxlX2luaXRyYW1mcyAoKSB7
DQo+ID4gwqAJOg0KPiA+IMKgfQ0KPiA+IMKgYWRkdGFzayBidW5kbGVfaW5pdHJhbWZzIGFmdGVy
IGRvX2ltYWdlX2NvbXBsZXRlDQo+ID4gKw0KPiA+ICsjIFByZXBhcmUgdGhlIHJvb3QgbGlua3Mg
dG8gcG9pbnQgdG8gdGhlIC91c3IgY291bnRlcnBhcnRzLg0KPiBJbiB0aGUgZnVuY3Rpb24gYmVs
b3c6DQo+ICogWW91IGRvIG5vdCBuZWVkIHRvIHNwZWNpZnkgLW0gMDc1NSB0byBpbnN0YWxsLCBp
dCBpcyB0aGUgZGVmYXVsdC4NCj4gKiBDaGFuZ2UgYWxsICIvJHt2YXJ9IiB0byAiJHt2YXJ9Ii4N
Cj4gDQo+ID4gDQo+ID4gK2NyZWF0ZV9tZXJnZWRfdXNyX3N5bWxpbmtzKCkgew0KPiA+ICvCoMKg
wqDCoGluc3RhbGwgLW0gMDc1NSAtZCAke0lNQUdFX1JPT1RGU30vJHtiYXNlX2JpbmRpcn0NCj4g
PiArwqDCoMKgwqBpbnN0YWxsIC1tIDA3NTUgLWQgJHtJTUFHRV9ST09URlN9LyR7YmFzZV9zYmlu
ZGlyfQ0KPiA+ICvCoMKgwqDCoGluc3RhbGwgLW0gMDc1NSAtZCAke0lNQUdFX1JPT1RGU30vJHti
YXNlX2xpYmRpcn0NCj4gWW91IGNhbiBjb21iaW5lIHRoZXNlIHRocmVlIGluc3RhbGxzIGludG8g
b25lLiBTYXZlcyB0d28gZm9ya3MuDQo+IA0KPiA+IA0KPiA+ICvCoMKgwqDCoGxuciAke0lNQUdF
X1JPT1RGU30ke2Jhc2VfYmluZGlyfSAke0lNQUdFX1JPT1RGU30vYmluDQo+ID4gK8KgwqDCoMKg
bG5yICR7SU1BR0VfUk9PVEZTfSR7YmFzZV9zYmluZGlyfSAke0lNQUdFX1JPT1RGU30vc2Jpbg0K
PiA+ICvCoMKgwqDCoGxuciAke0lNQUdFX1JPT1RGU30ke2Jhc2VfbGliZGlyfSAke0lNQUdFX1JP
T1RGU30vJHtiYXNlbGlifQ0KPiA+ICsNCj4gPiArwqDCoMKgwqBpZiBbICIke25vbmFyY2hfYmFz
ZV9saWJkaXJ9IiAhPSAiJHtiYXNlX2xpYmRpcn0iIF07IHRoZW4NCj4gV2h5IGRvIHlvdSBjaGVj
ayAiJHtub25hcmNoX2Jhc2VfbGliZGlyfSIgIT0gIiR7YmFzZV9saWJkaXJ9IiB3aGVuDQo+IHlv
dcKgZG8gbm90IGNoZWNrIHRoZSBvdGhlciB0aHJlZSBhYm92ZT8NCk91ciBpbnRlbnRpb24gaGVy
ZSBpcyB0byBjcmVhdGUgL2xpYiAtPiAke25vYXJjaF9iYXNlX2xpYmRpcn0uIFRoaXMNCm1pZ2h0
IGFscmVhZHkgYmVlbiBjcmF0ZWQgaW4gdGhlIHByZXZpb3VzIGNhbGwgOsKgDQrCoCDCoCBsbnIg
JHtJTUFHRV9ST09URlN9JHtiYXNlX2xpYmRpcn0gJHtJTUFHRV9ST09URlN9LyR7YmFzZWxpYn0N
Cg0KYmVjYXVzZSwgZm9yIG5vbi1tdWx0aWxpYiBidWlsZHMgYm90aCAke25vbmFyY2hfYmFzZV9s
aWJkaXJ9IGFuZA0KJHtiYXNlX2xpYmRpcn0gcG9pbnRzIHRvICR7ZXhlY19wcmVmaXh9L2xpYi4N
Cg0KVGhlIGNvbmRpdGlvbiBjYW4gYmUgcmVwaHJhc2VkIHRvOg0KwqAgwqBpZiBbICIke2Jhc2Vs
aWJ9IiAhPSAibGliIiBdDQoNClRoaXMgY2FzZSBkb2VzIG5vdCBhcHBseSBmb3Igb3RoZXIgdHdv
IGxpbmtzLiwgaWUuLCAvYmluLCAvc2Jpbi4NCg0KLSBBbWFybmF0aA==

