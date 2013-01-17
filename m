Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TviOz-00045g-L2
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 06:52:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jan 2013 21:36:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,484,1355126400"; d="scan'208";a="273097564"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by orsmga002.jf.intel.com with ESMTP; 16 Jan 2013 21:37:13 -0800
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 16 Jan 2013 21:37:13 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.5]) by
	ORSMSX151.amr.corp.intel.com ([169.254.7.4]) with mapi id
	14.01.0355.002; Wed, 16 Jan 2013 21:37:13 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Jesse Zhang <sen.zhang@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] coreutils: remove dependency on
	coreutils-native
Thread-Index: AQHN8vZ5snlVU/leKEiPXAnfRDWjJphMYh2AgADtawD//7KawA==
Date: Thu, 17 Jan 2013 05:37:12 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C3F0BB37A@ORSMSX106.amr.corp.intel.com>
References: <1358234208-6177-1-git-send-email-sen.zhang@windriver.com>
	<1358234208-6177-2-git-send-email-sen.zhang@windriver.com>
	<1358337581.8129.2.camel@ted> <50F75D56.3050005@windriver.com>
In-Reply-To: <50F75D56.3050005@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] coreutils: remove dependency on coreutils-native
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
X-List-Received-Date: Thu, 17 Jan 2013 05:52:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBpcyBiaXQgb2xkIChvdXQgb2YgbXkgY2FjaGVkIG1lbW9yeSksIGJ1dCBsb29raW5nIGF0
IG15IGNvbW1pdCAoNTQzNTc3YzI1YjVhNGU4OWEzYWIxNWVlMjhlNzU0YjcxYzJhNDNkNSkgdGhl
IGRlcGVuZGVuY3kgb24gY29yZXV0aWxzLW5hdGl2ZSBpcyBuZWVkZWQgaWYgdGhlIGJ1aWxkIHN5
c3RlbSBkb2VzIG5vdCBoYXZlIGNvcmV1dGlscywgb3IgaXQgaXMgbm90IGNvbXBhdGlibGUgd2l0
aCB0aGUgc291cmNlcyBvZiB0aGUgY29yZXV0aWxzIHlvdSBhcmUgdHJ5aW5nIHRvIGJ1aWxkLiBB
bmQgdGhlIGNvbW1pdCBsb2cgZG9lcyBzaG93IHRoZSBlcnJvcnMgaXQgd2FzIGhpdHRpbmcsIHdo
aWNoIGFyZSBzb2x2ZWQgYnkgdXNpbmcgdGhlIG5hdGl2ZSB2ZXJzaW9uIG9mIHRoZSBjb3JldXRp
bHMuDQoNCk5pdGluDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBK
ZXNzZSBaaGFuZyBbbWFpbHRvOnNlbi56aGFuZ0B3aW5kcml2ZXIuY29tXQ0KPiBTZW50OiBXZWRu
ZXNkYXksIEphbnVhcnkgMTYsIDIwMTMgNjowOSBQTQ0KPiBUbzogUmljaGFyZCBQdXJkaWU7IEth
bWJsZSwgTml0aW4gQQ0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gY29yZXV0aWxzOiByZW1vdmUg
ZGVwZW5kZW5jeSBvbiBjb3JldXRpbHMtDQo+IG5hdGl2ZQ0KPiANCj4gT24gMDEvMTYvMjAxMyAw
Nzo1OSBQTSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6DQo+ID4gVHdvIHF1ZXN0aW9uczoNCj4gPg0K
PiA+IDEpIFdoeSBkbyB3ZSBoYXZlIHRoaXMgZGVwZW5kZW5jeSBoZXJlIGF0IGFsbD8gQXJlIHdl
IHN1cmUgd2UgZG9uJ3QNCj4gPiBuZWVkIGl0IGZvciBzb21lIHJlYXNvbnM/DQo+IA0KPiBJdCB3
YXMgaW50cm9kdWNlZCBpbiB0aGlzIGNvbW1pdCwgQ2MnaW5nIE5pdGluLg0KPiANCj4gY29tbWl0
IDU0MzU3N2MyNWI1YTRlODlhM2FiMTVlZTI4ZTc1NGI3MWMyYTQzZDUNCj4gQXV0aG9yOiBOaXRp
biBBIEthbWJsZSA8bml0aW4uYS5rYW1ibGVAaW50ZWwuY29tPg0KPiBEYXRlOiAgIFRodSBNYXIg
MTcgMTA6MjU6MDQgMjAxMSAtMDcwMA0KPiANCj4gICAgIGNvcmV1dGlscy02Ljk6IGZpeCBtYW4g
cGFnZSBidWlsZGluZyBmb3IgdGhlIGdwbHYyIHJlY2lwZQ0KPiANCj4gQnV0IHRoZSByZWFzb24g
YmVoaW5kIHRoZSBkZXBlbmRlbmN5IGlzIG5vdCBlbnRpcmVseSBjbGVhci4gQW5kIHdlJ3ZlIG5l
dmVyDQo+IHNlZW4gc3VjaCBpc3N1ZSB3aXRoIHRoZSBHUEx2MyByZWNpcGUuIChBbmQgdGhlIEdQ
THYyIHJlY2lwZSB3aXRoIG15IGZpeCBoYXMNCj4gYmVlbiBidWlsZGluZyB3ZWxsIGhlcmUgZm9y
IHNvbWUgdGltZSkuDQo+IA0KPiA+IDIpIElzbid0IHRoZSBidWlsZCBvZiBjb3JldXRpbHMtbmF0
aXZlIHN0aWxsIGJyb2tlbj8gV2Ugc2hvdWxkDQo+ID4gcHJvYmFibHkgaGFjayBpdCBzbyBpdCBp
bnN0YWxscyBpbnRvIHNvbWUgcGF0aCBwcmVmaXggbGlrZQ0KPiA+IHtweXRob24vcGVybC9nemlw
L3Rhcn0tbmF0aXZlIG9yIGRvZXNuJ3QgaW5zdGFsbCB0aGUgdXRpbHMgYXQgYWxsLg0KPiANCj4g
WWVhaCwgdGhlIGJ1aWxkIHdvdWxkIHN0aWxsIGJlIGJyb2tlbi4NCj4gDQo+IFRoZSBtYWluIGNv
bnRlbnRzIG9mIGNvcmV1dGlscyBhcmUgdGhlIHNldmVyYWwgZG96ZW4gY29tbWFuZHMuIEknbSBu
b3Qgc3VyZQ0KPiBob3cgaXQgY2FuIGJlIHVzZWZ1bCBpZiB3ZSBpbnN0YWxsIHRoZW0gaW50byBh
IG5vdC1pbi0kUEFUSCBkaXIuDQo+IEFueSBzdWdnZXN0aW9ucz8gSSdtIHdpbGxpbmcgdG8gd29y
ayBvdXQgYSBmaXguDQo+IA0KPiBqZXNzZQ0K


