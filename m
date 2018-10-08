Return-Path: <urs.fassler@bbv.ch>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0065.outbound.protection.outlook.com [104.47.2.65])
	by mail.openembedded.org (Postfix) with ESMTP id D2A2474FD0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 09:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bbvSoftwareServices.onmicrosoft.com; s=selector1-bbv-ch;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eabeWG8zeqW+o+84NoLNq4d2l8bWqC5Z1IqxEw6hIkQ=;
	b=Pl6o9iMfE/ZDpHmuhmyKfZY+uB9u5hputdEiKQmGEzByiQK5yd5qhEpJ9yKCAXpQCVnYjwrYuKtVx9A+r7awvH40MLhJY2hQKFOAFJubRav3c2ZFzcJrQtaynZ/DFAUdRbUVSUCC7SyS6lTqRBzdatTIxuFBA62H48wNq2w/lYg=
Received: from AM6PR03MB3832.eurprd03.prod.outlook.com (20.176.243.26) by
	AM6PR03MB4262.eurprd03.prod.outlook.com (20.177.32.143) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1207.27; Mon, 8 Oct 2018 09:17:47 +0000
Received: from AM6PR03MB3832.eurprd03.prod.outlook.com
	([fe80::4117:4dd2:d53a:645b]) by
	AM6PR03MB3832.eurprd03.prod.outlook.com
	([fe80::4117:4dd2:d53a:645b%4]) with mapi id 15.20.1207.024;
	Mon, 8 Oct 2018 09:17:47 +0000
From: =?utf-8?B?VXJzIEbDpHNzbGVy?= <urs.fassler@bbv.ch>
To: "bruce.ashfield@windriver.com" <bruce.ashfield@windriver.com>
Thread-Topic: [yocto] [yocto-docs][PATCH] kernel-dev: document the change
	detection of kernel feature files
Thread-Index: AQHUXuCWrszszs4bjEu0XDoHNyCYNaUVEcqA
Date: Mon, 8 Oct 2018 09:17:47 +0000
Message-ID: <2585c52cf6e9a30822d3417299c3df681e5ec7a4.camel@bbv.ch>
References: <20181001124209.12503-1-urs.fassler@bbv.ch>
	<93a276f8-7465-ffd9-9279-44aacd1c2337@windriver.com>
In-Reply-To: <93a276f8-7465-ffd9-9279-44aacd1c2337@windriver.com>
Accept-Language: de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0145.eurprd07.prod.outlook.com
	(2603:10a6:802:16::32) To AM6PR03MB3832.eurprd03.prod.outlook.com
	(2603:10a6:20b:24::26)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=urs.fassler@bbv.ch; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [178.194.183.98]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM6PR03MB4262;
	6:sppp7T5NFC8qgpeRprzJoLf+LDaTi68sviDF8bNKB4CAT7iq8WXqBhTnqmVn7pEL+rM6gxacQp8y//sdWbpseiRV66Y9CDZx72cL8XHl8p2hhJTFlqMto6cvFdmraadjmk+Yj2OE3Cef3LaVgPetvKW8O0B4CAwX4wskGdrBRBslbrwbTFpvj1195lNSBqQggnZMt/r9Eu390f7P8OHtsaPNqMgBpfXRhoPINmYQuelOLJTxnGZ/6vCTMQfqb+9s8Ds09risv8W9SyzUwHV48HD8OIxe3J3bFiFKeRa7fKNnLmxTTMYYyRPZTQwAxMK2hAE6WHyzO82IDqOmbgZsNC8UuuxVMXFwvv23EtVlLNTTBa1vZdgJQmwgnpk9y8cDbHdJdCOtw9+Cw4pZS9ypeTyxhy1UoFWhhg/wR0uenSOdlVHwNG0WEW0w+DLypP7b/UvJS1jR+eXJbn/hTRSfBg==;
	5:rNInz8OcLruRHPSekk/3KvcMRVtN8BoWtk4b1jBvCql7F+8lY7UJSlIoF/90Fh16fzIHDeaccRvZYxs2MOMk3bf7BYGh9vRTC4HGUnQsaPgxtW+iEPpp6OiUHEs4TnrN30vEXxpL4yuhccJ+KGugUQbx2UDK+HjmtZT7AwDUuzI=;
	7:Qm7M4zgQxc3WjgzCbay4YeJpMyMCMjVVU+YjOMFn4ksgquRmWSIsjfrUKl94awPp1shWT/Y2+4eWFgklG2ybVoo+qnX33G2IelCqSAZotz9PieHXtrMKgyhmgB7kmjO/QYjFYez/0mv/F3XeU6pbNULzcdIH61xZCUBLUXI5UBjuerg7OQnlvyQ+MbtUl04avTqNU0XV3rCWc+gqESBEmUd5d896ae/bfB/I10xPO2W1d6gVvE8erNKt/mz6TicL
x-ms-office365-filtering-correlation-id: babfd631-1df0-409c-304c-08d62cfee945
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR03MB4262; 
x-ms-traffictypediagnostic: AM6PR03MB4262:
x-microsoft-antispam-prvs: <AM6PR03MB4262D8029E59ECC1D486F0008FE60@AM6PR03MB4262.eurprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(181554191321653)(126837547833334)(33711482430040);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(3231355)(944501410)(52105095)(10201501046)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(201708071742011)(7699051);
	SRVR:AM6PR03MB4262; BCL:0; PCL:0; RULEID:; SRVR:AM6PR03MB4262; 
x-forefront-prvs: 081904387B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39840400004)(396003)(136003)(376002)(366004)(346002)(199004)(189003)(99286004)(76176011)(102836004)(52116002)(478600001)(14454004)(2906002)(8676002)(54906003)(68736007)(81166006)(2351001)(66066001)(105586002)(81156014)(6916009)(2900100001)(966005)(97736004)(106356001)(345774005)(85202003)(118296001)(5660300001)(8936002)(2501003)(71190400001)(53936002)(25786009)(5640700003)(6116002)(6306002)(6512007)(3846002)(6246003)(305945005)(71200400001)(7736002)(74482002)(36756003)(4326008)(6486002)(6436002)(186003)(53546011)(229853002)(26005)(6506007)(486006)(316002)(256004)(86362001)(11346002)(85182001)(386003)(446003)(2616005)(14444005)(5250100002)(476003)(33896004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB4262;
	H:AM6PR03MB3832.eurprd03.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bbv.ch does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: L0BhLF2trgZmiYQccs8POzoRB7vdCQMtXkriUhnQ6s0RKt4OBl8BoSznPpDfsGTufn93FvX+gCHNB4SpX9HZgGMDnAMcacVpM6tVfdiXrgle5td404MUZw/F5eCafp40RG5nqWK4hdZxbqdgyKmqUJJZHxOLUKixXDv7dHtGeoU4DpynxV220ZsFYVKMqXtWPccj6PQ7XuQyCiFej20HCgjbEC9Isiwf/hfRzdAPjN9J5SiARfiUYi1aphtVJqKo04/0QUXT2DMAPHXkPUziVwKqg5y1u381H+JgV/0ENkYN7600eDhbZSmNLv3Oa0ndyWMtaFHqHKOYBC5uQ8djEZdg8p2aVLYhf8V86cGqjV8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: bbv.ch
X-MS-Exchange-CrossTenant-Network-Message-Id: babfd631-1df0-409c-304c-08d62cfee945
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2018 09:17:47.0297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 279985bd-2077-4d9d-9797-42238cfc06e2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4262
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [yocto-docs][PATCH] kernel-dev: document the change detection of kernel feature files
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
X-List-Received-Date: Mon, 08 Oct 2018 09:17:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1A352B563E23643BDBBEEF649BD6D36@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE4LTEwLTAyIGF0IDEwOjQ0IC0wNDAwLCBicnVjZS5hc2hmaWVsZGEgd3JvdGU6
DQo+IE9uIDIwMTgtMTAtMDEgODo0MiBBTSwgVXJzIEY/c3NsZXIgd3JvdGU6DQo+ID4gUmVjb21t
ZW5kIHRvIGFkZCByZWNpcGUtc3BhY2UgZmVhdHVyZXMgdG8gU1JDX1VSSSBzbyB0aGF0IGNoYW5n
ZXMNCj4gPiB0byB0aGVtDQo+ID4gYXJlIGRldGVjdGVkIGF1dG9tYXRpY2FsbHkuDQo+ID4gDQo+
ID4gU2lnbmVkLW9mZi1ieTogVXJzIEY/c3NsZXIgPHVycy5mYXNzbGVyIGF0IGJidi5jaD4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBQYXNjYWwgQmFjaCA8cGFzY2FsLmJhY2ggYXQgc2llbWVucy5jb20+
DQo+ID4gLS0tDQo+ID4gICBkb2N1bWVudGF0aW9uL2tlcm5lbC1kZXYva2VybmVsLWRldi1jb21t
b24ueG1sIHwgNyArKysrKy0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kb2N1bWVudGF0aW9uL2tl
cm5lbC1kZXYva2VybmVsLWRldi1jb21tb24ueG1sDQo+ID4gYi9kb2N1bWVudGF0aW9uL2tlcm5l
bC1kZXYva2VybmVsLWRldi1jb21tb24ueG1sDQo+ID4gaW5kZXggODNiMDJiMWMxLi42Mjg5Y2U4
ZDQgMTAwNjQ0DQo+ID4gLS0tIGEvZG9jdW1lbnRhdGlvbi9rZXJuZWwtZGV2L2tlcm5lbC1kZXYt
Y29tbW9uLnhtbA0KPiA+ICsrKyBiL2RvY3VtZW50YXRpb24va2VybmVsLWRldi9rZXJuZWwtZGV2
LWNvbW1vbi54bWwNCj4gPiBAQCAtMjYyMyw2ICsyNjIzLDkgQEANCj4gPiAgICAgICAgICAgICAg
IDxmaWxlbmFtZT4uc2NjPC9maWxlbmFtZT4gZmlsZSBpbiB0aGUNCj4gPiAgICAgICAgICAgICAg
IDxmaWxlbmFtZT5TUkNfVVJJPC9maWxlbmFtZT4gc3RhdGVtZW50IHRvIHJlZmVyZW5jZQ0KPiA+
IG11bHRpcGxlIGtlcm5lbA0KPiA+ICAgICAgICAgICAgICAgZmVhdHVyZXMuDQo+ID4gKyAgICAg
ICAgICAgIFNpbmNlIEJpdEJha2Ugb25seSBkZXRlY3RzIGNoYW5nZXMgb24gZmlsZXMgbGlzdGVk
IGluDQo+ID4gKyAgICAgICAgICAgIDxmaWxlbmFtZT5TUkNfVVJJPC9maWxlbmFtZT4sIGl0IGlz
IGJlc3QgdG8gYWRkIGFsbA0KPiANCj4gVGhpcyBpcyBub3QgbmVjZXNzYXJpbHkgdHJ1ZS4gSXQg
d291bGQgYmUgYmV0dGVyIHN0YXRlZCB0aGF0IGlmIHlvdQ0KPiBhcmUgbW9kaWZ5aW5nIHRoZSAu
Y2ZnIGZpbGVzIGluIHRoZSBsYXllciBkaXJlY3RseSwgeW91IHNob3VsZCBsaXN0DQo+IHRoZW0g
b24gdGhlIFNSQ19VUkkgdG8gaGF2ZSB0aGUgY2hhbmdlcyBwaWNrZWQgdXAgYnkgYml0YmFrZS4N
Cj4gDQo+IEl0IGlzIG5vdCBhIG1hdHRlciBvZiAiYmVzdCIsIHNvIGl0IHNob3VsZCBiZSBzdGF0
ZWQgdGhhdCB3YXkuDQoNClRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrLiBJIGFtIG5vdCBzdXJl
IGlmIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUNCnByb2JsZW0gb3IgeW91ciBhbnN3ZXIgY29ycmVj
dGx5Lg0KDQpXZSBmYWNlZCB0aGUgcHJvYmxlbSwgdGhhdCBvdXIgQ0kgc2VydmVyIGRpZCBub3Qg
cGlja2VkIHVwIHRoZSBjaGFuZ2VzDQptYWRlIGluIHRoZSAuY2ZnIGZpbGVzLiBJIGludmVzdGln
YXRlZCB0aGUgcHJvYmxlbSBhbmQgZm91bmQgdGhhdA0KQml0QmFrZSBvbmx5IGRldGVjdHMgY2hh
bmdlcyBvbiBmaWxlcyBsaXN0ZWQgaW4gU1JDX1VSSS4gVGhpcyBpcw0Kc3VwcG9ydGVkIGluIHRo
ZSBjaGFwdGVyICJXb3JraW5nIHdpdGggQWR2YW5jZWQgTWV0YWRhdGEiIHRoYXQgc3RhdGVzOg0K
DQoiQml0QmFrZSBwYXJzZXMgW3RoZSAuc2NjIGZpbGVzXSBhbmQgZmV0Y2hlcyBhbnkgZmlsZXMg
cmVmZXJlbmNlZCBpbg0KdGhlIC5zY2MgZmlsZXMgYnkgdGhlIGluY2x1ZGUsIHBhdGNoLCBvciBr
Y29uZiBjb21tYW5kcy4gQmVjYXVzZSBvZg0KdGhpcywgaXQgaXMgbmVjZXNzYXJ5IHRvIGJ1bXAg
dGhlIHJlY2lwZSBQUiB2YWx1ZSB3aGVuIGNoYW5naW5nIHRoZQ0KY29udGVudCBvZiBmaWxlcyBu
b3QgZXhwbGljaXRseSBsaXN0ZWQgaW4gdGhlIFNSQ19VUkkuIg0KaHR0cHM6Ly93d3cueW9jdG9w
cm9qZWN0Lm9yZy9kb2NzL2xhdGVzdC9tZWdhLW1hbnVhbC9tZWdhLW1hbnVhbC5odG1sI3JlY2lw
ZS1zcGFjZS1tZXRhZGF0YQ0KDQpUaGUgYmVoYXZpb3IgaXMgaW1obyBub3Qgd2hhdCB5b3UgZXhw
ZWN0LiBCdXQgZml4aW5nIHRoaXMgaXMgcXVpdGUgYQ0KYmlnIGNoYW5nZSBzaW5jZSBpdCBpbnZv
bHZlcyBjaGFuZ2VzIGluIHRoZSBpbnRlcmFjdGlvbiBvZiBCaXRCYWtlDQooY2hhbmdlIGRldGVj
dGlvbiBvbiBmaWxlcykgd2l0aCBZb2N0byBjbGFzc2VzIChyZWN1cnNpdmUgcGFyc2luZyBvZg0K
c2NjIGZpbGVzKS4gVGhlcmVmb3JlIEkgdHJ5IHRvIHNvbHZlIGl0IHdpdGggYSBiZXR0ZXIgZGVz
Y3JpcHRpb24uDQoNCllvdSBzdGF0ZWQgdGhhdCBpdCBpcyBvbmx5IG5lY2Vzc2FyeSB0byBhZGQg
dGhlIC5jZmcgZmlsZXMgd2hlbiB5b3UNCmNoYW5nZSB0aGUgLmNmZyBmaWxlcyBpbiB0aGUgbGF5
ZXIgZGlyZWN0bHkuIEkgZG9uJ3Qgc2VlIGhvdyB5b3Ugd291bGQNCmNoYW5nZSB0aGUgLmNmZyBm
aWxlcyBvdGhlcndpc2Ugb3Igd2hhdCB1c2UgY2FzZSB5b3UgaGF2ZSBpbiBtaW5kLg0KDQo+ID4g
QCsgICAgICAgICAgICA8ZmlsZW5hbWU+LmNmZzwvZmlsZW5hbWU+IHRvDQo+ID4gPGZpbGVuYW1l
PlNSQ19VUkk8L2ZpbGVuYW1lPi4NCj4gPiAgICAgICAgICAgPC9wYXJhPg0KPiA+ICAgDQo+ID4g
ICAgICAgICAgIDxwYXJhPg0KPiA+IEBAIC0yNjc0LDEwICsyNjc3LDEwIEBADQo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIDwvcGFyYT48L2xpc3RpdGVtPg0KPiA+ICAgICAgICAgICAgICAgICAg
IDxsaXN0aXRlbT48cGFyYT4NCj4gPiAgICAgICAgICAgICAgICAgICAgICAgPGVtcGhhc2lzPkFk
ZCB0aGUgRmVhdHVyZSBGaWxlIHRvDQo+ID4gPGZpbGVuYW1lPlNSQ19VUkk8L2ZpbGVuYW1lPjo8
L2VtcGhhc2lzPg0KPiA+IC0gICAgICAgICAgICAgICAgICAgIEFkZCB0aGUgPGZpbGVuYW1lPi5z
Y2M8L2ZpbGVuYW1lPiBmaWxlIHRvIHRoZQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgIEFkZCB0
aGUgPGZpbGVuYW1lPi5jZmc8L2ZpbGVuYW1lPiBhbmQNCj4gPiA8ZmlsZW5hbWU+LnNjYzwvZmls
ZW5hbWU+IGZpbGUgdG8gdGhlDQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJlY2lwZSdzIDxm
aWxlbmFtZT5TUkNfVVJJPC9maWxlbmFtZT4NCj4gPiBzdGF0ZW1lbnQ6DQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIDxsaXRlcmFsbGF5b3V0IGNsYXNzPSdtb25vc3BhY2VkJz4NCj4gPiAtICAg
ICBTUkNfVVJJX2FwcGVuZCA9ICIgZmlsZTovL3Rlc3Quc2NjIg0KPiA+ICsgICAgIFNSQ19VUklf
YXBwZW5kID0gIiBmaWxlOi8vdGVzdC5jZmcgZmlsZTovL3Rlc3Quc2NjIg0KPiANCj4gVGhpcyBp
cyB3cm9uZy4gWW91IHNob3VsZCBub3QgaGF2ZSBib3RoIG9uIHRoZSBTUkNfVVJJDQoNCkkgY29u
Y2x1ZGVkIHRoaXMgYWxzbyBmcm9tIHRoZSBkZXNjcmlwdGlvbiBpbiB0aGUgIldvcmtpbmcgd2l0
aA0KQWR2YW5jZWQgTWV0YWRhdGEiIGNoYXB0ZXIgKHNlZSBhYm92ZSkuIEJ1dCBJIHdvdWxkIGJl
IGhhcHB5IHRvIGtub3cNCmFib3V0IGFub3RoZXIgc29sdXRpb24gZm9yIG91ciBwcm9ibGVtLg0K
DQpVcnMNCg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICA8L2xpdGVyYWxsYXlvdXQ+DQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIFRoZSBsZWFkaW5nIHNwYWNlIGJlZm9yZSB0aGUgcGF0aCBp
cw0KPiA+IGltcG9ydGFudCBhcyB0aGUNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgcGF0aCBp
cyBhcHBlbmRlZCB0byB0aGUgZXhpc3RpbmcgcGF0aC4NCg0KDQoNCg==

