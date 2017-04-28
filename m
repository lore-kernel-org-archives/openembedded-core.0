Return-Path: <panagiotis.tamtamis@unify.com>
Received: from mx12.unify.com (mx12.unify.com [62.134.46.10])
	by mail.openembedded.org (Postfix) with ESMTP id 85A3E6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 09:32:10 +0000 (UTC)
Received: from MCHP02HTC.global-ad.net (unknown [172.29.42.235])
	by mx12.unify.com (Server) with ESMTP id D3E4123F044D;
	Fri, 28 Apr 2017 11:32:11 +0200 (CEST)
Received: from MCHP04MSX.global-ad.net ([169.254.37.243]) by
	MCHP02HTC.global-ad.net ([172.29.42.235]) with mapi id 14.03.0339.000;
	Fri, 28 Apr 2017 11:32:11 +0200
From: "Tamtamis, Panagiotis" <panagiotis.tamtamis@unify.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH] Check if /etc/fstab exists
Thread-Index: AQHSv4ffgX3CngFdWE6nhMMVWaY+p6HahItQ
Date: Fri, 28 Apr 2017 09:32:10 +0000
Message-ID: <0D74DA672F03634EA90EB18A61E36D272639CC1D@MCHP04MSX.global-ad.net>
References: <1493312178-8328-1-git-send-email-panagiotis.tamtamis@unify.com>
	<CAJ86T=U-qYiiafs4_+iJj4ibnmdd24A1ZZcw34ZeEWHTkgsb4w@mail.gmail.com>
In-Reply-To: <CAJ86T=U-qYiiafs4_+iJj4ibnmdd24A1ZZcw34ZeEWHTkgsb4w@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.29.42.225]
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Check if /etc/fstab exists
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
X-List-Received-Date: Fri, 28 Apr 2017 09:32:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZSBNY0N1cmR5IFttYWls
dG86YXJtY2N1cmR5QGdtYWlsLmNvbV0NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDI3LCAyMDE3
IDk6NTYgUE0NCj4gVG86IFRhbXRhbWlzLCBQYW5hZ2lvdGlzDQo+IENjOiBPRSBDb3JlIG1haWxp
bmcgbGlzdA0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gQ2hlY2sgaWYgL2V0Yy9m
c3RhYiBleGlzdHMNCj4gDQo+IE9uIFRodSwgQXByIDI3LCAyMDE3IGF0IDk6NTYgQU0sIFBhbmFn
aW90aXMgVGFtdGFtaXMNCj4gPHBhbmFnaW90aXMudGFtdGFtaXNAdW5pZnkuY29tPiB3cm90ZToN
Cj4gPiBVc2luZyAicmVhZC1vbmx5LXJvb3RmcyIgZmVhdHVyZSBpbiBtaW5pbWFsIG9yIHNwZWNp
YWwgcHVycG9zZSBpbWFnZXMNCj4gPiAoZWcgbW91bnRlZCBpbWFnZXMpIG1ha2VzIGJ1aWxkIHRv
IGZhaWwgYmVjYXVzZQ0KPiA+ICR7SU1BR0VfUk9PVEZTfS9ldGMvZnN0YWIgZmlsZSBkb2VzIG5v
dCBleGlzdC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhbmFnaW90aXMgVGFtdGFtaXMgPHBh
bmFnaW90aXMudGFtdGFtaXNAdW5pZnkuY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL2NsYXNzZXMv
cm9vdGZzLXBvc3Rjb21tYW5kcy5iYmNsYXNzIHwgMyArKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21l
dGEvY2xhc3Nlcy9yb290ZnMtcG9zdGNvbW1hbmRzLmJiY2xhc3MNCj4gPiBiL21ldGEvY2xhc3Nl
cy9yb290ZnMtcG9zdGNvbW1hbmRzLmJiY2xhc3MNCj4gPiBpbmRleCAwYzdjZWVhLi40NzA5MzY5
IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY2xhc3Nlcy9yb290ZnMtcG9zdGNvbW1hbmRzLmJiY2xh
c3MNCj4gPiArKysgYi9tZXRhL2NsYXNzZXMvcm9vdGZzLXBvc3Rjb21tYW5kcy5iYmNsYXNzDQo+
ID4gQEAgLTY0LDcgKzY0LDggQEAgc3lzdGVtZF9jcmVhdGVfdXNlcnMgKCkgeyAgIyAgcmVhZF9v
bmx5X3Jvb3Rmc19ob29rDQo+ID4gKCkgew0KPiA+ICAgICAgICAgIyBUd2VhayB0aGUgbW91bnQg
b3B0aW9uIGFuZCBmc19wYXNzbm8gZm9yIHJvb3RmcyBpbiBmc3RhYg0KPiA+IC0gICAgICAgc2Vk
IC1pIC1lDQo+ICcvXlsjWzpzcGFjZTpdXSpcL2Rldlwvcm9vdC97cy9kZWZhdWx0cy9yby87cy9c
KFtbOnNwYWNlOl1dKltbOmRpZ2l0Ol1dXClcKFtbOnNwDQo+IGFjZTpdXSpcKVtbOmRpZ2l0Ol1d
JC9cMVwyMC99JyAke0lNQUdFX1JPT1RGU30vZXRjL2ZzdGFiDQo+ID4gKyAgICAgICBpZiBbIC1m
ICR7SU1BR0VfUk9PVEZTfS9ldGMvZnN0YWIgXTsgdGhlbg0KPiA+ICsgICAgICAgICAgICAgICBz
ZWQgLWkgLWUNCj4gPiArICcvXlsjWzpzcGFjZTpdXSpcL2Rldlwvcm9vdC97cy9kZWZhdWx0cy9y
by87cy9cKFtbOnNwYWNlOl1dKltbOmRpZ2l0DQo+ID4gKyA6XV1cKVwoW1s6c3BhY2U6XV0qXClb
WzpkaWdpdDpdXSQvXDFcMjAvfScgJHtJTUFHRV9ST09URlN9L2V0Yy9mc3RhYg0KPiANCj4gTWlz
c2luZyAiZmkiID8NCg0KVGhhbmtzLCBmaXggd2l0aDoNCmh0dHA6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL3BpcGVybWFpbC9vcGVuZW1iZWRkZWQtY29yZS8yMDE3LUFwcmlsLzEzNjE3MS5odG1s
DQpGaXJzdCBwYXRjaCBoYWQgYWxzbyB3cm9uZyBzaG9ydGxvZy4NCg0KPiANCj4gPg0KPiA+ICAg
ICAgICAgIyBJZiB3ZSdyZSB1c2luZyBvcGVuc3NoIGFuZCB0aGUgL2V0Yy9zc2ggZGlyZWN0b3J5
IGhhcyBubyBwcmUtDQo+IGdlbmVyYXRlZCBrZXlzLA0KPiA+ICAgICAgICAgIyB3ZSBzaG91bGQg
Y29uZmlndXJlIG9wZW5zc2ggdG8gdXNlIHRoZSBjb25maWd1cmF0aW9uIGZpbGUNCj4gPiAvZXRj
L3NzaC9zc2hkX2NvbmZpZ19yZWFkb25seQ0KPiA+IC0tDQo+ID4gMS45LjENCj4gPg0KPiA+IC0t
DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4g
PiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gPiBPcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0K

