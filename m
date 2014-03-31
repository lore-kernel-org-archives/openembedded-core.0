Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4E16BA1D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 10:10:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 31 Mar 2014 03:06:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,764,1389772800"; d="scan'208";a="511432764"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga002.jf.intel.com with ESMTP; 31 Mar 2014 03:10:48 -0700
Received: from irsmsx153.ger.corp.intel.com (163.33.192.75) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 31 Mar 2014 11:09:35 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.78]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.200]) with mapi id
	14.03.0123.003; Mon, 31 Mar 2014 11:09:34 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/1] core-image-lsb: enforce pam as a needed
	distro feature
Thread-Index: AQHPTMfUDConnTHnmUqDGSb4ueKZ0Zr6+BDg
Date: Mon, 31 Mar 2014 10:09:33 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB1CE75DD0@IRSMSX105.ger.corp.intel.com>
References: <cover.1396259433.git.cristian.iorga@intel.com>
	<9e2ace2e2747ecda37004ea44d2e70de0586e185.1396259433.git.cristian.iorga@intel.com>
	<1396259888.14790.58.camel@ted>
In-Reply-To: <1396259888.14790.58.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] core-image-lsb: enforce pam as a needed distro feature
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
X-List-Received-Date: Mon, 31 Mar 2014 10:10:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Tm8sIGJ1dCBJIHdpbGwuDQoNCkJ1dCBpcyB0aGlzIGEgbmVnYXRpdmUgcG9pbnQgb2YgdGhlIHBh
dGNoLCBvciB0aGUgYXV0b2J1aWxkZXIgc2hvdWxkIGJlIGNoYW5nZWQ/DQpJIGFjdGVkIHVwb24g
c29tZSBwZXJzb25hbCBvYnNlcnZhdGlvbnMsIGEgZGlzY3Vzc2lvbiB3aXRoIFBhdWwgKGhlIHN1
Z2dlc3RlZCB0aGUgY2hhbmdlKSBhbmQgYWxzbyBvbiB0aGlzIGd1aWRlOg0KaHR0cHM6Ly93aWtp
LnlvY3RvcHJvamVjdC5vcmcvd2lraS9MU0JfUmVzdWx0IChpbiB3aGljaCBkaXN0cm8gaXMgc2V0
IHRvIHBva3ktbHNiKS4NCg0KUmVnYXJkcywNCkNyaXN0aWFuDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxp
bnV4Zm91bmRhdGlvbi5vcmddIA0KU2VudDogTW9uZGF5LCBNYXJjaCAzMSwgMjAxNCAxMjo1OCBQ
TQ0KVG86IElvcmdhLCBDcmlzdGlhbg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDEvMV0gY29yZS1pbWFn
ZS1sc2I6IGVuZm9yY2UgcGFtIGFzIGEgbmVlZGVkIGRpc3RybyBmZWF0dXJlDQoNCk9uIE1vbiwg
MjAxNC0wMy0zMSBhdCAxMjo1MSArMDMwMCwgQ3Jpc3RpYW4gSW9yZ2Egd3JvdGU6DQo+IGNvcmUt
aW1hZ2UtbHNiIG9ubHkgZ2F2ZSBhIHdhcm5pbmc6DQo+ICJXQVJOSU5HOiBCdWlsZGluZyBsaWJw
YW0gYnV0ICdwYW0nIGlzbid0IGluIERJU1RST19GRUFUVVJFUywgUEFNIA0KPiB3b24ndCB3b3Jr
IGNvcnJlY3RseSINCj4gd2hlbiB0aGUgcHJvcGVyIERJU1RSTyB3YXMgbm90IHNldCBmb3IgaXQu
DQo+IGRlZmF1bHQgY2hvaWNlIHdvdWxkIGJlIERJU1RSTyA9ICJwb2t5LWxzYiIsIGJ1dCBub3Qg
bmVjZXNzYXJpbHksIA0KPiBkZXBlbmRpbmcgb24gZWFjaCBjdXN0b20gZGlzdHJvLg0KPiANCj4g
VGhpcyBmaXggd2lsbCBlbmZvcmNlIHRoZSBwcm9wZXIgdXNhZ2Ugb2YgcGFtIGFzIGEgZGlzdHJv
IGZlYXR1cmUgZm9yIA0KPiBjb3JlLWltYWdlLWxzYiBieSBnaXZpbmcgYW4gZXJyb3IgaW5zdGVh
ZCBvZiBqdXN0IGEgd2FybmluZy4NCj4gDQo+IEZpeGVzIFtZT0NUTyAjNjA3M10NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IENyaXN0aWFuIElvcmdhIDxjcmlzdGlhbi5pb3JnYUBpbnRlbC5jb20+DQo+
IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2ltYWdlcy9jb3JlLWltYWdlLWxzYi5iYiB8
IDQgKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9pbWFnZXMvY29yZS1p
bWFnZS1sc2IuYmIgDQo+IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2ltYWdlcy9jb3JlLWltYWdl
LWxzYi5iYg0KPiBpbmRleCBlZDMxNmE2Li5hYjYxYzZlIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvaW1hZ2VzL2NvcmUtaW1hZ2UtbHNiLmJiDQo+ICsrKyBiL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9pbWFnZXMvY29yZS1pbWFnZS1sc2IuYmINCj4gQEAgLTksNCArOSw2IEBA
IElNQUdFX0lOU1RBTEwgPSAiXA0KPiAgICAgIHBhY2thZ2Vncm91cC1jb3JlLWxzYiBcDQo+ICAg
ICAgIg0KPiAgDQo+IC1pbmhlcml0IGNvcmUtaW1hZ2UNCj4gK2luaGVyaXQgY29yZS1pbWFnZSBk
aXN0cm9fZmVhdHVyZXNfY2hlY2sNCj4gKw0KPiArUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0g
InBhbSINCg0KDQpJIGhhdmUgYSBmZWVsaW5nIHRoZSBhdXRvYnVpbGRlciBidWlsZHMgY29yZS1p
bWFnZS1sc2IgaW4gc2l0dWF0aW9ucyB3aGVyZSBESVNUUk89cG9reSwgYWx0aG91Z2ggSSBjb3Vs
ZCBiZSB3cm9uZy4gSGF2ZSB5b3UgY2hlY2tlZD8NCg0KQ2hlZXJzLA0KDQpSaWNoYXJkDQoNCg==

