Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C46EB6B0CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 08:16:16 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Aug 2013 01:16:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,926,1367996400"; d="scan'208";a="284731222"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Aug 2013 01:16:16 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Wed, 21 Aug 2013 09:16:15 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.233]) with mapi id
	14.03.0123.003; Wed, 21 Aug 2013 09:16:15 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Thread-Topic: [OE-core] [PATCH 4/4] harfbuzz: upgrade to v0.9.19
Thread-Index: AQHOkeo6s4ASXAe9BUyX0qF2HeGDrpmfVeAAgAATfsA=
Date: Wed, 21 Aug 2013 08:16:14 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C175BA@IRSMSX105.ger.corp.intel.com>
References: <1375713884-8528-1-git-send-email-cristian.iorga@intel.com>
	<1375713884-8528-4-git-send-email-cristian.iorga@intel.com>
	<CAF6bG8c-1zkHYuLbnPPgCGENsaergeggvQvjMpJKcAr59k4rEg@mail.gmail.com>
In-Reply-To: <CAF6bG8c-1zkHYuLbnPPgCGENsaergeggvQvjMpJKcAr59k4rEg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] harfbuzz: upgrade to v0.9.19
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
X-List-Received-Date: Wed, 21 Aug 2013 08:16:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2lsbCBsb29rIGludG8gaXQsIHRoYW5rcy4NClJlZ2FyZHMsDQpDcmlzdGlhbg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTWFya28gTGluZHF2aXN0IFttYWlsdG86Y2F6Zmk3
NEBnbWFpbC5jb21dIA0KU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjEsIDIwMTMgMTE6MDYgQU0N
ClRvOiBJb3JnYSwgQ3Jpc3RpYW4NCkNjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0
aGUgb2UtY29yZSBsYXllcg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggNC80XSBoYXJm
YnV6ejogdXBncmFkZSB0byB2MC45LjE5DQoNCk9uIDUgQXVndXN0IDIwMTMgMTc6NDQsIENyaXN0
aWFuIElvcmdhIDxjcmlzdGlhbi5pb3JnYUBpbnRlbC5jb20+IHdyb3RlOg0KPiBkaXNhYmxlX2dy
YXBoaXRlLnBhdGNoIHVwZGF0ZWQuDQo+DQoNCj4gLQ0KPiAtLVBLR19DSEVDS19NT0RVTEVTKEdS
QVBISVRFMiwgZ3JhcGhpdGUyLCBoYXZlX2dyYXBoaXRlPXRydWUsIA0KPiBoYXZlX2dyYXBoaXRl
PWZhbHNlKQ0KPiAtK2hhdmVfZ3JhcGhpdGU9ZmFsc2UNCg0KIEFzIHVwc3RyZWFtIGhhZCBvbmx5
IGNoZWNrIGZvciBleGlzdGVuY2Ugb2YgZ3JhcGhpdGUyLCB3ZSBuZWVkZWQgdG8gcGF0Y2ggdGhp
cyBkaXNhYmxpbmcuLi4NCg0KPiArIGlmIHRlc3QgIngkd2l0aF9ncmFwaGl0ZTIiID0gInh5ZXMi
IC1hICJ4JGhhdmVfZ3JhcGhpdGUyIiAhPSAieHRydWUiOyB0aGVuDQo+ICsgICAgICAgQUNfTVNH
X0VSUk9SKFtncmFwaGl0ZTIgc3VwcG9ydCByZXF1ZXN0ZWQgYnV0IGxpYmdyYXBoaXRlMiBub3Qg
DQo+ICsgZm91bmRdKSBmaQ0KPiArK2hhdmVfZ3JhcGhpdGU9ZmFsc2UNCg0KIEhlcmUgaXQgc2Vl
bXMgKHgkd2l0aF9ncGFwaGl0ZTIgPSAieHllcyIpIHRoYXQgbmV3IHVwc3RyZWFtIHZlcnNpb24g
aGFzIGNvbmZpZ3VyZSBzd2l0Y2ggLS13aXRob3V0LWdyYXBoaXRlMiB0aGF0IHNob3VsZCBiZSB1
c2VkIGluc3RlYWQgb2YgcGF0Y2hpbmcgYW55IG1vcmUuDQoNCg0KIC0gTUwNCg==

