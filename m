Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52B53787E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 02:13:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0C2DD90013889
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 18:13:13 -0800
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.62]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Thu, 11 Jan 2018 18:13:12 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Thread-Topic: [OE-core] [PATCH] systemd: add RDEPENDS on util-linux-getopt
Thread-Index: AQHTixj1hDy6XPKZrUWc05H8PLr9A6NvfFHA
Date: Fri, 12 Jan 2018 02:13:11 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA01566CF55D@ALA-MBC.corp.ad.wrs.com>
References: <20180111030706.18174-1-jackie.huang@windriver.com>
	<fa40b5ce-5334-0f34-785d-d6ad8e978f15@windriver.com>
In-Reply-To: <fa40b5ce-5334-0f34-785d-d6ad8e978f15@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.163.136]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: add RDEPENDS on util-linux-getopt
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
X-List-Received-Date: Fri, 12 Jan 2018 02:13:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFjTGVvZCwgUmFuZHkN
Cj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDEyLCAyMDE4IDA0OjE2DQo+IFRvOiBIdWFuZywgSmll
IChKYWNraWUpOyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBzeXN0ZW1kOiBhZGQgUkRFUEVORFMgb24gdXRp
bC1saW51eC1nZXRvcHQNCj4gDQo+IE9uIDIwMTgtMDEtMTAgMTA6MDcgUE0sIGphY2tpZS5odWFu
Z0B3aW5kcml2ZXIuY29tIHdyb3RlOg0KPiA+IEZyb206IEphY2tpZSBIdWFuZyA8amFja2llLmh1
YW5nQHdpbmRyaXZlci5jb20+DQo+ID4NCj4gPiAnZ2V0b3B0JyBpcyBuZWVkZWQgYnkgc3lzdGVt
ZC1zeXN2LWluc3RhbGwsIG9yIGl0IGZhaWxzIHdpdGg6DQo+ID4gfCBrZHVtcC5zZXJ2aWNlIGlz
IG5vdCBhIG5hdGl2ZSBzZXJ2aWNlLCByZWRpcmVjdGluZyB0byBzeXN0ZW1kLXN5c3YtaW5zdGFs
bC4NCj4gPiB8IEV4ZWN1dGluZzogL2xpYi9zeXN0ZW1kL3N5c3RlbWQtc3lzdi1pbnN0YWxsIGVu
YWJsZSBrZHVtcA0KPiA+IHwgL2xpYi9zeXN0ZW1kL3N5c3RlbWQtc3lzdi1pbnN0YWxsOiBsaW5l
IDE1OiBnZXRvcHQ6IGNvbW1hbmQgbm90IGZvdW5kDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBK
YWNraWUgSHVhbmcgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPg0KPiA+IC0tLQ0KPiA+ICAg
bWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kXzIzNC5iYiB8IDIgKy0NCj4gPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZF8yMzQuYmIgYi9tZXRh
L3JlY2lwZXMtDQo+IGNvcmUvc3lzdGVtZC9zeXN0ZW1kXzIzNC5iYg0KPiA+IGluZGV4IDQxMzJj
ZGY0MGYuLjVhMGU0YzIyNDcgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lz
dGVtZC9zeXN0ZW1kXzIzNC5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQv
c3lzdGVtZF8yMzQuYmINCj4gPiBAQCAtNTIxLDcgKzUyMSw3IEBAIEZJTEVTXyR7UE59ID0gIiAk
e2Jhc2VfYmluZGlyfS8qIFwNCj4gPg0KPiA+ICAgRklMRVNfJHtQTn0tZGV2ICs9ICIke2Jhc2Vf
bGliZGlyfS9zZWN1cml0eS8qLmxhICR7ZGF0YWRpcn0vZGJ1cy0NCj4gMS9pbnRlcmZhY2VzLyAk
e3N5c2NvbmZkaXJ9L3JwbS9tYWNyb3Muc3lzdGVtZCINCj4gPg0KPiA+IC1SREVQRU5EU18ke1BO
fSArPSAia21vZCBkYnVzIHV0aWwtbGludXgtbW91bnQgdWRldiAoPSAke0VYVEVORFBLR1Z9KQ0K
PiB1dGlsLWxpbnV4LWFnZXR0eSINCj4gPiArUkRFUEVORFNfJHtQTn0gKz0gImttb2QgZGJ1cyB1
dGlsLWxpbnV4LW1vdW50IHVkZXYgKD0gJHtFWFRFTkRQS0dWfSkNCj4gdXRpbC1saW51eC1hZ2V0
dHkgdXRpbC1saW51eC1nZXRvcHQiDQo+IA0KPiBJdCB3b3VsZCBiZSBuaWNlIHRvIG1ha2UgdGhl
IGRlcGVuZGVuY3kgY29uZGl0aW9uYWwgb24gc3lzdGVtZCBiZWluZw0KPiBjb25maWd1cmVkIHRv
IHN1cHBvcnQgc3lzdmluaXQgc2NyaXB0cy4NCg0KVGhlIHN5c3Zpbml0IHNjcmlwdCBpcyBhbHdh
eXMgc3VwcG9ydGVkIGZvciBub3c6DQoNCmNvbW1pdCA5ZDI5OGQxNTYzYjNmZDVhZDU2OWY4MDZj
YzI5NmUxMzI3OWU3Y2Y2DQpBdXRob3I6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQpE
YXRlOiAgIFN1biBTZXAgNiAxNToyNTo0MSAyMDE1ICswMDAwDQoNCiAgICBzeXN0ZW1kOiBJbXBs
ZW1lbnQgT0UtU3BlY2lmaWMgc3lzdGVtZC1zeXN2LWluc3RhbGwNCg0KICAgIFN1cHBvcnQgZm9y
IGNoa2NvbmZpZyAoLS1lbmFibGUtY2hrY29uZmlnKSB3YXMgcmVtb3ZlZCBpbiBmYXZvdXIgb2YN
CiAgICBjYWxsaW5nIGFuIGFic3RyYWN0aW9uIC9saWIvc3lzdGVtZC9zeXN0ZW1kLXN5c3YtaW5z
dGFsbC4gVGhpcw0KICAgIG5lZWRzIHRvIGJlIGltcGxlbWVudGVkIGZvciBPRS4NCg0KICAgIFNp
Z25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQogICAgU2lnbmVkLW9m
Zi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+
DQoNClNvIEkgdGhpbmsgdGhlIHVuY29uZGl0aW9uYWwgZGVwZW5kZW5jeSBpcyBuZWVkZWQgdW5s
ZXNzIHdlIGNoYW5nZSB0aGUNCnN1cHBvcnQgZm9yIHN5c3Zpbml0IHRvIGJlIG9wdGlvbmFsIGFz
IHdlbGwuDQoNClRoYW5rcywNCkphY2tpZQ0KPiANCj4gLi4vUmFuZHkNCj4gDQo+ID4gICBSREVQ
RU5EU18ke1BOfSArPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAnc2Vy
aWFsLWdldHR5LQ0KPiBnZW5lcmF0b3InLCAnJywgJ3N5c3RlbWQtc2VyaWFsZ2V0dHknLCBkKX0i
DQo+ID4gICBSREVQRU5EU18ke1BOfSArPSAidm9sYXRpbGUtYmluZHMgdXBkYXRlLXJjLmQiDQo+
ID4NCj4gPg0KPiANCj4gDQo+IC0tDQo+ICMgUmFuZHkgTWFjTGVvZC4gIFdSIExpbnV4DQo+ICMg
V2luZCBSaXZlciBhbiBJbnRlbCBDb21wYW55DQo=

