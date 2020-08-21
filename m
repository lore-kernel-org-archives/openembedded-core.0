Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.126523.1597982403877767751
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 21:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: leimaohui@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.76,335,1592841600"; 
   d="scan'208";a="98371253"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 21 Aug 2020 11:59:57 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 82C9248990C1
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 11:59:54 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 21 Aug 2020 11:59:55 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([::1]) by
 G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::4086:9520:5ef9:407d%14]) with mapi
 id 15.00.1497.006; Fri, 21 Aug 2020 11:59:55 +0800
From: "leimaohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Why there is a RCONFLICTS in wireless-regdb recipe file
Thread-Topic: Why there is a RCONFLICTS in wireless-regdb recipe file
Thread-Index: AdZ3b3b/6pPOCdBPSVaJ2RAzFGBb8g==
Date: Fri, 21 Aug 2020 03:59:54 +0000
Message-ID: <007f8ef0fb6946248f6e5e2e3e465acf@G08CNEXMBPEKD05.g08.fujitsu.local>
Accept-Language: en-AU, zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 82C9248990C1.ABA55
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNClRoZXJlIGlzIGEgUkNPTkZMSUNUUyBpbiB3aXJlbGVzcy1yZWdk
YiByZWNpcGUgZmlsZToNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCiMgSW5zdGFsbCBzdGF0aWMgcmVndWxhdG9yeSBE
QiBpbiAvbGliL2Zpcm13YXJlIGZvciBrZXJuZWwgdG8gbG9hZC4NCiMgVGhp
cyByZXF1aXJlcyBMaW51eCBrZXJuZWwgPj0gdjQuMTUuDQojIEZvciBrZXJu
ZWwgPD0gdjQuMTQsIGluaGVyaXQgdGhlIGtlcm5lbF93aXJlbGVzc19yZWdk
Yi5iYmNsYXNzDQojIChpbiBtZXRhLW5ldHdvcmtpbmcpIGluIGtlcm5lbCdz
IHJlY2lwZS4NClBBQ0tBR0VTID0gIiR7UE59LXN0YXRpYyAke1BOfSINClJD
T05GTElDVFNfJHtQTn0gPSAiJHtQTn0tc3RhdGljIiAgICA8LS0tSGVyZQ0K
DQpGSUxFU18ke1BOfS1zdGF0aWMgPSAiIFwNCiAgICAke25vbmFyY2hfYmFz
ZV9saWJkaXJ9L2Zpcm13YXJlL3JlZ3VsYXRvcnkuZGIgXA0KICAgICR7bm9u
YXJjaF9iYXNlX2xpYmRpcn0vZmlybXdhcmUvcmVndWxhdG9yeS5kYi5wN3Mg
XA0KIg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQoNCkJ1dCBJJ20gbm90IHVuZGVyc3RhbmQgd2h5IHRoaXMgcGFy
YW1ldGVyIGhhcyBiZWVuIGFkZGVkPyBUaGVyZSBpcyBubyBjb25mbGljdCBm
aWxlIGJldHdlZW4gdGhlc2UgdHdvIHBhY2thZ2VzPw0KT3IgZm9yIG90aGVy
IHJlYXNvbnM/DQoNClRoZSBmb2xsb3dpbmcgaXMgdGhlIGZpbGUgbGlzdCBv
ZiB3aXJlbGVzcy1yZWdkYi1zdGF0aWMgYW5kIHdpcmVsZXNzLXJlZ2RiLg0K
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
L3dpcmVsZXNzLXJlZ2RiLzIwMjAuMDQuMjktcjAvcGFja2FnZXMtc3BsaXQv
d2lyZWxlc3MtcmVnZGItc3RhdGljLw0K4pSU4pSA4pSAIGxpYg0KICAgIOKU
lOKUgOKUgCBmaXJtd2FyZQ0KICAgICAgICDilJzilIDilIAgcmVndWxhdG9y
eS5kYg0KICAgICAgICDilJTilIDilIAgcmVndWxhdG9yeS5kYi5wN3MNCg0K
MiBkaXJlY3RvcmllcywgMiBmaWxlcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0Kd2lyZWxlc3MtcmVnZGIvMjAyMC4w
NC4yOS1yMC9wYWNrYWdlcy1zcGxpdC93aXJlbGVzcy1yZWdkYg0K4pSc4pSA
4pSAIGV0Yw0K4pSCwqDCoCDilJTilIDilIAgd2lyZWxlc3MtcmVnZGINCuKU
gsKgwqAgICAgIOKUlOKUgOKUgCBwdWJrZXlzDQrilILCoMKgICAgICAgICAg
4pSU4pSA4pSAIHNmb3JzaGVlLmtleS5wdWIucGVtDQrilJTilIDilIAgdXNy
DQogICAg4pSU4pSA4pSAIGxpYg0KICAgICAgICDilJTilIDilIAgY3JkYQ0K
ICAgICAgICAgICAg4pSU4pSA4pSAIHJlZ3VsYXRvcnkuYmluDQoNCjYgZGly
ZWN0b3JpZXMsIDIgZmlsZXMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCg0KQmVzdCB3aXNoZWQNCkxlaQ0KCgo=
