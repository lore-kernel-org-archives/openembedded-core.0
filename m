Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QPlVW-0003vN-9p
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 03:06:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 May 2011 18:03:25 -0700
X-ExtLoop1: 1
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by orsmga002.jf.intel.com with ESMTP; 26 May 2011 18:03:25 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi;
	Thu, 26 May 2011 18:03:25 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 May 2011 18:03:24 -0700
Thread-Topic: [OE-core] [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
Thread-Index: AcwcBk+LjLgCJR4MQTieQMtu49vgCQAA08Nw
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94D97FA204@orsmsx504.amr.corp.intel.com>
References: <cover.1306442263.git.nitin.a.kamble@intel.com>
	<03152273cac84eef23738c5f26c45b082194284f.1306442263.git.nitin.a.kamble@intel.com>
	<1306452822.27470.220.camel@rex>
	<BANLkTinP=ioZdAqSffASK6X2RUhkpdcR6w@mail.gmail.com>
In-Reply-To: <BANLkTinP=ioZdAqSffASK6X2RUhkpdcR6w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [bugfix 1/1] mesa-xlib: workaround gcc 4.6.0 ICE
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
X-List-Received-Date: Fri, 27 May 2011 01:06:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNv
cmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVk
LWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YNCj4gS2hl
bSBSYWoNCj4gU2VudDogVGh1cnNkYXksIE1heSAyNiwgMjAxMSA1OjM3IFBNDQo+IFRvOiBQYXRj
aGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllcg0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtidWdmaXggMS8xXSBtZXNhLXhsaWI6IHdvcmthcm91bmQgZ2NjIDQuNi4w
IElDRQ0KPiANCj4gT24gVGh1LCBNYXkgMjYsIDIwMTEgYXQgNDozMyBQTSwgUmljaGFyZCBQdXJk
aWUNCj4gPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+IE9u
IFRodSwgMjAxMS0wNS0yNiBhdCAxMzo0MSAtMDcwMCwgbml0aW4uYS5rYW1ibGVAaW50ZWwuY29t
IHdyb3RlOg0KPiA+DQo+ID4+IC0tLQ0KPiA+PiDCoG1ldGEvcmVjaXBlcy1ncmFwaGljcy9tZXNh
L21lc2EteGxpYl83LjEwLjIuYmIgfCDCoCDCoDMgKysrDQo+ID4+IMKgMSBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLXhsaWJfNy4xMC4yLmJiDQo+IGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL21lc2EvbWVzYS14bGliXzcuMTAuMi5iYg0KPiA+PiBpbmRleCBi
NzdkZjJjLi4wNTFiZDcyIDEwMDY0NA0KPiA+PiAtLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
bWVzYS9tZXNhLXhsaWJfNy4xMC4yLmJiDQo+ID4+ICsrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9tZXNhL21lc2EteGxpYl83LjEwLjIuYmINCj4gPj4gQEAgLTE3LDMgKzE3LDYgQEAgUEUgPSAi
MSINCj4gPj4gwqBQUiA9ICJyMCINCj4gPj4NCj4gPj4gwqBFWFRSQV9PRUNPTkYgKz0gIi0td2l0
aC1kcml2ZXI9eGxpYiINCj4gPj4gKw0KPiA+PiArIyBudWxsaWZ5IC1PMg0KPiA+PiArQ0ZMQUdT
X2FwcGVuZCArPSAiIC1PIg0KPiA+DQo+ID4gSSB0YWxrZWQgYWJvdXQgdGhpcyBvbiBJUkMgYnV0
IHNpbXBseSBwdXQsIG5vIHdheS4NCj4gPg0KPiA+IFRoZSBwcm9ibGVtIGlzOg0KPiA+DQo+ID4g
YSkgQXJtIHNwZWNpZmljDQo+ID4gYikgZGV0ZXJtaW5lZCBub3cgdG8gYmUgYXJtdjcgc3BlY2lm
aWMNCj4gPiBjKSBnY2MgdmVyc2lvbiBzcGVjaWZpYw0KPiA+DQo+ID4gYW5kIHRoZSBmaXggc2hv
dWxkIHJlZmxlY3QgdGhpcy4NCj4gPg0KPiA+IFNvIGlkZWFsbHkgd2hlbiB3ZSBzZWxlY3QgZ2Nj
IDQuNiBpbiB0Y21vZGUtZGVmYXVsdC5pbmMgd2Ugc2hvdWxkIGFkZA0KPiA+IHNvbWV0aGluZyB0
aGVyZSB3aGljaCBhZGRzIGEgd29yayBhcm91bmQgZm9yIG1lc2EteGxpYi4NCj4gPg0KPiA+IEkn
dmUgc3VnZ2VzdGVkIHNvbWV0aGluZyBsaWtlOg0KPiA+DQo+ID4gVEFSR0VUX0NDX0FSQ0hfYXJt
X3BuLW1lc2EteGxpYiA6PQ0KPiAiJHtAJyR7VEFSR0VUX0NDX0FSQ0h9Jy5yZXBsYWNlKCdhcm12
NycsJ2FybXY1Jyl9Ig0KPiA+DQo+ID4gd2hpY2ggd2hpbHN0IHVnbHksIHNob3VsZCBkbyB3aGF0
IHdlIG5lZWQgaXQgdG8uDQo+ID4NCj4gDQo+IEkgYWdyZWUgd2l0aCB0aGlzIHNvbHV0aW9uIGhv
d2V2ZXIgdWdseSBpdCBtYXkgbG9vayBsaWtlLiBXZSBtYXkNCj4gZG9jdW1lbnQgaXQgdG8gZXhw
bGFpbg0KPiB0aGUgdWdsaW5lc3MNCg0KVGhpcyBjb21taXQgd2VudGluIHlvY3RvIGJyYW5jaCBo
dHRwOi8vZ2l0LnBva3lsaW51eC5vcmcvY2dpdC9jZ2l0LmNnaS9wb2t5L2NvbW1pdC8/aWQ9OWJj
Y2JjNWZiYzcxYjMzMTkxMWI1NThhMmJhMTVlMGE2ZDAwNDZiNA0KDQpXaXRoIHRoaXMgZG9jdW1l
bnRhdGlvbjoNCisjIFRlbXBvcmFyeSB3b3JrYXJvdW5kIGZvciBnY2MgNC42LjAgSUNFIHdpdGgg
YmVhZ2xlYm9hcmQNCisjIGdjYyBidWc6IGh0dHA6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93
X2J1Zy5jZ2k/aWQ9NDc3MTkNCitUQVJHRVRfQ0NfQVJDSF9hcm1fcG4tbWVzYS14bGliIDo9ICIk
e0AnJHtUQVJHRVRfQ0NfQVJDSH0nLnJlcGxhY2UoJ2FybXY3LWEnLCdhcm12NScpfSINCisNCg0K
VGhhbmtzLA0KTml0aW4NCg0KPiANCj4gPiBDaGVlcnMsDQo+ID4NCj4gPiBSaWNoYXJkDQo+ID4N
Cj4gPg0KPiA+DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj4gPiBPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCj4gPiBPcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLmxpbnV4dG9n
by5vcmcvY2dpLWJpbi9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo+ID4NCj4g
DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IE9w
ZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0cy5saW51eHRvZ28ub3JnL2NnaS1iaW4vbWFp
bG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0K


