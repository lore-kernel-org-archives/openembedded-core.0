Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C5BFD746E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 10:12:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38349305"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Mar 2018 18:10:17 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 8CCF9486A78C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 18:10:17 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0361.001; Fri, 30 Mar 2018 18:10:15 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] question about libgcrypt
Thread-Index: AdPIDxAHL+A5gW3rSfGtOyN7BFqW9A==
Date: Fri, 30 Mar 2018 10:10:15 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF7363ABF90A@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.150.1
dlp-reaction: no-action
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 8CCF9486A78C.AB671
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: question about libgcrypt
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
X-List-Received-Date: Fri, 30 Mar 2018 10:12:21 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGksDQoNCkkgZ290IHRoZSBmb2xsb3dpbmcgZXJyb3Igd2hlbiBidWlsZGlu
ZyB3aXJlc2hhcmsgMi40LjUgZHVyaW5nIGRvX2NvbmZpZ3VyZSwNCiAgICAg
IC4uLi4uLg0KICAgICB8IGNoZWNraW5nIGZvciBsaWJnY3J5cHQtY29uZmln
Li4uIA0KL3lvY3RvL3dvcmswMDEvZm5zdC9odWFuZ3F5L3VwZ3JhZGUvYnVp
bGQvdG1wL3dvcmsvaTU4Ni1wb2t5LWxpbnV4L3dpcmVzaGFyay8xXzIuNC41
LXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzL2xpYmdj
cnlwdC1jb25maWcNCiAgICAgfCBjaGVja2luZyBmb3IgTElCR0NSWVBUIC0g
dmVyc2lvbiA+PSAxLjQuMi4uLiBFUlJPUjogDQovdXNyL2Jpbi9saWJnY3J5
cHQtY29uZmlnIHNob3VsZCBub3QgYmUgdXNlZCwgdXNlIGFuIGFsdGVybmF0
aXZlIHN1Y2ggYXMgcGtnLWNvbmZpZw0KICAgICB8IC4uL3dpcmVzaGFyay0y
LjQuNS9jb25maWd1cmU6IGxpbmUgMjAyMTQ6IHRlc3Q6IA0KLS1zaG91bGQt
bm90LWhhdmUtdXNlZC0vdXNyL2Jpbi9saWJnY3J5cHQtY29uZmlnOiBpbnRl
Z2VyIGV4cHJlc3Npb24gZXhwZWN0ZWQNCiAgICAgfCAuLi93aXJlc2hhcmst
Mi40LjUvY29uZmlndXJlOiBsaW5lIDIwMjE3OiB0ZXN0OiANCi0tc2hvdWxk
LW5vdC1oYXZlLXVzZWQtL3Vzci9iaW4vbGliZ2NyeXB0LWNvbmZpZzogaW50
ZWdlciBleHByZXNzaW9uIGV4cGVjdGVkDQogICAgIC4uLi4uDQoNCkFuZCBJ
IGZvdW5kIGl0J3MgY2F1c2VkIGJ5IGxpYmdjcnlwdC1jb25maWcgYXMgZm9s
bG93cw0KDQogICAgICMhL2Jpbi9zaA0KICAgICBlY2hvICdFUlJPUjogL3Vz
ci9iaW4vbGliZ2NyeXB0LWNvbmZpZyBzaG91bGQgbm90IGJlIHVzZWQsIHVz
ZSBhbiBhbHRlcm5hdGl2ZSBzdWNoIGFzIHBrZy1jb25maWcnID4mMg0KICAg
ICBlY2hvICctLXNob3VsZC1ub3QtaGF2ZS11c2VkLS91c3IvYmluL2xpYmdj
cnlwdC1jb25maWcnDQogICAgIGV4aXQgMQ0KDQpJIHRoaW5rIHRoaXMgZXJy
b3IgaXMgY2F1c2VkIGJ5IGxpYmdjcnlwdCwgaXQgY3JlYXRlcyB0aGUgd3Jv
bmcgZmlsZSwgZG9lcyBhbnlvbmUgaGF2ZSBhbnkgaWRlYSBhYm91dCB0aGlz
Pw0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KWmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3UgTmFu
ZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjogTm8u
NiBXZW56aHUgUm9hZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5hbmpp
bmcsIDIxMDAxMiwgQ2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24uZnVq
aXN0dS5jb20NCg0KDQoKCg==

