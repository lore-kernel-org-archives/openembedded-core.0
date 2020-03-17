Return-Path: <Qi.Chen@windriver.com>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5C53660BAF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 05:21:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=IwmyvEeE7R03E5f+YTFh0ujzJurDF+F5WRUIOfyAYxOvvWgdrm4ta7a3UTypAySikKcGJUQ/6sNlYM9sq9EKog7xLDt5OnzRCjMhLtSXIn44f8+P2ALIFJao6fxsfaLrBhowjfzfFMZCf2MZ78D9CIxHw3ah3avK43qybGAou8AeuhHN9+ydGQSCPEA+kBNk3WhWTaXk5Yg5+MV2kTiMfjSDmw41SilTPahIPjxsBiUKRZYvkGrAewwrmP52T0nsNcEaG2NMjbQIeQFAAohBL+oL9vcKzfpqO7ImD1Vw/U54dcJbpeK65QTPePLmLMHSvWqwTqkQQaeWRKTlHLkKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=g3UU8LosXyKi+0xSbRKQeBIwCYGLzDhqpv3YVdlLSLQ=;
	b=baKzmVk3IpP2i2Mx7Hcj8sT/0peAWFsWT2xEgeOj6syuxP/+WaA4aPPDmeXAtToi97cCwkkVvVwiuTGtqyr24MDnW8g6nIeQ+zc8NMMam8g1aSioDI1DB+Y4mJzqiROP4gJKyJ19rWkaKDwb4TSmoglV6vMMnDKlva3QVoB5XR9eKcI/J6wcW5VnN8vWYufRDVkMdeM95rjFOa+iWk9OLmg1EEvK32qrCpDqMOc3HGFSLOKBpbpML5vWZE7s76Crc5oCSR0KR7dOyv+SIhSYI9L8ERU8Uxx8ADXOjfk8514hd/FIM8zV9dENxkiykdQ9wPue/4Qap2yQ1NZtIv5fVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=windriver.com; dmarc=pass action=none
	header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=windriversystems.onmicrosoft.com;
	s=selector2-windriversystems-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=g3UU8LosXyKi+0xSbRKQeBIwCYGLzDhqpv3YVdlLSLQ=;
	b=bPnpa4J+Y+GOIKrBus2s7ouCiMX+LO47o8xADpcb9u2A3fv74CVkutjahC0GhbZdxYoLVxtk1W3MN9RyODH85IMAV4Q9SkcVPFu0ZCJQG0z16cNgmU+unUSiEGAoTw8XmxuDTpU8pDa/VAKhKzUe5fv5XO9cETDGEkc9yr0KPPY=
Received: from DM6PR11MB3498.namprd11.prod.outlook.com (2603:10b6:5:6c::22) by
	DM6PR11MB4249.namprd11.prod.outlook.com (2603:10b6:5:1d9::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2814.21; Tue, 17 Mar 2020 05:21:10 +0000
Received: from DM6PR11MB3498.namprd11.prod.outlook.com
	([fe80::59da:f995:a842:c07c]) by
	DM6PR11MB3498.namprd11.prod.outlook.com
	([fe80::59da:f995:a842:c07c%4]) with mapi id 15.20.2814.021;
	Tue, 17 Mar 2020 05:21:10 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?gb2312?B?u9i4tDogu9i4tDogu9i4tDogW09FLWNvcmVdIFtQQVRDSCAyLzJdIGdsaWIt?=
	=?gb2312?Q?2.0:_Correct_multilib_conflict?=
Thread-Index: AQHV9/O+5EVbjdVU4Ua2YQSp4M5BtahMJrISgAALPQCAAAfVzYAAB8GAgAAGOyo=
Date: Tue, 17 Mar 2020 05:21:10 +0000
Message-ID: <DM6PR11MB34987C5496D5607D77846E5CEDF60@DM6PR11MB3498.namprd11.prod.outlook.com>
References: <20200311222249.29880-1-jpuhlman@mvista.com>
	<20200311222249.29880-2-jpuhlman@mvista.com>
	<DM6PR11MB3498030B61816C49B946EA35EDF60@DM6PR11MB3498.namprd11.prod.outlook.com>
	<a5332339-6281-76fd-e23e-3ee2ed762720@mvista.com>
	<DM6PR11MB34987CF94AFA084E609D4270EDF60@DM6PR11MB3498.namprd11.prod.outlook.com>,
	<893056b5-2095-a84e-553b-d6278adfc579@mvista.com>
In-Reply-To: <893056b5-2095-a84e-553b-d6278adfc579@mvista.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Qi.Chen@windriver.com; 
x-originating-ip: [192.103.52.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7741b1b4-50e0-4b6b-9ce3-08d7ca330114
x-ms-traffictypediagnostic: DM6PR11MB4249:
x-microsoft-antispam-prvs: <DM6PR11MB4249A49FC2F2131FF806A8F0EDF60@DM6PR11MB4249.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0345CFD558
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(366004)(346002)(39850400004)(376002)(136003)(199004)(8936002)(316002)(91956017)(76116006)(81156014)(81166006)(9686003)(55016002)(478600001)(26005)(2906002)(5660300002)(66476007)(86362001)(71200400001)(186003)(52536014)(110136005)(66574012)(66946007)(66446008)(33656002)(64756008)(66556008)(53546011)(6506007)(224303003)(15974865002)(966005)(19627405001)(7696005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR11MB4249;
	H:DM6PR11MB3498.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: windriver.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z08Fj2QY3EB5T4T2tuVmxVN72r0c/2xdhAGOi3B0oAC32ZUtMNuNmmRf+Pk/g6K7k1cEPBeGCCfX+1sk0k7WuzeiFuJpGQDiXJX+RzmMj2AiPLDzCuD5yr1oKu3EqzrIY+9kw+72dBYBV5hg4kmgqq//MatQdDQlFlHK30482NTPVA9Bia0oU94JW9H78f3jr97wkS9rBisvO4EpcWJLGCXMhEMSnXcuzMdqzY9IynUPBSLJ+Hl8v6h/gNio25G11++k0jVN/P/9en4G2N/uuG4DaR7E9IVl+RoSkr23cn82xLGDZq/0Kd0AczXXPz4/rpOhf1boCw2C882MjG7WtMW86KmnWE52Zv0lZ8oZlphvPoiSFu3KyfHY+9HY+jt1UWq1X0MEdfyckCwS13RUjFsc1Pb52Gpn7KgLBuJoMSS1a07QBSr29Qihh6/mtUZOcZQgMuykKi8Fxv8teAnIGR1cIX+Jo1O7Yn9XTy0OTgyTidqlvP4PF5GyKep+87ANocqoTp6Li2HrNuKLNs6G+w==
x-ms-exchange-antispam-messagedata: SCXzHQLX+zrRGmjVdSy+ojkVuLxCg7XiVhAgzcxlnpGUbTb/u+MRRQg3N0ZP+m3ODjCL2oFr68p3dHleS29AGhzVzA6qxEOeLqZxOTFBAPmdUzPp5VfqYq2R3Vb3Aoa0fKpxrRkkBT83zOia+xF27g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7741b1b4-50e0-4b6b-9ce3-08d7ca330114
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2020 05:21:10.5376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sSvzi8i1uNvF+3k8eOem4OmoeA3W99w9dSg8pmGsVLXtVytI0kQDzJB5uMV7BAwsypo3iNpcbR11X3wrS5v5kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4249
Subject: =?UTF-8?B?5Zue5aSNOiDlm57lpI06IOWbnuWkjTogW1BBVENIIDIvMl0gZ2xpYi0yLjA6IENvcnJlY3QgbXVsdGlsaWIgY29uZmxpY3Q=?=
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
X-List-Received-Date: Tue, 17 Mar 2020 05:21:11 -0000
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_DM6PR11MB34987C5496D5607D77846E5CEDF60DM6PR11MB3498namp_"

--_000_DM6PR11MB34987C5496D5607D77846E5CEDF60DM6PR11MB3498namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

WWVzLiBwdGVzdCB0dXJuZWQgb2ZmLg0KDQpSZWdhcmRzLA0KQ2hlbiBRaQ0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCreivP7IyzogSmVyZW15IEEuIFB1aGxtYW4gPGpwdWhsbWFu
QG12aXN0YS5jb20+DQq3osvNyrG85DogMjAyMMTqM9TCMTfI1SAxMjo1OA0KytW8/sjLOiBDaGVu
LCBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4N
Ctb3zOI6IFJlOiC72Li0OiC72Li0OiBbT0UtY29yZV0gW1BBVENIIDIvMl0gZ2xpYi0yLjA6IENv
cnJlY3QgbXVsdGlsaWIgY29uZmxpY3QNCg0KRG8geW91IGhhdmUgcHRlc3RzIHR1cm5lZCBvZmY/
DQpMb29rcyBsaWtlIGFsbCB0aGUgdGVzdCBjaGVja2luZyBpcyBkb25lIGluIGRvX2luc3RhbGwg
cmF0aGVyIHRoZW4gZG9faW5zdGFsbF9wdGVzdC4gSSB0aGluayBJIG5lZWQgdG8gYWRkIGEgY2hl
Y2sgZm9yIHRoZSBleGlzdGFuY2UgbGlrZSB0aGUgY2hhbmdlIGFib3ZlIHRoZSBhZGRlZCBvbmUu
DQoNCk9uIDMvMTYvMjAyMCA5OjMxIFBNLCBDaGVuLCBRaSB3cm90ZToNCk1VTFRJTElCUyA/PSAi
bXVsdGlsaWI6bGliMzIiDQpERUZBVUxUVFVORV92aXJ0Y2xhc3MtbXVsdGlsaWItbGliMzIgPz0g
ImFybXY3dmV0aGYiDQoNCkkgdGhpbmsgeW91IGNhbiB1c2UgdGhlc2UgdHdvIGxpbmVzIHRvIHJl
cHJvZHVjZSB0aGUgcHJvYmxlbSB3aXRoIG11bHRpbGliIGVuYWJsZWQuDQoNClJlZ2FyZHMsDQpD
aGVuIFFpDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBKZXJlbXkg
QS4gUHVobG1hbiA8anB1aGxtYW5AbXZpc3RhLmNvbT48bWFpbHRvOmpwdWhsbWFuQG12aXN0YS5j
b20+DQq3osvNyrG85DogMjAyMMTqM9TCMTfI1SAxMjowMg0KytW8/sjLOiBDaGVuLCBRaSA8UWku
Q2hlbkB3aW5kcml2ZXIuY29tPjxtYWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tPjsgb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzxtYWlsdG86b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+PG1haWx0bzpvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPg0K1vfM4jogUmU6ILvYuLQ6IFtPRS1jb3JlXSBbUEFUQ0ggMi8yXSBnbGliLTIuMDogQ29y
cmVjdCBtdWx0aWxpYiBjb25mbGljdA0KDQpKdXN0IHN0YW5kYXJkIHg4Ni9pNTg1LiBXaGF0IGFy
ZSB5b3UgdXNpbmcgZm9yIHlvdXIgbXVsaXRsaWIuIGlscDMyL2FhcmNoMzIvYXJtNz8NCg0KcmVx
dWlyZSBjb25mL211bHRpbGliLmNvbmYNCk1VTFRJTElCUyA9ICJtdWx0aWxpYjpsaWIzMiINClg4
NkFSQ0gzMiA9ICJpNTg2Ig0KREVGQVVMVFRVTkVfdmlydGNsYXNzLW11bHRpbGliLWxpYjMyID0g
Imk1ODYiDQpUQVJHRVRfQVJDSF92aXJ0Y2xhc3MtbXVsdGlsaWItbGliMzIgPSAiaTU4NiINClRB
UkdFVF9MRF9BUkNIX3ZpcnRjbGFzcy1tdWx0aWxpYi1saWIzMiA9ICItbSBlbGZfaTM4NiINCkFM
VEJJTkRJUl9TVUZGSVhfdmlydGNsYXNzLW11bHRpbGliLWxpYjMyID0gIjMyIg0KDQpXaGF0IGRv
ZXMgeW91ciAtZSBsb29rIGxpa2UgZm9yIHRoZSByZWNpcGUgdGhhdCBmYWlscz8NCg0KT24gMy8x
Ni8yMDIwIDg6MzAgUE0sIENoZW4sIFFpIHdyb3RlOg0KVGhpcyBwYXRjaCBpcyBjYXVzaW5nIHJl
Z3Jlc3Npb24gaW4gY2FzZSBvZiBxZW11YXJtNjQgbXVsdGlsaWIgZm9yIG1lLiBUaGUgc3RhdGlj
LWxpbmsudGVzdCBmaWxlIGlzIG5vdCB0aGVyZSwgcmVzdWx0aW5nIHRoZSBgbXYnIGNvbW1hbmQg
ZmFpbHVyZS4gSSd2ZSBzZW50IG91dCBhIHBhdGNoIHRvIGZpeCB0aGlzIHByb2JsZW0sIGJ1dCBJ
IGRvbid0IGtub3cgd2hhdCdzIHlvdXIgZW52aXJvbm1lbnQuIFNvIHBsZWFzZSBoZWxwIHJldmll
dy4NCg0KUmVnYXJkcywNCkNoZW4gUWkNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQq3orz+yMs6IG9wZW5lbWJlZGRlZC1jb3JlLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZzxtYWlsdG86b3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiA8b3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnPjxtYWls
dG86b3BlbmVtYmVkZGVkLWNvcmUtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiC0+rHt
IEplcmVteSBBLiBQdWhsbWFuIDxqcHVobG1hbkBtdmlzdGEuY29tPjxtYWlsdG86anB1aGxtYW5A
bXZpc3RhLmNvbT4NCreiy83KsbzkOiAyMDIwxOoz1MIxMsjVIDY6MjINCsrVvP7Iyzogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzxtYWlsdG86b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+PG1haWx0bzpvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPg0K1vfM4jogW09FLWNvcmVdIFtQQVRDSCAyLzJdIGdsaWItMi4wOiBDb3JyZWN0IG11bHRp
bGliIGNvbmZsaWN0DQoNCkZyb206IEplcmVteSBQdWhsbWFuIDxqcHVobG1hbkBtdmlzdGEuY29t
PjxtYWlsdG86anB1aGxtYW5AbXZpc3RhLmNvbT4NCg0KU2lnbmVkLW9mZi1ieTogSmVyZW15IEEu
IFB1aGxtYW4gPGpwdWhsbWFuQG12aXN0YS5jb20+PG1haWx0bzpqcHVobG1hbkBtdmlzdGEuY29t
Pg0KLS0tDQogbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi5pbmMgfCAzICsrKw0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb3JlL2dsaWItMi4wL2dsaWIuaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xp
Yi5pbmMNCmluZGV4IDIzYzM0N2RiZjcuLmVkZWNjNTFmZGIgMTAwNjQ0DQotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLmluYw0KKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi5pbmMNCkBAIC0xMjgsNiArMTI4LDkgQEAgZG9faW5zdGFsbF9hcHBlbmRfY2xh
c3MtdGFyZ2V0ICgpIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICBybSAke0R9JHtkYXRhZGly
fS9pbnN0YWxsZWQtdGVzdHMvZ2xpYi9nZGJ1cy1zZXJpYWxpemF0aW9uLnRlc3QNCiAgICAgICAg
ICAgICAgICAgZmkNCiAgICAgICAgIGZpDQorICAgICAgICBpZiB0ZXN0ICJ4JHtNTFBSRUZJWH0i
ICE9ICJ4IjsgdGhlbg0KKyAgICAgICAgICAgICAgICBtdiAke0R9JHtkYXRhZGlyfS9pbnN0YWxs
ZWQtdGVzdHMvZ2xpYi9zdGF0aWMtbGluay50ZXN0ICR7RH0ke2RhdGFkaXJ9L2luc3RhbGxlZC10
ZXN0cy9nbGliLyR7TUxQUkVGSVh9c3RhdGljLWxpbmsudGVzdA0KKyAgICAgICAgZmkNCiB9DQoN
CiAjIEFzIHdlIGRvIG5vdCBidWlsZCBweXRob24zIGZvciB3aW5kb3dzLCBtYWtlcyBubyBzZW5z
ZSB0byBzaGlwIHRoZSBzY3JpcHQgdGhhdCdzIHVzaW5nIGl0DQotLQ0KMi4xMy4zDQoNCi0tDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KT3BlbmVtYmVk
ZGVkLWNvcmUgbWFpbGluZyBsaXN0DQpPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPG1haWx0bzpPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0K
aHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRk
ZWQtY29yZQ0KDQpbaHR0cHM6Ly9pcG1jZG4uYXZhc3QuY29tL2ltYWdlcy9pY29ucy9pY29uLWVu
dmVsb3BlLXRpY2stZ3JlZW4tYXZnLXYxLnBuZ108aHR0cDovL3d3dy5hdmcuY29tL2VtYWlsLXNp
Z25hdHVyZT91dG1fbWVkaXVtPWVtYWlsJnV0bV9zb3VyY2U9bGluayZ1dG1fY2FtcGFpZ249c2ln
LWVtYWlsJnV0bV9jb250ZW50PWVtYWlsY2xpZW50PiBWaXJ1cy1mcmVlLiB3d3cuYXZnLmNvbTxo
dHRwOi8vd3d3LmF2Zy5jb20vZW1haWwtc2lnbmF0dXJlP3V0bV9tZWRpdW09ZW1haWwmdXRtX3Nv
dXJjZT1saW5rJnV0bV9jYW1wYWlnbj1zaWctZW1haWwmdXRtX2NvbnRlbnQ9ZW1haWxjbGllbnQ+
DQoNCg0KLS0NCkplcmVteSBBLiBQdWhsbWFuDQpqcHVobG1hbkBtdmlzdGEuY29tPG1haWx0bzpq
cHVobG1hbkBtdmlzdGEuY29tPg0KDQoNCi0tDQpKZXJlbXkgQS4gUHVobG1hbg0KanB1aGxtYW5A
bXZpc3RhLmNvbTxtYWlsdG86anB1aGxtYW5AbXZpc3RhLmNvbT4NCg==

--_000_DM6PR11MB34987C5496D5607D77846E5CEDF60DM6PR11MB3498namp_
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
Yes. ptest turned off.</div>
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
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA3=D4=C217=C8=D5 12:58<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Chen, Qi &lt;Qi.Chen@windriver.com&gt;; openembe=
dded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.o=
rg&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: =BB=D8=B8=B4: =BB=D8=B8=B4: [OE-core] [PATCH 2/2] =
glib-2.0: Correct multilib conflict</font>
<div>&nbsp;</div>
</div>
<div>Do you have ptests turned off?<br>
Looks like all the test checking is done in do_install rather then do_insta=
ll_ptest. I think I need to add a check for the existance like the change a=
bove the added one.<br>
<br>
<div class=3D"x_moz-cite-prefix">On 3/16/2020 9:31 PM, Chen, Qi wrote:<br>
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
<span>MULTILIBS ?=3D &quot;multilib:lib32&quot;<br>
</span>
<div>DEFAULTTUNE_virtclass-multilib-lib32 ?=3D &quot;armv7vethf&quot;</div>
<div><br>
</div>
<div>I think you can use these two lines to reproduce the problem with mult=
ilib enabled.<br>
</div>
<span></span></div>
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
color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> Jerem=
y A. Puhlman
<a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:jpuhlman@mvista.com">&l=
t;jpuhlman@mvista.com&gt;</a><br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA3=D4=C217=C8=D5 12:02<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Chen, Qi <a class=3D"x_moz-txt-link-rfc2396E" hr=
ef=3D"mailto:Qi.Chen@windriver.com">
&lt;Qi.Chen@windriver.com&gt;</a>; <a class=3D"x_moz-txt-link-abbreviated" =
href=3D"mailto:openembedded-core@lists.openembedded.org">
openembedded-core@lists.openembedded.org</a> <a class=3D"x_moz-txt-link-rfc=
2396E" href=3D"mailto:openembedded-core@lists.openembedded.org">
&lt;openembedded-core@lists.openembedded.org&gt;</a><br>
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
<div class=3D"x_x_moz-cite-prefix">On 3/16/2020 8:30 PM, Chen, Qi wrote:<br=
>
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
<div id=3D"x_x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif=
" color=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b>
<a class=3D"x_x_moz-txt-link-abbreviated" href=3D"mailto:openembedded-core-=
bounces@lists.openembedded.org">
openembedded-core-bounces@lists.openembedded.org</a> <a class=3D"x_x_moz-tx=
t-link-rfc2396E" href=3D"mailto:openembedded-core-bounces@lists.openembedde=
d.org">
&lt;openembedded-core-bounces@lists.openembedded.org&gt;</a> =B4=FA=B1=ED J=
eremy A. Puhlman <a class=3D"x_x_moz-txt-link-rfc2396E" href=3D"mailto:jpuh=
lman@mvista.com">
&lt;jpuhlman@mvista.com&gt;</a><br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA3=D4=C212=C8=D5 6:22<br>
<b>=CA=D5=BC=FE=C8=CB:</b> <a class=3D"x_x_moz-txt-link-abbreviated" href=
=3D"mailto:openembedded-core@lists.openembedded.org">
openembedded-core@lists.openembedded.org</a> <a class=3D"x_x_moz-txt-link-r=
fc2396E" href=3D"mailto:openembedded-core@lists.openembedded.org">
&lt;openembedded-core@lists.openembedded.org&gt;</a><br>
<b>=D6=F7=CC=E2:</b> [OE-core] [PATCH 2/2] glib-2.0: Correct multilib confl=
ict</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_x_BodyFragment"><font size=3D"2"><span style=3D"font-size:1=
1pt">
<div class=3D"x_x_PlainText">From: Jeremy Puhlman <a class=3D"x_x_moz-txt-l=
ink-rfc2396E" href=3D"mailto:jpuhlman@mvista.com">
&lt;jpuhlman@mvista.com&gt;</a><br>
<br>
Signed-off-by: Jeremy A. Puhlman <a class=3D"x_x_moz-txt-link-rfc2396E" hre=
f=3D"mailto:jpuhlman@mvista.com">
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
<a class=3D"x_x_moz-txt-link-abbreviated" href=3D"mailto:Openembedded-core@=
lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
</div>
</span></font></div>
<div id=3D"x_x_DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2"><br>
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
</div>
</blockquote>
<br>
<pre class=3D"x_x_moz-signature" cols=3D"72">--=20
Jeremy A. Puhlman
<a class=3D"x_x_moz-txt-link-abbreviated" href=3D"mailto:jpuhlman@mvista.co=
m">jpuhlman@mvista.com</a></pre>
</div>
</blockquote>
<br>
<pre class=3D"x_moz-signature" cols=3D"72">--=20
Jeremy A. Puhlman
<a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:jpuhlman@mvista.com"=
>jpuhlman@mvista.com</a></pre>
</div>
</body>
</html>

--_000_DM6PR11MB34987C5496D5607D77846E5CEDF60DM6PR11MB3498namp_--
