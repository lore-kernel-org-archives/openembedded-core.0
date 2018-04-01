Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5A0317470E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Apr 2018 06:01:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="38370247"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Apr 2018 14:01:45 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 19C8A48AE76C;
	Sun,  1 Apr 2018 14:01:42 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0361.001; Sun, 1 Apr 2018 14:01:42 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: Anuj Mittal <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] question about libgcrypt
Thread-Index: AQHTyBKaI9maDZIZEkqHc4ojyqrSbKPrbQsg
Date: Sun, 1 Apr 2018 06:01:40 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF7363ABFB45@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <33D4DBCAC5F2D74E96B07F6E7632BF7363ABF90A@G08CNEXMBPEKD01.g08.fujitsu.local>
	<6c9a937a-36b3-a1d7-28d6-f712c0e95427@intel.com>
In-Reply-To: <6c9a937a-36b3-a1d7-28d6-f712c0e95427@intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.150.1
dlp-reaction: no-action
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 19C8A48AE76C.A958F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: question about libgcrypt
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
X-List-Received-Date: Sun, 01 Apr 2018 06:01:50 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQW51aiwNCiAgICAgICAgIEhvdyB0byBjaGFuZ2Ugd2lyZXNoYXJrIGNv
bmZpZ3VyZSB0byB1c2UgcGtnLWNvbmZpZyBmb3IgbGliZ2NyeXB0Pw0KDQpU
aGFua3MNCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NClpoZW5nIFJ1b3Fpbg0KTmFuamluZyBGdWppdHN1
IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwgTHRkLihGTlNUKQ0KQUREUi46
IE5vLjYgV2Vuemh1IFJvYWQsIFNvZnR3YXJlIEF2ZW51ZSwNCiAgICAgICBO
YW5qaW5nLCAyMTAwMTIsIENoaW5hDQpNQUlMIDogemhlbmdycS5mbnN0QGNu
LmZ1amlzdHUuY29tDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IEFudWogTWl0dGFsIFttYWlsdG86YW51ai5taXR0YWxAaW50ZWwu
Y29tXSANClNlbnQ6IEZyaWRheSwgTWFyY2ggMzAsIDIwMTggNjozMyBQTQ0K
VG86IFpoZW5nLCBSdW9xaW4v6YORIOiLpemSpiA8emhlbmdycS5mbnN0QGNu
LmZ1aml0c3UuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBxdWVzdGlvbiBh
Ym91dCBsaWJnY3J5cHQNCg0KSGkgUnVvcWluLA0KDQpPbiAwMy8zMC8yMDE4
IDA2OjEwIFBNLCBaaGVuZywgUnVvcWluIHdyb3RlOg0KPiBIaSwNCj4gDQo+
IEkgZ290IHRoZSBmb2xsb3dpbmcgZXJyb3Igd2hlbiBidWlsZGluZyB3aXJl
c2hhcmsgMi40LjUgZHVyaW5nIGRvX2NvbmZpZ3VyZSwNCj4gICAgICAgLi4u
Li4uDQo+ICAgICAgfCBjaGVja2luZyBmb3IgbGliZ2NyeXB0LWNvbmZpZy4u
LiANCj4gL3lvY3RvL3dvcmswMDEvZm5zdC9odWFuZ3F5L3VwZ3JhZGUvYnVp
bGQvdG1wL3dvcmsvaTU4Ni1wb2t5LWxpbnV4L3dpcmVzaGFyay8xXzIuNC41
LXIwL3JlY2lwZS1zeXNyb290L3Vzci9iaW4vY3Jvc3NzY3JpcHRzL2xpYmdj
cnlwdC1jb25maWcNCj4gICAgICB8IGNoZWNraW5nIGZvciBMSUJHQ1JZUFQg
LSB2ZXJzaW9uID49IDEuNC4yLi4uIEVSUk9SOiANCj4gL3Vzci9iaW4vbGli
Z2NyeXB0LWNvbmZpZyBzaG91bGQgbm90IGJlIHVzZWQsIHVzZSBhbiBhbHRl
cm5hdGl2ZSBzdWNoIGFzIHBrZy1jb25maWcNCj4gICAgICB8IC4uL3dpcmVz
aGFyay0yLjQuNS9jb25maWd1cmU6IGxpbmUgMjAyMTQ6IHRlc3Q6IA0KPiAt
LXNob3VsZC1ub3QtaGF2ZS11c2VkLS91c3IvYmluL2xpYmdjcnlwdC1jb25m
aWc6IGludGVnZXIgZXhwcmVzc2lvbiBleHBlY3RlZA0KPiAgICAgIHwgLi4v
d2lyZXNoYXJrLTIuNC41L2NvbmZpZ3VyZTogbGluZSAyMDIxNzogdGVzdDog
DQo+IC0tc2hvdWxkLW5vdC1oYXZlLXVzZWQtL3Vzci9iaW4vbGliZ2NyeXB0
LWNvbmZpZzogaW50ZWdlciBleHByZXNzaW9uIGV4cGVjdGVkDQo+ICAgICAg
Li4uLi4NCg0KWW91IHdpbGwgaGF2ZSB0byBjaGFuZ2Ugd2lyZXNoYXJrIGNv
bmZpZ3VyZSB0byB1c2UgcGtnLWNvbmZpZyBmb3IgbGliZ2NyeXB0IGluc3Rl
YWQgb2YgcmVseWluZyBvbiBiaW5jb25maWcgZmlsZSB0byBnZXQgdGhlIHZl
cnNpb24gYW5kIGZsYWdzLg0KDQpUaGFua3MsDQoNCkFudWoNCg0KDQoKCg==

