Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 868787D8FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 18:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id EE79818706;
	Fri, 12 Apr 2019 20:07:43 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 9-5TW46iBjcQ; Fri, 12 Apr 2019 20:07:42 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3DF41186F9;
	Fri, 12 Apr 2019 20:07:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 287471E06E;
	Fri, 12 Apr 2019 20:07:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CC151E054;
	Fri, 12 Apr 2019 20:07:42 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 12 Apr 2019 20:07:42 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 103B92E2D;
	Fri, 12 Apr 2019 20:07:42 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 12 Apr 2019 20:07:41 +0200
Received: from XBOX04.axis.com (10.0.5.18) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Fri, 12 Apr 2019 20:07:41 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Fri, 12 Apr 2019 20:07:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] useradd.bbclass: Make sure users/groups exist
	for package_write_* tasks
Thread-Index: AQHU6ht5rKnZdMrgykStWNHqqyp4A6YsCYBwgAyvxzD///RFgIAAJ3SA
Date: Fri, 12 Apr 2019 18:07:41 +0000
Message-ID: <83cc75ad471d4d93ae89fbcd91afd964@XBOX04.axis.com>
References: <20190403122626.18451-1-pkj@axis.com>
	<866ba68abe94b19205b70f59a512c68ef65b79a1.camel@linuxfoundation.org>
	<4788506b5c7f4fb4a369916b5500c373@XBOX04.axis.com>
	<acc766373fca400587d0d779dd9f2550@XBOX04.axis.com>
	<7e6be2702bcadf7c5e60fec0dcc668a5ffd881f4.camel@linuxfoundation.org>
In-Reply-To: <7e6be2702bcadf7c5e60fec0dcc668a5ffd881f4.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] useradd.bbclass: Make sure users/groups exist for package_write_* tasks
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
X-List-Received-Date: Fri, 12 Apr 2019 18:07:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiByaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnDQo+IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0K
PiBTZW50OiBkZW4gMTIgYXByaWwgMjAxOSAxOTowMw0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0
IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSB1
c2VyYWRkLmJiY2xhc3M6IE1ha2Ugc3VyZSB1c2Vycy9ncm91cHMNCj4gZXhpc3QgZm9yIHBhY2th
Z2Vfd3JpdGVfKiB0YXNrcw0KPiANCj4gT24gRnJpLCAyMDE5LTA0LTEyIGF0IDE1OjUxICswMDAw
LCBQZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+ID4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+ID4gPiA8b3BlbmVtYmVkZGVkLQ0KPiA+ID4gY29yZS1ib3VuY2VzQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBQZXRlcg0KPiA+ID4gS2plbGxlcnN0ZWR0
DQo+ID4gPiBTZW50OiBkZW4gNCBhcHJpbCAyMDE5IDE2OjA4DQo+ID4gPiBUbzogUmljaGFyZCBQ
dXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ow0KPiA+ID4gb3BlbmVt
YmVkZGVkLQ0KPiA+ID4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gdXNlcmFkZC5iYmNsYXNzOiBNYWtlIHN1cmUNCj4gPiA+
IHVzZXJzL2dyb3Vwcw0KPiA+ID4gZXhpc3QgZm9yIHBhY2thZ2Vfd3JpdGVfKiB0YXNrcw0KPiA+
ID4NCj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gRnJvbTogUmlj
aGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4gPiA+
IFNlbnQ6IGRlbiAzIGFwcmlsIDIwMTkgMTQ6NDgNCj4gPiA+ID4gVG86IFBldGVyIEtqZWxsZXJz
dGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPjsNCj4gPiA+ID4gb3BlbmVtYmVkZGVk
LQ0KPiA+ID4gPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiA+ID4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHVzZXJhZGQuYmJjbGFzczogTWFrZSBzdXJlDQo+ID4gPiA+
IHVzZXJzL2dyb3Vwcw0KPiA+ID4gPiBleGlzdCBmb3IgcGFja2FnZV93cml0ZV8qIHRhc2tzDQo+
ID4gPiA+DQo+ID4gPiA+IE9uIFdlZCwgMjAxOS0wNC0wMyBhdCAxNDoyNiArMDIwMCwgUGV0ZXIg
S2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+ID4gPiA+IElmIHRoZSBwb3B1bGF0ZV9saWMgdGFzayBh
bmQgYW55IG9mIHRoZSBwYWNrYWdlX3dyaXRlXyogdGFza3MNCj4gPiA+ID4gPiBuZWVkIHRvDQo+
ID4gPiA+ID4gcnVuLCBidXQgdGhlIHBhY2thZ2UgdGFzayBjYW4gYmUgcmVzdG9yZWQgZnJvbSB0
aGUgc3N0YXRlDQo+ID4gPiA+ID4gY2FjaGUsIHRoZW4NCj4gPiA+ID4gPiB0aGUgZmV0Y2ggdGFz
aywgd2hpY2ggaXMgYSBkZXBlbmRlbmN5IG9mIHBvcHVsYXRlX2xpYywgd2lsbA0KPiA+ID4gPiA+
IHdpcGUgb3V0DQo+ID4gPiA+ID4gdGhlIFJTUyBpbmNsdWRpbmcgYW55IHVzZXJzL2dyb3VwcyB0
aGF0IGhhdmUgYmVlbiBjcmVhdGVkLiBUaGlzDQo+ID4gPiA+ID4gcmVzdWx0cyBpbiB0aGF0IHRo
ZSBwYWNrYWdlX3dyaXRlXyogdGFza3MgYXJlIHJ1biB3aXRob3V0IGFueQ0KPiA+ID4gPiA+IHVz
ZXIvZ3JvdXAgaW5mb3JtYXRpb24sIHdoaWNoIGNhdXNlcyB0aGVtIHRvIGZhbGxiYWNrIHRvIGVp
dGhlcg0KPiA+ID4gPiA+IHVzZQ0KPiA+ID4gPiA+IHRoZSByb290IHVzZXIgZm9yIGFueSB1bmtu
b3duIHVzZXJzL2dyb3VwcyAocnBtKSBvciB0byB1c2UgdGhlDQo+ID4gPiA+ID4gbnVtZXJpYw0K
PiA+ID4gPiA+IFVJRHMvR0lEcyAoZGViL2lwaykuIE5laXRoZXIgc29sdXRpb24gd2lsbCB5aWVs
ZCBjb3JyZWN0DQo+ID4gPiA+ID4gcGFja2FnZXMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNv
bT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiAgbWV0YS9jbGFzc2VzL3VzZXJhZGQuYmJjbGFz
cyB8IDE4ICsrKysrKysrKysrKy0tLS0tLQ0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IGRpZmYg
LS1naXQgYS9tZXRhL2NsYXNzZXMvdXNlcmFkZC5iYmNsYXNzDQo+ID4gPiA+ID4gYi9tZXRhL2Ns
YXNzZXMvdXNlcmFkZC5iYmNsYXNzDQo+ID4gPiA+ID4gaW5kZXggMTI0YmVjZDA4Mi4uZTMyMzE1
YTFhZiAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9tZXRhL2NsYXNzZXMvdXNlcmFkZC5iYmNsYXNz
DQo+ID4gPiA+ID4gKysrIGIvbWV0YS9jbGFzc2VzL3VzZXJhZGQuYmJjbGFzcw0KPiA+ID4gPiA+
IEBAIC00LDcgKzQsNyBAQCBpbmhlcml0IHVzZXJhZGRfYmFzZQ0KPiA+ID4gPiA+ICAjIHRhcmdl
dCBzeXNyb290LCBhbmQgc2hhZG93IC1uYXRpdmUgYW5kIC1zeXNyb290IHByb3ZpZGUgdGhlDQo+
ID4gPiA+ID4gdXRpbGl0aWVzDQo+ID4gPiA+ID4gICMgYW5kIHN1cHBvcnQgZmlsZXMgbmVlZGVk
IHRvIGFkZCBhbmQgbW9kaWZ5IHVzZXIgYW5kIGdyb3VwDQo+ID4gPiA+ID4gYWNjb3VudHMNCj4g
PiA+ID4gPiAgREVQRU5EU19hcHBlbmRfY2xhc3MtdGFyZ2V0ID0gIiBiYXNlLWZpbGVzIHNoYWRv
dy1uYXRpdmUNCj4gPiA+ID4gPiBzaGFkb3ctc3lzcm9vdCBzaGFkb3cgYmFzZS1wYXNzd2QiDQo+
ID4gPiA+ID4gLVBBQ0tBR0VfV1JJVEVfREVQUyArPSAic2hhZG93LW5hdGl2ZSINCj4gPiA+ID4g
PiArUEFDS0FHRV9XUklURV9ERVBTICs9ICJzaGFkb3ctbmF0aXZlIHNoYWRvdy1zeXNyb290IGJh
c2UtDQo+ID4gPiA+ID4gcGFzc3dkIg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gICMgVGhpcyBwcmVp
bnN0YWxsIGZ1bmN0aW9uIGNhbiBiZSBydW4gaW4gZm91ciBkaWZmZXJlbnQNCj4gPiA+ID4gPiBj
b250ZXh0czoNCj4gPiA+ID4gPiAgIw0KPiA+ID4gPiA+IEBAIC0xNDQsNyArMTQ0LDEwIEBAIHB5
dGhvbiB1c2VyYWRkX3N5c3Jvb3Rfc3N0YXRlICgpIHsNCj4gPiA+ID4gPiAgICAgIHRhc2sgPSBk
LmdldFZhcigiQkJfQ1VSUkVOVFRBU0siKQ0KPiA+ID4gPiA+ICAgICAgaWYgdGFzayA9PSAicGFj
a2FnZV9zZXRzY2VuZSI6DQo+ID4gPiA+ID4gICAgICAgICAgYmIuYnVpbGQuZXhlY19mdW5jKCJ1
c2VyYWRkX3N5c3Jvb3QiLCBkKQ0KPiA+ID4gPiA+IC0gICAgZWxpZiB0YXNrID09ICJwcmVwYXJl
X3JlY2lwZV9zeXNyb290IjoNCj4gPiA+ID4gPiArICAgIGVsaWYgKHRhc2sgPT0gInByZXBhcmVf
cmVjaXBlX3N5c3Jvb3QiIG9yDQo+ID4gPiA+ID4gKyAgICAgICAgICB0YXNrID09ICJwYWNrYWdl
X3dyaXRlX2RlYiIgb3INCj4gPiA+ID4gPiArICAgICAgICAgIHRhc2sgPT0gInBhY2thZ2Vfd3Jp
dGVfaXBrIiBvcg0KPiA+ID4gPiA+ICsgICAgICAgICAgdGFzayA9PSAicGFja2FnZV93cml0ZV9y
cG0iKToNCj4gPiA+ID4gPiAgICAgICAgICAjIFVzZWQgdG8gdXBkYXRlIHRoaXMgcmVjaXBlJ3Mg
b3duIHN5c3Jvb3Qgc28gdGhlDQo+ID4gPiA+ID4gdXNlci9ncm91cHMgYXJlIGF2YWlsYWJsZSB0
byBkb19pbnN0YWxsDQo+ID4gPiA+ID4gICAgICAgICAgc2NyaXB0ZmlsZSA9DQo+ID4gPiA+ID4g
ZC5leHBhbmQoIiR7UkVDSVBFX1NZU1JPT1R9JHtiaW5kaXJ9L3Bvc3RpbnN0LXVzZXJhZGQtJHtQ
Tn0iKQ0KPiA+ID4gPiA+ICAgICAgICAgIGJiLmJ1aWxkLmV4ZWNfZnVuYygidXNlcmFkZF9zeXNy
b290IiwgZCkNCj4gPiA+ID4gPiBAQCAtMTYxLDEzICsxNjQsMTYgQEAgcHl0aG9uIHVzZXJhZGRf
c3lzcm9vdF9zc3RhdGUgKCkgew0KPiA+ID4gPiA+ICAgICAgICAgIG9zLmNobW9kKHNjcmlwdGZp
bGUsIDBvNzU1KQ0KPiA+ID4gPiA+ICB9DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAtZG9fcHJlcGFy
ZV9yZWNpcGVfc3lzcm9vdFtwb3N0ZnVuY3NdICs9ICIke1NZU1JPT1RGVU5DfSINCj4gPiA+ID4g
PiAtU1lTUk9PVEZVTkNfY2xhc3MtdGFyZ2V0ID0gInVzZXJhZGRfc3lzcm9vdF9zc3RhdGUiDQo+
ID4gPiA+ID4gIFNZU1JPT1RGVU5DID0gIiINCj4gPiA+ID4gPiArU1lTUk9PVEZVTkNfY2xhc3Mt
dGFyZ2V0ID0gInVzZXJhZGRfc3lzcm9vdF9zc3RhdGUiDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAt
U1lTUk9PVF9QUkVQUk9DRVNTX0ZVTkNTICs9ICIke1NZU1JPT1RGVU5DfSINCj4gPiA+ID4gPiAr
ZG9fcHJlcGFyZV9yZWNpcGVfc3lzcm9vdFtwb3N0ZnVuY3NdICs9ICIke1NZU1JPT1RGVU5DfSIN
Cj4gPiA+ID4gPiArZG9fcGFja2FnZV93cml0ZV9kZWJbcHJlZnVuY3NdICs9ICIke1NZU1JPT1RG
VU5DfSINCj4gPiA+ID4gPiArZG9fcGFja2FnZV93cml0ZV9pcGtbcHJlZnVuY3NdICs9ICIke1NZ
U1JPT1RGVU5DfSINCj4gPiA+ID4gPiArZG9fcGFja2FnZV93cml0ZV9ycG1bcHJlZnVuY3NdICs9
ICIke1NZU1JPT1RGVU5DfSINCj4gPiA+ID4gPg0KPiA+ID4gPiA+IC1TU1RBVEVQUkVJTlNURlVO
Q1NfYXBwZW5kX2NsYXNzLXRhcmdldCA9ICINCj4gPiA+ID4gPiB1c2VyYWRkX3N5c3Jvb3Rfc3N0
YXRlIg0KPiA+ID4gPiA+ICtTWVNST09UX1BSRVBST0NFU1NfRlVOQ1MgKz0gIiR7U1lTUk9PVEZV
TkN9Ig0KPiA+ID4gPiA+ICtTU1RBVEVQUkVJTlNURlVOQ1MgKz0gIiR7U1lTUk9PVEZVTkN9Ig0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gIGRvX3BhY2thZ2Vfc2V0c2NlbmVbZGVwZW5kc10gKz0gIiR7
VVNFUkFERFNFVFNDRU5FREVQU30iDQo+ID4gPiA+ID4gIGRvX3BvcHVsYXRlX3N5c3Jvb3Rfc2V0
c2NlbmVbZGVwZW5kc10gKz0NCj4gPiA+ID4gPiAiJHtVU0VSQUREU0VUU0NFTkVERVBTfSINCj4g
PiA+ID4NCj4gPiA+ID4gVGhpcyBtYXkgYmUgYSBiaWdnZXIgcHJvYmxlbSB0aGF0IGp1c3QgcGFj
a2FnZV93cml0ZV8qLg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIGZlZWxzIGxpa2UgYSBiYWQgdGhp
bmcgdG8gZG8gc2luY2UgdGhlcmUgbWF5IGJlIG90aGVyIHRhc2tzDQo+ID4gPiA+IHdoaWNoDQo+
ID4gPiA+IGFsc28gcmVseSBvbiB0aGUgdXNlciBpbmZvcm1hdGlvbiBiZWluZyBwcmVzZW50LiBU
aGlzIHByb2JhYmx5DQo+ID4gPiA+IG9ubHkNCj4gPiA+ID4gZml4ZXMgb25lIGNvcm5lciBjYXNl
IGJ1dCB0aGVyZSBhcmUgbGlrZXkgb3RoZXJzIDooLg0KPiA+ID4gPg0KPiA+ID4gPiBQb3NzaWJs
ZSBzb2x1dGlvbnMgbWlnaHQgYmU6DQo+ID4gPiA+DQo+ID4gPiA+IGEpIFRvIHdpcGUgb3V0IGFs
bCBzc3RhdGUgdGFza3MgaWYgd2UncmUgcmVydW5uaW5nIGRvX2ZldGNoDQo+ID4gPg0KPiA+ID4g
SG93IHRvIGRvIHRoYXQ/IFdpdGggc29tZSBwb2ludGVycyBJIGhvcGUgSSBjYW4gd2hpcCB1cCBh
IHBhdGNoDQo+ID4gPiB0byBkbyB0aGlzIGluc3RlYWQuDQo+ID4NCj4gPiBJIHdvdWxkIHZlcnkg
bXVjaCBsaWtlIHRvIGhhdmUgYSBzb2x1dGlvbiBmb3IgdGhpcyBpbiBXYXJyaW9yLiBJZg0KPiA+
IHRoZSBzb2x1dGlvbiBwcm92aWRlZCBieSB0aGUgcGF0Y2ggYWJvdmUgaXMgbm90IGFjY2VwdGFi
bGUsIEkgbmVlZA0KPiA+IHNvbWUgaGVscCB3aGVyZSB0byBsb29rIGZvciBob3cgdG8gc29sdmUg
aXQgYnkgd2lwaW5nIG91dCB0aGUNCj4gPiBzc3RhdGUgdGFza3MgaWYgZG9fZmV0Y2ggaXMgYmVp
bmcgcmVydW4uDQo+IA0KPiBXYXJyaW9yIHJjMSBpcyBpbiB0aGUgcHJvY2VzcyBvZiBiZWluZyBi
dWlsdCBzbyBpdHMgbGlrZWx5IHRvbyBsYXRlIGZvcg0KPiB0aGF0Lg0KDQpPaywgbm90aGluZyB0
byBkbyBhYm91dCB0aGF0Lg0KDQo+IEkgYW0gdmVyeSBuZXJ2b3VzIGFib3V0IGNoYW5naW5nIGtl
eSBwaWVjZXMgb2YgdGhlIGNvcmUgb2YgdGhlDQo+IHN5c3RlbSBzbyBjbG9zZSB0byByZWxlYXNl
IHRvbyB3aGljaCBJIGFkbWl0IGlzIHdoeSB0aGlzIGhhc24ndCBiZWVuIGENCj4gdG9wIHByaW9y
aXR5LiBJZiBwZW9wbGUgaGF2ZW4ndCBydW4gaW50byB0aGlzIGFuZCB0aGVyZSBhcmVuJ3QgdGVz
dHMNCj4gZm9yIGl0LCBob3cgYmlnIG9mIGFuIGlzc3VlIHJlYWxseSBpcyBpdD8NCg0KSW4gbW9z
dCBjYXNlcyBwZW9wbGUgYXJlIHByb2JhYmx5IG5vdCBhd2FyZSB0aGF0IHRoZXkgaGF2ZSBydW4g
DQppbnRvIGl0IGJlY2F1c2UgZm9yIG1vc3QgcmVjaXBlcyBpbiBPRS1Db3JlIGFuZCBPcGVuRW1i
ZWRkZWQsIA0KdGhlIG9ubHkgdXNlciB1c2VkIGlzICJyb290Iiwgd2hpY2ggbWF0Y2hlcyB3aGF0
IHJwbSB3aWxsIGZhbGwgDQpiYWNrIHRvIHVzaW5nIGlmIGl0IGNhbm5vdCBmaW5kIHRoZSB1c2Vy
IGZvciBhIGdpdmVuIFVJRC4NCg0KSG93ZXZlciwgd2UgdXNlIGEgbG90IG9mIHVzZXJzL2dyb3Vw
cyBpbiBvdXIgc3lzdGVtLCBhbmQgYWZ0ZXIgDQp3ZSB3ZXJlIGJpdCBieSBycG0gZmFsbGluZyBi
YWNrIHRvIHVzaW5nIHJvb3Qgb25lIHRpbWUgdG9vIG1hbnksIA0Kd2UgYWRkZWQgYSBwYXRjaCB0
byBycG0gc28gdGhhdCBpdCBmYWlscyB1bmRlciB0aGVzZSBjb25kaXRpb25zIA0KcmF0aGVyIHRo
YW4gc2lsZW50bHkgcHJvY2VlZGluZy4gSXQgaGFzIGJlZW4gaXJyaXRhdGluZyB0byB0aGUgDQpk
ZXZlbG9wZXJzLCBidXQgYXQgbGVhc3Qgd2Ugbm8gbG9uZ2VyIGVuZCB1cCB3aXRoIHJhbmRvbSAN
CmluY29ycmVjdGx5IGdlbmVyYXRlZCBSUE1zIGluIHRoZSBzc3RhdGUgY2FjaGUgdGhhdCBhcmUg
aGFyZCB0byANCnRyYWNrIGRvd24uDQoNCj4gSSdtIHNvcnJ5IGJ1dCBJIGRvbid0IGtub3cgdGhl
IGFuc3dlciB0byB5b3VyIHF1ZXN0aW9uIHdpdGhvdXQgc3BlbmRpbmcNCj4gMjAgbWludXRlcyBs
b29raW5nIGF0IHRoZSBjb2RlIGFuZCB0cnlpbmcgdG8gZmlndXJlIGl0IG91dC4gSSdtDQo+IHN0
cnVnZ2xpbmcgdG8gZmluZCBhIHNwYXJlIDIwIG1pbnV0ZXMgYXQgdGhlIG1vbWVudCA6KC4gSSBr
bm93IHRoaXMNCj4gaXNuJ3QgdGhlIGFuc3dlciB5b3Ugd2FudCBidXQgaXQgaXMgd2hhdCBpdCBp
cy4NCj4gDQo+IEkgcmVhbGx5IGFtIHRvdGFsbHkgc2xhbW1lZCB3aXRoIHNvbWUgb3RoZXIgaXNz
dWVzIGdvaW5nIG9uIHdoaWNoIGFyZQ0KPiBjb21wbGljYXRpbmcgdGhpbmdzIGV2ZW4gbW9yZSB0
b28uDQoNCk5vIHdvcnJpZXMuIFdlIHdpbGwganVzdCB1c2UgdGhlIHN1cHBsaWVkIHBhdGNoIGxv
Y2FsbHkgZm9yIG5vdy4gDQpCdXQgSSB3b3VsZCBhcHByZWNpYXRlIGlmIHlvdSBjb3VsZCBmaWxl
IHRoZSByZXF1ZXN0IGZvciBzb21lIA0KcG9pbnRlcnMgb24gaG93IHRvIHByb2NlZWQgdW5kZXIg
InRoaW5ncyB0byBkbyBvbmNlIFdhcnJpb3IgaXMgDQpvdXQgdGhlIGRvb3IgYW5kIEkgaGF2ZSBo
YWQgYSB3ZWVrIG9yIHR3byB0byBicmVhdGhlIj8gOykNCg0KQWN0dWFsbHksIHRvIHNhdmUgeW91
IGZyb20gaGF2aW5nIHRvIHJlbWVtYmVyIHRoaXMsIEkgaGF2ZSBub3cgDQphZGRlZCBpdCB0byBC
dWd6aWxsYToNCg0KaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNn
aT9pZD0xMzI3OQ0KDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0KLy9QZXRlcg0KDQo=

