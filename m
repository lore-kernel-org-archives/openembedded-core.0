Received: from mx08-00271601.pphosted.com (mx08-00271601.pphosted.com [91.207.212.217])
 by mx.groups.io with SMTP id smtpd.web12.6663.1591088887965639183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 02:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@verisure.com header.s=pp16032020 header.b=dmWOavGe;
 spf=pass (domain: verisure.com, ip: 91.207.212.217, mailfrom: ernst.sjostrand@verisure.com)
Received: from pps.filterd (m0107397.ppops.net [127.0.0.1])
	by mx08-00271601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 052985mD005029
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jun 2020 11:08:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verisure.com; h=from : to : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=pp16032020;
 bh=QHOT773rFBGjOOsNn+EpeWqVzv1uLuOVkeI/MevHZ5c=;
 b=dmWOavGe15LHVRVOgAFvTvKYjxrtbSxGUee5LHtbhO2d4oxV1ZDgpvOOTDJVempB/44M
 tQMayyQv7069jdBQVlDzvYkGwnl3MWju+xdybtG3YZXrx/Zf2Xn/1zFAbis4GZC1evVO
 vzHW21LjNyu/pcdspcJBOtjejK9fSpT5NHpPG9ej8tAYZYOaUUin3Yu47pvt+hKL/sj+
 KdEt3WK5XaFck+ZXz4h62OJ42SOS/OSxmA3W27biq/sbJuQgGbwzdymQVlzLF5qzxV5x
 ws7yxRRi4+AL0o3AH+vSxjNpNrYF5jP7tuEw5yIFgqaPTl/yCTxuIvQ1UZymu207KvND 8Q== 
Received: from eur04-db3-obe.outbound.protection.outlook.com (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58])
	by mx08-00271601.pphosted.com with ESMTP id 31bc90tn7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 11:08:05 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eC+IP4uLWoNlhWnvnPPVs7zXvfIHfWvN3enrMNf9iShMPkiKsRUvWdEXGpeWAn8jyqpfdYDx8osbnr9XMVDQS0pF+/7WqpEiBlO4R5Vt+Gl0x+H5odOzQ7e9DdQdhMOiG+g+vA0SNwRyyWBLtLqlT1EkT8t4rH6atdINvnp0Z6ynRmyQp6Y1QseAOIa018KyOfqNuqhL4grK+Yr+9xDQGXli+kzPWW9GlJRG5Iu1Oy6APMlw/27aUdTzlLpt0Qfblycbvc5RNsMU6V0LCeAUfTxKsqTSjftn0Od64U987Nm/4RYIE04fhZFEDdOgPuyz9nyVcW1/VFuY4ZslFjzEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHOT773rFBGjOOsNn+EpeWqVzv1uLuOVkeI/MevHZ5c=;
 b=NFcQu9i7pztF1LzauE+r9tD0ns/3SLdFre2EXI/hmTNsyDx7AR1O3cKOo+kOlc92QjqWvtW70m7BARG2OFnL2phXAJBvxwvMLqdtqAK6p1E5jQYCmfix4r3oLDVfjiQo72P8ZUz6aB1o4mRXvRmsF3dDN1GNEOEQEXDPA6VhvANE6ptWzOUiCucCEjcYAOdM2/AiO/x8JdYZnS0HfhIGajYV97NjXxtCvy4Bq3uwtBAcGtq29X32aAucaPzb09nC0RYNk3b2sGHzhSJi80usHGVf7dZRnZqm5ASxQWLmrVFg0gUloeNxY9/WWqOoUewL/ns0CkEPfO2TT/YCOzCxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=verisure.com; dmarc=pass action=none header.from=verisure.com;
 dkim=pass header.d=verisure.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=verisure.onmicrosoft.com; s=selector1-verisure-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHOT773rFBGjOOsNn+EpeWqVzv1uLuOVkeI/MevHZ5c=;
 b=i1309dHPbulHMIVPOtPU748u6QqmWKaA35L+1DJzkwc9hi6mAkC0RzErzeqA54FMt25C0pQwGNaoeUifktuS0xAsXWI1y9/2/kZcLueDX9N373XohI0y0VHTIWg0c6w9Ni8E0b7xXlFPuzHlCn/xzfPJEL/4KDG7LeOH5d0Yc6Q=
Received: from HE1PR10MB1786.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:7:59::11) by
 HE1PR10MB1545.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:7:5d::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.19; Tue, 2 Jun 2020 09:07:57 +0000
Received: from HE1PR10MB1786.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::898f:65d0:5ef9:cc6d]) by HE1PR10MB1786.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::898f:65d0:5ef9:cc6d%5]) with mapi id 15.20.3045.022; Tue, 2 Jun 2020
 09:07:57 +0000
From: "Ernst Sj?strand" <ernst.sjostrand@verisure.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [warrior][PATCH] qemu: Replace stime() API with clock_settime
Thread-Topic: [warrior][PATCH] qemu: Replace stime() API with clock_settime
Thread-Index: AQHWOL1O1NvLPCAosUSxM7uI17p3tA==
Date: Tue, 2 Jun 2020 09:07:57 +0000
Message-ID: <75a6c930d82813809304d1257c31c4623f8edd40.camel@verisure.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=verisure.com;
x-originating-ip: [94.246.105.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dab31763-a64e-4949-786a-08d806d47152
x-ms-traffictypediagnostic: HE1PR10MB1545:
x-microsoft-antispam-prvs: 
 <HE1PR10MB1545535E0FE0D499073FEDDE948B0@HE1PR10MB1545.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:345;
x-forefront-prvs: 0422860ED4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 T8ub6jpizij4zspcw0l6OLH1/irQmD96BlPRCTmNklu9ep2gtcApD1zoH+2+E/ZCzx9jn4gUsB+XrqK0hsC7A05TexVJuTnQaUutogS5NBjAy8qXBLNWXTsJRXeQQ5/FxGL88llPsHdW0hy/JAAiNmpbsHNOc412AcNB2oWnUkrl53FpkhhN+1Xax/7uonF346Tz8sP+jXevXgVal1VOserlIf5mGy9hyrszw//d8Q8vr9+oFvT7EbwgMd341LzNHKcsJpaIhpTgNfPndZns9nlVEcsUA+AbrcFyjvAZ5KAMfvEky6qWMEGx7STsOLfnhH/yMvxwXu9T/usiZYMrvs6/BTp6h9pS745o+5u3YcP6Nv28it9PlDay8LF9S2KYJucKWEQDS8wIJtbEPDX3Fw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR10MB1786.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(966005)(6512007)(8676002)(6506007)(316002)(83380400001)(5660300002)(36756003)(85202003)(66446008)(66556008)(2906002)(76116006)(91956017)(6486002)(478600001)(66476007)(64756008)(66946007)(86362001)(186003)(2616005)(8936002)(26005)(6916009)(85182001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 2sen8fl2wdVF6K1Yfjp4d6klmeXwg6qImuSTImm4zKPOkCY28qdlXptSvo6QTtcdCFy17FwKphTAlh7jUeQv8t62IG3Da9SrOAA05i64EpLnUbgdV9M81C+xRS6Ldu/d4SrtuzZ1/8IpflvFx5xkmddd6nVZ+XG3OuvbF665ggIYlZnXeFuHMHzCb/KCyMh8daiXEOFDwIeh5rDPKkgYg5EtbziSwpbtgk0i5lCrCQMsUpdh9AL7bG2Dv2HBUcjzbtYcpTo6HbR1QFojh1lJYQKXcEUP0PVPLMC3sKZ0ytPTNsnbPXNVSoMKBKnfobISUyjAsRlUwQHt7cKFHfFh/Rud7wSMdMVX0FtxfIzPsWIUVPItPD3WODOJ9Lg8Q3eqAPSRESFPGUUWcqLNSl9MxOIy5rimoGxT0lb9az2l7frrm5bOYWHGVqzMTgSPFcV2g9QmXzzxonKaWKCCul/rvBvZ9Kpn3eoeARCaHtOPJrPX+M1l/q8hLL/6Yp64sBDb
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: verisure.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab31763-a64e-4949-786a-08d806d47152
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2020 09:07:57.4780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3055fa7f-a944-4927-801e-a62b63119e43
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54cdvy1IdMfZ16pA3lbOIHoR1NWfLdb2RzBjKuB3cAyS0FcNoPj+aW3s7jebjOfg3bKE/yCWUsqZqsSR2JNeYLiREYGRSPg/Gna1ME9tYFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR10MB1545
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-02_11:2020-06-01,2020-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 cotscore=-2147483648 phishscore=0 clxscore=1011
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006020061
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCBA80B8451CE34D82540B7EAD3CB219@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

RnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4NCg0KKEZyb20gT0UtQ29yZSByZXY6
IDJjY2E3NTE1NWJhZWM4MzU4OTM5ZTJhYWU4MjJlMjU2YmVkNGNmZTApDQoNClNpZ25lZC1vZmYt
Ynk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCi0tLQ0KQW5vdGhl
ciBwYXRjaCBmb3IgVWJ1bnR1IDIwLjA0IHN1cHBvcnQgb24gV2Fycmlvci4NCg0KIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUuaW5jICAgICAgICAgICB8ICAxICsNCiAuLi5saW51eC11
c2VyLXJlbW92ZS1ob3N0LXN0aW1lLXN5c2NhbGwucGF0Y2ggfCA2MSArKysrKysrKysrKysrKysr
KysrDQogMiBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1saW51eC11c2VyLXJlbW92
ZS1ob3N0LXN0aW1lLXN5c2NhbGwucGF0Y2gNCg0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5p
bmMNCmluZGV4IDIwMjEzNGIzZDguLjUzMDBlNGM0NDUgMTAwNjQ0DQotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYw0KKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS5pbmMNCkBAIC0yNSw2ICsyNSw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9kb3dubG9h
ZC5xZW11Lm9yZy8ke0JQTn0tJHtQVn0udGFyLnh6IFwNCiAgICAgICAgICAgIGZpbGU6Ly8wMDE0
LWxpbnV4LXVzZXItZml4LXRvLWhhbmRsZS12YXJpYWJseS1zaXplZC1TSU9DR1NUQU1QLXcucGF0
Y2ggXA0KICAgICAgICAgICAgZmlsZTovLzAwMDEtbGludXgtdXNlci1hc3N1bWUtX19OUl9nZXR0
aWQtYWx3YXlzLWV4aXN0cy5wYXRjaCBcDQogICAgICAgICAgICBmaWxlOi8vMDAwMS1saW51eC11
c2VyLXJlbmFtZS1nZXR0aWQtdG8tc3lzX2dldHRpZC10by1hdm9pZC1jbGFzLnBhdGNoIFwNCisg
ICAgICAgICAgIGZpbGU6Ly8wMDExLWxpbnV4LXVzZXItcmVtb3ZlLWhvc3Qtc3RpbWUtc3lzY2Fs
bC5wYXRjaCBcDQogICAgICAgICAgICAiDQogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicWVtdS0o
P1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciINCiANCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtbGludXgtdXNlci1yZW1vdmUtaG9zdC1zdGltZS1zeXNj
YWxsLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLWxpbnV4LXVz
ZXItcmVtb3ZlLWhvc3Qtc3RpbWUtc3lzY2FsbC5wYXRjaA0KbmV3IGZpbGUgbW9kZSAxMDA2NDQN
CmluZGV4IDAwMDAwMDAwMDAuLjY1OWU2YmU0NWQNCi0tLSAvZGV2L251bGwNCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1saW51eC11c2VyLXJlbW92ZS1ob3N0LXN0
aW1lLXN5c2NhbGwucGF0Y2gNCkBAIC0wLDAgKzEsNjEgQEANCitGcm9tIDBmMWYyZDQ1OTZhZWUw
MzdkM2NjYmNmMTA1OTI0NjZkYWE1NDEwN2YgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQorRnJv
bTogTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2aWVyLmV1Pg0KK0RhdGU6IFR1ZSwgMTIgTm92
IDIwMTkgMTU6MjU6NTYgKzAxMDANCitTdWJqZWN0OiBbUEFUQ0hdIGxpbnV4LXVzZXI6IHJlbW92
ZSBob3N0IHN0aW1lKCkgc3lzY2FsbA0KKw0KK3N0aW1lKCkgaGFzIGJlZW4gd2l0aGRyYXduIGZy
b20gZ2xpYmMNCisoMTJjYmRlMWRhZTZmICJVc2UgY2xvY2tfc2V0dGltZSB0byBpbXBsZW1lbnQg
c3RpbWU7IHdpdGhkcmF3IHN0aW1lLiIpDQorDQorSW1wbGVtZW50IHRoZSB0YXJnZXQgc3RpbWUo
KSBzeXNjYWxsIHVzaW5nIGhvc3QNCitjbG9ja19zZXR0aW1lKENMT0NLX1JFQUxUSU1FLCAuLi4p
IGFzIGl0IGlzIGRvbmUgaW50ZXJuYWxseSBpbiBnbGliYy4NCisNCitUZXN0ZWQgcWVtdS1wcGMv
eDg2XzY0IHdpdGg6DQorDQorCSNpbmNsdWRlIDx0aW1lLmg+DQorCSNpbmNsdWRlIDxzdGRpby5o
Pg0KKw0KKwlpbnQgbWFpbih2b2lkKQ0KKwl7DQorCQl0aW1lX3QgdDsNCisJCWludCByZXQ7DQor
DQorCQkvKiBkYXRlIC11IC1kIjIwMTktMTEtMTJUMTU6MTE6MDAiICIrJXMiICovDQorCQl0ID0g
MTU3MzU3MTQ2MDsNCisJCXJldCA9IHN0aW1lKCZ0KTsNCisJCXByaW50ZigicmV0ICVkXG4iLCBy
ZXQpOw0KKwkJcmV0dXJuIDA7DQorCX0NCisNCisgICAgICAgICMgZGF0ZTsgLi9zdGltZTsgZGF0
ZQ0KKyAgICAgICAgVHVlIE5vdiAxMiAxNDoxODozMiBVVEMgMjAxOQ0KKyAgICAgICAgcmV0IDAN
CisgICAgICAgIFR1ZSBOb3YgMTIgMTU6MTE6MDAgVVRDIDIwMTkNCisNCitVcHN0cmVhbS1TdGF0
dXM6IEJhY2twb3J0IFtodHRwczovL2dpdC5xZW11Lm9yZy8/cD1xZW11LmdpdDthPWNvbW1pdDto
PTBmMWYyZDQ1OTZhZWUwMzdkM2NjYmNmMTA1OTI0NjZkYWE1NDEwN2ZdDQorQnVnbGluazogaHR0
cHM6Ly9idWdzLmxhdW5jaHBhZC5uZXQvcWVtdS8rYnVnLzE4NTIxMTUNCitSZXBvcnRlZC1ieTog
Q29sZSBSb2JpbnNvbiA8Y3JvYmluc29AcmVkaGF0LmNvbT4NCitTaWduZWQtb2ZmLWJ5OiBMYXVy
ZW50IFZpdmllciA8bGF1cmVudEB2aXZpZXIuZXU+DQorUmV2aWV3ZWQtYnk6IFBldGVyIE1heWRl
bGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4NCitNZXNzYWdlLUlkOiA8MjAxOTExMTIxNDI1
NTYuNjMzNS0xLWxhdXJlbnRAdml2aWVyLmV1Pg0KKy0tLQ0KKyBsaW51eC11c2VyL3N5c2NhbGwu
YyB8IDggKysrKystLS0NCisgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkNCisNCistLS0gYS9saW51eC11c2VyL3N5c2NhbGwuYw0KKysrKyBiL2xpbnV4LXVz
ZXIvc3lzY2FsbC5jDQorQEAgLTc2NTEsMTAgKzc2NTEsMTIgQEAgc3RhdGljIGFiaV9sb25nIGRv
X3N5c2NhbGwxKHZvaWQgKmNwdV9lbg0KKyAjaWZkZWYgVEFSR0VUX05SX3N0aW1lIC8qIG5vdCBv
biBhbHBoYSAqLw0KKyAgICAgY2FzZSBUQVJHRVRfTlJfc3RpbWU6DQorICAgICAgICAgew0KKy0g
ICAgICAgICAgICB0aW1lX3QgaG9zdF90aW1lOw0KKy0gICAgICAgICAgICBpZiAoZ2V0X3VzZXJf
c2FsKGhvc3RfdGltZSwgYXJnMSkpDQorKyAgICAgICAgICAgIHN0cnVjdCB0aW1lc3BlYyB0czsN
CisrICAgICAgICAgICAgdHMudHZfbnNlYyA9IDA7DQorKyAgICAgICAgICAgIGlmIChnZXRfdXNl
cl9zYWwodHMudHZfc2VjLCBhcmcxKSkgew0KKyAgICAgICAgICAgICAgICAgcmV0dXJuIC1UQVJH
RVRfRUZBVUxUOw0KKy0gICAgICAgICAgICByZXR1cm4gZ2V0X2Vycm5vKHN0aW1lKCZob3N0X3Rp
bWUpKTsNCisrICAgICAgICAgICAgfQ0KKysgICAgICAgICAgICByZXR1cm4gZ2V0X2Vycm5vKGNs
b2NrX3NldHRpbWUoQ0xPQ0tfUkVBTFRJTUUsICZ0cykpOw0KKyAgICAgICAgIH0NCisgI2VuZGlm
DQorICNpZmRlZiBUQVJHRVRfTlJfYWxhcm0gLyogbm90IG9uIGFscGhhICovDQotLSANCjIuMjYu
Mg0KDQo=
