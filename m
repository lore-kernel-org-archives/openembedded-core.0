Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id D679860800
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 18:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3BDFC184E4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:53:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 4NhlumCzrN1W
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:53:49 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 6A93F184A9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:53:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42CEA1A061
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:53:49 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 381591A060
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:53:49 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:53:49 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 2C78F299C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 20:53:49 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 6 Apr 2018 20:53:49 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Fri, 6 Apr 2018 20:53:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?utf-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgRml4IHByb2JsZW0gd2l0aCBs?=
	=?utf-8?Q?eftover_files_in_tmp/sysroots-components?=
Thread-Index: AQHTzdXku9h3bouh1kGtu8LdHDTyXaP0FBKQ
Date: Fri, 6 Apr 2018 18:53:49 +0000
Message-ID: <a09e5233863b4274a40300ce9f0c5a48@XBOX02.axis.com>
References: <cover.1523039141.git.pkj@axis.com>
	<20180406183424.2392.91155@do.openembedded.org>
In-Reply-To: <20180406183424.2392.91155@do.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEZpeCBwcm9ibGVtIHdpdGggbGVmdG92ZXIgZmlsZXMgaW4gdG1wL3N5c3Jvb3RzLWNvbXBvbmVudHM=?=
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
X-List-Received-Date: Fri, 06 Apr 2018 18:53:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXRjaHdvcmsgW21haWx0bzpw
YXRjaHdvcmtAcGF0Y2h3b3JrLm9wZW5lbWJlZGRlZC5vcmddDQo+IFNlbnQ6IGRlbiA2IGFwcmls
IDIwMTggMjA6MzQNCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0
QGF4aXMuY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBTdWJqZWN0OiDinJcgcGF0Y2h0ZXN0OiBmYWlsdXJlIGZvciBGaXggcHJvYmxlbSB3aXRo
IGxlZnRvdmVyIGZpbGVzIGluDQo+IHRtcC9zeXNyb290cy1jb21wb25lbnRzDQo+IA0KPiA9PSBT
ZXJpZXMgRGV0YWlscyA9PQ0KPiANCj4gU2VyaWVzOiBGaXggcHJvYmxlbSB3aXRoIGxlZnRvdmVy
IGZpbGVzIGluIHRtcC9zeXNyb290cy1jb21wb25lbnRzDQo+IFJldmlzaW9uOiAxDQo+IFVSTCAg
IDogaHR0cHM6Ly9wYXRjaHdvcmsub3BlbmVtYmVkZGVkLm9yZy9zZXJpZXMvMTE3MDYvDQo+IFN0
YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gDQo+IFRoYW5rIHlvdSBm
b3Igc3VibWl0dGluZyB0aGlzIHBhdGNoIHNlcmllcyB0byBPcGVuRW1iZWRkZWQgQ29yZS4gVGhp
cyBpcw0KPiBhbiBhdXRvbWF0ZWQgcmVzcG9uc2UuIFNldmVyYWwgdGVzdHMgaGF2ZSBiZWVuIGV4
ZWN1dGVkIG9uIHRoZSBwcm9wb3NlZA0KPiBzZXJpZXMgYnkgcGF0Y2h0ZXN0IHJlc3VsdGluZyBp
biB0aGUgZm9sbG93aW5nIGZhaWx1cmVzOg0KPiANCj4gDQo+IA0KPiAqIFBhdGNoICAgICAgICAg
ICAgWzEvM10gVXNlICR7TUFDSElORV9BUkNIfSBpbnN0ZWFkIG9mICR7TUFDSElORX0gZm9yIHN0
YW1wLWV4dHJhLWluZm8gdGFzayBmbGFnDQo+ICBJc3N1ZSAgICAgICAgICAgICBTaG9ydGxvZyBk
b2VzIG5vdCBmb2xsb3cgZXhwZWN0ZWQgZm9ybWF0IFt0ZXN0X3Nob3J0bG9nX2Zvcm1hdF0NCj4g
ICBTdWdnZXN0ZWQgZml4ICAgIENvbW1pdCBzaG9ydGxvZyAoZmlyc3QgbGluZSBvZiBjb21taXQg
bWVzc2FnZSkgc2hvdWxkIGZvbGxvdyB0aGUgZm9ybWF0ICI8dGFyZ2V0PjogPHN1bW1hcnk+Ig0K
DQpXaGljaCBkbyB5b3UgcHJlZmVyOg0KKiBMZWF2ZSBpdCBhcyBpdCBpcw0KKiBQcmVmaXggaXQg
d2l0aCBhIGdlbmVyaWMgImNsYXNzZXM6IiAod2hpY2ggaXNuJ3QgYWxsIHRydWUgYXMgdGhlIGxh
c3QgDQogIGh1bmsgaXMgYSBjb21tZW50IGluIGEgcmVjaXBlIGFib3V0IHRob3NlIGNsYXNzZXMp
DQoqIFNwbGl0IGl0IGluIHNpeCBhbG1vc3QgaWRlbnRpY2FsIGNvbW1pdHMNCg0KLy9QZXRlcg0K
DQo=

