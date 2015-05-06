Return-Path: <steffen.pankratz@elektrobit.com>
Received: from smtpgw1fi.elektrobit.com (smtpgw1fi.elektrobit.com
	[194.136.18.128])
	by mail.openembedded.org (Postfix) with ESMTP id 799F773D48
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 13:57:39 +0000 (UTC)
Received: from smtpgw1fi.ebgroup.elektrobit.com (localhost [127.0.0.1])
	by smtpgw1fi.elektrobit.com (8.14.4/8.14.4) with ESMTP id
	t46Dveug010989
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Wed, 6 May 2015 16:57:40 +0300
Received: (from defang@localhost)
	by smtpgw1fi.ebgroup.elektrobit.com (8.14.4/8.14.4/Submit) id
	t46DvWjw010952 for <openembedded-core@lists.openembedded.org>;
	Wed, 6 May 2015 16:57:32 +0300
X-Authentication-Warning: smtpgw1fi.ebgroup.elektrobit.com: defang set sender
	to <steffen.pankratz@elektrobit.com> using -f
Received: from encgw2fi.ebgroup.elektrobit.com ([172.16.0.99])
	by smtpgw1fi.ebgroup.elektrobit.com (envelope-sender
	<steffen.pankratz@elektrobit.com>) (MIMEDefang) with ESMTP id
	t46DvW3N010948; Wed, 06 May 2015 16:57:32 +0300
Received: from deeres07.ebgroup.elektrobit.com
	(deeres07.ebgroup.elektrobit.com [10.0.10.10])
	by encgw2fi.ebgroup.elektrobit.com (Postfix) with ESMTPS;
	Wed,  6 May 2015 16:57:32 +0300 (EEST)
Received: from DEERES07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001]) by
	deeres07.ebgroup.elektrobit.com ([fe80::d1e0:156:8cce:d001%11]) with
	mapi id 14.03.0181.006; Wed, 6 May 2015 15:57:28 +0200
From: <Steffen.Pankratz@elektrobit.com>
To: <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] KBUILD_DEFCONFIG issue
Thread-Index: AdCHy8mNwemc7nqvT9WbRYFX+Nr+pgAHi+KAAASVqCD//+lLgP//2fSw
Date: Wed, 6 May 2015 13:57:28 +0000
Message-ID: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FD16@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364938FBAB@deeres07.ebgroup.elektrobit.com>
	<CADkTA4PBkRTKFN7UFqZrpHTaZY2ANWqEQodu317XJer02p4mqw@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364938FCED@deeres07.ebgroup.elektrobit.com>
	<CADkTA4Ob1CLekk=Y+u+AfBZq_E4_9xHJbFc548Po0Utsx-tdRA@mail.gmail.com>
In-Reply-To: <CADkTA4Ob1CLekk=Y+u+AfBZq_E4_9xHJbFc548Po0Utsx-tdRA@mail.gmail.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.26.198]
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.elektrobit.com [127.0.0.1]);
	Wed, 06 May 2015 16:57:40 +0300 (EEST)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.12
	(smtpgw1fi.elektrobit.com [172.16.0.202]);
	Wed, 06 May 2015 16:57:32 +0300 (EEST)
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
X-List-Received-Date: Wed, 06 May 2015 13:57:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcnVjZSBB
c2hmaWVsZCBbbWFpbHRvOmJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbV0NCj4g
U2VudDogV2VkbmVzZGF5LCBNYXkgMDYsIDIwMTUgMzozNyBQTQ0KPiBUbzog
UGFua3JhdHosIFN0ZWZmZW4NCj4gQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Np
b25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gS0JVSUxEX0RFRkNPTkZJRyBpc3N1ZQ0KDQoNCj4gPj4gPiBJ
IGFtIGluIHRoZSBwcm9jZXNzIG9mIGNyZWF0aW5nIGEgYm9hcmQgc3VwcG9y
dCBwYWNrYWdlICgxKSBmb3INCj4gPj4gPiBOVklESUFzDQo+ID4+IEpldHNv
biBUSzEgYm9hcmQgKDIpLg0KPiA+PiA+DQo+ID4+ID4gSW4gbXkga2VybmVs
IHJlY2lwZSBJIGFtIHVzaW5nICdLQlVJTERfREVGQ09ORklHID0gInRlZ3Jh
X2RlZmNvbmZpZyInDQo+ID4+IGJ1dCB0aGUgYnVpbGQgZmFpbGVkIGFsd2F5
cy4NCj4gPj4gPg0KPiA+PiA+IEkgdGhpbmsgdGhlIGlzc3VlIGlzIGluIGRv
X2tlcm5lbF9tZXRhZGF0YSAobWV0YS9jbGFzc2VzL2tlcm5lbC0NCj4gPj4g
eW9jdG8uYmJjbGFzcyksIGlmIG5vIGRlZmNvbmZpZyBleGlzdHMsIHRoZSBj
b25maWcgc3BlY2lmaWVkIGluDQo+ID4+IEtCVUlMRF9ERUZDT05GSUcgaXMg
bmV2ZXIgY29waWVkLg0KPiA+PiA+IEF0dGFjaGVkIHlvdSB3aWxsIGZpbmQg
YSBwb3NzaWJsZSBwYXRjaCBmb3IgdGhpcyBpc3N1ZS4NCj4gPj4NCj4gPj4g
VGhlIHBhdGNoIGRvZXNuJ3QgbG9vayBxdWl0ZSByaWdodCB0byBtZS4gSXQn
cyBnb2luZyB0byBpbmhpYml0IGFuDQo+ID4+IGluLXRyZWUgY29uZmlnIGZy
b20gYmVpbmcgY29waWVkIG91dCB0byB0aGUgd29ya2RpciB3aGVuIGl0IGlz
DQo+ID4+IGRpZmZlcmVudCB0aGFuIHRoZSBkZWZjb25maWcgdGhhdCBpcyBh
bHJlYWR5IHNpdHRpbmcgdGhlcmUuDQo+ID4NCj4gPiBUaGF0IHdhcyBieSBp
bnRlbnRpb24uIEkgd2FzIGZvbGxvd2luZyB0aGUgY29tbWVudHMgYWJvdmUg
dGhlIGNvZGUsDQo+ID4gd2hpY2ggc2F5ICdpZiBhIGRlZmNvbmZpZyBleGlz
dHMgaXQgd2lsbCBub3QgYmUgb3ZlcndyaXR0ZW4nLg0KPiA+IFNvIEkgY2hh
bmdlZCB0aGUgY29kZSB0aGF0IGl0IGlzIG5ldmVyIG92ZXJ3cml0dGVuIGFu
ZCBrZXB0IHRoZSB3YXJuaW5nIGlmDQo+IHRoZSBjb25maWdzIGRpZmZlci4N
Cj4gPg0KPiANCj4gSSdsbCBhcHBseSB0aGUgY2hhbmdlIGhlcmUgYW5kIGhh
dmUgYW5vdGhlciBsb29rLCBidXQgdGhhdCdzIG5vdCB3aGF0IEkgc2VlDQo+
IChqdXN0IGxvb2tpbmcgYXQgdGhlIHNuaXBwZXQpLCBzaW5jZSB3ZSBkbyB3
YW50IHRvIG92ZXJ3cml0ZSBpdCBpZiB0aGUgY29uZmlncw0KPiBhcmUgZGlm
ZmVyZW50Lg0KPiANCj4gSSBjYW4gdHdlYWsgdGhlIGNvbW1lbnQgdG8gYmUg
Y2xlYXIgb24gdGhhdCBwb2ludC4NCg0KT2suDQoNCg0KPiA+PiBUaGUgY29u
ZGl0aW9ucyB0aGF0IGN1cnJlbnRseSBleGlzdCB3aGVyZSBmb3IgYSBzcGVj
aWZpYyB1c2UgY2FzZSwNCj4gPj4gYW5kIEkgY2FuIHNlZSB0aGF0IGhhdmlu
ZyB0aGUgZWxzZSBjbGF1c2UgeW91IGFyZSBhZGRpbmcgd291bGQgYmUNCj4g
Pj4gdXNlZnVsIGlmIHRoZXJlIGlzbid0IGFscmVhZHkgYSBkZWZjb25maWcg
b24gdGhlIFNSQ19VUkkgKHdoaWNoIGlzIGENCj4gPj4gZGlmZmVyZW50IGNh
c2UgdGhlbiBpdCB3YXMgY3JlYXRlZCBkbyBoYW5kbGUpLg0KPiA+Pg0KPiA+
PiBJIGNhbiB0YWtlIHlvdXIgcGF0Y2ggYW5kIHN0YWNrIGl0IG9uIG15IHF1
ZXVlIHdpdGggYSBmZXcgY2hhbmdlcywNCj4gPj4gYXNzdW1pbmcgdGhhdCBp
cyBvayB3aXRoIHlvdS4NCj4gPg0KPiA+IEZlZWwgZnJlZSB0byBkbyBzby4N
Cj4gPg0KPiA+DQo+ID4+ID4gQW5vdGhlciwgcHJvYmFibHkgdW5yZWxhdGVk
IHByb2JsZW0gSSBmYWNlIHJpZ2h0IG5vdyBpcywgdGhhdA0KPiA+PiA+IGJh
c2ljYWxseQ0KPiA+PiBtb3N0IG9mIHRoZSBvcHRpb25zIG9mIHRoZSB0ZWdy
YV9kZWZjb25maWcgZ2V0IHJlbW92ZWQgYnkga2NvbmZfY2hlY2suDQo+ID4+
ID4gVGhlIGtlcm5lbCBnZXRzIGJ1aWxkLCB0aGVyZSBhcmUgbm8gd2Fybmlu
Z3MgdGhhdCB0aGluZ3MgZ290DQo+ID4+ID4gcmVtb3ZlZCBidXQNCj4gPj4g
aW4gdGhlIGZpbGVzIGluIC5tZXRhL2NmZy9zdGFuZGFyZC9qZXRzb24tdGsx
ICBJIHNlZSBmb3IgZXhhbXBsZToNCj4gPj4gPg0KPiA+PiA+IFZhbHVlIHJl
cXVlc3RlZCBmb3IgQ09ORklHX0FSQ0hfVEVHUkFfMTI0X1NPQyBub3QgaW4g
ZmluYWwgLmNvbmZpZw0KPiA+PiBSZXF1ZXN0ZWQgdmFsdWU6ICBDT05GSUdf
QVJDSF9URUdSQV8xMjRfU09DPXkgQWN0dWFsIHZhbHVlOg0KPiA+PiA+DQo+
ID4+ID4gQW55IGlkZWFzPw0KPiA+Pg0KPiA+PiBUaGUgY2hlY2tpbmcgb2Yg
dGhlIGRlZmNvbmZpZyBpcyBpbmhpYml0ZWQgb24gcHVycG9zZS4gSSBvbmx5
IGFkZGVkDQo+ID4+IHRoZSBmdW5jdGlvbmFsaXR5IGFzIGFuIGFzc2lzdC9j
cnV0Y2ggZm9yIGZvbGtzIHRoYXQgaGF2ZW4ndCBtaWdyYXRlZA0KPiA+PiB0
byBhIGJhc2UgY29uZmlnICsgZnJhZ21lbnRzLg0KPiA+Pg0KPiA+PiBBIGRl
ZmNvbmZpZyBkb2VzIG5vdCBzcGVjaWZ5IHdoZXRoZXIgb3Igbm90IG9wdGlv
bnMgYXJlIGltcG9ydGFudCBmb3INCj4gPj4gdGhlIGJvYXJkIG9yIG5vdCwg
d2hldGhlciBvciBub3QgaXQgaXMgYSBmdWxsIGRlZmNvbmZpZyBvciBhIG1p
bmltYWwgY29uZmlnLA0KPiBldGMuDQo+ID4+IFdpdGhvdXQgdGhhdA0KPiA+
PiBleHRyYSBpbmZvcm1hdGlvbiBnZW5lcmF0aW5nIHNjcmVlbnMgZnVsbCBv
ZiB3YXJuaW5ncyBpc24ndCB1c2VmdWwsDQo+ID4+IHNvIGl0IGlzbid0IGdl
bmVyYXRlZCBhdCBhbGwuDQo+ID4NCj4gPiBJIGFtIG5vdCBxdWl0ZSBzdXJl
IHdoYXQgdGhlIGNvcnJlY3Qgd2F5IHdvdWxkIGJlIHRvIGNvbnRpbnVlIGFu
ZCBnZXQgYQ0KPiBrZXJuZWwgd2l0aCBldmVyeXRoaW5nIEkgbmVlZCBhbmQg
d2FudC4NCj4gPiBUaGUgY29uZmlnIHNwZWNpZmllZCBpbiBLQlVJTERfREVG
Q09ORklHIGdldHMgc3RyaXBwZWQgb2YgbWFueQ0KPiBuZWNlc3Nhcnkgb3B0
aW9ucyBuZWVkIGZvciB0aGUgYm9hcmQuDQo+ID4gU28gdGhpcyBpcyBvYnZp
b3VzbHkgbm90IHRoZSByaWdodCBhcHByb2FjaC4NCj4gDQo+IEl0IHdvdWxk
IGJlIHRoZSBrZXJuZWwgY29uZmlndXJhdGlvbiBzdWJzeXN0ZW0gdGhhdCBp
cyBzdHJpcHBpbmcgdGhlIGNoYW5nZXMNCj4gd2hlbiBpdCBwcm9jZXNzZXMg
dGhlIC5jb25maWcgKGkuZS4gbm90aGluZyBpbiB0aGUgWW9jdG8gcHJvY2Vz
c2luZyBvZiB0aG9zZQ0KPiBzYW1lIGZyYWdtZW50cykuDQo+IA0KPiBJZiB5
b3UgbWFudWFsbHkgY29weSB0aGUgZGVmY29uZmlnIGludG8gcGxhY2UgYW5k
IGRvIGEgbWFrZSBvbGRjb25maWcsIGFyZQ0KPiB5b3Ugc2VlaW5nIGxvdHMg
b2YgZGVsdGEgYW5kIHF1ZXN0aW9ucyBiZWluZyBhc2tlZCA/DQoNCkkgZGlk
IG5vdCBzZWUgYW55IHF1ZXN0aW9ucyBvciBkZWx0YXM6DQoNCmJpdGJha2Ug
dmlydHVhbC9rZXJuZWwgLWMgZGV2c2hlbGwNCg0KVGhlbjoNCg0KY3AgYXJj
aC9hcm0vY29uZmlncy90ZWdyYV9kZWZjb25maWcgLmNvbmZpZw0KbWFrZSBv
bGRjb25maWcNCg0KDQotLSANClJlZ2FyZHMNCi1TdGVmZmVuDQoKCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUGxlYXNlIG5vdGU6IFRoaXMgZS1tYWlsIG1heSBj
b250YWluIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbgppbnRlbmRlZCBzb2xl
bHkgZm9yIHRoZSBhZGRyZXNzZWUuIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRo
aXMKZS1tYWlsIGluIGVycm9yLCBwbGVhc2UgZG8gbm90IGRpc2Nsb3NlIGl0
IHRvIGFueW9uZSwgbm90aWZ5CnRoZSBzZW5kZXIgcHJvbXB0bHksIGFuZCBk
ZWxldGUgdGhlIG1lc3NhZ2UgZnJvbSB5b3VyIHN5c3RlbS4KVGhhbmsgeW91
LgoK

