Return-Path: <gshastri@juniper.net>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0140.outbound.protection.outlook.com [207.46.100.140])
	by mail.openembedded.org (Postfix) with ESMTP id 1B7FF70A8B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 11:34:16 +0000 (UTC)
Received: from BLUPR05MB691.namprd05.prod.outlook.com (10.141.206.148) by
	BLUPR05MB689.namprd05.prod.outlook.com (10.141.206.143) with Microsoft
	SMTP Server (TLS) id 15.1.36.22; Mon, 15 Dec 2014 11:00:42 +0000
Received: from BLUPR05MB691.namprd05.prod.outlook.com ([10.141.206.148]) by
	BLUPR05MB691.namprd05.prod.outlook.com ([10.141.206.148]) with mapi id
	15.01.0031.000; Mon, 15 Dec 2014 11:00:42 +0000
From: Gaurang Shastri <gshastri@juniper.net>
To: Steffen Sledz <sledz@dresearch-fe.de>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] "qemu-arm udevadm hwdb --update" eats swap space after
	build host update to openSUSE 13.2
Thread-Index: AQHQGFWKk747PEh9zEGNSSezZHj6eJyQe6cQ
Date: Mon, 15 Dec 2014 11:00:42 +0000
Message-ID: <BLUPR05MB691C5C534377936999FE84AD56F0@BLUPR05MB691.namprd05.prod.outlook.com>
References: <548EBDE0.3080704@dresearch-fe.de>
In-Reply-To: <548EBDE0.3080704@dresearch-fe.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [116.197.184.18]
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB689;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:;SRVR:BLUPR05MB689;
x-forefront-prvs: 04267075BD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(13464003)(189002)(199003)(377454003)(105586002)(120916001)(64706001)(66066001)(20776003)(99286002)(106356001)(107046002)(107886001)(2420400003)(102836002)(31966008)(106116001)(76576001)(15975445007)(1720100001)(68736005)(77096005)(97736003)(74316001)(40100003)(19580405001)(77156002)(76176999)(50986999)(122556002)(19580395003)(4396001)(62966003)(54356999)(21056001)(46102003)(99396003)(87936001)(92566001)(33656002)(86362001)(101416001)(2656002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR05MB689;
	H:BLUPR05MB691.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: juniper.net
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2014 11:00:42.2964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bea78b3c-4cdb-4130-854a-1d193232e5f4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR05MB689
Subject: Re: "qemu-arm udevadm hwdb --update" eats swap space after build host update to openSUSE 13.2
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
X-List-Received-Date: Mon, 15 Dec 2014 11:34:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciBTdGVmZmVuLA0KDQpJIGhhdmUgYWxyZWFkeSByYWlzZWQgc29tZSBzaW1pbGFyIGlzc3Vl
IHdoZXJlIGJlY2F1c2Ugb2YgdW4tYXBwcm9wcmlhdGUgdXNlIG9mICJRRU1VX09QVElPTlMiIGxl
ZCB0aGUgcG9zdCBwcm9jZXNzIG9mIHVkZXYtaHdkYiBmYWlsZWQuDQoNCkFueWhvdywgUmljaGFy
ZCBoYXMgY3JlYXRlZCBhIHBhdGNoIGFuZCB5b3UgY2FuIGdvIHRocm91Z2ggdGhlIHNhbWUgaGVy
ZSBhdDoNCmh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL3BpcGVybWFpbC9vcGVuZW1iZWRk
ZWQtY29yZS8yMDE0LURlY2VtYmVyLzA5OTU0NC5odG1sDQoNCkxldCdzIHNlZSBpZiB0aGF0IHNv
bHZlcyB5b3VyIGlzc3VlLg0KDQpSZWdhcmRzLA0KR2F1cmFuZyBTaGFzdHJpDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgW21haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBTdGVmZmVuIFNsZWR6DQpTZW50OiBNb25k
YXksIERlY2VtYmVyIDE1LCAyMDE0IDQ6MjQgUE0NClRvOiBvcGVuZW1iZWRkZWQtY29yZQ0KU3Vi
amVjdDogW09FLWNvcmVdICJxZW11LWFybSB1ZGV2YWRtIGh3ZGIgLS11cGRhdGUiIGVhdHMgc3dh
cCBzcGFjZSBhZnRlciBidWlsZCBob3N0IHVwZGF0ZSB0byBvcGVuU1VTRSAxMy4yDQoNCkFmdGVy
IHVwZGF0aW5nIG91ciBidWlsZCBob3N0IGZyb20gb3BlblNVU0UgMTMuMSB0byAxMy4yIHdlJ3Jl
IG5vIGxvbmdlciBhYmxlIHRvIGJ1aWxkIG91ciBpbWFnZXMgd2l0aCBPRSAod2l0aCAxMy4xIG9u
IHRoZSBzYW1lIGhvc3QgZXZlcnl0aGluZyB3b3JrZWQgd2VsbCkuIDooDQoNClRoZSBmaXJzdCB0
aGluZyB3ZSBvYnNlcnZlZCB3YXMgdGhhdCB0aGUgZG9fcm9vdGZzIHN0YWdlIG1hZGUgYSB2ZXJ5
IGJpZyBsb2FkIChtb3JlIHRoYW4gNTAwKSBvbiB0aGUgbWFjaGluZSBidXQgdGhlIGNwdSdzIGFy
ZW4ndCB3b3JraW5nIGZvciAxMDAlLiBJIGNvdWxkIHRyYWNrIGRvd24gdGhlIHByb2JsZW0gdG8g
dGhlIGNhbGwNCg0KcWVtdS1hcm0gLXIgMi42LjMyIC1MIC9wbS9zbGVkei9oaXBvcy1kZmUuZGl6
enkvYnVpbGQtY2xvc2VkL3RtcC1nbGliYy93b3JrL2hpa2lyay1hbmdzdHJvbS1saW51eC1nbnVl
YWJpL2h5ZHJhaXAtcHJvZGltYWdlLzEuMC1yMCtyMTYrcjE3LjUvcm9vdGZzIC1FIExEX0xJQlJB
UllfUEFUSD0vcG0vc2xlZHovaGlwb3MtZGZlLmRpenp5L2J1aWxkLWNsb3NlZC90bXAtZ2xpYmMv
d29yay9oaWtpcmstYW5nc3Ryb20tbGludXgtZ251ZWFiaS9oeWRyYWlwLXByb2RpbWFnZS8xLjAt
cjArcjE2K3IxNy41L3Jvb3Rmcy91c3IvbGliOi9wbS9zbGVkei9oaXBvcy1kZmUuZGl6enkvYnVp
bGQtY2xvc2VkL3RtcC1nbGliYy93b3JrL2hpa2lyay1hbmdzdHJvbS1saW51eC1nbnVlYWJpL2h5
ZHJhaXAtcHJvZGltYWdlLzEuMC1yMCtyMTYrcjE3LjUvcm9vdGZzL2xpYiAvcG0vc2xlZHovaGlw
b3MtZGZlLmRpenp5L2J1aWxkLWNsb3NlZC90bXAtZ2xpYmMvd29yay9oaWtpcmstYW5nc3Ryb20t
bGludXgtZ251ZWFiaS9oeWRyYWlwLXByb2RpbWFnZS8xLjAtcjArcjE2K3IxNy41L3Jvb3Rmcy9i
aW4vdWRldmFkbSBod2RiIC0tdXBkYXRlIC0tcm9vdCAvcG0vc2xlZHovaGlwb3MtZGZlLmRpenp5
L2J1aWxkLWNsb3NlZC90bXAtZ2xpYmMvd29yay9oaWtpcmstYW5nc3Ryb20tbGludXgtZ251ZWFi
aS9oeWRyYWlwLXByb2RpbWFnZS8xLjAtcjArcjE2K3IxNy41L3Jvb3Rmcw0KDQp3aGljaCBlYXRz
IHN3YXAgc3BhY2Ugd2l0aG91dCBlbmQgdGlsbCB0aGUgc3lzdGVtIGNyYXNoZXMgKG1vcmUgdGhh
biAxMDBHQiBzd2FwIHNwYWNlIGlzdCBhdmFpbGFibGUpLg0KDQpJJ3ZlIG5vIGlkZWEgaG93IHRv
IGluc3BlY3QgdGhpcyBwcm9ibGVtIGZ1cnRoZXIuIEFueSBpZGVhcz8NCg0KU3RlZmZlbg0KDQot
LQ0KRFJlc2VhcmNoIEZhaHJ6ZXVnZWxla3Ryb25payBHbWJIDQpPdHRvLVNjaG1pcmdhbC1TdHIu
IDMsIDEwMzE5IEJlcmxpbiwgR2VybWFueQ0KVGVsOiArNDkgMzAgNTE1OTMyLTIzNyBtYWlsdG86
c2xlZHpAZHJlc2VhcmNoLWZlLmRlDQpGYXg6ICs0OSAzMCA1MTU5MzItMjk5DQpHZXNjaMOkZnRz
ZsO8aHJlcjogRHIuIE1pY2hhZWwgV2ViZXIsIFdlcm5lciBNw7ZnbGU7IEFtdHNnZXJpY2h0IEJl
cmxpbiBDaGFybG90dGVuYnVyZzsgSFJCIDEzMDEyMCBCOyBVc3QuLUlETnIuIERFMjczOTUyMDU4
DQotLQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCk9w
ZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KT3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuZW1iZWRkZWQtY29yZQ0K

