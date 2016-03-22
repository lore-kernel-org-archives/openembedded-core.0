Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3A3B965CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 10:58:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="4845385"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Mar 2016 18:57:51 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 96106408D262;
	Tue, 22 Mar 2016 18:57:50 +0800 (CST)
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0279.002; Tue, 22 Mar 2016 18:57:50 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gcc-cross-canadian.inc: add INSANE_SKIP_ to
	avoid build warning.
Thread-Index: AQHRhB2OaaaqbUd+dkm7+JaNcDmK9p9lSWfA
Date: Tue, 22 Mar 2016 10:57:49 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E801409801C8@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1458625715-1813-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1458639038.20442.36.camel@linuxfoundation.org>
In-Reply-To: <1458639038.20442.36.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.85]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 96106408D262.A7960
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] gcc-cross-canadian.inc: add INSANE_SKIP_ to avoid build warning.
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
X-List-Received-Date: Tue, 22 Mar 2016 10:58:04 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBSaWNoYXJk
IFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmddDQo+U2VudDogVHVlc2RheSwgTWFyY2ggMjIsIDIwMTYgNTozMSBQ
TQ0KPlRvOiBMaSwgWGluL+adjiDmrKM7IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj5TdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSF0gZ2NjLWNyb3NzLWNhbmFkaWFuLmluYzogYWRkIElOU0FORV9T
S0lQXyB0bw0KPmF2b2lkIGJ1aWxkIHdhcm5pbmcuDQo+DQo+T24gVHVlLCAy
MDE2LTAzLTIyIGF0IDA4OjQ4ICswMzAwLCBMaSBYaW4gd3JvdGU6DQo+PiBX
QVJOSU5HOiBRQSBJc3N1ZTogZ2NjLWNyb3NzLWNhbmFkaWFuLWk1ODYtZGJn
OiBmb3VuZCBsaWJyYXJ5IGluIHdyb25nDQo+PiBsb2NhdGlvbjoNCj4+IC9Q
QVRIL3N5c3Jvb3RzL3g4Nl82NC1vZXNkay1saW51eC91c3IvbGliZXhlYy9p
NTg2LW9lLWxpbnV4L2djYy9pNTg2DQo+PiAtb2UtbGludXgvNS4yLjAvLmRl
YnVnL2xpYmNjMS5zby4wLjAuMA0KPj4NCj4+IFRoaXMgd2FybmluZyBpcyBp
bnRyb2R1Y2VkIGJ5IGNvbW1pdCBmNmU0N2FhKGdjYy10YXJnZXQgNS4xOiBm
aXggZm9yDQo+PiBsaWJjYzEpDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTGkg
WGluIDxsaXhpbi5mbnN0QGNuLmZ1aml0c3UuY29tPg0KPj4gLS0tDQo+PiAg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtY3Jvc3MtY2FuYWRpYW4u
aW5jIHwgMiArKw0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykNCj4NCj5JIGp1c3QgdHJpZWQgYSAiTUFDSElORT1xZW11eDg2LTY0IGJp
dGJha2UgZ2NjLWNyb3NzLWNhbmFkaWFuLXg4Ni02NCINCj5oZXJlIGFuZCBk
aWRuJ3Qgc2VlIHRoaXMgd2FybmluZy4gSG93IHdvdWxkIEkgZ2V0IHRoaXMg
d2FybmluZyB0byBzaG93IHVwIGFzIEknbQ0KPm5vdCBzZWVpbmcgaXQgaW4g
bXkgYnVpbGRzPw0KDQpTb3JyeSwgdGhpcyBwYXRjaCBzaG91bGQgZ28gdG8g
SmV0aHJvIGJyYW5jaC4NCkkgdXNlZCBKZXRocm8gYnJhbmNoLCBhbmQgIk1B
Q0hJTkU9cWVtdXg4NiBiaXRiYWtlIGdjYy1jcm9zcy1jYW5hZGlhbi1pNTg2
IiwgdGhlbiB0aGlzIHdhcm5pbmcgb2NjdXJzLg0KDQpQYXRjaCB2MiB3aWxs
IGJlIHNlbnQuDQoNCkNoZWVycywNCmxpeGluDQoKCg==

