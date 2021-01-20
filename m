Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.23529.1611115269076249582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 20:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,359,1602518400"; 
   d="scan'208";a="103645944"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 20 Jan 2021 12:00:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2DDEA4CE6018;
	Wed, 20 Jan 2021 12:00:57 +0800 (CST)
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 20 Jan 2021 12:00:56 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::102a:9d25:2025:53fa])
 by G08CNEXMBPEKD05.g08.fujitsu.local ([fe80::102a:9d25:2025:53fa%14]) with
 mapi id 15.00.1497.010; Wed, 20 Jan 2021 12:00:56 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libdrm: upgrade 2.4.103 -> 2.4.104
Thread-Topic: [OE-core] [PATCH] libdrm: upgrade 2.4.103 -> 2.4.104
Thread-Index: AQHW6lQQHf/KaoQxdkGH+5UuAl2jBqoqVOMAgAWXcCA=
Date: Wed, 20 Jan 2021 04:00:56 +0000
Message-ID: <bf3fcde55b1740e3b95f0cf20632e900@G08CNEXMBPEKD05.g08.fujitsu.local>
References: <1610614977-24935-1-git-send-email-wangmy@cn.fujitsu.com>
 <859d5ae812f49d2300c805866001715329d2b851.camel@linuxfoundation.org>
In-Reply-To: <859d5ae812f49d2300c805866001715329d2b851.camel@linuxfoundation.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.225.33]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 2DDEA4CE6018.AACF1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksIFJpY2hhcmQNCg0KQ2FuIHlvdSB0ZWxsIG1lIHdoZXJlIGFuZCB3aGF0
IHNldHRpbmdzIGRvIEkgbmVlZCB0byBhZGQgdG8gbWFrZSBkb2NzIGVuYWJs
ZWQ/DQoNClRoYW5rIHlvde+8gQ0KDQpCZXN0IHJlZ2FyZHMNCldhbmdteQ0K
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJpY2hh
cmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3Jn
Pg0KPiBTZW50OiBTdW5kYXksIEphbnVhcnkgMTcsIDIwMjEgNjozNSBBTQ0K
PiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBjbi5mdWpp
dHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGxp
YmRybTogdXBncmFkZSAyLjQuMTAzIC0+IDIuNC4xMDQNCj4gDQo+IE9uIFRo
dSwgMjAyMS0wMS0xNCBhdCAxNzowMiArMDgwMCwgV2FuZyBNaW5neXUgd3Jv
dGU6DQo+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBj
bi5mdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiDCoC4uLi9kcm0ve2xpYmRy
bV8yLjQuMTAzLmJiID0+IGxpYmRybV8yLjQuMTA0LmJifSAgICAgICAgICAg
ICAgICB8IDINCj4gKy0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+IMKgcmVuYW1lIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy9kcm0ve2xpYmRybV8yLjQuMTAzLmJiID0+DQo+IGxp
YmRybV8yLjQuMTA0LmJifSAoOTclKQ0KPiA+DQo+IA0KPiBodHRwczovL2F1
dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJz
LzEwOC9idWlsZHMvMTI2Ni9zDQo+IHRlcHMvMTIvbG9ncy9zdGRpbw0KPiAN
Cj4gRmFpbHMgd2hlbiBkb2NzIGFyZSBlbmFibGVkLg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gUmljaGFyZA0KPiANCj4gDQo+IA0KPiANCg0KCgo=
