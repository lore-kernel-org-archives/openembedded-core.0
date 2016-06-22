Return-Path: <bartlomiej.kucharczyk@nokia.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0128.outbound.protection.outlook.com [157.56.112.128])
	by mail.openembedded.org (Postfix) with ESMTP id D0D0970100
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 10:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RJHQ9+9cPB62uMfvZ/hE++qRfFSnlteycaOW9WdOe20=;
	b=b9cx9ZyqgtJwpwl2SlqYikmbvVwcM2ePqu4KBb12QthEwVpNmmYRbpf4AaOSWMKpbrN+YonDkqrLYCH9Y23GdBfa/uzuEKUbXjpyeAbFhl5CqgW/ZEO3maosBzb4Mdaj2evHT8hZIfKr/8iIgW5f+llXaN9WV/e2SjTrLVrDuOY=
Received: from DBXPR07MB239.eurprd07.prod.outlook.com (10.141.11.18) by
	DBXPR07MB238.eurprd07.prod.outlook.com (10.141.11.15) with Microsoft
	SMTP Server (TLS) id 15.1.506.9; Wed, 22 Jun 2016 10:23:57 +0000
Received: from DBXPR07MB239.eurprd07.prod.outlook.com ([10.141.11.18]) by
	DBXPR07MB239.eurprd07.prod.outlook.com ([10.141.11.18]) with mapi id
	15.01.0506.017; Wed, 22 Jun 2016 10:23:57 +0000
From: "Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw)"
	<bartlomiej.kucharczyk@nokia.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] Adding Bash to meta-toolchain.
Thread-Index: AdHL1yAURM1ClMOIQRmp0ko80GJLvgAKbLEAABrYzRA=
Date: Wed, 22 Jun 2016 10:23:57 +0000
Message-ID: <DBXPR07MB2393693F5FA837BE8A6FD47F92C0@DBXPR07MB239.eurprd07.prod.outlook.com>
References: <DBXPR07MB2395258466152EFCDCB4ADEF92B0@DBXPR07MB239.eurprd07.prod.outlook.com>
	<CAJTo0Lb3D1Ktk4OUw_+Wa4ZHt4ncMa89-c_WaotXjJzmxs9YiQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lb3D1Ktk4OUw_+Wa4ZHt4ncMa89-c_WaotXjJzmxs9YiQ@mail.gmail.com>
Accept-Language: pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bartlomiej.kucharczyk@nokia.com; 
x-originating-ip: [131.228.2.27]
x-ms-office365-filtering-correlation-id: 29ad9a8d-05c5-4cad-61c2-08d39a8751f0
x-microsoft-exchange-diagnostics: 1; DBXPR07MB238;
	5:W6XoR86wc65TypV75jeLTFb4EKH6E4TcVyYsBYpOIeVzVEX5VkFSomW30QRY13/uwqw52xEUC/HLnk92gohXd82lPtw8qDoKyhRJyA48feUj82d0epJZCTM0dpoWnP1sgJBcALVkdN7KIGDvhlWJIw==;
	24:gpHBmWGugUGGx8HOKfJmNTvJTce0MBifkCUHpIijMx2hKjWUPDuUwplgI+to34Vj+YQqDojr4MNVWLY5zcxyz1J7F6obhbwEgCC5Aeg9J8g=;
	7:vjaGeNr7jxPRbfVDys5Gybtu/r/iei74MzfqJ8oimzMPXQW3AWLVKKSitlBsjHLF1xmCvXYS05887LG4eDwRV3d+M29YWFO/I+O0OA8/z9BhqIpqIQaFIG8xhm3QFz+dD/6iQGLSSbbfJmi6XmDJ93Mi1ugXc5LwMaT3fvU3poVoau7uCiXyAJ0BjNfDzeBu
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DBXPR07MB238;
x-microsoft-antispam-prvs: <DBXPR07MB238A3D7F0E111E942C02BEFF92C0@DBXPR07MB238.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:DBXPR07MB238; BCL:0; PCL:0; RULEID:; SRVR:DBXPR07MB238; 
x-forefront-prvs: 0981815F2F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(199003)(189002)(66066001)(6116002)(86362001)(9686002)(3846002)(3660700001)(102836003)(11100500001)(33656002)(76576001)(92566002)(586003)(3280700002)(189998001)(97736004)(5002640100001)(19580395003)(74316001)(8936002)(76176999)(106356001)(50986999)(54356999)(105586002)(10400500002)(77096005)(87936001)(7846002)(68736007)(81156014)(2900100001)(2950100001)(81166006)(2906002)(122556002)(101416001)(110136002)(4326007)(5003600100003)(7696003)(7736002)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DBXPR07MB238;
	H:DBXPR07MB239.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nokia.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2016 10:23:57.3780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBXPR07MB238
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding Bash to meta-toolchain.
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
X-List-Received-Date: Wed, 22 Jun 2016 10:24:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiBXaHkgZG8geW91IHdhbnQgdG8gaW5zdGFsbCBiYXNoIHRvIHRoZSB0b29sY2hhaW4/wqAgDQoN
ClRoZXJlIGFyZSBzZXZlcmFsIHJlYXNvbnMgZm9yIGRvaW5nIHRoYXQ6DQorIEkgd291bGQgbGlr
ZSB0byBjcmVhdGUgYW4gU0RLIHdpdGggZXZlcnkgdG9vbCB0aGF0IGlzIG5lZWRlZCBmb3IgdGhl
IGNvbXBpbGF0aW9uOyANCiAgICArIHRvIG1ha2UgU0RLIGFzIG11Y2ggaG9zdCB0b29scyBpbmRl
cGVuZGVudCBhcyBwb3NzaWJsZTsNCiAgICArIHRvIG1ha2UgYnVpbGRzIHRoYXQgdXNlIFNESyBt
dWNoIG1vcmUgZGV0ZXJtaW5pc3RpYyAod2hlbiB1c2luZyBkaWZmZXJlbnQgYnVpbGQgaG9zdHMp
Ow0KKyBJIHdvdWxkIGxpa2UgdG8gc3VwcG9ydCBSSEVMNSAoc3RpbGwpLCB3aGVyZSBiYXNoIDMg
aXMgZGVmYXVsdDsNCisgYW5kLCBmaW5hbGx5LCBiZWNhdXNlIEkgY2FuIChiYXNoLmJiIHJlY2lw
ZSBhbGxvd3MgbWUgdG8gZG8gdGhhdCk7DQoNCkkgY291bGQgYXNrOiBXaHkgbmF0aXZlc2RrLWJh
c2ggaXMgZm9yPyBJdCBkb2VzIG5vdCB3b3JrLg0KDQpCYXJ0ZWsNCg==

