Return-Path: <Qi.Chen@windriver.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
	by mail.openembedded.org (Postfix) with ESMTP id F0B3F6021A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 04:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=myjV5Vc6osnoDemuZC0ANzf+qVAHReZdWKDSLkxOcJlYuPQv99l1F9+TA/Ja9L5ZB5MrwXACYT1nDHT0G75R7FYPLVRv9MCLPBYuM/ytON/b9u3K2JoqFSgTncEDTel0Ix6AtnqbrZPHLPx3bLcF0BEobF+7rticI7OmWJJi60Tk476M4SzUk74gWSi9Gk/pOMy/6LeWEXhctKtxTuW6ITVLKODVYj6EtaIbIlrrOJUteS66pTIaG2Iw0YzTahd4E9bem+fAmOVy9d7dZ/XpLBng20zuN1mxTRD1oRLw2kbDy4HhOqFyBMPsszf14aAGBlO4+4CqBaqbZsJVh6IsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vf1LrJTjTxboe8VIqorcuFv6jj3pwjenKCE3C5gW10A=;
	b=YVBj6FwzBhSLgEXfmoqC/yBaTCkv6IgPYiiaqHdQMtF+yydOgDnvECFhFNnuTqq2kQNV3fmvoC+eYckVCWv2i8AgYkRi7elgwVn3P5ctHg9zvIh+HFPPbJfJ32oHZPAKOiR+jd5Ft0ulOHhbgQCUNerjA9zRNrN1R1PZhraOo1QqhZwbsrGpZWU1fmCBnbjceuJH6z+b5aaXUo98BQrc1RiGoYH4JxiW5Azy2FIqt53AMhMeOHWJvkm2EK7iIFPWrhFEYxvSia5oQ+zrJsSNC62g59hiJnLt1nuhQh7cNH2En54k5/GY1dDeZvhT7bd3ukXmv6EpAblWOa7BuP7ETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=vf1LrJTjTxboe8VIqorcuFv6jj3pwjenKCE3C5gW10A=;
	b=P5H8Mijl7qgJAc4l2E8tTfb4usOj2p0WKqB7gRUdpRYCZ/BXJ5d3youukXo+7YILI4AwTk58bOsqd/xEoJ6cipATJhOi2NDGgxqfsNfdD9MHtyRDXFXUZYQktaW77ARcDrl18AO/iur7JaS+w60g7bbsdrVaNJE+F3x6voup38g=
Received: from DM6PR11MB3498.namprd11.prod.outlook.com (2603:10b6:5:6c::22) by
	DM6PR11MB2588.namprd11.prod.outlook.com (2603:10b6:5:c6::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2814.22; Tue, 17 Mar 2020 04:31:20 +0000
Received: from DM6PR11MB3498.namprd11.prod.outlook.com
	([fe80::59da:f995:a842:c07c]) by
	DM6PR11MB3498.namprd11.prod.outlook.com
	([fe80::59da:f995:a842:c07c%4]) with mapi id 15.20.2814.021;
	Tue, 17 Mar 2020 04:31:20 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?gb2312?B?u9i4tDogu9i4tDogW09FLWNvcmVdIFtQQVRDSCAyLzJdIGdsaWItMi4wOiBD?=
	=?gb2312?Q?orrect_multilib_conflict?=
Thread-Index: AQHV9/O+5EVbjdVU4Ua2YQSp4M5BtahMJrISgAALPQCAAAfVzQ==
Date: Tue, 17 Mar 2020 04:31:20 +0000
Message-ID: <DM6PR11MB34987CF94AFA084E609D4270EDF60@DM6PR11MB3498.namprd11.prod.outlook.com>
References: <20200311222249.29880-1-jpuhlman@mvista.com>
	<20200311222249.29880-2-jpuhlman@mvista.com>
	<DM6PR11MB3498030B61816C49B946EA35EDF60@DM6PR11MB3498.namprd11.prod.outlook.com>,
	<a5332339-6281-76fd-e23e-3ee2ed762720@mvista.com>
In-Reply-To: <a5332339-6281-76fd-e23e-3ee2ed762720@mvista.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Qi.Chen@windriver.com; 
x-originating-ip: [192.103.52.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7471c3d9-4560-4391-e215-08d7ca2c0ae1
x-ms-traffictypediagnostic: DM6PR11MB2588:
x-microsoft-antispam-prvs: <DM6PR11MB2588E49D2F78760019F44AE8EDF60@DM6PR11MB2588.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0345CFD558
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39850400004)(366004)(376002)(136003)(396003)(199004)(81166006)(81156014)(52536014)(8936002)(224303003)(66446008)(66556008)(64756008)(91956017)(66476007)(966005)(66946007)(76116006)(478600001)(2906002)(316002)(19627405001)(66574012)(110136005)(86362001)(7696005)(55016002)(6506007)(9686003)(53546011)(26005)(186003)(71200400001)(15974865002)(33656002)(5660300002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR11MB2588;
	H:DM6PR11MB3498.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wWFiEC662c1lwyfJuty+SGDW8IqDW2/s1pY1TJ8XcqM7LMh1e4p3SxUYOc5tXOsUa4vFma+Yb44VFjm5EhwQDWvNAxnOyoCDaRLbfI/Qhw1cUsTU810NcdjbQifXUw9gn4o/cGHsDbtQoiVDKNuxQQ3Z00a9t3Ja+FjDRNxjxUFLtVs++vHn3pKZtAyVkpm8LpVTGDHiBkPcc2KAPT9cltiZNAH22k/xmCVrLzi+9azEElRNU6RncesyX4HE4yNJoTuEBm5CK0KWHbccGCLGGb4PjIHqPhsLf/jglkn15jY0o+oPBugT0Rys1LhKQW9RuIYGsjHLFQ5lj+pLnyM/jk5xOaM3GWFnrsbDSLI58AZir0y6p21RzZVewldw0bcafQhUpFLu7uTt0jgis2mXp6mdGI+vBaKQCpSknx4AEDHr06aVnKKkL5Isla6+Z8Pz5i3yZjxOaXEv/qEW3KiV/DsF8oHjIUH4IXzb74d3SBDAFbdsVDUpQ/3/zSot2w93yFfbAzUrkVnxeXhAY3DkqQ==
x-ms-exchange-antispam-messagedata: 5EHLdoEfXSK0kOxxm/qWBAoJfM4yVsJMq3nDMdQjpLhD8BhJhOSMoFdyHNA1/VmMWhRFCrlvWoTMlSP3pNh7QGNrab7+HPV/++o7pO7Fk+dTrvESWAGjtgbKja3IRNQeeAWpW9X/LewQ6lwOqNbzVQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7471c3d9-4560-4391-e215-08d7ca2c0ae1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2020 04:31:20.5322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TpCpIK8xdRp506Mkh/0FO1nykSbIrwOCej+Nl1J9QxTEej/8FPANmZ3wVJJP9UPYnCAV/oNYlz21RB8YV7EJ0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2588
Subject: =?UTF-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSCAyLzJdIGdsaWItMi4wOiBDb3JyZWN0IG11bHRpbGliIGNvbmZsaWN0?=
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
X-List-Received-Date: Tue, 17 Mar 2020 04:31:21 -0000
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB34987CF94AFA084E609D4270EDF60DM6PR11MB3498namp_"

--_000_DM6PR11MB34987CF94AFA084E609D4270EDF60DM6PR11MB3498namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

TVVMVElMSUJTID89ICJtdWx0aWxpYjpsaWIzMiINCkRFRkFVTFRUVU5FX3ZpcnRjbGFzcy1tdWx0
aWxpYi1saWIzMiA/PSAiYXJtdjd2ZXRoZiINCg0KSSB0aGluayB5b3UgY2FuIHVzZSB0aGVzZSB0
d28gbGluZXMgdG8gcmVwcm9kdWNlIHRoZSBwcm9ibGVtIHdpdGggbXVsdGlsaWIgZW5hYmxlZC4N
Cg0KUmVnYXJkcywNCkNoZW4gUWkNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3
orz+yMs6IEplcmVteSBBLiBQdWhsbWFuIDxqcHVobG1hbkBtdmlzdGEuY29tPg0Kt6LLzcqxvOQ6
IDIwMjDE6jPUwjE3yNUgMTI6MDINCsrVvP7IyzogQ2hlbiwgUWkgPFFpLkNoZW5Ad2luZHJpdmVy
LmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQrW98ziOiBSZTogu9i4tDogW09FLWNv
cmVdIFtQQVRDSCAyLzJdIGdsaWItMi4wOiBDb3JyZWN0IG11bHRpbGliIGNvbmZsaWN0DQoNCkp1
c3Qgc3RhbmRhcmQgeDg2L2k1ODUuIFdoYXQgYXJlIHlvdSB1c2luZyBmb3IgeW91ciBtdWxpdGxp
Yi4gaWxwMzIvYWFyY2gzMi9hcm03Pw0KDQpyZXF1aXJlIGNvbmYvbXVsdGlsaWIuY29uZg0KTVVM
VElMSUJTID0gIm11bHRpbGliOmxpYjMyIg0KWDg2QVJDSDMyID0gImk1ODYiDQpERUZBVUxUVFVO
RV92aXJ0Y2xhc3MtbXVsdGlsaWItbGliMzIgPSAiaTU4NiINClRBUkdFVF9BUkNIX3ZpcnRjbGFz
cy1tdWx0aWxpYi1saWIzMiA9ICJpNTg2Ig0KVEFSR0VUX0xEX0FSQ0hfdmlydGNsYXNzLW11bHRp
bGliLWxpYjMyID0gIi1tIGVsZl9pMzg2Ig0KQUxUQklORElSX1NVRkZJWF92aXJ0Y2xhc3MtbXVs
dGlsaWItbGliMzIgPSAiMzIiDQoNCldoYXQgZG9lcyB5b3VyIC1lIGxvb2sgbGlrZSBmb3IgdGhl
IHJlY2lwZSB0aGF0IGZhaWxzPw0KDQpPbiAzLzE2LzIwMjAgODozMCBQTSwgQ2hlbiwgUWkgd3Jv
dGU6DQpUaGlzIHBhdGNoIGlzIGNhdXNpbmcgcmVncmVzc2lvbiBpbiBjYXNlIG9mIHFlbXVhcm02
NCBtdWx0aWxpYiBmb3IgbWUuIFRoZSBzdGF0aWMtbGluay50ZXN0IGZpbGUgaXMgbm90IHRoZXJl
LCByZXN1bHRpbmcgdGhlIGBtdicgY29tbWFuZCBmYWlsdXJlLiBJJ3ZlIHNlbnQgb3V0IGEgcGF0
Y2ggdG8gZml4IHRoaXMgcHJvYmxlbSwgYnV0IEkgZG9uJ3Qga25vdyB3aGF0J3MgeW91ciBlbnZp
cm9ubWVudC4gU28gcGxlYXNlIGhlbHAgcmV2aWV3Lg0KDQpSZWdhcmRzLA0KQ2hlbiBRaQ0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7Iyzogb3BlbmVtYmVkZGVkLWNvcmUt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnPG1haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1i
b3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IDxvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2Vz
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+PG1haWx0bzpvcGVuZW1iZWRkZWQtY29yZS1ib3VuY2Vz
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+ILT6se0gSmVyZW15IEEuIFB1aGxtYW4gPGpwdWhsbWFu
QG12aXN0YS5jb20+PG1haWx0bzpqcHVobG1hbkBtdmlzdGEuY29tPg0Kt6LLzcqxvOQ6IDIwMjDE
6jPUwjEyyNUgNjoyMg0KytW8/sjLOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPG1haWx0bzpvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiA8
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz48bWFpbHRvOm9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQrW98ziOiBbT0UtY29yZV0gW1BBVENI
IDIvMl0gZ2xpYi0yLjA6IENvcnJlY3QgbXVsdGlsaWIgY29uZmxpY3QNCg0KRnJvbTogSmVyZW15
IFB1aGxtYW4gPGpwdWhsbWFuQG12aXN0YS5jb20+PG1haWx0bzpqcHVobG1hbkBtdmlzdGEuY29t
Pg0KDQpTaWduZWQtb2ZmLWJ5OiBKZXJlbXkgQS4gUHVobG1hbiA8anB1aGxtYW5AbXZpc3RhLmNv
bT48bWFpbHRvOmpwdWhsbWFuQG12aXN0YS5jb20+DQotLS0NCiBtZXRhL3JlY2lwZXMtY29yZS9n
bGliLTIuMC9nbGliLmluYyB8IDMgKysrDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMgYi9t
ZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYw0KaW5kZXggMjNjMzQ3ZGJmNy4uZWRl
Y2M1MWZkYiAxMDA2NDQNCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4wL2dsaWIuaW5j
DQorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYw0KQEAgLTEyOCw2ICsx
MjgsOSBAQCBkb19pbnN0YWxsX2FwcGVuZF9jbGFzcy10YXJnZXQgKCkgew0KICAgICAgICAgICAg
ICAgICAgICAgICAgIHJtICR7RH0ke2RhdGFkaXJ9L2luc3RhbGxlZC10ZXN0cy9nbGliL2dkYnVz
LXNlcmlhbGl6YXRpb24udGVzdA0KICAgICAgICAgICAgICAgICBmaQ0KICAgICAgICAgZmkNCisg
ICAgICAgIGlmIHRlc3QgIngke01MUFJFRklYfSIgIT0gIngiOyB0aGVuDQorICAgICAgICAgICAg
ICAgIG12ICR7RH0ke2RhdGFkaXJ9L2luc3RhbGxlZC10ZXN0cy9nbGliL3N0YXRpYy1saW5rLnRl
c3QgJHtEfSR7ZGF0YWRpcn0vaW5zdGFsbGVkLXRlc3RzL2dsaWIvJHtNTFBSRUZJWH1zdGF0aWMt
bGluay50ZXN0DQorICAgICAgICBmaQ0KIH0NCg0KICMgQXMgd2UgZG8gbm90IGJ1aWxkIHB5dGhv
bjMgZm9yIHdpbmRvd3MsIG1ha2VzIG5vIHNlbnNlIHRvIHNoaXAgdGhlIHNjcmlwdCB0aGF0J3Mg
dXNpbmcgaXQNCi0tDQoyLjEzLjMNCg0KLS0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQpPcGVuZW1iZWRkZWQtY29yZSBtYWlsaW5nIGxpc3QNCk9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8bWFpbHRvOk9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQoNCltodHRwczovL2lwbWNkbi5h
dmFzdC5jb20vaW1hZ2VzL2ljb25zL2ljb24tZW52ZWxvcGUtdGljay1ncmVlbi1hdmctdjEucG5n
XTxodHRwOi8vd3d3LmF2Zy5jb20vZW1haWwtc2lnbmF0dXJlP3V0bV9tZWRpdW09ZW1haWwmdXRt
X3NvdXJjZT1saW5rJnV0bV9jYW1wYWlnbj1zaWctZW1haWwmdXRtX2NvbnRlbnQ9ZW1haWxjbGll
bnQ+IFZpcnVzLWZyZWUuIHd3dy5hdmcuY29tPGh0dHA6Ly93d3cuYXZnLmNvbS9lbWFpbC1zaWdu
YXR1cmU/dXRtX21lZGl1bT1lbWFpbCZ1dG1fc291cmNlPWxpbmsmdXRtX2NhbXBhaWduPXNpZy1l
bWFpbCZ1dG1fY29udGVudD1lbWFpbGNsaWVudD4NCg0KDQotLQ0KSmVyZW15IEEuIFB1aGxtYW4N
CmpwdWhsbWFuQG12aXN0YS5jb208bWFpbHRvOmpwdWhsbWFuQG12aXN0YS5jb20+DQo=

--_000_DM6PR11MB34987CF94AFA084E609D4270EDF60DM6PR11MB3498namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>MULTILIBS ?=3D &quot;multilib:lib32&quot;<br>
</span>
<div>DEFAULTTUNE_virtclass-multilib-lib32 ?=3D &quot;armv7vethf&quot;</div>
<div><br>
</div>
<div>I think you can use these two lines to reproduce the problem with mult=
ilib enabled.<br>
</div>
<span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Chen Qi<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Jeremy =
A. Puhlman &lt;jpuhlman@mvista.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA3=D4=C217=C8=D5 12:02<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Chen, Qi &lt;Qi.Chen@windriver.com&gt;; openembe=
dded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.o=
rg&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: =BB=D8=B8=B4: [OE-core] [PATCH 2/2] glib-2.0: Corr=
ect multilib conflict</font>
<div>&nbsp;</div>
</div>
<div>Just standard x86/i585. What are you using for your mulitlib. ilp32/aa=
rch32/arm7?<br>
<br>
require conf/multilib.conf<br>
MULTILIBS =3D &quot;multilib:lib32&quot;<br>
X86ARCH32 =3D &quot;i586&quot;<br>
DEFAULTTUNE_virtclass-multilib-lib32 =3D &quot;i586&quot;<br>
TARGET_ARCH_virtclass-multilib-lib32 =3D &quot;i586&quot;<br>
TARGET_LD_ARCH_virtclass-multilib-lib32 =3D &quot;-m elf_i386&quot;<br>
ALTBINDIR_SUFFIX_virtclass-multilib-lib32 =3D &quot;32&quot;<br>
<br>
What does your -e look like for the recipe that fails?<br>
<br>
<div class=3D"x_moz-cite-prefix">On 3/16/2020 8:30 PM, Chen, Qi wrote:<br>
</div>
<blockquote type=3D"cite"><style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
This patch is causing regression in case of qemuarm64 multilib for me. The =
static-link.test file is not there, resulting the `mv' command failure. I'v=
e sent out a patch to fix this problem, but I don't know what's your enviro=
nment. So please help review.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Regards,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Chen Qi<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b>
<a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:openembedded-core-bo=
unces@lists.openembedded.org">
openembedded-core-bounces@lists.openembedded.org</a> <a class=3D"x_moz-txt-=
link-rfc2396E" href=3D"mailto:openembedded-core-bounces@lists.openembedded.=
org">
&lt;openembedded-core-bounces@lists.openembedded.org&gt;</a> =B4=FA=B1=ED J=
eremy A. Puhlman <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:jpuhlm=
an@mvista.com">
&lt;jpuhlman@mvista.com&gt;</a><br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA3=D4=C212=C8=D5 6:22<br>
<b>=CA=D5=BC=FE=C8=CB:</b> <a class=3D"x_moz-txt-link-abbreviated" href=3D"=
mailto:openembedded-core@lists.openembedded.org">
openembedded-core@lists.openembedded.org</a> <a class=3D"x_moz-txt-link-rfc=
2396E" href=3D"mailto:openembedded-core@lists.openembedded.org">
&lt;openembedded-core@lists.openembedded.org&gt;</a><br>
<b>=D6=F7=CC=E2:</b> [OE-core] [PATCH 2/2] glib-2.0: Correct multilib confl=
ict</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">From: Jeremy Puhlman <a class=3D"x_moz-txt-link-=
rfc2396E" href=3D"mailto:jpuhlman@mvista.com">
&lt;jpuhlman@mvista.com&gt;</a><br>
<br>
Signed-off-by: Jeremy A. Puhlman <a class=3D"x_moz-txt-link-rfc2396E" href=
=3D"mailto:jpuhlman@mvista.com">
&lt;jpuhlman@mvista.com&gt;</a><br>
---<br>
&nbsp;meta/recipes-core/glib-2.0/glib.inc | 3 &#43;&#43;&#43;<br>
&nbsp;1 file changed, 3 insertions(&#43;)<br>
<br>
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2=
.0/glib.inc<br>
index 23c347dbf7..edecc51fdb 100644<br>
--- a/meta/recipes-core/glib-2.0/glib.inc<br>
&#43;&#43;&#43; b/meta/recipes-core/glib-2.0/glib.inc<br>
@@ -128,6 &#43;128,9 @@ do_install_append_class-target () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rm ${=
D}${datadir}/installed-tests/glib/gdbus-serialization.test<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if test &quot;x${MLPREFIX}&=
quot; !=3D &quot;x&quot;; then<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; mv ${D}${datadir}/installed-tests/glib/static-link.tes=
t ${D}${datadir}/installed-tests/glib/${MLPREFIX}static-link.test<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;# As we do not build python3 for windows, makes no sense to ship the =
script that's using it<br>
-- <br>
2.13.3<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:Openembedded-core@li=
sts.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
</div>
</span></font></div>
<div id=3D"x_DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2"><br>
<table style=3D"border-top:1px solid #D3D4DE">
<tbody>
<tr>
<td style=3D"width:55px; padding-top:13px"><a href=3D"http://www.avg.com/em=
ail-signature?utm_medium=3Demail&amp;utm_source=3Dlink&amp;utm_campaign=3Ds=
ig-email&amp;utm_content=3Demailclient" target=3D"_blank"><img alt=3D"" wid=
th=3D"46" height=3D"29" style=3D"width:46px; height:29px" src=3D"https://ip=
mcdn.avast.com/images/icons/icon-envelope-tick-green-avg-v1.png"></a></td>
<td style=3D"width:470px; padding-top:12px; color:#41424e; font-size:13px; =
font-family:Arial,Helvetica,sans-serif; line-height:18px">
Virus-free. <a href=3D"http://www.avg.com/email-signature?utm_medium=3Demai=
l&amp;utm_source=3Dlink&amp;utm_campaign=3Dsig-email&amp;utm_content=3Demai=
lclient" target=3D"_blank" style=3D"color:#4453ea">
www.avg.com</a> </td>
</tr>
</tbody>
</table>
<a href=3D"#x_DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2" width=3D"1" height=3D"1=
"></a></div>
</blockquote>
<br>
<pre class=3D"x_moz-signature" cols=3D"72">--=20
Jeremy A. Puhlman
<a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:jpuhlman@mvista.com"=
>jpuhlman@mvista.com</a></pre>
</div>
</body>
</html>

--_000_DM6PR11MB34987CF94AFA084E609D4270EDF60DM6PR11MB3498namp_--
