Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 5629 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 20 Nov 2014 22:42:08 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0123.outbound.protection.outlook.com [65.55.169.123])
	by mail.openembedded.org (Postfix) with ESMTP id 506DD65C78
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 22:42:08 +0000 (UTC)
Received: from BLUPR05MB037.namprd05.prod.outlook.com (10.255.210.145) by
	BLUPR05MB039.namprd05.prod.outlook.com (10.255.210.148) with Microsoft
	SMTP Server (TLS) id 15.1.16.15; Thu, 20 Nov 2014 21:08:18 +0000
Received: from BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.224]) by
	BLUPR05MB037.namprd05.prod.outlook.com ([169.254.7.224]) with mapi id
	15.01.0026.003; Thu, 20 Nov 2014 21:08:18 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] Resetting PR for PR service
Thread-Index: AdAE93K3zIhl51tUQwmy17JexpScUwABc08AAAG74nA=
Date: Thu, 20 Nov 2014 21:08:17 +0000
Message-ID: <d9330da860234d7bbb490ab116094742@BLUPR05MB037.namprd05.prod.outlook.com>
References: <1273c0d32efd40dda18770de4d5e90b4@BLUPR05MB037.namprd05.prod.outlook.com>
	<1416513894.2068.13.camel@linuxfoundation.org>
In-Reply-To: <1416513894.2068.13.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 01C60B1000889801C60C5D
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB039;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB039;
x-forefront-prvs: 0401647B7F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(377424004)(199003)(51704005)(189002)(377454003)(13464003)(66066001)(19580395003)(19580405001)(20776003)(64706001)(4396001)(74316001)(108616004)(86362001)(92566001)(40100003)(101416001)(54356999)(77156002)(99396003)(50986999)(110136001)(76176999)(46102003)(2656002)(107046002)(87936001)(76576001)(120916001)(122556002)(99286002)(106356001)(21056001)(95666004)(105586002)(33646002)(31966008)(97736003)(77096003)(62966003)(24736002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR05MB039;
	H:BLUPR05MB037.namprd05.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Resetting PR for PR service
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
X-List-Received-Date: Thu, 20 Nov 2014 22:42:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmljaGFyZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJk
IFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNl
bnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAyMCwgMjAxNCAzOjA1IFBNDQo+IFRvOiBCcnlhbiBFdmVu
c29uDQo+IENjOiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gUmVzZXR0aW5nIFBSIGZvciBQUiBzZXJ2aWNlDQo+IA0KPiBP
biBUaHUsIDIwMTQtMTEtMjAgYXQgMTk6NDMgKzAwMDAsIEJyeWFuIEV2ZW5zb24gd3JvdGU6DQo+
ID4gSSBhbSBvbiBwb2t5L2R5bGFuIGFuZCBJIGFtIHVzaW5nIHRoZSBQUiBzZXJ2aWNlIGZvciB0
aGUgZmlyc3QgdGltZS4gIEF0IHRoaXMNCj4gdGltZSBJIGFtIG1ha2luZyBzb21lIGNvc21ldGlj
IC5iYmFwcGVuZCByZWNpcGUgY2hhbmdlcyAocmVvcmRlcmluZyBhbmQNCj4gc3BhY2luZyB3aXRo
IG5vIGFmZmVjdCBvbiB0aGUgZmluYWwgYnVpbHQgcGFja2FnZSkuICBPZiBjb3Vyc2UsIGFmdGVy
IHJlYnVpbGRpbmcNCj4gdGhlIHJlY2lwZSB0aGUgUFIgc2VydmljZSBidW1wZWQgdGhlIFBSIHNp
bmNlIGl0IHNhdyBhIGNoYW5nZSBpbiB0aGUNCj4gbWV0YWRhdGEuICBJIGRvbid0IHdhbnQgdGhp
cyBwYWNrYWdlIFBSIHRvIGNoYW5nZSBhdCB0aGlzIHRpbWU7IHRoZSBwYWNrYWdlDQo+IHdvdWxk
ICJ1cGdyYWRlIiBvbiB0aGUgbmV4dCByZWxlYXNlIGV2ZW4gdGhvdWdoIHRoZSBjb250ZW50cyBh
cmUgaWRlbnRpY2FsLg0KPiBJIHdvdWxkIGxpa2UgdG8gcmV2ZXJ0IHRoZSBQUiBmb3IgdGhpcyBw
YWNrYWdlIGJ1dCBJIGFtIGhhdmluZyBkaWZmaWN1bHR5Lg0KPiA+DQo+ID4gSSBoYWQgbm90IHBy
ZXZpb3VzbHkgdXNlZCB0aGUgUFIgc2VydmljZSwgc28gdGhlIG9sZCBwYWNrYWdlIG5hbWUgd2Fz
DQo+IGZvb18xLjAuMC1yMF9hcm05MjZlanN0ZS5pcGsuICBBZnRlciBiZWluZyByZWJ1aWx0LCB0
aGUgbmV3IHBhY2thZ2UgbmFtZQ0KPiB3YXMgZm9vXzEuMC4wLXIwLjBfYXJtOTI2ZWpzdGUuaXBr
IChhZGRlZCB0aGUgLjApLiAgSSB0cmllZCB0byByZXZlcnQgdGhlIFBSDQo+IGZvciB0aGlzIHBh
Y2thZ2UgYXMgZm9sbG93czoNCj4gPiAxLiBFeHBvcnQgdGhlIGN1cnJlbnQgUFIgc2VydmljZSBk
YXRhIGJ5IGNhbGxpbmcgImJpdGJha2UtcHJzZXJ2LXRvb2wgZXhwb3J0DQo+IHByc2Vydl9leHBv
cnQuaW5jIg0KPiA+IDIuIE1vdmVkIHRoZSBmaWxlIGNhY2hlL3Byc2Vydi5zcWxpdGUzIHRvIGVm
ZmVjdGl2ZWx5IGRlbGV0ZSB0aGUgUFIgU2VydmljZQ0KPiBkYXRhYmFzZS4NCj4gPiAzLiBPcGVu
ZWQgcHJzZXJ2X2V4cG9ydC5pbmMgYW5kIHJlbW92ZWQgdGhlIHR3byBsaW5lcyByZWxhdGVkIHRv
IHBhY2thZ2UNCj4gZm9vLg0KPiA+IDQuIENsZWFuZWQgcGFja2FnZSBmb28gYnkgY2FsbGluZyAi
Yml0YmFrZSAtYyBjbGVhbiBmb28iDQo+IA0KPiBUaGlzIGlzIGp1c3Qgb2ZmIHRoZSB0b3Agb2Yg
bXkgaGVhZCBidXQgaGF2ZSB5b3UgdHJpZWQgYSAtYyBjbGVhbnNzdGF0ZSBoZXJlPw0KPiANCg0K
SSdkIG1pc3JlYWQgeW91ciByZXNwb25zZSBhbmQgSSB0cmllZCAtYyBjbGVhbmFsbCBhbmQgdGhh
dCBkaWRuJ3QgaGVscC4gIEkgdHJpZWQgYWdhaW4gdGhpcyB0aW1lIGRpc2FibGluZyB0aGUgUFIg
c2VydmljZSBhZnRlciB0aGUgZXhwb3J0LCB0aGVuICJiaXRiYWtlIC1jIGNsZWFuYWxsIGZvbyIg
Zm9sbG93ZWQgYnkgImJpdGJha2UgZm9vIi4gIEkgdGhlbiBnb3QgdGhlIGVycm9ycyBzdGF0aW5n
IHRoZSBQUiB3ZW50IGJhY2t3YXJkcyBhbmQgdGhlIFBSIGhhZCByZXZlcnRlZCB0byB3aGF0IEkg
d2FzIGxvb2tpbmcgZm9yLg0KDQpJIHRoaW5rIHRoaXMgaXMgYSBzcGVjaWFsIGNhc2Ugc2luY2Ug
dGhlcmUgaXMgbm8gLjAgYWRkZWQgeWV0LiAgSSBzdXNwZWN0IGlmIEkgd2FudGVkIHRvIGJhY2sg
dXAgYSBQUiB0aGF0IGhhZCBhIHZhbHVlIGFscmVhZHkgKHN1Y2ggYXMgZ29pbmcgZnJvbSAuMyB0
byAuMikgSSBjb3VsZCBqdXN0IGNoYW5nZSB0aGUgdmFsdWUgaW4gdGhlIGltcG9ydGVkIHRleHQg
YW5kIGl0J2QgZG8gd2hhdCBJIHN1c3BlY3RlZC4gIEkgaGF2ZSBhIGZldyBtb3JlIHBhY2thZ2Vz
IHRoYXQgd2VyZSBtb2RpZmllZCB0aGF0IEkgZG9uJ3Qgd2FudCB0aGUgUFIgdG8gY2hhbmdlLCBz
byBJIGhhdmUgYSBmZXcgbW9yZSBpdGVtcyBJIGNvdWxkIGRvIHNvbWUgdGVzdGluZyB3aXRoLg0K
DQo+ID4gNS4gSW1wb3J0ZWQgdGhlIFBSIHNlcnZpY2UgZGF0YSBieSBjYWxsaW5nICJiaXRiYWtl
LXByc2Vydi10b29sIGltcG9ydA0KPiBwcnNlcnZfZXhwb3J0LmluYyINCj4gPiA2LiBSZWJ1aWx0
IHBhY2thZ2UgZm9vIGJ5IGNhbGxpbmcgImJpdGJha2UgZm9vIg0KPiA+DQo+ID4gQWZ0ZXIgc3Rl
cCA2LCB0aGUgcmVzdWx0aW5nIHBhY2thZ2UgbmFtZSB3YXMgc3RpbGwgZm9vXzEuMC4wLQ0KPiBy
MC4wX2FybTkyNmVqc3RlLmlway4gIElzIHRoZXJlIGEgc3RlcCBJJ20gbWlzc2luZyBpbiByZXZl
cnRpbmcgdGhlIFBSIHZhbHVlPw0KPiA+DQo+ID4gT24gYW5vdGhlciBub3RlLCBJIGRpc2NvdmVy
ZWQgdGhhdCB0byBpbXBvcnQgdGhlIHByc2VydiBkYXRhIHRoZQ0KPiA+IGZpbGVuYW1lIG5lZWRz
IHRvIGVuZCB3aXRoIC5pbmMsIG90aGVyd2lzZSB5b3UgZ2V0IGFuIGVycm9yIHN0YXRpbmcNCj4g
PiB0aGF0IEJpdGJha2UgZG9lcyBub3Qga25vdyB3aGF0IHRvIGRvIHdpdGggdGhlIGZpbGUuICBP
ciBtb3JlDQo+ID4gc3BlY2lmaWNhbGx5LCB0aGUgZmlsZSB0byBiZSBpbXBvcnRlZCBhdCBsZWFz
dCBjYW4ndCBiZSBhIC50eHQNCj4gPiBleHRlbnNpb24uICBJZiB0aGVyZSBpcyBhIHNwZWNpZmlj
IGZpbGUgZXh0ZW5zaW9uIG5lZWRlZCBmb3IgaW1wb3J0LA0KPiA+IEknZCBzdWdnZXN0IHRoZSBp
bmZvIGJlIGluY2x1ZGVkIG9uIHRoZSBQUiBTZXJ2aWNlIHdpa2kuDQo+IA0KPiBUaGF0IHNvdW5k
cyBsaWtlIGEgZ29vZCBpZGVhLiBZb3Ugc2hvdWxkIGJlIGFibGUgdG8gdXBkYXRlIHRoZSB3aWtp
Pw0KDQpJJ2xsIGNyZWF0ZSBhbiBhY2NvdW50IG9uIHRoZSB3aWtpIGFuZCBkbyBzb21lIGVkaXRz
Lg0KDQpSZWdhcmRzLA0KQnJ5YW4NCg==

