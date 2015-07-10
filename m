Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2C463607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 03:20:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98296750"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Jul 2015 11:24:23 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6A3Imeu013601;
	Fri, 10 Jul 2015 11:18:48 +0800
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Fri, 10 Jul 2015 11:20:31 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "alexander.kanavin@linux.intel.com" <alexander.kanavin@linux.intel.com>
Thread-Topic: [OE-core]  [PATCH] parted_1.8.6.bb: add parted that not GPLv3
Thread-Index: AQHQujs+nyj25HboPkGTMhEOURbw8Z3UCY5Q
Date: Fri, 10 Jul 2015 03:20:30 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FDB2A281@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
In-Reply-To: <56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.26]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Fri, 10 Jul 2015 03:20:36 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgQWxleA0KDQo+ID4gK2RvX2luc3RhbGxfYXBwZW5kKCkgew0KPiA+ICsJL2Jpbi9ybSAtcmYg
JHtEfS8ke2xpYmRpcn0vKi5sYQ0KPiA+ICsJL2Jpbi9ybSAtcmYgJHtEfS91c3Ivc2hhcmUvaW5m
by9kaXINCj4gPiArCS9iaW4vcm0gLWZyICR7RH0vdXNyL2Jpbg0KPiA+ICt9DQo+DQoNClJlZmVy
ZW5jZSB0byBmZWRvcmEgYW5kIFVidW50dSwgSSBkZWxldGUgdGhlc2UgZmlsZXMuDQoNCg0KQ2hl
ZXJzDQpMZWkNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGFsZXhh
bmRlci5rYW5hdmluQGxpbnV4LmludGVsLmNvbSBbbWFpbHRvOmFsZXhhbmRlci5rYW5hdmluQGxp
bnV4LmludGVsLmNvbV0NCj4gU2VudDogVGh1cnNkYXksIEp1bHkgMDksIDIwMTUgNzozMyBQTQ0K
PiBUbzogTGVpLCBNYW9odWkNCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIHBhcnRlZF8xLjguNi5i
YjogYWRkIHBhcnRlZCB0aGF0IG5vdCBHUEx2Mw0KPiANCj4gPiBBZGQgcGFydGVkLTEuOC42IHdo
aWNoIGlzIG5vdCBHUEx2My4NCj4gDQo+IEkgaGF2ZSB0byBzYXksIEkgc3RpbGwgY2FuJ3Qgc3Vw
cG9ydCBoYXZpbmcgdGhpcyBpbiBvZS1jb3JlLiBQcm92aWRpbmcgYWx0ZXJuYXRpdmVzIHRvIEdQ
THYzDQo+IHNvZnR3YXJlIGlzIGZpbmUsIGJ1dCBub3Qgd2hlbiB0aGUgJ2FsdGVybmF0aXZlJyBp
cyBhIHZlcnkgb2xkLCB1bnN1cHBvcnRlZCB2ZXJzaW9uIG9mIHRoZQ0KPiBzYW1lIHNvZnR3YXJl
LCB3aGljaCBpbmV2aXRhYmx5IGJyaW5ncyBpc3N1ZXMgaW4gZnVuY3Rpb25hbGl0eSBhbmQgbWFp
bnRlbmFuY2UuDQo+IA0KPiBCdXQgaWYgUm9zcyBhbmQvb3IgUmljaGFyZCBkaXNhZ3JlZSwgdGhl
biBJJ2xsIGhhdmUgdG8gYWNjZXB0IGl0Lg0KPiANCj4gPiArVXBzdHJlYW0tU3RhdHVzOiBQZW5k
aW5nDQo+IA0KPiAiSW5hcHByb3ByaWF0ZSIgaXMgYSBiZXR0ZXIgcmVhc29uIGhlcmUsIHdpdGgg
Y2xhcmlmaWNhdGlvbiB0aGF0IHRoZSBwYXRjaGVzIGFyZSB0byBtYWtlIGFuDQo+IG9sZCB2ZXJz
aW9uIHdvcmsgYW5kIHVwc3RyZWFtIHdvbid0IGJlIGludGVyZXN0ZWQgaW4gdGhlbS4NCj4gDQo+
ID4gK2RvX2luc3RhbGxfYXBwZW5kKCkgew0KPiA+ICsJL2Jpbi9ybSAtcmYgJHtEfS8ke2xpYmRp
cn0vKi5sYQ0KPiA+ICsJL2Jpbi9ybSAtcmYgJHtEfS91c3Ivc2hhcmUvaW5mby9kaXINCj4gPiAr
CS9iaW4vcm0gLWZyICR7RH0vdXNyL2Jpbg0KPiA+ICt9DQo+IA0KPiBXaGF0IGFyZSB5b3UgZGVs
ZXRpbmcgaGVyZSBhbmQgd2h5Pw0KPiANCj4gQWxleA0K

