Received: from smtp24.4emm.com ([69.18.222.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QqcuE-0006zj-Ly
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 05:23:02 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB24.4emm.local ([::1]) with mapi id 14.01.0289.001; Mon, 8 Aug 2011
	23:14:21 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] gcc version mismatch in sdk generation
Thread-Index: AQHMVjS0DvpWAmzNDEmYd66tMQmhkZUTwNsQgABPOgD//8naAA==
Date: Tue, 9 Aug 2011 03:18:32 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF18332B@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF1832C5@MBX20.4emm.local>
	<CAMKF1spMJyBDYowk-Bb9szzAM2RuxoRm=GLnURz_qfryePccmw@mail.gmail.com>
	<840A81C1B782724A8EB52725BD519EFF1832E3@MBX20.4emm.local>
	<4E409C78.2060908@gmail.com>
In-Reply-To: <4E409C78.2060908@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: gcc version mismatch in sdk generation
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
X-List-Received-Date: Tue, 09 Aug 2011 03:23:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlc2RheSwgOSBBdWd1c3QgMjAxMSAxMDozMyBBTSwgS2hlbSBSYWogd3JvdGU6DQo+IE9u
IDA4LzA4LzIwMTEgMDY6NTIgUE0sIEphbWVzIExpbWJvdXJpcyB3cm90ZToNCj4gPiBPbiBUdWVz
ZGF5LCA5IEF1Z3VzdCAyMDExIDk6NDAgQU0sIEtoZW0gUmFqIHdyb3RlOg0KPiA+PiBPbiBNb24s
IEF1ZyA4LCAyMDExIGF0IDY6MzMgUE0sIEphbWVzIExpbWJvdXJpcw0KPiA+PiA8amFtZXNAZGln
aXRhbG1hdHRlci5jb20uYXU+IHdyb3RlOg0KPiA+Pj4gT24gVHVlIEF1ZyA5IDAxOjI1OjU1IENF
U1QgMjAxMSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+ID4+Pj4gT24gTW9uLCAyMDExLTA4LTA4
IGF0IDA1OjAyICswMDAwLCBKYW1lcyBMaW1ib3VyaXMgd3JvdGU6DQo+ID4+Pj4+IEhpLA0KPiA+
Pj4+Pg0KPiA+Pj4+PiBJbiBvZS1jb3JlLCB3aXRoIEFuZ3N0cm9tIDIwMTAueCwgZ2VuZXJhdGlu
ZyBhbiBzZGsgd2l0aDoNCj4gPj4+Pj4NCj4gPj4+Pj4gYml0YmFrZSBtZXRhLXRvb2xjaGFpbi1x
dGUNCj4gPj4+Pj4NCj4gPj4+Pj4gaXMgZ2l2aW5nIG1lIGEgdG9vbGNoYWluIHdpdGggZ2NjLTQu
Ni4xIGJpbmFyaWVzIGluIHRoZSBpNjg2DQo+ID4+Pj4+IHN5c3Jvb3QsIGJ1dCBnY2MtNC41LjQg
cnVudGltZSBsaWJyYXJpZXMgaW4gdGhlIGFybSAodGFyZ2V0KQ0KPiA+Pj4+PiBzeXNyb290LiBU
aGUgc2RrIGNhbid0IGxpbmsgdW50aWwgYSBzeW1saW5rIGlzIGluc3RhbGxlZCB0byB0cmljaw0K
PiA+Pj4+PiBpdCBpbnRvIHVzaW5nIHRoZSA0LjUuNCBsaWJyYXJpZXMuDQo+ID4+Pj4+DQo+ID4+
Pj4+IEkndmUgY2hlY2tlZCB0aGUgcHJlZmVycmVkIHZlcnNpb25zLCBidXQgdGhleSBzZWVtIHRv
IGJlIHNldA0KPiA+Pj4+PiBjb25zaXN0ZW50bHkgaW4gdGhlIGRpc3RvJ3MgY29uZiBmaWxlLCBh
dCBsZWFzdCBhcyBmYXIgYXMgSSBjYW4NCj4gPj4+Pj4gc2VlLg0KPiA+Pj4+Pg0KPiA+Pj4+PiAn
Yml0YmFrZSAtcyB8IGdyZXAgZ2NjJyBnaXZlczogZ2NjDQo+ID4+Pj4+IDo0LjUtcjM5LjErc3Zu
cjE3NjY0MCBnY2MtY3Jvc3MNCj4gPj4+Pj4gOjQuNS1yMzkuMitzdm5yMTc2NjQwIGdjYy1jcm9z
cy1jYW5hZGlhbi1hcm0NCj4gPj4+Pj4gOjQuNS1yMzkuMCtzdm5yMTc2NjQwIGdjYy1jcm9zcy1p
bml0aWFsDQo+ID4+Pj4+IDo0LjUtcjM5LjArc3ZucjE3NjY0MCBnY2MtY3Jvc3MtaW50ZXJtZWRp
YXRlDQo+ID4+Pj4+IDo0LjUtcjM5LjArc3ZucjE3NjY0MCBnY2MtY3Jvc3NzZGsNCj4gPj4+Pj4g
OjQuNS1yMzkuMCtzdm5yMTc2NjQwIGdjYy1jcm9zc3Nkay1pbml0aWFsDQo+ID4+Pj4+IDo0LjUt
cjM5LjArc3ZucjE3NjY0MCBnY2MtY3Jvc3NzZGstaW50ZXJtZWRpYXRlDQo+ID4+Pj4+IDo0LjUt
cjM5LjArc3ZucjE3NjY0MCBnY2MtcnVudGltZQ0KPiA+Pj4+PiA6NC41LXIzOS4xK3N2bnIxNzY2
NDAgZ2NjLXJ1bnRpbWUtbmF0aXZlc2RrDQo+ID4+Pj4+IDo0LjYuMStzdm5yMTc1NDU0LXI1IDo0
LjUtcjM5LjErc3ZucjE3NjY0MCBnY2NtYWtlZGVwDQo+ID4+Pj4+IDE6MS4wLjItcjMgbGliZ2Nj
IDo0LjUtcjM5LjErc3ZucjE3NjY0MCBsaWJnY2MtbmF0aXZlc2RrDQo+ID4+Pj4+IDo0LjYuMStz
dm5yMTc1NDU0LXIzICAgICA6NC41LXIzOS4xK3N2bnIxNzY2NDANCj4gPj4+Pg0KPiA+Pj4+IFRo
ZSBuYXRpdmVzZGsgYW5kIGNyb3Nzc2RrIHZlcnNpb25zIG5lZWQgdG8gbWF0Y2ggYXQgdGhlIHZl
cnkNCj4gPj4+PiBsZWFzdC4NCj4gPj4+Pg0KPiA+Pj4+IENoZWVycywNCj4gPj4+Pg0KPiA+Pj4+
IFJpY2hhcmQNCj4gPj4+DQo+ID4+PiBZZXMgLSB0aGF0J3Mgd2hhdCBpcyBzbyBjb25mdXNpbmcu
IFRoZXkgc2VlbSB0byBtYXRjaCBpbiB0aGUNCj4gPj4+IEFuZ3N0cm9tIGNvbmY6DQo+ID4+DQo+
ID4+DQo+ID4+IHdoYXQgZG9lcyBTREtHQ0NWRVJTSU9OIGNvbnRhaW4gPw0KPiA+Pg0KPiA+DQo+
ID4gSGksDQo+ID4NCj4gPiBIZXJlIGFyZSBlZGl0ZWQgaGlnaGxpZ2h0cyBmcm9tIGJpdGJha2Ug
LWUgfCBncmVwIC1pIEdDQzoNCj4gPg0KPiANCj4gQ2FuIHlvdSB0cnkgYXR0YWNoZWQgcGF0Y2gg
PyB0aGlzIGlzIGZvciBtZXRhLWFuZ3N0cm9tDQo+IA0KPiBUaHgNCj4gDQo+IC0gLUtoZW0NCg0K
VGhhbmtzIEtoZW0sIHRoYXQgZGlkIHRoZSB0cmljay4NCg0KSmFtZXMNCg==


