Return-Path: <clemens.lang@bmw-carit.de>
Received: from cit-hm8-gw01.bmw-carit.de (cit-hm8-mail01.bmw-carit.de
	[212.118.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id AEFD3731C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 08:47:19 +0000 (UTC)
Received: from [172.20.0.50] (port=53698 helo=cit-hm8-mail01.bmw-carit.de)
	by cit-hm8-gw01.bmw-carit.de with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.82_1-5b7a7c0-XX) (envelope-from <Clemens.Lang@bmw-carit.de>)
	id 1bc7Ma-0005XR-24; Tue, 23 Aug 2016 10:47:16 +0200
Received: from ULM-DC01.bmw-carit.intra ([fe80::41cf:62be:aacc:1aad]) by
	ULM-DC01.bmw-carit.intra ([fe80::41cf:62be:aacc:1aad%11]) with mapi id
	14.03.0123.003; Tue, 23 Aug 2016 10:47:16 +0200
X-CTCH-RefID: str=0001.0A0C0204.57BC0D94.0190, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
From: Clemens Lang <Clemens.Lang@bmw-carit.de>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [PATCH] cmake.bbclass: call cmake with a relative path
Thread-Index: AQHR/IFVivsVBn4O4kO+qukmahhspqBVBFCAgAEXL4A=
Date: Tue, 23 Aug 2016 08:47:15 +0000
Message-ID: <FEF4FC9A-75CF-4EBD-A4E4-A7AE2941668E@bmw-carit.de>
References: <2e948106-ac15-2c16-5bb6-f234079be725@embed.me.uk>
	<20160822142711.26042-1-clemens.lang@bmw-carit.de>
	<20160822142711.26042-2-clemens.lang@bmw-carit.de>
	<CAJTo0Lb1+G+cF2tFkVpA14w_1borw95msdtiRPDUPz0-RPMPDQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lb1+G+cF2tFkVpA14w_1borw95msdtiRPDUPz0-RPMPDQ@mail.gmail.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.20.20.86]
MIME-Version: 1.0
Cc: Thomas Witt <Thomas.Witt@bmw.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: call cmake with a relative path
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
X-List-Received-Date: Tue, 23 Aug 2016 08:47:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <C240F8121E98A448A639071ABC180011@bmw-carit.de>
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4gd3JvdGU6DQoN
Cj4gU2VlbXMgdG8gd29yayBpbiBteSB0ZXN0aW5nLCBidXQgdGhpcyBicmVha3MgcGlnbGl0J3Mg
YmFzaC1jb21wbGV0aW9uICANCj4gbG9naWMgYWdhaW4gKHJlc3VsdGluZyBpbiBpdCBub3QgaW5z
dGFsbGluZyB0aGUgZmlsZSkuICBJZiB5b3UgdW5kZXJzdGFuZCAgDQo+IGNtYWtlIHRoZW4gaGF2
aW5nIGEgcXVpY2sgbG9vayBhdCB0aGF0IHdvdWxkIGJlIG11Y2ggYXBwcmVjaWF0ZWQuICBGb3Ig
IA0KPiByZWZlcmVuY2UgdGhlIGJ1aWxkaGlzdG9yeS1kaWZmIGxvZyBpczoNCj4NCj4gcGFja2Fn
ZXMvY29yZWk3LTY0LXBva3ktbGludXgvcGlnbGl0L3BpZ2xpdC1iYXNoLWNvbXBsZXRpb246IEZJ
TEVMSVNUOiAgDQo+IHJlbW92ZWQgYWxsIGl0ZW1zICIvdXNyL3NoYXJlL2Jhc2gtY29tcGxldGlv
bi9jb21wbGV0aW9ucy9waWdsaXQ6DQoNCkkgdGhpbmsgdGhpcyBpcyBub3QgcmVsYXRlZCB0byB0
aGUgcGF0Y2ggYW5kIGN1cnJlbnRseSB0b2dnbGVzIHJhbmRvbWx5ICANCmRlcGVuZGluZyBvbiB3
aGV0aGVyIGJhc2gtY29tcGxldGlvbuKAmXMgZG9fcG9wdWxhdGVfc3lzcm9vdCBnZXRzIHJ1biBi
ZWZvcmUgIA0KcGlnbGl04oCZcyBkb19jb25maWd1cmUuIE5vdGhpbmcgc2VlbXMgdG8gZGVwZW5k
IG9uICANCmJhc2gtY29tcGxldGlvbjpkb19wb3B1bGF0ZV9zeXNyb290Lg0KDQogICQ+IGJpdGJh
a2UgLWcgcGlnbGl0DQogICQ+IGdyZXAgLWMgLS0gJy0+ICJiYXNoLWNvbXBsZXRpb25cLmRvX3Bv
cHVsYXRlX3N5c3Jvb3QnIHRhc2stZGVwZW5kcy5kb3QNCiAgMA0KDQoNCkhUSCwNCi0tIA0KQ2xl
bWVucyBMYW5nIOKAoiBEZXZlbG9wbWVudCBTcGVjaWFsaXN0DQpCTVcgQ2FyIElUIEdtYkgg4oCi
IExpc2UtTWVpdG5lci1TdHIuIDE0IOKAoiA4OTA4MSBVbG0g4oCiIGh0dHA6Ly9ibXctY2FyaXQu
Y29tDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpCTVcgQ2FyIElUIEdtYkgNCkdlc2Now6RmdHNmw7xocmVy
OiBNaWNoYWVsIFfDvHJ0ZW5iZXJnZXIgdW5kIEFsZXhpcyBUcm9saW4NClNpdHogdW5kIFJlZ2lz
dGVyZ2VyaWNodDogTcO8bmNoZW4gSFJCIDEzNDgxMA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K

