Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E1B5C433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 02:01:12 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.1278.1643421670396367958
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 18:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=k+4wZG88;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643421670;
  x=1674957670;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=78WnILznkJZH46xIzkoVU7c2sxHsFm/M71LDRTwRkx8=;
  b=k+4wZG88XEoiWjHZHsRUJjWdAx1DC08hZyc1z8/cDOnGFmWSb9NjxysF
   a2ZR2bMy5bnMVzCx89W7PU3W9cdMT7CsONJJsnpW8dipQSGG2CQ2vnExB
   5EtaQW1HUKyiedv742zWxYgD+z5WmMJobTvWCLo1SoXSQtyU5sLPfgzUM
   b3tYn+2T73O4cmw7cHybp7GppkyYiIfF2/Ucfj/t/J2o48hEIZ9mttwVI
   WAKTeFbdpsCdedHJLfezfYM33Yo3u7hSs013EIwOJYzhP6oE92ZREICbE
   zxkmhwOd9LdgkxPYzKO1JwxTxbkbcgnwwNtYzHJBjK0uaHvwcdSWu0Ayo
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Marek Vasut <marex@denx.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH] Revert "featimage: refactor style"
Thread-Topic: [OE-core] [PATCH] Revert "featimage: refactor style"
Thread-Index: AQHYFKdQcSt1hC1cm0GYPVsV99Xj7qx5LaAQ///6NoCAABKlcA==
Date: Sat, 29 Jan 2022 02:01:07 +0000
Message-ID: <53514b34002e424584e20150b6b725a7@axis.com>
References: <20220129002907.84534-1-marex@denx.de>
 <93bb78f01d7c44c1b5918e1576f2a804@axis.com>
 <315161c5-6b68-2b4c-37fc-3d10459fdbf8@denx.de>
In-Reply-To: <315161c5-6b68-2b4c-37fc-3d10459fdbf8@denx.de>
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
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 02:01:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161091

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJlayBWYXN1dCA8bWFyZXhA
ZGVueC5kZT4NCj4gU2VudDogZGVuIDI5IGphbnVhcmkgMjAyMiAwMjozOQ0KPiBUbzogUGV0ZXIg
S2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+OyBvcGVuZW1iZWRkZWQt
DQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogQW5kcmVqIFZhbGVrIDxhbmRy
ZWoudmFsZWtAc2llbWVucy5jb20+OyBSaWNoYXJkIFB1cmRpZQ0KPiA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIFJl
dmVydCAiZmVhdGltYWdlOiByZWZhY3RvciBzdHlsZSINCj4gDQo+IE9uIDEvMjkvMjIgMDI6MDYs
IFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gPj4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8
b3BlbmVtYmVkZGVkLQ0KPiA+PiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFs
ZiBPZiBNYXJlayBWYXN1dA0KPiA+PiBTZW50OiBkZW4gMjkgamFudWFyaSAyMDIyIDAxOjI5DQo+
ID4+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4+IENj
OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT47IEFuZHJlaiBWYWxlaw0KPiA8YW5kcmVqLnZh
bGVrQHNpZW1lbnMuY29tPjsNCj4gPj4gUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxp
bnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4+IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFUQ0hdIFJldmVy
dCAiZmVhdGltYWdlOiByZWZhY3RvciBzdHlsZSINCj4gPj4NCj4gPj4gVGhpcyByZXZlcnRzIGNv
bW1pdCBmNDRiYjQ1ODg4NGRhNjQzNTZlZTE4ODkxNzA5NGI1NTE1ZDNiMTU5Lg0KPiA+Pg0KPiA+
PiBUaGUgcmV2ZXJ0ZWQgcGF0Y2ggYXR0ZW1wdGVkIHRvIHBlcmZvcm0gc29tZSBzb3J0IG9mIGNs
ZWFuIHVwLCBob3dldmVyDQo+ID4+IGl0IG9ubHkgYnJvdWdodCBpbiBzdHlsZSBpbmNvbnNpc3Rl
bmNpZXMgbGlrZSB0aGlzOg0KPiA+Pg0KPiA+PiBgYGANCj4gPj4gY29uZl9kZXNjPSIkY29uZl9k
ZXNjJHtzZXB9c2V0dXAiDQo+ID4+IGBgYA0KPiA+Pg0KPiA+PiBUaGUgY3VybHkgYnJhY2tldHMg
YXJvdW5kIHZhcmlhYmxlcyB3ZXJlIHBsYWNlZCBpbiB0aGUga2VybmVsLWZpdGltYWdlDQo+ID4+
IGJiY2xhc3MgZGVsaWJlcmF0ZWx5LCBzaW5jZSB3aGVuIGFzc2VtYmxpbmcgdGhlIGZpdGltYWdl
IElUUyB0aGVyZSBhcmUNCj4gPj4gbXVsdGlwbGUgdmFyaWFibGVzIHdoZXJlIGl0IGlzIGRpZmZp
Y3VsdCB0byBpZGVudGlmeSB3aGVyZSB0aGUgdmFyaWFibGUNCj4gPj4gZW5kcyBhbmQgc29tZSBz
b3J0IG9mIGZvbGxvdyB1cCBzdHJpbmcgc3RhcnRzLg0KPiA+DQo+ID4gVGhlcmUgaXMgYWN0dWFs
bHkgYSB0ZWNobmljYWwgcmVhc29uIHRvIG5vdCB1c2UgJHtmb299IGZvciBzaGVsbA0KPiA+IHZh
cmlhYmxlcyB1bmxlc3MgbmVjZXNzYXJ5IGluIGJpdGJha2UgZmlsZXMgYW5kIGl0IGlzIGJlY2F1
c2UNCj4gPiBiaXRiYWtlIHdpbGwgdHJlYXQgdGhlbSBhbGwgYXMgcG90ZW50aWFsIGJpdGJha2Ug
dmFyaWFibGVzLiBUaGlzDQo+ID4gbWVhbnMgdGhleSBhcmUgdW5uZWNlc3NhcmlseSBpbmNsdWRl
ZCBpbiB0aGUgdGFza2hhc2hlcyB0aGF0DQo+ID4gYml0YmFrZSBjYWxjdWxhdGVzLg0KPiANCj4g
WWlrZXMuIChpdCB3b3VsZCBiZSBnb29kIHRvIGluY2x1ZGUgdGhpcyBnZW0gaW4gdGhlIGNvbW1p
dCBtZXNzYWdlKQ0KDQpXZWxsIHRoZXJlIHdhczoNCg0KICAgIC0gdXNlIGJhc2ggdmFyaWFibGUg
bm90YXRpb24gd2l0aG91dCB7fSB3aGVyZSBwb3NzaWJsZQ0KICAgICAgLSBqdXN0IHRvIG1ha2Ug
c3VyZSBpdCBsb29rcyBsaWtlIGJhc2ggdmFyaWFibGUgbm90IGJpdGJha2UgdmFyaWFibGUgb25l
DQoNCnRob3VnaCBJIGd1ZXNzIG15IGV4cGxhbmF0aW9uIGhhcyBhIGJpdCBtb3JlIHRlY2huaWNh
bCBtZXJpdCANCnRoYW4gdGhhdCBpdCBpbXByb3ZlcyB0aGUgbG9va3MuIDspDQoNCj4gU28gYXJl
IHdlIHN0dWNrIHdpdGggdGhpcyBpbmNvbnNpc3RlbnQgY29kaW5nIHN0eWxlIGNoYW5nZSANCj4g
b3IgaXMgdGhlcmUgYQ0KDQpQZXJzb25hbGx5IEkgZG8gbm90IHNlZSBpdCBhcyBpbmNvbnNpc3Rl
bnQsIGl0IGlzIGp1c3QgdGhlIHdheSANCnNoZWxsIGhhbmRsZXMgdmFyaWFibGVzLiBJdCBpcyBq
dXN0IHNvbWV0aGluZyB0byBnZXQgdXNlZCB0byAoSSANCmFsc28gaGFkIGEgY29sbGVhZ3VlIHdo
byB3b3VsZCByZXZpZXcgYW55IHNoZWxsIGNvZGUgY2hhbmdlcyB3ZSANCm1hZGUgYW5kIGNvbW1l
bnQgb24gZXZlcnkgc2luZ2xlIHVubmVjZXNzYXJ5IGNoYXJhY3RlciBzbyBvbmUgDQpxdWlja2x5
IGxlYXJuZWQgdG8gdXNlICRmb28gZXZlcnl3aGVyZSBwb3NzaWJsZSByYXRoZXIgdGhhbiANCiR7
Zm9vfS4uLikgVGhhdCBzYWlkLCBJIGhhdmUgbmV2ZXIgbG9va2VkIGF0IHRoaXMgY29kZSBzbyBJ
IA0KaGF2ZSBubyByZWFsIGlkZWEgb2YgaG93IGJhZCBpdCBpcyBvciBpc24ndC4NCg0KPiB0aGly
ZCBhbHRlcm5hdGl2ZSA/IEkgbWVhbiwgYmVzaWRlcyByZXdyaXRpbmcgdGhlIGZpdGltYWdlIA0K
PiBnZW5lcmF0aW9uIGludG8gcHl0aG9uLCB3aGljaCBtaWdodCBtYWtlIGl0IG1vcmUgZmxleGli
bGUgdG9vLg0KDQpSZXBsYWNpbmcgc2hlbGwgY29kZSB0aGF0IGhhcyBncm93biBiZXlvbmQgYSBj
b3VwbGUgb2YgaHVuZHJlZCANCih0ZW5zPykgbGluZXMgd2l0aCBzb21ldGhpbmcgd3JpdHRlbiBp
biBhIGJldHRlciBsYW5ndWFnZSBpcyANCmFsbW9zdCBhbHdheXMgYSBnb29kIGlkZWEuDQoNCi8v
UGV0ZXINCg0K

