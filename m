Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 1066 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Feb 2015 17:50:23 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0147.outbound.protection.outlook.com [207.46.100.147])
	by mail.openembedded.org (Postfix) with ESMTP id 8AB04718DD
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 17:50:23 +0000 (UTC)
Received: from BN3PR0501MB1091.namprd05.prod.outlook.com (25.160.113.13) by
	BN3PR0501MB1169.namprd05.prod.outlook.com (25.160.113.154) with
	Microsoft
	SMTP Server (TLS) id 15.1.99.14; Fri, 27 Feb 2015 17:17:21 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) by
	BN3PR0501MB1091.namprd05.prod.outlook.com (25.160.113.13) with
	Microsoft SMTP
	Server (TLS) id 15.1.99.14; Fri, 27 Feb 2015 17:17:19 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) with
	mapi id 15.01.0099.004; Fri, 27 Feb 2015 17:17:19 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: Build error on Fedora 21: "Unsupported version of git (2.1.0)"
Thread-Index: AdBSr0Pbn4LHvR7cQFutEJRdFkGOxQ==
Date: Fri, 27 Feb 2015 17:17:18 +0000
Message-ID: <BN3PR0501MB1090B6DA7D327EEE4D86FA72BB150@BN3PR0501MB1090.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 00EC5A2500944C00EC5B72
x-originating-ip: [98.100.91.242]
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1091;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1169; 
x-microsoft-antispam-prvs: <BN3PR0501MB10914ACE24C065837CCE871DC7150@BN3PR0501MB1091.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(601004)(5005006);
	SRVR:BN3PR0501MB1091; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0501MB1091; 
x-forefront-prvs: 05009853EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(164054003)(92566002)(46102003)(74316001)(33656002)(99286002)(76576001)(102836002)(2900100001)(86362001)(54356999)(450100001)(62966003)(77156002)(66066001)(40100003)(122556002)(87936001)(2501003)(107886001)(110136001)(229853001)(2656002)(2351001)(50986999);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1091;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2015 17:17:18.7278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1091
X-OriginatorOrg: melinkcorp.com
Subject: Build error on Fedora 21: "Unsupported version of git (2.1.0)"
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
X-List-Received-Date: Fri, 27 Feb 2015 17:50:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWxsLA0KDQpJJ20gdHJhbnNpdGlvbmluZyB0byBhIG5ldyBsYXB0b3AgYW5kIEkndmUgaW5zdGFs
bGVkIEZlZG9yYSAyMSBvbiB0aGUgbmV3IG9uZS4gIEknbSB0cnlpbmcgdG8gYnVpbGQgZm9yIHRo
ZSBmaXJzdCB0aW1lIGFuZCBJJ20gcnVubmluZyBpbnRvIHNvbWUgaXNzdWVzLg0KDQpJJ20gc3Rp
bGwgb24gdGhlIGR5bGFuIGJyYW5jaC4gIEkgaGF2ZSBhbiBpbWFnZSB0aGF0IGlzIGJhc2VkIG9u
IGNvcmUtaW1hZ2UtbWluaW1hbCB3aXRoIGEgZmV3IGFkZGl0aW9uYWwgcGFja2FnZXMuICBXaGVu
IEkgYXR0ZW1wdCB0byBidWlsZCBteSBpbWFnZSwgaXQgZmFpbHMgd2hlbiBhdHRlbXB0aW5nIHRv
IHBhdGNoIHRoZSBMaW51eCBrZXJuZWwuICBUaGUgZmFpbHVyZSBtZXNzYWdlIGluIGxvZy5kb19w
YXRjaCBzYXlzOg0KDQoJVW5zdXBwb3J0ZWQgdmVyc2lvbiBvZiBnaXQgKDIuMS4wKQ0KCVtFUlJP
Ul0gdW5hYmxlIHRvIGNvbXBsZXRlIHB1c2gNCglwZW5kaW5nIHBhdGNoZXMgYXJlOg0KCVVuc3Vw
cG9ydGVkIHZlcnNpb24gb2YgZ2l0ICgyLjEuMCkNCglFUlJPUi4gY291bGQgbm90IHVwZGF0ZSBn
aXQgdHJlZQ0KCUVSUk9SLiBDb3VsZCBub3QgYXBwbHkgcGF0Y2hlcyBmb3IgYXQ5MXNhbTl4NWVr
Lg0KDQpTbyBJJ20gYXNzdW1pbmcgd2hhdCBoYXBwZW5lZCB3YXMgdGhlIGJ1aWxkIHN5c3RlbSdz
IHZlcnNpb24gb2YgR2l0IHdhcyB1c2VkIGZvciB0aGUgaW5pdGlhbCBrZXJuZWwgY2hlY2tvdXQg
YnV0IHRoZSBob3N0J3MgdmVyc2lvbiBvZiBHaXQgaXMgYmVpbmcgdXNlZCBpbiB0aGUgZG9fcGF0
Y2ggc3RlcC4gIEhvd2V2ZXIsIEkgaGF2ZW4ndCBhIGNsdWUgd2hhdCB0byBkbyBhYm91dCBpdC4g
IEFueSBpZGVhcz8NCg0KVGhhbmtzLA0KQnJ5YW4NCg==

