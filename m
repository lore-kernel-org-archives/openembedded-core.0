Return-Path: <yaoxp@cn.fujitsu.com>
X-Greylist: delayed 649 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 May 2014 08:24:59 UTC
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6E20665F69
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 08:24:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,872,1392134400"; d="scan'208";a="30758033"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 May 2014 16:11:35 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id s4K8E72R019656
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 16:14:07 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0146.002; Tue, 20 May 2014 16:14:14 +0800
From: "yaoxp@cn.fujitsu.com" <yaoxp@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] lvm2: EXTRA_OECONF is been overwrited.
Thread-Index: Ac90AtKIzqH0p3I6SAOJ0BWymaNuMQ==
Date: Tue, 20 May 2014 08:14:13 +0000
Message-ID: <9AD1F2A584A7644C9605656D538412FEA7B655@G08CNEXMBPEKD03.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.171]
MIME-Version: 1.0
Subject: [PATCH] lvm2: EXTRA_OECONF is been overwrited.
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
X-List-Received-Date: Tue, 20 May 2014 08:25:05 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgYWxsOg0KDQpJbiBsdm0yLmluYywgRVhUUkFfT0VDT05GIGhhcyBiZWVuIGFzc2lnbmVkIGJl
Zm9yZSChrkVYVFJBX09FQ09ORiA9ICItLXdpdGgtdXNybGliZGlyPSR7bGliZGlyfSKhry4NCg0K
U28sIKGuRVhUUkFfT0VDT05GID0gIi0td2l0aC11c3JsaWJkaXI9JHtsaWJkaXJ9IqGvIHNob3Vs
ZCBiZSBjaGFuZ2VkIHRvIKGuRVhUUkFfT0VDT05GICs9ICItLXdpdGgtdXNybGliZGlyPSR7bGli
ZGlyfSKhry4NCg0KU2lnbmVkLW9mZi1ieTogWWFvIFhpbnBhbiA8eWFveHBAY24uZnVqaXRzdS5j
b20+DQotLS0NCm1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2x2bTIvbHZtMi5pbmMgfCAyICstDQox
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdp
dCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2x2bTIvbHZtMi5pbmMgYi9tZXRhLW9lL3JlY2lw
ZXMtc3VwcG9ydC9sdm0yL2x2bTIuaW5jDQppbmRleCBjNmE5ZWMwLi43MWY3ODJhIDEwMDY0NA0K
LS0tIGEvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvbHZtMi9sdm0yLmluYw0KKysrIGIvbWV0YS1v
ZS9yZWNpcGVzLXN1cHBvcnQvbHZtMi9sdm0yLmluYw0KQEAgLTQ3LDQgKzQ3LDQgQEAgRklMRVNf
JHtQTn0gKz0gIiR7bGliZGlyfS9kZXZpY2UtbWFwcGVyLyouc28gJHtiYXNlX2xpYmRpcn0vdWRl
diINCkZJTEVTXyR7UE59LWRiZyArPSAiJHtsaWJkaXJ9L2RldmljZS1tYXBwZXIvLmRlYnVnIg0K
DQpSREVQRU5EU18ke1BOfSA9ICJiYXNoIg0KLUVYVFJBX09FQ09ORiA9ICItLXdpdGgtdXNybGli
ZGlyPSR7bGliZGlyfSINCitFWFRSQV9PRUNPTkYgKz0gIi0td2l0aC11c3JsaWJkaXI9JHtsaWJk
aXJ9Ig0KLS0NCjEuOC40LjINCg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQpOQU1FOiBZYW8gWGlucGFuDQpURUw6ODU1OQ0KDQoNCg==

