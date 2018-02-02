Return-Path: <alejandr@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0080.outbound.protection.outlook.com
	[104.47.37.80])
	by mail.openembedded.org (Postfix) with ESMTP id D093B7835C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 19:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=gHc2yiV4aw5FXaCXp2JHq3xcCXgn7Xuz3kriJ1Xp4kw=;
	b=Wd9jX4Iia/0MKz7ZsgpeyDvQdMoTtQ/BLDWEfVC7GLb7BQX7Xt7fcLv3DwHlSURuovUHKAG2F8xuxdrrXlQt9v/4F6UkSqSap4JwM/DLniQy2oJIkJ4YPIzMidJ5kFq6QjpdRUNcd4Qv1Vy9wTzGr8oQyETyigQUc0vyJb6Qy1Q=
Received: from MWHPR0201MB3401.namprd02.prod.outlook.com (10.167.161.138) by
	MWHPR0201MB3610.namprd02.prod.outlook.com (10.167.162.35) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.464.11; Fri, 2 Feb 2018 19:06:39 +0000
Received: from MWHPR0201MB3401.namprd02.prod.outlook.com
	([fe80::4c59:559a:af68:232e]) by
	MWHPR0201MB3401.namprd02.prod.outlook.com
	([fe80::4c59:559a:af68:232e%13]) with mapi id 15.20.0464.012;
	Fri, 2 Feb 2018 19:06:39 +0000
From: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?utf-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgbmluamE6IFVwZ3JhZGUgZnJv?=
	=?utf-8?Q?m_1.7.2_to_major_release_1.8.2_(rev2)?=
Thread-Index: AQHTm6yesitYC3UMV0yEiDl/soPvzaORemQw
Date: Fri, 2 Feb 2018 19:06:39 +0000
Message-ID: <MWHPR0201MB3401497FB2219F33ADADA13FACF90@MWHPR0201MB3401.namprd02.prod.outlook.com>
References: <1517523029-19272-1-git-send-email-alejandr@xilinx.com>
	<20180201223257.15539.41169@do.openembedded.org>
In-Reply-To: <20180201223257.15539.41169@do.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alejandr@xilinx.com; 
x-originating-ip: [108.65.76.171]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR0201MB3610;
	7:9OhwPvM0xRyR+jpLlxGS4d4QahTLPCApteSJo7nB6Gj1qM1jtt+9vv6fJR1JgnrMXQnb6XL+pQC7x12LPuTp2i5VCVNp0B8V1WEBq+7mpSORL2rhgT3ZLG5lhVwfrDOkxaCOHVODEr1JCCnpwKHBg9v/4Xn+IIGilIJo4tEnfSovi7IOLF7SQPKZuSHTeY1R95GWkaY5Yt86v+HV6yHlZH04WgZ+8LwvH6qoQGsU5mh3YUJo3gr6QwQ5VZ+cRJbY
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 046ef8cb-cc23-4557-7410-08d56a7016fe
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:MWHPR0201MB3610; 
x-ms-traffictypediagnostic: MWHPR0201MB3610:
x-microsoft-antispam-prvs: <MWHPR0201MB3610CAE6143F80AD4395AF5EACF90@MWHPR0201MB3610.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231101)(2400082)(944501161)(93006095)(93001095)(6055026)(6041288)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:MWHPR0201MB3610; BCL:0; PCL:0; RULEID:;
	SRVR:MWHPR0201MB3610; 
x-forefront-prvs: 05715BE7FD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(366004)(39860400002)(39380400002)(396003)(13464003)(28163001)(199004)(189003)(50464003)(2950100002)(99286004)(6916009)(66066001)(53936002)(3846002)(26005)(59450400001)(7696005)(5660300001)(97736004)(6306002)(5640700003)(55016002)(105586002)(25786009)(6436002)(6116002)(106356001)(2351001)(33656002)(229853002)(2906002)(966005)(14454004)(186003)(8936002)(9686003)(81166006)(81156014)(76176011)(478600001)(3660700001)(345774005)(5250100002)(3280700002)(305945005)(6246003)(74316002)(53546011)(2501003)(2900100001)(7736002)(86362001)(102836004)(68736007)(6506007)(316002)(562404015);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0201MB3610;
	H:MWHPR0201MB3401.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: /HR7aYcmr/Gnpftat9D5/HxwAJXT/y/lyArdI0t5UUsL9yHJtCXW11S4SBW1ywUiIRM5A8qDYqntUfE+wPLxrw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046ef8cb-cc23-4557-7410-08d56a7016fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2018 19:06:39.6667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3610
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG5pbmphOiBVcGdyYWRlIGZyb20gMS43LjIgdG8gbWFqb3IgcmVsZWFzZSAxLjguMiAocmV2Mik=?=
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
X-List-Received-Date: Fri, 02 Feb 2018 19:06:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBtYWtlcyBubyBzZW5zZSB0byBtZSwgSSByZWJhc2VkIHRvIG1hc3RlciBqdXN0IGJlZm9y
ZSBzZW5kaW5nIGl0Lg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUGF0Y2h3
b3JrIFttYWlsdG86cGF0Y2h3b3JrQHBhdGNod29yay5vcGVuZW1iZWRkZWQub3JnXSANClNlbnQ6
IFRodXJzZGF5LCBGZWJydWFyeSAxLCAyMDE4IDI6MzMgUE0NClRvOiBBbGVqYW5kcm8gRW5lZGlu
byBIZXJuYW5kZXogU2FtYW5pZWdvIDxhbGVqYW5kckB4aWxpbnguY29tPg0KQ2M6IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IOKclyBwYXRjaHRlc3Q6
IGZhaWx1cmUgZm9yIG5pbmphOiBVcGdyYWRlIGZyb20gMS43LjIgdG8gbWFqb3IgcmVsZWFzZSAx
LjguMiAocmV2MikNCg0KPT0gU2VyaWVzIERldGFpbHMgPT0NCg0KU2VyaWVzOiBuaW5qYTogVXBn
cmFkZSBmcm9tIDEuNy4yIHRvIG1ham9yIHJlbGVhc2UgMS44LjIgKHJldjIpDQpSZXZpc2lvbjog
Mg0KVVJMICAgOiBodHRwczovL3BhdGNod29yay5vcGVuZW1iZWRkZWQub3JnL3Nlcmllcy8xMDc4
MC8NClN0YXRlIDogZmFpbHVyZQ0KDQo9PSBTdW1tYXJ5ID09DQoNCg0KVGhhbmsgeW91IGZvciBz
dWJtaXR0aW5nIHRoaXMgcGF0Y2ggc2VyaWVzIHRvIE9wZW5FbWJlZGRlZCBDb3JlLiBUaGlzIGlz
IGFuIGF1dG9tYXRlZCByZXNwb25zZS4gU2V2ZXJhbCB0ZXN0cyBoYXZlIGJlZW4gZXhlY3V0ZWQg
b24gdGhlIHByb3Bvc2VkIHNlcmllcyBieSBwYXRjaHRlc3QgcmVzdWx0aW5nIGluIHRoZSBmb2xs
b3dpbmcgZmFpbHVyZXM6DQoNCg0KDQoqIElzc3VlICAgICAgICAgICAgIFNlcmllcyBkb2VzIG5v
dCBhcHBseSBvbiB0b3Agb2YgdGFyZ2V0IGJyYW5jaCBbdGVzdF9zZXJpZXNfbWVyZ2Vfb25faGVh
ZF0gDQogIFN1Z2dlc3RlZCBmaXggICAgUmViYXNlIHlvdXIgc2VyaWVzIG9uIHRvcCBvZiB0YXJn
ZXRlZCBicmFuY2gNCiAgVGFyZ2V0ZWQgYnJhbmNoICBtYXN0ZXIgKGN1cnJlbnRseSBhdCBhMDk4
OGMzMzc0KQ0KDQoNCg0KSWYgeW91IGJlbGlldmUgYW55IG9mIHRoZXNlIHRlc3QgcmVzdWx0cyBh
cmUgaW5jb3JyZWN0LCBwbGVhc2UgcmVwbHkgdG8gdGhlIG1haWxpbmcgbGlzdCAob3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZykgcmFpc2luZyB5b3VyIGNvbmNlcm5zLg0K
T3RoZXJ3aXNlIHdlIHdvdWxkIGFwcHJlY2lhdGUgeW91IGNvcnJlY3RpbmcgdGhlIGlzc3VlcyBh
bmQgc3VibWl0dGluZyBhIG5ldyB2ZXJzaW9uIG9mIHRoZSBwYXRjaHNldCBpZiBhcHBsaWNhYmxl
LiBQbGVhc2UgZW5zdXJlIHlvdSBhZGQvaW5jcmVtZW50IHRoZSB2ZXJzaW9uIG51bWJlciB3aGVu
IHNlbmRpbmcgdGhlIG5ldyB2ZXJzaW9uIChpLmUuIFtQQVRDSF0gLT4gW1BBVENIIHYyXSAtPiBb
UEFUQ0ggdjNdIC0+IC4uLikuDQoNCi0tLQ0KR3VpZGVsaW5lczogICAgIGh0dHBzOi8vd3d3Lm9w
ZW5lbWJlZGRlZC5vcmcvd2lraS9Db21taXRfUGF0Y2hfTWVzc2FnZV9HdWlkZWxpbmVzDQpUZXN0
IGZyYW1ld29yazogaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kvcGF0
Y2h0ZXN0DQpUZXN0IHN1aXRlOiAgICAgaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQv
Y2dpdC5jZ2kvcGF0Y2h0ZXN0LW9lDQoNCg==

