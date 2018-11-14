Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 198576C29F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 00:57:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 16:57:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,230,1539673200"; d="scan'208";a="273784840"
Received: from pgsmsx105.gar.corp.intel.com ([10.221.44.96])
	by orsmga005.jf.intel.com with ESMTP; 13 Nov 2018 16:57:30 -0800
Received: from pgsmsx110.gar.corp.intel.com (10.221.44.111) by
	PGSMSX105.gar.corp.intel.com (10.221.44.96) with Microsoft SMTP Server
	(TLS) id 14.3.408.0; Wed, 14 Nov 2018 08:55:07 +0800
Received: from kmsmsx155.gar.corp.intel.com ([169.254.15.19]) by
	PGSMSX110.gar.corp.intel.com ([169.254.13.219]) with mapi id
	14.03.0415.000; Wed, 14 Nov 2018 08:55:06 +0800
From: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/4] qemurunner: Add support for slirp
Thread-Index: AQHUezYEV3QlCyZcpUWT8B/flxp3kqVN1jeAgACcLAA=
Date: Wed, 14 Nov 2018 00:55:06 +0000
Message-ID: <9DDD2658D1FE414E99172D2DB1E4D0434811F70A@KMSMSX155.gar.corp.intel.com>
References: <1542101577-59901-1-git-send-email-ee.peng.yeoh@intel.com>
	<1542101577-59901-2-git-send-email-ee.peng.yeoh@intel.com>
	<b26d278cf4a89f6a10aa3895efb84256ed0f6be9.camel@linuxfoundation.org>
In-Reply-To: <b26d278cf4a89f6a10aa3895efb84256ed0f6be9.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjA2NzcwNTItMjUxOS00MDU4LTg5MjItNjI2NjY2NzlkNDVhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVEVVQTZ6UlFVeU1ValJndjRlT2J5dUVhWG1HbTc3RmFhdUhsTEFIOFk1SnQyNHNmblpBbTdrbGsyXC83K3IyWVcifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] qemurunner: Add support for slirp
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
X-List-Received-Date: Wed, 14 Nov 2018 00:57:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KSSBwZXJmb3JtZWQgdGVzdGluZyBtYWlubHkgZm9yIHBpbmcsIHNzaCwg
eG9yZyB0ZXN0aW5nLiANCkRpZCBub3QgZXhwZWN0IHRoYXQgdGFyZ2V0Y29udHJvbCBoYXMgZGVw
ZW5kZW5jeSBvbiB0aGUgcWVtdS4gDQpMZXQgbWUgbG9vayBpbnRvIHRoaXMgYW5kIHJ1biBmdWxs
IHJ1bnRpbWUgdGVzdHMgaW5zdGVhZC4gDQpJTkhFUklUICs9ICJ0ZXN0aW1hZ2UiDQpURVNUX1NV
SVRFUyA9ICJwaW5nIHNzaCB4b3JnIg0KDQpUaGFua3MsDQpZZW9oIEVlIFBlbmcgDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddIA0KU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJl
ciAxNCwgMjAxOCA3OjM0IEFNDQpUbzogWWVvaCwgRWUgUGVuZyA8ZWUucGVuZy55ZW9oQGludGVs
LmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW1BBVENIIDIvNF0gcWVtdXJ1bm5lcjogQWRkIHN1cHBvcnQgZm9yIHNs
aXJwDQoNCk9uIFR1ZSwgMjAxOC0xMS0xMyBhdCAxNzozMiArMDgwMCwgWWVvaCBFZSBQZW5nIHdy
b3RlOg0KPiBFbmFibGUgcWVtdXJ1bm5lciBmb3Igc2xpcnAuIFJldHJpZXZlZCB0aGUgcG9ydCBm
cm9tIGxvY2FsaG9zdCB0byANCj4gY29ubmVjdCB0byBxZW11Lg0KPiANCj4gW1lPQ1RPIzEwNzEz
XQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogWWVvaCBFZSBQZW5nIDxlZS5wZW5nLnllb2hAaW50ZWwu
Y29tPg0KPiAtLS0NCj4gIG1ldGEvbGliL29lcWEvdXRpbHMvcWVtdXJ1bm5lci5weSB8IDE3ICsr
KysrKysrKysrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCg0KICBGaWxlICIvbWVkaWEvYnVpbGQxL3Bva3kvbWV0YS9saWIvb2VxYS9j
b3JlL2RlY29yYXRvci9fX2luaXRfXy5weSIsIGxpbmUgMzIsIGluIHdyYXBwZWRfZg0KICAgIHJl
dHVybiBmdW5jKCphcmdzLCAqKmt3YXJncykNCiAgRmlsZSAiL21lZGlhL2J1aWxkMS9wb2t5L21l
dGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvZGV2dG9vbC5weSIsIGxpbmUgMTI4MiwgaW4gdGVz
dF9kZXZ0b29sX2RlcGxveV90YXJnZXQNCiAgICB3aXRoIHJ1bnFlbXUodGVzdGltYWdlKSBhcyBx
ZW11Og0KICBGaWxlICIvdXNyL2xpYi9weXRob24zLjYvY29udGV4dGxpYi5weSIsIGxpbmUgODEs
IGluIF9fZW50ZXJfXw0KICAgIHJldHVybiBuZXh0KHNlbGYuZ2VuKQ0KICBGaWxlICIvbWVkaWEv
YnVpbGQxL3Bva3kvbWV0YS9saWIvb2VxYS91dGlscy9jb21tYW5kcy5weSIsIGxpbmUgMzI3LCBp
biBydW5xZW11DQogICAgcWVtdSA9IG9lcWEudGFyZ2V0Y29udHJvbC5RZW11VGFyZ2V0KHJlY2lw
ZWRhdGEsIHRhcmdldGxvZ2dlciwgaW1hZ2VfZnN0eXBlKQ0KICBGaWxlICIvbWVkaWEvYnVpbGQx
L3Bva3kvbWV0YS9saWIvb2VxYS90YXJnZXRjb250cm9sLnB5IiwgbGluZSAxNDgsIGluIF9faW5p
dF9fDQogICAgbG9nZ2VyID0gbG9nZ2VyKQ0KVHlwZUVycm9yOiBfX2luaXRfXygpIG1pc3Npbmcg
MSByZXF1aXJlZCBwb3NpdGlvbmFsIGFyZ3VtZW50OiAndXNlX3NsaXJwJw0KDQpJJ20gdGhlcmVm
b3JlIG5vdCBzdXJlIGhvdyBtdWNoIHRlc3RpbmcgdGhpcyBoYXMgaGFkPw0KDQpDaGVlcnMsDQoN
ClJpY2hhcmQNCg0KDQo=

