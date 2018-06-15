Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6C48974F85
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 01:39:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="41109433"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jun 2018 09:39:05 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D34174B41E7D;
	Fri, 15 Jun 2018 09:39:01 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0399.000; Fri, 15 Jun 2018 09:39:03 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH] meta-toolchain: Added dnf-nativesdk into
	cross-development toolchain.
Thread-Index: AQHUAWqD1lbikEZYK0W1x1wfHaU3kaRfHv6w//+zbACAAb0l0A==
Date: Fri, 15 Jun 2018 01:39:02 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF7363AE9E2F@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1527502858-81691-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0LZVcc+_ocfuYEUBKK0Hbr0SaZEH7CUYKK17gMk+CXwxwg@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AE9A7F@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj-ege3VdhZ_AR=CpTmOZc3yyO55BOpt0YZNMk+Ww2BpJA@mail.gmail.com>
In-Reply-To: <CANNYZj-ege3VdhZ_AR=CpTmOZc3yyO55BOpt0YZNMk+Ww2BpJA@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.300.84
dlp-reaction: no-action
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: D34174B41E7D.A9E5C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
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
X-List-Received-Date: Fri, 15 Jun 2018 01:39:05 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQWxleDoNCg0KVGhlc2UgcGFja2FnZXMgYXJlIHRha2VuIGZyb20geW9j
dG8gYnVpbGQgc3lzdGVtLCBhbmQgdGhleSB3aWxsIGJlIGluc3RhbGxlZCBp
biB5b3VyIGhvc3QgYXMgcm9vdCBmaWxlIHN5c3RlbSwgdGhlbiB5b3UgY2Fu
IGRlcGxveSB0aGUgcm9vdCBmaWxlIHN5c3RlbSB0byB5b3VyIGVtYmVkZGVk
IGRldmljZS4NCg0KLS0NClpoZW5nIFJ1b3Fpbg0KTmFuamluZyBGdWppdHN1
IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKQ0KQUREUi46
IE5vLjYgV2Vuemh1IFJvYWQsIFNvZnR3YXJlIEF2ZW51ZSwNCiAgICAgICBO
YW5qaW5nLCAyMTAwMTIsIENoaW5hDQpNQUlMIDogemhlbmdycS5mbnN0QGNu
LmZ1amlzdHUuY29tDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IEFsZXhhbmRlciBLYW5hdmluIFttYWlsdG86YWxleC5rYW5hdmlu
QGdtYWlsLmNvbV0gDQpTZW50OiBUaHVyc2RheSwgSnVuZSAxNCwgMjAxOCAz
OjAzIFBNDQpUbzogWmhlbmcsIFJ1b3Fpbi/pg5Eg6Iul6ZKmIDx6aGVuZ3Jx
LmZuc3RAY24uZnVqaXRzdS5jb20+DQpDYzogQnVydG9uLCBSb3NzIDxyb3Nz
LmJ1cnRvbkBpbnRlbC5jb20+OyBPRS1jb3JlIDxvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KU3ViamVjdDogUmU6IFtPRS1j
b3JlXSBbUEFUQ0hdIG1ldGEtdG9vbGNoYWluOiBBZGRlZCBkbmYtbmF0aXZl
c2RrIGludG8gY3Jvc3MtZGV2ZWxvcG1lbnQgdG9vbGNoYWluLg0KDQoyMDE4
LTA2LTE0IDY6MzggR01UKzAzOjAwIFpoZW5nLCBSdW9xaW4gPHpoZW5ncnEu
Zm5zdEBjbi5mdWppdHN1LmNvbT46DQo+IEkgc3VibWl0dGVkIHRoaXMgcGF0
Y2ggYWltIHRvIHVzZSBkbmYgb3V0IG9mIFlvY3RvIGJ1aWxkIHN5c3RlbSB0
byBtYW5hZ2UgcGFja2FnZXMuDQoNClBsZWFzZSBleHBsYWluIHRoaXMgaW4g
ZGV0YWlsLiBXaGVyZSBhcmUgdGhlIHBhY2thZ2VzIHRha2VuIGZyb20sIGFu
ZCB3aGVyZSBhcmUgdGhleSBpbnN0YWxsZWQ/DQoNCkFsZXgNCg0KDQoKCg==

