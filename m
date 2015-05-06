Return-Path: <steffen.pankratz@elektrobit.com>
Received: from smtpgw1fi.elektrobit.com (smtpgw1fi.elektrobit.com
	[194.136.18.128])
	by mail.openembedded.org (Postfix) with ESMTP id 00A8073F12
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 13:28:52 +0000 (UTC)
Received: from smtpgw1fi.ebgroup.elektrobit.com (localhost [127.0.0.1])
	by smtpgw1fi.elektrobit.com (8.14.4/8.14.4) with ESMTP id
	t46DSnas047525
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Wed, 6 May 2015 16:28:50 +0300
Received: (from defang@localhost)
	by smtpgw1fi.ebgroup.elektrobit.com (8.14.4/8.14.4/Submit) id
	t46DSgqG047466 for <openembedded-core@lists.openembedded.org>;
	Wed, 6 May 2015 16:28:42 +0300
X-Authentication-Warning: smtpgw1fi.ebgroup.elektrobit.com: defang set sender
	to <steffen.pankratz@elektrobit.com> using -f
Received: from encgw2fi.ebgroup.elektrobit.com ([172.16.0.99])
	by smtpgw1fi.ebgroup.elektrobit.com (envelope-sender
	<steffen.pankratz@elektrobit.com>) (MIMEDefang) with ESMTP id
	t46DSgi1047462; Wed, 06 May 2015 16:28:42 +0300
Received: from deeres07.ebgroup.elektrobit.com
	(deeres07.ebgroup.elektrobit.com [10.0.10.10])
	by encgw2fi.ebgroup.elektrobit.com (Postfix) with ESMTPS;
	Wed,  6 May 2015 16:28:42 +0300 (EEST)
Received: from DEERES07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001]) by
	deeres07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001%11]) with
	mapi id 14.03.0181.006; Wed, 6 May 2015 15:28:40 +0200
From: <Steffen.Pankratz@elektrobit.com>
To: <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] KBUILD_DEFCONFIG issue
Thread-Index: AdCHy8mNwemc7nqvT9WbRYFX+Nr+pgAHi+KAAASVqCA=
Date: Wed, 6 May 2015 13:28:39 +0000
Message-ID: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FCED@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBAB@deeres07.ebgroup.elektrobit.com>
	<CADkTA4PBkRTKFN7UFqZrpHTaZY2ANWqEQodu317XJer02p4mqw@mail.gmail.com>
In-Reply-To: <CADkTA4PBkRTKFN7UFqZrpHTaZY2ANWqEQodu317XJer02p4mqw@mail.gmail.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.26.198]
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.elektrobit.com [127.0.0.1]);
	Wed, 06 May 2015 16:28:50 +0300 (EEST)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.elektrobit.com [172.16.0.202]);
	Wed, 06 May 2015 16:28:42 +0300 (EEST)
X-Virus-Scanned: at elektrobit.com
X-Scanned-By: MIMEDefang 2.76 on 172.16.0.202
Cc: openembedded-core@lists.openembedded.org
Subject: Re: KBUILD_DEFCONFIG issue
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
X-List-Received-Date: Wed, 06 May 2015 13:28:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVjZSBB
c2hmaWVsZCBbbWFpbHRvOmJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0NCj4g
U2VudDogV2VkbmVzZGF5LCBNYXkgMDYsIDIwMTUgMjo0NyBQTQ0KDQpIaSBC
cnVjZQ0KDQo+ID4gSSBhbSBpbiB0aGUgcHJvY2VzcyBvZiBjcmVhdGluZyBh
IGJvYXJkIHN1cHBvcnQgcGFja2FnZSAoMSkgZm9yIE5WSURJQXMNCj4gSmV0
c29uIFRLMSBib2FyZCAoMikuDQo+ID4NCj4gPiBJbiBteSBrZXJuZWwgcmVj
aXBlIEkgYW0gdXNpbmcgJ0tCVUlMRF9ERUZDT05GSUcgPSAidGVncmFfZGVm
Y29uZmlnIicNCj4gYnV0IHRoZSBidWlsZCBmYWlsZWQgYWx3YXlzLg0KPiA+
DQo+ID4gSSB0aGluayB0aGUgaXNzdWUgaXMgaW4gZG9fa2VybmVsX21ldGFk
YXRhIChtZXRhL2NsYXNzZXMva2VybmVsLQ0KPiB5b2N0by5iYmNsYXNzKSwg
aWYgbm8gZGVmY29uZmlnIGV4aXN0cywgdGhlIGNvbmZpZyBzcGVjaWZpZWQg
aW4NCj4gS0JVSUxEX0RFRkNPTkZJRyBpcyBuZXZlciBjb3BpZWQuDQo+ID4g
QXR0YWNoZWQgeW91IHdpbGwgZmluZCBhIHBvc3NpYmxlIHBhdGNoIGZvciB0
aGlzIGlzc3VlLg0KPiANCj4gVGhlIHBhdGNoIGRvZXNuJ3QgbG9vayBxdWl0
ZSByaWdodCB0byBtZS4gSXQncyBnb2luZyB0byBpbmhpYml0IGFuIGluLXRy
ZWUNCj4gY29uZmlnIGZyb20gYmVpbmcgY29waWVkIG91dCB0byB0aGUgd29y
a2RpciB3aGVuIGl0IGlzIGRpZmZlcmVudCB0aGFuIHRoZQ0KPiBkZWZjb25m
aWcgdGhhdCBpcyBhbHJlYWR5IHNpdHRpbmcgdGhlcmUuDQoNClRoYXQgd2Fz
IGJ5IGludGVudGlvbi4gSSB3YXMgZm9sbG93aW5nIHRoZSBjb21tZW50cyBh
Ym92ZSB0aGUgY29kZSwNCndoaWNoIHNheSAnaWYgYSBkZWZjb25maWcgZXhp
c3RzIGl0IHdpbGwgbm90IGJlIG92ZXJ3cml0dGVuJy4NClNvIEkgY2hhbmdl
ZCB0aGUgY29kZSB0aGF0IGl0IGlzIG5ldmVyIG92ZXJ3cml0dGVuIGFuZCBr
ZXB0IHRoZSB3YXJuaW5nIGlmIHRoZSBjb25maWdzIGRpZmZlci4NCg0KDQo+
IFRoZSBjb25kaXRpb25zIHRoYXQgY3VycmVudGx5IGV4aXN0IHdoZXJlIGZv
ciBhIHNwZWNpZmljIHVzZSBjYXNlLCBhbmQgSSBjYW4NCj4gc2VlIHRoYXQg
aGF2aW5nIHRoZSBlbHNlIGNsYXVzZSB5b3UgYXJlIGFkZGluZyB3b3VsZCBi
ZSB1c2VmdWwgaWYgdGhlcmUgaXNuJ3QNCj4gYWxyZWFkeSBhIGRlZmNvbmZp
ZyBvbiB0aGUgU1JDX1VSSSAod2hpY2ggaXMgYSBkaWZmZXJlbnQgY2FzZSB0
aGVuIGl0IHdhcw0KPiBjcmVhdGVkIGRvIGhhbmRsZSkuDQo+IA0KPiBJIGNh
biB0YWtlIHlvdXIgcGF0Y2ggYW5kIHN0YWNrIGl0IG9uIG15IHF1ZXVlIHdp
dGggYSBmZXcgY2hhbmdlcywgYXNzdW1pbmcNCj4gdGhhdCBpcyBvayB3aXRo
IHlvdS4NCg0KRmVlbCBmcmVlIHRvIGRvIHNvLg0KDQoNCj4gPiBBbm90aGVy
LCBwcm9iYWJseSB1bnJlbGF0ZWQgcHJvYmxlbSBJIGZhY2UgcmlnaHQgbm93
IGlzLCB0aGF0IGJhc2ljYWxseQ0KPiBtb3N0IG9mIHRoZSBvcHRpb25zIG9m
IHRoZSB0ZWdyYV9kZWZjb25maWcgZ2V0IHJlbW92ZWQgYnkga2NvbmZfY2hl
Y2suDQo+ID4gVGhlIGtlcm5lbCBnZXRzIGJ1aWxkLCB0aGVyZSBhcmUgbm8g
d2FybmluZ3MgdGhhdCB0aGluZ3MgZ290IHJlbW92ZWQgYnV0DQo+IGluIHRo
ZSBmaWxlcyBpbiAubWV0YS9jZmcvc3RhbmRhcmQvamV0c29uLXRrMSAgSSBz
ZWUgZm9yIGV4YW1wbGU6DQo+ID4NCj4gPiBWYWx1ZSByZXF1ZXN0ZWQgZm9y
IENPTkZJR19BUkNIX1RFR1JBXzEyNF9TT0Mgbm90IGluIGZpbmFsIC5jb25m
aWcNCj4gUmVxdWVzdGVkIHZhbHVlOiAgQ09ORklHX0FSQ0hfVEVHUkFfMTI0
X1NPQz15IEFjdHVhbCB2YWx1ZToNCj4gPg0KPiA+IEFueSBpZGVhcz8NCj4g
DQo+IFRoZSBjaGVja2luZyBvZiB0aGUgZGVmY29uZmlnIGlzIGluaGliaXRl
ZCBvbiBwdXJwb3NlLiBJIG9ubHkgYWRkZWQgdGhlDQo+IGZ1bmN0aW9uYWxp
dHkgYXMgYW4gYXNzaXN0L2NydXRjaCBmb3IgZm9sa3MgdGhhdCBoYXZlbid0
IG1pZ3JhdGVkIHRvIGEgYmFzZQ0KPiBjb25maWcgKyBmcmFnbWVudHMuDQo+
IA0KPiBBIGRlZmNvbmZpZyBkb2VzIG5vdCBzcGVjaWZ5IHdoZXRoZXIgb3Ig
bm90IG9wdGlvbnMgYXJlIGltcG9ydGFudCBmb3IgdGhlDQo+IGJvYXJkIG9y
IG5vdCwgd2hldGhlciBvciBub3QgaXQgaXMgYSBmdWxsIGRlZmNvbmZpZyBv
ciBhIG1pbmltYWwgY29uZmlnLCBldGMuDQo+IFdpdGhvdXQgdGhhdA0KPiBl
eHRyYSBpbmZvcm1hdGlvbiBnZW5lcmF0aW5nIHNjcmVlbnMgZnVsbCBvZiB3
YXJuaW5ncyBpc24ndCB1c2VmdWwsIHNvIGl0IGlzbid0DQo+IGdlbmVyYXRl
ZCBhdCBhbGwuDQoNCkkgYW0gbm90IHF1aXRlIHN1cmUgd2hhdCB0aGUgY29y
cmVjdCB3YXkgd291bGQgYmUgdG8gY29udGludWUgYW5kIGdldCBhIGtlcm5l
bCB3aXRoIGV2ZXJ5dGhpbmcgSSBuZWVkIGFuZCB3YW50Lg0KVGhlIGNvbmZp
ZyBzcGVjaWZpZWQgaW4gS0JVSUxEX0RFRkNPTkZJRyBnZXRzIHN0cmlwcGVk
IG9mIG1hbnkgbmVjZXNzYXJ5IG9wdGlvbnMgbmVlZCBmb3IgdGhlIGJvYXJk
Lg0KU28gdGhpcyBpcyBvYnZpb3VzbHkgbm90IHRoZSByaWdodCBhcHByb2Fj
aC4NCkkgY291bGQgbm90IGZpbmQgZG9jdW1lbnRhdGlvbiBhYm91dCB3aHkg
b3B0aW9ucyBhbmQgd2hhdCBvcHRpb25zIGdldCByZW1vdmVkLg0KT3IgaW5z
dGVhZCBvZiB1c2luZyBLQlVJTERfREVGQ09ORklHLCBzaG91bGQgSSBzcGVj
aWZ5IGEgZGVmY29uZmlnIGluIFNSQ19VUkk/DQpPciBkbyBJIG5lZWQgdG8g
Y3JlYXRlIGZyYWdtZW50cyBmb3IgYWxsIHRoZSBvcHRpb25zIHdoaWNoIGdv
dCByZW1vdmVkPw0KDQoNCi0tIA0KVGhhbmtzIGFuZCByZWdhcmRzDQotU3Rl
ZmZlbg0KCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBsZWFzZSBub3RlOiBUaGlz
IGUtbWFpbCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24K
aW50ZW5kZWQgc29sZWx5IGZvciB0aGUgYWRkcmVzc2VlLiBJZiB5b3UgaGF2
ZSByZWNlaXZlZCB0aGlzCmUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIGRvIG5v
dCBkaXNjbG9zZSBpdCB0byBhbnlvbmUsIG5vdGlmeQp0aGUgc2VuZGVyIHBy
b21wdGx5LCBhbmQgZGVsZXRlIHRoZSBtZXNzYWdlIGZyb20geW91ciBzeXN0
ZW0uClRoYW5rIHlvdS4KCg==

