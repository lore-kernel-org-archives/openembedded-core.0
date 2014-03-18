Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id ADDF56F904
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 13:40:29 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2IDeS5o014010;
	Tue, 18 Mar 2014 08:40:28 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2IDeSXb031364;
	Tue, 18 Mar 2014 08:40:28 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 18 Mar 2014 08:40:27 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Koen Kooi
	<koen@dominion.thruhere.net>
Thread-Topic: [OE-core] [PATCH 1/2] linaro-pm-qa-utils: Add power management
	test utils
Thread-Index: AQHPQql+Yj1gx/Tt70SiikaU8EtTG5rm2YrA
Date: Tue, 18 Mar 2014 13:40:27 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CF3A345@DLEE11.ent.ti.com>
References: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>
	<23BFBADE-120F-4DBC-AABF-A9F802B8222C@dominion.thruhere.net>
	<1395147366.3808.70.camel@ted>
In-Reply-To: <1395147366.3808.70.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] linaro-pm-qa-utils: Add power management test utils
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
X-List-Received-Date: Tue, 18 Mar 2014 13:40:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0
bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPlNlbnQ6IFR1ZXNkYXksIE1h
cmNoIDE4LCAyMDE0IDc6NTYgQU0NCj5UbzogS29lbiBLb29pDQo+Q2M6IE1hdXBpbiwgQ2hhc2U7
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj5TdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtQQVRDSCAxLzJdIGxpbmFyby1wbS1xYS11dGlsczogQWRkIHBvd2VyDQo+bWFu
YWdlbWVudCB0ZXN0IHV0aWxzDQo+DQo+T24gVHVlLCAyMDE0LTAzLTE4IGF0IDEzOjI5ICswMTAw
LCBLb2VuIEtvb2kgd3JvdGU6DQo+PiBPcCAxOCBtcnQuIDIwMTQsIG9tIDEyOjU2IGhlZWZ0IENo
YXNlIE1hdXBpbg0KPjxDaGFzZS5NYXVwaW5AdGkuY29tPiBoZXQgdm9sZ2VuZGUgZ2VzY2hyZXZl
bjoNCj4+DQo+PiA+ICogVGhlIHBvd2VyIG1hbmFnZW1lbnQgdGVzdCB1dGlsaXRpZXMgZnJvbSBM
aW5hcm8gY2FuIGJlIHVzZWQNCj4+ID4gIHRvIHRlc3QgbXVsdGlwbGUgUE0gZmVhdHVyZXMgc3Vj
aCBhcyBjcHVmcmVxLCBjcHVpZGxlLA0KPnRoZXJtYWwNCj4+ID4gIGNvbnRyb2wgYW5kIHN1c3Bl
bmQgb3BlcmF0aW9ucy4NCj4+ID4gKiBUaGVzZSB1dGlsaXRpZXMgYXJlIG5vdCBwbGF0Zm9ybSBz
cGVjaWZpYyBhbmQgY2FuIGJlIHVzZWQgYnkNCj4+ID4gIGEgYnJvYWRlciBiYXNlIG9mIHVzZXJz
Lg0KPj4NCj4+IFBOIHNob3VsZCBtZSAncG0tcWEnIG9yICdwbS1xYS11dGlscycuDQo+DQo+QWdy
ZWVkLg0KDQpJJ2xsIGNoYW5nZSB0aGUgbmFtZS4NCg0KPg0KPj4gIEFuZCBpdCB3b3VsZCBmaXQg
YmV0dGVyIGluIG1ldGEtb2Ugc2luY2UgaXQncyBub3QgJ2NvcmUnIGVub3VnaA0KPmZvciBvZS1j
b3JlLg0KPg0KPkknbSBvcGVuIHRvIGRpc2N1c3Npb24gb24gdGhhdC4gQ2VydGFpbmx5IGlmIHRo
ZXJlIGlzIGp1c3Qgb25lDQo+dXNlciwNCj5tZXRhLW9lIHdvdWxkIGJlIGFwcHJvcHJpYXRlLiBJ
ZiB0aGVzZSBhcmUgZ2VuZXJpY2FsbHkgdXNlZnVsIGFuZA0KPnRoZQ0KPnBsYW4gaXMgd2UgaW50
ZWdyYXRlIHRoZXNlIGludG8gdGhlIGxhcmdlciBhdXRvbWF0ZWQgdGVzdCBwaWN0dXJlLA0KPm9l
LWNvcmUgbWF5IG1ha2Ugc2Vuc2UuDQo+DQo+U28gaWYgdGhlcmUgYSBiaWdnZXIgcGljdHVyZSBw
bGFuIGhlcmU/IFdvdWxkIHRoZXNlIG1ha2Ugc2Vuc2UgaW4NCj50aGUNCj5icm9hZGVyIHBpY3R1
cmU/DQoNCldlbGwsIHdlIGNlcnRhaW5seSB1c2UgdGhlbSBmb3IgdGVzdCBhbmQgdGhleSBhcmUg
Z2VuZXJpYyBlbm91Z2ggdG8gYXBwbHkgdG8gYSBicm9hZGVyIGF1ZGllbmNlIHdoaWNoIGlzIHdo
eSBJIHRob3VnaHQgdG8gcHV0IHRoZW0gaGVyZSBmaXJzdC4gIFRoZXJlIGlzIG5vdGhpbmcgVEkg
c3BlY2lmaWMgYW5kIEkgZG9uJ3QgdGhpbmsgdGhleSBhcmUgZXZlbiBuZWNlc3NhcmlseSBBUk0g
c3BlY2lmaWMgZWl0aGVyLg0KDQo+DQo+Q2hlZXJzLA0KPg0KPlJpY2hhcmQNCg0K

