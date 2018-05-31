Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 1330 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 31 May 2018 02:01:15 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0050.outbound.protection.outlook.com [104.47.36.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0B6E16003C;
	Thu, 31 May 2018 02:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=R9QGyCRkycePH8+ATCd26g3OaiLmFNquxa4vtbBXlCk=;
	b=pslsCXXwkXzsJSRbtxASSzewdNSLuU0NqVox60jNm47BsdvoVs7D39t1yz1fzq4mxVMXArTrWZMjjwAeM0Hjpij9umEZjkuyMhLuPZP2Pqh2fVZtBbG7reVk8PiL5M9GjKOt9pxyQOgVYc3uhW4HQ8HUiG0Q1Xv5bFD84eKQhiY=
Received: from DM5PR02MB3863.namprd02.prod.outlook.com (52.132.139.146) by
	DM5PR02MB2635.namprd02.prod.outlook.com (10.168.196.13) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.797.11; Thu, 31 May 2018 01:24:25 +0000
Received: from DM5PR02MB3863.namprd02.prod.outlook.com
	([fe80::a980:cb7c:becd:294]) by DM5PR02MB3863.namprd02.prod.outlook.com
	([fe80::a980:cb7c:becd:294%5]) with mapi id 15.20.0820.010;
	Thu, 31 May 2018 01:24:25 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: akuster808 <akuster808@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>, "Patches and discussions about
	the oe-core layer" <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] meta-openembedded maintainer ship change.
Thread-Index: AQHT8eNGBO1ZHlUebEu4X29S3XlotKRJGEnw
Date: Thu, 31 May 2018 01:24:25 +0000
Message-ID: <DM5PR02MB38638BEF1BA449483FD4E6C8B9630@DM5PR02MB3863.namprd02.prod.outlook.com>
References: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
In-Reply-To: <fc0d7e3b-9d0c-7ea3-1caf-ad3099f40099@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR02MB2635;
	7:e/FsRkr/FRYBsaT/YPWnPYir/BOl6OZKmH2cZxdBxmJ2hBTrAwUIXyISy7cJzgtgUHooaHD6nDM4P9u+yMGfiTdwdql8CNtp8pw9n9qKmL5WFoiRjgTWt4yhU1zHere0o1bIoZiUa8EloL3fhdCia/DHHJ6sffBkBLhtZhPAfL41TYgHyGnOR+DxBVE6W5DPLLvYy0tlV0v9G6+yiKul0zLrgxukbPbUvM9/xkwcHhLRvH4OhhFZ02Fi41vRdLtT;
	23:tEBsCGwsyEnq2vonnSzPPwglCfDaO7qPhWFubzap+T4DiiEb328zCxVrw5DVjS+dEdc+2hxtP+uqz1XVVdenYHWCLmLuG6P3T+7MO9atei12XqDk3oXlXwhDW4F/+jq6i4SLKtbbDy/5sVDphibhBw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR02MB2635; 
X-MS-TrafficTypeDiagnostic: DM5PR02MB2635:|DM5PR02MB2635:
x-microsoft-antispam-prvs: <DM5PR02MB2635A8C55061B3D2F11386F6B9630@DM5PR02MB2635.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR02MB2635; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB2635; 
x-forefront-prvs: 06891E23FB
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39380400002)(39860400002)(366004)(346002)(376002)(396003)(53754006)(51914003)(13464003)(199004)(189003)(476003)(6306002)(53936002)(97736004)(305945005)(5660300001)(7736002)(3660700001)(11346002)(8936002)(6506007)(33656002)(53546011)(446003)(26005)(5250100002)(68736007)(39060400002)(25786009)(55016002)(316002)(81166006)(81156014)(8676002)(110136005)(6246003)(486006)(6436002)(2900100001)(7696005)(9686003)(14454004)(105586002)(106356001)(478600001)(102836004)(229853002)(2906002)(3280700002)(1720100001)(186003)(99286004)(74316002)(76176011)(86362001)(72206003)(6116002)(966005)(66066001)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2635;
	H:DM5PR02MB3863.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: FpMee4x5/XRDgBkiraKgGQPwgQZEkhYBYGltOTz7xXUJdX5B0+3Q+/hZrSzKnJ6Q6/OiupNWdGQUVaYOLsTt2biZbhUOFNTFWI+VmOtHL1TxqyOi4Y9MKH5l2KINXGRlU6FSUidceXXX1rE87owD5XrvBIlskaSDGUTLzA64PjEvvF6p1tSBSiOAuilSeSr6
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 18793937-17d0-4034-1395-08d5c6953f31
X-MS-Exchange-CrossTenant-Network-Message-Id: 18793937-17d0-4034-1395-08d5c6953f31
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2018 01:24:25.4619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2635
X-OriginatorOrg: xilinx.com
Subject: Re: meta-openembedded maintainer ship change.
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
X-List-Received-Date: Thu, 31 May 2018 02:01:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIEFybWluIGZvciBhbGwgdGhlIHdvcmsuDQpUaGFua3MgS2hlbQ0KDQotTWFuanUNCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gW21haWx0bzpvcGVuZW1iZWRkZWQtY29y
ZS1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZg0KPiBha3VzdGVy
ODA4DQo+IFNlbnQ6IFR1ZXNkYXksIE1heSAyMiwgMjAxOCA4OjQxIEFNDQo+IFRvOiBPcGVuRW1i
ZWRkZWQgRGV2ZWwgTGlzdCA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+Ow0KPiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllciA8
b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6
IFtPRS1jb3JlXSBtZXRhLW9wZW5lbWJlZGRlZCBtYWludGFpbmVyIHNoaXAgY2hhbmdlLg0KPiAN
Cj4gSGVsbG8gYWxsLA0KPiANCj4gQWZ0ZXIgbXVjaCB0aG91Z2h0LCBJIGhhdmUgZGVjaWRlZCB0
byBzdGVwIGF3YXkgZnJvbSBiZWluZyB0aGUgbWV0YS0NCj4gb3BlbmVtYmVkZGVkIG1haW50YWlu
ZXIsIHBhdGNoIHdyYW5nbGVyIGFuZCBidWlsZGVyLsKgIEtoZW0gUmFqIGhhcyBraW5kbHkNCj4g
c3RlcHBlZCB1cCB0byBjb250aW51ZSB0aGVzZSBhY3Rpdml0aWVzLiBNYWludGFpbmluZyB0aGlz
IHdhcyBjb25zdW1pbmcgdG9vIG11Y2gNCj4gb2YgbXkgZnJlZSB0aW1lIGFuZCBJIG5lZWQgdG8g
Zm9jdXMgb24gb3RoZXIgdGhpbmdzIGluIHRoZSBjb21tdW5pdHkuDQo+IA0KPiBUaGFua3MgZm9y
IHRoZSBvcHBvcnR1bml0eSB0byBoYXZlIHNlcnZlZCB5b3UuDQo+IA0KPiBLaW5kIHJlZ2FyZHMs
DQo+IA0KPiBBcm1pbg0KPiANCj4gDQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdA0K
PiBPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWNvcmUNCg==

