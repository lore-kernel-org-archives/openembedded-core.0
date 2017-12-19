Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0088.outbound.protection.outlook.com [104.47.40.88])
	by mail.openembedded.org (Postfix) with ESMTP id 963F37842D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ae/FB96IYi7vs+xmiQVn+rJujmMsVjd5XPK5qlhqJOk=;
	b=EJbFpP2qohlMcRDQEwmEJxT9RQmffAd4MeWqfNpQ9PTngGzjeefhj/QjxwycHbelmHRrg/dHrLkVn1wHmKcmRLTu5ExVKwR2JliosfhCoqTsyG2SyikLjuXP2m4rW+34egOvtIXOBApxYawVFS/ucyoUVFsRF2ZkNDWFnXa2U3Q=
Received: from BL2PR02MB2163.namprd02.prod.outlook.com (10.167.97.25) by
	BL2PR02MB2164.namprd02.prod.outlook.com (10.167.97.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Tue, 19 Dec 2017 22:11:23 +0000
Received: from BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::753a:6ea6:a5e0:c73]) by BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::753a:6ea6:a5e0:c73%14]) with mapi id 15.20.0323.018;
	Tue, 19 Dec 2017 22:11:23 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] kernel-fitimage: Fix bad image type
	replacement for aarch64
Thread-Index: AQHTeRUUHOj74+mZdEuf3rNDnt3tKKNLOCWw
Date: Tue, 19 Dec 2017 22:11:23 +0000
Message-ID: <BL2PR02MB216350BF36AFB252BDF95258B90F0@BL2PR02MB2163.namprd02.prod.outlook.com>
References: <1513189598-9420-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<BL2PR02MB21635E15F53E8D190D70AD01B90F0@BL2PR02MB2163.namprd02.prod.outlook.com>
	<CAJTo0LZD7BvXHsvmUaF9r+-j02o6uHN_gRSo+NT5F5xkSs9fQg@mail.gmail.com>
In-Reply-To: <CAJTo0LZD7BvXHsvmUaF9r+-j02o6uHN_gRSo+NT5F5xkSs9fQg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BL2PR02MB2164;
	6:TVwwuht+qNfH2RJYh2HC+P8P7YWFqiGbAYpZEChc2JbrLpYpUI2y26Rfb2RPSR2WjDaCjPVHK5XxO6mIIUssR5YY9ySvYW1ABkn+sk9XtIu8FOYbgFxO3vz7cLUG3N1+Bd2EX8lFdmkmQPOJi0E3Tl1Bh+abeqqzR7FM6zdI6Yazoh37OGdth2E0LG//jOL26BpmcSBLmmDO4/z4vG8anS73kMLPaYY8go2LnuHyfd25oSNsYNReWDWNY0frYxgszvs5+yYN6BsT2GpH5fneKqceqJQbJi5L7fiXEyBjsMW3wcRX84UntmCupoFbdTt6ExmUraMucHtlku4b/4t5xh7VjhVay0kV09d8jjR/Lb0=;
	5:ppe+i6SX7dGylbQPKVpeokiD3RfysLct+cTAv4lDVDy9aw8GBrLzQJZ6U6G/5uWq/ee1NQMX57vf9hwxhwFM6q7A8FisPRCs5XM8xkP5rNeZfrO4rM9TU/hhzJOszUy6fZXgoOG52M004sUN9C03iuZISoiIi6rv1JvPHZ/47m8=;
	24:yieO4jHblc3xdQgrNFeu50lSMlODkMKAjUzBJ/iOUo1YetbwZAWNWJ0/BwufzqGndbQwtWH813Ta3Ht5teLt074qMGLHV0cKsAFEk003tDc=;
	7:aoYd9KlWBSnd2nl7Gr8qQd2IniXAaZuY8obqsSTlHrvtk0iKaVt5GbgKSpgAbcGJS3GpFISLm/aIgMn8EJscHogaNmJrWCQAWXWYQIoUjF6b9TTcZkGFbRZAI7Z6Lu2sV/u981wCGV7r+3+eltOmYP3p/1KkQMzx2IwMGJo9+m0bf5JhF74bkX9FtvtgYC6HkzSKoBL6VzHL8JP+1Ck2lGbQoN2xeBssguchSvGfIuAslglgWw4izczh1IeDw8vz
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 850eada4-a88e-4f91-6437-08d5472d70a4
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(48565401081)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060);
	SRVR:BL2PR02MB2164; 
x-ms-traffictypediagnostic: BL2PR02MB2164:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-microsoft-antispam-prvs: <BL2PR02MB2164EA5EEC18E14E39FAB0B1B90F0@BL2PR02MB2164.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592)(228905959029699); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(5005006)(8121501046)(3231023)(3002001)(93006095)(93001095)(10201501046)(6055026)(6041248)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123555025)(20161123560025)(6072148)(201708071742011);
	SRVR:BL2PR02MB2164; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BL2PR02MB2164; 
x-forefront-prvs: 052670E5A4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(376002)(39860400002)(366004)(346002)(13464003)(24454002)(199004)(189003)(4326008)(102836003)(6436002)(8936002)(68736007)(1720100001)(229853002)(3660700001)(6246003)(86362001)(97736004)(316002)(53936002)(3280700002)(76176011)(81166006)(72206003)(2900100001)(5250100002)(6506007)(59450400001)(33656002)(53546011)(7696005)(66066001)(25786009)(74316002)(55016002)(99286004)(478600001)(6306002)(9686003)(105586002)(966005)(106356001)(3846002)(2906002)(6116002)(5660300001)(305945005)(2950100002)(6916009)(81156014)(14454004)(7736002)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR02MB2164;
	H:BL2PR02MB2163.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850eada4-a88e-4f91-6437-08d5472d70a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2017 22:11:23.0152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR02MB2164
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: Fix bad image type replacement for aarch64
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
X-List-Received-Date: Tue, 19 Dec 2017 22:44:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQnVydG9uLCBSb3NzIFtt
YWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tXQ0KPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJlciAx
OSwgMjAxNyAyOjAyIFBNDQo+IFRvOiBNYW5qdWt1bWFyIEhhcnRoaWtvdGUgTWF0aGEgPE1BTkpV
S1VNQHhpbGlueC5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBrZXJuZWwtZml0aW1hZ2U6
IEZpeCBiYWQgaW1hZ2UgdHlwZSByZXBsYWNlbWVudCBmb3INCj4gYWFyY2g2NA0KPiANCj4gVGhp
cyBpcyBxdWV1ZWQgaW4gcm9zcy9tdXQyIGFuZCBzaG91bGQgYmUgaW4gbWFzdGVyIHNob3J0bHks
IGFsdGhvdWdoIGFzIGl0J3MgYWxtb3N0DQo+IHRoZSBDaHJpc3RtYXMgaG9saWRheXMgaGVyZSBp
dCBtYXkgYmUgaW4gdGhlIG5ldyB5ZWFyLg0KPiANCg0KVGhhbmtzIFJvc3MsIG5ldyB5ZWFyIHdv
cmtzIDopDQoNCj4gUm9zcw0KPiANCj4gT24gMTkgRGVjZW1iZXIgMjAxNyBhdCAyMTozNCwgTWFu
anVrdW1hciBIYXJ0aGlrb3RlIE1hdGhhDQo+IDxNQU5KVUtVTUB4aWxpbnguY29tIDxtYWlsdG86
TUFOSlVLVU1AeGlsaW54LmNvbT4gPiB3cm90ZToNCj4gDQo+IA0KPiAJUGluZz8NCj4gDQo+IAlB
bnkgcmVhc29uIGZvciB0aGlzIGJlaW5nIGluIHBlbmRpbmcgc3RhdHVzPyBQbGVhc2UgbGV0IG1l
IGtub3cNCj4gDQo+IAlUaGFua3MsDQo+IAlNYW5qdQ0KPiANCj4gDQo+IAk+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IAk+IEZyb206IE1hbmp1a3VtYXIgTWF0aGEgW21haWx0bzptYW5q
dWt1bWFyLmhhcnRoaWtvdGUtDQo+IG1hdGhhQHhpbGlueC5jb20gPG1haWx0bzptYW5qdWt1bWFy
LmhhcnRoaWtvdGUtbWF0aGFAeGlsaW54LmNvbT4gXQ0KPiAJPiBTZW50OiBXZWRuZXNkYXksIERl
Y2VtYmVyIDEzLCAyMDE3IDEwOjI3IEFNDQo+IAk+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxtYWlsdG86b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4NCj4gCT4gQ2M6IFRob21hcyBQZXJyb3QgPHRob21hcy5wZXJyb3RAdHVw
aS5mcg0KPiA8bWFpbHRvOnRob21hcy5wZXJyb3RAdHVwaS5mcj4gPjsgTWFuanVrdW1hciBIYXJ0
aGlrb3RlIE1hdGhhDQo+IAk+IDxNQU5KVUtVTUB4aWxpbnguY29tIDxtYWlsdG86TUFOSlVLVU1A
eGlsaW54LmNvbT4gPg0KPiAJPiBTdWJqZWN0OiBbT0UtY29yZV1bUEFUQ0hdIGtlcm5lbC1maXRp
bWFnZTogRml4IGJhZCBpbWFnZSB0eXBlDQo+IHJlcGxhY2VtZW50IGZvcg0KPiAJPiBhYXJjaDY0
DQo+IAk+DQo+IAk+IEZyb206IFRob21hcyBQZXJyb3QgPHRob21hcy5wZXJyb3RAdHVwaS5mcg0K
PiA8bWFpbHRvOnRob21hcy5wZXJyb3RAdHVwaS5mcj4gPg0KPiAJPg0KPiAJPiBXaGVuIHVzaW5n
IGtlcm5lbC1maXRpbWFnZSBjbGFzcyB3aXRoIGFhcmNoNjQsIHRoZSBpbWFnZSB0eXBlIGhhcyB0
byBiZQ0KPiBJbWFnZSBub3QNCj4gCT4gekltYWdlLiAgVGhpcyBwYXRjaCBmaXhlcyB0aGUgYmFk
IGltYWdlIHR5cGUgcmVwbGFjZW1lbnQgZm9yDQo+IAk+IGFhcmNoNjQNCj4gCT4NCj4gCT4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBlcnJvdCA8dGhvbWFzLnBlcnJvdEB0dXBpLmZyDQo+IDxtYWls
dG86dGhvbWFzLnBlcnJvdEB0dXBpLmZyPiA+DQo+IAk+IFNpZ25lZC1vZmYtYnk6IE1hbmp1a3Vt
YXIgTWF0aGEgPG1hbmp1a3VtYXIuaGFydGhpa290ZS0NCj4gbWF0aGFAeGlsaW54LmNvbSA8bWFp
bHRvOm1hbmp1a3VtYXIuaGFydGhpa290ZS1tYXRoYUB4aWxpbnguY29tPiA+DQo+IAk+IC0tLQ0K
PiAJPiAgbWV0YS9jbGFzc2VzL2tlcm5lbC1maXRpbWFnZS5iYmNsYXNzIHwgNyArKysrKy0tDQo+
IAk+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiAJ
Pg0KPiAJPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL2tlcm5lbC1maXRpbWFnZS5iYmNsYXNz
IGIvbWV0YS9jbGFzc2VzL2tlcm5lbC0NCj4gCT4gZml0aW1hZ2UuYmJjbGFzcw0KPiAJPiBpbmRl
eCAxNzkxODViLi45YmFmMzk5IDEwMDY0NA0KPiAJPiAtLS0gYS9tZXRhL2NsYXNzZXMva2VybmVs
LWZpdGltYWdlLmJiY2xhc3MNCj4gCT4gKysrIGIvbWV0YS9jbGFzc2VzL2tlcm5lbC1maXRpbWFn
ZS5iYmNsYXNzDQo+IAk+IEBAIC03LDkgKzcsMTIgQEAgcHl0aG9uIF9fYW5vbnltb3VzICgpIHsN
Cj4gCT4gICAgICAgICAgZGVwZW5kcyA9ICIlcyB1LWJvb3QtbWtpbWFnZS1uYXRpdmUgZHRjLW5h
dGl2ZSIgJSBkZXBlbmRzDQo+IAk+ICAgICAgICAgIGQuc2V0VmFyKCJERVBFTkRTIiwgZGVwZW5k
cykNCj4gCT4NCj4gCT4gLSAgICAgICAgaWYgZC5nZXRWYXIoIlVCT09UX0FSQ0giKSA9PSAibWlw
cyI6DQo+IAk+ICsgICAgICAgIHVhcmNoID0gZC5nZXRWYXIoIlVCT09UX0FSQ0giKQ0KPiAJPiAr
ICAgICAgICBpZiB1YXJjaCA9PSAiYXJtNjQiOg0KPiAJPiArICAgICAgICAgICAgcmVwbGFjZW1l
bnR0eXBlID0gIkltYWdlIg0KPiAJPiArICAgICAgICBlbGlmIHVhcmNoID09ICJtaXBzIjoNCj4g
CT4gICAgICAgICAgICAgIHJlcGxhY2VtZW50dHlwZSA9ICJ2bWxpbnV6LmJpbiINCj4gCT4gLSAg
ICAgICAgZWxpZiBkLmdldFZhcigiVUJPT1RfQVJDSCIpID09ICJ4ODYiOg0KPiAJPiArICAgICAg
ICBlbGlmIHVhcmNoID09ICJ4ODYiOg0KPiAJPiAgICAgICAgICAgICAgcmVwbGFjZW1lbnR0eXBl
ID0gImJ6SW1hZ2UiDQo+IAk+ICAgICAgICAgIGVsc2U6DQo+IAk+ICAgICAgICAgICAgICByZXBs
YWNlbWVudHR5cGUgPSAiekltYWdlIg0KPiAJPiAtLQ0KPiAJPiAyLjcuNA0KPiANCj4gCS0tDQo+
IAlfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiAJT3Bl
bmVtYmVkZGVkLWNvcmUgbWFpbGluZyBsaXN0DQo+IAlPcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxtYWlsdG86T3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+DQo+IAlodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlDQo+IDxodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1jb3JlPg0KPiANCj4gDQoNCg==

