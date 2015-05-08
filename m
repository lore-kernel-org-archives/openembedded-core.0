Return-Path: <steffen.pankratz@elektrobit.com>
Received: from smtpgw1fi.elektrobit.com (smtpgw1fi.elektrobit.com
	[194.136.18.128])
	by mail.openembedded.org (Postfix) with ESMTP id 71F6860034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 09:38:34 +0000 (UTC)
Received: from smtpgw1fi.ebgroup.elektrobit.com (localhost [127.0.0.1])
	by smtpgw1fi.elektrobit.com (8.14.4/8.14.4) with ESMTP id
	t489cYqs034030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Fri, 8 May 2015 12:38:34 +0300
Received: (from defang@localhost)
	by smtpgw1fi.ebgroup.elektrobit.com (8.14.4/8.14.4/Submit) id
	t489cVbC034002 for <openembedded-core@lists.openembedded.org>;
	Fri, 8 May 2015 12:38:31 +0300
X-Authentication-Warning: smtpgw1fi.ebgroup.elektrobit.com: defang set sender
	to <steffen.pankratz@elektrobit.com> using -f
Received: from encgw2fi.ebgroup.elektrobit.com ([172.16.0.99])
	by smtpgw1fi.ebgroup.elektrobit.com (envelope-sender
	<steffen.pankratz@elektrobit.com>) (MIMEDefang) with ESMTP id
	t489cVQl033998; Fri, 08 May 2015 12:38:31 +0300
Received: from deeres07.ebgroup.elektrobit.com
	(deeres07.ebgroup.elektrobit.com [10.0.10.10])
	by encgw2fi.ebgroup.elektrobit.com (Postfix) with ESMTPS;
	Fri,  8 May 2015 12:38:31 +0300 (EEST)
Received: from DEERES07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001]) by
	deeres07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001%11]) with
	mapi id 14.03.0181.006; Fri, 8 May 2015 11:38:30 +0200
From: <Steffen.Pankratz@elektrobit.com>
To: <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] KBUILD_DEFCONFIG issue
Thread-Index: AdCHy8mNwemc7nqvT9WbRYFX+Nr+pgAHi+KAAASVqCD//+lLgP//2fSwgAAscYD//r0JQIADNbQA//715wA=
Date: Fri, 8 May 2015 09:38:29 +0000
Message-ID: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939021B@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBAB@deeres07.ebgroup.elektrobit.com>
	<CADkTA4PBkRTKFN7UFqZrpHTaZY2ANWqEQodu317XJer02p4mqw@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364938FCED@deeres07.ebgroup.elektrobit.com>
	<CADkTA4Ob1CLekk=Y+u+AfBZq_E4_9xHJbFc548Po0Utsx-tdRA@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364938FD16@deeres07.ebgroup.elektrobit.com>
	<CADkTA4NuJG11-9O6EJoEE0QE85Ng4WCWiuqo4dxnnkonAVSphA@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364938FF09@deeres07.ebgroup.elektrobit.com>
	<CADkTA4NMXVCcTnJhozF2_AN5OwhLr9ZidMThm4HW7UFqb7F2iA@mail.gmail.com>
In-Reply-To: <CADkTA4NMXVCcTnJhozF2_AN5OwhLr9ZidMThm4HW7UFqb7F2iA@mail.gmail.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.26.198]
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.elektrobit.com [127.0.0.1]);
	Fri, 08 May 2015 12:38:34 +0300 (EEST)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.elektrobit.com [172.16.0.202]);
	Fri, 08 May 2015 12:38:31 +0300 (EEST)
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
X-List-Received-Date: Fri, 08 May 2015 09:38:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVjZSBB
c2hmaWVsZCBbbWFpbHRvOmJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0NCj4g
U2VudDogVGh1cnNkYXksIE1heSAwNywgMjAxNSA5OjQ1IFBNDQo+IFRvOiBQ
YW5rcmF0eiwgU3RlZmZlbg0KPiBDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lv
bnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXINCj4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXSBLQlVJTERfREVGQ09ORklHIGlzc3VlDQoNCg0KPiA+PiA+PiA+
PiA+IEkgYW0gaW4gdGhlIHByb2Nlc3Mgb2YgY3JlYXRpbmcgYSBib2FyZCBz
dXBwb3J0IHBhY2thZ2UgKDEpDQo+ID4+ID4+ID4+ID4gZm9yIE5WSURJQXMN
Cj4gPj4gPj4gPj4gSmV0c29uIFRLMSBib2FyZCAoMikuDQo+ID4NCj4gPiBb
Li4uXQ0KPiA+DQo+ID4NCj4gPj4gPj4gPj4gPiBBbm90aGVyLCBwcm9iYWJs
eSB1bnJlbGF0ZWQgcHJvYmxlbSBJIGZhY2UgcmlnaHQgbm93IGlzLCB0aGF0
DQo+ID4+ID4+ID4+ID4gYmFzaWNhbGx5DQo+ID4+ID4+ID4+IG1vc3Qgb2Yg
dGhlIG9wdGlvbnMgb2YgdGhlIHRlZ3JhX2RlZmNvbmZpZyBnZXQgcmVtb3Zl
ZCBieQ0KPiA+PiBrY29uZl9jaGVjay4NCj4gPj4gPj4gPj4gPiBUaGUga2Vy
bmVsIGdldHMgYnVpbGQsIHRoZXJlIGFyZSBubyB3YXJuaW5ncyB0aGF0IHRo
aW5ncyBnb3QNCj4gPj4gPj4gPj4gPiByZW1vdmVkIGJ1dA0KPiA+PiA+PiA+
PiBpbiB0aGUgZmlsZXMgaW4gLm1ldGEvY2ZnL3N0YW5kYXJkL2pldHNvbi10
azEgIEkgc2VlIGZvciBleGFtcGxlOg0KPiA+PiA+PiA+PiA+DQo+ID4+ID4+
ID4+ID4gVmFsdWUgcmVxdWVzdGVkIGZvciBDT05GSUdfQVJDSF9URUdSQV8x
MjRfU09DIG5vdCBpbiBmaW5hbA0KPiA+PiA+PiA+PiA+IC5jb25maWcNCj4g
Pj4gPj4gPj4gUmVxdWVzdGVkIHZhbHVlOiAgQ09ORklHX0FSQ0hfVEVHUkFf
MTI0X1NPQz15IEFjdHVhbCB2YWx1ZToNCj4gPj4gPj4gPj4gPg0KPiA+PiA+
PiA+PiA+IEFueSBpZGVhcz8NCj4gPj4gPj4gPj4NCj4gPj4gPj4gPj4gVGhl
IGNoZWNraW5nIG9mIHRoZSBkZWZjb25maWcgaXMgaW5oaWJpdGVkIG9uIHB1
cnBvc2UuIEkgb25seQ0KPiA+PiA+PiA+PiBhZGRlZCB0aGUgZnVuY3Rpb25h
bGl0eSBhcyBhbiBhc3Npc3QvY3J1dGNoIGZvciBmb2xrcyB0aGF0DQo+ID4+
ID4+ID4+IGhhdmVuJ3QgbWlncmF0ZWQgdG8gYSBiYXNlIGNvbmZpZyArIGZy
YWdtZW50cy4NCj4gPj4gPj4gPj4NCj4gPj4gPj4gPj4gQSBkZWZjb25maWcg
ZG9lcyBub3Qgc3BlY2lmeSB3aGV0aGVyIG9yIG5vdCBvcHRpb25zIGFyZQ0K
PiA+PiA+PiA+PiBpbXBvcnRhbnQgZm9yIHRoZSBib2FyZCBvciBub3QsIHdo
ZXRoZXIgb3Igbm90IGl0IGlzIGEgZnVsbA0KPiA+PiA+PiA+PiBkZWZjb25m
aWcgb3IgYSBtaW5pbWFsIGNvbmZpZywNCj4gPj4gPj4gZXRjLg0KPiA+PiA+
PiA+PiBXaXRob3V0IHRoYXQNCj4gPj4gPj4gPj4gZXh0cmEgaW5mb3JtYXRp
b24gZ2VuZXJhdGluZyBzY3JlZW5zIGZ1bGwgb2Ygd2FybmluZ3MgaXNuJ3QN
Cj4gPj4gPj4gPj4gdXNlZnVsLCBzbyBpdCBpc24ndCBnZW5lcmF0ZWQgYXQg
YWxsLg0KPiA+PiA+PiA+DQo+ID4+ID4+ID4gSSBhbSBub3QgcXVpdGUgc3Vy
ZSB3aGF0IHRoZSBjb3JyZWN0IHdheSB3b3VsZCBiZSB0byBjb250aW51ZQ0K
PiA+PiA+PiA+IGFuZCBnZXQgYQ0KPiA+PiA+PiBrZXJuZWwgd2l0aCBldmVy
eXRoaW5nIEkgbmVlZCBhbmQgd2FudC4NCj4gPj4gPj4gPiBUaGUgY29uZmln
IHNwZWNpZmllZCBpbiBLQlVJTERfREVGQ09ORklHIGdldHMgc3RyaXBwZWQg
b2YgbWFueQ0KPiA+PiA+PiBuZWNlc3Nhcnkgb3B0aW9ucyBuZWVkIGZvciB0
aGUgYm9hcmQuDQo+ID4+ID4+ID4gU28gdGhpcyBpcyBvYnZpb3VzbHkgbm90
IHRoZSByaWdodCBhcHByb2FjaC4NCj4gPj4gPj4NCj4gPj4gPj4gSXQgd291
bGQgYmUgdGhlIGtlcm5lbCBjb25maWd1cmF0aW9uIHN1YnN5c3RlbSB0aGF0
IGlzIHN0cmlwcGluZw0KPiA+PiA+PiB0aGUgY2hhbmdlcyB3aGVuIGl0IHBy
b2Nlc3NlcyB0aGUgLmNvbmZpZyAoaS5lLiBub3RoaW5nIGluIHRoZQ0KPiA+
PiA+PiBZb2N0byBwcm9jZXNzaW5nIG9mIHRob3NlIHNhbWUgZnJhZ21lbnRz
KS4NCj4gPj4gPj4NCj4gPj4gPj4gSWYgeW91IG1hbnVhbGx5IGNvcHkgdGhl
IGRlZmNvbmZpZyBpbnRvIHBsYWNlIGFuZCBkbyBhIG1ha2UNCj4gPj4gPj4g
b2xkY29uZmlnLCBhcmUgeW91IHNlZWluZyBsb3RzIG9mIGRlbHRhIGFuZCBx
dWVzdGlvbnMgYmVpbmcgYXNrZWQgPw0KPiA+PiA+DQo+ID4+ID4gSSBkaWQg
bm90IHNlZSBhbnkgcXVlc3Rpb25zIG9yIGRlbHRhczoNCj4gPj4gPg0KPiA+
PiA+IGJpdGJha2UgdmlydHVhbC9rZXJuZWwgLWMgZGV2c2hlbGwNCj4gPj4g
Pg0KPiA+PiA+IFRoZW46DQo+ID4+ID4NCj4gPj4gPiBjcCBhcmNoL2FybS9j
b25maWdzL3RlZ3JhX2RlZmNvbmZpZyAuY29uZmlnIG1ha2Ugb2xkY29uZmln
DQo+ID4+DQo+ID4+IG9kZC4gSXMgdGhpcyBzb21ldGhpbmcgSSBjYW4gcmVw
cm9kdWNlIGxvY2FsbHkgPyBJZiB5b3UgZW1haWwgbWUgdGhlDQo+ID4+IGRl
dGFpbHMsIEknbGwgcG9rZSBhdCBpdCBhbmQgb2ZmZXIgc29tZSBzdWdnZXN0
aW9ucy4NCj4gPg0KPiA+IFRoYW5rIHlvdSB2ZXJ5IG11Y2ggaW4gYWR2YW5j
ZSBCcnVjZS4NCj4gPg0KPiA+IEkgdGhpbmsgdGhlIGVhc2llc3QgdGhpbmcg
d291bGQgYmUgdG8gZ2V0IHBva3kgKGRpenp5IGJyYW5jaCksIG1ldGEtDQo+
IG9wZW5lbWJlZGRlZCAoZGl6enkgYnJhbmNoKSBhbmQgbWV0YS1qZXRzb24t
dGsxICgxKS4NCj4gPiBBcHBseSB0aGUgcGF0Y2ggSSBzZW5kICh0byBwYXRj
aCBrZXJuZWwteW9jdG8uYmJjbGFzcykgYW5kIGJ1aWxkIGFuIGltYWdlDQo+
IGZvciBNQUNISU5FIGpldHNvbi10azEuDQo+ID4gSSB3YXMgYnVpbGRpbmcg
dGhlIGNvcmUtaW1hZ2Utd2VzdG9uLCBidXQgSSB0aGluayB0aGUgdHlwZSBv
ZiBpbWFnZSB1c2VkLA0KPiBkb2Vzbid0IG1hdHRlciBpbiByZWdhcmRzIHRv
IG15IGtlcm5lbCBpc3N1ZS4NCj4gPg0KPiANCj4gSSd2ZSBzb3J0ZWQgdGhp
cyBvdXQsIHVzaW5nIHRoZSBrZXJuZWwgdHJlZSB5b3UgYXJlIHVzaW5nLCBh
bmQgYSBoYWNrZWQgdXANCj4gcWVtdWFybSBjb25maWd1cmF0aW9uIChzaW1w
bGVyIC4uIGxlc3MgcmVidWlsZHMpLg0KPiANCj4gVHVybnMgb3V0IHRoYXQg
dGhlIGluLXRyZWUgZGVmY29uZmlnIGRvZXNuJ3QgbGlrZSB0aGUgZGVmYXVs
dCBtb2RlIHdlIGhhdmUNCj4gZm9yIGRlY29uZmlnIHByb2Nlc3NpbmcgKGFs
bG5vY29uZmlnKSwgc2luY2UgaXQgaXMgb2YgdGhlIG1pbmltYWwgdmFyaWV0
eSAobm90IGENCj4gcHJvYmxlbSkuDQo+IA0KPiBXaXRoIHRoZSBwYXRjaCB0
byBjb3B5IHRoZSBkZWNvbmZpZyBpbnRvIHBsYWNlIChJJ2xsIHBvc3QgdGhh
dCBzb29uIGZvcg0KPiBtZXJnaW5nKSwgYW5kIHRoZSBmb2xsb3dpbmcgYWRk
aXRpb24gdG8gdGhlIGxpbnV4LXlvY3RvLWN1c3RvbSByZWNpcGU6DQo+IA0K
PiAgIEtDT05GSUdfTU9ERT0iLS1hbGxkZWZjb25maWciDQo+IA0KPiANCj4g
SSdtIG5vdyBzZWVpbmcgdGhlIFRFR1JBIG9wdGlvbnMgbWFrZSBpdCBpbnRv
IHRoZSBjb25maWcuDQo+IA0KPiBHaXZlIHRoYXQgYSB0cnksIGFuZCBsZXQg
bWUga25vdyBob3cgaXQgZ29lcy4gSSBhbSBydW5uaW5nIHNvbWUgb3RoZXIg
bG9jYWwNCj4gY2hhbmdlcyBoZXJlLCBidXQgdGhleSB3b24ndCBpbXBhY3Qg
dGhpcyBwYXJ0IG9mIHRoZSBwcm9jZXNzLg0KDQpBZGRpbmcgJyBLQ09ORklH
X01PREU9Ii0tYWxsZGVmY29uZmlnIicgZGlkIHRoZSB0cmljay4NClRoYW5r
IHlvdSB2ZXJ5IG11Y2ggQnJ1Y2UuDQoNCg0KLS0gDQpIYXZlIGEgbmljZSB3
ZWVrZW5kDQotU3RlZmZlbg0KCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBsZWFz
ZSBub3RlOiBUaGlzIGUtbWFpbCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwg
aW5mb3JtYXRpb24KaW50ZW5kZWQgc29sZWx5IGZvciB0aGUgYWRkcmVzc2Vl
LiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzCmUtbWFpbCBpbiBlcnJvciwg
cGxlYXNlIGRvIG5vdCBkaXNjbG9zZSBpdCB0byBhbnlvbmUsIG5vdGlmeQp0
aGUgc2VuZGVyIHByb21wdGx5LCBhbmQgZGVsZXRlIHRoZSBtZXNzYWdlIGZy
b20geW91ciBzeXN0ZW0uClRoYW5rIHlvdS4KCg==

