Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RXbzl-0007ob-OS
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 18:06:26 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Dec 2011 08:59:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="83049412"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga001.jf.intel.com with ESMTP; 05 Dec 2011 08:59:38 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi; Mon, 5 Dec 2011
	08:59:38 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 5 Dec 2011 08:59:36 -0800
Thread-Topic: [OE-core] [PATCH 01/11] gst-fluendo-mpegdemux: rework the CC hack
Thread-Index: Acyx5wVoN0obfbj5QfGLdPfp/cpcNQBiBEaQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E3E5F196@orsmsx504.amr.corp.intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
	<a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
	<CAMKF1spYoZgjmUDiiLnRL_8E6WBFxr8gyMi7zmPPvzLwke36vg@mail.gmail.com>
In-Reply-To: <CAMKF1spYoZgjmUDiiLnRL_8E6WBFxr8gyMi7zmPPvzLwke36vg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "hjl.tools@gmail.com" <hjl.tools@gmail.com>
Subject: Re: [PATCH 01/11] gst-fluendo-mpegdemux: rework the CC hack
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
X-List-Received-Date: Mon, 05 Dec 2011 17:06:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2hlbSwNCiAgTWFrZXMgc2Vuc2UuIFdpbGwgdHJ5IHRvIGNoYW5nZSB0aGUgZml4IGFjY29y
ZGluZ2x5Lg0KVGhhbmtzLA0KTml0aW4NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBbbWFpbHRvOm9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZ10gT24gQmVoYWxmIE9mDQo+IEtoZW0gUmFqDQo+IFNlbnQ6IFNhdHVyZGF5LCBEZWNlbWJl
ciAwMywgMjAxMSA5OjUzIEFNDQo+IFRvOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0
aGUgb2UtY29yZSBsYXllcg0KPiBDYzogaGpsLnRvb2xzQGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSCAwMS8xMV0gZ3N0LWZsdWVuZG8tbXBlZ2RlbXV4OiByZXdvcmsg
dGhlDQo+IENDIGhhY2sNCj4gDQo+IE9uIEZyaSwgRGVjIDIsIDIwMTEgYXQgMTI6MTkgUE0sICA8
bml0aW4uYS5rYW1ibGVAaW50ZWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBOaXRpbiBBIEthbWJs
ZSA8bml0aW4uYS5rYW1ibGVAaW50ZWwuY29tPg0KPiA+DQo+ID4gVGhpcyBmaXhlcyBidWc6IFtZ
T0NUTyAjMTQwM10NCj4gPg0KPiA+IEVhcmxpZXIgaGFjayB3YXMgYnJlYWtpbmcgY29tcGlsZXIg
cGFyYW1ldGVycyBzZXQgYnkgdHVuZSBzZXR0aW5ncy4NCj4gQW5kIHRoYXQgY2F1c2VkIHgzMg0K
PiA+IGJ1aWxkIGZhaWx1cmUuIE5vdyBwcmV2aW91cyBDQyBwYXJhbWV0ZXJzIGFyZSBrZXB0IGlu
dGFjdCB3aGlsZQ0KPiBhZGRpbmcgbmV3IC1MIHBhcmFtZXRlci4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IE5pdGluIEEgS2FtYmxlIDxuaXRpbi5hLmthbWJsZUBpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gwqBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWZsdWVuZG8uaW5j
IHwgwqAgwqAyICstDQo+ID4gwqAxIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRp
YS9nc3RyZWFtZXIvZ3N0LWZsdWVuZG8uaW5jDQo+IGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
Z3N0cmVhbWVyL2dzdC1mbHVlbmRvLmluYw0KPiA+IGluZGV4IDIwM2JkYmEuLjk2MTU0NTQgMTAw
NjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1mbHVl
bmRvLmluYw0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3Qt
Zmx1ZW5kby5pbmMNCj4gPiBAQCAtMTQsNSArMTQsNSBAQCBGSUxFU18ke1BOfS1kZXYgKz0gIiR7
bGliZGlyfS9nc3RyZWFtZXItMC4xMC8qLmxhDQo+ICR7bGliZGlyfS9nc3RyZWFtZXItMC4xMC8q
LmEiDQo+ID4gwqBFWFRSQV9PRUNPTkYgPSAiLS1kaXNhYmxlLWRlYnVnIC0tZGlzYWJsZS12YWxn
cmluZCINCj4gPg0KPiA+IMKgIyBIYWNrIHRvIGdldCBTVEFHSU5HX0xJQkRJUiBpbnRvIHRoZSBs
aW5rZXIgcGF0aCB3aGVuIGJ1aWxkaW5nDQo+ID4gLUNDID0gIiR7Q0NBQ0hFfSAke0hPU1RfUFJF
RklYfWdjYyAtTCR7U1RBR0lOR19MSUJESVJ9Ig0KPiA+ICtDQyArPSAiLUwke1NUQUdJTkdfTElC
RElSfSINCj4gDQo+IFRoaXMgbG9va3MgbGlrZSBwYXJ0IG9mIExERkxBR1MgbW9yZSB0aGFuIEND
IHRvIG1lLg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLmxpbnV4dG9nby5vcmcv
Y2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo=


