Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E5AD860034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 17:44:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2IHiFYO020413
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Mar 2015 10:44:15 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.14]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0224.002;
	Wed, 18 Mar 2015 10:44:15 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Bernhard
	Reutner-Fischer" <rep.dot.nop@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/1] package.bbclass: decouple
	splitting	and stripping
Thread-Index: AQHQXeAZzKL3byAnW0KqC6YuZWNl3J0hqeIAgADfnRA=
Date: Wed, 18 Mar 2015 17:44:14 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF847769E93E@ALA-MBA.corp.ad.wrs.com>
References: <1426283873-11784-1-git-send-email-jslater@windriver.com>
	<4010D2ED-6067-4B6B-9C27-B2C5FC465DC9@gmail.com>
	<1426627208.23698.39.camel@linuxfoundation.org>
In-Reply-To: <1426627208.23698.39.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.76]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] package.bbclass: decouple splitting	and stripping
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
X-List-Received-Date: Wed, 18 Mar 2015 17:44:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBqdXN0IGZvdW5kIG91dCB0aGF0IHRoaXMgcGF0Y2ggd2lsbCBicmVhayBxYSBmb3IgbHRwIHBh
Y2thZ2luZy4gIFRoZSBsdHAgcmVjaXBlDQppbmhpYml0cyBzdHJpcHBpbmcgd2hpY2ggdXNlZCB0
byBpbmhpYml0IHNwbGl0dGluZy4gIElmIHNwbGl0dGluZyBpcyBlbmFibGVkLA0KdGhlcmUgYXJl
IHNldmVyYWwgLmRlYnVnIGRpcmVjdG9yaWVzIGluIHBsYWNlcyBwYWNrYWdlcy5iYmNsYXNzIGRv
ZXNuJ3QgbG9vaywgc28NCnRoZXkgd2luZCB1cCBpbiBsdHAsIG5vdCBsdHAtZGJnLg0KDQpJdCdz
IHRlbXB0aW5nIGp1c3QgdG8gaW5oaWJpdCBzcGxpdHRpbmcgc2luY2UgdGhhdCB3YXMgbmV2ZXIg
cmVhbGx5IGRvbmUgYmVmb3JlLCBhbnlob3csDQpidXQgSSBzdXBwb3NlIHRoYXQncyBub3QgdGhl
IHJpZ2h0IHdheSB0byBmaXggaXQuDQoNCkpvZQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCAxNywgMjAxNSAyOjIwIFBN
DQo+IFRvOiBCZXJuaGFyZCBSZXV0bmVyLUZpc2NoZXINCj4gQ2M6IFNsYXRlciwgSm9zZXBoOyBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW29lLWNvcmVdW1BBVENIIDEvMV0gcGFja2FnZS5iYmNsYXNzOiBkZWNvdXBsZSBz
cGxpdHRpbmcgYW5kDQo+IHN0cmlwcGluZw0KPiANCj4gT24gRnJpLCAyMDE1LTAzLTEzIGF0IDIz
OjUwICswMTAwLCBCZXJuaGFyZCBSZXV0bmVyLUZpc2NoZXIgd3JvdGU6DQo+ID4gT24gTWFyY2gg
MTMsIDIwMTUgMTA6NTc6NTMgUE0gR01UKzAxOjAwLCBKb2UgU2xhdGVyIDxqc2xhdGVyQHdpbmRy
aXZlci5jb20+IHdyb3RlOg0KPiA+ID5GaXggbG9naWMgaW4gc3BsaXRfYW5kX3N0cmlwX2ZpbGVz
KCkgdG8gYWxsb3cgc3BsaXR0aW5nIG9yDQo+ID4gPnN0cmlwcGluZyBpbmRlcGVuZGVudGx5LiAg
V2UgYWxzbyByZXR1cm4gcXVpY2tseSBmcm9tIHRoaXMNCj4gPiA+ZnVuY3Rpb24gaWYgd2UgaGF2
ZSBub3RoaW5nIHRvIGRvLiAgV2Ugc2VlayB0aGUgZm9sbG93aW5nIGJlaGF2aW9yOg0KPiA+ID4N
Cj4gPiA+U3RyaXAgLyBTcGxpdCAgICAgQmVoYXZpb3INCj4gPiA+eWVzICAgLyB5ZXMgICAgICAg
YmluYXJpZXMgc3RyaXBwZWQ7IGRlYnVnIGluZm8gYW5kIHNvdXJjZSBpbiAtZGJnDQo+ID4gPm5v
ICAgIC8geWVzICAgICAgIGRlYnVnIGluZm8gYW5kIHNvdXJjZSBpbiAtZGJnDQo+ID4gPnllcyAg
IC8gbm8gICAgICAgIGJpbmFyaWVzIHN0cmlwcGVkOyAtZGJnIHBhY2thZ2VzIGVtcHR5DQo+ID4g
Pm5vICAgIC8gbm8gICAgICAgIC1kYmcgcGFja2FnZXMgZW1wdHkgKG5vdCBhIHZlcnkgdXNlZnVs
IGNhc2UpDQo+ID4gPg0KPiA+ID5DdXJyZW50bHksIG5vL3llcyBkb2VzIG5vdCB3b3JrIGFuZCBp
cyB0aGUgc2FtZSBhcyBuby9uby4NCj4gPiA+DQo+ID4gPlNpZ25lZC1vZmYtYnk6IEpvZSBTbGF0
ZXIgPGpzbGF0ZXJAd2luZHJpdmVyLmNvbT4NCj4gPiA+LS0tDQo+ID4gPm1ldGEvY2xhc3Nlcy9w
YWNrYWdlLmJiY2xhc3MgfCAgMTA4DQo+ID4gPisrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiA+ID4gMSBmaWxlIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKyksIDUx
IGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+ZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9wYWNr
YWdlLmJiY2xhc3MNCj4gPiA+Yi9tZXRhL2NsYXNzZXMvcGFja2FnZS5iYmNsYXNzDQo+ID4gPmlu
ZGV4IDlmNjRlZDcuLmFkODc3MWYgMTAwNjQ0DQo+ID4gPi0tLSBhL21ldGEvY2xhc3Nlcy9wYWNr
YWdlLmJiY2xhc3MNCj4gPiA+KysrIGIvbWV0YS9jbGFzc2VzL3BhY2thZ2UuYmJjbGFzcw0KPiA+
ID5AQCAtODEyLDYgKzgxMiwxMiBAQCBweXRob24gZml4dXBfcGVybXMgKCkgew0KPiA+ID4gfQ0K
PiA+ID4NCj4gPiA+IHB5dGhvbiBzcGxpdF9hbmRfc3RyaXBfZmlsZXMgKCkgew0KPiA+DQo+ID4g
PisgICAgZm9yIHJvb3QsIGRpcnMsIGZpbGVzIGluIGNwYXRoLndhbGsoZHZhcik6DQo+ID4gPisg
ICAgICAgIGZvciBmIGluIGZpbGVzOg0KPiA+ID4rICAgICAgICAgICAgZmlsZSA9IG9zLnBhdGgu
am9pbihyb290LCBmKQ0KPiA+ID4rICAgICAgICAgICAgaWYgZmlsZS5lbmRzd2l0aCgiLmtvIikg
YW5kIGZpbGUuZmluZCgiL2xpYi9tb2R1bGVzLyIpICE9DQo+ID4gPi0xOg0KPiA+ID4rICAgICAg
ICAgICAgICAgIGtlcm5tb2RzLmFwcGVuZChmaWxlKQ0KPiA+ID4rICAgICAgICAgICAgICAgIGNv
bnRpbnVlDQo+ID4gPg0KPiA+ID4rICAgICAgICAgICAgIyBTa2lwIGRlYnVnIGZpbGVzDQo+ID4g
PisgICAgICAgICAgICBpZiBkZWJ1Z2FwcGVuZCBhbmQgZmlsZS5lbmRzd2l0aChkZWJ1Z2FwcGVu
ZCk6DQo+ID4gPisgICAgICAgICAgICAgICAgY29udGludWUNCj4gPiA+KyAgICAgICAgICAgIGlm
IGRlYnVnZGlyIGFuZCBkZWJ1Z2RpciBpbg0KPiA+ID5vcy5wYXRoLmRpcm5hbWUoZmlsZVtsZW4o
ZHZhcik6XSk6DQo+ID4gPisgICAgICAgICAgICAgICAgY29udGludWUNCj4gPiA+Kw0KPiA+DQo+
ID4gSXQncyBhIHBpdHkgdG8gZmlyc3QgY29uc3RydWN0IHRoZSBmaWxlcyBqdXN0IHRvIHRocm93
IHRoZW0gYXdheSByaWdodCBhZnRlcndhcmRzLg0KPiA+IE1heWJlIHRoZXJlIGFyZSBvdGhlciBj
cGF0aC53YWxrIHNwb3RzIHRoYXQgd291bGQgYmVuZWZpdCBmcm9tIGZpbGVfbm90X2VuZHN3aXRo
IGFuZCBkaXINCj4gZmlsdGVycz8NCj4gDQo+IEZXSVcgY3BhdGggaXMgYWN0dWFsbHkgYSBjYWNo
aW5nIHdyYXBwZXIgYXJvdW5kIG9zLnBhdGggc28gdGhlcmUgaXMgc29tZQ0KPiBhbW91bnQgb2Yg
Y2FjaGluZyBnb2luZyBvbiBoZXJlIGJlaGluZCB0aGUgc2NlbmVzLiBUaGUgY3VycmVudCBjb2Rl
IGhhcw0KPiBiZWVuIHByb2ZpbGVkIGFuZCB0aGUgd29yc3QgaG90IHNwb3RzIHdvcmtlZCBhcm91
bmQgd2l0aCB0aGUgY2FjaGUuLi4NCj4gDQo+IEl0cyBub3QgcGVyZmVjdCBhbmQgSSBkb24ndCBk
b3VidCBtb3JlIGNvdWxkIGJlIGRvbmUgYnV0IHRoZXNlIHBpZWNlcyBkbw0KPiBzZWVtIHRvIGhl
bHAgYSBsb3QuIFRoZSBiZXN0IHRoaW5nIHdlIGRpZCBpcyBhdm9pZCBhIGxvdCBvZiBzeXNjYWxs
DQo+IG92ZXJoZWFkLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQo=

