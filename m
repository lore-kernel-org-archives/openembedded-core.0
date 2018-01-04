Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF2B770057
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 01:31:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w041VstX009630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 3 Jan 2018 17:31:57 -0800
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.62]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Wed, 3 Jan 2018 17:31:52 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 0/2 v2] glibc: fixes for nscd and libnss-db
Thread-Index: AQHTU6XbDhJwwAOIpEihfeLlRZsSNKNO65YggBQn1oCAADd+sA==
Date: Thu, 4 Jan 2018 01:31:51 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA01566C6D76@ALA-MBC.corp.ad.wrs.com>
References: <cover.1509604697.git.jackie.huang@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AA01566B9AEB@ALA-MBC.corp.ad.wrs.com>
	<1514987639.5525.138.camel@linuxfoundation.org>
In-Reply-To: <1514987639.5525.138.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.163.136]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2 v2] glibc: fixes for nscd and libnss-db
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
X-List-Received-Date: Thu, 04 Jan 2018 01:31:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
W21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBXZWRu
ZXNkYXksIEphbnVhcnkgMDMsIDIwMTggMjE6NTQNCj4gVG86IEh1YW5nLCBKaWUgKEphY2tpZSk7
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6
IFtPRS1jb3JlXSBbUEFUQ0ggMC8yIHYyXSBnbGliYzogZml4ZXMgZm9yIG5zY2QgYW5kIGxpYm5z
cy1kYg0KPiANCj4gT24gRnJpLCAyMDE3LTEyLTIyIGF0IDAyOjA4ICswMDAwLCBIdWFuZywgSmll
IChKYWNraWUpIHdyb3RlOg0KPiA+IFBpbmcsIEkgZGlkbid0IHNlZSBhbnkgb2JqZWN0aW9uIG9u
IHRoaXMsIGJ1dCBpdCdzIG5vdCBtZXJnZWQgeWV0LCBkbw0KPiA+IEkgbWlzcyBhbnl0aGluZz8N
Cj4gDQo+IFdoZW4gd2UgdGVzdCBpdCB3ZSBzZWU6DQo+IA0KPiBXQVJOSU5HOiBnbGliYy0yLjI2
LXIwIGRvX3BhY2thZ2U6IGdsaWJjLWV4dHJhLW5zcy0yLjI2IHdhcyByZWdpc3RlcmVkIGFzDQo+
IHNobGliIHByb3ZpZGVyIGZvciBsaWJuc3NfZGIuc28uMiwgY2hhbmdpbmcgaXQgdG8gbGlibnNz
LWRiLTIuMjYgYmVjYXVzZSBpdCB3YXMNCj4gYnVpbHQgbGF0ZXINCg0KU29ycnksIGJ1dCBJIGhh
dmVuJ3Qgc2VlbiB0aGlzIHdhcm5pbmcgaW4gb3VyIGJ1aWxkcyBhZnRlciB0aGlzIHBhdGNoIG1l
cmdlZCBpbiBvdXIgDQpsb2NhbCBicmFuY2ggZm9yIHR3byB3ZWVrcy4gTWF5YmUgd2UgbWlzc2Vk
IHNvbWUgY2FzZXMgaW4gb3VyIHRlc3QgYnVpbGRzLCBzbw0KY291bGQgeW91IHNob3cgbWUgaG93
IHRvIHJlcHJvZHVjZSBpdD8gVGhhbmtzIQ0KDQpUaGlzIHBhdGNoIGlzIHNpbXBseSByZS1wYWNr
YWdlIGxpYm5zc19kYi5zbyogZnJvbSBnbGliYy1leHRyYS1uc3MgaW50byBsaWJuc3MtZGIsDQpJ
IGRvbid0IHVuZGVyc3RhbmQgd2h5IGxpYm5zc19kYi5zbyogaXMgc3RpbGwgcHJvdmlkZWQgYnkg
Ym90aCBvZiB0aGVtLCBkaWQgSSBtaXNzDQphbnl0aGluZyB3aGVuIEkgZG8gYSByZS1wYWNrYWdp
bmcgZm9yIGEgcmVjaXBlPw0KDQpUaGFua3MsDQpKYWNraWUNCg0KPiANCj4gc28gaXQgbG9va3Mg
bGlrZSB5b3Ugc3dhcHBlZCBvbmUgcmFjZSBmb3IgYW5vdGhlcj8NCj4gDQo+IENoZWVycywNCj4g
DQo+IFJpY2hhcmQNCg==

