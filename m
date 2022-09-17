Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0DCECAAA1
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 00:07:06 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.1125.1663373216935985792
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 17:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ibAfgz/S;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1663373217;
  x=1694909217;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GOVJoyh8WazhLfywy2hAK9sGu51eZ9zNS6gxEvqoc/0=;
  b=ibAfgz/SA2V1phvlG5RFpW7F46jZJEbd71dl6mRTm7xAFjAAK8Jxdd6N
   aQFuaPQpJeOLpqBpoPidZWKZ0UoOluwwGwFyjeebGeXivV2dYjtHAo5nv
   JMLTCIRRtotf4JdZY9Wco+iNpgOF4MkBMy+Ugqn6hiZ0aHytLOyf7I2SQ
   n74Ib6M3NhSygYftR+wMxaXDDdKibdoIZeaaPhzS3ToatRC7hbCpBD8GW
   lfe9xRZmTRIolPfg7a4NxkrnVhMJuI/gBv8T+YQajGG7zLqvlIRby5vcZ
   HmcvEvcaeKxI5nI71sqtJeed/3/oDz2Zobs839V5HnFU+Sx3PRNfTille
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: ChenQi <Qi.Chen@windriver.com>, OE-core
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 1/7] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
Thread-Topic: [OE-core] [PATCH 1/7] scripts/oe-setup-builddir: add a check
 that TEMPLATECONF is valid
Thread-Index: 
 AQHYvSrQCcgb4edBN0auXSkBYnBdhq3eOAmAgAAZ4oCAAA3BgIAADe+AgAARgQCAAAYZgIAAA9UAgAAG1YCAAR65kIAAflaAgADz18CAALmSAIAA4F0Q
Date: Sat, 17 Sep 2022 00:06:54 +0000
Message-ID: <e13500864aec4656b1dc14c92947a659@axis.com>
References: <20220831111401.3330342-1-alex@linutronix.de>
 <e73f356f-87dd-2aba-7445-2f93ad6bf145@windriver.com>
 <CANNYZj-fLHiNEOLzp5etSQRwtNb55kHa4k02jzRRm=c3dohULA@mail.gmail.com>
 <6917e065-3b17-a57e-f862-90366717106b@windriver.com>
 <CANNYZj_OqjRgsQQwQditr1iHCM1RkZak-hFG-zEsqPmMfdNd_A@mail.gmail.com>
 <8e5b3cc0-bf66-fb7c-0199-ae6766c76cc8@windriver.com>
 <CANNYZj8owg_f1=g6VWVo-S6Qhq8VOgeYiGwQgNYQ5-GmbP8OTQ@mail.gmail.com>
 <8f083713-d00a-2393-3b74-35491e830bb0@windriver.com>
 <CANNYZj9nK6OXGEb0qHHSUz_UYn8QZt9ZSk5e_i-A76RPqMG8kw@mail.gmail.com>
 <e0a16812e51d41ada44bd388dea8a90b@axis.com>
 <CANNYZj9_wrEF7OvWYFX090ET1cG0cfK4w0J44a8zMHX6DRHYVQ@mail.gmail.com>
 <32f1549da2dd46e98476e2543be0746a@axis.com>
 <CANNYZj-tPjxFn9-BDDsr4vg4f8WTU4apVJo_=_TqKpuvjf93QA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-tPjxFn9-BDDsr4vg4f8WTU4apVJo_=_TqKpuvjf93QA@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 00:07:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170824

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDE2IHNlcHRlbWJlciAyMDIyIDEx
OjU3DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNv
bT4NCj4gQ2M6IENoZW5RaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPjsgT0UtY29yZSA8b3BlbmVt
YmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+OyBBbGV4YW5kZXIgS2FuYXZp
biA8YWxleEBsaW51dHJvbml4LmRlPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAx
LzddIHNjcmlwdHMvb2Utc2V0dXAtYnVpbGRkaXI6IGFkZCBhIGNoZWNrDQo+IHRoYXQgVEVNUExB
VEVDT05GIGlzIHZhbGlkDQo+IA0KPiBPbiBGcmksIDE2IFNlcHQgMjAyMiBhdCAwMDo1OSwgUGV0
ZXIgS2plbGxlcnN0ZWR0DQo+IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gU2luY2Ugb3VyIGNvZGUgaXMgYSB3cmFwcGVyIGFyb3VuZCBvZS1pbml0LWJ1aWxk
LWVudiwgaXQgd291bGQgaGF2ZSB0byBkbw0KPiA+IHRoZSBleGFjdCBzYW1lIGNhbGN1bGF0aW9u
cyBhcyBhcmUgZG9uZSBpbiBvZS1zZXR1cC1idWlsZGRpciwgYW5kIGlmIHlvdQ0KPiA+IGxvb2sg
YXQgdGhhdCBzY3JpcHQsIHlvdSB3aWxsIHNlZSB0aGF0IHRoZXJlIGFyZSBhY3R1YWxseSBxdWl0
ZSBhIGxvdCBvZg0KPiA+IG9wdGlvbnMgdG8gZGV0ZXJtaW5lIHRoZSBuYW1lIG9mIHRoZSBidWls
ZCBkaXJlY3RvcnkuDQo+IA0KPiBMaW5lIG51bWJlcnMgYXMgb2YgY3VycmVudCBtYXN0ZXIgSEVB
RCBwbGVhc2UuIEkgYW0gbG9va2luZyBhdCB0aGUNCj4gc2NyaXB0IHJpZ2h0IG5vdyBhbmQgSSBh
bSBub3Qgc2VlaW5nIGFueSBvcHRpb25zOiBpdCBzaW1wbHkgdGFrZXMNCj4gJEJVSUxERElSIHZh
ciBwYXNzZWQgaW4gZnJvbSBvZS1pbml0LWJ1aWxkLWVudi4gQW5kIG9lLWluaXQtYnVpbGQtZW52
DQo+IHNldHMgdGhhdCB0byBlaXRoZXIgd2hhdCB3YXMgZ2l2ZW4gb24gdGhlIGNvbW1hbmQgbGlu
ZSwgb3IgZGVmYXVsdHMgdG8NCj4gJ2J1aWxkJy4NCg0KU29ycnksIG15IGZhdWx0LiBJIGZvcmdv
dCB0aGF0IHdoaWxlIHRoZSBidWlsZCBkaXJlY3RvcnkgaXMgY3JlYXRlZCANCmluIG9lLXNldHVw
LWJ1aWxkZGlyLCB0aGUgcGF0aCB0aGF0IGlzIHVzZWQgaXMgYWN0dWFsbHkgZGV0ZXJtaW5lZCBp
biANCm9lLWJ1aWxkZW52LWludGVybmFsLCBsaW5lIDQyLTgxLiBBbmQgdGhpcyBpcyB0aGUgcGFy
dCB0aGF0IEkgd291bGQgDQpoYXZlIHRvIGR1cGxpY2F0ZS4gTm93LCBJIGRvIG5vdCBuZWVkIGFs
bCBvZiBpdCAoaXQgY2FuIGJlIHJlZHVjZWQgdG8NCjE5IGxpbmVzKSwgYnV0IGl0IHN0aWxsIG1l
YW5zIEkgYW0gZHVwbGljYXRpbmcgdGhlIGxvZ2ljIGZyb20gT0UtQ29yZSANCmFuZCBpZiB0aGF0
IGNoYW5nZXMsIHdlIG1heSBvciBtYXkgbm90IG5vdGljZS4uLg0KDQpUaGF0IHNhaWQsIHVubGVz
cyBJIGNhbiBjb252aW5jZSB5b3UgdGhhdCB0aGUgcmlnaHQgdGhpbmcgdG8gZG8gaXMgdG8gDQpy
ZW1vdmUgdGVtcGxhdGVjb25mLmNmZyBmb3IgYWxsIGJ1aWxkcyBpZiBpdCBkb2VzIG5vdCBjb250
YWluIGEgdmFsaWQgDQpwYXRoIGFjY29yZGluZyB0byB0aGUgbmV3IHJ1bGVzIChhbmQgbm90IG9u
bHkgZm9yIE9FLUNvcmUgYW5kIFBva3kpLCANCnRoZW4gSSBzdGlsbCBuZWVkIHRvIGR1cGxpY2F0
ZSB0aGUgY29kZSB0byBkZXRlcm1pbmUgdGhlIGJ1aWxkIA0KZGlyZWN0b3J5IHRvIGJlIGFibGUg
dG8gcmVtb3ZlIHRoZSB0ZW1wbGF0ZWNvbmYuY2ZnIGZpbGUgdG8gYXZvaWQgDQpoYXZpbmcgdG8g
bWFrZSBhbGwgb3VyIGRldmVsb3BlcnMgZG8gaXQgbWFudWFsbHkuLi4NCg0KPiANCj4gQWdhaW4s
IHRvIHRoZSBiZXN0IG9mIG15IGtub3dsZWRnZSB0aGlzIHdpbGwgd29yayBpbiB0aGUgd3JhcHBl
ciwgYW5kDQo+IHlvdSBuZWVkIHRvIHNob3cgb3RoZXJ3aXNlOg0KPiANCj4gbWtkaXIgLXAgJGJ1
aWxkZGlyL2NvbmYNCj4gd3JpdGVfb3V0ICRidWlsZGRpci9jb25mL2JibGF5ZXJzLmNvbmYNCj4g
LiBvZS1pbml0LWJ1aWxkLWVudiAkYnVpbGRkaXINCj4gDQo+IFNvbWV0aGluZyBzdGlsbCBkb2Vz
bid0IGNvbXB1dGUgaGVyZSBhbmQgd2UgbmVlZCB0byBnZXQgdG8gdGhlIGJvdHRvbQ0KPiBvZiBp
dC4gTGV0J3MgZm9jdXMgb24gdGhpcyBmb3Igbm93LCBwbGVhc2UuDQo+IA0KPiBBbGV4DQoNCi8v
UGV0ZXINCg0K

