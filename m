Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2E7C47C337
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 02:55:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,368,1549900800"; d="scan'208";a="59715335"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Apr 2019 10:55:13 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0A1694CD8851
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 10:55:13 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0439.000; Fri, 19 Apr 2019 10:55:17 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] toolchain-scripts: make rpm work in toolchain
Thread-Index: AQHU8btSCqLTx2A2u06Avi+BPe0Uv6ZC0xbw
Date: Fri, 19 Apr 2019 02:55:11 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C143F7@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1555166214-57646-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1555166214-57646-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 0A1694CD8851.AB58D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] toolchain-scripts: make rpm work in toolchain
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
X-List-Received-Date: Fri, 19 Apr 2019 02:55:13 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3Ug
TmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjog
Tm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5h
bmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24u
ZnVqaXN0dS5jb20NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IFpoZW5nLCBSdW9xaW4v1qMgyPTH1Q0KPiBTZW50OiBTYXR1
cmRheSwgQXByaWwgMTMsIDIwMTkgMTA6MzcgUE0NCj4gVG86IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IFpoZW5n
LCBSdW9xaW4v1qMgyPTH1SA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29t
Pg0KPiBTdWJqZWN0OiBbT0UtY29yZV1bUEFUQ0hdIHRvb2xjaGFpbi1zY3Jp
cHRzOiBtYWtlIHJwbSB3b3JrIGluIHRvb2xjaGFpbg0KPiANCj4gUnBtIG5l
ZWQgdG8gcmVhZCB0aGUgYXJjaCBpbmZvLCBidXQgJHNjcmlwdCBkaWQgbm90
IHByb3ZpZGUgaXQsIHNvIGFkZCBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFpoZW5nIFJ1b3FpbiA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPg0K
PiAtLS0NCj4gIG1ldGEvY2xhc3Nlcy90b29sY2hhaW4tc2NyaXB0cy5iYmNs
YXNzIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykN
Cj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMvdG9vbGNoYWluLXNj
cmlwdHMuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy90b29sY2hhaW4tDQo+IHNj
cmlwdHMuYmJjbGFzcw0KPiBpbmRleCAxYTJlYzRmLi5kZTUwYjdlIDEwMDY0
NA0KPiAtLS0gYS9tZXRhL2NsYXNzZXMvdG9vbGNoYWluLXNjcmlwdHMuYmJj
bGFzcw0KPiArKysgYi9tZXRhL2NsYXNzZXMvdG9vbGNoYWluLXNjcmlwdHMu
YmJjbGFzcw0KPiBAQCAtMTAxLDYgKzEwMSw3IEBAIHRvb2xjaGFpbl9zaGFy
ZWRfZW52X3NjcmlwdCAoKSB7DQo+ICAJZWNobyAnZXhwb3J0IENQUEZMQUdT
PSIke1RBUkdFVF9DUFBGTEFHU30iJyA+PiAkc2NyaXB0DQo+ICAJZWNobyAn
ZXhwb3J0IEtDRkxBR1M9Ii0tc3lzcm9vdD0kU0RLVEFSR0VUU1lTUk9PVCIn
ID4+ICRzY3JpcHQNCj4gIAllY2hvICdleHBvcnQgT0VDT1JFX0RJU1RST19W
RVJTSU9OPSIke0RJU1RST19WRVJTSU9OfSInID4+DQo+ICRzY3JpcHQNCj4g
KwllY2hvICdleHBvcnQgTUFDSElORV9BUkNIPSR7TUFDSElORV9BUkNIfScg
Pj4gJHNjcmlwdA0KPiAgCWVjaG8gJ2V4cG9ydCBPRUNPUkVfU0RLX1ZFUlNJ
T049IiR7U0RLX1ZFUlNJT059IicgPj4gJHNjcmlwdA0KPiAgCWVjaG8gJ2V4
cG9ydCBBUkNIPSR7QVJDSH0nID4+ICRzY3JpcHQNCj4gIAllY2hvICdleHBv
cnQgQ1JPU1NfQ09NUElMRT0ke1RBUkdFVF9QUkVGSVh9JyA+PiAkc2NyaXB0
DQo+IC0tDQo+IDEuOC4zLjENCg0KCgo=

