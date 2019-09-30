Return-Path: <acj@cisco.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 Sep 2019 16:32:49 UTC
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
	by mail.openembedded.org (Postfix) with ESMTP id E4F1060017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 16:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=10990; q=dns/txt;
	s=iport; t=1569861171; x=1571070771;
	h=from:to:cc:subject:date:message-id:content-id:
	content-transfer-encoding:mime-version;
	bh=9Lii+IQOcZ0PRV0u4MfqvX8z74NLstjpBJesWWS8nxI=;
	b=e49VDe4zi0F+5HyzZR/OUIUvW7IzbPuBJuQFkV5WjSkoEeSJ83LE/o9i
	qsOh7FGlz/DyuBYg54MI2BigI15zmtIl77tT6WBKVUwPWfro1bwdMRwIT
	Z7/VTXgP4lIHG+zBZWXYBsuP2+5SEo0/bGXreBpP55t/aOKagjA+nY2pN Y=;
IronPort-PHdr: =?us-ascii?q?9a23=3AQF1fkhyia8RL57rXCy+N+z0EezQntrPoPwUc9p?=
	=?us-ascii?q?sgjfdUf7+++4j5YRCN/u1j2VnOW4iTq+lJjebbqejBYSQB+t7A+GsHbIQKUh?=
	=?us-ascii?q?YEjcsMmAl1CcWHIUb6N/XtKSc9GZcKWQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AMAACfK5Jd/5xdJa1mGgEBAQEBAgE?=
	=?us-ascii?q?BAQEMAgEBAQGBUwUBAQEBCwGBSiknA21WIAQLKoQig0cDhFKGCBqBWkOIU49?=
	=?us-ascii?q?IgS6BJANUCQEBAQwBASUIAgEBhEAZgywjNAkOAgMJAQEEAQEBAgEFBG2FLQE?=
	=?us-ascii?q?LhUsBAgEVEQQNDAEBCQEtAREBGQMBAgMCFBICBDAVCAoEDgUJGYMAAYFqAx0?=
	=?us-ascii?q?BAgyiYAKBOIgRGzV1fzOCfQEBBYEBATIBgRSCOBiCFwkUeCgBiBqDcxiBQD+?=
	=?us-ascii?q?BEScME4MKgQR1ITwLBBiBMQIrOII+MoImj2WFUYcbkFIKgiKHBY4GG4Mplg0?=
	=?us-ascii?q?LjhaIGIR7ZosmAgQCBAUCDgEBBYFSOYFYcBVlAYINATMJRxAUgU8MAQsLgQQ?=
	=?us-ascii?q?BB4JEM4IDgl6FP3QBAQiBH40mI4IwAQE?=
X-IronPort-AV: E=Sophos;i="5.64,567,1559520000"; d="scan'208";a="639606484"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
	by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	30 Sep 2019 16:25:44 +0000
Received: from XCH-ALN-018.cisco.com (xch-aln-018.cisco.com [173.36.7.28])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id x8UGPhoA016454
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 16:25:44 GMT
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by XCH-ALN-018.cisco.com
	(173.36.7.28) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 30 Sep 2019 11:25:43 -0500
Received: from xhs-aln-001.cisco.com (173.37.135.118) by xhs-rtp-001.cisco.com
	(64.101.210.228) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Mon, 30 Sep 2019 12:25:42 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (173.37.151.57)
	by xhs-aln-001.cisco.com (173.37.135.118) with Microsoft SMTP Server
	(TLS) id
	15.0.1473.3 via Frontend Transport; Mon, 30 Sep 2019 11:25:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=VX3txedU/uli3U9NQdk4jInG1p5fuAEnDUv3xsTCzdCTCUJTrgREa3XOwW/DU0fCccjKOLvJvaZiDCtoVyclCvd8jNPBYGjRUOai6oNNIt1K6tlCjPfd7+opDL/DMFWAMILDZwBx/SOQwfgnrBCv6g2AiXGChpPj6QYFKjjP5Zk+jtQerc6JTLwmmQFP8OrMnmM27kePY3MJVuJhKvmorcA99w65i3vUfhZ4auMbZViY8HqHvFarj2eB2mhxTNp03PdL3W5Il2guN85Gj2DGglSczIJinriYhjBDUwjku13y5Cna5v5JQuhv7UvHFA+RYQOAzmLQbwCA9cNR6bkYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9Lii+IQOcZ0PRV0u4MfqvX8z74NLstjpBJesWWS8nxI=;
	b=YHa4YtJ72v467D1t3QP64+cK34zUCzVFIGXW14Jd689BhVP68Dh4Keu1H5zSKLnqJM4up1mkRmcJCZDu5cHUFANqsYXFAu9/NrJSlLRbP+Naooda6t+G5EX4969mh7irCUG0MkTAEqBmnfwmnmEb3eXbXozNqkKsbsNRV1lK+V1VlP5HeDid7cmCiHYRYH7Y7x4o58MZwrjnViEGkLIgeSj3S22FpygWrfAtzv5bH+npLumuZ6Wru9EJFK2Qt4WD5ehlwD3bk90fbjllr0wv3Zu7+rFjbm5s+uAn9/4FKv4AcCUx1zlYIy8WjpsmwSQo8BuDZk0Iec29oSyjrfuBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com; 
	dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
	s=selector2-cisco-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9Lii+IQOcZ0PRV0u4MfqvX8z74NLstjpBJesWWS8nxI=;
	b=uNoBS88/3e5Vj0+xXEUlYXE5U8lSOrPRtnVKjej9i4NFswnG+mN+k2UvO5KKMNk4aQQL7wkpmMSAvSr8WcdBrhIZFD8n3PCsfS9aLIIKdNVTMOZckzvk4rTeGJ7+QdeVlyAvTfBF9P9AWMWgexCBBgadmsaCLQv9zZ+K3sgxY2c=
Received: from MN2PR11MB3648.namprd11.prod.outlook.com (20.178.252.15) by
	MN2PR11MB4477.namprd11.prod.outlook.com (52.135.36.93) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.20; Mon, 30 Sep 2019 16:25:40 +0000
Received: from MN2PR11MB3648.namprd11.prod.outlook.com
	([fe80::b849:cf67:f9b6:7e40]) by
	MN2PR11MB3648.namprd11.prod.outlook.com
	([fe80::b849:cf67:f9b6:7e40%2]) with mapi id 15.20.2305.017;
	Mon, 30 Sep 2019 16:25:40 +0000
From: "Aviraj Cj (acj)" <acj@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [thud] wget: Security fixes CVE-2018-20483
Thread-Index: AQHVd6uyBs1LVbUQ10KErG1vygqVzg==
Date: Mon, 30 Sep 2019 16:25:39 +0000
Message-ID: <B97A6E61-CA0E-4405-AF51-BAAC99232E26@cisco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.1d.0.190908
authentication-results: spf=none (sender IP is ) smtp.mailfrom=acj@cisco.com; 
x-originating-ip: [2001:420:c0e0:1002::f3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73748443-7c59-4c70-b9f8-08d745c2d559
x-ms-traffictypediagnostic: MN2PR11MB4477:
x-ms-exchange-purlcount: 5
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB44775DD25F2E3712152E3F04A8820@MN2PR11MB4477.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(199004)(189003)(4326008)(2351001)(2501003)(36756003)(6486002)(5640700003)(86362001)(6436002)(305945005)(46003)(71190400001)(256004)(7736002)(6916009)(14444005)(71200400001)(6512007)(107886003)(6306002)(5660300002)(81166006)(81156014)(8676002)(15650500001)(2420400007)(33656002)(478600001)(6116002)(58126008)(64756008)(316002)(2906002)(7110500001)(6506007)(14454004)(186003)(102836004)(966005)(99286004)(476003)(486006)(76116006)(91956017)(66946007)(25786009)(8936002)(66446008)(66556008)(66476007)(2616005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4477;
	H:MN2PR11MB3648.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JseiRZFnqsOqPtYNQG/NpXOyvjYUnhSu4yLI+DK/B1FnHPerLeDBzv+cmNWRtQi/S5J4/JAsA2NVOBYgjQwhKpmyXMe0xodcEe0fYxIoGh8zpqYTL35Grua2WYJdUQD0No7g38VmWoZJ+eXAjiLMaW26Lcywmp1V917wNJID/Fkp3HFXaPKh4DV+ZROi9B4w8O8PCRtA9RpOXveY2KefZdrRxIskkei/QxW132njutxxrl6yDSaxvS2YoLAtP5DstCollB+Xxba9FC6O2XiT/0yT1+gScgwimy8jC6WIi+601KjhCENSB8TJ5vID3Nu3by3JqAjvFWbMpRfR40T9dF4bHMLDm+P3+Voirum8vAAmLLReHaneIE7D6zIQCaXNj07tEmFZXSo/dOs880TprDweIGIji7K/4VGp8j0nFlhj5/HbgVj3n4RiHkz+igwx5o9sBT8qb/DgJAEV/0SPjw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 73748443-7c59-4c70-b9f8-08d745c2d559
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 16:25:39.9185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JbaAn5bHNwlAbbDIM1BBFQNiW4JJs8aKwbD+Z/X/0XJPTpkqfI+U66R0AFq8Tj6F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4477
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.28, xch-aln-018.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
Cc: "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
Subject: [thud] wget: Security fixes CVE-2018-20483
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
X-List-Received-Date: Mon, 30 Sep 2019 16:32:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <63084A5F2BAFC241A74D6F646735BE6F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

U291cmNlOiBodHRwOi8vZ2l0LnNhdmFubmFoLmdudS5vcmcvY2dpdC93Z2V0LmdpdC8NClR5cGU6
IFNlY3VyaXR5IEZpeA0KRGlzcG9zaXRpb246IEJhY2twb3J0IGZyb20gaHR0cDovL2dpdC5zYXZh
bm5haC5nbnUub3JnL2NnaXQvd2dldC5naXQvDQpEZXNjcmlwdGlvbjoNCkZpeGVzIENWRS0yMDE4
LTIwNDgzDQoNClNpZ25lZC1vZmYtYnk6IEF2aXJhaiBDSiA8YWNqQGNpc2NvLmNvbT4NCg0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXQvQ1ZFLTIwMTgtMjA0ODNf
cDEucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0L0NWRS0yMDE4LTIwNDgz
X3AxLnBhdGNoDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMC4uY2JjNGEx
MjdhOA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dl
dC9DVkUtMjAxOC0yMDQ4M19wMS5wYXRjaA0KQEAgLTAsMCArMSw3MyBAQA0KK0Zyb20gNmM1NDcx
ZTQ4MzRhZWJkNzM1OWQ4OGI3NjBiMDg3MTM2NDczYmFjOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDENCitGcm9tOiA9P1VURi04P3E/VGltPTIwUj1DMz1CQ2hzZW4/PSA8dGltLnJ1ZWhzZW5AZ214
LmRlPg0KK0RhdGU6IFdlZCwgMjYgRGVjIDIwMTggMTM6NTE6NDggKzAxMDANCitTdWJqZWN0OiBb
UEFUQ0ggMS8yXSBEb24ndCB1c2UgZXh0ZW5kZWQgYXR0cmlidXRlcyAoLS14YXR0cikgYnkgZGVm
YXVsdA0KKw0KKyogc3JjL2luaXQuYyAoZGVmYXVsdHMpOiBTZXQgZW5hYmxlX3hhdHRyIHRvIGZh
bHNlIGJ5IGRlZmF1bHQNCisqIHNyYy9tYWluLmMgKHByaW50X2hlbHApOiBSZXZlcnNlIG9wdGlv
biBsb2dpYyBvZiAtLXhhdHRyDQorKiBkb2Mvd2dldC50ZXhpOiBBZGQgZGVzY3JpcHRpb24gZm9y
IC0teGF0dHINCisNCitVc2VycyBtYXkgbm90IGJlIGF3YXJlIHRoYXQgdGhlIG9yaWdpbiBVUkwg
YW5kIFJlZmVyZXIgYXJlIHNhdmVkDQoraW5jbHVkaW5nIGNyZWRlbnRpYWxzLCBhbmQgcG9zc2li
bHkgYWNjZXNzIHRva2VucyB3aXRoaW4NCit0aGUgdXJscy4NCisNCitDVkU6IENWRS0yMDE4LTIw
NDgzIHBhdGNoIDENCitVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwOi8vZ2l0LnNhdmFu
bmFoLmdudS5vcmcvY2dpdC93Z2V0LmdpdC9jb21taXQvP2lkPWMxMjVkMjQ3NjI5NjJkOTEwNTBk
OTI1ZmJiZDllNmYzMGIyMzAyZjhdDQorU2lnbmVkLW9mZi1ieTogQXZpcmFqIENKIDxhY2pAY2lz
Y28uY29tPg0KKy0tLQ0KKyBkb2Mvd2dldC50ZXhpIHwgOCArKysrKysrKw0KKyBzcmMvaW5pdC5j
ICAgIHwgNCAtLS0tDQorIHNyYy9tYWluLmMgICAgfCAyICstDQorIDMgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KKw0KK2RpZmYgLS1naXQgYS9kb2Mvd2dl
dC50ZXhpIGIvZG9jL3dnZXQudGV4aQ0KK2luZGV4IGVhZjZiMzgwLi4zZjlkN2MxYyAxMDA2NDQN
CistLS0gYS9kb2Mvd2dldC50ZXhpDQorKysrIGIvZG9jL3dnZXQudGV4aQ0KK0BAIC01NDAsNiAr
NTQwLDE0IEBAIHJpZ2h0IE5VTUJFUi4NCisgU2V0IHByZWZlcnJlZCBsb2NhdGlvbiBmb3IgTWV0
YWxpbmsgcmVzb3VyY2VzLiBUaGlzIGhhcyBlZmZlY3QgaWYgbXVsdGlwbGUNCisgcmVzb3VyY2Vz
IHdpdGggc2FtZSBwcmlvcml0eSBhcmUgYXZhaWxhYmxlLg0KKyANCisrQGNpbmRleCB4YXR0cg0K
KytAaXRlbSAtLXhhdHRyDQorK0VuYWJsZSB1c2Ugb2YgZmlsZSBzeXN0ZW0ncyBleHRlbmRlZCBh
dHRyaWJ1dGVzIHRvIHNhdmUgdGhlDQorK29yaWdpbmFsIFVSTCBhbmQgdGhlIFJlZmVyZXIgSFRU
UCBoZWFkZXIgdmFsdWUgaWYgdXNlZC4NCisrDQorK0JlIGF3YXJlIHRoYXQgdGhlIFVSTCBtaWdo
dCBjb250YWluIHByaXZhdGUgaW5mb3JtYXRpb24gbGlrZQ0KKythY2Nlc3MgdG9rZW5zIG9yIGNy
ZWRlbnRpYWxzLg0KKysNCisgDQorIEBjaW5kZXggZm9yY2UgaHRtbA0KKyBAaXRlbSAtRg0KK2Rp
ZmYgLS1naXQgYS9zcmMvaW5pdC5jIGIvc3JjL2luaXQuYw0KK2luZGV4IGViODFhYjQ3Li44MDA5
NzBjNSAxMDA2NDQNCistLS0gYS9zcmMvaW5pdC5jDQorKysrIGIvc3JjL2luaXQuYw0KK0BAIC01
MDksMTEgKzUwOSw3IEBAIGRlZmF1bHRzICh2b2lkKQ0KKyAgIG9wdC5oc3RzID0gdHJ1ZTsNCisg
I2VuZGlmDQorIA0KKy0jaWZkZWYgRU5BQkxFX1hBVFRSDQorLSAgb3B0LmVuYWJsZV94YXR0ciA9
IHRydWU7DQorLSNlbHNlDQorICAgb3B0LmVuYWJsZV94YXR0ciA9IGZhbHNlOw0KKy0jZW5kaWYN
CisgfQ0KKyANCisgLyogUmV0dXJuIHRoZSB1c2VyJ3MgaG9tZSBkaXJlY3RvcnkgKHN0cmR1cC1l
ZCksIG9yIE5VTEwgaWYgbm9uZSBpcw0KK2RpZmYgLS1naXQgYS9zcmMvbWFpbi5jIGIvc3JjL21h
aW4uYw0KK2luZGV4IDgxZGI5MzE5Li42YWMxNjIxYiAxMDA2NDQNCistLS0gYS9zcmMvbWFpbi5j
DQorKysrIGIvc3JjL21haW4uYw0KK0BAIC03NTQsNyArNzU0LDcgQEAgRG93bmxvYWQ6XG4iKSwN
CisgI2VuZGlmDQorICNpZmRlZiBFTkFCTEVfWEFUVFINCisgICAgIE5fKCJcDQorLSAgICAgICAt
LW5vLXhhdHRyICAgICAgICAgICAgICAgICAgdHVybiBvZmYgc3RvcmFnZSBvZiBtZXRhZGF0YSBp
biBleHRlbmRlZCBmaWxlIGF0dHJpYnV0ZXNcbiIpLA0KKysgICAgICAgLS14YXR0ciAgICAgICAg
ICAgICAgICAgICAgIHR1cm4gb24gc3RvcmFnZSBvZiBtZXRhZGF0YSBpbiBleHRlbmRlZCBmaWxl
IGF0dHJpYnV0ZXNcbiIpLA0KKyAjZW5kaWYNCisgICAgICJcbiIsDQorIA0KKy0tIA0KKzIuMTku
MQ0KKw0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC93Z2V0L3dnZXQvQ1ZFLTIw
MTgtMjA0ODNfcDIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0L0NWRS0y
MDE4LTIwNDgzX3AyLnBhdGNoDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAw
MC4uNzJjZThhMGIzMw0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3dnZXQvd2dldC9DVkUtMjAxOC0yMDQ4M19wMi5wYXRjaA0KQEAgLTAsMCArMSwxMjcgQEANCitG
cm9tIDVhNGVlNGYzYzA3Y2M1ZGM3ZWY1ZjcyNDRmY2Y1MWZkMmZhM2JjNjcgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxDQorRnJvbTogPT9VVEYtOD9xP1RpbT0yMFI9QzM9QkNoc2VuPz0gPHRpbS5y
dWVoc2VuQGdteC5kZT4NCitEYXRlOiBXZWQsIDI2IERlYyAyMDE4IDE0OjM4OjE4ICswMTAwDQor
U3ViamVjdDogW1BBVENIIDIvMl0gRG9uJ3Qgc2F2ZSB1c2VyL3B3IHdpdGggLS14YXR0cg0KKw0K
K0Fsc28gdGhlIFJlZmVyZXIgaW5mbyBpcyByZWR1Y2VkIHRvIHNjaGVtZStob3N0K3BvcnQuDQor
DQorKiBzcmMvZnRwLmMgKGdldGZ0cCk6IENoYW5nZSBwYXJhbXMgb2Ygc2V0X2ZpbGVfbWV0YWRh
dGEoKQ0KKyogc3JjL2h0dHAuYyAoZ2V0aHR0cCk6IENoYW5nZSBwYXJhbXMgb2Ygc2V0X2ZpbGVf
bWV0YWRhdGEoKQ0KKyogc3JjL3hhdHRyLmMgKHNldF9maWxlX21ldGFkYXRhKTogUmVtb3ZlIHVz
ZXIvcGFzc3dvcmQgZnJvbSBvcmlnaW4gVVJMLA0KKyAgcmVkdWNlIFJlZmVyZXIgdmFsdWUgdG8g
c2NoZW1lL2hvc3QvcG9ydC4NCisqIHNyYy94YXR0ci5oOiBDaGFuZ2UgcHJvdG90eXBlIG9mIHNl
dF9maWxlX21ldGFkYXRhKCkNCisNCitDVkU6IENWRS0yMDE4LTIwNDgzIHBhdGNoIDINCitVcHN0
cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwOi8vZ2l0LnNhdmFubmFoLmdudS5vcmcvY2dpdC93
Z2V0LmdpdC9jb21taXQvP2lkPTNjZGZiNTk0Y2Y3NWYxMWNkYmI5NzAyYWM1ZTg1NmMzMzJjY2Fj
ZmFdDQorU2lnbmVkLW9mZi1ieTogQXZpcmFqIENKIDxhY2pAY2lzY28uY29tPg0KKy0tLQ0KKyBz
cmMvZnRwLmMgICB8ICAyICstDQorIHNyYy9odHRwLmMgIHwgIDQgKystLQ0KKyBzcmMveGF0dHIu
YyB8IDI0ICsrKysrKysrKysrKysrKysrKysrLS0tLQ0KKyBzcmMveGF0dHIuaCB8ICAzICsrLQ0K
KyA0IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQorDQor
ZGlmZiAtLWdpdCBhL3NyYy9mdHAuYyBiL3NyYy9mdHAuYw0KK2luZGV4IDY5MTQ4OTM2Li5kYjhh
NjI2NyAxMDA2NDQNCistLS0gYS9zcmMvZnRwLmMNCisrKysgYi9zcmMvZnRwLmMNCitAQCAtMTU4
MCw3ICsxNTgwLDcgQEAgRXJyb3IgaW4gc2VydmVyIHJlc3BvbnNlLCBjbG9zaW5nIGNvbnRyb2wg
Y29ubmVjdGlvbi5cbiIpKTsNCisgDQorICNpZmRlZiBFTkFCTEVfWEFUVFINCisgICBpZiAob3B0
LmVuYWJsZV94YXR0cikNCistICAgIHNldF9maWxlX21ldGFkYXRhICh1LT51cmwsIE5VTEwsIGZw
KTsNCisrICAgIHNldF9maWxlX21ldGFkYXRhICh1LCBOVUxMLCBmcCk7DQorICNlbmRpZg0KKyAN
CisgICBmZF9jbG9zZSAobG9jYWxfc29jayk7DQorZGlmZiAtLWdpdCBhL3NyYy9odHRwLmMgYi9z
cmMvaHR0cC5jDQoraW5kZXggNzdiZGJiZWQuLjQ3MmMzMjhmIDEwMDY0NA0KKy0tLSBhL3NyYy9o
dHRwLmMNCisrKysgYi9zcmMvaHR0cC5jDQorQEAgLTQxMjAsOSArNDEyMCw5IEBAIGdldGh0dHAg
KGNvbnN0IHN0cnVjdCB1cmwgKnUsIHN0cnVjdCB1cmwgKm9yaWdpbmFsX3VybCwgc3RydWN0IGh0
dHBfc3RhdCAqaHMsDQorICAgaWYgKG9wdC5lbmFibGVfeGF0dHIpDQorICAgICB7DQorICAgICAg
IGlmIChvcmlnaW5hbF91cmwgIT0gdSkNCistICAgICAgICBzZXRfZmlsZV9tZXRhZGF0YSAodS0+
dXJsLCBvcmlnaW5hbF91cmwtPnVybCwgZnApOw0KKysgICAgICAgIHNldF9maWxlX21ldGFkYXRh
ICh1LCBvcmlnaW5hbF91cmwsIGZwKTsNCisgICAgICAgZWxzZQ0KKy0gICAgICAgIHNldF9maWxl
X21ldGFkYXRhICh1LT51cmwsIE5VTEwsIGZwKTsNCisrICAgICAgICBzZXRfZmlsZV9tZXRhZGF0
YSAodSwgTlVMTCwgZnApOw0KKyAgICAgfQ0KKyAjZW5kaWYNCisgDQorZGlmZiAtLWdpdCBhL3Ny
Yy94YXR0ci5jIGIvc3JjL3hhdHRyLmMNCitpbmRleCA2NjUyNDIyNi4uMGYyMGZhZGYgMTAwNjQ0
DQorLS0tIGEvc3JjL3hhdHRyLmMNCisrKysgYi9zcmMveGF0dHIuYw0KK0BAIC0yMSw2ICsyMSw3
IEBADQorICNpbmNsdWRlIDxzdHJpbmcuaD4NCisgDQorICNpbmNsdWRlICJsb2cuaCINCisrI2lu
Y2x1ZGUgInV0aWxzLmgiDQorICNpbmNsdWRlICJ4YXR0ci5oIg0KKyANCisgI2lmZGVmIFVTRV9Y
QVRUUg0KK0BAIC01Nyw3ICs1OCw3IEBAIHdyaXRlX3hhdHRyX21ldGFkYXRhIChjb25zdCBjaGFy
ICpuYW1lLCBjb25zdCBjaGFyICp2YWx1ZSwgRklMRSAqZnApDQorICNlbmRpZiAvKiBVU0VfWEFU
VFIgKi8NCisgDQorIGludA0KKy1zZXRfZmlsZV9tZXRhZGF0YSAoY29uc3QgY2hhciAqb3JpZ2lu
X3VybCwgY29uc3QgY2hhciAqcmVmZXJyZXJfdXJsLCBGSUxFICpmcCkNCisrc2V0X2ZpbGVfbWV0
YWRhdGEgKGNvbnN0IHN0cnVjdCB1cmwgKm9yaWdpbl91cmwsIGNvbnN0IHN0cnVjdCB1cmwgKnJl
ZmVycmVyX3VybCwgRklMRSAqZnApDQorIHsNCisgICAvKiBTYXZlIG1ldGFkYXRhIGFib3V0IHdo
ZXJlIHRoZSBmaWxlIGNhbWUgZnJvbSAocmVxdWVzdGVkLCBmaW5hbCBVUkxzKSB0bw0KKyAgICAq
IHVzZXIgUE9TSVggRXh0ZW5kZWQgQXR0cmlidXRlcyBvZiByZXRyaWV2ZWQgZmlsZS4NCitAQCAt
NjcsMTMgKzY4LDI4IEBAIHNldF9maWxlX21ldGFkYXRhIChjb25zdCBjaGFyICpvcmlnaW5fdXJs
LCBjb25zdCBjaGFyICpyZWZlcnJlcl91cmwsIEZJTEUgKmZwKQ0KKyAgICAqIFtodHRwOi8vMHBv
aW50ZXIuZGUvbGVubmFydC9wcm9qZWN0cy9tb2RfbWltZV94YXR0ci9dLg0KKyAgICAqLw0KKyAg
IGludCByZXR2YWwgPSAtMTsNCisrICBjaGFyICp2YWx1ZTsNCisgDQorICAgaWYgKCFvcmlnaW5f
dXJsIHx8ICFmcCkNCisgICAgIHJldHVybiByZXR2YWw7DQorIA0KKy0gIHJldHZhbCA9IHdyaXRl
X3hhdHRyX21ldGFkYXRhICgidXNlci54ZGcub3JpZ2luLnVybCIsIGVzY25vbnByaW50X3VyaSAo
b3JpZ2luX3VybCksIGZwKTsNCistICBpZiAoKCFyZXR2YWwpICYmIHJlZmVycmVyX3VybCkNCist
ICAgIHJldHZhbCA9IHdyaXRlX3hhdHRyX21ldGFkYXRhICgidXNlci54ZGcucmVmZXJyZXIudXJs
IiwgZXNjbm9ucHJpbnRfdXJpIChyZWZlcnJlcl91cmwpLCBmcCk7DQorKyAgdmFsdWUgPSB1cmxf
c3RyaW5nIChvcmlnaW5fdXJsLCBVUkxfQVVUSF9ISURFKTsNCisrICByZXR2YWwgPSB3cml0ZV94
YXR0cl9tZXRhZGF0YSAoInVzZXIueGRnLm9yaWdpbi51cmwiLCBlc2Nub25wcmludF91cmkgKHZh
bHVlKSwgZnApOw0KKysgIHhmcmVlICh2YWx1ZSk7DQorKw0KKysgIGlmICghcmV0dmFsICYmIHJl
ZmVycmVyX3VybCkNCisrICAgIHsNCisrICAgICAgICBzdHJ1Y3QgdXJsIHU7DQorKw0KKysgICAg
ICAgIG1lbXNldCgmdSwgMCwgc2l6ZW9mKHUpKTsNCisrICAgICAgdS5zY2hlbWUgPSByZWZlcnJl
cl91cmwtPnNjaGVtZTsNCisrICAgICAgdS5ob3N0ID0gcmVmZXJyZXJfdXJsLT5ob3N0Ow0KKysg
ICAgICB1LnBvcnQgPSByZWZlcnJlcl91cmwtPnBvcnQ7DQorKw0KKysgICAgICB2YWx1ZSA9IHVy
bF9zdHJpbmcgKCZ1LCAwKTsNCisrICAgICAgcmV0dmFsID0gd3JpdGVfeGF0dHJfbWV0YWRhdGEg
KCJ1c2VyLnhkZy5yZWZlcnJlci51cmwiLCBlc2Nub25wcmludF91cmkgKHZhbHVlKSwgZnApOw0K
KysgICAgICB4ZnJlZSAodmFsdWUpOw0KKysgICAgfQ0KKyANCisgICByZXR1cm4gcmV0dmFsOw0K
KyB9DQorZGlmZiAtLWdpdCBhL3NyYy94YXR0ci5oIGIvc3JjL3hhdHRyLmgNCitpbmRleCAxMGYz
ZWQxMS4uNDBjN2E4ZDMgMTAwNjQ0DQorLS0tIGEvc3JjL3hhdHRyLmgNCisrKysgYi9zcmMveGF0
dHIuaA0KK0BAIC0xNiwxMiArMTYsMTMgQEANCisgICAgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW07
IGlmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4gICovDQorIA0KKyAj
aW5jbHVkZSA8c3RkaW8uaD4NCisrI2luY2x1ZGUgPHVybC5oPg0KKyANCisgI2lmbmRlZiBfWEFU
VFJfSA0KKyAjZGVmaW5lIF9YQVRUUl9IDQorIA0KKyAvKiBTdG9yZSBtZXRhZGF0YSBuYW1lL3Zh
bHVlIGF0dHJpYnV0ZXMgYWdhaW5zdCBmcC4gKi8NCistaW50IHNldF9maWxlX21ldGFkYXRhIChj
b25zdCBjaGFyICpvcmlnaW5fdXJsLCBjb25zdCBjaGFyICpyZWZlcnJlcl91cmwsIEZJTEUgKmZw
KTsNCisraW50IHNldF9maWxlX21ldGFkYXRhIChjb25zdCBzdHJ1Y3QgdXJsICpvcmlnaW5fdXJs
LCBjb25zdCBzdHJ1Y3QgdXJsICpyZWZlcnJlcl91cmwsIEZJTEUgKmZwKTsNCisgDQorICNpZiBk
ZWZpbmVkKF9fbGludXgpDQorIC8qIGxpYmMgb24gTGludXggaGFzIGZzZXR4YXR0ciAoNSBhcmd1
bWVudHMpLiAqLw0KKy0tIA0KKzIuMTkuMQ0KKw0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC93Z2V0L3dnZXRfMS4xOS41LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3dnZXQv
d2dldF8xLjE5LjUuYmINCmluZGV4IDkyMGI3NGRlMWIuLmE1Mzg0NGJiOGYgMTAwNjQ0DQotLS0g
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvd2dldC93Z2V0XzEuMTkuNS5iYg0KKysrIGIvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3dnZXQvd2dldF8xLjE5LjUuYmINCkBAIC0yLDYgKzIsOCBAQCBTUkNf
VVJJID0gIiR7R05VX01JUlJPUn0vd2dldC93Z2V0LSR7UFZ9LnRhci5neiBcDQogICAgICAgICAg
ICBmaWxlOi8vMDAwMS1VbnNldC1uZWVkX2NoYXJzZXRfYWxpYXMtd2hlbi1idWlsZGluZy1mb3It
bXVzbC5wYXRjaCBcDQogICAgICAgICAgICBmaWxlOi8vMDAwMi1pbXByb3ZlLXJlcHJvZHVjaWJp
bGl0eS5wYXRjaCBcDQogICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMTktNTk1My5wYXRjaCBcDQor
ICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMTgtMjA0ODNfcDEucGF0Y2ggXA0KKyAgICAgICAgICAg
ZmlsZTovL0NWRS0yMDE4LTIwNDgzX3AyLnBhdGNoIFwNCiAgICAgICAgICAgIg0KIA0KIFNSQ19V
UklbbWQ1c3VtXSA9ICIyZGI2ZjAzZDY1NTA0MWY4MmViNjRiOGM4YTFmYTdkYSINCg0K

