Return-Path: <Holger.Behrens@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1876CDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 10:49:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAMAn60b002540
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Nov 2013 02:49:06 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.149]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0347.000;
	Fri, 22 Nov 2013 02:49:06 -0800
From: "Behrens, Holger" <Holger.Behrens@windriver.com>
To: "Hart, Darren" <darren.hart@intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [PATCH] ia32-base: Remove cpio and ext3 defaults
Thread-Index: AQHO5tS/V2lnVXEvsUOBFV10l1ehdJoxEnOw
Date: Fri, 22 Nov 2013 10:49:05 +0000
Message-ID: <7A688B48FC95D148BFE83E098348BE5055CD82DC@ALA-MBA.corp.ad.wrs.com>
References: <1385047536.16887.137.camel@ted>
	<1385050308.20337.16.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1385050308.20337.16.camel@dvhart-mobl4.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.204.213]
MIME-Version: 1.0
Cc: "meta-intel@yoctoproject.org" <meta-intel@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ia32-base: Remove cpio and ext3 defaults
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
X-List-Received-Date: Fri, 22 Nov 2013 10:49:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBPbiBUaHUsIDIwMTMtMTEtMjEgYXQgMTU6MjUgKzAwMDAsIFJpY2hhcmQgUHVyZGllIHdyb3Rl
Og0KPiA+IE9uIHJlYWwgSUEgaGFyZHdhcmUsIG5laXRoZXIgdGhlIGV4dDMgb3IgY3BpbyBpbWFn
ZXMgYXJlIHBhcnRpY3VsYXJseSB1c2VmdWwNCj4gPiBvciB1c2VkLiBjcGlvIGlzIGxlZ2FjeSBm
cm9tIGluaXRyYW1mcyBhbmQgdGhhdCBzcGVjaWZpYyBpbWFnZSBub3cgb3ZlcnJpZGVzDQo+ID4g
RlNUWVBFUyBhY2NvcmRpbmdseS4gVGhlIHNpemUgZGlmZmVyZW5jZSBpbiBmaWxlc3lzdGVtcyBt
YWtlcyBleHQzIGFzIGEgZmlsZQ0KPiA+IGZvcm1hdCBsZXNzIHVzZWZ1bCwgbWFpbmx5IGJlaW5n
IHVzZWZ1bCBpbiB0aGUgcWVtdSBjYXNlLg0KPiA+DQo+ID4gV2hlbiBuZWVkZWQgdXNlcnMgY2Fu
IHN0aWxsIG92ZXJyaWRlIHRoZSBkZWZhdWx0IEZTVFlQRVMgc28gaGF2aW5nDQo+ID4gc2FuZXIg
ZGVmYXVsdHMgbWFrZXMgc2Vuc2UuIFRoaXMgaW1wcm92ZXMgYnVpbGQgdGltZXMgYW5kIHVzZXMg
bGVzcw0KPiA+IG5ldHdvcmsgYmFuZHdpZHRoIGZvciBidWlsZHMgYW5kIHJlbGVhc2VzLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmc+DQo+IA0KPiBJJ20gZmluZSB3aXRoIHRoaXMsIGFsdGhvdWdoIGl0IHJh
aXNlcyB0aGUgcXVlc3Rpb24gaWYgd2Ugb3VnaHQgdG8gYmUNCj4gZG9pbmcgYW55dGhpbmcgbW9y
ZSB0aGFuIHRhciByb290ZnMgaW4gaW5jbHVkZSBmaWxlcyBsaWtlIHRoaXMuIHRoZXJlDQo+IGFy
ZSBpYTMyIG1hY2hpbmVzIHdoZXJlIGEgbGl2ZSBpbWFnZSBpcyBub3QgdXNlZnVsIChhbHRob3Vn
aCByYXJlKS4gTW9zdA0KPiB4ODYgQlNQcyB3b3VsZCBhZGQgbGl2ZSAtIGJ1dCB0aGVuIGFnYWlu
LCBtb3N0IHg4NiBCU1BzIHdpbGwgYmUgc3RhcnRpbmcNCj4gdG8gY29uc29saWRhdGUgb24gdGhl
IGdlbmVyaWN4ODYgQlNQcyBhbnl3YXkuLi4uDQoNCmxpdmUgaW1hZ2UgZG9lcyBub3QgYnVpbGQg
aW4gY2FzZSBvZiBJTkNPTVBBVElCRV9MSUNFTlNFID0gR1BMdjMNCg0KSG9sZ2VyDQoNCj4gQnV0
LCB0aGlzIGlzIGEgY2xlYXIgaW1wcm92ZW1lbnQgYXMgaXMuDQo+IA0KPiBBY2tlZC1ieTogRGFy
cmVuIEhhcnQgPGR2aGFydEBsaW51eC5pbnRlbC5jb20+DQo+IA0KPiA+IC0tLQ0KPiA+IGRpZmYg
LS1naXQgYS9tZXRhL2NvbmYvbWFjaGluZS9pbmNsdWRlL2lhMzItYmFzZS5pbmMNCj4gYi9tZXRh
L2NvbmYvbWFjaGluZS9pbmNsdWRlL2lhMzItYmFzZS5pbmMNCj4gPiBpbmRleCA4YTIwYmNhLi5l
MTVmOTI3IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvaWEzMi1i
YXNlLmluYw0KPiA+ICsrKyBiL21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvaWEzMi1iYXNlLmlu
Yw0KPiA+IEBAIC0xMCw3ICsxMCw3IEBAIE1BQ0hJTkVfRkVBVFVSRVMgKz0gInNjcmVlbiBrZXli
b2FyZCBwY2kgdXNiaG9zdA0KPiBleHQyIGV4dDMgeDg2IFwNCj4gPg0KPiA+ICBNQUNISU5FX0VY
VFJBX1JSRUNPTU1FTkRTICs9ICJrZXJuZWwtbW9kdWxlcyINCj4gPg0KPiA+IC1JTUFHRV9GU1RZ
UEVTICs9ICJleHQzIGNwaW8uZ3ogbGl2ZSINCj4gPiArSU1BR0VfRlNUWVBFUyArPSAibGl2ZSIN
Cj4gPg0KPiA+ICBLRVJORUxfSU1BR0VUWVBFID89ICJiekltYWdlIg0KPiA+DQo+ID4NCj4gPg0K
PiANCj4gLS0NCj4gRGFycmVuIEhhcnQNCj4gSW50ZWwgT3BlbiBTb3VyY2UgVGVjaG5vbG9neSBD
ZW50ZXINCj4gWW9jdG8gUHJvamVjdCAtIExpbnV4IEtlcm5lbA0KPiANCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWNvcmUg
bWFpbGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1i
ZWRkZWQtY29yZQ0K

