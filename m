Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7E27D259
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 03:25:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,388,1549900800"; d="scan'208";a="60339092"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Apr 2019 11:25:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6D5C34CDAABF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:25:19 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0439.000; Wed, 24 Apr 2019 11:25:19 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] dnf: Enable nativesdk
Thread-Index: AQHU+dl1l/AGVn0r5Eaj4NlX6Kk9kKZKpeKA
Date: Wed, 24 Apr 2019 03:25:21 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF0F5626@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555166150-57588-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<582e5ae68be63214ad48c3320185aa117563d81a.camel@linuxfoundation.org>
In-Reply-To: <582e5ae68be63214ad48c3320185aa117563d81a.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 6D5C34CDAABF.AE754
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH v2] dnf: Enable nativesdk
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
X-List-Received-Date: Wed, 24 Apr 2019 03:25:18 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksDQoNCj4gUGF0Y2ggZG9lc24ndCBhcHBseSBhZ2FpbnN0IG1hc3Rlcj8N
Cg0KSSB3aWxsIHVwZGF0ZSB0aGlzIHBhdGNoIGZvciBuZXcgdmVyc2lvbiBk
bmYuDQoNCkJlc3QgcmVnYXJkcy4NCkxlaQ0KDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmUtYm91
bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnIFttYWlsdG86b3BlbmVtYmVk
ZGVkLQ0KPiBjb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10g
T24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IFR1ZXNkYXks
IEFwcmlsIDIzLCAyMDE5IDk6MzUgUE0NCj4gVG86IFpoZW5nLCBSdW9xaW4v
1qMgyPTH1Tsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCB2Ml0gZG5m
OiBFbmFibGUgbmF0aXZlc2RrDQo+IA0KPiBPbiBTYXQsIDIwMTktMDQtMTMg
YXQgMjI6MzUgKzA4MDAsIFpoZW5nIFJ1b3FpbiB3cm90ZToNCj4gPiBNYWtl
IGRuZiB3b3JrIG9uIG5hdGl2ZXNkayBlbnZpcm9ubWVudC4NCj4gPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFpoZW5nIFJ1b3FpbiA8emhlbmdycS5mbnN0QGNu
LmZ1aml0c3UuY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZG5mL2RuZl80LjEuMC5iYiB8IDEwICsrKysrKysrKy0NCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gUGF0Y2ggZG9lc24ndCBhcHBseSBhZ2FpbnN0IG1hc3Rlcj8N
Cj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCj4gDQo+IC0tDQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KPiBPcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVt
YmVkZGVkLWNvcmUNCj4gDQoNCgoK

