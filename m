Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA4F601F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 05:14:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9N5EKia011429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Oct 2014 22:14:20 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.18]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Wed, 22 Oct 2014 22:14:20 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH] linux-firmware: resolve linux-firmware and
	microcode-ctl file conflicts
Thread-Index: AQHP7fm5g/JD1yFTY02R9vyp4IqArZw9Ix8Q
Date: Thu, 23 Oct 2014 05:14:19 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABD53050B@ALA-MBB.corp.ad.wrs.com>
References: <1413966997-3361-1-git-send-email-jackie.huang@windriver.com>
	<CAP9ODKpSoNU5CgCYngdJ3=FJf-T11CX+F=0365k1zK53zw1F9g@mail.gmail.com>
In-Reply-To: <CAP9ODKpSoNU5CgCYngdJ3=FJf-T11CX+F=0365k1zK53zw1F9g@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.163.160]
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
X-List-Received-Date: Thu, 23 Oct 2014 05:14:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3RhdmlvLnNhbHZhZG9y
QGdtYWlsLmNvbSBbbWFpbHRvOm90YXZpby5zYWx2YWRvckBnbWFpbC5jb21dIE9uIEJlaGFsZiBP
ZiBPdGF2aW8gU2FsdmFkb3INCj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDIyLCAyMDE0IDk6
MTIgUE0NCj4gVG86IEh1YW5nLCBKaWUgKEphY2tpZSkNCj4gQ2M6IFBhdGNoZXMgYW5kIGRpc2N1
c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0g
W1BBVENIXSBsaW51eC1maXJtd2FyZTogcmVzb2x2ZSBsaW51eC1maXJtd2FyZSBhbmQgbWljcm9j
b2RlLWN0bCBmaWxlIGNvbmZsaWN0cw0KPiANCj4gT24gV2VkLCBPY3QgMjIsIDIwMTQgYXQgNjoz
NiBBTSwgIDxqYWNraWUuaHVhbmdAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogWXVl
IFRhbyA8eXVlLnRhb0B3aW5kcml2ZXIuY29tPg0KPiA+DQo+ID4gVXNlIGFsdGVybmF0aXZlcyBt
ZWNoYW5pc20gdG8gcHJldmVudCBsaW51eC1maXJtd2FyZSBhbmQgbWljcm9jb2RlLWN0bA0KPiA+
IGJpbiBmaWxlcyBmcm9tIGNhdXNpbmcgY29uZmxpY3RzLg0KPiA+DQo+ID4gVGhlIGVycm9yIGlz
IDoNCj4gPg0KPiA+IGVycm9yOiBmaWxlIC9saWIvZmlybXdhcmUvYW1kLXVjb2RlL21pY3JvY29k
ZV9hbWQuYmluIGZyb20gaW5zdGFsbCBvZg0KPiA+IGxpbnV4LWZpcm13YXJlIGNvbmZsaWN0cyB3
aXRoIGZpbGUgZnJvbSBwYWNrYWdlIG1pY3JvY29kZS1jdGwtZmlybXdhcmUNCj4gPg0KPiA+IGVy
cm9yOiBmaWxlIC9saWIvZmlybXdhcmUvYW1kLXVjb2RlL21pY3JvY29kZV9hbWRfZmFtMTVoLmJp
biBmcm9tDQo+ID4gaW5zdGFsbCBvZiBsaW51eC1maXJtd2FyZSBjb25mbGljdHMgd2l0aCBmaWxl
IGZyb20gcGFja2FnZQ0KPiA+IG1pY3JvY29kZS1jdGwtZmlybXdhcmUNCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFl1ZSBUYW8gPHl1ZS50YW9Ad2luZHJpdmVyLmNvbT4NCj4gDQo+ICogVGhlIGZp
cm13YXJlIHNob3VsZCBiZSBzcGxpdCBpbiBhIHNwZWNpZmljIHBhY2thZ2UsIGlmIHBvc3NpYmxl
IChpbiBhIHNlcGFyYXRlZCBwYXRjaCkNCg0KVGhhbmtzIGZvciBwb2ludGluZyB0aGlzLCBJIHdp
bGwgcmUtd29yayBvbiBpdC4NCg0KPiAqIG1pY3JvY29kZS1jdGwtZmlybXdhcmUgZG9lcyBub3Qg
ZXhpc3QgaGVyZQ0KDQpZZXMsIEkga25vdywgYnV0IHdlIGhhdmUgaXQgaW4gb3VyIG93biBsYXll
ci4NCg0KPiAqIG1pY3JvY29kZS1jdGwtZmlybXdhcmUgc2VlbXMgdXNlbGVzcyBpZiB5b3UgY2Fu
IHJlbHkgb24gbGludXgtZmlybXdhcmUgdG8gcHJvdmlkZSB0aGUgZmlsZS4NCg0KTWF5YmUsIGJ1
dCBzb21lb25lIG1heSBjaG9vc2UgdG8gdXNlIHRoZSBvbmUgcHJvdmlkZWQgYnkgbWljcm9jb2Rl
LWN0bC1maXJtd2FyZS4NCg0KVGhhbmtzLA0KSmFja2llDQoNCj4gDQo+IC0tDQo+IE90YXZpbyBT
YWx2YWRvciAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTy5TLiBTeXN0ZW1zDQo+IGh0dHA6
Ly93d3cub3NzeXN0ZW1zLmNvbS5iciAgICAgICAgaHR0cDovL2NvZGUub3NzeXN0ZW1zLmNvbS5i
cg0KPiBNb2JpbGU6ICs1NSAoNTMpIDk5ODEtNzg1NCAgICAgICAgICAgIE1vYmlsZTogKzEgKDM0
NykgOTAzLTk3NTANCg==

