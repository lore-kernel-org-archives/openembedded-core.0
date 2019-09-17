Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D5B067F93E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 00:44:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,514,1559491200"; d="scan'208";a="75546348"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Sep 2019 08:44:26 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 338634CE14F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 08:44:09 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0439.000; Tue, 17 Sep 2019 08:44:29 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core]  [PATCH] dnf: make dnf work in toolchain
Thread-Index: AQHVbH2Q+oHmW8t1QkKBCB2dqgLsx6cvA30g
Date: Tue, 17 Sep 2019 00:44:32 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF73B5B6F545@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1568615805-50657-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<380372ea5dfb9b87cd72363064c5f63e61b84744.camel@linuxfoundation.org>
In-Reply-To: <380372ea5dfb9b87cd72363064c5f63e61b84744.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 338634CE14F7.A9DCB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] dnf: make dnf work in toolchain
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
X-List-Received-Date: Tue, 17 Sep 2019 00:44:29 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZA0KDQo+IHlvdSBjYW4gcnVuIHRoZXNlIHdpdGggY29tbWFu
ZHMgbGlrZToNCj4gDQo+IG9zLXNlbGZ0ZXN0IC1yIHNzdGF0ZXRlc3RzLlNT
dGF0ZVRlc3RzLnRlc3Rfc3N0YXRlX2FsbGFyY2hfc2FtZXNpZ3MNCj4gDQo+
IENoZWVycywNCg0KQ291bGQgeW91IHRlbGwgbWUgd2hhdCBkb2VzIHRoZSBv
ZS1zZWxmdGVzdCAgaW4gaGVyZSB0ZXN0IGZvcj8gRXNwZWNpYWxseSB3aGF0
IGRvIHRoZSBzaWduYXR1cmUgdGVzdHMgdGVzdCBmb3I/DQoNClRoYW5rcw0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NClpoZW5nIFJ1b3Fpbg0KTmFuamluZyBGdWppdHN1IE5hbmRhIFNv
ZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKQ0KQUREUi46IE5vLjYgV2Vu
emh1IFJvYWQsIFNvZnR3YXJlIEF2ZW51ZSwNCiAgICAgICBOYW5qaW5nLCAy
MTAwMTIsIENoaW5hDQpNQUlMIDogemhlbmdycS5mbnN0QGNuLmZ1amlzdHUu
Y29tDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBSaWNoYXJkIFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmddDQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDE2
LCAyMDE5IDY6NTcgUE0NCj4gVG86IFpoZW5nLCBSdW9xaW4v6YORIOiLpemS
piA8emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPjsgb3BlbmVtYmVkZGVk
LQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGRuZjogbWFrZSBkbmYgd29yayBpbiB0
b29sY2hhaW4NCj4gDQo+IE9uIE1vbiwgMjAxOS0wOS0xNiBhdCAxNDozNiAr
MDgwMCwgWmhlbmcgUnVvcWluIHdyb3RlOg0KPiA+IFdlIG5lZWQgdG8gY29u
ZmlndXJlIGRuZiB0byB1c2UgcGFja2FnZSBhcmNoaXRlY3R1cmUgZnJvbSB5
b2N0byBidWlsZA0KPiA+IHN5c3RlbS4NCj4gPg0KPiA+IEluc3RhbGwgZXRj
L2RuZi92YXJzIHRvICR7U0RLVEFSR0VUU1lTUk9PVH0gYmVjYXVzZSBjb25m
aWcgZmlsZSBpbg0KPiA+IGhvc3Qtc3lzcm9vdCBhcyAvb3B0L3Bva3kvMi43
K3NuYXBzaG90L3N5c3Jvb3RzL3g4Nl82NC1wb2t5c2RrLWxpbnV4DQo+ID4g
d2lsbCBiZSBjb3ZlcmVkIGJ5IGFub3RoZXIgQVJDSCB3aGljaCByZXN1bHQg
aW4gcHJldmlvdXMgY29uZmlnDQo+ID4gc2V0dGluZ3MgaW5lZmZpY2FjeS4N
Cj4gPg0KPiA+IFRvIHJlc29sdmUgaXQsIHB1dCBjb25maWcgZmlsZSBpbiB0
YXJnZXQtc3lzcm9vdCBsaWtlDQo+ID4gL29wdC9wb2t5LzIuNytzbmFwc2hv
dC9zeXNyb290cy9jb3JlMi02NC1wb2t5LWxpbnV4LiBBcyBlYWNoIEFSQ0gg
aGFzDQo+ID4gaXRzIG93biB0YXJnZXQtc3lzcm9vdCwgY29uZmlnIGZpbGUg
d2lsbCBub3QgYmUgY292ZXJlZC4NCj4gDQo+IEknbSBhZnJhaWQgd2UgY2Fu
J3QgaGF2ZSB0YXJnZXQgZGVwZW5kZW5jaWVzIHdpdGhpbiBuYXRpdmVzZGsg
cGFja2FnZXMuDQo+IA0KPiBUaGlzIGlzIHNob3duIGJ5IHRoZSBmYWN0IHRo
aXMgcGF0Y2ggKGFuZCB0aGUgc2ltaWxhciBycG0gb25lKSBjYXVzZSBzZWxm
dGVzdA0KPiBmYWlsdXJlcyBpbiB0aGUgc2lnbmF0dXJlIHRlc3RzOg0KPiAN
Cj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhv
b24vIy9idWlsZGVycy83OS9idWlsZHMvMzgxL3N0ZXBzLzgNCj4gL2xvZ3Mv
c3RlcDJkDQo+IA0KPiAyMDE5LTA5LTE2IDAwOjI0OjU0LDY3MCAtIG9lLXNl
bGZ0ZXN0IC0gSU5GTyAtIFJFU1VMVFMgLQ0KPiBzc3RhdGV0ZXN0cy5TU3Rh
dGVUZXN0cy50ZXN0X3NzdGF0ZV9hbGxhcmNoX3NhbWVzaWdzOiBGQUlMRUQg
KDExMS41OXMpDQo+IDIwMTktMDktMTYgMDA6MjQ6NTQsNjcwIC0gb2Utc2Vs
ZnRlc3QgLSBJTkZPIC0gUkVTVUxUUyAtDQo+IHNzdGF0ZXRlc3RzLlNTdGF0
ZVRlc3RzLnRlc3Rfc3N0YXRlX25hdGl2ZXNka19zYW1lc2lnc19tdWx0aWxp
YjogRkFJTEVEDQo+ICgxNDQuMTRzKQ0KPiAyMDE5LTA5LTE2IDAwOjI0OjU0
LDY3MCAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIFJFU1VMVFMgLQ0KPiBzc3Rh
dGV0ZXN0cy5TU3RhdGVUZXN0cy50ZXN0X3NzdGF0ZV9zYW1ldHVuZV9zYW1l
c2lnczogRkFJTEVEICgxNjEuNTNzKQ0KPiANCj4geW91IGNhbiBydW4gdGhl
c2Ugd2l0aCBjb21tYW5kcyBsaWtlOg0KPiANCj4gb3Mtc2VsZnRlc3QgLXIg
c3N0YXRldGVzdHMuU1N0YXRlVGVzdHMudGVzdF9zc3RhdGVfYWxsYXJjaF9z
YW1lc2lncw0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCj4g
DQoNCgoK

