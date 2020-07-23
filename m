Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.64])
 by mx.groups.io with SMTP id smtpd.web10.13135.1595513443101440591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 07:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=exemMu4I;
 spf=pass (domain: windriver.com, ip: 40.107.236.64, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vz0/Z/C8CYm7sFBOD8YpDEHPJvHoN+qYpOCiKAGo7YYgXiTVVtuqvChF1A/Aybd783fLAot7cDrgtbGdk/Ewaw+qF7lVr3mzrpro7few0WyZeZiE6ed9QCDlgjyadUpMDjfJkHNJQhr7knq/Ils7EQz+Sqq/Xe/2VJ5m7+oGSTPREViDoJN0ntcCs26mWIUTNkpLFOfRwfOcaB1kacN1eG6h8YeVI6M4nERNvE/+dkLNpqw1K70YJmGO8zUMSoIvEKOT9aGtS64sqKO/BY7EgEa7BvUFm9gH5xiwq37Qtky/VC8EFe38ykAEky7CVktLJ0N8YsfuhYYvRGMSH9zzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftq4A/ipcqeKrvB1IjltkbAwwyk82XQTsyx/wud7YxY=;
 b=SYNBYNKojtXwoYUfhRbamASgh6lpvIzQhVRz+xaRaX5a0zg+hG0evCvD2EkHyfPzkXxlfhsIfmqMgyeDfWVvOYUskORU8+By55pfVvbIhcPuhW/fU6qtQEjBoYAgNqzmJWG0RPvI8+st8vLsnWr9eMSvHkIIaz8iZ//N+a6QjTHqX18pimiPLienyJvBFYSt1bizGR6CqEKtlEvMdcCSowC9ijAJzmesdhjDLbC61QZaEndKiMtQnQDfE+XLc8ofAlZE9HU579iOmHCWSz/NbqwfXxjCZJA1aU0TAnbRD2MFEGddSPw4I2ktf//sbbPIX2Uk4XmN1TLPhDGrE6cb4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftq4A/ipcqeKrvB1IjltkbAwwyk82XQTsyx/wud7YxY=;
 b=exemMu4INAv4BiyP1GwMQhUokMh43nvMvDgvndklKcgsMuf7GXit058HJNkPPAurbuwFCu1OwP/HlzDig6OlHTVIdCpPCnbE/czExSL67ULmP1kRGWKp0ACNoSjMpBQvXw++PslBgzKMCVRQWspgBA6jRaPV9AGRcBvageByCl4=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB2584.namprd11.prod.outlook.com (2603:10b6:a02:c8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 14:10:41 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::90e6:1883:a2fd:98ef]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::90e6:1883:a2fd:98ef%6]) with mapi id 15.20.3216.024; Thu, 23 Jul 2020
 14:10:40 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [oe-core][PATCH 1/1] libdnf: allow reproducible binary builds
Thread-Topic: [oe-core][PATCH 1/1] libdnf: allow reproducible binary builds
Thread-Index: AQHWYHPA3bLQhocAMkuswSLJBVpesakVM/qQ
Date: Thu, 23 Jul 2020 14:10:40 +0000
Message-ID: 
 <BY5PR11MB39922A5B311849A8E4EE81DF88760@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20200722203111.140237-1-joe.slater@windriver.com>
 <b840115e67395ab5a1ba2848acc48639d75921c9.camel@linuxfoundation.org>
In-Reply-To: 
 <b840115e67395ab5a1ba2848acc48639d75921c9.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [24.4.218.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b97b550b-1e8a-4297-a589-08d82f122e85
x-ms-traffictypediagnostic: BYAPR11MB2584:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BYAPR11MB2584BD0DFD925D6360B436E888760@BYAPR11MB2584.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hrImWieW7xYoMWYVfg1pY2dqnSxy4cQv3SC6PNGji2dYbpbu2VlFU4DEIBQoEQ7V67aGvPSpIfEHwi1R9UdZA4E6MWbgAzHtx7tOSJLiKDRPaitf/UMt9HU+ZjhbsAVExuknDVRfp5sfwLvVSHK2UWe0/yxo7S2caFWp3W/mdxyqt91a8vh2yHSZwwfXRe1U7mYU/E+mQHKr9rsIqulFTMqaQU5GLB7AMDVpFhzkh96jVrYpCT/A7XE+AxpSxEMnVbH/+K0pgsmpkxPxRvE5m6a/uA3OGrvGaHRen6qU/PKzWGfu3NnxXrlINF1otxF6V2esJA2fP2dTTSfJVPlgUA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(366004)(136003)(346002)(39850400004)(396003)(6506007)(55016002)(33656002)(64756008)(76116006)(8676002)(478600001)(71200400001)(53546011)(110136005)(316002)(66476007)(66556008)(66446008)(66946007)(52536014)(5660300002)(7696005)(83380400001)(186003)(8936002)(2906002)(4326008)(107886003)(9686003)(26005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 1fPGbjrwIFC3S1icvoUmX2MmXjQ/cW88y/vrd4M0I1bt80k7vwR7JBHLrt8By0+v13cFHAihBC7gKMH9ze9+SBqGV2nc4ACyxY7I/lh3+lKPmd5oxT2UNVsylay70y9Q5hw4zzG/YKR4UlhO7lJg8HC7Ax/MC9D4SOVXS00/jnO7Z1bYhWYxUXEgj3UwbXZJlHCb/AAX+l9WH/6CWrVvaY6T8Gj7WcOC/QCiPXuG8SxnsaNsMF1wdZTqhYRWQws98LgtXLTCToUw3HU2E/OMCfsuZIjGU/9JNZn46WvTBL2Ah9BYMiO3EWQqVvnKjvXWOiNZ6YR4+hCcWsNZRZf0Pyhi2hc5dUgtmB1TvQLWqYCtmycp5jx7JLJCoqKslG9XDKcE/psBKnWFQOYnHnXWNRYiTL+lzizkwfpd8lyRQBVZfRCbHOxLKzQXbjbAOH9N2ATn2bJglfkyllYlT6AxAtiCkkuvdbp9Hjq8CGgfiUc=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b97b550b-1e8a-4297-a589-08d82f122e85
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2020 14:10:40.7983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ks6lYjO1t/aW4ePfWCBlgKYyo2EPD6MEWvBQAB4XeZ1AgJjoGcB1ld/JHxElmkJytq5NiHn2Kp4U1EovLFIUOfuytJhD81wTBMo46aV6d0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2584
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2UgbmV2ZXIgZW5hYmxlIHRoZSB0ZXN0cywgaG93ZXZlciB0aGUgImRpcmVjdG9yeSIgaXMgcHJv
Y2Vzc2VkLCBwZXJoYXBzIGJ5IGNvZGUgdGhhdCBpcyBuZXZlciBleGVjdXRlZCwgYnV0IHRoZSBj
b2RlIGlzIGJ1aWx0IGludG8gdGhlIGxpYnJhcnkuICBTaW5jZSBpdCBpcyBhbHJlYWR5IGRlYWxp
bmcgd2l0aCBhIGRpcmVjdG9yeSB0aGF0IHdpbGwgbm90IGV4aXN0IG9uIHRoZSB0YXJnZXQsIEkg
ZmVsdCBpdCBzYWZlciBqdXN0IHRvIGZlZWQgaXQgYSAic2FmZSIgbmFtZSBhbmQgbGV0IHVwc3Ry
ZWFtIGRlYWwgd2l0aCBub3QgYnVpbGRpbmcgdGhlIGNvZGUgaW4gdGhlIGZpcnN0IHBsYWNlLg0K
DQpKb2UNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGll
IDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiANClNlbnQ6IFdlZG5lc2RheSwg
SnVseSAyMiwgMjAyMCAzOjAxIFBNDQpUbzogU2xhdGVyLCBKb3NlcGggPGpvZS5zbGF0ZXJAd2lu
ZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCkNj
OiBNYWNMZW9kLCBSYW5keSA8UmFuZHkuTWFjTGVvZEB3aW5kcml2ZXIuY29tPg0KU3ViamVjdDog
UmU6IFtvZS1jb3JlXVtQQVRDSCAxLzFdIGxpYmRuZjogYWxsb3cgcmVwcm9kdWNpYmxlIGJpbmFy
eSBidWlsZHMNCg0KT24gV2VkLCAyMDIwLTA3LTIyIGF0IDEzOjMxIC0wNzAwLCBKb2UgU2xhdGVy
IHdyb3RlOg0KPiBVc2UgYSBzdGF0aWMgVEVTVERBVEFESVIgaWYgdGVzdHMgYXJlIGRpc2FibGVk
LiAgQWxsb3cgb3ZlcnJpZGUgb2YgDQo+IFRFU1REQVRBRElSIGlmIHRlc3RzIGFyZSBlbmFibGVk
IHNpbmNlIHRoZSBkZWZhdWx0IHdpbGwgYmUgd3JvbmcgZm9yIA0KPiB0YXJnZXQgYnVpbGRzLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSm9lIFNsYXRlciA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29t
Pg0KPiAtLS0NCj4gIC4uLi9saWJkbmYvbGliZG5mL2VuYWJsZV90ZXN0X2RhdGFfZGlyX3NldC5w
YXRjaCAgIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKw0KPiAgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xpYmRuZi9saWJkbmZfMC40OC4wLmJiICAgICAgfCAgMSArDQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDI3IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCANCj4gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2xpYmRuZi9saWJkbmYvZW5hYmxlX3Rlc3RfZGF0YV9kaXJfc2V0LnBhdGNo
DQo+IA0KPiBkaWZmIC0tZ2l0IA0KPiBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGli
ZG5mL2VuYWJsZV90ZXN0X2RhdGFfZGlyX3NldC5wYXRjaCANCj4gYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvbGliZG5mL2xpYmRuZi9lbmFibGVfdGVzdF9kYXRhX2Rpcl9zZXQucGF0Y2gNCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMC4uZTM3ODRjYw0KPiAtLS0gL2Rldi9u
dWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9saWJkbmYvbGliZG5mL2VuYWJsZV90
ZXN0X2RhdGFfZGlyX3NldC5wYXQNCj4gKysrIGNoDQo+IEBAIC0wLDAgKzEsMjYgQEANCj4gK2xp
YmRuZjogYWxsb3cgcmVwcm9kdWNpYmxlIGJpbmFyeSBidWlsZHMNCj4gKw0KPiArVXNlIGEgZHVt
bXkgZGlyZWN0b3J5IGZvciB0ZXN0IGRhdGEgaWYgbm90IGJ1aWx0IFdJVEhfVEVTVFMuICBBbGxv
dyANCj4gK2ZvciBvdmVycmlkaW5nIFRFU1REQVRBRElSLCBzaW5jZSB0aGUgZGVmYXVsdCBpcyBn
dWFyYW50ZWVkIHRvIGJlIHdyb25nIGZvciB0YXJnZXQgYnVpbGRzLg0KPiArDQo+ICtVcHN0cmVh
bS1TdGF0dXM6IFBlbmRpbmcNCj4gKw0KPiArU2lnbmVkLW9mZi1ieTogSm9lIFNsYXRlciA8am9l
LnNsYXRlckB3aW5kcml2ZXIuY29tPg0KPiArDQo+ICsNCj4gKy0tLSBhL0NNYWtlTGlzdHMudHh0
DQo+ICsrKysgYi9DTWFrZUxpc3RzLnR4dA0KPiArQEAgLTEzMyw3ICsxMzMsMTIgQEAgYWRkX2Rl
ZmluaXRpb25zKC1ER19MT0dfRE9NQUlOPVxcImxpYmRuZg0KPiArIGFkZF9kZWZpbml0aW9ucygt
RF9GSUxFX09GRlNFVF9CSVRTPTY0KQ0KPiArIA0KPiArICMgdGVzdHMNCj4gKy1hZGRfZGVmaW5p
dGlvbnMoLURURVNUREFUQURJUj1cXCIke0NNQUtFX1NPVVJDRV9ESVJ9L2RhdGEvdGVzdHNcXCIp
DQo+ICsraWYoTk9UIFdJVEhfVEVTVFMpDQo+ICsrICBzZXQoVEVTVF9EQVRBX0RJUiAiL25vdGVz
dHMiKQ0KPiArK2Vsc2VpZihOT1QgREVGSU5FRCBURVNUX0RBVEFfRElSKQ0KPiArKyAgc2V0KFRF
U1RfREFUQV9ESVIgIiR7Q01BS0VfU09VUkNFX0RJUn0vZGF0YS90ZXN0cyIpDQo+ICsrZW5kaWYo
KQ0KPiArK2FkZF9kZWZpbml0aW9ucygtRFRFU1REQVRBRElSPVxcIiR7VEVTVF9EQVRBX0RJUn1c
XCIpDQoNCkRvIHdlIG5lZWQgdG8gc2V0IGEgdmFsdWUgaW4gdGhlIGJ1aWxkIG9yIGRvIHdlIG5l
dmVyIGVuYWJsZSB0aGUgdGVzdHM/DQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQo=
