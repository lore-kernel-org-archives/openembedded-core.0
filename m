Return-Path: <prvs=707896d6ab=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id 44FCF7DE74
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 20:28:58 +0000 (UTC)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x5OKRdG1005275 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 15:28:59 -0500
Received: from nam01-by2-obe.outbound.protection.outlook.com
	(mail-by2nam01lp2052.outbound.protection.outlook.com [104.47.34.52])
	by mx0b-00010702.pphosted.com with ESMTP id 2tay43h7fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 15:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-nio365-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bvXCXw0gNhYUTAC5sPbGkA+YJtOjUXawhXQYCGszidc=;
	b=S91UFFPhNR8vJs1+GmmNDdAjb122JeSRGsusImxiTJAidu9ViSrxU0KGjgUSD01CV6MuXIWSkLeVPwISj85klGjbyONQJ24ssOkY+AEaRn0CS/wM08Ld4YwR2KEzWS65K+ZV0pQIQzaTEI/tEPM4Wdz3KXBIsK5ZGownSojkEx8=
Received: from SN6PR04MB4221.namprd04.prod.outlook.com (52.135.71.147) by
	SN6PR04MB4525.namprd04.prod.outlook.com (52.135.120.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1987.15; Mon, 24 Jun 2019 20:28:57 +0000
Received: from SN6PR04MB4221.namprd04.prod.outlook.com
	([fe80::749c:ad67:d220:a936]) by
	SN6PR04MB4221.namprd04.prod.outlook.com
	([fe80::749c:ad67:d220:a936%6]) with mapi id 15.20.2008.014;
	Mon, 24 Jun 2019 20:28:57 +0000
From: Alejandro Del Castillo <alejandro.delcastillo@ni.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?utf-8?B?W0VYVEVSTkFMXSDinJcgcGF0Y2h0ZXN0OiBmYWlsdXJlIGZvciBvcGtnICYg?=
	=?utf-8?Q?opkg-utils_update_to_0.4.1_(rev2)?=
Thread-Index: AQHVKsNVWTWmBLeeWkyP+9HsPZxpj6arQVyA
Date: Mon, 24 Jun 2019 20:28:57 +0000
Message-ID: <32715e17-691f-a70c-20ba-b235b3a544d7@ni.com>
References: <20190613201701.31014-1-alejandro.delcastillo@ni.com>
	<20190624193048.2334.64479@do>
In-Reply-To: <20190624193048.2334.64479@do>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR01CA0019.prod.exchangelabs.com (2603:10b6:805:b6::32)
	To SN6PR04MB4221.namprd04.prod.outlook.com
	(2603:10b6:805:30::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [130.164.62.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81071fc5-5cdd-44da-6ec5-08d6f8e29533
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:SN6PR04MB4525; 
x-ms-traffictypediagnostic: SN6PR04MB4525:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <SN6PR04MB4525C584AD52B86CEAE2F45686E00@SN6PR04MB4525.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(136003)(376002)(39860400002)(366004)(199004)(189003)(486006)(6306002)(3846002)(6246003)(6116002)(229853002)(99286004)(66066001)(86362001)(66556008)(305945005)(64756008)(53936002)(7736002)(66946007)(66476007)(5660300002)(66446008)(25786009)(6512007)(73956011)(81166006)(71200400001)(71190400001)(256004)(14454004)(8936002)(966005)(31696002)(2906002)(14444005)(11346002)(446003)(36756003)(2616005)(2351001)(81156014)(2501003)(68736007)(5640700003)(6436002)(76176011)(6486002)(478600001)(6916009)(316002)(26005)(15650500001)(31686004)(102836004)(52116002)(386003)(53546011)(6506007)(476003)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4525;
	H:SN6PR04MB4221.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7naEW7ZBnaBt/dZT9BhaVujOhzbMICOK9c4whn1pU4UzWV/BdbNPs5/7PugmrnXE4n8QDMYrw3a/7YePINJnNhcCo+O9kggmw+TR5K1tYPrVIwAxXKqFvWAMe55KZ63vseOrrGSAnzmPnLlQK/9mUXj0I4IR9RX95k70oqtRYtqIZEUSH9k1q1AZNKSoBNfg+BB4gcmZdCP0XWJXIjoN6f97ocWMIKOCKlnEuCCz9RQnYAmMLN70Q9iekPOGM9fmV+olN6jhZbTWqpR2THZXQ86FwikkPDPFlMtESAf3N46jFldfTk/3WmkBW0uFsr0ArC/Z4XxA0qk3wFeCetRR+caYhLut1RMqa6JtXhIOU8T2w2ZmXyO4AEJuaYOjMIBCQNrHPNXSd2rZoOyfmXuWehGnKm6wkF5SPvefBwCEcdM=
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81071fc5-5cdd-44da-6ec5-08d6f8e29533
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 20:28:57.1675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: alejandro.delcastillo@ni.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4525
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-24_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906240163
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9wa2cgJiBvcGtnLXV0aWxzIHVwZGF0ZSB0byAwLjQuMSAocmV2Mik=?=
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
X-List-Received-Date: Mon, 24 Jun 2019 20:28:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8905C3E331CE641804B145723763D58@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

VGhlIHBhdGNoIGRvZXMgYXBwbHkgaW4gdG9wIG9mIG1hc3RlcjoNCg0KW2FkZWxjYXN0QGRlbGNh
c3RpbGxvMyBidWlsZF0kIGdpdCByZXNldCAtLWhhcmQgb3JpZ2luL21hc3Rlcg0KSEVBRCBpcyBu
b3cgYXQgNGJiM2U4Zjk4ZSBsb2NhbC5jb25mLnNhbXBsZS5leHRlbmRlZDogcmVtb3ZlIHJlZHVu
ZGFudCANClJVTlRJTUVUQVJHRVQgYXNzaWdubWVudA0KW2FkZWxjYXN0QGRlbGNhc3RpbGxvMyBi
dWlsZF0kIGdpdCBhbSAtcyANCi90bXAvMDAwMS1vcGtnLXVwZ3JhZGUtdG8tdmVyc2lvbi0wLjQu
MS5wYXRjaA0KQXBwbHlpbmc6IG9wa2c6IHVwZ3JhZGUgdG8gdmVyc2lvbiAwLjQuMQ0KW2FkZWxj
YXN0QGRlbGNhc3RpbGxvMyBidWlsZF0kDQoNCm1heWJlIFBhdGNod29yayBpcyBmYWlsaW5nIGJl
Y2F1c2UgaXMgYSB2MiBvZiBvbmx5IG9uZSBvZiB0aGUgMiBwYXRjaGVzIA0Kb24gdGhlIHBhdGNo
c2V0PyAodGhlIG90aGVyIG9uZSBpcyBhbHJlYWR5IG9uIG1hc3RlcikNCg0KT24gNi8yNC8xOSAy
OjMwIFBNLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBT
ZXJpZXM6IG9wa2cgJiBvcGtnLXV0aWxzIHVwZGF0ZSB0byAwLjQuMSAocmV2MikNCj4gUmV2aXNp
b246IDINCj4gVVJMICAgOiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJs
P3U9aHR0cHMtM0FfX3BhdGNod29yay5vcGVuZW1iZWRkZWQub3JnX3Nlcmllc18xODE0NV8mZD1E
d0lDYVEmYz1JXzBZd29LeTd6NUxNVFZkeU82WUNpRTJ1ekkxampaWnVJUGVsY1NqaXhBJnI9d05j
ckwyYWtSbjZqZnhoSGFLYXZVckpCX0M5SkFNWHR5bmpMZDhaemdYUSZtPUItQWxvWElPd2h4alB5
QXg2SzZWS2VSLW5BYjdLNzVucThTbnhQbDZualkmcz1sd2duVWRUVmdPd0YyRDB1UWVjcmZTenla
cnRlTkgwZ2FUdThDbGVyVzVZJmU9DQo+IFN0YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFy
eSA9PQ0KPiANCj4gDQo+IFRoYW5rIHlvdSBmb3Igc3VibWl0dGluZyB0aGlzIHBhdGNoIHNlcmll
cyB0byBPcGVuRW1iZWRkZWQgQ29yZS4gVGhpcyBpcw0KPiBhbiBhdXRvbWF0ZWQgcmVzcG9uc2Uu
IFNldmVyYWwgdGVzdHMgaGF2ZSBiZWVuIGV4ZWN1dGVkIG9uIHRoZSBwcm9wb3NlZA0KPiBzZXJp
ZXMgYnkgcGF0Y2h0ZXN0IHJlc3VsdGluZyBpbiB0aGUgZm9sbG93aW5nIGZhaWx1cmVzOg0KPiAN
Cj4gDQo+IA0KPiAqIElzc3VlICAgICAgICAgICAgIFNlcmllcyBkb2VzIG5vdCBhcHBseSBvbiB0
b3Agb2YgdGFyZ2V0IGJyYW5jaCBbdGVzdF9zZXJpZXNfbWVyZ2Vfb25faGVhZF0NCj4gICAgU3Vn
Z2VzdGVkIGZpeCAgICBSZWJhc2UgeW91ciBzZXJpZXMgb24gdG9wIG9mIHRhcmdldGVkIGJyYW5j
aA0KPiAgICBUYXJnZXRlZCBicmFuY2ggIG1hc3RlciAoY3VycmVudGx5IGF0IDRiYjNlOGY5OGUp
DQo+IA0KPiANCj4gDQo+IElmIHlvdSBiZWxpZXZlIGFueSBvZiB0aGVzZSB0ZXN0IHJlc3VsdHMg
YXJlIGluY29ycmVjdCwgcGxlYXNlIHJlcGx5IHRvIHRoZQ0KPiBtYWlsaW5nIGxpc3QgKG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcpIHJhaXNpbmcgeW91ciBjb25jZXJu
cy4NCj4gT3RoZXJ3aXNlIHdlIHdvdWxkIGFwcHJlY2lhdGUgeW91IGNvcnJlY3RpbmcgdGhlIGlz
c3VlcyBhbmQgc3VibWl0dGluZyBhIG5ldw0KPiB2ZXJzaW9uIG9mIHRoZSBwYXRjaHNldCBpZiBh
cHBsaWNhYmxlLiBQbGVhc2UgZW5zdXJlIHlvdSBhZGQvaW5jcmVtZW50IHRoZQ0KPiB2ZXJzaW9u
IG51bWJlciB3aGVuIHNlbmRpbmcgdGhlIG5ldyB2ZXJzaW9uIChpLmUuIFtQQVRDSF0gLT4gW1BB
VENIIHYyXSAtPg0KPiBbUEFUQ0ggdjNdIC0+IC4uLikuDQo+IA0KPiAtLS0NCj4gR3VpZGVsaW5l
czogICAgIGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0z
QV9fd3d3Lm9wZW5lbWJlZGRlZC5vcmdfd2lraV9Db21taXQtNUZQYXRjaC01Rk1lc3NhZ2UtNUZH
dWlkZWxpbmVzJmQ9RHdJQ2FRJmM9SV8wWXdvS3k3ejVMTVRWZHlPNllDaUUydXpJMWpqWlp1SVBl
bGNTaml4QSZyPXdOY3JMMmFrUm42amZ4aEhhS2F2VXJKQl9DOUpBTVh0eW5qTGQ4WnpnWFEmbT1C
LUFsb1hJT3doeGpQeUF4Nks2VktlUi1uQWI3Szc1bnE4U254UGw2bmpZJnM9VHZzWkFRZHl0cnc3
djhsNDdqRzl0aERfeGs5TUsxdWxJNmNPTUtqSWF5USZlPQ0KPiBUZXN0IGZyYW1ld29yazogaHR0
cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHAtM0FfX2dpdC55b2N0
b3Byb2plY3Qub3JnX2NnaXRfY2dpdC5jZ2lfcGF0Y2h0ZXN0JmQ9RHdJQ2FRJmM9SV8wWXdvS3k3
ejVMTVRWZHlPNllDaUUydXpJMWpqWlp1SVBlbGNTaml4QSZyPXdOY3JMMmFrUm42amZ4aEhhS2F2
VXJKQl9DOUpBTVh0eW5qTGQ4WnpnWFEmbT1CLUFsb1hJT3doeGpQeUF4Nks2VktlUi1uQWI3Szc1
bnE4U254UGw2bmpZJnM9c09wenlYZVBicUdHZzdWN3BFVGhWSWJxYVpkdGlnOVRJd1o5WFdOaVpu
ayZlPQ0KPiBUZXN0IHN1aXRlOiAgICAgaHR0cHM6Ly91cmxkZWZlbnNlLnByb29mcG9pbnQuY29t
L3YyL3VybD91PWh0dHAtM0FfX2dpdC55b2N0b3Byb2plY3Qub3JnX2NnaXRfY2dpdC5jZ2lfcGF0
Y2h0ZXN0LTJEb2UmZD1Ed0lDYVEmYz1JXzBZd29LeTd6NUxNVFZkeU82WUNpRTJ1ekkxampaWnVJ
UGVsY1NqaXhBJnI9d05jckwyYWtSbjZqZnhoSGFLYXZVckpCX0M5SkFNWHR5bmpMZDhaemdYUSZt
PUItQWxvWElPd2h4alB5QXg2SzZWS2VSLW5BYjdLNzVucThTbnhQbDZualkmcz0xR2RVSW1iWFNV
MTBxbmE1XzZCSnRra0dVZFZoTTdZMmtGV0gtUXFjWnRZJmU9DQo+IA0KDQotLSANCkNoZWVycywN
Cg0KQWxlamFuZHJvDQo=

