Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 7332 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Apr 2019 01:34:52 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750071.outbound.protection.outlook.com [40.107.75.71])
	by mail.openembedded.org (Postfix) with ESMTP id 3FDAD7D9B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 01:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=iVISA4mCRGalOEa9zAWopD4JdDAuST7bxwBBgHaLev4=;
	b=mTrj9gWcEJCV8nCWu/635BCmMYYB2Pz8rGXwdhCodnWBBr8Cx3EG1ag3Oq+KxxCZdJHzxOOSoWv5xuG8cDux5Tjw6ccoiKB5qle9kxxsG202c3bsr0JeOfntP6jNYJ26WQxYyc/x8yXS9t2W1o3Hl3SRTi5LsWLUnsAO+sYv8K8=
Received: from BYAPR02MB5816.namprd02.prod.outlook.com (20.179.62.217) by
	BYAPR02MB5048.namprd02.prod.outlook.com (20.176.253.221) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1813.16; Thu, 25 Apr 2019 21:59:59 +0000
Received: from BYAPR02MB5816.namprd02.prod.outlook.com
	([fe80::b166:f3f6:847b:b09f]) by
	BYAPR02MB5816.namprd02.prod.outlook.com
	([fe80::b166:f3f6:847b:b09f%7]) with mapi id 15.20.1835.010;
	Thu, 25 Apr 2019 21:59:59 +0000
From: Jaewon Lee <JAEWON@xilinx.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Manjukumar Harthikote Matha
	<MANJUKUM@xilinx.com>, Alejandro Enedino Hernandez Samaniego
	<alejandr@xilinx.com>
Thread-Topic: [OE-core][master][RFC] Adding back wrapper and using
	OEPYTHON3HOME variable for python3
Thread-Index: AQHU+6ECMooAT//9zkyxkvUFR/UoN6ZNWbyAgAATYtA=
Date: Thu, 25 Apr 2019 21:59:59 +0000
Message-ID: <BYAPR02MB5816DFE994E263D11187C553AF3D0@BYAPR02MB5816.namprd02.prod.outlook.com>
References: <1556222193-2780-1-git-send-email-jaewon.lee@xilinx.com>
	<72e102b7e2a14c0747e3b485a6429f8dde546508.camel@linuxfoundation.org>
In-Reply-To: <72e102b7e2a14c0747e3b485a6429f8dde546508.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=JAEWON@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28fdc41b-78ef-4dc0-263b-08d6c9c95c7a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR02MB5048; 
x-ms-traffictypediagnostic: BYAPR02MB5048:
x-microsoft-antispam-prvs: <BYAPR02MB5048572EADE19BCB746F2494AF3D0@BYAPR02MB5048.namprd02.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(136003)(39860400002)(396003)(346002)(366004)(13464003)(189003)(199004)(186003)(6116002)(102836004)(72206003)(478600001)(9686003)(68736007)(6506007)(64756008)(53546011)(66556008)(6246003)(66946007)(25786009)(55016002)(2906002)(256004)(71190400001)(66476007)(76176011)(71200400001)(76116006)(7696005)(53936002)(66446008)(73956011)(14454004)(26005)(81166006)(11346002)(316002)(486006)(81156014)(6436002)(8676002)(33656002)(6636002)(110136005)(99286004)(66066001)(229853002)(446003)(8936002)(97736004)(3846002)(2501003)(7736002)(305945005)(476003)(74316002)(5660300002)(86362001)(52536014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5048;
	H:BYAPR02MB5816.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pmCEowvoVCxZCUy3SJTRVsbB2BHaBxswvi0YB9/ZaJXFTXF5Bv7e99GLpbAAzSZqt1SxWuGptxsc0iIYPFsTdfgfyNkPo2JpLgIq/oGyvc/HXdBofBnbjN3az/oTXRwlhEQJLgjrZ2Gv7X/NRZ44O1PVGuyL1oFc+3oC/cdeHDcTABzMLwJonBOrGofcYHVCmX5MvBq5+q45WzyRMzLo8s20w1a1O7a4L3IQxg50Yz7Dp7aOtrB6ZB7ly3VGk5MVWGKawCi7Bi7ltyx7MnFL+MOUwxodwaGotTjD779qtprDJpTSbKLtD2ZmzuQq7Qp1FnQUvadlrxaDCw64XhxIgggNL2GJKZtWZlHFRrXlIk0M41Qu4oMZTeqmrhEZ87W6trshezU0YTUt6iHM//hnpinOMtNw28+fYuxu41Evv3s=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fdc41b-78ef-4dc0-263b-08d6c9c95c7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 21:59:59.4761 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5048
Subject: Re: [master][RFC] Adding back wrapper and using OEPYTHON3HOME variable for python3
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
X-List-Received-Date: Fri, 26 Apr 2019 01:34:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KQWdyZWVkLCB3aWxsIHNlbmQgYSB2Mg0KDQpUaGFua3MsDQpKYWV3b24N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IHJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmcgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IA0KU2Vu
dDogVGh1cnNkYXksIEFwcmlsIDI1LCAyMDE5IDE6NTAgUE0NClRvOiBKYWV3b24gTGVlIDxKQUVX
T05AeGlsaW54LmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7
IE1hbmp1a3VtYXIgSGFydGhpa290ZSBNYXRoYSA8TUFOSlVLVU1AeGlsaW54LmNvbT47IEFsZWph
bmRybyBFbmVkaW5vIEhlcm5hbmRleiBTYW1hbmllZ28gPGFsZWphbmRyQHhpbGlueC5jb20+DQpT
dWJqZWN0OiBSZTogW09FLWNvcmVdW21hc3Rlcl1bUkZDXSBBZGRpbmcgYmFjayB3cmFwcGVyIGFu
ZCB1c2luZyBPRVBZVEhPTjNIT01FIHZhcmlhYmxlIGZvciBweXRob24zDQoNCk9uIFRodSwgMjAx
OS0wNC0yNSBhdCAxMjo1NiAtMDcwMCwgSmFld29uIExlZSB3cm90ZToNCj4gK2RpZmYgLS1naXQg
YS9Nb2R1bGVzL21haW4uYyBiL01vZHVsZXMvbWFpbi5jIGluZGV4IGE3NDUzODEuLjI1Y2E0MzUg
DQo+ICsxMDA2NDQNCj4gKy0tLSBhL01vZHVsZXMvbWFpbi5jDQo+ICsrKysgYi9Nb2R1bGVzL21h
aW4uYw0KPiArQEAgLTE4NTcsNiArMTg1NywxMSBAQCBjb25maWdfaW5pdF9ob21lKF9QeUNvcmVD
b25maWcgKmNvbmZpZykNCj4gKyAgICAgfQ0KPiArIA0KPiArICAgICBpbnQgcmVzID0gY29uZmln
X2dldF9lbnZfdmFyX2R1cCgmaG9tZSwgTCJQWVRIT05IT01FIiwgDQo+ICsgIlBZVEhPTkhPTUUi
KTsNCj4gKysNCj4gKysgICAgY29uc3QgY2hhciAqb2VweXRob24zaG9tZSA9IGNvbmZpZ19nZXRf
ZW52X3ZhcigiT0VQWVRIT04zSE9NRSIpOw0KPiArKyAgICBpZiAob2VweXRob24zaG9tZSkgew0K
PiArKyAgICAgICAgcmVzID0gY29uZmlnX2dldF9lbnZfdmFyX2R1cCgmaG9tZSwgTCJPRVBZVEhP
TjNIT01FIiwgIk9FUFlUSE9OM0hPTUUiKTsNCj4gKysgICAgfQ0KPiArICAgICBpZiAocmVzIDwg
MCkgew0KPiArICAgICAgICAgcmV0dXJuIERFQ09ERV9MT0NBTEVfRVJSKCJQWVRIT05IT01FIiwg
cmVzKTsNCj4gKyAgICAgfQ0KPiArLS0NCj4gKzIuNy40DQoNCkkgdGhpbmsgdGhlIGFib3ZlIHdp
bGwgbGVhayBtZW1vcnkuDQoNCkluc3RlYWQgSSB0aGluayB0aGUgY29kZSBzaG91bGQgYmUgc29t
ZXRoaW5nIGxpa2U6DQoNCmludCByZXM7DQpjb25zdCBjaGFyICpvZXB5dGhvbjNob21lID0gY29u
ZmlnX2dldF9lbnZfdmFyKCJPRVBZVEhPTjNIT01FIik7DQppZiAob2VweXRob24zaG9tZSkgew0K
ICAgIHJlcyA9IGNvbmZpZ19nZXRfZW52X3Zhcl9kdXAoJmhvbWUsIEwiT0VQWVRIT04zSE9NRSIs
ICJPRVBZVEhPTjNIT01FIik7DQogICAgaWYgKHJlcyA8IDApDQogICAgICAgIHJldHVybiBERUNP
REVfTE9DQUxFX0VSUigiT0VQWVRIT04zSE9NRSIsIHJlcyk7IH0gZWxzZSB7DQogICAgcmVzID0g
Y29uZmlnX2dldF9lbnZfdmFyX2R1cCgmaG9tZSwgTCJQWVRIT05IT01FIiwgIlBZVEhPTkhPTUUi
KTsNCiAgICBpZiAocmVzIDwgMCkNCiAgICAgICAgcmV0dXJuIERFQ09ERV9MT0NBTEVfRVJSKCJQ
WVRIT05IT01FIiwgcmVzKTsgfQ0KDQphbmQgdGhlbiBhIGNvcHkgb2YgUFlUSE9OSE9NRSBpc24n
dCBjcmVhdGVkIGluIHRoZSBPRVBZVEhPTjNIT01FIGNhc2UuDQoNCkNoZWVycywNCg0KUmljaGFy
ZA0KDQo=

