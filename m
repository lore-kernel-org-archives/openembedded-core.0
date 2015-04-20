Return-Path: <bevenson@melinkcorp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0119.outbound.protection.outlook.com [207.46.100.119])
	by mail.openembedded.org (Postfix) with ESMTP id CEAE67390D
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 15:27:40 +0000 (UTC)
Received: from BN3PR0501MB1089.namprd05.prod.outlook.com (0.160.113.11) by
	BN3PR0501MB1266.namprd05.prod.outlook.com (0.160.183.145) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Mon, 20 Apr 2015 15:27:40 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (0.160.113.12) by
	BN3PR0501MB1089.namprd05.prod.outlook.com (0.160.113.11) with Microsoft
	SMTP Server (TLS) id 15.1.136.25; Mon, 20 Apr 2015 15:27:39 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([0.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([0.160.113.12]) with mapi id
	15.01.0136.026; Mon, 20 Apr 2015 15:27:39 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 2/2] util-linux: Add lastb to alternatives
Thread-Index: AQHQe3xfDLMPV3SGbk+OPiXDBeYc5J1WBExw
Date: Mon, 20 Apr 2015 15:27:39 +0000
Message-ID: <BN3PR0501MB1090333A271A93E3F0875BCEBBE00@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <1429542458-4291-1-git-send-email-bevenson@melinkcorp.com>
	<1429542458-4291-3-git-send-email-bevenson@melinkcorp.com>
	<1429542712.26983.12.camel@linuxfoundation.org>
In-Reply-To: <1429542712.26983.12.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 00C700BF009A6000C7020C
authentication-results: linuxfoundation.org; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1089;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1266; 
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(377424004)(51704005)(377454003)(24454002)(13464003)(50986999)(2950100001)(122556002)(40100003)(92566002)(19580395003)(46102003)(54356999)(76176999)(19580405001)(110136001)(86362001)(102836002)(99286002)(74316001)(2656002)(87936001)(106116001)(76576001)(2900100001)(66066001)(77156002)(33656002)(62966003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1089;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BN3PR0501MB10891EDC9441A92B251462F7BBE00@BN3PR0501MB1089.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN3PR0501MB1089; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1089; 
x-forefront-prvs: 05529C6FDB
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2015 15:27:39.7255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1089
X-OriginatorOrg: melinkcorp.com
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] util-linux: Add lastb to alternatives
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
X-List-Received-Date: Mon, 20 Apr 2015 15:27:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmljaGFyZCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJk
IFB1cmRpZSBbbWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+IFNl
bnQ6IE1vbmRheSwgQXByaWwgMjAsIDIwMTUgMTE6MTIgQU0NCj4gVG86IEJyeWFuIEV2ZW5zb24N
Cj4gQ2M6IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMi8yXSB1dGlsLWxpbnV4OiBBZGQgbGFzdGIgdG8gYWx0
ZXJuYXRpdmVzDQo+IA0KPiBPbiBNb24sIDIwMTUtMDQtMjAgYXQgMTE6MDcgLTA0MDAsIEJyeWFu
IEV2ZW5zb24gd3JvdGU6DQo+ID4gdXRpbC1saW51eCBjcmVhdGVzIGxhc3RiIGFzIGEgc3ltbGlu
ayB0byBsYXN0IGR1cmluZyB0aGUgYnVpbGQuDQo+ID4gSnVzdCBhcyBvdGhlciBhcHBsaWNhdGlv
bnMgbWF5IHByb3ZpZGUgbGFzdCwgb3RoZXIgYXBwbGljYXRpb25zIG1heQ0KPiA+IHByb3ZpZGUg
bGFzdGIuDQo+ID4NCj4gPiBBZGQgYWx0ZXJuYXRpdmVzIGRlc2lnbmF0aW9ucyBmb3IgbGFzdGIg
dG8gYXZvaWQgaW5zdGFsbGF0aW9uDQo+ID4gY29uZmxpY3RzIHdpdGggb3RoZXIgYXBwbGljYXRp
b25zLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQnJ5YW4gRXZlbnNvbiA8YmV2ZW5zb25AbWVs
aW5rY29ycC5jb20+DQo+ID4gLS0tDQo+ID4gIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC5pbmMgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gRG9lc24ndCBhcHBlYXIgdG8gYXBwbHkgYWdhaW5zdCBt
YXN0ZXI/DQo+IA0KDQpTb3JyeSwgdGhlcmUgYSBmZXcgcmVjZW50IGNvbW1pdHMgdG8gdXRpbC1s
aW51eCBvbiBtYXN0ZXIgdGhhdCBJIGhhZCBtaXNzZWQuDQoNCk9uZSBvZiB0aGUgY29tbWl0cyBp
cyBkb2luZyBzb21ldGhpbmcgc2ltaWxhciBmb3IgbGFzdGIsIGJ1dCBvbmx5IGZvciB0aGUgbWFu
IHBhZ2UgYW5kIG5vdCBmb3IgdGhlIGV4ZWN1dGFibGUuICBJJ2xsIGNoZWNrIHdpdGggdGhvc2Ug
aW52b2x2ZWQgd2l0aCB0aGUgbGFzdCBmZXcgdXRpbC1saW51eCBjb21taXRzIHRvIHNlZSBpZiB0
aGV5IGFscmVhZHkgaGF2ZSBhIGNvbW1pdCBpbiB0aGUgd29ya3MgdGhhdCBpbmNsdWRlcyB0aGUg
c2FtZSBjaGFuZ2VzIGFzIG1pbmUuDQoNClJlZ2FyZHMsDQpCcnlhbg0KDQo+IENoZWVycywNCj4g
DQo+IFJpY2hhcmQNCg0K

