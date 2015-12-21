Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CF6056FFE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 17:00:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 21 Dec 2015 09:00:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,460,1444719600"; d="scan'208";a="621700409"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 09:00:50 -0800
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
	ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Mon, 21 Dec 2015 09:00:50 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.29]) by
	ORSMSX111.amr.corp.intel.com ([169.254.12.27]) with mapi id
	14.03.0248.002; Mon, 21 Dec 2015 09:00:49 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH 2/2] oe-buildenv-internal: preserve existing
	BB_ENV_EXTRAWHITE
Thread-Index: AQHRLiEJ9/9ZrVtpa0eClWjpbMo7qZ7LvVYAgAoHx6A=
Date: Mon, 21 Dec 2015 17:00:49 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6117C5988@ORSMSX112.amr.corp.intel.com>
References: <1449184196-21113-1-git-send-email-juro.bystricky@intel.com>
	<1449184196-21113-2-git-send-email-juro.bystricky@intel.com>
	<CAJ86T=UbLswt_z286cNq87N7ft92m_XXiDfNG1yL4tH=5Gx3Dg@mail.gmail.com>
In-Reply-To: <CAJ86T=UbLswt_z286cNq87N7ft92m_XXiDfNG1yL4tH=5Gx3Dg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oe-buildenv-internal: preserve existing BB_ENV_EXTRAWHITE
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
X-List-Received-Date: Mon, 21 Dec 2015 17:00:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzLCBpdCBpcyBhIGxlZ2l0aW1hdGUgYnVnLCBjZXJ0YWlubHkgbm90IGludGVuZGVkLg0K
IEkgYWxyZWFkeSBwb3N0ZWQgYSBwYXRjaCB0byB0aGUgbWFpbGluZyBsaXN0IGxhc3Qgd2Vlay4g
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmUgTWNDdXJkeSBb
bWFpbHRvOmFybWNjdXJkeUBnbWFpbC5jb21dDQo+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMTQs
IDIwMTUgMzo0NyBQTQ0KPiBUbzogQnlzdHJpY2t5LCBKdXJvDQo+IENjOiBPRSBDb3JlIG1haWxp
bmcgbGlzdDsganVyb2J5c3RyaWNreUBob3RtYWlsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQQVRDSCAyLzJdIG9lLWJ1aWxkZW52LWludGVybmFsOiBwcmVzZXJ2ZSBleGlzdGluZw0K
PiBCQl9FTlZfRVhUUkFXSElURQ0KPiANCj4gT24gVGh1LCBEZWMgMywgMjAxNSBhdCAzOjA5IFBN
LCBKdXJvIEJ5c3RyaWNreSA8anVyby5ieXN0cmlja3lAaW50ZWwuY29tPg0KPiB3cm90ZToNCj4g
PiBBY2NvcmRpbmcgdG8gdGhlIEJpdEJha2UgVXNlciBNYW51YWwgdGhlIGVudmlyb25tZW50IHZh
cmlhYmxlDQo+ID4gQkJfRU5WX0VYVFJBV0hJVEUgc3BlY2lmaWVzIGFuIGFkZGl0aW9uYWwgc2V0
IG9mIHZhcmlhYmxlcyB0byBhbGxvdw0KPiA+IHRocm91Z2ggKHdoaXRlbGlzdCkgZnJvbSB0aGUg
ZXh0ZXJuYWwgZW52aXJvbm1lbnQgaW50byBCaXRCYWtlJ3MgZGF0YXN0b3JlLg0KPiBIb3dldmVy
LCBydW5uaW5nOg0KPiA+DQo+ID4gICAkIHNvdXJjZSBvZS1pbml0LWJ1aWxkLWVudiBidWlsZC1u
YW1lDQo+ID4NCj4gPiB3aWxsIG92ZXJ3cml0ZSBhbnkgcHJlLWV4aXN0aW5nIEJCX0VOVl9FWFRS
QVdISVRFIHZhcmlhYmxlcy4NCj4gPiBUaGlzIHBhdGNoIG1vZGlmaWVzIHRoaXMgYmVoYXZpb3Vy
OiBhbGwgb2UtYnVpbGQtaW50ZXJuYWwNCj4gPiBCQl9FTlZfRVhUUkFXSElURSB2YXJpYWJsZXMg
YXJlIGFwcGVuZGVkIHRvIGFueSBwb3RlbnRpYWxseSBhbHJlYWR5DQo+ID4gZXhpc3RpbmcgQkJf
RU5WX0VYVFJBV0hJVEUgdmFyaWFibGVzLiAoVGhlIHZhcmlhYmxlcyBhcmUgb25seSBhcHBlbmRl
ZA0KPiA+IGlmIG5vdCBhbHJlYWR5IGluIEJCX0VOVl9FWFRSQVdISVRFKQ0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogSnVybyBCeXN0cmlja3kgPGp1cm8uYnlzdHJpY2t5QGludGVsLmNvbT4NCj4g
PiAtLS0NCj4gPiAgc2NyaXB0cy9vZS1idWlsZGVudi1pbnRlcm5hbCB8IDYgKysrKystDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9zY3JpcHRzL29lLWJ1aWxkZW52LWludGVybmFsDQo+ID4gYi9zY3JpcHRz
L29lLWJ1aWxkZW52LWludGVybmFsIGluZGV4IDllZDI3MjEuLjUxZTQ0OWEgMTAwNzU1DQo+ID4g
LS0tIGEvc2NyaXB0cy9vZS1idWlsZGVudi1pbnRlcm5hbA0KPiA+ICsrKyBiL3NjcmlwdHMvb2Ut
YnVpbGRlbnYtaW50ZXJuYWwNCj4gPiBAQCAtMTAyLDggKzEwMiwxMiBAQCB1bnNldCBCSVRCQUtF
RElSIE5FV1BBVEhTICAjIFVzZWQgYnkgdGhlDQo+IHJ1bnFlbXUNCj4gPiBzY3JpcHQgIGV4cG9y
dCBCVUlMRERJUiAgZXhwb3J0IFBBVEggLWV4cG9ydA0KPiA+IEJCX0VOVl9FWFRSQVdISVRFPSJN
QUNISU5FIERJU1RSTyBUQ01PREUgVENMSUJDIEhUVFBfUFJPWFkNCj4gaHR0cF9wcm94eQ0KPiA+
IFwNCj4gPiArDQo+ID4gK0JCX0VOVl9FWFRSQVdISVRFX09FPSJNQUNISU5FIERJU1RSTyBUQ01P
REUgVENMSUJDDQo+IEhUVFBfUFJPWFkNCj4gPiAraHR0cF9wcm94eSBcDQo+ID4gIEhUVFBTX1BS
T1hZIGh0dHBzX3Byb3h5IEZUUF9QUk9YWSBmdHBfcHJveHkgRlRQU19QUk9YWSBmdHBzX3Byb3h5
DQo+ID4gQUxMX1BST1hZIFwgIGFsbF9wcm94eSBOT19QUk9YWSBub19wcm94eSBTU0hfQUdFTlRf
UElEDQo+IFNTSF9BVVRIX1NPQ0sNCj4gPiBCQl9TUkNSRVZfUE9MSUNZIFwgIFNES01BQ0hJTkUg
QkJfTlVNQkVSX1RIUkVBRFMNCj4gQkJfTk9fTkVUV09SSw0KPiA+IFBBUkFMTEVMX01BS0UgR0lU
X1BST1hZX0NPTU1BTkQgXCAgU09DS1M1X1BBU1NXRA0KPiBTT0NLUzVfVVNFUiBTQ1JFRU5ESVIg
U1RBTVBTX0RJUiINCj4gPiArDQo+ID4gK2VjaG8gIiRCQl9FTlZfRVhUUkFXSElURSIgfCBncmVw
IC1xICIke0JCX0VOVl9FWFRSQVdISVRFX09FfSINCj4gPiArWyAkPyAhPSAwIF0gJiYgZXhwb3J0
DQo+IEJCX0VOVl9FWFRSQVdISVRFPSIke0JCX0VOVl9FWFRSQVdISVRFX09FfQ0KPiAkQkJfRU5W
X0VYVFJBV0hJVEUiDQo+IA0KPiBJZiAke0JCX0VOVl9FWFRSQVdISVRFX09FfSBpcyBmb3VuZCBp
biAke0JCX0VOVl9FWFRSQVdISVRFfSAoZS5nLiBpZg0KPiBvZS1pbml0LWJ1aWxkLWVudiBpcyBy
ZS1ydW4gZnJvbSBhIHNoZWxsIHdoZXJlIGl0IGhhcyBhbHJlYWR5IGJlZW4gcnVuIGJlZm9yZSks
DQo+IHRoZW4gdGhpcyBjaGFuZ2UgY2F1c2Ugb2UtYnVpbGRlbnYtaW50ZXJuYWwgdG8gZXhpdCB3
aXRoIGEgbm9uLXplcm8gc3RhdHVzLA0KPiB3aGljaCB3aWxsIHByZXZlbnQgb2UtaW5pdC1idWls
ZC1lbnYgZnJvbSBjYWxsaW5nIG9lLXNldHVwLWJ1aWxkZGlyIG9yIGNkJ2luZyB0bw0KPiAke0JV
SUxERElSfS4gSXMgdGhhdCByZWFsbHkgdGhlIGludGVudGlvbj8gSXQgYnJlYWtzIG15IHR5cGlj
YWwgd29yayBmbG93Li4uDQo+IA0KPiANCj4gPiAtLQ0KPiA+IDEuOS4xDQo+ID4NCj4gPiAtLQ0K
PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4g
T3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+ID4gT3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCg==

