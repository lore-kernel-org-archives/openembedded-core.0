Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B573377002
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 01:12:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t841CQJZ005252
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Sep 2015 18:12:26 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.94]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0235.001;
	Thu, 3 Sep 2015 18:12:25 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/2] ifupdown: import recipe
Thread-Index: AQHQ5P39z4HvmmYs/Ea584SdJM1C1p4p2toAgAA2bQCAAAOtgIABGbsAgAACh4CAAIaYgIAAAVkAgAANcwCAAAangP//w5jA
Date: Fri, 4 Sep 2015 01:12:24 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF848240B00B@ALA-MBA.corp.ad.wrs.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
	<CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
	<1441282288.24871.113.camel@linuxfoundation.org>
	<CADkTA4N7yd=iNEJh4dY8Mdt75j25RV8LgCQAqsZ8zRw_h=o1wg@mail.gmail.com>
	<CAMKF1sp=Hiwt=oYfFy8Mhj4TMXj3x3Tykmg6mNLLtyEXV+TVwQ@mail.gmail.com>
	<1441312024.24871.135.camel@linuxfoundation.org>
	<584C7C63-C980-48F9-AFCF-8F18E8C8E442@gmail.com>
	<1441316341.24871.141.camel@linuxfoundation.org>
In-Reply-To: <1441316341.24871.141.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.76]
MIME-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Fri, 04 Sep 2015 01:12:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnIFttYWlsdG86b3BlbmVtYmVkZGVkLWNv
cmUtDQo+IGJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mIFJpY2hh
cmQgUHVyZGllDQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIgMDMsIDIwMTUgMjozOSBQTQ0K
PiBUbzogS2hlbSBSYWoNCj4gQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBv
ZS1jb3JlIGxheWVyOyBTbGF0ZXIsIEpvc2VwaDsgT3RhdmlvIFNhbHZhZG9yDQo+IFN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW29lLWNvcmVdW1BBVENIIDEvMl0gaWZ1cGRvd246IGltcG9ydCByZWNp
cGUNCj4gDQo+IE9uIFRodSwgMjAxNS0wOS0wMyBhdCAxNDoxNSAtMDcwMCwgS2hlbSBSYWogd3Jv
dGU6DQo+ID4gPiBPbiBTZXAgMywgMjAxNSwgYXQgMToyNyBQTSwgUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IE9u
IFRodSwgMjAxNS0wOS0wMyBhdCAxMzoyMiAtMDcwMCwgS2hlbSBSYWogd3JvdGU6DQo+ID4gPj4g
T24gVGh1LCBTZXAgMywgMjAxNSBhdCA1OjIwIEFNLCBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNo
ZmllbGRAZ21haWwuY29tPiB3cm90ZToNCj4gPiA+Pj4+IFRvIHB1dCB0aGlzIGFub3RoZXIgd2F5
LCBJIHRoaW5rIGl0IGlzIHByb2JhYmx5IHJlYXNvbmFibGUgdGhhdCB3ZQ0KPiA+ID4+Pj4gc2hv
dWxkIGJlIGFibGUgdG8gYnVpbGQgYW4gaW1hZ2UgZnJvbSBPRS1Db3JlIHdpdGggYmFzaWMgZnVu
Y3Rpb25hbGl0eQ0KPiA+ID4+Pj4gbGlrZSBuZXR3b3JraW5nIHdpdGhvdXQgYnVzeWJveD8NCj4g
PiA+Pj4NCj4gPiA+Pj4gVGhhdCdzIHdoYXQgSSdkIHN1cHBvcnQuIElmIGV2ZXJ5dGhpbmcgeW91
IG5lZWQgZm9yIHRoZSBmdW5jdGlvbmFsaXR5IHdpdGggYnVzeQ0KPiA+ID4+PiBib3ggaXMgaW4g
b2UtY29yZSwgdG8gbWUsIGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byBnbyBvdXRzaWRlIGNvcmUg
dG8gZ2V0IHRoYXQNCj4gPiA+Pj4gc2FtZSBmdW5jdGlvbmFsaXR5IHdpdGhvdXQgYnVzeWJveC4N
Cj4gPiA+Pg0KPiA+ID4+IGlycmVzcGVjdGl2ZSBvZiB0aGlzIGNoYW5nZS4gSSBzZWUgeWV0IGFu
b3RoZXIgY29uZmlndXJhdGlvbiB3aXRoIHRoaXMNCj4gPiA+PiBpbnRvIE9FLWNvcmUsIG92ZXJh
bGwgT0UtQ29yZSBzaG91bGQgZ2V0IHNtYWxsZXINCj4gPiA+PiBhbmQgY2FzZSBkb2VzIG5vdCBz
b3VuZCBjb252aW5jaW5nIHRvIG1lLiBZb3UgZG9udCB3YW50IHRvIHVzZSBidXN5Ym94DQo+ID4g
Pj4gaW4gYSBmYWlybHkgbGFyZ2UgaW1hZ2Ugd2hpY2ggaGFzIG90aGVyIEdQTHYyIHNvZnR3YXJl
IGluDQo+ID4gPj4gaXQuIFRoYXRzIGZpbmUgYnV0IGRvZXNudCBsb29rIGxpa2UgYSBjb21tb24g
dXNlY2FzZSB0byBtZQ0KPiA+ID4NCj4gPiA+IE5vYm9keSBtZW50aW9uZWQgR1BMdjIsIHRoYXQg
aXNuJ3QgcmVsZXZhbnQgaGVyZS4NCj4gPg0KPiA+IEkgYXNzdW1lZCB0aGF0cyBvbmUgcmVhc29u
IHRvIG5vdCBpbmNsdWRlIGl0LiBJIGFtIHRyeWluZyB0byB1bmRlcnN0YW5kIHJlYXNvbmluZyB0
bw0KPiA+IG5vdCBpbmNsdWRlIGJ1c3lib3guIE9yIGlzIGlzIGp1c3QgYmVjYXVzZSBpdHMgYSBw
b3N0ZXIgY2hpbGQgZm9yIGxpdGlnYXRpb25zLg0KPiANCj4gVGhlIGxpdGlnYXRpb24gaXNzdWVz
IHN1cnJvdW5kaW5nIGl0IGNlcnRhaW5seSBkb24ndCBkbyBpdCBhbnkgZmF2b3VycywNCj4gYnV0
IHRoZSBtYWluIGlzc3VlIGlzIHRoYXQgaWYgYnVzeWJveCBpcyB0aGVyZSwgd2UncmUgbm90IHNl
ZW4gYXMgYQ0KPiAicHJvcGVyL2Z1bGwiIGxpbnV4Lg0KPiANCj4gPiA+IEkgaGF2ZSBoZWFyZCBP
RSBiZWluZyBkaXNtaXNzZWQgc2luY2UgaXQgY2FuJ3QgcHJvZHVjZSBhbiBpbWFnZSB3aXRob3V0
DQo+ID4gPiBidXN5Ym94IGluIGl0LiBUaGUgaW1wbGljYXRpb24gaXMgd2UgY2FuJ3QgYnVpbGQg
ImJpZyIgTGludXgsIG9ubHkgc21hbGwNCj4gPiA+IGVtYmVkZGVkIHRoaW5ncy4gVGhlIHBpZWNl
cyB3ZSBuZWVkIGJ1c3lib3ggZm9yIGFyZSB0aW55IGFuZCBzaG91bGQgYmUNCj4gPiA+IGVhc3kg
dG8gcmVwbGFjZSAobGlrZSB0aGlzIGRvZXMpLg0KPiA+DQo+ID4gYXMgd2UgaW5jbHVkZSBvdGhl
ciBhbHRlcm5hdGl2ZSBwcm92aWRlcnMsIHRoZXkgZ2V0IHByZWZlcmVuY2Ugb3ZlciBidXN5Ym94
IGFwcGxldHMNCj4gPiBldmVuIGlmIGJ1c3lib3ggaXMgcGFydCBvZiBpdC4NCj4gDQo+IFRoZSBw
cm9ibGVtIGlzIHNvbWUgcGVvcGxlIGRvbid0IHdhbnQgYW55IGJ1c3lib3guDQo+IA0KPiA+ID4g
U28gSSBjYW4gc2VlIGEgZmFpcmx5IGNvbXBlbGxpbmcgYXJndW1lbnQgZm9yIE9FLUNvcmUgdG8g
YmUgYWJsZSB0bw0KPiA+ID4gZ2VuZXJhdGUgYSBidXN5Ym94IGZyZWUgaW1hZ2Ugd2l0aCBzdGFu
ZGFyZCBmdW5jdGlvbmFsaXR5IGp1c3QgZnJvbSBhIFBSDQo+ID4gPiBwZXJzcGVjdGl2ZS4gRnJv
bSB3aGF0IEkgZ2F0aGVyIHdlIGhhdmUgcGVvcGxlIHdpbGxpbmcgdG8gdGVzdCBhbmQNCj4gPiA+
IG1haW50YWluIGl0IHRvb+KApg0KPiA+DQo+ID4gUFIgSSBzZWUuIEkgd2FzIHNlYXJjaGluZyBm
b3IgdGVjaG5pY2FsIHJlYXNvbnMuDQo+IA0KPiBXZWxsLCBpdHMgdGVjaG5pY2FsIGJ1dCByZWxh
dGVkIHRvIHRoZSBpbWFnZSBvZiB0aGUgcHJvamVjdCB0b28uIENhbg0KPiBPRS1Db3JlIHRvZGF5
IHByb2R1Y2UgYSAic3RhbmRhcmQgbGludXggZGVza3RvcCIgdHlwZSAiZnVsbCIgZmVhdHVyZWQN
Cj4gZmlsZXN5c3RlbT8gSSBjYW5ub3QgaG9uZXN0bHkgc2F5IGl0IGNhbiBkdWUgdG8gdGhpcyBy
ZWFzb24sIGJ1c3lib3ggaGFzDQo+IHRvIGJlIHRoZXJlLiBUaGVyZSBhcmUgc29tZSBwZW9wbGUg
d2hvIGRvIGRpc2NvdW50IE9FIGJlY2F1c2Ugb2YgdGhpcy4NCj4gVGhpcyBpc24ndCBuZXcsIEkg
cmVtZW1iZXIgTWFyY2luIGFtb25nc3Qgb3RoZXJzIHdvcmtpbmcgb24gdGhpcy4gV2UncmUNCj4g
Y2xvc2UsIGJ1dCBjbG9zZSBkb2Vzbid0IG1lYW4gd2UgY2FuIGFuc3dlciAieWVzIiB0byB0aGUg
cXVlc3Rpb24gYW5kIEkNCj4gdGhpbmsgaXQgd291bGQgYmUgbmljZSB0byBiZSBhYmxlIHRvIGRv
IHNvIGNsZWFybHkuDQoNCkkgdGhpbmsgaWYgd2UgYXJlIHRyeWluZyB0byBhbGxvdyByZW1vdmlu
ZyBidXN5Ym94LCB0aGUgZnVuY3Rpb25hbGl0eSBuZWVkZWQNCnNob3VsZCBiZSBpbiBvZS1jb3Jl
LiAgVGh1cywgd2UgcHVsbCBydW4tcGFydHMgb3V0IG9mIGRlYmlhbnV0aWxzICh0aGlzIGlzIG5v
dw0KaW4gb2UtY29yZSwgbWFzdGVyKSwgcHVsbCBzdGFydC1zdG9wLWRhZW1vbiBmcm9tIGRwa2cg
KEkgc2VudCBhIHBhdGNoLCBidXQgSSBoYXZlIG5vdCBzZWVuDQphbnkgYWN0aW9uKSwgYW5kIHdl
IGFkZCBpZnVwZG93bi4gIHNoYWRvdyBpcyB0aGVyZSwgYXMgaXMgdXRpbC1saW51eC1ibGtpZC4N
Cg0KTWU/ICBJIGtpbmQgb2YgbGlrZSBidXN5Ym94LCBidXQgSSBhbHNvIHRoaW5rIHdlIHNob3Vs
ZCBwcm92aWRlIGltYWdlcyB3aXRob3V0IGl0Lg0KDQpKb2UNCg0KPiANCj4gQ2hlZXJzLA0KPiAN
Cj4gUmljaGFyZA0KPiANCj4gLS0NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+IE9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0K

