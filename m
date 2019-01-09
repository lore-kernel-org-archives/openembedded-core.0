Return-Path: <Rasmus.Villemoes@prevas.se>
X-Greylist: delayed 39273 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 10 Jan 2019 07:26:49 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130128.outbound.protection.outlook.com [40.107.13.128])
	by mail.openembedded.org (Postfix) with ESMTP id 5008E60125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 07:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=99AlNMy+G/2DlS26szUNAbCcL9DvO68rvM5EXXDc+yE=;
	b=nK/5g4NYvwmmV9+kI0iaHEUC++mxg6ttSzGyevlHoQSG2NIh4Gq5UCotkvPLTHBg/lpstjVfPknEeQRnNsIWX9Lw+eeidPNdLmr3R8r04J9GuyTgFuCVxZcweRldiLz41i0qD8ln7MqL73rZ6XrtT/upvSPfpuNim4us5roeMP0=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
	VI1PR10MB2175.EURPRD10.PROD.OUTLOOK.COM (20.177.60.29) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.9; Wed, 9 Jan 2019 06:57:12 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	([fe80::dc83:d2d3:895c:e6fc]) by
	VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	([fe80::dc83:d2d3:895c:e6fc%4]) with mapi id 15.20.1516.010;
	Wed, 9 Jan 2019 06:57:12 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH resend^2] wic: allow bitbake variables in kickstarter
	files
Thread-Index: AQHUnwpquhLMeV6xGkCDGVeOoumouaWmkv0A
Date: Wed, 9 Jan 2019 06:57:11 +0000
Message-ID: <f6ae83c6-0801-52ed-bb34-923ea0d2b5eb@prevas.dk>
References: <20180703125414.28470-1-rasmus.villemoes@prevas.dk>
	<20181229000646.23975-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20181229000646.23975-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR08CA0074.eurprd08.prod.outlook.com
	(2603:10a6:7:2a::45) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
	(2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR10MB2175;
	6:2iWmqAlqohIdhfWkUmG2oaquAQrr0liUpOB3PePQxn8LVBtllGvGza7Y+efvIQfjMsQCcM0o0UJl5XLu0dAHEq3seG00W7eYmZz0nGw9i0Rh5DJi7jVsqP/Jdx3R7YMYGpEU/YuemCg2/czre0TQIQRNaW67en1NI9PcoQx1iSDJTQnIUB0c+Mu+vdm2SzwoRgU3ne1ceLKeMpYah0xYWKMnfeu1zwTBh5fCDth9YBq/tLazDYLkUXreZve/bMr0OQ7Lxct7D3eIJ4LaEVvJBSyCesHztRJfF7NcjHQOY02RxMJCjm5Z5Jdn19tyoZaghPDs5ewLWlbCy72SkENmNb/GiYVLJWS/akuuAhi38N0GRz79iYFWlP2AeH6KxeC1PI1ud9NVjx6xl9P9fFu3ZOQxJIZEu81AfSwzu4r/jR1zkVtmukCSatBgFIs8s8PSnb82BQ62ialmH4H0ov+7aA==;
	5:IFV7hPsI1x5RldNauhziH8orhOlQ/O4dvBgjhUH9HDplLRs1z1Nv9uE11OH3hkNDKyR5pFijQElpOq5TCpu3bHpTJrm5Xja96Us2k5+1E5wIDMRLddT9L0NJvoSrReYnPGaiOVRBNT0nxDFKJjqEcPR7hnJ9EsglcyGFT2vfD5iuG/eppsZjBXU3uS8WBM8Tepp06Z520nqX3tFdb/IPIA==;
	7:2PkPF+LiaI/9ieSP9xd95jVmEoyVI8z3ZxXxKLyXhpISoYWS5W9Da/NXYC+fFl+cDb9y4NO+yMFhsHZMKkUH/xw7MSpb2+KjjoEvDp2ZkMiyvf+yWJw40n1bDal2zulcn//ioQ7opy1L0kD3GEaISg==
x-ms-office365-filtering-correlation-id: caa27f33-9a7b-4757-3de2-08d675ffadf2
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR10MB2175; 
x-ms-traffictypediagnostic: VI1PR10MB2175:
x-microsoft-antispam-prvs: <VI1PR10MB2175369E66C1D9849766293B8A8B0@VI1PR10MB2175.EURPRD10.PROD.OUTLOOK.COM>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3002001)(3231475)(944501520)(52105112)(93006095)(10201501046)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR10MB2175; BCL:0; PCL:0; RULEID:; SRVR:VI1PR10MB2175; 
x-forefront-prvs: 0912297777
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(136003)(396003)(366004)(39850400004)(189003)(199004)(81166006)(81156014)(8676002)(4326008)(8936002)(6246003)(8976002)(31696002)(446003)(42882007)(476003)(2906002)(97736004)(2616005)(11346002)(478600001)(31686004)(14454004)(72206003)(68736007)(2351001)(106356001)(5640700003)(6116002)(53936002)(102836004)(6512007)(486006)(6436002)(186003)(229853002)(5660300001)(44832011)(26005)(6486002)(3846002)(6506007)(386003)(6916009)(105586002)(76176011)(99286004)(52116002)(15974865002)(305945005)(36756003)(25786009)(66066001)(7736002)(54906003)(2501003)(74482002)(316002)(71190400001)(71200400001)(14444005)(256004)(81973001)(18886075002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2175;
	H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XFFPRRvcT1YHqHGBdCknRNHiPzOACCzV1BM3wLTFXfINI7yA7B1POjobWl5nkprQXBpkj3S830FcKhePlZFnEHmUFzKZOCGfT6MOmhvK16vTb4aqSclYeJ5A0jKHsOxRuX2ceVUbK7yHrUaADaIoUJiC54bYXaIb563f6i7vtiRC0Y3UrtwyO2CIhbXgqv6gvxg3lzzPnnTh6TMNa4hR12WqYLgkLh6n+AhFSZlu1M6IaWKt2eIAbArMdc3/PrYRHPxd3j6go9XKvN8J57DrlcGUwsxrxibRPScE6yN2WM0PDAmxpO8BZToRzHRZpM3D
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: caa27f33-9a7b-4757-3de2-08d675ffadf2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2019 06:57:11.1365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2175
Cc: Ed Bartosh <ed.bartosh@linux.intel.com>
Subject: Re: [PATCH resend^2] wic: allow bitbake variables in kickstarter files
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
X-List-Received-Date: Thu, 10 Jan 2019 07:26:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA1C1A9B9C211C4A8785C571003F58C1@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

cGluZw0KDQpPbiAyOS8xMi8yMDE4IDAxLjA2LCBSYXNtdXMgVmlsbGVtb2VzIHdyb3RlOg0KPiBp
bWFnZV90eXBlc193aWMuYmJjbGFzcyBoYXMgYSBtZWNoYW5pc20gZm9yIGRvaW5nIHZhcmlhYmxl
IHN1YnN0aXR1dGlvbg0KPiBvbiAud2tzIGZpbGVzIGJ5IHNpbXBseSBsZXR0aW5nIHRoZSBpbnB1
dCBmaWxlIGJlIGNhbGxlZA0KPiAud2tzLmluLiBIb3dldmVyLCB0aGF0IGRvZXNuJ3QgYWxsb3cg
dXNpbmcgdmFyaWFibGVzIGluIGZpbGVzIGluY2x1ZGVkDQo+IHZpYSB0aGUgaW5jbHVkZSBkaXJl
Y3RpdmUuIFRoaXMgaXMgdW5mb3J0dW5hdGUsIGJlY2F1c2UgbGFja2luZyBlaXRoZXINCj4gdGhl
IGFiaWxpdHkgdG8gaW5jbHVkZSBvdGhlciBmaWxlcyBvciB2YXJpYWJsZSBzdWJzdGl0dXRpb24g
bGVhZHMgdG8NCj4gZnJhZ2lsZSBhbmQgZXJyb3ItcHJvbmUgZHVwbGljYXRpb24gYmV0d2VlbiBr
aWNrc3RhcnRlciBmaWxlcyBhbmQNCj4gcmVjaXBlcy9jb25maWd1cmF0aW9uIGZpbGVzIHVzZWQg
Zm9yIHZhcmlvdXMgYm9hcmRzLg0KPiANCj4gVGhpcyBhZGRzIChzb21ld2hhdCBuYWl2ZSkgc3Vw
cG9ydCBmb3IgdmFyaWFibGUgc3Vic3RpdHV0aW9uIGluIGFsbA0KPiBmaWxlcyBwYXJzZWQgYnkg
d2ljLiBUaGUgdXNlciBzaG91bGQgYWRkIGFsbCByZXF1aXJlZCB2YXJpYWJsZXMgdG8NCj4gV0lD
VkFSUyB0byBnZXQgdGhlbSBleHBvcnRlZCBhcHByb3ByaWF0ZWx5Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogUmFzbXVzIFZpbGxlbW9lcyA8cmFzbXVzLnZpbGxlbW9lc0BwcmV2YXMuZGs+DQo+IC0t
LQ0KPiBzY3JpcHRzL2xpYi93aWMva3NwYXJzZXIucHkgfCAxNyArKysrKysrKysrKysrKysrKw0K
PiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9z
Y3JpcHRzL2xpYi93aWMva3NwYXJzZXIucHkgYi9zY3JpcHRzL2xpYi93aWMva3NwYXJzZXIucHkN
Cj4gaW5kZXggN2U1YTljNTA5Mi4uMDhiYWY3NjEyMyAxMDA2NDQNCj4gLS0tIGEvc2NyaXB0cy9s
aWIvd2ljL2tzcGFyc2VyLnB5DQo+ICsrKyBiL3NjcmlwdHMvbGliL3dpYy9rc3BhcnNlci5weQ0K
PiBAQCAtMjgsMTQgKzI4LDMwIEBADQo+ICBpbXBvcnQgb3MNCj4gIGltcG9ydCBzaGxleA0KPiAg
aW1wb3J0IGxvZ2dpbmcNCj4gK2ltcG9ydCByZQ0KPiAgDQo+ICBmcm9tIGFyZ3BhcnNlIGltcG9y
dCBBcmd1bWVudFBhcnNlciwgQXJndW1lbnRFcnJvciwgQXJndW1lbnRUeXBlRXJyb3INCj4gIA0K
PiAgZnJvbSB3aWMuZW5naW5lIGltcG9ydCBmaW5kX2Nhbm5lZA0KPiAgZnJvbSB3aWMucGFydGl0
aW9uIGltcG9ydCBQYXJ0aXRpb24NCj4gK2Zyb20gd2ljLm1pc2MgaW1wb3J0IGdldF9iaXRiYWtl
X3Zhcg0KPiAgDQo+ICBsb2dnZXIgPSBsb2dnaW5nLmdldExvZ2dlcignd2ljJykNCj4gIA0KPiAr
X19leHBhbmRfdmFyX3JlZ2V4cF9fID0gcmUuY29tcGlsZShyIlwke1tee31AXG5cdCA6XSt9IikN
Cj4gKw0KPiArZGVmIGV4cGFuZF9saW5lKGxpbmUpOg0KPiArICAgIHdoaWxlIFRydWU6DQo+ICsg
ICAgICAgIG0gPSBfX2V4cGFuZF92YXJfcmVnZXhwX18uc2VhcmNoKGxpbmUpDQo+ICsgICAgICAg
IGlmIG5vdCBtOg0KPiArICAgICAgICAgICAgcmV0dXJuIGxpbmUNCj4gKyAgICAgICAga2V5ID0g
bS5ncm91cCgpWzI6LTFdDQo+ICsgICAgICAgIHZhbCA9IGdldF9iaXRiYWtlX3ZhcihrZXkpDQo+
ICsgICAgICAgIGlmIHZhbCBpcyBOb25lOg0KPiArICAgICAgICAgICAgbG9nZ2VyLndhcm5pbmco
ImNhbm5vdCBleHBhbmQgdmFyaWFibGUgJXMiICUga2V5KQ0KPiArICAgICAgICAgICAgcmV0dXJu
IGxpbmUNCj4gKyAgICAgICAgbGluZSA9IGxpbmVbOm0uc3RhcnQoKV0gKyB2YWwgKyBsaW5lW20u
ZW5kKCk6XQ0KPiArDQo+ICBjbGFzcyBLaWNrU3RhcnRFcnJvcihFeGNlcHRpb24pOg0KPiAgICAg
ICIiIkN1c3RvbSBleGNlcHRpb24uIiIiDQo+ICAgICAgcGFzcw0KPiBAQCAtMTkwLDYgKzIwNiw3
IEBAIGNsYXNzIEtpY2tTdGFydCgpOg0KPiAgICAgICAgICAgICAgICAgIGxpbmUgPSBsaW5lLnN0
cmlwKCkNCj4gICAgICAgICAgICAgICAgICBsaW5lbm8gKz0gMQ0KPiAgICAgICAgICAgICAgICAg
IGlmIGxpbmUgYW5kIGxpbmVbMF0gIT0gJyMnOg0KPiArICAgICAgICAgICAgICAgICAgICBsaW5l
ID0gZXhwYW5kX2xpbmUobGluZSkNCj4gICAgICAgICAgICAgICAgICAgICAgdHJ5Og0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgbGluZV9hcmdzID0gc2hsZXguc3BsaXQobGluZSkNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhcnNlZCA9IHBhcnNlci5wYXJzZV9hcmdzKGxpbmVfYXJn
cykNCj4gDQoNCg0KLS0gDQpSYXNtdXMgVmlsbGVtb2VzDQpTb2Z0d2FyZSBEZXZlbG9wZXINClBy
ZXZhcyBBL1MNCkhlZGVhZ2VyIDMNCkRLLTgyMDAgQWFyaHVzIE4NCis0NSA1MTIxMDI3NA0KcmFz
bXVzLnZpbGxlbW9lc0BwcmV2YXMuZGsNCnd3dy5wcmV2YXMuZGsNCg==

