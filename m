Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8C5C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 15:21:55 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.6857.1657207311580419402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 08:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=OUAta7OQ;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1657207311;
  x=1688743311;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7zkSKQn7CnydYbj62XOgLENuetcjdqxGv5fWaLoTB5s=;
  b=OUAta7OQkt272MmgMn5/HGHhnzAemHIwm4wuFHgvmFziSNv7YCuqGgMz
   /YDP7oTK4RM/IOzqFSKBedAb71eN5TJMhixaFQYnqfxSeEKCtZd0UkySo
   IXeM9Vj1R+9hgHOuZPiOeHYIE2Sa3+VJ03GQcQ0xyUUP1XCgYF8D7WR6k
   JcRBKeamI2b2Ab9VGzCAy8zfYzfIz540iE/ol66e/cyQsPJFfx5ptjLuj
   PSfjjy8V59A6eFN0u/2Ou0hYWxRlAUVu0JrSuxiwLZXQS/1ox05FpjxbE
   Rq31S/CutBd6gvXKEWkh7Ccar/Uqm+z+9lEH4eHehhhu6hENOK3B42n6+
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
Thread-Topic: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
Thread-Index: 
 AQHYkWWsuIJ0GxnyT0ak+urHDmj9Y61y5WKA///jYACAACJjAP//4yuAgAAmQ6D//+hLAAAEk4xw
Date: Thu, 7 Jul 2022 15:21:49 +0000
Message-ID: <da286dd472d94bbd82042fb1f84ba378@axis.com>
References: <20220706182329.3085564-1-alex@linutronix.de>
 <d04fa3ca7398489a99f8356b17f1174a@axis.com>
 <CANNYZj-Dtx6ETvTTgtJUE6Eizn-S=vm=Oug=cB3zRsQCC7AM=g@mail.gmail.com>
 <4573c371d989428899b884116c47fff3@axis.com>
 <CANNYZj8pEFcM1g_qOVbP1HDUE05yjQwyxsJpLM_em3NRPnM6kw@mail.gmail.com>
 <9ae77d11ee2848b4992c5c104928664b@axis.com>
 <CANNYZj_QKZzhhiDEcor5PRV2XgZ70CH+koyaH_oaP_dJW+QORQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_QKZzhhiDEcor5PRV2XgZ70CH+koyaH_oaP_dJW+QORQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 15:21:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167787

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDcganVsaSAyMDIyIDE2OjQ4DQo+
IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4g
Q2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IEFsZXhhbmRlciBL
YW5hdmluDQo+IDxhbGV4QGxpbnV0cm9uaXguZGU+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0g
W1BBVENIIDEvMl0gc2NyaXB0cy9vZS1zZXR1cC1idWlsZGRpcjogY29weQ0KPiBzaXRlLmNvbmYu
c2FtcGxlIG91dCBvZiB0ZW1wbGF0ZSBkaXJlY3RvcmllcyAoaWYgaXQgZXhpc3RzKQ0KPiANCj4g
T24gVGh1LCA3IEp1bCAyMDIyIGF0IDE2OjM4LCBQZXRlciBLamVsbGVyc3RlZHQNCj4gPHBldGVy
LmtqZWxsZXJzdGVkdEBheGlzLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEFuZCBpbiBjYXNlIHlvdSB3
b25kZXIgd2hhdCB0aGF0IHdyYXBwZXIgYWN0dWFsbHkgZG9lcywgaXQgY3JlYXRlcyB0aGUNCj4g
PiBiYmxheWVycy5jb25mLnNhbXBsZSBmaWxlIGJhc2VkIG9uIGFsbCBsYXllcnMgdGhhdCBhcmUg
Zm91bmQgaW4gdGhlIHRvcA0KPiA+IGRpcmVjdG9yeS4gSXQgYWxzbyBjcmVhdGVzIGEgbG9jYWwu
Y29uZi5zYW1wbGUgZmlsZSBieSBjb21iaW5pbmcNCj4gZnJhZ21lbnQNCj4gPiBmaWxlcyBpbiB0
aGUgbGF5ZXJzIChpLmUuLCBsb2NhbC5jb25mLnNhbXBsZS5YWCB3aGVyZSBYWCBpcyBhIG51bWJl
cg0KPiA+IGJldHdlZW4gMDAgYW5kIDk5KS4gVGhlIGxvY2FsLmNvbmYuc2FtcGxlIGZyb20gbWV0
YS1wb2t5IGlzIGNvbnNpZGVyZWQNCj4gPiB0byBoYXZlIFhYID09IDUwLiBUaGUgcmVhc29uIGZv
ciB0aGlzIGlzIHRoYXQgd2UgcXVpY2tseSByZWFsaXplZCB0aGF0DQo+ID4gdGhlIHN0YXRpYyB0
ZW1wbGF0ZWNvbmYgZGlyZWN0b3J5IHNldHVwIHdhcyB1bnVzYWJsZSBmb3IgdXMgd2hlbiB3ZQ0K
PiA+IHdhbnQgdG8gYmUgYWJsZSB0byB1c2UgbGF5ZXJzIGluIGRpZmZlcmVudCBjb21iaW5hdGlv
bnMuDQo+IA0KPiBDaGVlcnMuIEknZCBzYXkgaWYgeW91IG5lZWQgdG8gcGxhY2UgbG90cyBvZiBj
dXN0b21pemF0aW9ucyBpbnRvDQoNClRoZXJlIGFjdHVhbGx5IGlzbid0IGxvdHMgb2YgY29uZmln
dXJhdGlvbiBpbiB0aG9zZSBmcmFnbWVudHMuIA0KDQo+IGxvY2FsLmNvbmYgdGhhdCdzIG5vdCBh
IHJlY29tbWVuZGVkIHNldHVwIHRvIGJlZ2luIHdpdGg6IGFzIHNhaWQNCj4gZWxzZXdoZXJlIGl0
IHNob3VsZCBoYXZlIHByZWNpc2VseSB0d28gZGVmaW5pdGlvbnM6IGRpc3RybyBhbmQNCj4gbWFj
aGluZSwgYW5kIG5vdGhpbmcgZWxzZS4gV2hhdCBraW5kIG9mIHRoaW5ncyBhcmUgaW4gdGhvc2Ug
ZnJhZ21lbnRzPw0KDQpJbiBvdXIgQlNQIGxheWVyIHRoZXJlIGlzIHNvbWUgY29uZmlndXJhdGlv
biB3ZSB3YW50IGV2ZW4gaWYgb3VyIA0KZGlzdHJvIGxheWVyIGlzIG5vdCB1c2VkIChlLmcuLCBT
U1RBVEVfRElSKS4gSXQgYWxzbyBzZXRzIGEgZGVmYXVsdCANCk1BQ0hJTkUgdGhhdCBtYXRjaGVz
IG9uZSBmcm9tIG91ciBCU1BzLiBJbiB0aGUgZGlzdHJvIGxheWVyLCBpdCBzZXRzIA0KRElTVFJP
LiBJdCBhbHNvIGFkZHMgc29tZSBleHRyYSwgY29tbWVudGVkIHZhcmlhYmxlcyB0aGF0IG91ciB1
c2VycyANCm1heSB3YW50IHRvIGVuYWJsZSBpbiB0aGVpciBsb2NhbC5jb25mIGZpbGVzLCBtdWNo
IGxpa2UgdGhlIGV4YW1wbGVzIA0KaW4gdGhlIGxvY2FsLmNvbmYuc2FtcGxlIGZyb20gbWV0YS1w
b2t5Lg0KDQpQYXJ0IG9mIHRoaXMgaXMgb2YgY291cnNlIHJlbGF0ZWQgdG8gdGhhdCB3ZSB1c2Ug
cmVwbyB0byBmZXRjaCB0aGUgDQpsYXllcnMgd2UgbmVlZCBhbmQgdGh1cyB3ZSBkbyBub3QgaGF2
ZSB0aGUgbHV4dXJ5IG9mIGJpdGJha2Ugc3BlY2lmaWMgDQp0b29scyBsaWtlIGthcyBhbmQgd2hp
c2sgdGhhdCBjYW4gYWRkIGJpdGJha2UgY29uZmlndXJhdGlvbiBpbiBhZGRpdGlvbiANCnRvIHRo
ZSBhY3R1YWwgbGF5ZXJzLiBPbiB0aGUgb3RoZXIgaGFuZCwgb3VyIGVudmlyb25tZW50IGlzIHZl
cnkgc2ltaWxhciANCnRvIHRoZSBkZWZhdWx0IGV4cGVyaWVuY2Ugd2l0aCBwb2t5IGZyb20gYSB1
c2VyJ3MgcGVyc3BlY3RpdmUuDQoNCj4gU2hvdWxkIHRoZXkgYmUgY29uc29saWRhdGVkIGluIG1h
Y2hpbmUgYW5kIGRpc3RybyBkZWZpbml0aW9ucz8NCj4gDQo+IEFsZXgNCg0KLy9QZXRlcg0KDQo=

