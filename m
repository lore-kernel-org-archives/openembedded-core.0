Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9AE607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 09:13:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7U9DC4B027050
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Aug 2016 02:13:12 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.206]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Tue, 30 Aug 2016 02:13:11 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] meta-ide-support: set noexec for tasks
Thread-Index: AQHSAppDNg5RKH8/AUifQcsslsrGZaBhN4Mg
Date: Tue, 30 Aug 2016 09:13:11 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA0131061B75@ALA-MBB.corp.ad.wrs.com>
References: <20160830080851.29283-1-jackie.huang@windriver.com>
	<1472546454.29583.14.camel@linuxfoundation.org>
In-Reply-To: <1472546454.29583.14.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.203]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-ide-support: set noexec for tasks
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
X-List-Received-Date: Tue, 30 Aug 2016 09:13:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
W21haWx0bzpyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnXQ0KPiBTZW50OiBUdWVz
ZGF5LCBBdWd1c3QgMzAsIDIwMTYgNDo0MSBQTQ0KPiBUbzogSHVhbmcsIEppZSAoSmFja2llKTsg
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtQQVRDSF0gbWV0YS1pZGUtc3VwcG9ydDogc2V0IG5vZXhlYyBmb3IgdGFza3MN
Cj4gDQo+IE9uIFR1ZSwgMjAxNi0wOC0zMCBhdCAxNjowOCArMDgwMCwgamFja2llLmh1YW5nQHdp
bmRyaXZlci5jb20gd3JvdGU6DQo+ID4gRnJvbTogSmFja2llIEh1YW5nIDxqYWNraWUuaHVhbmdA
d2luZHJpdmVyLmNvbT4NCj4gPg0KPiA+IFRoZSByZWNpcGUgaXMgdG8gZ2VuZXJhdGUgYW4gZW52
aXJvbm1lbnQgc2NyaXB0IGluDQo+ID4gZG9fcG9wdWxhdGVfaWRlX3N1cHBvcnQgZm9yIHVzaW5n
IGFuIElERSwgdGhlIHRhc2tzDQo+ID4gbGlzdGVkIGFyZSBub3QgbmVlZGVkLCBzbyBzZXQgJ25v
ZXhlYycgZm9yIHRoZW0uDQo+IA0KPiBXb3VsZCAiaW5oZXJpdCBub3BhY2thZ2UiIGhlbHAgaGVy
ZSBhbmQgc2ltcGxpZnkgdGhpcyBwYXRjaCBhIGJpdD8NCg0KQWgsIHNvcnJ5IEkgZGlkbid0IGtu
b3cgdGhlcmUgaXMgc3VjaCBhIGJiY2xhc3MuIFllcywgaXQgd29ya3MgYW5kIHNpbXBsaWZ5IHRo
ZSBwYXRjaC4NCkkgd2lsbCBzZW5kIHYyIGZvciB0aGlzLg0KDQpUaGFua3MsDQpKYWNraWUNCg0K
PiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0K

