Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B40DA6C3A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 13:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 90ED4182F4;
	Mon, 11 Mar 2019 14:49:10 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id A2ps4PTrAUtb; Mon, 11 Mar 2019 14:49:09 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 33F64182D7;
	Mon, 11 Mar 2019 14:49:09 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 232F91E09E;
	Mon, 11 Mar 2019 14:49:09 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 179DC1E075;
	Mon, 11 Mar 2019 14:49:09 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 11 Mar 2019 14:49:09 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 0A7A729CE;
	Mon, 11 Mar 2019 14:49:09 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 11 Mar 2019 14:49:08 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 11 Mar 2019 14:49:08 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Mon, 11 Mar 2019 14:49:08 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: Can't build product that uses DEFAULTTUNE="arm926ejs"
Thread-Index: AdTXwGozNpZtoMkdRIy3RTSRsKSVkf//8tAA//9TFpA=
Date: Mon, 11 Mar 2019 13:49:08 +0000
Message-ID: <56f123443c35462c81076bffe4f7fb5c@XBOX04.axis.com>
References: <d33eaa8904924405a9a5870faac183e0@XBOX04.axis.com>
	<CAMKF1souJ1e1GG6qHvSsSYi6v84FriBjwP3Fifp10e8Z2mK-_g@mail.gmail.com>
In-Reply-To: <CAMKF1souJ1e1GG6qHvSsSYi6v84FriBjwP3Fifp10e8Z2mK-_g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Can't build product that uses DEFAULTTUNE="arm926ejs"
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
X-List-Received-Date: Mon, 11 Mar 2019 13:49:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBTZW50OiBkZW4gMTEgbWFycyAyMDE5IDA1OjI0DQo+IFRvOiBQZXRlciBL
amVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gQ2M6IE9FIENvcmUg
KG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcpIDxvcGVuZW1iZWRkZWQt
DQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6IENhbid0IGJ1
aWxkIHByb2R1Y3QgdGhhdCB1c2VzIERFRkFVTFRUVU5FPSJhcm05MjZlanMiDQo+IA0KPiBPbiBT
dW4sIE1hciAxMCwgMjAxOSBhdCA5OjIwIFBNIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA8cGV0ZXIu
a2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gPg0KPiA+IEknbSB0cnlpbmcgdG8gYnVp
bGQgd2l0aCBtYXN0ZXIgb2YgT0UtY29yZSBhbmQgb25lIG9mIG91ciBwcm9kdWN0cw0KPiA+IG5v
dyBmYWlscyB3aXRoOg0KPiA+DQo+ID4gRVJST1I6ICBPRS1jb3JlJ3MgY29uZmlnIHNhbml0eSBj
aGVja2VyIGRldGVjdGVkIGEgcG90ZW50aWFsIG1pc2NvbmZpZ3VyYXRpb24uDQo+ID4gICAgIEVp
dGhlciBmaXggdGhlIGNhdXNlIG9mIHRoaXMgZXJyb3Igb3IgYXQgeW91ciBvd24gcmlzayBkaXNh
YmxlIHRoZSBjaGVja2VyDQo+ID4gICAgIChzZWUgc2FuaXR5LmNvbmYpLiBGb2xsb3dpbmcgaXMg
dGhlIGxpc3Qgb2YgcG90ZW50aWFsIHByb2JsZW1zIC8gYWR2aXNvcmllczoNCj4gPg0KPiA+ICAg
ICBFcnJvciwgdGhlIFBBQ0tBR0VfQVJDSFMgdmFyaWFibGUgKGFsbCBhbnkgbm9hcmNoIGFybSBh
cm12NCBhcm12NHQgYXJtdjUNCj4gPiAgICAgYXJtdjV0IGFybXY1ZSBhcm12NXRlIGFybTkyNmVq
c3RlIGFybTkyNmVqc2UgPEJTUCBuYW1lIHdpdGhoZWxkPikgZm9yDQo+ID4gICAgIERFRkFVTFRU
VU5FIChhcm05MjZlanMpIGRvZXMgbm90IGNvbnRhaW4gVFVORV9QS0dBUkNIIChhcm05MjZlanN0
KS4NCj4gPg0KPiA+IEkgYmVsaWV2ZSB0aGlzIGlzIGR1ZSB0byBjb21taXQgYWM4M2QyMmUgKGFy
bS10dW5lczogUmVtb3ZlIC1tYXJjaA0KPiA+IG9wdGlvbiBpZiBtY3B1IGlzIGFscmVhZHkgYWRk
ZWQpLiBJZiBJIGJ1aWxkIHdpdGggVGh1ZCwgVFVORV9QS0dBUkNIIA0KPiA+IGlzICJhcm05MjZl
anN0ZSIuIFRoZSAgbGFjayBvZiB0aGUgImUiIGF0IHRoZSBlbmQgd2hlbiBidWlsZGluZyB3aXRo
IA0KPiA+IG1hc3RlciBzZWVtcyB0byBiZSBkdWUgdG8gdGhlIGRlZmluaXRpb24gb2YgQVJNUEtH
U0ZYX0RTUCBhcw0KPiA+ICIke0BiYi51dGlscy5jb250YWlucygnVFVORV9GRUFUVVJFUycsIFsg
J2FybXY1JywgJ2RzcCcgXSwgJ2UnLCAnJywgZCl9IiANCj4gPiBhbmQgdGhlIGZhY3QgdGhhdCBh
ZnRlciBjb21taXQgYWM4M2QyMmUsIFRVTkVfRkVBVFVSRVMgbm8gbG9uZ2VyIA0KPiA+IGNvbnRh
aW5zICdhcm12NScuDQo+IA0KPiByaWdodCB0aGlzIHNob3VsZCBub3cgY2hlY2sgZm9yIGFybXY1
dA0KDQpUaGVyZSBpcyBubyBhcm12NXQgdG8gY2hlY2sgZm9yLg0KDQo+IGFybXY1IGhhcyBiZWVu
IHJlbW92ZWQgZnJvbSB1cHN0cmVhbSBnY2MgYXMgd2VsbC4gU28gd2Ugb25seSBzdXBwb3J0DQo+
IGFybXY1dCB2YXJpYW50cy4NCj4gDQo+ID4gLy9QZXRlcg0KDQpJIGFtIGJ5IG5vIG1lYW5zIGFu
eSBleHBlcnQgb24gdGhlIHR1bmluZyBmaWxlcyAoYWN0dWFsbHkgdGhleSBtb3N0bHkgDQpzZWVt
IGxpa2UgYmxhY2sgbWFnaWMpLCBidXQgSSBkZXZpc2VkIGFuIGFsdGVybmF0aXZlIHNvbHV0aW9u
IGZvciANCnByZWZlcnJpbmcgLW1jcHUgb3ZlciAtbWFyY2ggdGhhdCBJIHRoaW5rIGlzIGxlc3Mg
aW52YXNpdmUgYW5kIHdpdGhvdXQgDQp1bndhbnRlZCBzaWRlIGVmZmVjdHMuIEkgd2lsbCBwdWJs
aXNoIGl0IHNob3J0bHkuDQoNCi8vUGV0ZXINCg0K

