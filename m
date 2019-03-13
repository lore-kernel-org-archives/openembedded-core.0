Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 45A046B90D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 08:46:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,474,1544457600"; d="scan'208";a="56657150"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Mar 2019 16:46:00 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1C72C4C8B03B;
	Wed, 13 Mar 2019 16:45:37 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0415.000; Wed, 13 Mar 2019 16:46:10 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] createrepo-c: fix for do_package_qa
Thread-Index: AQHU2IBWWm4UnWnCg06wxF4GX0DL2KYHRhqAgAH61RA=
Date: Wed, 13 Mar 2019 08:46:06 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B1BEB946@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1552046342-45875-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0LZw_kKeyQarwrKwRUpHUd0_FFDHFDxMXYFBQeOP_0vokA@mail.gmail.com>
In-Reply-To: <CAJTo0LZw_kKeyQarwrKwRUpHUd0_FFDHFDxMXYFBQeOP_0vokA@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 1C72C4C8B03B.AB0F8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] createrepo-c: fix for do_package_qa
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
X-List-Received-Date: Wed, 13 Mar 2019 08:46:01 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zc++8mg0KDQpKdXN0IHdvcmsgYXJvdW5kLg0KTm93IEkgZG9uJ3Qg
a25vdyB3aHkgZG9lcyBjcmVhdGVyZXBvLWMgZGVwZW5kIG9uIHB5dGhvbjMt
ZGV2Lg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3Ug
TmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjog
Tm8uNiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5h
bmppbmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24u
ZnVqaXN0dS5jb20NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IEJ1cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGlu
dGVsLmNvbV0NCj4gU2VudDogVHVlc2RheSwgTWFyY2ggMTIsIDIwMTkgNjoz
MCBQTQ0KPiBUbzogWmhlbmcsIFJ1b3Fpbi/pg5Eg6Iul6ZKmIDx6aGVuZ3Jx
LmZuc3RAY24uZnVqaXRzdS5jb20+DQo+IENjOiBPRS1jb3JlIDxvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gY3JlYXRlcmVwby1jOiBmaXggZm9y
IGRvX3BhY2thZ2VfcWENCj4gDQo+IE9uIFR1ZSwgMTIgTWFyIDIwMTkgYXQg
MDM6MDUsIFpoZW5nIFJ1b3FpbiA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3Uu
Y29tPiB3cm90ZToNCj4gPiBGaXggdGhlIGZvbGxvd2luZyBRQSBJc3N1ZToN
Cj4gPg0KPiA+IEVSUk9SOiBuYXRpdmVzZGstY3JlYXRlcmVwby1jLTAuMTIu
MS1yMCBkb19wYWNrYWdlX3FhOiBRQSBJc3N1ZTogbmF0aXZlc2RrLQ0KPiBj
cmVhdGVyZXBvLWMgcmRlcGVuZHMgb24gbmF0aXZlc2RrLXB5dGhvbjMtZGV2
IFtkZXYtZGVwc10NCj4gPiBFUlJPUjogbmF0aXZlc2RrLWNyZWF0ZXJlcG8t
Yy0wLjEyLjEtcjAgZG9fcGFja2FnZV9xYTogUUEgcnVuIGZvdW5kIGZhdGFs
DQo+IGVycm9ycy4gUGxlYXNlIGNvbnNpZGVyIGZpeGluZyB0aGVtLg0KPiAN
Cj4gRml4aW5nIG9yIHdvcmtpbmcgYXJvdW5kPyAgV2h5IGRvZXMgY3JlYXRl
cmVwby1jIGRlcGVuZCBvbiBweXRob24zLWRldj8NCj4gDQo+IFJvc3MNCj4g
DQoNCgoK

