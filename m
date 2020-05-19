Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.4384.1589851659345964734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 18:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,408,1583164800"; 
   d="scan'208";a="92500282"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 19 May 2020 09:27:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id C68564BCC8A8;
	Tue, 19 May 2020 09:27:35 +0800 (CST)
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 19 May 2020 09:27:34 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local ([fe80::2585:ff76:6709:8cf2])
 by G08CNEXMBPEKD06.g08.fujitsu.local ([fe80::2585:ff76:6709:8cf2%14]) with
 mapi id 15.00.1497.006; Tue, 19 May 2020 09:27:36 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] make-mod-scripts: Added ALLOW_EMPTY to fix dependence error.
Thread-Topic: [OE-core][PATCH] make-mod-scripts: Added ALLOW_EMPTY to fix
 dependence error.
Thread-Index: AQHWLXnUqTsjIfsapki/dZ59WJxlLqiunhaw
Date: Tue, 19 May 2020 01:27:36 +0000
Message-ID: <151e01ed32554ef5a45e6809521b50e6@G08CNEXMBPEKD06.g08.fujitsu.local>
References: <1589882511-3446-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <CA+chaQcqsTi8h+-U5Jw0f9y5L5abjaz5tJqG7dQVPRAJH2dzFg@mail.gmail.com>
In-Reply-To: <CA+chaQcqsTi8h+-U5Jw0f9y5L5abjaz5tJqG7dQVPRAJH2dzFg@mail.gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.35]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: C68564BCC8A8.ABE54
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkNCkkgZ290IGl0LiBBbmQgSSB3aWxsIHNlbmQgdGhlIHYyIHBhdGNoIHNvb24uDQoNCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpaaGVuZyBSdW9x
aW4NCk5hbmppbmcgRnVqaXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkN
CkFERFIuOiBOby42IFdlbnpodSBSb2FkLCBTb2Z0d2FyZSBBdmVudWUsDQogICAgICAgTmFuamlu
ZywgMjEwMDEyLCBDaGluYQ0KTUFJTCA6IG1haWx0bzp6aGVuZ3JxLmZuc3RAY24uZnVqaXN0dS5j
b20NCg0KDQpGcm9tOiBNYXJ0aW4gSmFuc2EgPG1hcnRpbi5qYW5zYUBnbWFpbC5jb20+IA0KU2Vu
dDogVHVlc2RheSwgTWF5IDE5LCAyMDIwIDk6MDcgQU0NClRvOiBaaGVuZywgUnVvcWluL+mDkSDo
i6XpkqYgPHpoZW5ncnEuZm5zdEBjbi5mdWppdHN1LmNvbT4NCkNjOiBQYXRjaGVzIGFuZCBkaXNj
dXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllciA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIG1ha2UtbW9k
LXNjcmlwdHM6IEFkZGVkIEFMTE9XX0VNUFRZIHRvIGZpeCBkZXBlbmRlbmNlIGVycm9yLg0KDQpT
ZXQgUkRFUEVORFNfJHtQTn0tZGV2IHRvIGVtcHR5IGluc3RlYWQgb2YgaW5zdGFsbGluZyB1c2Vs
ZXNzIGVtcHR5IHBhY2thZ2VzLg0KDQpPbiBUdWUsIE1heSAxOSwgMjAyMCBhdCAzOjAyIEFNIHpo
ZW5ncnVvcWluIDxtYWlsdG86emhlbmdycS5mbnN0QGNuLmZ1aml0c3UuY29tPiB3cm90ZToNCkVy
cm9yOg0KwqBQcm9ibGVtOiBjb25mbGljdGluZyByZXF1ZXN0cw0KwqAgLSBub3RoaW5nIHByb3Zp
ZGVzIG1ha2UtbW9kLXNjcmlwdHMgPSAxLjAtcjAgbmVlZGVkIGJ5IG1ha2UtbW9kLXNjcmlwdHMt
ZGV2LTEuMC1yMA0KDQpTaWduZWQtb2ZmLWJ5OiBaaGVuZyBSdW9xaW4gPG1haWx0bzp6aGVuZ3Jx
LmZuc3RAY24uZnVqaXRzdS5jb20+DQotLS0NCsKgbWV0YS9yZWNpcGVzLWtlcm5lbC9tYWtlLW1v
ZC1zY3JpcHRzL2h0dHA6Ly9tYWtlLW1vZC1zY3JpcHRzXzEuMC5iYiB8IDEgKw0KwqAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwvbWFrZS1tb2Qtc2NyaXB0cy9odHRwOi8vbWFrZS1tb2Qtc2NyaXB0c18xLjAuYmIgYi9tZXRh
L3JlY2lwZXMta2VybmVsL21ha2UtbW9kLXNjcmlwdHMvaHR0cDovL21ha2UtbW9kLXNjcmlwdHNf
MS4wLmJiDQppbmRleCA0NjBlMDVhNDQ1Li5lNjcxOWFmMTVhIDEwMDY0NA0KLS0tIGEvbWV0YS9y
ZWNpcGVzLWtlcm5lbC9tYWtlLW1vZC1zY3JpcHRzL2h0dHA6Ly9tYWtlLW1vZC1zY3JpcHRzXzEu
MC5iYg0KKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9tYWtlLW1vZC1zY3JpcHRzL2h0dHA6Ly9t
YWtlLW1vZC1zY3JpcHRzXzEuMC5iYg0KQEAgLTI1LDMgKzI1LDQgQEAgZG9fY29uZmlndXJlKCkg
ew0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAtQyAke1NUQUdJTkdfS0VSTkVMX0RJUn0g
Tz0ke1NUQUdJTkdfS0VSTkVMX0JVSUxERElSfSBzY3JpcHRzIHByZXBhcmUNCg0KwqB9DQorQUxM
T1dfRU1QVFlfJHtQTn0gPSAiMSINCi0tIA0KMi4xNy4xDQoNCg0KDQoNCgoK
