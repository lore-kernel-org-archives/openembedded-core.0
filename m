Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id EEF4660034
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 00:43:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98245280"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jul 2015 08:47:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t690fi6m005194;
	Thu, 9 Jul 2015 08:41:44 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Thu, 9 Jul 2015 08:43:26 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] FW: [oe] [meta-oe][PATCH] parted_1.8.6.bb: add
	parted that not GPLv3
Thread-Index: AQHQuDpjNDtvI4kxr0SLhdqthD/ZI53PXd9Q///GqACAAFcsAIAAAgoAgAAE6QCAAs0cYA==
Date: Thu, 9 Jul 2015 00:43:26 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDB29F16@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CAJ86T=XJeo31ntBEw16vCPuTyAwYvsij_Aoq=EKgRyhCnYyzOw@mail.gmail.com>
	<1B56A49860EB2D45ADE3731B15C959FDB29591@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CAJTo0LZx5mPc+2_wmO8WfYs-s5smFuZYyAmYfZS4Bv+BoW7SEA@mail.gmail.com>
	<559BD488.8090306@linux.intel.com>
	<CAJTo0LY5fEmX8Of5d2prJ01fHvf7LV170qTz+r1kd0vtkGgesQ@mail.gmail.com>
	<559BDA5C.6060905@linux.intel.com>
In-Reply-To: <559BDA5C.6060905@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.26]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: FW: [oe] [meta-oe][PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Thu, 09 Jul 2015 00:43:30 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgQWxleA0KDQo+IFdobydzIGdvaW5nIHRvIHByb3ZpZGUgb25nb2luZyBtYWludGVuYW5jZSBm
b3IgYWxsIHRoYXQ/IEkgd291bGQgbGlrZSANCj4gTGVpIHRvIGVzdGFibGlzaCBoaW1zZWxmIGFz
IHRoZSBtYWludGFpbmVyICh0aHJvdWdoIHRoZSBtYWludGFpbmVycy5pbmMgZmlsZSkuDQoNClRo
YW5rIHlvdS4gSSdtIHZlcnkgZ2xhZCB0byBkbyB0aGF0Lg0KDQpDaGVlcnMNCg0KTGVpDQoNCg0K
DQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQt
Y29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRk
ZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBB
bGV4YW5kZXIgS2FuYXZpbg0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDA3LCAyMDE1IDk6NTYgUE0N
Cj4gVG86IEJ1cnRvbiwgUm9zcw0KPiBDYzogT0UtY29yZQ0KPiBTdWJqZWN0OiBSZTogW09FLWNv
cmVdIEZXOiBbb2VdIFttZXRhLW9lXVtQQVRDSF0gcGFydGVkXzEuOC42LmJiOiBhZGQgcGFydGVk
IHRoYXQgbm90DQo+IEdQTHYzDQo+IA0KPiBPbiAwNy8wNy8yMDE1IDA0OjM4IFBNLCBCdXJ0b24s
IFJvc3Mgd3JvdGU6DQo+IA0KPiA+ICAgICBIb3cgYWJvdXQgcmVuYW1pbmcgdGhlIHJlY2lwZSwg
c28gdGhhdCBpdCBkb2Vzbid0IGNsYXNoIHdpdGggdGhlDQo+ID4gICAgIEdQTHYzIHZlcnNpb24/
IEZvciBleGFtcGxlLCBwYXJ0ZWQxXzEuOC42LmJiDQo+ID4gICAgIDxodHRwOi8vcGFydGVkMV8x
LjguNi5iYj4uIFRoZW4gaXQgY2FuIGJlIGtlcHQgb3V0c2lkZSBvZiBvZS1jb3JlLg0KPiA+DQo+
ID4NCj4gPiBBcyB0aGV5J3JlIGp1c3QgdmVyc2lvbiB2YXJpYXRpb25zIHRoYXQgd291bGQgYmUg
b3Zlcmx5IGNvbXBsZXguDQo+ID4gRHJvcHBpbmcgaXQgaW4gb2UtY29yZSBhcyBpdCdzIGEgbm9u
LXYzIGFsdGVybmF0aXZlIGRvZXNuJ3Qgc2VlbSB0byBiZQ0KPiA+IGEgcHJvYmxlbSB0byBtZSAo
YXMgdGhlcmUncyBwbGVudHkgb2YgcHJlY2VkZW50IGZvciB0aGF0IGFscmVhZHkpLg0KPiANCj4g
TXkgcHJvYmxlbSBpcyB0aGF0IHBhcnRlZCAxLjguNiB3YXMgcmVsZWFzZWQgaW4gMjAwNywgYW5k
IHRoZSByZWNpcGUgYWxyZWFkeSBjYXJyaWVzIGVpZ2h0DQo+IHBhdGNoZXMgd2l0aCBpdCAoYW5k
IG5vbmUgb2YgdGhlbSBoYXMgYW55IGluZm9ybWF0aW9uIGFib3V0IHRoZWlyIG9yaWdpbikuDQo+
IA0KPiBXaG8ncyBnb2luZyB0byBwcm92aWRlIG9uZ29pbmcgbWFpbnRlbmFuY2UgZm9yIGFsbCB0
aGF0PyBJIHdvdWxkIGxpa2UgTGVpIHRvIGVzdGFibGlzaA0KPiBoaW1zZWxmIGFzIHRoZSBtYWlu
dGFpbmVyICh0aHJvdWdoIHRoZSBtYWludGFpbmVycy5pbmMgZmlsZSkuDQo+IA0KPiBSZWdhcmRz
LA0KPiBBbGV4DQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCg==

