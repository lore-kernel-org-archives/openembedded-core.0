Return-Path: <sunny.wang1@flex.com>
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
	[185.132.180.100])
	by mail.openembedded.org (Postfix) with ESMTP id A75807D920
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 08:03:41 +0000 (UTC)
Received: from pps.filterd (m0132504.ppops.net [127.0.0.1])
	by mx07-002d6701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x3C7prrp023708; Fri, 12 Apr 2019 08:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
	h=from : to : cc :
	subject : date : message-id : references : in-reply-to :
	content-transfer-encoding : mime-version : content-type; s=dkim;
	bh=jio0CS88j6z8y0J/MIM4nNmeJQwBIyEJ2SzFLX1zd4o=;
	b=bkq/YeVeAQN2SFC37OGg8WcecfMte53eP08bn7cZbjuNL7iWJuJNwYGDYtEVXNI8H3bk
	0YkfGlf9JKJPj30kE8DDxTa18115W0qWW0FtRuwJbvETXqjzT7tHj2x8DS8blcpNEMQE
	yzVI6ND3Ih/Gv0nu4PzCkx570jzAbak7sXzn75/K+ZceKcITaBS4NKhN9G3ZizBjFbSv
	oTgpAKZtvg7NrVkzdMSnmDYgHGOvKMH4G4TmNHlMyK5b1lRDpS8tJyySxomOhA+BuZ1O
	qRaGexEykfhgLcDLDSw4amFEQtCStvjFmuPKcgh9UfmO2phJzwkdmlO2vmnRMbrZR56z
	BQ== 
Received: from nam01-bn3-obe.outbound.protection.outlook.com
	(mail-bn3nam01lp2055.outbound.protection.outlook.com [104.47.33.55])
	by mx07-002d6701.pphosted.com with ESMTP id 2rtnrh0gd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2019 08:03:40 +0000
Received: from DM6PR08CA0008.namprd08.prod.outlook.com (2603:10b6:5:80::21) by
	BYAPR08MB4887.namprd08.prod.outlook.com (2603:10b6:a03:6b::28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1792.17; Fri, 12 Apr 2019 08:03:36 +0000
Received: from DM3NAM03FT055.eop-NAM03.prod.protection.outlook.com
	(2a01:111:f400:7e49::207) by DM6PR08CA0008.outlook.office365.com
	(2603:10b6:5:80::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1792.14 via
	Frontend Transport; Fri, 12 Apr 2019 08:03:36 +0000
Received-SPF: Pass (protection.outlook.com: domain of flex.com designates
	52.27.180.120 as permitted sender) receiver=protection.outlook.com;
	client-ip=52.27.180.120;
	helo=NAM01-BY2-obe.outbound.protection.outlook.com; 
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (52.27.180.120)
	by DM3NAM03FT055.mail.protection.outlook.com (10.152.83.209) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1771.16 via Frontend Transport; Fri, 12 Apr 2019 08:03:36 +0000
Received: from BYAPR08MB4949.namprd08.prod.outlook.com (20.176.255.146) by
	BYAPR08MB5815.namprd08.prod.outlook.com (20.179.63.30) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.16; Fri, 12 Apr 2019 08:03:34 +0000
Received: from BYAPR08MB4949.namprd08.prod.outlook.com
	([fe80::5957:2d27:fe0:fe0f]) by BYAPR08MB4949.namprd08.prod.outlook.com
	([fe80::5957:2d27:fe0:fe0f%4]) with mapi id 15.20.1792.016;
	Fri, 12 Apr 2019 08:03:34 +0000
From: "Sunny Wang (DMN)" <sunny.wang1@flex.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>, "Michael
	Scott" <mike@foundries.io>
Thread-Topic: [OE-core] [PATCH] python3: add a tr-tr locale for test_locale
	ptest
Thread-Index: AQHU8P03ux67pG16cE6vhRIXFuJ6TKY4J43Q
Date: Fri, 12 Apr 2019 08:03:34 +0000
Message-ID: <BYAPR08MB49498588013758D58E8331F7DD280@BYAPR08MB4949.namprd08.prod.outlook.com>
References: <20190411160037.21952-1-alex.kanavin@gmail.com>
	<CAMKF1sqTi8azcTi06msrQ9fhtwAgfduOU_20wQtCR4vbTP2nQw@mail.gmail.com>
	<fa644fb73df839e7d0785effc16d9c4caba25dcc.camel@linuxfoundation.org>
In-Reply-To: <fa644fb73df839e7d0785effc16d9c4caba25dcc.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=sunny.wang1@flex.com; 
x-originating-ip: [158.116.214.207]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 08f8939a-6d18-4a98-cc8d-08d6bf1d5db8
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR08MB5815; 
X-MS-TrafficTypeDiagnostic: BYAPR08MB5815:|BYAPR08MB4887:
X-MS-Exchange-PUrlCount: 1
x-detectorid: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-Microsoft-Antispam-PRVS: <BYAPR08MB48877141EE7AA2DF4A6C1A25DD280@BYAPR08MB4887.namprd08.prod.outlook.com>
x-forefront-prvs: 0005B05917
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10019020)(366004)(39860400002)(346002)(396003)(376002)(136003)(13464003)(189003)(199004)(52294003)(55016002)(53546011)(8676002)(6246003)(26005)(102836004)(25786009)(6116002)(6506007)(186003)(3846002)(446003)(486006)(81166006)(11346002)(110136005)(33656002)(99286004)(7696005)(2906002)(66066001)(76176011)(105586002)(106356001)(9686003)(14444005)(256004)(86362001)(71200400001)(316002)(4326008)(6436002)(476003)(966005)(81156014)(68736007)(305945005)(97736004)(71190400001)(229853002)(478600001)(6306002)(14454004)(8936002)(5660300002)(53936002)(52536014)(7736002)(74316002)(460985005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR08MB5815;
	H:BYAPR08MB4949.namprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: flex.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: aSXK72zosfUYaoIG4XxP18uvodAhYRzDkgAGFFL9rh/v+LeQ4txoZ2KtoHrampjpMRk+4zZ4ajr14r2BuCFO52wpllRf3niT7ZVeqQA+yDrmgo8qrW1EFwLosioAGJtB/xkmJYjPvenDU9NfRLumyGJkhmjCq7b6yI/MjD3INnqJPpFl6hbKuxZB1bSQMk1URcfucO1EbVZoAf/MHSMIbv7h06PWXzOke1k519f1tf1B1Pnv8iNJvpnxMPE9E/D00O7uU8V0M4W3Zeaekf+LfDoKTPaaITBFFjrjp23EZUHtBImRSzroNPv0l1C5UFqF66EU4WfvZ3ZMJAzetk0NOr7eCh2LMatv4IWjysAR/xUWrZsCZxTYX6j5Qcyucl94mmXt9BH/FFwgdWRQYaiFGyXCC49nRtKni6oncWpsyu4=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5815
X-CFilter-Loop: Reflected
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM3NAM03FT055.eop-NAM03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.27.180.120; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(376002)(346002)(136003)(2980300002)(52294003)(13464003)(199004)(189003)(106002)(6246003)(476003)(52536014)(436003)(356004)(5660300002)(66066001)(76130400001)(229853002)(33656002)(4326008)(8936002)(53546011)(102836004)(26826003)(26005)(81166006)(81156014)(316002)(74316002)(7696005)(6506007)(11346002)(186003)(6436002)(2906002)(55236004)(47776003)(478600001)(47136003)(14444005)(50466002)(3846002)(305945005)(99286004)(9686003)(126002)(110136005)(446003)(7736002)(86362001)(23696002)(8676002)(6116002)(336012)(6306002)(48336001)(76176011)(25786009)(106466001)(55016002)(486006)(966005)(14454004)(460985005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR08MB4887;
	H:NAM01-BY2-obe.outbound.protection.outlook.com; FPR:; SPF:Pass;
	LANG:en; PTR:us-west-2c.mta.dlp.protect.symantec.com; A:1; MX:1;
X-MS-Office365-Filtering-Correlation-Id-Prvs: a217e2f6-dcf2-4282-492a-08d6bf1d5c56
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(710020)(711020)(4605104)(4709054)(2017052603328)(7167020)(7193020);
	SRVR:BYAPR08MB4887; 
X-Forefront-PRVS: 0005B05917
X-Microsoft-Antispam-Message-Info: 8cjzWb5c5vsA6GUnUZ/YT+1Z0zxYkMq77x3tMBLeEy6rTQe7a01pIK7M6GQeJUJBR/NZujAN37eqsnnHu26XM0iBIj8/fBrolPke6p6tqYb+PpCChijq+m7yLgkJ1dkMn5EI/UhhskbNCuoefhvRrlvI8M/nxzFmaQ2XdKb4w7rOlceGcClLr3Sb/tagNVhGmEwBepmSpUXD+l6YuXxHpEttJrOohxt5YhVQc325Mew8D9qTUJi/sRBD6/mXpzI2uY3lgwZDU0as5ZQEnJGiyw3oievobByOnlJj+Uo/ZDUsFPv0xj2JZrmJ1yDj4WwmfduQLTyY/1qP+BmROS/ud6hfDj97F4/iwoJa7R87r/ueUwZfjC9zRgHCmj424lSl7WZqfsUZcd5b2H7ZBvvlg7tNJGsaD3akMjxQHWwB/TA=
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2019 08:03:36.2174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f8939a-6d18-4a98-cc8d-08d6bf1d5db8
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e;
	Ip=[52.27.180.120];
	Helo=[NAM01-BY2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB4887
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-04-12_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1904120054
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: add a tr-tr locale for test_locale ptest
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
X-List-Received-Date: Fri, 12 Apr 2019 08:03:42 -0000
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gb2312"

DQoNCg0KSGksIFJpY2hhcmQgYW5kIE1pY2hhZWw6DQogICAgIFRoYW5rcyBmb3IgeW91ciBwb3Np
dGl2ZSBpbmZvcm1hdGlvbiwgYnV0IHdoYXQgSSBuZWVkIGlzIGFuIENvbW1hbmRMaW5lRGlza0lt
YWdlci5leGUgdGhhdCBjb3VsZCBhdXRvbWF0aWNhbGx5IGRvd25sb2FkIHRoZSB3aWMgZmlsZSB0
byB0aGUgRU1NQyBjaGlwIDoNCiAgICAgVGhlIGNvbW1hbmQgbGluZSBzYW1wbGUgIGlzIGFzIGJl
bG93Og0KICAgICAgQ29tbWFuZExpbmVEaXNrSW1hZ2VyLmV4ZSBDOlxEb3dubG9hZHNcc2Nvb3Rl
cm9zLW1kYi1pbWFnZS1pbXg2dWxtZGIud2ljIEcNCiAgICAgQ3VycmVudGx5LCBteSBhcHBsaWNh
dGlvbiBvbmx5IHN1cHBvcnQgLmltZyBmaWxlIGZvcm1hdCwgSSBuZWVkIGEgbmV3IENvbW1hbmRM
aW5lRGlza0ltYWdlci5leGUgdG8gc3VwcG9ydCAud2ljIGZvcm1hdC4NCiAgICAgIFRoYW5rcyBm
b3IgeW91ciB1cGRhdGUhDQoNCg0KQmVzdCBSZWdhcmRzIQ0KDQoNClN1bm55IFdhbmcNCkVRRSAt
IEFNRSAtIEFzaWENCg0KWGluIFFpbmcgU2NpZW5jZSAmIFRlY2hub2xvZ3kgSW5kdXN0cmlhbCBQ
YXJrDQpaaHVoYWksIEd1YW5nZG9uZywgQ2hpbmEgDQpkaXJlY3Q6ICs4NiAoMDc1NikgNTE4OTMy
NQ0KbW9iaWxlOiArODYgMTg1IDc1NjYgMDc0OA0KZW1haWw6IFN1bm55LldhbmcxQGZsZXguY29t
DQp3ZWI6IGZsZXguY29tDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVu
ZW1iZWRkZWQtY29yZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRl
ZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hh
cmQgUHVyZGllDQpTZW50OiAyMDE5xOo01MIxMsjVIDE0OjU5DQpUbzogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT47IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
Pg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW1BBVENIXSBweXRob24zOiBhZGQgYSB0ci10ciBsb2NhbGUgZm9yIHRl
c3RfbG9jYWxlIHB0ZXN0DQoNCk9uIFRodSwgMjAxOS0wNC0xMSBhdCAxOToxMiAtMDcwMCwgS2hl
bSBSYWogd3JvdGU6DQo+IE9uIFRodSwgQXByIDExLCAyMDE5IGF0IDk6MDAgQU0gQWxleGFuZGVy
IEthbmF2aW4gPCANCj4gYWxleC5rYW5hdmluQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gV2l0aCB0
aGlzIGNoYW5nZSwgdGhlIHB0ZXN0cyBkbyBub3QgZmFpbCBhbnltb3JlLCBleGNlcHQgZm9yIHRo
ZSANCj4gPiB0aHJlZSBmYWlsdXJlcyBjYXVzZWQgYnkgdGhlIDUuMCBrZXJuZWwgcmVncmVzc2lv
bjoNCj4gPiANCj4gPiAtIHRlc3Rfc3NsIGFuZCB0ZXN0X2h0dHBsaWIgbG9jayB1cCwgYW5kIGFy
ZSBza2lwcGVkICh0aGVyZSBpcyBhIA0KPiA+IHNlcGFyYXRlIHBhdGNoIGZvciBpdCkNCj4gPiAN
Cj4gPiAtIHRlc3RfYXN5bmNpbyBmYWlscyBidXQgZG9lcyBub3QgbG9jayB1cA0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy43
LjIuYmIgfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjNfMy43LjIuYmINCj4gPiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uM18zLjcuMi5iYg0KPiA+IGluZGV4IDI4ZjEyOGQ0ODhiLi43MWE2YzEwMzE2NiAxMDA2
NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy43LjIu
YmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy43LjIu
YmINCj4gPiBAQCAtMjg0LDcgKzI4NCw3IEBAIEZJTEVTXyR7UE59LW1pc2MgPSANCj4gPiAiJHts
aWJkaXJ9L3B5dGhvbiR7UFlUSE9OX01BSk1JTn0gJHtsaWJkaXJ9L3B5dGhvbiR7UFlUSE9OX01B
ICANCj4gPiBQQUNLQUdFUyArPSAiJHtQTn0tbWFuIg0KPiA+ICBGSUxFU18ke1BOfS1tYW4gPSAi
JHtkYXRhZGlyfS9tYW4iDQo+ID4gDQo+ID4gLVJERVBFTkRTXyR7UE59LXB0ZXN0ID0gIiR7UE59
LW1vZHVsZXMgJHtQTn0tdGVzdHMgdW56aXAgYnppcDIgDQo+ID4gbGliZ2NjIHR6ZGF0YS1ldXJv
cGUgY29yZXV0aWxzIHNlZCINCj4gPiArUkRFUEVORFNfJHtQTn0tcHRlc3QgPSAiJHtQTn0tbW9k
dWxlcyAke1BOfS10ZXN0cyB1bnppcCBiemlwMg0KPiA+IGxpYmdjYyB0emRhdGEtZXVyb3BlIGNv
cmV1dGlscyBzZWQgbG9jYWxlLWJhc2UtdHItdHIuaXNvLTg4NTktOSINCj4gDQo+IFdoaWxlIHRo
aXMgaXMgYSB0ZXN0IHBhY2thZ2UgaSBtdXN0IG1lbnRpb24gdGhhdCBsb2NhbGUgcGFja2FnZWQg
YXJlIA0KPiBzcGVjaWZpYyB0byBHbGliYyBzbyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gYXBwZW5k
IGl0IHdpdGggbGliYyANCj4gb3ZlcnJpZGUNCg0KV2UgaGFkIGJ1aWxkIGZhaWx1cmVzIGFuZCBJ
IHF1ZXVlZCBhIGZpeHVwIGluIHdhcnJpb3ItbmV4dCB0byBkbyBqdXN0IHRoYXQhDQoNCkNoZWVy
cywNCg0KUmljaGFyZA0KDQotLQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCk9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0KT3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9p
bnQuY29tL3YyL3VybD91PWh0dHAtM0FfX2xpc3RzLm9wZW5lbWJlZGRlZC5vcmdfbWFpbG1hbl9s
aXN0aW5mb19vcGVuZW1iZWRkZWQtMkRjb3JlJmQ9RHdJQ0FnJmM9WlBfSDhoVlBjTVB5c1FfcU1X
emNIUSZyPXVFV2V1eExJVlhEVUhoNXF1LWhxUDZWdTlPbWRObHFqeFFMN0FJQWo5T3MmbT0xbHdt
SHNBd29aRGZhTWlvUExKS0QwYlBTVjZIbnN2c3RwelY5NnZjTWxJJnM9WDBZaXgxQlhKZnRuSzd3
UnRLWThQWVhTYkRmc2Y1Z2tQTHFyclFIaVplQSZlPQ0KCkxlZ2FsIERpc2NsYWltZXIgOgpUaGUg
aW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWVzc2FnZSBtYXkgYmUgcHJpdmlsZWdlZCBh
bmQgY29uZmlkZW50aWFsLiAKSXQgaXMgaW50ZW5kZWQgdG8gYmUgcmVhZCBvbmx5IGJ5IHRoZSBp
bmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aG9tIGl0IGlzIGFkZHJlc3NlZCAKb3IgYnkgdGhlaXIg
ZGVzaWduZWUuIElmIHRoZSByZWFkZXIgb2YgdGhpcyBtZXNzYWdlIGlzIG5vdCB0aGUgaW50ZW5k
ZWQgcmVjaXBpZW50LCAKeW91IGFyZSBvbiBub3RpY2UgdGhhdCBhbnkgZGlzdHJpYnV0aW9uIG9m
IHRoaXMgbWVzc2FnZSwgaW4gYW55IGZvcm0sIAppcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5
b3UgaGF2ZSByZWNlaXZlZCB0aGlzIG1lc3NhZ2UgaW4gZXJyb3IsIApwbGVhc2UgaW1tZWRpYXRl
bHkgbm90aWZ5IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBvciBkZXN0cm95IGFueSBjb3B5IG9mIHRo
aXMgbWVzc2FnZSEK

