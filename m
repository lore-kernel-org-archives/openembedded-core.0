Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 56C5B78AF9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 02:18:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42842386"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2018 10:18:00 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id D6F364B69E1E;
	Tue, 31 Jul 2018 10:17:57 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0399.000; Tue, 31 Jul 2018 10:18:02 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 8/8] [PATCH v2] meta-toolchain: Added
	dnf-nativesdk into cross-development toolchain.
Thread-Index: AQHUDFTNbdIMBF9XE0udcx99WGYdtaSozYhA
Date: Tue, 31 Jul 2018 02:18:01 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF738709F509@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<1529783581-46179-9-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<575b002da9b0b86490a3eada07f254428549965e.camel@linuxfoundation.org>
In-Reply-To: <575b002da9b0b86490a3eada07f254428549965e.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: D6F364B69E1E.AA88B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH 8/8] [PATCH v2] meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
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
X-List-Received-Date: Tue, 31 Jul 2018 02:18:03 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZA0KDQogICAgICBlU0RLIGlzIGFjdHVhbGx5IGEgYmV0dGVy
IHRlY2huaXF1ZSBmb3IgZGV2ZWxvcGVycy4gIEJ1dCBpdOKAmXMgb25seSBz
dWl0YWJsZSBmb3IgdGhvc2UgcGVvcGxlIHdobyBoYXMgZXhwZXJpZW5jZSBv
biBZb2N0byBQcm9qZWN0Lg0KDQogICAgICBJbiB0aGUgb3RoZXIgaGFuZCwg
dXNpbmcgZG5mLW5hdGl2ZXNkayBpbiBtZXRhLXRvb2xjaGFpbiB0byBjdXN0
b21pemUgcm9vdGZzIGlzIGVhc2llciBmb3QgdGhvc2UgcGVvcGxlIHdobyBh
cmUgZmFtaWxpYXIgd2l0aCBkbmYoSSB0aGluayBtb3N0IGxpbnV4IHVzZXIg
a25vd24gaXQpLg0KDQogICAgICBGb3IgZXhhbXBsZSwgZGV2ZWxvcGVycyBm
aW5pc2ggdGhlIE9TUyBidWlsZCB3b3JrIGFuZCBwcm92aWRlIHRoZSB0b29s
Y2hhaW4gYW5kIHBhY2thZ2VzIHRvIHVzZXJzLiBJbiB0aGlzIGNhc2UsIHVz
ZXJzIGRvIG5vdCBuZWVkIHRvIGtub3cgYW55IGtub3dsZWRnZSBhYm91dCB5
b2N0byBidWlsZCBzeXN0ZW0gYnV0IGp1c3QgaG93IHRvIHVzZSBkbmYgdG8g
aW5zdGFsbCBhIHJvb3Rmcy4NCg0KICAgICAgU28gaXQgY2FuIHJlZHVjZSB0
aGUgd29ya2xvYWQgb2YgZW5kLXVzZXJzIHdobyBuZWVkIHRvIGN1c3RvbWl6
ZSByb290ZnMgZm9yIHRoZWlyIGVtYmVkZGVkIGRldmljZS4gQXQgbGVhc2Us
IHRoZXkgZG9u4oCZdCBuZWVkIHRvIG1haW50YWluIGEgeW9jdG8gYnVpbGQg
c2VydmVyLg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0
c3UgTmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERS
LjogTm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAg
IE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RA
Y24uZnVqaXN0dS5jb20NCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgW21haWx0bzpyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnXSANClNlbnQ6IE1vbmRheSwgSnVuZSAy
NSwgMjAxOCAzOjE5IFBNDQpUbzogWmhlbmcsIFJ1b3Fpbi/pg5Eg6Iul6ZKm
IDx6aGVuZ3JxLmZuc3RAY24uZnVqaXRzdS5jb20+OyBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFtQQVRDSCA4LzhdIFtQQVRDSCB2Ml0gbWV0YS10b29sY2hhaW46
IEFkZGVkIGRuZi1uYXRpdmVzZGsgaW50byBjcm9zcy1kZXZlbG9wbWVudCB0
b29sY2hhaW4uDQoNCk9uIFN1biwgMjAxOC0wNi0yNCBhdCAwMzo1MyArMDgw
MCwgWmhlbmcgUnVvcWluIHdyb3RlOg0KPiBBZGQgZG5mLW5hdGl2ZXNkayBh
bmQgaXQncyBydW50aW1lIGRlcGVuZGVuY2UgdG8gbWFrZSBkbmYgd29yayBv
biANCj4gY3Jvc3MtZGV2ZWxvcG1lbnQgZW52aXJvbm1lbnQuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBaaGVuZyBSdW9xaW4gPHpoZW5ncnEuZm5zdEBjbi5m
dWppdHN1LmNvbT4NCg0KSSBkb24ndCBtaW5kIGFkZGluZyBlbm91Z2ggb2Yg
dGhlIGNoYW5nZXMgc28gdGhhdCBkbmYtbmF0aXZlc2RrIGlzIGJ1aWxkYWJs
ZSBzbyBzb21lIG9mIHlvdXIgb3RoZXIgcGF0Y2hlcyBjYW4gYmUgbWVyZ2Vk
Lg0KDQpJIGRvIG5vdCB3YW50IHRvIGFkZCBkbmYtbmF0aXZlc2RrIHRvIG1l
dGEtdG9vbGNoYWluIGJ5IGRlZmF1bHQgaG93ZXZlciBhcyB0aGVyZSBhcmUg
bWFueSBwZW9wbGUgd2hvIGRvbid0IG5lZWQgdGhpcyB0aGVyZS4gSSdkIHN1
Z2dlc3QgdGhpcyBpcyBhIGN1c3RvbWlzYXRpb24geW91J2xsIG5lZWQgdG8g
bWFpbnRhaW4geW91cnNlbHZlcy4NCg0KSSBhcHByZWNpYXRlIHdoeSB5b3Ug
d2FudCB0byBkbyB0aGlzLCBJIGFsc28gYmVsaWV2ZSB3ZSBoYXZlIGEgYmV0
dGVyIHRlY2huaXF1ZSBpbiB0aGUgZm9ybSBvZiB0aGUgZVNESywgd2hlcmUg
d2UgY2FuIHVzZSB0aGUgc2FtZSB0b29scyBhbmQgdGhlIHNhbWUgY29kZWJh
c2UgdG8gYnVpbGQgZm9yIGV4YW1wbGUgYSByb290ZnMuDQoNClRoZSBlU0RL
IHVzZSBjYXNlIChhIGxvY2tlZCBzc3RhdGUgY2FjaGUpIGlzIGRlc2lnbmVk
IHNvIHRoYXQgYSB1c2VyIGRvZXNuJ3QgbmVlZCB0byB3b3JyeSBhYm91dCBh
IHdob2xlIGJ1aWxkLCBvciBidWlsZGluZyBmcm9tIHNjcmF0Y2guDQpUaGV5
IGNhbiB1c2UgdGhlIHNhbWUgdG9vbHMgZXZlcnlvbmUgZWxzZSB1c2VzIGFu
ZCB0aGUgc2FtZSB3b3JrZmxvdyBhbmQgY29kZSB0byBidWxsZCBhIHJvb3Rm
cyBvciBhIHJlY2lwZSBvciBhbnkgd29ya2Zsb3cuIFRoaXMgbWFrZXMgaXQg
bXVjaCBtb3JlIHBvd2VyZnVsIGFuZCBhYmxlIHRvIGZ1bGZpbCBtYW55IGRp
ZmZlcmVudCB1c2UgY2FzZXMgY29tcGFyZWQgdG8gbWV0YS10b29sY2hhaW4u
IEluIHRoZSBsb25nIHJ1biBJJ2QgdGhlcmVmb3JlIHByZWZlciB3ZSBwcm9t
b3RlIHRoaXMgYW5kIHVzZSB0aGUgZVNESyBhcyBJIHRoaW5rIGl0IHdpbGwg
YmVjb21lIG91ciBwcmVmZXJyZWQgd2F5IG9mIGhhbmRsaW5nIHByb2JsZW1z
IGxpa2UgdGhpcy4NCg0KQ2hlZXJzLA0KDQpSaWNoYXJkDQoNCg0KCgo=

