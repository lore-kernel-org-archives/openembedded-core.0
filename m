Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 904 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Mar 2016 01:20:45 UTC
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0094.outbound.protection.outlook.com [157.56.112.94])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF73606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 01:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rOG8DXNTaz6XLDcC67Ns+FpW7E77VUK7Q1Lu1v40G38=;
	b=vJfn64iOscU89BxHi1E2qI+UMlj5HRJ9mM8GR9cvO4vNh6E6Xk1iYif0mBfoGYbKIuaXHKbKu7DhPlxGixvJ1u+GnhwebY5GOgl00e9lKeTPOLZhKrajrpaooO7Epe/7qJVwZSA+FzZuG/jRq/PZztuKpr+21MKtlc8sbSCAl/A=
Received: from AMSPR04MB309.eurprd04.prod.outlook.com (10.242.107.15) by
	DB5PR0401MB1813.eurprd04.prod.outlook.com (10.165.6.7) with Microsoft
	SMTP Server (TLS) id 15.1.447.15; Tue, 29 Mar 2016 01:05:40 +0000
Received: from AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) by
	AMSPR04MB309.eurprd04.prod.outlook.com ([10.242.107.15]) with mapi id
	15.01.0443.016; Tue, 29 Mar 2016 01:05:41 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Phil Blundell <pb@pbcl.net>, Tom Hochstein <tom.hochstein@freescale.com>, 
	Otavio Salvador <otavio.salvador@ossystems.com.br>, "Burton, Ross"
	<ross.burton@intel.com>, Prabhu Sundararaj <prabhu.sundararaj@nxp.com>
Thread-Topic: [OE-core] [PATCH v4 3/5] weston: Add XWayland support
Thread-Index: AQHRiUok1h8yiShcy0eBr3WuLWQpAJ9vhFgg
Date: Tue, 29 Mar 2016 01:05:41 +0000
Message-ID: <AMSPR04MB309BE9B488A6F365695B7BDE2870@AMSPR04MB309.eurprd04.prod.outlook.com>
References: <1459206002-30154-1-git-send-email-tom.hochstein@freescale.com>
	<1459206002-30154-3-git-send-email-tom.hochstein@freescale.com>
	<1459207953.2322.31.camel@pbcl.net>
In-Reply-To: <1459207953.2322.31.camel@pbcl.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pbcl.net; dkim=none (message not signed)
	header.d=none;pbcl.net; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.168.50]
x-ms-office365-filtering-correlation-id: 10fd1f49-beae-40b8-97cb-08d3576e3f72
x-microsoft-exchange-diagnostics: 1; DB5PR0401MB1813;
	5:3IecPHU4qkKH1c0fHB6NEkzXCG9ZsQtZ7eZJkiw0sbMKrFd3eL6wCqe+tVaTrNhUZLbEfVs8tnVTBOLHHiSQevDr9FYtQZ1kTmuyeLL/SeGurVCmBtoagII+dqJYAwJbtObjQKEg6SVdzHc4DJ48nw==;
	24:KI4k+XRC0Xuoe1yuCie6Eu5K3xJP2fjkDT2Q6g8L8+ID7dNGEFT95IJT0IyB3MumyEz5qRFcyoys1fzh2RS5FC3mvryvOrHAOXzgkh5HQ4Q=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR0401MB1813;
x-microsoft-antispam-prvs: <DB5PR0401MB1813D194C9EAE894F340CC99E2870@DB5PR0401MB1813.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001);
	SRVR:DB5PR0401MB1813; BCL:0; PCL:0; RULEID:;
	SRVR:DB5PR0401MB1813; 
x-forefront-prvs: 0896BFCE6C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(13464003)(377424004)(24454002)(377454003)(92566002)(19580395003)(19580405001)(3660700001)(54356999)(66066001)(33656002)(81166005)(50986999)(2906002)(76176999)(10400500002)(77096005)(122556002)(1096002)(586003)(87936001)(2900100001)(76576001)(86362001)(3846002)(2950100001)(5001770100001)(1220700001)(3280700002)(189998001)(5003600100002)(74316001)(5002640100001)(106116001)(5004730100002)(102836003)(5008740100001)(4326007)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR0401MB1813;
	H:AMSPR04MB309.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2016 01:05:41.0771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR0401MB1813
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 3/5] weston: Add XWayland support
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
X-List-Received-Date: Tue, 29 Mar 2016 01:20:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QSBESVNUUk9fRkVBVFVSRSBpcyB1c2VkIGZvciBpdHMgYWJpbGl0eSB0byBwcm92aWRlIGEgc2lu
Z2xlLCBzaW1wbGUgbWVjaGFuaXNtIGZvciBjb25maWd1cmluZyBYV2F5bGFuZCBzdXBwb3J0IGFj
cm9zcyBtdWx0aXBsZSByZWNpcGVzLiBIZXJlJ3MgdGhlIHNwZWNpZmljIGxpc3Qgb2YgY29uZmln
dXJhdGlvbiBjaGFuZ2VzIHRoYXQgdGhlIG5ldyBESVNUUk9fRkVBVFVSRSBlbmFibGVzOg0KDQp3
ZXN0b24taW5pdCAtIG1vZGlmaWVzIHRoZSB3ZXN0b24gc3RhcnR1cCBzY3JpcHQgc28gdGhhdCB3
ZXN0b24gaXMgcnVuIHdpdGggWFdheWxhbmQgc3VwcG9ydA0Kd2VzdG9uIC0gYWRkcyB4d2F5bGFu
ZCB0byBQQUNLQUdFQ09ORklHDQpjb3JlLWltYWdlLXdlc3RvbiAtIGFkZHMgcGFja2FnZWdyb3Vw
LWNvcmUteDExLXhzZXJ2ZXIgYW5kIHh0ZXJtIHRvIENPUkVfSU1BR0VfQkFTRV9JTlNUQUxMDQpw
YWNrYWdlZ3JvdXAtY29yZS14MTEteHNlcnZlciAtIGFkZHMgeHNlcnZlci14b3JnLXh3YXlsYW5k
IHRvIFhTRVJWRVINCg0KSXMgdGhlcmUgYSBiZXR0ZXIgd2F5IHRvIGRvIHRoaXM/DQoNClRvbQ0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUGhpbCBCbHVuZGVsbCBbbWFpbHRv
OnBiQHBiY2wubmV0XSANClNlbnQ6IE1vbmRheSwgTWFyY2ggMjgsIDIwMTYgNjozMyBQTQ0KVG86
IFRvbSBIb2Noc3RlaW4gPHRvbS5ob2Noc3RlaW5AZnJlZXNjYWxlLmNvbT4NCkNjOiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSCB2NCAzLzVdIHdlc3RvbjogQWRkIFhXYXlsYW5kIHN1cHBvcnQNCg0KT24gTW9uLCAy
MDE2LTAzLTI4IGF0IDE4OjAwIC0wNTAwLCBUb20gSG9jaHN0ZWluIHdyb3RlOg0KPiBBZGQgYSBu
ZXcgZGlzdHJvIGZlYXR1cmUgJ3h3YXlsYW5kJyB0byBlbmFibGUgWFdheWxhbmQgc3VwcG9ydC4N
Cg0KV2h5IGRvZXMgdGhpcyBuZWVkIHRvIGJlIGEgRElTVFJPX0ZFQVRVUkU/DQoNCnAuDQoNCg0K

