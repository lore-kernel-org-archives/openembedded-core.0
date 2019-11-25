Return-Path: <ernst.sjostrand@verisure.com>
Received: from mx08-00271601.pphosted.com (mx07-00271601.pphosted.com
	[91.207.212.217])
	by mail.openembedded.org (Postfix) with ESMTP id 43AE57BEDF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 05:41:47 +0000 (UTC)
Received: from pps.filterd (m0107397.ppops.net [127.0.0.1])
	by mx08-00271601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	xAP5XreV026614; Mon, 25 Nov 2019 06:41:44 +0100
Received: from eur03-ve1-obe.outbound.protection.outlook.com
	(mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56])
	by mx08-00271601.pphosted.com with ESMTP id 2wete59pqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 25 Nov 2019 06:41:43 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=RJebdMM5Va4vDhylLx2fGO0xT0c9z1iKriuxhb1dp4yvcPbFVQsl9dPaeuoNSJpiFQ6EOrPQoE5YgFINkt/gfXcRhctGxK6TSs0lFxM5hWmwhYOb054B3mFswERyt0l4lu39p6H4N0nEPud645Uq2mJG0KY2BR8es6eXMaqD2TDUY+g0i93i3txQJ+0U8mE9hCWRcwFihOOQqU5WdOgD+uzI1bNiIdPLs+5uwBSMtBwVNBpiwz+nHCUvsj92dTJisUFJCjtjlWjK1NzE8OwhWdjsDWpbH+0GUKDWGaCPozbRZyvclPUKxkDwU6KHFttW890v4txflMuswwYcxMyA/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kNB0wjd2UiNLM/zuFZlzD5Gd/kuw1PwjoHg7Jhrigww=;
	b=hb1pJLwlPg0sF4w+CxGj3PUGrUAqteHUl/SLVHqO4nOgRI5mXzhB7NWLY0hhOqjAXQAaGmDVkcarKc1qaxGLRz+/DaAKHZRE7L/9eayGwSj45yPVk3lQeVhWhm50cE6eRrMmd8NoYxgvrBRF9bh0ezODX97ubOXfoEs4jYGwZcUV4s1UGhK5hKCNLxOStQsek1M3T4pbH1Z1lb/shW9ueYSW/znhluaNzV4j4pAJnv5RD8ipT6bOkRKRsaYXLOTv4KiZS5Mssza3PR2PgM6ZkXUGUPu0V8eWrRnpL6Qmyluv/5DUYVAjcYd5pAHDymBY6mdNGgd09FXsDNuMAfWNGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=verisure.com;
	dmarc=pass action=none header.from=verisure.com; 
	dkim=pass header.d=verisure.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=verisure.onmicrosoft.com; s=selector1-verisure-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kNB0wjd2UiNLM/zuFZlzD5Gd/kuw1PwjoHg7Jhrigww=;
	b=KXYYJ2pQpXXYKbPnWhEIoSTtkowgcYJUePbNDSTMSMRMIvsl+fjywkBUKUvbAJ1/vaR2f1VrI7QZtoyFfdQSp0DEfArSq9/hu2nfVpNlNDLw81Kzku6IQYWg5Wjb91wf9rQOtGyIEyw55HmbB7lydtlnux+73YSOX8iey/Ox2YA=
Received: from HE1PR10MB1561.EURPRD10.PROD.OUTLOOK.COM (10.160.67.26) by
	HE1PR10MB1546.EURPRD10.PROD.OUTLOOK.COM (10.160.69.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.21; Mon, 25 Nov 2019 05:41:41 +0000
Received: from HE1PR10MB1561.EURPRD10.PROD.OUTLOOK.COM
	([fe80::b4e8:3a31:77c6:c2e5]) by
	HE1PR10MB1561.EURPRD10.PROD.OUTLOOK.COM
	([fe80::b4e8:3a31:77c6:c2e5%5]) with mapi id 15.20.2474.023;
	Mon, 25 Nov 2019 05:41:41 +0000
From: =?utf-8?B?RXJuc3QgU2rDtnN0cmFuZA==?= <ernst.sjostrand@verisure.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ross.burton@intel.com"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v2] do_image_cpio: Improve reproducibility
Thread-Index: AQHVo1MD7RilpnS2hEuPHwoJ0wp+IQ==
Date: Mon, 25 Nov 2019 05:41:41 +0000
Message-ID: <30d53936d361eb22e1fa1cca3d6380dbce80eabf.camel@verisure.com>
References: <ea9c1aec639f2c505e8beb3faa7366ee7db4174a.camel@verisure.com>
	<6fedce54-e7dd-71bd-dd0d-96fc542664ce@intel.com>
	<AM0PR10MB20990993BB2A1B1EF84C7C8B944D0@AM0PR10MB2099.EURPRD10.PROD.OUTLOOK.COM>
	<ae0d48cd-535e-d0de-b388-66605947cc91@intel.com>
In-Reply-To: <ae0d48cd-535e-d0de-b388-66605947cc91@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [62.13.16.210]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2a75a07-cf1e-4561-e445-08d7716a2605
x-ms-traffictypediagnostic: HE1PR10MB1546:
x-microsoft-antispam-prvs: <HE1PR10MB1546B34056312C190F8F30C1944A0@HE1PR10MB1546.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(256004)(36756003)(8676002)(14444005)(102836004)(6116002)(2906002)(316002)(6512007)(25786009)(85182001)(7736002)(2501003)(229853002)(26005)(71190400001)(71200400001)(446003)(99286004)(11346002)(76176011)(6506007)(305945005)(64756008)(66446008)(478600001)(66066001)(2616005)(8936002)(186003)(110136005)(81156014)(6436002)(6246003)(81166006)(14454004)(66946007)(86362001)(3846002)(6486002)(118296001)(85202003)(66556008)(66476007)(76116006)(91956017)(66574012)(5660300002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR10MB1546;
	H:HE1PR10MB1561.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: verisure.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E/qWWo+kfKu6aVMH0SNbChd/xdIaV879b7iVTJjhrSyfH4ZdKjh9IO5NFv2rf4/8pGWywoTqvRvHIe+tJmsEBqO8FnKLisMnS6CLFmch7uE5QhVs72BiPn3XKuzDDKbkA0oS4vas6zNAmHG5VQdlhm8H7w6ap3YE9d5WgOQSbuvqiupwOArWikzDJbu5YFUnebOaxA7yq/LunQFi7uX7dfj8jhP6niqyAm1a3X+fAF/YTQYB83zcGLPUghTlWLWbXJZT1F251us9Iv4WihNeRQTdzPua+FrUbU0wbZ9ptu9o1UrZ1tO+7UJWF4Vz8deL0yXtE0HH/TAw4IpWAENKQBeWjiAr/cd4u3/ua+Pci7sLF/za9eKJhGtpPE7p2Ou1WCr8wGqnZtdb5TI3vQ+OwWzmyNeMTAM13eO9T9Li2m12y1WFO+LTsKmYLuQsGFnU
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: verisure.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a75a07-cf1e-4561-e445-08d7716a2605
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 05:41:41.2558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3055fa7f-a944-4927-801e-a62b63119e43
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b8tMkdrwQJiGdCcBKZRz167BxaM+LtgpwOVBFMmAS+5FDx6PZvDYbZbFm8/EtvTpdEFoFyej+OLIkqu9nXqNjdjFxgpFpRlHU1hqg+aDN4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR10MB1546
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
	definitions=2019-11-24_04:2019-11-21,2019-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	bulkscore=0 adultscore=0
	spamscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
	lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
	phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-1910280000 definitions=main-1911250050
Subject: Re: [PATCH v2] do_image_cpio: Improve reproducibility
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
X-List-Received-Date: Mon, 25 Nov 2019 05:41:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <969B5B807793BF4395972A00DBF85D43@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

RmluZCBsaXN0cyBmaWxlcyBpbiB0aGUgb3JkZXIgdGhhdCB0aGUgZmlsZXN5c3RlbSBoYXMgcmVn
aXN0ZXJlZCB0aGVtLA0Kd2hpY2ggY2FuIHZhcnkuIEFkZGluZyBhIHNvcnQgc2hvdWxkIGhhdmUg
bWluaW1hbCBwZXJmb3JtYW5jZSBpbXBhY3QuDQpBbHNvIHVzZSB0aGUgLS1yZXByb2R1Y2libGUg
b3B0aW9uIHRvIGNwaW8uDQoNClNpZ25lZC1vZmYtYnk6IEVybnN0IFNqw7ZzdHJhbmQgPGVybnN0
LnNqb3N0cmFuZEB2ZXJpc3VyZS5jb20+DQotLS0NCg0KVHJ5aW5nIGFnYWluLCBsb29rcyBsaWtl
IHRhYnMgd2VyZSBjb252ZXJ0ZWQgdG8gc3BhY2VzIHRoZSBmaXJzdCB0aW1lLg0KDQogbWV0YS9j
bGFzc2VzL2ltYWdlX3R5cGVzLmJiY2xhc3MgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMvaW1h
Z2VfdHlwZXMuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9pbWFnZV90eXBlcy5iYmNsYXNzDQppbmRl
eCAyZWVmZmJiMzY2Li5jN2FmODg5MDc1IDEwMDY0NA0KLS0tIGEvbWV0YS9jbGFzc2VzL2ltYWdl
X3R5cGVzLmJiY2xhc3MNCisrKyBiL21ldGEvY2xhc3Nlcy9pbWFnZV90eXBlcy5iYmNsYXNzDQpA
QCAtMTI4LDcgKzEyOCw3IEBAIElNQUdFX0NNRF90YXIgPSAiJHtJTUFHRV9DTURfVEFSfSAtLW51
bWVyaWMtb3duZXIgLWNmICR7SU1HREVQTE9ZRElSfS8ke0lNQUdFX05BDQogDQogZG9faW1hZ2Vf
Y3Bpb1tjbGVhbmRpcnNdICs9ICIke1dPUktESVJ9L2NwaW9fYXBwZW5kIg0KIElNQUdFX0NNRF9j
cGlvICgpIHsNCi0JKGNkICR7SU1BR0VfUk9PVEZTfSAmJiBmaW5kIC4gfCBjcGlvIC1vIC1IIG5l
d2MgPiR7SU1HREVQTE9ZRElSfS8ke0lNQUdFX05BTUV9JHtJTUFHRV9OQU1FX1NVRkZJWH0uY3Bp
bykNCisJKGNkICR7SU1BR0VfUk9PVEZTfSAmJiBmaW5kIC4gfCBzb3J0IHwgY3BpbyAtLXJlcHJv
ZHVjaWJsZSAtbyAtSCBuZXdjID4ke0lNR0RFUExPWURJUn0vJHtJTUFHRV9OQU1FfSR7SU1BR0Vf
TkFNRV9TVUZGSVh9LmNwaW8pDQogCSMgV2Ugb25seSBuZWVkIHRoZSAvaW5pdCBzeW1saW5rIGlm
IHdlJ3JlIGJ1aWxkaW5nIHRoZSByZWFsDQogCSMgaW1hZ2UuIFRoZSAtZGJnIGltYWdlIGRvZXNu
J3QgbmVlZCBpdCEgQnkgYmVpbmcgY2xldmVyDQogCSMgYWJvdXQgdGhpcyB3ZSBhbHNvIGF2b2lk
ICd0b3VjaCcgYmVsb3cgZmFpbGluZywgYXMgaXQNCi0tIA0KMi4yNC4wDQoNCg==

