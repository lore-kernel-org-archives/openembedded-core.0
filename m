Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1U3uyO-0006FL-Cg
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 21:55:04 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Feb 2013 12:39:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,630,1355126400"; d="scan'208";a="200255523"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Feb 2013 12:39:07 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.201]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.62]) with mapi id
	14.01.0355.002; Fri, 8 Feb 2013 12:39:06 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>, Koen Kooi
	<koen@dominion.thruhere.net>
Thread-Topic: [for-danny][PATCH] xf86-video-modesetting: new recipe for gma500
Thread-Index: AQHOBeVOoFzEuVB0o0abCA+vxXWSP5hwYVmAgAABC4CAAAI8gIAAB44A
Date: Fri, 8 Feb 2013 20:39:06 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C3F0F57E4@ORSMSX106.amr.corp.intel.com>
References: <1360318544-11013-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0Lbd9uXC9B+VTO0SgbBSksqT+5XKiUUC62YgKadmRxqqdA@mail.gmail.com>
	<932EDA66-92E1-4B0A-A9CC-7037DACE0372@dominion.thruhere.net>
	<CAJTo0LbP9YAEa1qZJqjgKNwvFXz+pebwDqeXd8RRp3FV_AS2CQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbP9YAEa1qZJqjgKNwvFXz+pebwDqeXd8RRp3FV_AS2CQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-danny][PATCH] xf86-video-modesetting: new recipe for gma500
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 20:55:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJ1cnRvbiwgUm9zcyBbbWFp
bHRvOnJvc3MuYnVydG9uQGludGVsLmNvbV0NCj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAwOCwg
MjAxMyA0OjEwIEFNDQo+IFRvOiBLb2VuIEtvb2kNCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc7IEthbWJsZSwgTml0aW4gQTsgUmljaGFyZA0KPiBQdXJkaWUN
Cj4gU3ViamVjdDogUmU6IFtmb3ItZGFubnldW1BBVENIXSB4Zjg2LXZpZGVvLW1vZGVzZXR0aW5n
OiBuZXcgcmVjaXBlIGZvcg0KPiBnbWE1MDANCj4gDQo+IE9uIDggRmVicnVhcnkgMjAxMyAxMjow
MSwgS29lbiBLb29pIDxrb2VuQGRvbWluaW9uLnRocnVoZXJlLm5ldD4gd3JvdGU6DQo+ID4gVGhl
IEdNQTUwMCBjb21tZW50IGlzIHZlcnkgbWlzbGVhZGluZywgdGhpcyBpcyBqdXN0IGEgcmVjaXBl
IGZvciB5ZXQtDQo+IGFub3RoZXItZGR4IHRoYXQgb25seSBnZXRzIGluc3RhbGxlZCB3aGVuIHlv
dSBhc2sgZm9yIGl0IDopIFdoYXQgdGhlIGNvbW1pdA0KPiBmb3JnZXRzIHRvIG1lbnRpb24gaXMg
dGhhdCBpdCdzIGEgZGR4IGZvciBhbnkgRFJNIGJhc2VkIGtlcm5lbCBkaXNwbGF5IGRyaXZlciwg
SQ0KPiBuZWVkIGl0IGZvciBiZWFnbGVib2FyZCwgYmVhZ2xlYm9uZSB3aGljaCBkb24ndCB1c2Ug
Z21hNTAwIGFuZCBhbHNvIGZvciBmcmkyDQo+IHdoaWNoIGRvZXMgdXNlIGdtYTUwMC4NCj4gDQo+
IEluZGVlZCwgaXQncyB0aGUgbmV3IGZiZGV2LiBEZWF0aCB0byBmYmRldiENCj4gDQo+IFJvc3MN
CkkgaGFkIGJyb3VnaHQgaW4gdGhlIG1vZGVzZXR0aW5nIGRyaXZlciBqdXN0IGZvciBnbWE1MDAs
IGFuZCBnbGFkIHRvIHNlZSBtb3JlIHVzZSBvZiBpdC4NCkJUVyBGUkkyIGRvZXMgbm90ICYgY2Fu
bm90IHVzZSB0aGUgZ21hNTAwIGRyaXZlci4gDQoNCk5pdGluDQoNCg==


