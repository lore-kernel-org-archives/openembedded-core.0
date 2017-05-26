Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 74AF778242
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 02:38:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="19325651"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 May 2017 10:38:21 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 7727E47C653C;
	Fri, 26 May 2017 10:38:20 +0800 (CST)
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0319.002; Fri, 26 May 2017 10:38:20 +0800
From: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH v2] curl: fix libssl error for ARMv8
Thread-Index: AQHS1P0x23HFQ25qMUqYcHZMCPtkPaIE2gyAgAENXxA=
Date: Fri, 26 May 2017 02:38:20 +0000
Message-ID: <97F7C8E70D26E94FA7E05578493F65C60E017760@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1495678712-44204-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAJ86T=W++TQhRcupbLoACVLTEmEzZRmQUaYZqFFh23+Zwq6X4w@mail.gmail.com>
In-Reply-To: <CAJ86T=W++TQhRcupbLoACVLTEmEzZRmQUaYZqFFh23+Zwq6X4w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.81]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 7727E47C653C.A9B1D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] curl: fix libssl error for ARMv8
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
X-List-Received-Date: Fri, 26 May 2017 02:38:25 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLEkgY29uZmlybWVkIG90aGVyIHRoYW4gQVJNdjggMzJCRS5jdXJsK2du
dXRscyBjYW4gd29yayB3ZWxsLg0KQmVjYXVzZSB3ZSBoYXZlIHRoZSBzYW1l
IHNlcnZlcixhbmQgd2UgZXhlY3V0ZSBjdXJsIC1rIGh0dHBzOi8veHh4LGJ1
dCBvbmx5IEFSTXY4IDMyQkUgZmFpbGVkIGFuZCBvdXRwdXQgdGhlIGVycm9y
IG1lc3NhZ2UuDQoNCmh1YW5ncXkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBBbmRyZSBNY0N1cmR5IFttYWlsdG86YXJtY2N1
cmR5QGdtYWlsLmNvbV0NCj4gU2VudDogRnJpZGF5LCBNYXkgMjYsIDIwMTcg
MjozMSBBTQ0KPiBUbzogSHVhbmcsIFFpeXUv6buEIOeQpuWuhyA8aHVhbmdx
eS5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPiBDYzogT0UgQ29yZSBtYWlsaW5n
IGxpc3QgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYyXSBjdXJs
OiBmaXggbGlic3NsIGVycm9yIGZvciBBUk12OA0KPiANCj4gT24gV2VkLCBN
YXkgMjQsIDIwMTcgYXQgNzoxOCBQTSwgSHVhbmcgUWl5dSA8aHVhbmdxeS5m
bnN0QGNuLmZ1aml0c3UuY29tPg0KPiB3cm90ZToNCj4gPiBjdXJsICsgZ251
dGxzIGNhbiBub3Qgd29yayBvbiBBUk12OCAzMkJFLCBzbyBjaGFuZ2UgaXQg
dG8gY3VybCArIHNzbCB3aGVuIHRoZQ0KPiB0YXJnZXQgaXMgYWFyY2g2NC4N
Cj4gPg0KPiA+IFRoZSBlcnJvciBpcyBhcyBmb2xsb3c6DQo+ID4gY3VybDog
KDM1KSBnbnV0bHNfaGFuZHNoYWtlKCkgZmFpbGVkOiBCYWQgcmVjb3JkIE1B
Qw0KPiANCj4gR29vZ2xpbmcgZm9yIHRoYXQgZXJyb3IgbWVzc2FnZSBicmlu
Z3MgdXAgdGhlIGZvbGxvd2luZyB0aHJlYWQsIHdoaWNoIGlzbid0IHZlcnkN
Cj4gY29uY2x1c2l2ZSBidXQgc3VnZ2VzdHMgdGhlIHJvb3QgY2F1c2UgaXMg
dGhlIHNlcnZlcg0KPiBjb25maWd1cmF0aW9uOg0KPiANCj4gICBodHRwczov
L2xpc3RzLmdudS5vcmcvYXJjaGl2ZS9odG1sL2hlbHAtZ251dGxzLzIwMTMt
MDEvdGhyZWFkcy5odG1sIzAwMDA2DQo+IA0KPiBIYXZlIHlvdSBjb25maXJt
ZWQgdGhhdCBjdXJsICsgZ251dGxzIGJ1aWx0IGZvciB0YXJnZXRzIG90aGVy
IHRoYW4NCj4gQVJNdjggMzJCRSBhbmQgYWFyY2g2NCB3b3JrcyBPSyB3aXRo
IHlvdXIgc2VydmVyPw0KPiANCj4gPiBXaGVuIHNldCBtYWNoaW5lIHRvIHFl
bXVhcm02NCBpbiBsb2NhbC5jb25mLCB0aGlzIHBhdGNoIHdpbGwgd29yay4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFFpeXUgPGh1YW5ncXku
Zm5zdEBjbi5mdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvY3VybC9jdXJsXzcuNTQuMC5iYiB8IDEgKw0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfNy41NC4w
LmJiDQo+ID4gYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfNy41
NC4wLmJiDQo+ID4gaW5kZXggY2U1Y2EzNy4uNzQyMTYxNyAxMDA2NDQNCj4g
PiAtLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfNy41NC4w
LmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJs
XzcuNTQuMC5iYg0KPiA+IEBAIC0yMSw2ICsyMSw3IEBAIENWRV9QUk9EVUNU
ID0gImxpYmN1cmwiDQo+ID4gIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZp
ZyBiaW5jb25maWcgbXVsdGlsaWJfaGVhZGVyDQo+ID4NCj4gPiAgUEFDS0FH
RUNPTkZJRyA/Pz0gIiR7QGJiLnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRV
UkVTJywgJ2lwdjYnLCBkKX0NCj4gZ251dGxzIHByb3h5IHpsaWIiDQo+ID4g
K1BBQ0tBR0VDT05GSUdfYWFyY2g2NCA/Pz0gIiR7QGJiLnV0aWxzLmNvbnRh
aW5zKCJESVNUUk9fRkVBVFVSRVMiLA0KPiAiaXB2NiIsICJpcHY2IiwgIiIs
IGQpfSBzc2wgcHJveHkgemxpYiINCj4gPiAgUEFDS0FHRUNPTkZJR19jbGFz
cy1uYXRpdmUgPSAiaXB2NiBwcm94eSBzc2wgemxpYiINCj4gPiAgUEFDS0FH
RUNPTkZJR19jbGFzcy1uYXRpdmVzZGsgPSAiaXB2NiBwcm94eSBzc2wgemxp
YiINCj4gPg0KPiA+IC0tDQo+ID4gMi43LjQNCj4gPg0KPiA+DQo+ID4NCj4g
PiAtLQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+ID4gT3BlbmVtYmVkZGVkLWNvcmUgbWFpbGluZyBs
aXN0DQo+ID4gT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCj4gDQoNCgoK

