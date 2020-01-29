Return-Path: <frieder.schrempf@kontron.de>
Received: from skedge04.snt-world.com (skedge04.snt-world.com [91.208.41.69])
	by mail.openembedded.org (Postfix) with ESMTP id 7FA0160282
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:32:01 +0000 (UTC)
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by skedge04.snt-world.com (Postfix) with ESMTPS id 5646A67A7C5;
	Wed, 29 Jan 2020 14:03:28 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
	(10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5;
	Wed, 29 Jan 2020 14:03:27 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
	sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
	15.01.1913.005; Wed, 29 Jan 2020 14:03:27 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Tom Hochstein
	<tom.hochstein@nxp.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "anuj.mittal@intel.com" <anuj.mittal@intel.com>
Thread-Topic: [OE-core] [PATCH 1/2] devtool/standard.py: Allow recipe to
	disable menuconfig logic
Thread-Index: AQHVn9hOKHV1irVtG0aDGZ7QPWajF6eqM5oAgA4tZMCAKEq+AIAg/bSAgAA8HQCAABL8gA==
Date: Wed, 29 Jan 2020 13:03:27 +0000
Message-ID: <12020037-52d7-2395-2bf1-7fd628e40dbc@kontron.de>
References: <20191120192419.7352-1-tom.hochstein@nxp.com>
	<d25ed9e2-6ff8-355a-1de0-8b51aef9e2c8@kontron.de>
	<VE1PR04MB6621F85F190F08F43967C895E2540@VE1PR04MB6621.eurprd04.prod.outlook.com>
	<2f61a2ea-456e-0cf0-7ddf-03a0d9adf72e@kontron.de>
	<da035af4-d1e8-efd9-30fc-19a4f875948b@kontron.de>
	<6b33c47868865ce3549b8698b9bed6a2d0fa06ca.camel@linuxfoundation.org>
In-Reply-To: <6b33c47868865ce3549b8698b9bed6a2d0fa06ca.camel@linuxfoundation.org>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 5646A67A7C5.AB093
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
	Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: akuster808@gmail.com, anuj.mittal@intel.com,
	openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, tom.hochstein@nxp.com
X-Spam-Status: No
Subject: Re: [PATCH 1/2] devtool/standard.py: Allow recipe to disable menuconfig logic
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
X-List-Received-Date: Thu, 30 Jan 2020 12:32:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <21D2A5CC96107948894DD88DB1E3349A@snt-world.com>
Content-Transfer-Encoding: base64

T24gMjkuMDEuMjAgMTI6NTUsIFJpY2hhcmQgUHVyZGllIHdyb3RlOg0KPiBPbiBXZWQsIDIwMjAt
MDEtMjkgYXQgMDg6MjAgKzAwMDAsIFNjaHJlbXBmIEZyaWVkZXIgd3JvdGU6DQo+PiBPbiAwOC4w
MS4yMCAwOTozMiwgU2NocmVtcGYgRnJpZWRlciB3cm90ZToNCj4+PiBPbiAxMy4xMi4xOSAxNzox
NCwgVG9tIEhvY2hzdGVpbiB3cm90ZToNCj4+Pj4gSSBtYWRlIGEgUFIgYXMgd2VsbDoNCj4+Pj4N
Cj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5lbWJlZGRlZC9vcGVuZW1iZWRkZWQtY29yZS9w
dWxsLzU3DQo+Pj4+DQo+Pj4+IFRvbQ0KPj4+DQo+Pj4gSSBkb24ndCB0aGluayBQUnMgYXJlIGFj
Y2VwdGVkIGZvciBvZS1jb3JlLiBZb3VyIHBhdGNoZXMgc2hvdWxkIGJlDQo+Pj4gb2ssDQo+Pj4g
aWYgc29tZW9uZSByZXZpZXdzIGFuZCBhcHBsaWVzIHRoZW0uDQo+Pj4NCj4+PiBEZWFyIG1haW50
YWluZXJzLCBjb3VsZCB5b3UgY29uc2lkZXIgdG8gcmV2aWV3L2FwcGx5IHRoaXMgZml4IGZvcg0K
Pj4+IG1hc3Rlci96ZXVzPyBJdCBmaXhlcyBhbiBhbm5veWluZyBpc3N1ZSB3aGVuIHdvcmtpbmcg
d2l0aCBkZXZ0b29sDQo+Pj4gYW5kDQo+Pj4gdS1ib290Lg0KPj4NCj4+IFBpbmcgYWdhaW4uDQo+
Pg0KPj4gQ2FuIHNvbWVvbmUgcGxlYXNlIGF0IGxlYXN0IGxvb2sgYXQgdGhlc2UgcGF0Y2hlcyBv
ciBnaXZlIGFueSByZWFzb24NCj4+IHdoeSBubyBvbmUgY2FyZXMgYWJvdXQgdGhlbT8NCj4gDQo+
IFNvcnJ5LCB0aGUgcHJvamVjdCBpcyBzdHJ1Z2dsaW5nIHdpdGggZmFpbGluZyBhdXRvbWF0ZWQg
dGVzdHMgYW5kDQo+IHN0cnVnZ2xpbmcgdG8gZmluZCBwZW9wbGUgYWJsZSB0byByZXZpZXcgcGF0
Y2hlcyBmb3Igc29tZSBzdWJqZWN0DQo+IGFyZWFzLg0KPiANCj4gSSBkb24ndCBrbm93IGRldnRv
b2wgdmVyeSB3ZWxsIGFuZCBpdHMgaGFyZCBmb3IgbWUgdG8gc2F5IGlmIHRoaXMgaXMgYQ0KPiBn
b29kIGNoYW5nZSBvciBpZiB0aGVyZSBpcyBzb21lIG90aGVyIHdheSB3ZSBzaG91bGQgYmUgZml4
aW5nIHRoaXMuDQo+IA0KPiBPZiBwYXJ0aWN1bGFyIGNvbmNlcm4gaXMgdGhlcmUgaXMgbm8gYXV0
b21hdGVkIHRlc3RpbmcgaW4gdGhpcyBhcmVhIGFuZA0KPiBkZXZ0b29sIGhhcyBnb29kIHRlc3Rz
IGluIGdlbmVyYWwuDQo+IA0KPiBOb3QgZ29vZCBhbnN3ZXJzIEkga25vdywgc29ycnkgOiguDQoN
ClRoYW5rcyBmb3IgcmVwbHlpbmcgYW5kIHByb3ZpZGluZyB0aGUgYmFja2dyb3VuZCBpbmZvcm1h
dGlvbi4NCg0KPiANCj4gSSdsbCBhZGQgdGhpcyB0byAtbmV4dCBmb3Igd2lkZXIgdGVzdGluZyBh
bmQgc2VlIGlmIEkgY2FuIGZpbmQgc29tZW9uZQ0KPiB0byByZXZpZXcuDQoNCk9rLCB0aGFua3Mh
DQpJIHdvdWxkIGhlbHAgbXlzZWxmLCBpZiBJIGhhZCB0aGUgdGltZSBhbmQga25vd2xlZGdlIHRv
IGRvIHNvLg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo+IA0KPiA=

