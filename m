Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1S5Nti-0005SN-8z
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 21:55:46 +0100
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q27Kl79g019140;
	Wed, 7 Mar 2012 14:47:07 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q27Kl7ow007290;
	Wed, 7 Mar 2012 14:47:07 -0600 (CST)
Received: from DFLE34.ent.ti.com ([fe80::c12:d795:2e56:2d02]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Wed, 7 Mar 2012 14:47:07 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv2] bluez4: add dependency on libcheck to
	enable test modules
Thread-Index: AQHM/F/aXhhwarKtCU2YqxeLaWtyFpZfTeQg
Date: Wed, 7 Mar 2012 20:47:06 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1012F0593CF@DFLE34.ent.ti.com>
References: <1331123568-23178-1-git-send-email-Chase.Maupin@ti.com>
	<1331124185.3539.20.camel@mattotaupa>
In-Reply-To: <1331124185.3539.20.camel@mattotaupa>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: BdHI CQSm CfsZ DtDx D8zV EZ2x E2MJ G8xN Hy06 JlD+ Ku0I
	KvFL PMD9 PxN+ QKRw U3i6; 2;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBjAG8AcgBlAEAAbABpAHMAdABzAC4AbwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALgBvAHIAZwA7AHAAYQB1AGwAZQBwAGEAbgB0AGUAcgBAAHUAcwBlAHIAcwAuAHMAbwB1AHIAYwBlAGYAbwByAGcAZQAuAG4AZQB0AA==;
	Sosha1_v1; 7; {DB38D66B-8970-41A6-9CE3-DE4492A9E266};
	YwBoAGEAcwBlAC4AbQBhAHUAcABpAG4AQAB0AGkALgBjAG8AbQA=; Wed,
	07 Mar 2012 20:47:03 GMT;
	UgBFADoAIABbAE8ARQAtAGMAbwByAGUAXQAgAFsAUABBAFQAQwBIAHYAMgBdACAAYgBsAHUAZQB6ADQAOgAgAGEAZABkACAAZABlAHAAZQBuAGQAZQBuAGMAeQAgAG8AbgAgAGwAaQBiAGMAaABlAGMAawAgAHQAbwAgAGUAbgBhAGIAbABlACAAdABlAHMAdAAgAG0AbwBkAHUAbABlAHMA
x-cr-puzzleid: {DB38D66B-8970-41A6-9CE3-DE4492A9E266}
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCHv2] bluez4: add dependency on libcheck to enable test modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2012 20:55:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIE1lbnplbCBbbWFpbHRv
OnBhdWxlcGFudGVyQHVzZXJzLnNvdXJjZWZvcmdlLm5ldF0NCj4gU2VudDogV2VkbmVzZGF5LCBN
YXJjaCAwNywgMjAxMiA2OjQzIEFNDQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IENjOiBNYXVwaW4sIENoYXNlDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29y
ZV0gW1BBVENIdjJdIGJsdWV6NDogYWRkIGRlcGVuZGVuY3kgb24gbGliY2hlY2sNCj4gdG8gZW5h
YmxlIHRlc3QgbW9kdWxlcw0KPiANCj4gQW0gTWl0dHdvY2gsIGRlbiAwNy4wMy4yMDEyLCAwNjoz
MiAtMDYwMCBzY2hyaWViIENoYXNlIE1hdXBpbjoNCj4gPiAqIFRoZSBsYXRlciB2ZXJzaW9ucyBv
ZiBibHVleiBzdWNoIGFzIDQuOTggcmVxdWlyZSBsaWJjaGVjaw0KPiA+ICAgaW4gb3JkZXIgdG8g
YnVpbGQgdGhlIHRlc3QgcGFja2FnZXMgYXMgZW5hYmxlZCBieSB0aGUNCj4gPiAgIC0tZW5hYmxl
LXRlc3Qgb3B0aW9uIHBhc3NlZCBpbiBFWFRSQV9PRUNPTkYuDQo+ID4gKiBGYWlsdXJlIHRvIGhh
dmUgdGhlIGxpYmNoZWNrIHBhY2thZ2UgYXZhaWxhbGJlIHJlc3VsdHMgaW4gdGhlDQo+IA0KPiBh
dmFpbGEqYmwqZQ0KDQpJJ2xsIGZpeCB0aGlzLiAgdGhhbmtzDQoNCj4gDQo+ID4gICBjb25maWd1
cmUgc2NyaXB0IGlnbm9yaW5nIHRoZSAtLWVuYWJsZS10ZXN0IG9wdGlvbiBhbmQgbm90DQo+ID4g
ICBidWlsZGluZyB0aGUgdGVzdCBtb2R1bGVzLg0KPiA+ICogQWRkaW5nIGxpYmNoZWNrLCB3aGlj
aCBpcyBncmVhdGVyIHRoYW4gdGhlIG1pbmltdW0gcmVxdWlyZWQNCj4gPiAgIHZlcnNpb24gb2Yg
dGhlIGNoZWNrIGxpYnJhcnkgb2YgMC45LjYgYWxsb3dzIGJ1aWxkaW5nIHRoZQ0KPiA+ICAgdGVz
dCBtb2R1bGVzLg0KPiA+ICogQnVpbGQgdGVzdGVkIGZvciBhbTMzNXgtZXZtIE1BQ0hJTkUgdHlw
ZSBhbmQgcnVuIHRpbWUgdGVzdGVkDQo+ID4gICBieSBiYWNrIHBvcnRpbmcgdGhpcyBmaXggdG8g
dGhlIG9lLWNsYXNzaWMgYW5kIGFyYWdvIHNldHVwDQo+ID4gICBhbmQgYm9vdGluZyBvbiBhbTMz
NXgtZXZtLg0KPiANCj4gRG8geW91IGhhdmUgYSBwYXRjaCBmb3IgdGhhdCBzbyB0aGF0IG90aGVy
cyBjYW4gcHJvZml0IGZyb20gdGhpcw0KPiB3b3JrDQo+IHRvbz8NCg0KSXQgaXMgYmVpbmcgbWFk
ZSBpbnRvIGFuIG9mZmljaWFsIHBhdGNoIGZvciBhcmFnby4gIEN1cnJlbnRseSBpdCBpcyBvbiBt
eSBidWlsZCBzZXR1cCBidXQgYSBwYXRjaCBpcyBwZW5kaW5nLg0KDQo+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IENoYXNlIE1hdXBpbiA8Q2hhc2UuTWF1cGluQHRpLmNvbT4NCj4gPiAtLS0NCj4gPiAq
IFVwZGF0ZWQgaW4gdmVyc2lvbiAyOg0KPiA+ICAgICAqIEJ1bXBlZCB0aGUgUFIgb2YgdGhlIGJs
dWV6NF80Ljk4IHJlY2lwZS4gIEkgYXNzdW1lIHRoaXMgaXMNCj4gdGhlDQo+ID4gICAgICAgd2F5
IHRvIGhhbmRsZSBjaGFuZ2VzIHRvIHRoZSAuaW5jIGZpbGUgc2luY2UgdGhlcmUgaXMgbm8NCj4g
SU5DX1BSDQo+ID4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVl
ei9ibHVlejQuaW5jICAgICB8ICAgIDIgKy0NCj4gPiAgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9ibHVlei9ibHVlejRfNC45OC5iYiB8ICAgIDIgKy0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlei9ibHVlejQuaW5jDQo+IGIvbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9ibHVlei9ibHVlejQuaW5jDQo+ID4gaW5kZXggOTE1ODY4Ny4uZmJiZTBi
ZiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6L2JsdWV6
NC5pbmMNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6L2JsdWV6NC5p
bmMNCj4gPiBAQCAtNyw3ICs3LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxlOi8vQ09Q
WUlORzttZDU9MTJmODg0ZDJhZTFmZjg3YzA5ZTViN2NjYzJjNGNhN2UgXA0KPiA+DQo+IGZpbGU6
Ly9DT1BZSU5HLkxJQjttZDU9ZmI1MDRiNjdjNTAzMzFmYzc4NzM0ZmVkOTBmYjBlMDkgXA0KPiA+
DQo+IGZpbGU6Ly9zcmMvbWFpbi5jO2JlZ2lubGluZT0xO2VuZGxpbmU9MjQ7bWQ1PTliYzU0Yjkz
Y2Q3ZTE3YmYwM2Y1MjUNCj4gMTNmMzlmOTI2ZSBcDQo+ID4NCj4gZmlsZTovL3NiYy9zYmMuYzti
ZWdpbmxpbmU9MTtlbmRsaW5lPTI1O21kNT0xYTQwNzgxZWQzMGQ1MGQ4NjM5MzIzYQ0KPiAxODRh
ZWIxOTEiDQo+ID4gLURFUEVORFMgPSAidWRldiBhbHNhLWxpYiBsaWJ1c2IgZGJ1cy1nbGliIGds
aWItMi4wIg0KPiA+ICtERVBFTkRTID0gInVkZXYgYWxzYS1saWIgbGlidXNiIGRidXMtZ2xpYiBn
bGliLTIuMCBsaWJjaGVjayINCj4gPiAgUkRFUEVORFNfJHtQTn0tZGV2ID0gImJsdWV6LWhjaWR1
bXAiDQo+ID4NCj4gPiAgQVNORUVERUQgPSAiIg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L2JsdWV6L2JsdWV6NF80Ljk4LmJiDQo+IGIvbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9ibHVlei9ibHVlejRfNC45OC5iYg0KPiA+IGluZGV4IDI0MTJiMWIuLjlhNGM2
ODIgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlei9ibHVl
ejRfNC45OC5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXovYmx1
ZXo0XzQuOTguYmINCj4gPiBAQCAtMSw2ICsxLDYgQEANCj4gPiAgcmVxdWlyZSBibHVlejQuaW5j
DQo+ID4NCj4gPiAtUFIgPSAicjEiDQo+ID4gK1BSID0gInIyIg0KPiA+DQo+ID4gIFNSQ19VUkkg
Kz0gImZpbGU6Ly9ibHVldG9vdGguY29uZiBcDQo+ID4gICAgICAgICAgICAgIGZpbGU6Ly9zYmNf
bW14LnBhdGNoIFwNCj4gDQo+IFJldmlld2VkLWJ5OiBQYXVsIE1lbnplbCA8cGF1bGVwYW50ZXJA
dXNlcnMuc291cmNlZm9yZ2UubmV0Pg0KPiANCj4gDQo+IFRoYW5rcywNCj4gDQo+IFBhdWwNCg==


