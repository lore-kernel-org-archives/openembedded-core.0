Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E46A1606B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:24:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.56,480,1539619200"; d="scan'208";a="52040792"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jan 2019 14:24:01 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id E5FFC4B7D681
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:24:01 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0415.000; Tue, 15 Jan 2019 14:24:02 +0800
From: "Lei, Maohui" <leimaohui@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core] [PATCH] Added armeb into meson.bbclass.
Thread-Index: AQHUolqZ5oHIlRdlN0ietsZC4+CAWKWv8OSA
Date: Tue, 15 Jan 2019 06:24:06 +0000
Message-ID: <1B56A49860EB2D45ADE3731B15C959FD01BF0945A0@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <20190102051749.26477-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190102051749.26477-1-hongl.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.227]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: E5FFC4B7D681.AC669
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: Re: [PATCH] Added armeb into meson.bbclass.
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
X-List-Received-Date: Tue, 15 Jan 2019 06:24:02 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGksDQoNClBsZXNzZSBtZXJnZSB0byB0aHVkIGJyYW5jaC4NCg0KDQpCZXN0
IHJlZ2FyZHMNCkxlaQ0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBIb25nLCBMaXUvjV4gl6wNCj4gU2VudDogV2VkbmVz
ZGF5LCBKYW51YXJ5IDAyLCAyMDE5IDE6MTggUE0NCj4gVG86IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IExlaSwg
TWFvaHVpL5eLIJbOjGQNCj4gU3ViamVjdDogW29lLWNvcmVdIFtQQVRDSF0g
QWRkZWQgYXJtZWIgaW50byBtZXNvbi5iYmNsYXNzLg0KPiANCj4gRnJvbTog
TGVpIE1hb2h1aSA8bGVpbWFvaHVpQGNuLmZ1aml0c3UuY29tPg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGNuLmZ1aml0
c3UuY29tPg0KPiAtLS0NCj4gIG1ldGEvY2xhc3Nlcy9tZXNvbi5iYmNsYXNz
IHwgMiArKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9tZXNvbi5iYmNsYXNz
IGIvbWV0YS9jbGFzc2VzL21lc29uLmJiY2xhc3MNCj4gaW5kZXggM2NiZGNm
MS4uYTkyMmFlNSAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jbGFzc2VzL21lc29u
LmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFzc2VzL21lc29uLmJiY2xhc3MN
Cj4gQEAgLTU0LDYgKzU0LDggQEAgZGVmIG1lc29uX2NwdV9mYW1pbHkodmFy
LCBkKToNCj4gICAgICAgICAgcmV0dXJuICdwcGMnDQo+ICAgICAgZWxpZiBh
cmNoID09ICdwb3dlcnBjNjQnOg0KPiAgICAgICAgICByZXR1cm4gJ3BwYzY0
Jw0KPiArICAgIGVsaWYgYXJjaCA9PSAnYXJtZWInOg0KPiArICAgICAgICBy
ZXR1cm4gJ2FybScNCj4gICAgICBlbGlmIGFyY2ggPT0gJ21pcHNlbCc6DQo+
ICAgICAgICAgIHJldHVybiAnbWlwcycNCj4gICAgICBlbGlmIHJlLm1hdGNo
KHIiaVszLTZdODYiLCBhcmNoKToNCj4gLS0NCj4gMi43LjQNCg0KCgo=

