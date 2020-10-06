Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.83])
 by mx.groups.io with SMTP id smtpd.web10.1087.1602003563253189373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 09:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=DmWxlCpd;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.243.83, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmDDDVv9Jqxjb7lsdM/o05MpzRphSZmpftoMGLbqbyi31ee1qvYw/SrInE8IiyMS/fromLa0gIe05dF2EPP88FOkqDpXDzgfhmL8yiEvAhWAREHV+ogxhEPjGE62aIfzPqs9Yncs+yQ4O9Ohw7tEO6ygSKHsCEOkZAAXKZunKw74+9mKN31R1x2nbAuNCed44NbI76ZBEmipMo2XVJ97n26OEB1aOunOjxfHrUIML3k4Ahl+ZmWvZKZtrCSydyGm1n7AY66hmj1v6grKWEEWUXJWCoRiREJJ6PVg0NpKYrhOPEo66myh7vh9iPhJXxcZkQ8JglSfUcDVmAOQb34YKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9vNSfbL+ppjhMAs3UEDqUN1sLocvo/02iwKIumQHdo=;
 b=b7l+BRNqFSvVfjBz+GRk0oX0vKxVWjn1WaGpWxAbtZ74mfE/JKPfiT1niQRXB2u48zDAT165jm6eBcE0/SpFf7Tsv57moCPJ8pZ1U7G0/hUChtaPo2waW0UwNogNKCS7qXSA3yup8sJ4ZeUhxPeB7Ir5FXff8k1WOSFDYQnrnZA4Ololu8jvGOsaA6Ry+KjcjTDqozEwow5LGC92Bk4KgYj+V4Qiyk5/vT0vhYMKXdQbCFt8YqDCNc3s5kYAolJ+4durXdMJ8y6negjpjq71BfjZhQ0++baZrWYv/idPqzcqTo9YPsprNBySWQVASIHLVkqQuMNIKYrVDPyoS5b4XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9vNSfbL+ppjhMAs3UEDqUN1sLocvo/02iwKIumQHdo=;
 b=DmWxlCpdpm5Q9xI9KtoFr9a8N3VWXDdjNLbrbaVjsff+3LoliHwlYk9rDzcircK4VMoLw4Pq9wzuU9VQRm9b7BQJeLz9+6yVWek73OKc1VwKTZgbI4SvJCSXmwida+bvmNjQsrjiquR6xmw8Y88mwVsKOyRJf3KQaMTWV+HCP6+bzB3UR6MmhalXSoDpjZueLL+qx45FSvZE9ZKVDS6zClV3PFd9vDsf/H5b2aFpBgTrL9C29IGLXaVJ/5/5pmOLQLhIR3T/EkH4+qpa4MOdi+OdEHzpJpH+KODVqa9rTGQKdl2jP0NYFj3hTwdk/WUqub7dztAaFhLuABDXqa2F7A==
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SN6PR12MB2813.namprd12.prod.outlook.com (2603:10b6:805:69::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Tue, 6 Oct
 2020 16:59:22 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d%7]) with mapi id 15.20.3433.045; Tue, 6 Oct 2020
 16:59:22 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/4] staging: Ensure cleaned dependencies are added
Thread-Topic: [OE-core] [PATCH 1/4] staging: Ensure cleaned dependencies are
 added
Thread-Index: AQHWlZygHIczyD9sPkqHZe4YWbbZnKmKygswgAAL74CAAAJ0IA==
Date: Tue, 6 Oct 2020 16:59:22 +0000
Message-ID: 
 <SN1PR12MB2480A99FEE6B179D1A5A76E58B0D0@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
	 <SN1PR12MB2480083B16B34A4A0C9119978B0D0@SN1PR12MB2480.namprd12.prod.outlook.com>
 <1ef1432ac36ca2224dea67e2824c5b8f04cc1066.camel@linuxfoundation.org>
In-Reply-To: 
 <1ef1432ac36ca2224dea67e2824c5b8f04cc1066.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=agilent.com;
x-originating-ip: [2607:fb90:18d1:d4bd:44c6:6087:ebb4:b521]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 337ad668-575b-4306-67db-08d86a192c4d
x-ms-traffictypediagnostic: SN6PR12MB2813:
x-microsoft-antispam-prvs: 
 <SN6PR12MB28136672E964535DB42230B98B0D0@SN6PR12MB2813.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Z/tcBnYj14u14ay0eZHiMk8OXW/wvHkDobsQUQpko2Z9sGxhrIW8NuqTB/qVHWXkSicjVSrgYN8SyoAw3wIhzlwzmDFOSXkNFL4jigQIHlI50qHWWm5yL7LEr44WKKUwkZVhSV1pE9U1IbzyLb/JFSYAZRLe/bSfW1ymOFTDnBJBiXu69cQi3TD9cBTE5wcscBVqjfp3z0PE5tCVipAN28zxl6bosmSz7T6YLQAkJiU3KUaY3xgGsO/QCA00H+yYzMoEIIuQ0YlxhcoUycfjl39F7Nn74kKdoj34qo5H7DE4MhpJdl4aVo7C4Hf7/jhMcUBb5phm4JkZb8pniUIaQswcbiVN6F2xY5d7f4BATmhCB2bYt5aErPh/8kxNPfUS
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(29502001)(55016002)(52536014)(71200400001)(64756008)(66556008)(66446008)(5660300002)(66476007)(86362001)(8936002)(76116006)(8676002)(4744005)(186003)(110136005)(7696005)(2906002)(478600001)(6506007)(316002)(9686003)(33656002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 4EvdkToyfwVQPbTJZNtQHwvqxzKFDoGXqo3wj//1fjyOeP9FH2RQ+PHnIxQPIvWy/oxScgoHh4Npi9qg513QARi3Qhc7Wc6vCVVNzvry9pmWrq/Ip2sI5RPsfb2CMvK3L15i4ojQ0hO7wONHD6Q925RW4wTPYR2dnFY/zZbk68HOAaUBtCwQvTMwhdb5dl64xS4zYJJ9wY3nChuTl3zzicQZLAqwEOiOMhpYecFTCvZbaUAv6nv50n9xmnrvqoqUC4pF0N45IXbvbJPD0R/9jm8F8e0Mjfyj1ltnwYM6Pa36GvPw2t9L6OtGBExbGS26YCB3k560qyYJ4EDucbXr12D4uQLJiNmRKkndYVk6lNB33/zRArdOs0Axrh/JRP1C3E4ZQaJZoHpkNWgUif6J0vAt7hjYyn6UzeLqzUIsqpXu+v4RpJ2K336pyQCzOk4HVm7fAdmfGX2xRuGsVgXSBK+drkrcBv/4+Dr1rwHYhGvSL9Zn3OsrJWTCvb4IbuPbe0TsudC0vke2zE0ScZzegEqd7c1LZhQbf4bxc7MAMKAyE5I0x9KKQ0p0W7fDtj9TvEH7v7bdMqdzltgrqXsB9UTpcRaa7bhk7SB+Q5eNRS+1BbUOfbp+xIuTSzkrllHfdkp/uk6LvFZiUstdM5PicYq5S8c+KEt1UgDp9dRF+ATSMlT12ezeO/0qpCuzWA8OVfHH5OCYh9ufJYxdRUpjhQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337ad668-575b-4306-67db-08d86a192c4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2020 16:59:22.1013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cKZrmzRAeaNBGAyk3NLaiyD6bW3W9nQmsOSqSOrX82RT43NhrsK9Kz0KYZnCFv8JAH4dZMCspIdyLr48ckPJ9hyGOTkC5NbSwB6t2fYZ8XA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2813
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IElzIHRoaXMgcGF0Y2ggc29tZXRoaW5nIHRoYXQgc2hvdWxkIGJlIGJhY2twb3J0ZWQgdG8g
emV1cyBhbmQgZnJpZW5kcz8NCj4gDQo+IEl0cyBmaXhpbmcgYSB2ZXJ5IHJhcmUgcHJvYmxlbSB0
aGF0IEkgb25seSByYW4gaW50byB3aGlsc3QgZG9pbmcgImludGVyZXN0aW5nIg0KPiB0aGluZ3Mg
bW9zdCBwZW9wbGUgZG9uJ3QgcHJvYmFibHkgZG8uDQo+IA0KPiBJZiBwZW9wbGUgd2VyZSBydW5u
aW5nIGludG8gdGhvc2UgaXNzdWVzIEknZCBiYWNrcG9ydCBidXQgZm9yIG1hc3RlciBpdCB3YXMN
Cj4gbW9yZSBhIGNvcnJlY3RuZXNzIGZpeCB3aGljaCBkaWQgZml4IHNvbWUgd2VpcmQgY29ybmVy
IGNhc2VzIEkgZGVidWdnZWQuLi4NCg0KDQpBIGNvbGxlYWd1ZSB0b2RheSBkaWQgc2VlIHNvbWV0
aGluZyB0aGF0IHNvdW5kZWQgdG8gbWUgbGlrZSBpdCBtYXkgYmUgZml4ZWQgYnkgdGhpcyBwYXRj
aC4gSXQgd2FzIGEgbmF0aXZlIHRvb2wgdGhhdCBzaG91bGQgaGF2ZSBiZWVuIGF2YWlsYWJsZSBk
dXJpbmcgYSBkb19jb25maWd1cmUgdGhhdCB3YXNuJ3QuIFdlIGRpZG4ndCB0YWtlIHRoZSB0aW1l
IHRvIGRpZyBpbnRvIGl0IHRob3VnaCAtIGl0IHdhcyByZXNvbHZlZCB3aXRoIGEgLWMgY2xlYW5z
c3RhdGUgb2YgdGhlIC1uYXRpdmUgcmVjaXBlIGFuZCB0aGUgdGFyZ2V0IHJlY2lwZS4gDQoNCkNo
cmlzDQo=
