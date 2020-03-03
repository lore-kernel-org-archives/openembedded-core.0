Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id BECA561035
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=axis.com; l=1844; q=dns/txt; s=axis-central1;
	t=1583245185; x=1614781185;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=cEL3O+Gg2+1mbFSvI/r849vfw1ZSr9ZFjTmzJGPo0Bg=;
	b=gvOSU5PN1MGa5uzBJY/wVmmGLA86TAvPWwBtGgDXY8nQJt6uu+Erh82J
	cV6ZB0FZi6osm77OdhIbr/ND04QInFflA86+jDgkKKnD71dHKVkZ9zoCp
	7g/ohhX7mbZRC7FmLVAXnzbnD+7erBg+sUNkhQ3JQQDYIABBtLP5s+t2m
	WJrfAoL9KlckRyEkkJp8litk48GG7VfmAnHHzkDhVsHY1jwdo9bBiuv5B
	iKuiue47fvb+Ohn0pzTqlDeX2urkaQZZl9h2mIcCr3BeP/k5nB2EVUqt2
	0kFSGDq9HBVTeEXYBIWRNV7MEM2CquMcMsWSh2R/prLAOY3tA3oTWgcV2 Q==;
IronPort-SDR: s9kwFgFtH8ymRGIwbMecz2eiGPQvN+gYIq6Q2Auu9SwcN64COUDu9QJ/NGms0S4FGdkDVrOwrS
	erz2sxxncmr3VEGJUZi9hdLwwXiRjvNDGkfzUgIigVzz+Ybb7YrtnIVJ0zok6DBMdxm5rMmWhr
	bjAXA2MHgDVdnr0sysw19sD5mJvK8X+j+/cyKgfsJ+Azedl+sNYC4ZxrefJ3a7fJCBKRInIost
	4fVKkqkUnPNfdSCFzbvGDwExSxOzhNxQjL58TxmkRTmt634UtHATOV9z6VRdMrFnKuJZatb+WT
	+vU=
X-IronPort-AV: E=Sophos;i="5.70,511,1574118000"; 
   d="scan'208";a="5878093"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Adrian Bunk <bunk@stusta.de>
Thread-Topic: [OE-core] [PATCH] arch-arm64.inc: Do not append aarch64 in
	MACHINEOVERRIDES
Thread-Index: AQHV8MCOVPC5pfvw0keD/66VlGkIvKg2IGSAgACi7cCAAAzAgIAAGRhA
Date: Tue, 3 Mar 2020 14:19:43 +0000
Message-ID: <1b7474f1cd58427dbe42f74b50b3514f@XBOX03.axis.com>
References: <20200302171153.28030-1-zhengjunling@huawei.com>
	<666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>
	<9d41cd5d-7355-175d-391c-35231c9a7e92@huawei.com>
	<41b7391039564f10a0c8b4f63eeb4274@XBOX03.axis.com>
	<20200303133931.GB13148@localhost>
In-Reply-To: <20200303133931.GB13148@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "wangnan0@huawei.com" <wangnan0@huawei.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-arm64.inc: Do not append aarch64 in MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 03 Mar 2020 14:19:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBZHJpYW4gQnVuayA8YnVua0Bz
dHVzdGEuZGU+DQo+IFNlbnQ6IGRlbiAzIG1hcnMgMjAyMCAxNDo0MA0KPiBUbzogUGV0ZXIgS2pl
bGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IENjOiBKdW5saW5nIFpo
ZW5nIDx6aGVuZ2p1bmxpbmdAaHVhd2VpLmNvbT47IEtoZW0gUmFqDQo+IDxyYWoua2hlbUBnbWFp
bC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOw0KPiB3YW5n
bmFuMEBodWF3ZWkuY29tDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBhcmNoLWFy
bTY0LmluYzogRG8gbm90IGFwcGVuZCBhYXJjaDY0IGluDQo+IE1BQ0hJTkVPVkVSUklERVMNCj4g
DQo+IE9uIFR1ZSwgTWFyIDAzLCAyMDIwIGF0IDExOjU5OjU4QU0gKzAwMDAsIFBldGVyIEtqZWxs
ZXJzdGVkdCB3cm90ZToNCj4gPi4uLg0KPiA+IFdoaWNoIGNvcnJlc3BvbmRzIHRvIGhvdyBpdCBp
cyBkb25lIGZvciBhcm12NyouDQo+ID4NCj4gPiBBdCBsZWFzdCB3ZSBjdXJyZW50bHkgcmVseSBv
biBiZWluZyBhYmxlIHRvIGRvLCBlLmcuOg0KPiA+DQo+ID4gQ09NUEFUSUJMRV9NQUNISU5FID0g
ImFhcmNoNjR8YXJtdjdhfGFybXY3dmUiDQo+ID4NCj4gPiBhbmQgaWYgeW91IHJlbW92ZSAiYWFy
Y2g2NCIgZnJvbSBNQUNISU5FT1ZFUlJJREVTLCB3ZSBuZWVkIGEgc3VpdGFibGUNCj4gPiBzdWJz
dGl0dXRlLg0KPiANCj4gV2hhdCBkb2VzICJhYXJjaDY0IiBhY3R1YWxseSBtZWFuIGhlcmU/DQo+
IERvZXMgaXQgYWxzbyBjb3ZlciAzMmJpdC1vbmx5IGFhcmNoNjQgQ1BVcz8NCg0KV2UgaGF2ZW4n
dCBoYWQgdG8gcmVmbGVjdCBhYm91dCB0aGF0IGFzIGFsbCBhYXJjaDY0IGJhc2VkIFNvQ3Mgd2Ug
dXNlIA0KYXJlIDY0LWJpdCBvbmx5LiBTbyBJIGd1ZXNzIHdlIGxpdmUgaW4gYSBzaW1wbGlmaWVk
IHdvcmxkLiBTdGlsbCwgd2UgDQpuZWVkIGEgd2F5IHRvIHNlcGFyYXRlIHRoZW0gZnJvbSBvdXIg
YXJtdjcgb3IgbWlwcyBiYXNlZCBTb0NzLi4uDQoNCj4gU2ltaWxhciB0byB4ODYgdGhlcmUgYXJl
IDMgQUJJcywgYW5kIGFhcmNoNjRpbHAzMiBpcyBkaWZmZXJlbnQgZnJvbQ0KPiBhYXJjaDMyLg0K
PiANCj4gRGlmZmVyZW50IGZyb20geDg2LCB0aGVyZSBpcyBubyBBQkkgdGhhdCBpcyBhdmFpbGFi
bGUgaW4gYWxsIGFhcmNoNjQgQ1BVcy4NCj4gVGhleSBjYW4gYmUgMzJiaXQtb25seSBvciA2NGJp
dC1vbmx5LCBhbmQgYWFyY2gzMiBzdXBwb3J0IGlzIG9wdGlvbmFsLg0KPiANCj4gPiAvL1BldGVy
DQo+IA0KPiBjdQ0KPiBBZHJpYW4NCg0KLy9QZXRlcg0KDQo=

