Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web11.2086.1594405141099048188
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 11:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=KZUF8UJ9;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: takondra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=5374; q=dns/txt; s=iport;
  t=1594405141; x=1595614741;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AwfSnx7SoSUN95fd1uXFKkDWJZHNc22a6DnYglIodj0=;
  b=KZUF8UJ9E9BUC/eGAv8r6yd/bmQwuXco/XS9X47RW3m8UecUDwiT6HyX
   o9wDyv1TjsqMCZIjCt4GEmcbJ2uy0++vf/O6Dqx1UtYo0MGXLDRI/rHU/
   mH2m38RMk6qrVRKRdJun4Ar279NmrErKQ6vzuhD8SqsWFR3/U/fsKYsJD
   I=;
IronPort-PHdr: =?us-ascii?q?9a23=3Aeqrc0RZzzuflCqSdhTozO7n/LSx94ef9IxIV55?=
 =?us-ascii?q?w7irlHbqWk+dH4MVfC4el21QSXD4Ha7e9Uhe3LtazpRW0H59CGqn9ROJBPVh?=
 =?us-ascii?q?pQj8IQkkRgBcOeEkT0IbbsaDByB8VNUlJpvhTZeUhYEcrzfRve93u16zNBHh?=
 =?us-ascii?q?T5KBp7IfnzFofOjsOxkeeo9M6bbwBBnjHoZ7R0IV2/phnQsc9Dh4xkJ8NTgh?=
 =?us-ascii?q?vEq3dFYaJY32RtcFmShB37oMy3+c1u?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0C8AAB4sAhf/5xdJa1gGgEBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBARIBAQEBAgIBAQEBQIFKgVJRB4FHLyyEM4NGA41OmF2CUwNVCwE?=
 =?us-ascii?q?BAQwBAS0CBAEBhE0CF4F/AiQ4EwIDAQELAQEFAQEBAgEGBG2FWwELhXABAQE?=
 =?us-ascii?q?DEhERDAEBNwEPAgEIGAICJgICAjAVEAIEDgUihVADLgGefgKBOYhhdoEygwE?=
 =?us-ascii?q?BAQWFMxiCDgkUeioBgmmDVIYzGoFBP4NsNT6EPReCf4JgjwmDN6JbCoJdmVU?=
 =?us-ascii?q?gnyaRZJ5vAgQCBAUCDgEBBYFqI4FXcBWDJFAXAg2OHg0Wg06KVnQ3AgYIAQE?=
 =?us-ascii?q?DCXyOegEB?=
X-IronPort-AV: E=Sophos;i="5.75,336,1589241600"; 
   d="scan'208";a="510183759"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Jul 2020 18:18:59 +0000
Received: from XCH-ALN-003.cisco.com (xch-aln-003.cisco.com [173.36.7.13])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 06AIIxKX008744
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 10 Jul 2020 18:18:59 GMT
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by XCH-ALN-003.cisco.com
 (173.36.7.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 13:18:59 -0500
Received: from xhs-rcd-002.cisco.com (173.37.227.247) by xhs-rtp-001.cisco.com
 (64.101.210.228) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 10 Jul
 2020 14:18:58 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (72.163.14.9) by
 xhs-rcd-002.cisco.com (173.37.227.247) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Fri, 10 Jul 2020 13:18:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzU3Xh8Q4/9fcipwzh0P57ZgeAOyYzT5IeoxTxJAFmw1dnEjK5d5/Qo36bkUL4epi7z4jdw2Abs2sv+R/ZYM4lkJbZ1MqIk4490DxhzELh8IwbBgyMYBm3BljB2wIhjWQilgnAMK2J9U+YXKgf/MAnEkB3RFDPUjnqmoXyQhYut4HMyngXUHAd8tS3r3IN+P+mEJCeoaG56e7LVaQElOZqTLDCWsfBubO5jgMkLaTt4q7mcvyXb3hQ8o9Pk6V+peMdIpKqDLRsQnNKGdmqTk6XgDmlru+MEdwdiaawEIfiePRV9V7T9uR9gD/+HBxLrNoJ7XiHTcqvnpxtZ5dT9sYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwfSnx7SoSUN95fd1uXFKkDWJZHNc22a6DnYglIodj0=;
 b=NWzWSKBIdhDSPM/NrG+XErI4ktEy/533uhvwXQRf3i2lbgU+hWXA8bIfXe0JeRuM7VV2cZ5XdU0y4LsKlg80mIn+wleZ/H/i5IgFV+89q7wBn2mDXF3nLCN8N3W8MtroZyAuVaxUakAWFS3HiR9SvoH/G+QcfcfIzjailX6EkSOy0w5xrZGyxIusK700ej5jBhwrFThWMfTmrz5t4SuirEWnw73tHZT2DH9l3f9svydKTousy9wad82f3XitzQsQYkBpYDlzpZR6PhcvB99UTHnqeLC7gEAO1TCjS1B+c/xHLPWdfjbYqATpSBjQ27y9V99LGCx0g/+g+Z1HX+ArHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwfSnx7SoSUN95fd1uXFKkDWJZHNc22a6DnYglIodj0=;
 b=RSKiRiHHM7pYHkMqJQxo2we4p5Tu+0NKEcsRkBnpPKa8OI4ClH3/zqpfQZeBTU/2ZM3wmM83U7c5gUz+alU1jWWc+iMsCgDwAXpsjpQZSj4CSgOHoHhTBAy2NiSPwIcY2KV2iuLROsFJFaWqh9Xmb+M4qe3FnmyCJ/3Qz18NxHs=
Received: from BYAPR11MB3366.namprd11.prod.outlook.com (2603:10b6:a03:7f::20)
 by BYAPR11MB3512.namprd11.prod.outlook.com (2603:10b6:a03:8f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Fri, 10 Jul
 2020 18:18:56 +0000
Received: from BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc]) by BYAPR11MB3366.namprd11.prod.outlook.com
 ([fe80::710e:b1f8:83c1:d6cc%6]) with mapi id 15.20.3174.021; Fri, 10 Jul 2020
 18:18:56 +0000
From: "Taras Kondratiuk" <takondra@cisco.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "cristian.iorga@intel.com"
	<cristian.iorga@intel.com>,
        "xe-linux-external(mailer list)"
	<xe-linux-external@cisco.com>
Subject: Re: [PATCH] qemu: access host pkg-config via HOSTTOOLS
Thread-Topic: [PATCH] qemu: access host pkg-config via HOSTTOOLS
Thread-Index: AQHWVuJTcuEb609AQkWJjvvWSwAdyKkBGSYAgAAGOYA=
Date: Fri, 10 Jul 2020 18:18:55 +0000
Message-ID: <3a687673e39fd52a6314e5e0036b0f55a3498c39.camel@cisco.com>
References: <20200710174813.1963559-1-takondra@cisco.com>
	 <39c5bc9fcf056d93a42833d113521f524f063d33.camel@linuxfoundation.org>
In-Reply-To: <39c5bc9fcf056d93a42833d113521f524f063d33.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2-0ubuntu1 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=cisco.com;
x-originating-ip: [2001:420:c0c8:1004::ba]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e36e28e-a50d-46a8-56f2-08d824fdb556
x-ms-traffictypediagnostic: BYAPR11MB3512:
x-ld-processed: 5ae1af62-9505-4097-a69a-c1553ef7840e,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB351224ABCBB8B603F47A110EC8650@BYAPR11MB3512.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: etYRxsksylKp20cxdrANpLY1Hf7KBE51NFdsh1JJlcgqs4rse7b8Ni8rlRZuL3sZqR7gLhp9AvBNsR8aA9j5Qq/cLfY7ev45jJxkhr4vnJSJDoU8hQ6xKjKUjIGD10eUsB0gZ9g4zBH7r61ghE2UPefznMGvPDkq9Dusay0WrmUJU36hfGpv2C3LNwySeTVjjxHimgw9QDQglBmaeMEHtb6Cb+FmFT4g/Ukv3RJ7sdCHVTkoR4UMPyEvcr51gVW2rTmD/0acA5lwJ6CsuI6zt8v5LUTf1Iuk4SkBaC2VacoG2KkflDGHBkT/ipB6luBCCkaKjf8FqposJ55eXOjaG6E/XxxC8arfmshNe5KMK12dN2ti5bbhIN/NeHUFtwTjuZEtgDokmO+8/OiHxhklrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(86362001)(478600001)(6512007)(186003)(4326008)(2616005)(8676002)(8936002)(5660300002)(6916009)(6506007)(54906003)(36756003)(107886003)(71200400001)(6486002)(316002)(66446008)(64756008)(66556008)(66476007)(2906002)(83380400001)(66946007)(76116006)(414714003)(473944003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3zfsjCrPGUiCQiCrOgdEdLrl8Ru4RBCtVi9ukMT0snzJdWmqAOCMPciCbDAPC8tkQLBIpgRYGwzb2WFv52Y9fehfwo4pxRV4+LqVG55GrKVymCEOHrFsfQddC0wT+KoMEgKkMqvRt3BUxc1WhEsmO2rm+sBLi7M43HL1JjHdEgMS8w2h5yaCLpvjCKL5V71yFe71tlvkTfXQ9NhX6XTzI6NvF1E8Aheso+XfvC4ZAJpx1kIb92E25epqFX9BHVE0Bbw2gaJ1QoLUfrkZtrRSGbz0thidxaFVQYgQwUnz+UsjmaLW9f/bVzmG1FjoulaIc3VYl+vqlslawc4hDp1q9QEiAEJoD8v/d+SzKZSEk/jS/fMzvshmry7/M4uBzX95p4QgZGpWJOllFros5A6qQjCKkv8xgq4Rh90iJ/KcfUL0yK58qyQoAjsn8ZgDtQ5bI03hjXWzNsyamKES0xLU9FV8RyT2ynHVn7TDisS5AlsGpmHcy7Zc4725LqDRYfZhOUqm0tQSpE6kfYHlWINv8w==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e36e28e-a50d-46a8-56f2-08d824fdb556
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2020 18:18:55.9586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Z6/wBLJAK+P+teF/gBA/it93iHQW9QXvcMge7arL/Yfe1AZ3G/F5MXTH9h4LzWhWDk9uj57ssjVhFerFk5JgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3512
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.13, xch-aln-003.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <53394715D2FD0B44961B26459C7093A7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTA3LTEwIGF0IDE4OjU2ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gRnJpLCAyMDIwLTA3LTEwIGF0IDEwOjQ4IC0wNzAwLCBUYXJhcyBLb25kcmF0aXVrIHdy
b3RlOg0KPiA+IE9uIHNvbWUgYnVpbGQgaG9zdHMgcWVtdS1zeXN0ZW0tbmF0aXZlIGZhaWxzIHRv
IGJ1aWxkIHdpdGggZXJyb3JzOg0KPiA+IGxpa2U6DQo+ID4gPiBidWlsZC90bXAvd29yay94ODZf
NjQtbGludXgvcWVtdS1zeXN0ZW0tbmF0aXZlLzQuMS4wLXIwL3FlbXUtDQo+ID4gPiA0LjEuMC9x
ZW11LWtleW1hcC5jOjE2OjEwOiBmYXRhbCBlcnJvcjogeGtiY29tbW9uL3hrYmNvbW1vbi5oOiBO
bw0KPiA+ID4gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiA+ID4gICAgMTYgfCAjaW5jbHVkZSA8
eGtiY29tbW9uL3hrYmNvbW1vbi5oPg0KPiA+ID4gICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+
fn5+fn5+fn5+fn5+fg0KPiA+ID4gY29tcGlsYXRpb24gdGVybWluYXRlZC4NCj4gPiA+IG1ha2U6
ICoqKiBbYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L3FlbXUtc3lzdGVtLW5hdGl2ZS80LjEu
MC0NCj4gPiA+IHIwL3FlbXUtNC4xLjAvcnVsZXMubWFrOjY5OiBxZW11LWtleW1hcC5vXSBFcnJv
ciAxDQo+ID4gDQo+ID4gVGhpcyBpcyBhIGNvbWJpbmF0aW9uIG9mIHR3byBmYWN0b3JzOg0KPiA+
IDEuIEluIG91ciBzZXR1cCB3ZSB1c2UgbmF0aXZlIHRvb2xjaGFpbiBmcm9tIGJ1aWxkdG9vbHMt
dGFyYmFsbA0KPiA+IGJlY2F1c2UNCj4gPiAgICBkZWZhdWx0IGhvc3QgR0NDIG9uIHNvbWUgbWFj
aGluZXMgaXMgdG9vIG9sZC4NCj4gPiAyLiBRZW11IHJlY2lwZSBhZGRzIGhvc3QgcGtnLWNvbmZp
ZyBwYXRocyB0byBQS0dfQ09ORklHX1BBVEggdXNpbmcNCj4gPiAgICBoYXJkY29kZWQgcGtnLWNv
bmZpZyB0b29sJ3MgbG9jYXRpb24gKC91c3IvYmluOi9iaW4pLiAgQWRkZWQgYnkNCj4gPiAgICBj
b21taXQgNjhhNWVkMzM3ZjhmICgicWVtdTogZml4IHFlbXUtbmF0aXZlIHBrZy1jb25maWcgcGF0
aHMiKQ0KPiA+IA0KPiA+IEhvc3QgeGtiY29tbW9uIHBhY2thZ2UgaXMgZGV0ZWN0ZWQgaW4gY29u
ZmlndXJlLiBCdXQgdGhlbiB0aGUNCj4gPiB0b29sY2hhaW4NCj4gPiBjYW4ndCBmaW5kIGhlYWRl
cnMgYmVjYXVzZSBpdCB1c2VzIGhlYWRlcnMgZnJvbSBidWlsZHRvb2xzLXRhcmJhbGwNCj4gPiBv
bmx5Lg0KPiA+IA0KPiA+IEluc3RlYWQgb2YgdXNpbmcgaGFyZGNvZGVkIGxvY2F0aW9uLCB1c2Ug
cGtnLWNvbmZpZyB2aWEgSE9TVFRPT0xTLg0KPiA+IEl0DQo+ID4gd2lsbCBwaWNrIHVwIGNvcnJl
Y3QgcGtnLWNvbmZpZyBmcm9tIFBBVEggYW5kIGF2b2lkIGNvbmZpZ3VyYXRpb24NCj4gPiBkaXNj
cmVwYW5jaWVzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFRhcmFzIEtvbmRyYXRpdWsgPHRh
a29uZHJhQGNpc2NvLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9jb25mL2JpdGJha2UuY29uZiAg
ICAgICAgICAgICAgfCAyICstDQo+ID4gIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUu
aW5jIHwgMiArLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jb25mL2JpdGJha2UuY29uZiBi
L21ldGEvY29uZi9iaXRiYWtlLmNvbmYNCj4gPiBpbmRleCAzNTNjYWFjZWY5ODYuLmZhZTExNDdk
Mzk3YyAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL2NvbmYvYml0YmFrZS5jb25mDQo+ID4gKysrIGIv
bWV0YS9jb25mL2JpdGJha2UuY29uZg0KPiA+IEBAIC00ODgsNyArNDg4LDcgQEAgSE9TVFRPT0xT
ICs9ICIgXA0KPiA+ICAgICAgY3BwIGN1dCBkYXRlIGRkIGRpZmYgZGlmZnN0YXQgZGlybmFtZSBk
dSBlY2hvIGVncmVwIGVudiBleHBhbmQNCj4gPiBleHByIGZhbHNlIFwNCj4gPiAgICAgIGZncmVw
IGZpbGUgZmluZCBmbG9jayBnKysgZ2F3ayBnY2MgZ2V0Y29uZiBnZXRvcHQgZ2l0IGdyZXANCj4g
PiBndW56aXAgZ3ppcCBcDQo+ID4gICAgICBoZWFkIGhvc3RuYW1lIGljb252IGlkIGluc3RhbGwg
bGQgbGRkIGxuIGxzIG1ha2UgbWQ1c3VtIG1rZGlyDQo+ID4gbWtub2QgXA0KPiA+IC0gICAgbWt0
ZW1wIG12IG5tIG9iamNvcHkgb2JqZHVtcCBvZCBwYXRjaCBwZXJsIHByIHByaW50ZiBwd2QgXA0K
PiA+ICsgICAgbWt0ZW1wIG12IG5tIG9iamNvcHkgb2JqZHVtcCBvZCBwYXRjaCBwZXJsIHBrZy1j
b25maWcgcHINCj4gPiBwcmludGYgcHdkIFwNCj4gPiAgICAgIHB5dGhvbjMgcmFubGliIHJlYWRl
bGYgcmVhZGxpbmsgcmVhbHBhdGggcm0gcm1kaXIgcnBjZ2VuIHNlZA0KPiA+IHNlcSBzaCBcDQo+
ID4gICAgICBzaGExc3VtIHNoYTIyNHN1bSBzaGEyNTZzdW0gc2hhMzg0c3VtIHNoYTUxMnN1bSBc
DQo+ID4gICAgICBzbGVlcCBzb3J0IHNwbGl0IHN0YXQgc3RyaW5ncyBzdHJpcCB0YWlsIHRhciB0
ZWUgdGVzdCB0b3VjaCB0cg0KPiA+IHRydWUgdW5hbWUgXA0KPiA+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYyBiL21ldGEvcmVjaXBlcy0NCj4gPiBkZXZ0
b29scy9xZW11L3FlbXUuaW5jDQo+ID4gaW5kZXggZDQxY2M4ZjIwMGIzLi44ODFhNWJhNjUwMjUg
MTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMNCj4g
PiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYw0KPiA+IEBAIC05NCw3
ICs5NCw3IEBAIEVYVFJBX09FQ09ORl9hcHBlbmQgPSAiIC0tDQo+ID4gcHl0aG9uPSR7SE9TVFRP
T0xTX0RJUn0vcHl0aG9uMyINCj4gPiAgDQo+ID4gIGRvX2NvbmZpZ3VyZV9wcmVwZW5kX2NsYXNz
LW5hdGl2ZSgpIHsNCj4gPiAgCSMgQXBwZW5kIGJ1aWxkIGhvc3QgcGtnLWNvbmZpZyBwYXRocyBm
b3IgbmF0aXZlIHRhcmdldCBzaW5jZQ0KPiA+IHRoZSBob3N0IG1heSBwcm92aWRlIHNkbA0KPiA+
IC0JQkhPU1RfUEtHQ09ORklHX1BBVEg9JChQQVRIPS91c3IvYmluOi9iaW4gcGtnLWNvbmZpZyAt
LXZhcmlhYmxlIA0KPiA+IHBjX3BhdGggcGtnLWNvbmZpZyB8fCBlY2hvICIiKQ0KPiA+ICsJQkhP
U1RfUEtHQ09ORklHX1BBVEg9JCgke0hPU1RUT09MU19ESVJ9L3BrZy1jb25maWcgLS12YXJpYWJs
ZQ0KPiA+IHBjX3BhdGggcGtnLWNvbmZpZyB8fCBlY2hvICIiKQ0KPiA+ICAJaWYgWyAhIC16ICIk
QkhPU1RfUEtHQ09ORklHX1BBVEgiIF07IHRoZW4NCj4gPiAgCQlleHBvcnQNCj4gPiBQS0dfQ09O
RklHX1BBVEg9JFBLR19DT05GSUdfUEFUSDokQkhPU1RfUEtHQ09ORklHX1BBVEgNCj4gPiAgCWZp
DQo+IA0KPiBxZW11IGlzIGEgbGl0dGxlIHNwZWNpYWwsIGl0cyBhYm91dCB0aGUgb25seSB0aGlu
ZyB3ZSBsZXQgbG9vayBpbnRvDQo+IHRoZQ0KPiBzeXN0ZW0gZm9yIHRoaW5ncyBsaWtlIHRoaXMu
IFdlIHJlYWxseSBkb24ndCB3YW50IHBrZy1jb25maWcNCj4gYXZhaWxhYmxlDQo+IGdlbmVyYWxs
eSBpbiBIT1NUVE9PTFMuDQo+IA0KPiBJJ20gbm90IDEwMCUgc3VyZSBJIHVuZGVyc3RhbmQgaG93
IHRoaXMgaXMgZml4aW5nIHRoaW5ncyBlaXRoZXIuIElzDQo+IHRoaXMgdXNpbmcgdGhlIHBrZy1j
b25maWcgZnJvbSB5b3VyIGJ1aWxkdG9vbHMgdGFyYmFsbCBpbnN0ZWFkPw0KPiANCg0KWWVzLCBp
dCBpcyB1c2luZyBwa2ctY29uZmlnIGZyb20gYnVpbGR0b29scyB0YXJiYWxsLg0KDQpBcyBwZXIg
bXkgdW5kZXJzdGFuZGluZyBvdGhlciBwYXJ0cyBvZiB0aGUgYnVpbGQgd2lsbCBzdGlsbCB1c2UN
CnBrZ2NvbmZpZy1uYXRpdmUgYW5kIHNob3VsZCBub3QgYmUgYWZmZWN0ZWQuIE9yIHRoZSBjb25j
ZXJuIGlzIHRoYXQNCnBhY2thZ2VzIHdpdGhvdXQgcHJvcGVyIHBrZ2NvbmZpZy1uYXRpdmUgZGVw
ZW5kZW5jeSB3aWxsIGZpbmQgdGhpcw0KcGtnLWNvbmZpZyBpbiBIT1NUVE9PTFM/DQo=
