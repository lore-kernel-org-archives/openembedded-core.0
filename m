Return-Path: <prvs=12017de894=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 4F59B7FA3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 15:37:37 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9PFVYLJ004872; Fri, 25 Oct 2019 10:37:37 -0500
Received: from nam03-dm3-obe.outbound.protection.outlook.com
	(mail-dm3nam03lp2055.outbound.protection.outlook.com [104.47.41.55])
	by mx0a-00010702.pphosted.com with ESMTP id 2vt9s8jqwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 25 Oct 2019 10:37:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ADlRk7fhFhQRLbYtwXi3IGvK7NzZoh0SHdYcHCLlOn/3FM4vh2aKqPq3kXtOUBveCeanGHhoOL0pY7alIsWsplbW+rdeAxpQYbkO4jJUl52xg0ruxUHRV/V4ees1bKWPg7xAQCun5E8Tp9SOX3KhcQ3WpuCaD5pacpOSZdKbkBfSX7Bv8e4/o1mKjex24rOzd8nUiIoSLmZbInIX3vjhWvVNGq7MRkGly4DoaMvTxqgEpqxPuUJu3MawR+8EtOWRUQ++mxcXTqVCRhPuaHE85MqzreczReGysL5NHQ9z4vtLmKJazfY0ubAXK9N4ILDfS/4vbigzbpeqhPGs49z3cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Q0/ckvRvVBvq89QUyIerJLDWijsoLDENX/R51EatpH0=;
	b=h5upWXKxIqLKA+uM4HO9c/ja1Y9/LnpnowxmtOM/1DlG/sy+HqNZ3ZxrsE5b0niuGy4quZtk4D4M/T8c22Mo9ufL0gumeGWIGZGIvdRmj7deZgDGr+6h9PmaIT6zupeSbjOsU/+ymDc5f0M/CJOdkheQzwpgW/MLUJiQAvzVOP/1EBkFk0s7dTfJxTqcMSC8gQbKdqpzV0NTqN6tEGxThI2odDGySDrjeEsBYBZu7u8pkcdiVfPioLbCAWBP/L2PAvI64V4Y9umqIYzhiPn2gNY/oOz5g0G71j3kl9/HLzBvovOvpycEqejEX6DHmwLYOzB6RplP57MbT0GPGeWZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com;
	dkim=pass header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Q0/ckvRvVBvq89QUyIerJLDWijsoLDENX/R51EatpH0=;
	b=M4dWvU2LAcy3fF03US3MyxAS9P4r/FpqsBkoCggyd9dy+JMLAHvp81AOSv/DJh51tw5PJXkZzK3H3WpDtExfvmUQdoRSzMWPpTwslHstad3EcBlYVZu6QLHlIX+jngj2iKdZ7bGsxxTGbipnAaDshBznyGyT5B2OqXnQCgdT6JI=
Received: from MWHPR0401MB3658.namprd04.prod.outlook.com (10.167.163.20) by
	MWHPR0401MB3515.namprd04.prod.outlook.com (10.167.162.142) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2367.24; Fri, 25 Oct 2019 15:37:33 +0000
Received: from MWHPR0401MB3658.namprd04.prod.outlook.com
	([fe80::b930:8014:da3b:898a]) by
	MWHPR0401MB3658.namprd04.prod.outlook.com
	([fe80::b930:8014:da3b:898a%6]) with mapi id 15.20.2347.030;
	Fri, 25 Oct 2019 15:37:33 +0000
From: Alejandro Del Castillo <alejandro.delcastillo@ni.com>
To: Yann CARDAILLAC <yann.cardaillac@smile.fr>
Thread-Topic: [EXTERNAL] Re: [opkg-devel] [yocto][PATCH][opkg] bug 13528 add
	SPDX id to opkg
Thread-Index: AQHViwjZz8xtquFZgEWhRYdZMt+Y6adrfiiA
Date: Fri, 25 Oct 2019 15:37:33 +0000
Message-ID: <da943f96-c9e0-b296-0e17-a0fc6716286a@ni.com>
References: <CAA984JWqcX5oDhumXYBom+ZyxD+bo7oGmTzLx_tXejvPaR1UKQ@mail.gmail.com>
	<0d017fc3-b00b-cfeb-2b35-267b894e7d25@ni.com>
	<CAA984JWrw5CasXR4UQ-qqb94KLYWzj3ZWjRFEGrm=uo751BesA@mail.gmail.com>
In-Reply-To: <CAA984JWrw5CasXR4UQ-qqb94KLYWzj3ZWjRFEGrm=uo751BesA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN1PR12CA0083.namprd12.prod.outlook.com
	(2603:10b6:802:21::18) To MWHPR0401MB3658.namprd04.prod.outlook.com
	(2603:10b6:301:79::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [130.164.62.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9371b83-dd84-44b0-671d-08d7596140e2
x-ms-traffictypediagnostic: MWHPR0401MB3515:
x-ms-exchange-purlcount: 19
x-microsoft-antispam-prvs: <MWHPR0401MB3515D13CADC303331D8C366186650@MWHPR0401MB3515.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(346002)(366004)(136003)(396003)(199004)(189003)(446003)(53546011)(186003)(6506007)(11346002)(386003)(14454004)(2616005)(45080400002)(26005)(478600001)(102836004)(8936002)(6486002)(86362001)(6436002)(229853002)(476003)(8676002)(81156014)(31686004)(3846002)(486006)(4326008)(966005)(31696002)(6116002)(64756008)(76176011)(5660300002)(6246003)(256004)(52116002)(81166006)(25786009)(99286004)(2906002)(71190400001)(71200400001)(305945005)(7736002)(316002)(6916009)(561944003)(6306002)(54906003)(66946007)(66476007)(66556008)(66446008)(6512007)(66066001)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR0401MB3515;
	H:MWHPR0401MB3658.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7LGk+4v5qZ+pdyp7A4XUy5yVRx8bgfveiDZVxBktP4OQCbahj/6j1L6P4ZJIVeQd1ipLsMBa2Zwh2OLH2lrcMO+DVacgCq5pd9rSunFE3WCIiORmyrrErKyWavnDNEJ0KwNbSwDGuUOYyvltagXI6kw7m0yujy+/ZmJ2qEV3oO8CKGcQY6vOfmj1vvTiizLKa/MVrDMwagwfTn1vSA5DOxWIaRdj7k0ANLrlv5n6ZfNPWrSdikbqfszyetot9D8pIniyApIzlLxbhwaJqQV6qQ81o3qPZRVl+w59IHpwNm7YKC2RKsmA6+2yaqEEbFLPlzJzC1ltcKGK/BOaLdxq+vFx9Lbj7T9a0cUBBb2c9qHmMWz9yun/eiIP0pG7nEJo6HT1R3aqO2Xwc1axcWlN9Xn2z76exdNfd7udbpDLqRsKqn2TJzFbVDyaS9OhviEQ/KqoRevqgI80RAcjak4aUJkU3bhK9J1Gd9/OqWUJ2qM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9371b83-dd84-44b0-671d-08d7596140e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 15:37:33.3922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i0M3D5V2EkGyFGAFOgwDu9MxXtXey1cZPkWFo5f7iyG/l/7vCAAv0xcc1Bn/5YkSbpRDrMUMfra74n/iAMkDn/R8OrMEzKReHwGi2A+av7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0401MB3515
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-25_08:2019-10-25,2019-10-25 signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
	phishscore=0 mlxscore=0 clxscore=1015 impostorscore=0 malwarescore=0
	suspectscore=0 spamscore=0 mlxlogscore=999 classifier=spam adjust=30
	reason=mlx scancount=1 engine=8.12.0-1908290000
	definitions=main-1910250144
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Romain Naour <romain.naour@smile.fr>,
	"opkg-devel@googlegroups.com" <opkg-devel@googlegroups.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [opkg-devel] [yocto][PATCH][opkg] bug 13528 add SPDX id to opkg
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
X-List-Received-Date: Fri, 25 Oct 2019 15:37:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <70F48F589B91084E8DC6079BE8CB4998@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

bWVyZ2VkDQoNCnRoYW5rcyBhZ2FpbiBmb3IgZG9pbmcgdGhpcywgaXRzIGJlZW4gb24gdGhlIHdp
c2gtbGlzdCBmb3IgYSB3aGlsZSENCg0KLS0NCkNoZWVycywNCg0KQWxlamFuZHJvDQoNCk9uIDEw
LzI1LzE5IDI6NTAgQU0sIFlhbm4gQ0FSREFJTExBQyB3cm90ZToNCj4gSGkgQWxlamFuZHJvLA0K
PiANCj4gSGVyZSdzIHBhdGNoIHYyDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgc2hhcnBlbmVkIGV5
ZXMgIQ0KPiANCj4gUmVnYXJkcywNCj4gDQo+IE9uIFRodSwgT2N0IDI0LCAyMDE5IGF0IDk6Mzkg
UE0gQWxlamFuZHJvIERlbCBDYXN0aWxsbyANCj4gPGFsZWphbmRyby5kZWxjYXN0aWxsb0BuaS5j
b20gPG1haWx0bzphbGVqYW5kcm8uZGVsY2FzdGlsbG9AbmkuY29tPj4gd3JvdGU6DQo+IA0KPiAg
ICAgSGkgWWFubiwNCj4gDQo+ICAgICBUaGFua3MgYWdhaW4gZm9yIGFkZGluZyB0aGUgaGVhZGVy
cy4gWW91ciBwYXRjaCBsb29rcyBnb29kLCBleGNlcHQgZm9yDQo+ICAgICBvbmUgbGluZSB0aGF0
IGhhcyBhIGR1cGxpY2F0ZWQgaGVhZGVyOg0KPiANCj4gICAgIC9jb3JlLzI2X3ByZWZlcl9hcmNo
X3RvX3ZlcnNpb24ucHkNCj4gICAgIGluZGV4IDBhMGQ2NmIuLjgyOTM0YzEgMTAwNzU1DQo+ICAg
ICAtLS0gYS90ZXN0cy9jb3JlLzI2X3ByZWZlcl9hcmNoX3RvX3ZlcnNpb24ucHkNCj4gICAgICsr
KyBiL3Rlc3RzL2NvcmUvMjZfcHJlZmVyX2FyY2hfdG9fdmVyc2lvbi5weQ0KPiAgICAgQEAgLTEs
NCArMSw1IEBADQo+ICAgICAtIyEgL3Vzci9iaW4vZW52IHB5dGhvbjMNCj4gICAgICsjISAvdXNy
L2Jpbi9lbnYgcHl0aG9uMyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0K
PiAgICAgKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiAgICAgIMKg
ICMNCj4gDQo+ICAgICBjb3VsZCB5b3Ugc2VuZCBhIHYyPyByZWdhcmRpbmcgbTQgZmlsZXMsIEkg
bG9va2VkIGFyb3VuZCBhIGJpdCBhbmQNCj4gICAgIGRpZG4ndCBmaW5kIHByb2plY3QgYWRkaW5n
IFNQRFggaWRlbnRpZmllcnMgdG8gdGhlbS4uLi4NCj4gDQo+ICAgICBDaGVlcnMsDQo+IA0KPiAg
ICAgQWxlamFuZHJvDQo+IA0KPiAgICAgT24gMTAvMjIvMTkgOTo1NSBBTSwgWWFubiBDQVJEQUlM
TEFDIHdyb3RlOg0KPiAgICAgID4gSGksDQo+ICAgICAgPg0KPiAgICAgID4gSSdtIHdvcmtpbmcg
b24gYnVnIDoNCj4gICAgICA+IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9zaG93
X2J1Zy5jZ2k/aWQ9MTM1MjgNCj4gICAgIDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9idWd6aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xMzUyOF9fOyFm
cVdKY25sVGtqTSFfTlJKbTByaURWWVdZU3drNDF1THdGQWM4cG92OV9BYW42VG9MV0RLYTNYYUxt
WlRlcU1VLV9XMTktQ0gyUXRuSFVfYTBnJD4NCj4gDQo+ICAgICAgPg0KPiAgICAgPGh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hv
d19idWcuY2dpP2lkPTEzNTI4X187IWZxV0pjbmxUa2pNITREVkQ5bFAyVWRDRjVVZWRJOEotWGpo
UVF1eURobUFpTGFPWGs4T1c1S01DRlJ6RzJBU1BfQmRyeG52Qm5DbmIwVHlZTlEkPg0KPiAgICAg
ID4NCj4gICAgICA+wqAgSSd2ZSBhIGZpcnN0IHBhdGNoIHByb3Bvc2FsLiBOb3RlIHRoYXQgSSBk
aWRuJ3Qga25ldyB3aGF0IHRvIGRvIHdpdGgNCj4gICAgICA+wqAgbTQvZ3BnbWUubTQgdGhlIGxp
Y2Vuc2UgaGVhZGVyIHNlZW1zIHByZXR0eSB3ZWlyZCB0byBtZS4uLg0KPiAgICAgID4NCj4gICAg
ICA+IFJlZ2FyZHMsDQo+ICAgICAgPg0KPiAgICAgID4gLS0gU01JTEUNCj4gICAgICA+DQo+ICAg
ICA8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly93d3cuc21pbGUuZXUvX187IWZx
V0pjbmxUa2pNITREVkQ5bFAyVWRDRjVVZWRJOEotWGpoUVF1eURobUFpTGFPWGs4T1c1S01DRlJ6
RzJBU1BfQmRyeG52Qm5DbmZiRENIWXckPg0KPiAgICAgID4NCj4gICAgICA+wqAgMjAgcnVlIGRl
cyBKYXJkaW5zIDkyNjAwIEFzbmnDqHJlcy1zdXItU2VpbmUNCj4gICAgICA+DQo+ICAgICAgPsKg
ICpZYW5uIENBUkRBSUxMQUMqIEluZ8OpbmlldXIgU3lzdMOobWVzIEVtYmFycXXDqXMNCj4gICAg
ICA+DQo+ICAgICAgPiBlbWFpbCB5YW5uLmNhcmRhaWxsYWNAc21pbGUuZnIgPG1haWx0bzp5YW5u
LmNhcmRhaWxsYWNAc21pbGUuZnI+DQo+ICAgICA8bWFpbHRvOnlhbm4uY2FyZGFpbGxhY0BzbWls
ZS5mciA8bWFpbHRvOnlhbm4uY2FyZGFpbGxhY0BzbWlsZS5mcj4+IHVybA0KPiAgICAgID4gaHR0
cDovL3d3dy5zbWlsZS5ldQ0KPiAgICAgPGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRw
Oi8vd3d3LnNtaWxlLmV1X187IWZxV0pjbmxUa2pNIV9OUkptMHJpRFZZV1lTd2s0MXVMd0ZBYzhw
b3Y5X0FhbjZUb0xXREthM1hhTG1aVGVxTVUtX1cxOS1DSDJRc3NJZjMtcWckPg0KPiANCj4gICAg
ICA+DQo+ICAgICA8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly93d3cuc21pbGUu
ZXVfXzshZnFXSmNubFRrak0hNERWRDlsUDJVZENGNVVlZEk4Si1YamhRUXV5RGhtQWlMYU9YazhP
VzVLTUNGUnpHMkFTUF9CZHJ4bnZCbkNtVjlSNGpQQSQ+DQo+ICAgICAgPg0KPiAgICAgID4NCj4g
ICAgICA+DQo+ICAgICAgPiBUd2l0dGVyDQo+ICAgICAgPg0KPiAgICAgPGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL3R3aXR0ZXIuY29tL0dyb3VwZVNtaWxlX187IWZxV0pjbmxU
a2pNITREVkQ5bFAyVWRDRjVVZWRJOEotWGpoUVF1eURobUFpTGFPWGs4T1c1S01DRlJ6RzJBU1Bf
QmRyeG52Qm5Da3EtbUZ6Y3ckPg0KPiAgICAgID7CoCBGYWNlYm9vaw0KPiAgICAgID4NCj4gICAg
IDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93d3cuZmFjZWJvb2suY29tL3Nt
aWxlb3BlbnNvdXJjZV9fOyFmcVdKY25sVGtqTSE0RFZEOWxQMlVkQ0Y1VWVkSThKLVhqaFFRdXlE
aG1BaUxhT1hrOE9XNUtNQ0ZSekcyQVNQX0JkcnhudkJuQ2s4THhXMDhBJD4NCj4gICAgICA+wqAg
TGlua2VkSW4NCj4gICAgICA+DQo+ICAgICA8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0
dHBzOi8vd3d3LmxpbmtlZGluLmNvbS9jb21wYW55L3NtaWxlX187IWZxV0pjbmxUa2pNITREVkQ5
bFAyVWRDRjVVZWRJOEotWGpoUVF1eURobUFpTGFPWGs4T1c1S01DRlJ6RzJBU1BfQmRyeG52Qm5D
azUtM3kwOHckPg0KPiAgICAgID7CoCBHaXRodWINCj4gICAgICA+DQo+ICAgICA8aHR0cHM6Ly91
cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9TbWlsZS1TQV9fOyFmcVdKY25s
VGtqTSE0RFZEOWxQMlVkQ0Y1VWVkSThKLVhqaFFRdXlEaG1BaUxhT1hrOE9XNUtNQ0ZSekcyQVNQ
X0JkcnhudkJuQ2xFT3hVem9BJD4NCj4gICAgICA+DQo+ICAgICAgPg0KPiAgICAgID4NCj4gICAg
ICA+DQo+ICAgICAgPg0KPiAgICAgID4gZWNvIFBvdXIgbGEgcGxhbsOodGUsIG4naW1wcmltZXog
Y2UgbWFpbCBxdWUgc2kgYydlc3QgbsOpY2Vzc2FpcmUNCj4gICAgICA+DQo+ICAgICAgPiAtLSBZ
b3UgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRo
ZSBHb29nbGUNCj4gICAgICA+wqAgR3JvdXBzICJvcGtnLWRldmVsIiBncm91cC4gVG8gdW5zdWJz
Y3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wDQo+ICAgICAgPiByZWNlaXZpbmcgZW1haWxz
IGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8NCj4gICAgICA+IG9wa2ctZGV2ZWwrdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbQ0KPiAgICAgPG1haWx0bzpvcGtnLWRldmVsJTJCdW5zdWJzY3Jp
YmVAZ29vZ2xlZ3JvdXBzLmNvbT4NCj4gICAgICA+IDxtYWlsdG86b3BrZy1kZXZlbCt1bnN1YnNj
cmliZUBnb29nbGVncm91cHMuY29tDQo+ICAgICA8bWFpbHRvOm9wa2ctZGV2ZWwlMkJ1bnN1YnNj
cmliZUBnb29nbGVncm91cHMuY29tPj4uIFRvIHZpZXcgdGhpcw0KPiAgICAgID4gZGlzY3Vzc2lv
biBvbiB0aGUgd2ViIHZpc2l0DQo+ICAgICAgPg0KPiAgICAgaHR0cHM6Ly9ncm91cHMuZ29vZ2xl
LmNvbS9kL21zZ2lkL29wa2ctZGV2ZWwvQ0FBOTg0SldxY1g1b0RodW1YWUJvbSUyQlp5eEQlMkJi
bzdvR21Uekx4X3RYZWp2UGFSMVVLUSU0MG1haWwuZ21haWwuY29tDQo+ICAgICA8aHR0cHM6Ly91
cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZC9tc2dpZC9vcGtn
LWRldmVsL0NBQTk4NEpXcWNYNW9EaHVtWFlCb20qMkJaeXhEKjJCYm83b0dtVHpMeF90WGVqdlBh
UjFVS1EqNDBtYWlsLmdtYWlsLmNvbV9fO0pTVWwhZnFXSmNubFRrak0hX05SSm0wcmlEVllXWVN3
azQxdUx3RkFjOHBvdjlfQWFuNlRvTFdES2EzWGFMbVpUZXFNVS1fVzE5LUNIMlF1d0tSZDRMUSQ+
DQo+ICAgICAgPg0KPiAgICAgID4NCj4gICAgIDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9kL21zZ2lkL29wa2ctZGV2ZWwvQ0FBOTg0SldxY1g1
b0RodW1YWUJvbSoyQlp5eEQqMkJibzdvR21Uekx4X3RYZWp2UGFSMVVLUSo0MG1haWwuZ21haWwu
Y29tP3V0bV9tZWRpdW09ZW1haWwmdXRtX3NvdXJjZT1mb290ZXJfXztKU1VsIWZxV0pjbmxUa2pN
ITREVkQ5bFAyVWRDRjVVZWRJOEotWGpoUVF1eURobUFpTGFPWGs4T1c1S01DRlJ6RzJBU1BfQmRy
eG52Qm5DbjdiZXo4VGckPi4NCj4gDQo+ICAgICAtLQ0KPiAgICAgID4NCj4gICAgIENoZWVycywN
Cj4gDQo+ICAgICBBbGVqYW5kcm8NCj4gDQo+IA0KPiANCj4gLS0gDQo+IFNNSUxFIA0KPiA8aHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly93d3cuc21pbGUuZXUvX187IWZxV0pjbmxU
a2pNIV9OUkptMHJpRFZZV1lTd2s0MXVMd0ZBYzhwb3Y5X0FhbjZUb0xXREthM1hhTG1aVGVxTVUt
X1cxOS1DSDJRc0xuS1drYWckPg0KPiANCj4gMjAgcnVlIGRlcyBKYXJkaW5zDQo+IDkyNjAwIEFz
bmnDqHJlcy1zdXItU2VpbmUNCj4gDQo+IAkNCj4gKllhbm4gQ0FSREFJTExBQyoNCj4gSW5nw6lu
aWV1ciBTeXN0w6htZXMgRW1iYXJxdcOpcw0KPiANCj4gZW1haWwgeWFubi5jYXJkYWlsbGFjQHNt
aWxlLmZyIDxtYWlsdG86eWFubi5jYXJkYWlsbGFjQHNtaWxlLmZyPg0KPiB1cmwgaHR0cDovL3d3
dy5zbWlsZS5ldSANCj4gPGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vd3d3LnNt
aWxlLmV1X187IWZxV0pjbmxUa2pNIV9OUkptMHJpRFZZV1lTd2s0MXVMd0ZBYzhwb3Y5X0FhbjZU
b0xXREthM1hhTG1aVGVxTVUtX1cxOS1DSDJRc3NJZjMtcWckPiANCj4gDQo+IA0KPiBUd2l0dGVy
IA0KPiA8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vdHdpdHRlci5jb20vR3Jv
dXBlU21pbGVfXzshZnFXSmNubFRrak0hX05SSm0wcmlEVllXWVN3azQxdUx3RkFjOHBvdjlfQWFu
NlRvTFdES2EzWGFMbVpUZXFNVS1fVzE5LUNIMlF0QWszSWJqUSQ+IA0KPiBGYWNlYm9vayANCj4g
PGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3d3dy5mYWNlYm9vay5jb20vc21p
bGVvcGVuc291cmNlX187IWZxV0pjbmxUa2pNIV9OUkptMHJpRFZZV1lTd2s0MXVMd0ZBYzhwb3Y5
X0FhbjZUb0xXREthM1hhTG1aVGVxTVUtX1cxOS1DSDJRdURDTmFrdEEkPiANCj4gTGlua2VkSW4g
DQo+IDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93d3cubGlua2VkaW4uY29t
L2NvbXBhbnkvc21pbGVfXzshZnFXSmNubFRrak0hX05SSm0wcmlEVllXWVN3azQxdUx3RkFjOHBv
djlfQWFuNlRvTFdES2EzWGFMbVpUZXFNVS1fVzE5LUNIMlF2eG03WGxxZyQ+IA0KPiBHaXRodWIg
DQo+IDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL1NtaWxl
LVNBX187IWZxV0pjbmxUa2pNIV9OUkptMHJpRFZZV1lTd2s0MXVMd0ZBYzhwb3Y5X0FhbjZUb0xX
REthM1hhTG1aVGVxTVUtX1cxOS1DSDJRdWE2bHBZUGckPiANCj4gDQo+IA0KPiANCj4gDQo+IGVj
byBQb3VyIGxhIHBsYW7DqHRlLCBuJ2ltcHJpbWV6IGNlIG1haWwgcXVlIHNpIGMnZXN0IG7DqWNl
c3NhaXJlDQoNCg==

