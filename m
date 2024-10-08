Return-Path: <psobon@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8B6CEFC41
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 18:47:33 +0000 (UTC)
Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com [99.78.197.219])
 by mx.groups.io with SMTP id smtpd.web11.3666.1728413247838729907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 11:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=C5bTeHiq;
 spf=pass (domain: amazon.com, ip: 99.78.197.219, mailfrom: prvs=004dced12=psobon@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1728413247; x=1759949247;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=azOSkdLkiR7sSEbC5QBwBpNFWu58/rHIQmrfDXA47PM=;
  b=C5bTeHiqCtp2UlpHyEWq0yGuMiTeIxy/HecHugv9ZwLrPURKHWEdMUbU
   jUxtNGprwAjXTkU44Xm07nwqP9FSCdMCOQ7QPWgmT/0uJmgR/7jZqL13o
   O+SlFMU+jHC6+QhFmosp+FAaPDWYDiH3YysTq23AdQpiEcBLy1afEsUhT
   8=;
X-IronPort-AV: E=Sophos;i="6.11,187,1725321600"; 
   d="scan'208";a="136767263"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 18:47:27 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.7.35:61437]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.59.23:2525] with esmtp (Farcaster)
 id a2fd97b0-f79a-475c-b899-4db75f0423ff; Tue, 8 Oct 2024 18:47:27 +0000 (UTC)
X-Farcaster-Flow-ID: a2fd97b0-f79a-475c-b899-4db75f0423ff
Received: from EX19D020UWA003.ant.amazon.com (10.13.138.254) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 8 Oct 2024 18:47:26 +0000
Received: from EX19D007UWA001.ant.amazon.com (10.13.138.244) by
 EX19D020UWA003.ant.amazon.com (10.13.138.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 8 Oct 2024 18:47:26 +0000
Received: from EX19D007UWA001.ant.amazon.com ([fe80::d6db:966e:d11b:e4d6]) by
 EX19D007UWA001.ant.amazon.com ([fe80::d6db:966e:d11b:e4d6%5]) with mapi id
 15.02.1258.034; Tue, 8 Oct 2024 18:47:26 +0000
From: "Sobon, Przemyslaw" <psobon@amazon.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Yu, Max" <yumx@amazon.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] sstate: remove corrupted artifacts from local
 mirror
Thread-Topic: [OE-core] [PATCH] sstate: remove corrupted artifacts from local
 mirror
Thread-Index: AdsZsoRpjb8HLiDaQEamUiOTrL/YwA==
Date: Tue, 8 Oct 2024 18:47:26 +0000
Message-ID: <a77f128585324bb49c95d2ddd56edb25@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.13.138.181]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 18:47:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205300

T24gVHVlc2RheSwgT2N0b2JlciA4LCAyMDI0IDI6MzggQU0gQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+IHdyb3RlOg0KPk9uIE1vbiwgNyBPY3QgMjAyNCBhdCAyMjow
OSwgWXUsIE1heCA8eXVteEBhbWF6b24uY29tPiB3cm90ZToNCj4+IENvcnJ1cHRpb25zIGFyZSB1
bmF2b2lkYWJsZSBwYXJ0IG9mIG91ciBsaWZlLCBkaXNrcyBhbmQgbmV0d29yayBjYW4gaW5qZWN0
DQo+PiBmYWlsdXJlcyBkdWUgdG8gdW5wcmVkaWN0YWJsZSBhbmQgdW5rbm93biByZWFzb25zIGxp
a2UNCj4+IGh0dHBzOi8vd3d3LnNjaWVuY2VkaXJlY3QuY29tL3NjaWVuY2UvYXJ0aWNsZS9hYnMv
cGlpL1MwMDI2MjcxNDIxMDAzNzIzLg0KPj4gRXZlbiBtdWx0aS1sYXllciBwcm90ZWN0aW9uIGlz
IG5vdCBwZXJmZWN0IGFzIGl0IGRlcGVuZHMgb24gd2hlcmUgdGhlIGVycm9yDQo+PiBpcyBpbmpl
Y3RlZC4NCj4gSSdtIHNvcnJ5IGJ1dCBJIGFtIG5vdCBjb252aW5jZWQuIFlvdSBhcmUgdGhlIG9u
bHkgb25lIHJlcG9ydGluZyB0aGUgaXNzdWUsDQo+IHNvIEkgZG9uJ3QgdGhpbmsgaXQncyB1bmF2
b2lkYWJsZS4NClRoZSAib25seSBvbmUgcmVwb3J0aW5nIiBkb2VzIG5vdCBtZWFuIHRoZSBwcm9i
bGVtIGRvZXMgbm90IGV4aXN0LCBpdCBtYXkgYmUNCmp1c3Qgbm90IGFzIGJpZyBwcm9ibGVtIGZv
ciBvdGhlcnMgYXMgZm9yIHVzLiBTaW1pbGFyIHByb2JsZW0gZXhpc3QgZm9yIERSQU0NCm1lbW9y
eSBjb3JydXB0aW9ucz8gTW9zdCBvZiB0aGUgcGVvcGxlIGRvbid0IGNhcmUgYWJvdXQgdGhhdCBi
dXQgZm9yIHNvbWUNCnRoaXMgaXMgaW1wb3J0YW50IHByb2JsZW0sIGUuZy4gd2hlbiB5b3Ugc2Vl
IDEgT1MgY3Jhc2ggcGVyIDEwIHllYXJzIGl0IGlzDQpub3QgYSBiaWcgZGVhbCBidXQgaWYgeW91
IG93biAxMGsgc2VydmVycyB5b3Ugc2VlIDMgY3Jhc2hlcyBwZXIgZGF5LiBUaGF0IGlzDQp0aGUg
c2NhbGUgZmFjdG9yIHRoYXQgaXMgaW1wb3J0YW50LiBNYXggdGFsa2VkIGFib3V0IG91ciBzY2Fs
ZSBhbHJlYWR5Lg0KU3VtbWFyaXppbmcsIHRoZSBtYW51YWwgd29yayBpcyBub3QgYSBzb2x1dGlv
biBmb3IgdXMgZHVlIHRvIHNjYWxlLg0KDQo+PiBXZSBwcm9wb3NlZCB0aGlzIHBhdGNoIGFzIGl0
IGlzIGFsaWduZWQgd2l0aCBob3cgd2UgY3VycmVudGx5IGhhbmRsZQ0KPj4gaW5jb3JyZWN0IGNo
ZWNrc3VtczoNCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS95b2N0b3Byb2plY3QvcG9reS9jb21taXQv
NjcyYzA3ZGU0YTk2ZWI2N2VhYWZiYTA4NzNlY2VkNDRlYzlhZTFhNi4NCj4gV2hhdCB0aGUgcGF0
Y2ggaXMgZG9pbmcgaXMgZXNzZW50aWFsbHkgLWMgY2xlYW5zc3RhdGUgb24gYSBjYWNoZSB1c2Vk
IGJ5DQo+IHNldmVyYWwgY29uc3VtZXJzLiBUaGlzIG1ha2VzIGl0IGEgbm9uLXN0YXJ0ZXI6IHlv
dSBjYW4ndCByZW1vdmUgaXRlbXMgZnJvbQ0KPiBsaXZlIHNzdGF0ZSBsaWtlIHRoYXQuIE9uY2Ug
YW4gb2JqZWN0IGlzIGluIHRoZSBjYWNoZSwgaXQgbmVlZHMgdG8gYmUgcmVtb3ZlZA0KPiBvZmZs
aW5lLCBvciByZXBsYWNlZCBhdG9taWNhbGx5IGlmIGl0J3MgY29ycnVwdGVkLg0KSSBkaXNhZ3Jl
ZSwgd2UgY2FuIG92ZXJ3cml0ZSBiYWQgYXJ0aWZhY3QuIFlvY3RvIGluZGlyZWN0bHkgZG9lcyB0
aGF0IGFzIGl0IGhhcw0KdG8gcmVidWlsZCB0aGUgcGFja2FnZS4gVGhpcyBpcyAiYnkgZGVzaWdu
IiBiZWhhdmlvci4gQW5kIHRvIGJlIGhvbmVzdCwgdGhlcmUgaXMNCm5vIGRpZmZlcmVuY2UgYmV0
d2VlbiAoMSkgcmVidWlsZGluZyB0aGUgcGFja2FnZSBldmVyeSB0aW1lIGFuZCAoMikgb3Zlcndy
aXRpbmcNCnNzdGF0ZSBjYWNoZSBzbyBhbnkgb3RoZXIgYnVpbGQgY2FuIHJldXNlIGl0LiBJcyB0
aGVyZSBhbnkgY29uY2VybiBhcm91bmQNCnVwbG9hZGluZyBzdWNoIGZyZXNobHkgYnVpbHQgYXJ0
aWZhY3Q/DQoNCj4gQmVmb3JlIHdlIGRlY2lkZSBob3cgdG8gaGFuZGxlIGNvcnJ1cHRlZCBpdGVt
cywgaXQncyBwZXJoYXBzIGJldHRlciB0bw0KPiBjb25zaWRlciBmaXJzdCBob3cgdGhleSBzaG91
bGQgYmUgcmVwb3J0ZWQuIFRoZW4gdXNlcnMgY2FuIGRlY2lkZSB3aGF0IHRoZXkNCj4gd2FudCB0
byBkbyB3aXRoIHRoYXQgaW5mb3JtYXRpb24gd2l0aG91dCB5b2N0byBmb3JjaW5nIHNvbWV0aGlu
ZyBvbiB0aGVtLg0KPiBTbyBwbGVhc2U6IGhvdyBjYW4gSSBvYnNlcnZlIHRoZSBpc3N1ZT8NClRo
aXMgaXMgcmFuZG9tIHRoaW5nLCB3ZSBhcmUgbm90IGluIGNvbnRyb2wgb2YgZS5nLiBEUkFNIGJp
dCBmbGlwIGVycm9yLCB0aGV5DQpzaW1wbHkgaGFwcGVuLiBUbyBzaW11bGF0ZSB0aGUgc2l0dWF0
aW9uIHlvdSBjYW4gaW5qZWN0IGFuIGVycm9yIHlvdXJzZWxmIGJ5DQplLmcuLCBvdmVyd3JpdGlu
ZyB0aGUgcmFuZG9tIGJ5dGUgb2YgdGhlIHpzdGQgZmlsZSBiZWZvcmUgaXQgaXMgdXBsb2FkZWQu
DQoNCj5BbGV4DQoNClJlZ2FyZHMsDQpQcnplbXlzbGF3DQo=

