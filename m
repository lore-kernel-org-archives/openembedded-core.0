Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.4068.1588907091522281490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 20:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Y4KmePfo5mNP3tWcbGLSjDLEvKjZkawZx9rUTsg0uKzQjZMOAdJNxKgBXfqmrseAKXJGZA1w/H
 +Buv23v0tjMw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 20:04:50 -0700
IronPort-SDR: FHXZymAiClA00gik/7le+r0i585HPqdbJU027NW2S1lmmYhHVHRUP7FhX/wxJDjyndMhieknVL
 j+1zmuVBEoxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="264160868"
Received: from kmsmsx154.gar.corp.intel.com ([172.21.73.14])
  by orsmga006.jf.intel.com with ESMTP; 07 May 2020 20:04:49 -0700
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.234]) by
 KMSMSX154.gar.corp.intel.com ([169.254.12.226]) with mapi id 14.03.0439.000;
 Fri, 8 May 2020 11:04:48 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "wenlin.kang@windriver.com"
	<wenlin.kang@windriver.com>
Subject: Re: [OE-core][zeus][PATCH] populate_sdk_base.bbclass: fix warning: name not matched
Thread-Topic: [OE-core][zeus][PATCH] populate_sdk_base.bbclass: fix warning:
 name not matched
Thread-Index: AQHWI4L33dJXzImcn0KGfD/y69n/8aic/bqA
Date: Fri, 8 May 2020 03:04:48 +0000
Message-ID: <2bad1f8d88656b45f7776d7124bd59ea0629e7f8.camel@intel.com>
References: <20200506084629.120567-1-wenlin.kang@windriver.com>
In-Reply-To: <20200506084629.120567-1-wenlin.kang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.68.177]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC6682E45F3E4645815A884056F6DB0A@intel.com>
Content-Transfer-Encoding: base64

SGksDQoNCk9uIFdlZCwgMjAyMC0wNS0wNiBhdCAwMTo0NiAtMDcwMCwgd2VubGluLmthbmdAd2lu
ZHJpdmVyLmNvbSB3cm90ZToNCj4gRml4IGJlbG93IHdhcm5pbmc6DQo+IHppcCB3YXJuaW5nOiBu
YW1lIG5vdCBtYXRjaGVkOiBzeXNyb290cy9hYXJjaDY0LXdycy0NCj4gbGludXgvZXRjL3VkZXYv
cnVsZXMuZC84MC1uZXQtc2V0dXAtbGluay5ydWxlcw0KPiB6aXAgd2FybmluZzogbmFtZSBub3Qg
bWF0Y2hlZDogc3lzcm9vdHMvYWFyY2g2NC13cnMtDQo+IGxpbnV4L2V0Yy90bXBmaWxlcy5kL2V0
Yy5jb25mDQo+IHppcCB3YXJuaW5nOiBuYW1lIG5vdCBtYXRjaGVkOiBzeXNyb290cy9hYXJjaDY0
LXdycy0NCj4gbGludXgvZXRjL3RtcGZpbGVzLmQvaG9tZS5jb25mDQo+IHppcCB3YXJuaW5nOiBu
YW1lIG5vdCBtYXRjaGVkOiBzeXNyb290cy9hYXJjaDY0LXdycy0NCj4gbGludXgvZXRjL3N5c3Rl
bWQvbmV0d29yay84MC13aXJlZC5uZXR3b3JrDQo+IHppcCB3YXJuaW5nOiBuYW1lIG5vdCBtYXRj
aGVkOiBzeXNyb290cy9hYXJjaDY0LXdycy0NCj4gbGludXgvZXRjL3Jlc29sdi5jb25mDQo+IHpp
cCB3YXJuaW5nOiBuYW1lIG5vdCBtYXRjaGVkOiBzeXNyb290cy9hYXJjaDY0LXdycy1saW51eC9l
dGMvbXRhYg0KPiB6aXAgd2FybmluZzogbmFtZSBub3QgbWF0Y2hlZDogc3lzcm9vdHMvYWFyY2g2
NC13cnMtbGludXgvZXRjL3Jlc29sdi0NCj4gY29uZi5zeXN0ZW1kDQo+IHppcCB3YXJuaW5nOiBu
YW1lIG5vdCBtYXRjaGVkOiBzeXNyb290cy9hYXJjaDY0LXdycy1saW51eC92YXIvbG9jaw0KPiAN
Cg0KSXMgdGhpcyBzcGVjaWZpYyB0byB6ZXVzPyBJIGRvbid0IHNlZSB0aGlzIGNoYW5nZSBpbiBt
YXN0ZXIvZHVuZmVsbC4NCkl0J2QgYmUgZ3JlYXQgaWYgeW91IGNvdWxkIGluY2x1ZGUgbW9yZSBk
ZXRhaWxzIGluIGNvbW1pdCBtZXNzYWdlDQpleHBsYWluaW5nIHdoYXQgaXMgaGFwcGVuaW5nLg0K
DQpUaGFua3MsDQoNCkFudWoNCg0KPiBTaWduZWQtb2ZmLWJ5OiBXZW5saW4gS2FuZyA8d2VubGlu
LmthbmdAd2luZHJpdmVyLmNvbT4NCj4gLS0tDQo+ICBtZXRhL2NsYXNzZXMvcG9wdWxhdGVfc2Rr
X2Jhc2UuYmJjbGFzcyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9wb3B1bGF0ZV9z
ZGtfYmFzZS5iYmNsYXNzDQo+IGIvbWV0YS9jbGFzc2VzL3BvcHVsYXRlX3Nka19iYXNlLmJiY2xh
c3MNCj4gaW5kZXggZDAzNDY1YjZmYy4uYjVjMDA0ZDgzMiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9j
bGFzc2VzL3BvcHVsYXRlX3Nka19iYXNlLmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFzc2VzL3Bv
cHVsYXRlX3Nka19iYXNlLmJiY2xhc3MNCj4gQEAgLTU1LDcgKzU1LDcgQEAgcHl0aG9uICgpIHsN
Cj4gICAgICAgICBkLnNldFZhcignU0RLX0FSQ0hJVkVfREVQRU5EUycsICd6aXAtbmF0aXZlJykN
Cj4gICAgICAgICAjIFNES19BUkNISVZFX0NNRCB1c2VkIHRvIGdlbmVyYXRlIGFyY2hpdmVkIHNk
aw0KPiAke1RPT0xDSEFJTl9PVVRQVVROQU1FfS4ke1NES19BUkNISVZFX1RZUEV9IGZyb20gaW5w
dXQgZGlyDQo+ICR7U0RLX09VVFBVVH0vJHtTREtQQVRIfSB0byBvdXRwdXQgZGlyICR7U0RLREVQ
TE9ZRElSfQ0KPiAgICAgICAgICMgcmVjb21tYW5kIHRvIGNkIGludG8gaW5wdXQgZGlyIGZpcnN0
IHRvIGF2b2lkIGFyY2hpdmUgd2l0aA0KPiBidWlsZHBhdGgNCj4gLSAgICAgICBkLnNldFZhcign
U0RLX0FSQ0hJVkVfQ01EJywgJ2NkICR7U0RLX09VVFBVVH0vJHtTREtQQVRIfTsgemlwDQo+IC1y
ICR7U0RLREVQTE9ZRElSfS8ke1RPT0xDSEFJTl9PVVRQVVROQU1FfS4ke1NES19BUkNISVZFX1RZ
UEV9IC4nKQ0KPiArICAgICAgIGQuc2V0VmFyKCdTREtfQVJDSElWRV9DTUQnLCAnY2QgJHtTREtf
T1VUUFVUfS8ke1NES1BBVEh9OyB6aXANCj4gLXIgLXkgJHtTREtERVBMT1lESVJ9LyR7VE9PTENI
QUlOX09VVFBVVE5BTUV9LiR7U0RLX0FSQ0hJVkVfVFlQRX0gLicpDQo+ICAgICAgZWxzZToNCj4g
ICAgICAgICBkLnNldFZhcignU0RLX0FSQ0hJVkVfREVQRU5EUycsICd4ei1uYXRpdmUnKQ0KPiAg
ICAgICAgIGQuc2V0VmFyKCdTREtfQVJDSElWRV9DTUQnLCAnY2QgJHtTREtfT1VUUFVUfS8ke1NE
S1BBVEh9OyB0YXINCj4gJHtTREtUQVJPUFRTfSAtY2YgLSAuIHwgeHogLVQgMCAtOSA+DQo+ICR7
U0RLREVQTE9ZRElSfS8ke1RPT0xDSEFJTl9PVVRQVVROQU1FfS4ke1NES19BUkNISVZFX1RZUEV9
JykNCj4gDQo=
