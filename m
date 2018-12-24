Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 81E506BC7E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Dec 2018 09:22:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,391,1539619200"; d="scan'208";a="50524327"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Dec 2018 17:22:21 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id BF9604B75BF9;
	Mon, 24 Dec 2018 17:22:17 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0415.000; Mon, 24 Dec 2018 17:22:22 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [thud][PATCH v2] createrepo-c: Fix setup of logging
	(log domains)
Thread-Index: AQHUl4x+F2170kQSO0mjNYt4qZBbVKWI7J8w///KUoCABO4fQA==
Date: Mon, 24 Dec 2018 09:22:20 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B1BBF9F6@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1544525848-72525-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1BBD245@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CAJTo0Lb+ibZRCJsumRqYACE9kdo1haoZA8kM2EaArwqP3WAufg@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1BBE7D3@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CAJTo0LZh_V-uPHp8NweDUGq62YP0h8UMRBfkXQ_+FTKLUzvOXg@mail.gmail.com>
In-Reply-To: <CAJTo0LZh_V-uPHp8NweDUGq62YP0h8UMRBfkXQ_+FTKLUzvOXg@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: BF9604B75BF9.AC38A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH v2] createrepo-c: Fix setup of logging (log domains)
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
X-List-Received-Date: Mon, 24 Dec 2018 09:22:23 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUm9zcw0KDQpUaGlzIHBhdGNoIGlzIGp1c3QgZm9yIHRodWQuDQoNCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQpaaGVuZyBSdW9xaW4NCk5hbmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0
d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkNCkFERFIuOiBOby42IFdlbnpo
dSBSb2FkLCBTb2Z0d2FyZSBBdmVudWUsDQogICAgICAgTmFuamluZywgMjEw
MDEyLCBDaGluYQ0KTUFJTCA6IHpoZW5ncnEuZm5zdEBjbi5mdWppc3R1LmNv
bQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJ1
cnRvbiwgUm9zcyBbbWFpbHRvOnJvc3MuYnVydG9uQGludGVsLmNvbV0NCj4g
U2VudDogRnJpZGF5LCBEZWNlbWJlciAyMSwgMjAxOCAxMDowNCBQTQ0KPiBU
bzogWmhlbmcsIFJ1b3Fpbi/pg5Eg6Iul6ZKmIDx6aGVuZ3JxLmZuc3RAY24u
ZnVqaXRzdS5jb20+DQo+IENjOiBPRS1jb3JlIDxvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFt0aHVkXVtQQVRDSCB2Ml0gY3JlYXRlcmVwby1jOiBGaXggc2V0
dXAgb2YgbG9nZ2luZyAobG9nDQo+IGRvbWFpbnMpDQo+IA0KPiBPbiBGcmks
IDIxIERlYyAyMDE4IGF0IDA5OjE5LCBaaGVuZywgUnVvcWluIDx6aGVuZ3Jx
LmZuc3RAY24uZnVqaXRzdS5jb20+IHdyb3RlOg0KPiA+IFdlbGwsIGNyZWF0
ZXJlcG8tYyAwLjEyIGhhcyBmaXhlZCB0aGlzIGJ1ZywgYW5kIHdpbGwgdGhp
cyB1cGdyYWRlIGJlIG1lcmdlZCB0bw0KPiB0aHVkIGJyYW5jaD8NCj4gDQo+
IFRoZSB1cGdyYWRlIHdvbid0IGJlIG1lcmdlZCB1bmxlc3MgaXRzIGNyaXRp
Y2FsLCBzbyBwbGVhc2Ugc3VibWl0IHlvdXIgcGF0Y2ggZm9yDQo+IHRodWQu
DQo+IA0KPiBSb3NzDQo+IA0KDQoKCg==

