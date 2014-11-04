Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9766C65DEB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 06:59:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA46xBos016420
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Nov 2014 22:59:12 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.16]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Mon, 3 Nov 2014 22:59:11 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH] linux-firmware: resolve linux-firmware and
	microcode-ctl file conflicts
Thread-Index: AQHP7fm5g/JD1yFTY02R9vyp4IqArZw9Ix8QgBL6UQA=
Date: Tue, 4 Nov 2014 06:59:10 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD548ACB@ALA-MBA.corp.ad.wrs.com>
References: <1413966997-3361-1-git-send-email-jackie.huang@windriver.com>
	<CAP9ODKpSoNU5CgCYngdJ3=FJf-T11CX+F=0365k1zK53zw1F9g@mail.gmail.com> 
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.133]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: resolve linux-firmware and microcode-ctl file conflicts
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
X-List-Received-Date: Tue, 04 Nov 2014 06:59:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSHVhbmcsIEppZSAoSmFj
a2llKQ0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyMywgMjAxNCAxOjE0IFBNDQo+IFRvOiAn
T3RhdmlvIFNhbHZhZG9yJw0KPiBDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhl
IG9lLWNvcmUgbGF5ZXINCj4gU3ViamVjdDogUkU6IFtPRS1jb3JlXSBbUEFUQ0hdIGxpbnV4LWZp
cm13YXJlOiByZXNvbHZlIGxpbnV4LWZpcm13YXJlIGFuZCBtaWNyb2NvZGUtY3RsIGZpbGUgY29u
ZmxpY3RzDQo+IA0KPiANCj4gDQo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBG
cm9tOiBvdGF2aW8uc2FsdmFkb3JAZ21haWwuY29tIFttYWlsdG86b3RhdmlvLnNhbHZhZG9yQGdt
YWlsLmNvbV0gT24NCj4gPiBCZWhhbGYgT2YgT3RhdmlvIFNhbHZhZG9yDQo+ID4gU2VudDogV2Vk
bmVzZGF5LCBPY3RvYmVyIDIyLCAyMDE0IDk6MTIgUE0NCj4gPiBUbzogSHVhbmcsIEppZSAoSmFj
a2llKQ0KPiA+IENjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBs
YXllcg0KPiA+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBsaW51eC1maXJtd2FyZTog
cmVzb2x2ZSBsaW51eC1maXJtd2FyZQ0KPiA+IGFuZCBtaWNyb2NvZGUtY3RsIGZpbGUgY29uZmxp
Y3RzDQo+ID4NCj4gPiBPbiBXZWQsIE9jdCAyMiwgMjAxNCBhdCA2OjM2IEFNLCAgPGphY2tpZS5o
dWFuZ0B3aW5kcml2ZXIuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IFl1ZSBUYW8gPHl1ZS50YW9A
d2luZHJpdmVyLmNvbT4NCj4gPiA+DQo+ID4gPiBVc2UgYWx0ZXJuYXRpdmVzIG1lY2hhbmlzbSB0
byBwcmV2ZW50IGxpbnV4LWZpcm13YXJlIGFuZA0KPiA+ID4gbWljcm9jb2RlLWN0bCBiaW4gZmls
ZXMgZnJvbSBjYXVzaW5nIGNvbmZsaWN0cy4NCj4gPiA+DQo+ID4gPiBUaGUgZXJyb3IgaXMgOg0K
PiA+ID4NCj4gPiA+IGVycm9yOiBmaWxlIC9saWIvZmlybXdhcmUvYW1kLXVjb2RlL21pY3JvY29k
ZV9hbWQuYmluIGZyb20gaW5zdGFsbA0KPiA+ID4gb2YgbGludXgtZmlybXdhcmUgY29uZmxpY3Rz
IHdpdGggZmlsZSBmcm9tIHBhY2thZ2UNCj4gPiA+IG1pY3JvY29kZS1jdGwtZmlybXdhcmUNCj4g
PiA+DQo+ID4gPiBlcnJvcjogZmlsZSAvbGliL2Zpcm13YXJlL2FtZC11Y29kZS9taWNyb2NvZGVf
YW1kX2ZhbTE1aC5iaW4gZnJvbQ0KPiA+ID4gaW5zdGFsbCBvZiBsaW51eC1maXJtd2FyZSBjb25m
bGljdHMgd2l0aCBmaWxlIGZyb20gcGFja2FnZQ0KPiA+ID4gbWljcm9jb2RlLWN0bC1maXJtd2Fy
ZQ0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1ZSBUYW8gPHl1ZS50YW9Ad2luZHJpdmVy
LmNvbT4NCj4gPg0KPiA+ICogVGhlIGZpcm13YXJlIHNob3VsZCBiZSBzcGxpdCBpbiBhIHNwZWNp
ZmljIHBhY2thZ2UsIGlmIHBvc3NpYmxlIChpbg0KPiA+IGEgc2VwYXJhdGVkIHBhdGNoKQ0KPiAN
Cj4gVGhhbmtzIGZvciBwb2ludGluZyB0aGlzLCBJIHdpbGwgcmUtd29yayBvbiBpdC4NCj4gDQo+
ID4gKiBtaWNyb2NvZGUtY3RsLWZpcm13YXJlIGRvZXMgbm90IGV4aXN0IGhlcmUNCj4gDQo+IFll
cywgSSBrbm93LCBidXQgd2UgaGF2ZSBpdCBpbiBvdXIgb3duIGxheWVyLg0KPiANCj4gPiAqIG1p
Y3JvY29kZS1jdGwtZmlybXdhcmUgc2VlbXMgdXNlbGVzcyBpZiB5b3UgY2FuIHJlbHkgb24gbGlu
dXgtZmlybXdhcmUgdG8gcHJvdmlkZSB0aGUgZmlsZS4NCj4gDQo+IE1heWJlLCBidXQgc29tZW9u
ZSBtYXkgY2hvb3NlIHRvIHVzZSB0aGUgb25lIHByb3ZpZGVkIGJ5IG1pY3JvY29kZS1jdGwtZmly
bXdhcmUuDQoNCldlIGhhdmUgZml4ZWQgdGhpcyBpbiBtaWNyb2NvZGUtY3RsLWZpcm13YXJlLCBz
byB0aGlzIHBhdGNoIGlzIG5vdCBuZWVkZWQuDQoNClRoYW5rcywNCkphY2tpZQ0KDQo+IA0KPiBU
aGFua3MsDQo+IEphY2tpZQ0KPiANCj4gPg0KPiA+IC0tDQo+ID4gT3RhdmlvIFNhbHZhZG9yICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBPLlMuIFN5c3RlbXMNCj4gPiBodHRwOi8vd3d3Lm9z
c3lzdGVtcy5jb20uYnIgICAgICAgIGh0dHA6Ly9jb2RlLm9zc3lzdGVtcy5jb20uYnINCj4gPiBN
b2JpbGU6ICs1NSAoNTMpIDk5ODEtNzg1NCAgICAgICAgICAgIE1vYmlsZTogKzEgKDM0NykgOTAz
LTk3NTANCg==

