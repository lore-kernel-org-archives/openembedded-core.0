Return-Path: <prvs=5002f761b2=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 87AED7D735
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 20:48:22 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x39KkND9010155; Tue, 9 Apr 2019 15:48:23 -0500
Received: from nam02-cy1-obe.outbound.protection.outlook.com
	(mail-cys01nam02lp2055.outbound.protection.outlook.com
	[104.47.37.55])
	by mx0a-00010702.pphosted.com with ESMTP id 2rrhm9bhq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2019 15:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=n6dzMTGn8Wao8ukFllDCJnN0FMt2puKK5xVdrZ8VktE=;
	b=BFBCUM2TLp+Ny+EKEV2J87fiuEzBF989/vxPMa3+1VHnkmRuetbSpEKpCk4rR5R5rLDSNZLUQHZA3bjpRfNeOs1I7ExPfT+b4MgrAjxwEjHzVh9oRatrlzBkQ3mKdJHSLTuJDQKrvYwQ/dAfWcB2+VmZ2tX688Gv7YNpJpL9GSQ=
Received: from SN6PR04MB4221.namprd04.prod.outlook.com (52.135.71.147) by
	SN6PR04MB5424.namprd04.prod.outlook.com (20.177.254.32) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.19; Tue, 9 Apr 2019 20:48:20 +0000
Received: from SN6PR04MB4221.namprd04.prod.outlook.com
	([fe80::c4cc:7e6c:e9c2:da0b]) by
	SN6PR04MB4221.namprd04.prod.outlook.com
	([fe80::c4cc:7e6c:e9c2:da0b%2]) with mapi id 15.20.1771.016;
	Tue, 9 Apr 2019 20:48:20 +0000
From: Alejandro Del Castillo <alejandro.delcastillo@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [EXTERNAL] Re: [OE-core] [PATCH] opkg: add ptest
Thread-Index: AQHU7izRJJ44pcE7Z0eer4E3u0wev6Yyo+uAgAGq1wA=
Date: Tue, 9 Apr 2019 20:48:19 +0000
Message-ID: <7eddd92f-bb0c-ae68-a4c5-9db558897eb7@ni.com>
References: <20190408170152.13583-1-alejandro.delcastillo@ni.com>
	<CAJTo0Lb=jVx++oA6GAdF3-ARSkZb=grkZ8r3Urx-a9btTBvK=g@mail.gmail.com>
In-Reply-To: <CAJTo0Lb=jVx++oA6GAdF3-ARSkZb=grkZ8r3Urx-a9btTBvK=g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN1PR12CA0066.namprd12.prod.outlook.com
	(2603:10b6:802:20::37) To SN6PR04MB4221.namprd04.prod.outlook.com
	(2603:10b6:805:30::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [130.164.62.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 275039c5-eb01-45c8-d131-08d6bd2cb1be
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
	SRVR:SN6PR04MB5424; 
x-ms-traffictypediagnostic: SN6PR04MB5424:
x-microsoft-antispam-prvs: <SN6PR04MB54246363319633133E685F78862D0@SN6PR04MB5424.namprd04.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(396003)(136003)(366004)(39860400002)(376002)(199004)(189003)(36756003)(11346002)(5660300002)(446003)(71200400001)(478600001)(71190400001)(4326008)(6246003)(99286004)(53936002)(86362001)(66066001)(31696002)(14454004)(52116002)(256004)(476003)(486006)(2616005)(6116002)(31686004)(106356001)(97736004)(53546011)(3846002)(386003)(186003)(105586002)(7736002)(6506007)(81156014)(6916009)(68736007)(6436002)(76176011)(316002)(6486002)(8936002)(229853002)(81166006)(6512007)(102836004)(8676002)(26005)(4744005)(2906002)(305945005)(25786009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB5424;
	H:SN6PR04MB4221.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:3; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xtDAIPA33fI3RiDfQc19vg6pmY824N/hz/P4eWPSa4KfMGKTueJqtPEph/Re7rkG9jnpZNUjrvjlxCqkVfLoTFVgRIoNVDn1wuBf/9rBuOJI/v84bTtmqrZrWiicHapGO9cs7h0GjocxuPpJg1oyhmTBM0rHlUD/hy7RPsa4mvR2HV3y7Tp+XKfZK28JlvXzdADKF5ifxb6GGCW0OfKucsRszBtacCOFQNBq0LNSJ8reXrzqYQDOJKAsKf1+6WuKQbVTsrBy54QizwbdzVQWYAIA4qmPlF2gd9ZXDa/y1lf/O9u5wFQ/unMkVyMbSQ56GStzpldrFs8FkSZnCsP0OeMRL/E4pJQfPOjb4yMR5UvDmhreJCiCo1W7dUJ44FK/mnh0TE5/uIerFzh60V0ElOiPvJ7Gp74VW82SHGwLv6Y=
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 275039c5-eb01-45c8-d131-08d6bd2cb1be
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 20:48:19.8951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5424
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-04-09_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1904090130
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg: add ptest
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
X-List-Received-Date: Tue, 09 Apr 2019 20:48:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FAF83C4977F604FB21BF77008EEAE54@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

DQoNCk9uIDQvOC8xOSAyOjIwIFBNLCBCdXJ0b24sIFJvc3Mgd3JvdGU6DQo+IE9uIE1vbiwgOCBB
cHIgMjAxOSBhdCAyMDowMywgQWxlamFuZHJvIGRlbCBDYXN0aWxsbw0KPiA8YWxlamFuZHJvLmRl
bGNhc3RpbGxvQG5pLmNvbT4gd3JvdGU6DQo+PiArZG9faW5zdGFsbF9wdGVzdCgpIHsNCj4+ICsg
ICAgICAgaW5zdGFsbCAtZCAke0R9JHtQVEVTVF9QQVRIfQ0KPj4gKyAgICAgICBpbnN0YWxsIC1t
IDc1NSAke1dPUktESVJ9L3J1bi1wdGVzdCAke0R9LyR7UFRFU1RfUEFUSH0vcnVuLXB0ZXN0DQo+
PiArICAgICAgIGluc3RhbGwgLW0gNzU1ICR7Qn0vTWFrZWZpbGUgJHtEfSR7UFRFU1RfUEFUSH0v
TWFrZWZpbGUNCj4+ICsgICAgICAgc2VkIC1pIC1lICdzLF5NYWtlZmlsZTosX01ha2VmaWxlOiwn
ICR7RH0vJHtQVEVTVF9QQVRIfS9NYWtlZmlsZQ0KPj4gKyAgICAgICBjcCAtciAke1N9L3Rlc3Rz
ICR7RH0ke1BURVNUX1BBVEh9DQo+PiArICAgICAgIHNlZCAtaSAtZSAncyxeb3BrZ2NsID0gb3Mu
cGF0aC5yZWFscGF0aCgiLi4vc3JjL29wa2ciKSxvcGtnY2w9IiR7YmluZGlyfS9vcGtnIiwnICR7
RH0vJHtQVEVTVF9QQVRIfS90ZXN0cy9jZmcucHkNCj4+ICt9DQo+IA0KPiBZb3UncmUgdGhlIG1h
aW50YWluZXIgb2Ygb3BrZywganVzdCBhZGQgYW4gaW5zdGFsbCB0YXJnZXQgZm9yIHRoZSB0ZXN0
IHN1aXRlIDspDQoNCkF0IGZpcnN0IGdsYW5jZSwgaXQgbG9va2VkIGEgYml0IG9kZCB0byBhZGQg
YSBwdGVzdCBzcGVjaWZpYyB0YXJnZXQgDQooaW5zdGFsbC1wdGVzdCkgdG8gb3BrZy4gQnV0IEkg
Y2FuIHNlZSBvdGhlciBjb21wb25lbnRzIGRvIHRoYXQgKGdkYm0sIA0KbGlieG1sKS4gQW5kIGdp
dmUgdGhhdCBvcGtnIHByaW1hcnkgY2xpZW50IGlzIE9FLCB0aGVuIGl0IHNob3VsZCBiZSBPSy4g
DQpJJ2xsIGFkZCB0aGUgaW5zdGFsbC1wdGVzdCB0byBvcGtnIGFuZCB3aWxsIHNlbmQgYSB2MiBz
b29uLg0KDQotLSANCkNoZWVycywNCg0KQWxlamFuZHJvDQo=

