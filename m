Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9FBD47CF9E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 13:17:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,385,1549900800"; d="scan'208";a="60265163"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Apr 2019 21:16:59 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 9503A4CD8E07
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 21:16:58 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0439.000; Tue, 23 Apr 2019 21:17:00 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] dnf: Enable nativesdk
Thread-Index: AQHU8briPCTAp9HdGUWwMDUYh/3paqY+p/eAgAshu3A=
Date: Tue, 23 Apr 2019 13:16:59 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C149E9@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555166150-57588-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C13A5C@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C13A5C@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 9503A4CD8E07.AA95F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
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
X-List-Received-Date: Tue, 23 Apr 2019 13:17:01 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UGluZw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3Ug
TmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjog
Tm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5h
bmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24u
ZnVqaXN0dS5jb20NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBbbWFpbHRvOm9wZW5lbWJlZGRlZC1jb3JlLWJv
dW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+
IFpoZW5nLCBSdW9xaW4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgMTYsIDIw
MTkgNzoxNyBQTQ0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRD
SCB2Ml0gZG5mOiBFbmFibGUgbmF0aXZlc2RrDQo+IA0KPiBQaW5nDQo+IA0K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiBaaGVuZyBSdW9xaW4NCj4gTmFuamluZyBGdWppdHN1IE5h
bmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKQ0KPiBBRERSLjog
Tm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KPiAgICAgICAg
TmFuamluZywgMjEwMDEyLCBDaGluYQ0KPiBNQUlMIDogemhlbmdycS5mbnN0
QGNuLmZ1amlzdHUuY29tDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+IEZyb206IFpoZW5nLCBSdW9xaW4v1qMgyPTH1Q0K
PiA+IFNlbnQ6IFNhdHVyZGF5LCBBcHJpbCAxMywgMjAxOSAxMDozNiBQTQ0K
PiA+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+ID4gQ2M6IFpoZW5nLCBSdW9xaW4v1qMgyPTH1SA8emhlbmdycS5m
bnN0QGNuLmZ1aml0c3UuY29tPg0KPiA+IFN1YmplY3Q6IFtPRS1jb3JlXSBb
UEFUQ0ggdjJdIGRuZjogRW5hYmxlIG5hdGl2ZXNkaw0KPiA+DQo+ID4gTWFr
ZSBkbmYgd29yayBvbiBuYXRpdmVzZGsgZW52aXJvbm1lbnQuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBaaGVuZyBSdW9xaW4gPHpoZW5ncnEuZm5zdEBj
bi5mdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi9kbmZfNC4xLjAuYmIgfCAxMCArKysrKysrKystDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZG5mL2RuZl80LjEuMC5iYiBiL21ldGEvcmVjaXBlcy0NCj4gPiBkZXZ0
b29scy9kbmYvZG5mXzQuMS4wLmJiIGluZGV4IGQ0NTAyM2UuLjhiNDI5MWEg
MTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9k
bmZfNC4xLjAuYmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL2RuZl80LjEuMC5iYg0KPiA+IEBAIC0yNiw3ICsyNiw3IEBAIEVYVFJB
X09FQ01BS0UgPSAiIC1EV0lUSF9NQU49MCAtDQo+ID4gRFBZVEhPTl9JTlNU
QUxMX0RJUj0ke1BZVEhPTl9TSVRFUEFDS0FHRVNfRElSfSAtDQo+ID4NCj4g
PiAgQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIg0KPiA+DQo+
ID4gLVJERVBFTkRTXyR7UE59X2NsYXNzLXRhcmdldCArPSAiIFwNCj4gPiAr
UkRFUEVORFNfJHtQTn0gKz0gIiBcDQo+ID4gICAgcHl0aG9uMy1jb3JlIFwN
Cj4gPiAgICBweXRob24zLWNvZGVjcyBcDQo+ID4gICAgcHl0aG9uMy1uZXRj
bGllbnQgXA0KPiA+IEBAIC00OSw2ICs0OSw4IEBAIFJERVBFTkRTXyR7UE59
X2NsYXNzLXRhcmdldCArPSAiIFwNCj4gPiAgICBweXRob24zLWdwZyBcDQo+
ID4gICAgIg0KPiA+DQo+ID4gK1JERVBFTkRTXyR7UE59X2NsYXNzLW5hdGl2
ZSA9ICIiDQo+ID4gKw0KPiA+ICBSUkVDT01NRU5EU18ke1BOfV9jbGFzcy10
YXJnZXQgKz0gImdudXBnIg0KPiA+DQo+ID4gICMgQ3JlYXRlIGEgc3ltbGlu
ayBjYWxsZWQgJ2RuZicgYXMgJ21ha2UgaW5zdGFsbCcgZG9lcyBub3QgZG8g
aXQsIGJ1dA0KPiA+IEBAIC02Niw2DQo+ID4gKzY4LDEyIEBAIGRvX2luc3Rh
bGxfYXBwZW5kX2NsYXNzLW5hdGl2ZSgpIHsNCj4gPiAgICAgICAgICAgICAg
ICAgIFJQTV9OT19DSFJPT1RfRk9SX1NDUklQVFM9MSAgfQ0KPiA+DQo+ID4g
K2RvX2luc3RhbGxfYXBwZW5kX2NsYXNzLW5hdGl2ZXNkaygpIHsNCj4gPiAr
ICAgICAgICBjcmVhdGVfd3JhcHBlciAke0R9LyR7YmluZGlyfS9kbmYgXA0K
PiA+ICsgICAgICAgICAgICAgICAgUlBNX0NPTkZJR0RJUj0ke1NES1BBVEhO
QVRJVkV9JHtsaWJkaXJfbmF0aXZlc2RrfS9ycG0gXA0KPiA+ICsgICAgICAg
ICAgICAgICAgUlBNX05PX0NIUk9PVF9GT1JfU0NSSVBUUz0xIH0NCj4gPiAr
DQo+ID4gIFNZU1RFTURfU0VSVklDRV8ke1BOfSA9ICJkbmYtbWFrZWNhY2hl
LnNlcnZpY2UgZG5mLW1ha2VjYWNoZS50aW1lciBcDQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICBkbmYtYXV0b21hdGljLnNlcnZpY2UgZG5mLWF1
dG9tYXRpYy50aW1lciBcDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICBkbmYtYXV0b21hdGljLWRvd25sb2FkLnNlcnZpY2UNCj4gPiBkbmYtYXV0
b21hdGljLWRvd25sb2FkLnRpbWVyIFwNCj4gPiAtLQ0KPiA+IDEuOC4zLjEN
Cj4gDQo+IA0KPiANCj4gLS0NCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gT3BlbmVtYmVkZGVkLWNvcmUg
bWFpbGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0KCgo=

