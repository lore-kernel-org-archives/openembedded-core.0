Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.45])
 by mx.groups.io with SMTP id smtpd.web11.6477.1587738006500029199
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2020 07:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector2 header.b=UZxTiE5y;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.92.45, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfULLnN0U++isg/AY/6YHr3juN77O3TZ+fWMr0P09sie7qwJwE8FpDemWIiXweR+ak1g8NXeJy3Tc64fjbNL6kq7hDpLingCGfARFsFbqmnGBrFYfNBjK8FrDNan2Zn1DSI+VKhAtp9y7QK0inJrQ/3ixd9pTBVa3WFPoqQml4bdkJosJsjqIYtmrDelZhjuIZ2quSdJ1jSqlK/tjMIr54wW5CmJSq/584MKzaDJU7zHTbxjfRh2HlhrT1waY7uoNoUjD7pe02rTBFZKQ5zt2cV2NYjiWimtfK5CkfxLCN+M0+witV7wPN8CKyfGzBN8G2DThvg/dQJ4Q97h9TT7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+TpLDuZURCjxToh2AOYA/KzeoV6UHMABDgtR5j809k=;
 b=XJAW6cWLOwk5+St0X5Q9tdGKKVB5IOpqUsj+455ahgRjWh+X+BhPsV+gIEcKH1DfVI/i90KpI/bmREo9MSOR0R0UaPsGssG6gjzGBv1f6wmUgGiO5gCnRntlzDosuC6BwElWyaHiNa5dzS8Y4ed3L/YKiAOmzwZCYS5Fnv3m2+xWGHVUABEl/O8EQowJleizrkjY+5gBo8IB+6v6swIUCr2OpHjSkSmDgZMMozqwaVb1iosZQmnQq2NVSvW0dPNJt9Hde8jiosBVxLX4EOstvqUpxBfCXg/B1KGZxKQHusRE1r0fl3qoAwDzt34k9iG4KKWXnGho3DtgfJu9aPCcLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+TpLDuZURCjxToh2AOYA/KzeoV6UHMABDgtR5j809k=;
 b=UZxTiE5yQ6pQQRXyrGcsx9kwILNOIzFsHKgfdqOkF/5J4V0DsJjO5fZiKqUTKnDbcKwuzzO9x3z9/k/0QkN7H8pmWk+ac1pTcsEoJdwCR2HjuXgz/X7wm+9n892GI+zEIIQckNFEbVeyaZip8x3emp0uEszim7J8leteGdS8v0Q=
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SN1PR12MB2445.namprd12.prod.outlook.com (2603:10b6:802:31::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Fri, 24 Apr
 2020 14:20:05 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::b1d0:1320:b3eb:183c]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::b1d0:1320:b3eb:183c%2]) with mapi id 15.20.2937.020; Fri, 24 Apr 2020
 14:20:05 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Changing DISTRO_FEATURES / build directory
Thread-Topic: [OE-core] Changing DISTRO_FEATURES / build directory
Thread-Index: AdYZoreS4f0qd/lxRTy9wl3fvQ25kwAJjeOAAB1wovAAALuIgAAAbroA
Date: Fri, 24 Apr 2020 14:20:05 +0000
Message-ID: 
 <SN1PR12MB248060C51C546ED80B5FDE888BD00@SN1PR12MB2480.namprd12.prod.outlook.com>
References: 
 <SN1PR12MB2480D4132DF632E5161532E38BD30@SN1PR12MB2480.namprd12.prod.outlook.com>
	 <f73b90e0d744276d6929bb39518a962dc07e3e4b.camel@linuxfoundation.org>
	 <SN1PR12MB248000E2856984F4FEAB95708BD00@SN1PR12MB2480.namprd12.prod.outlook.com>
 <adfc124fd7a2a538eacdbed44eab2cd67c6bf4f6.camel@linuxfoundation.org>
In-Reply-To: 
 <adfc124fd7a2a538eacdbed44eab2cd67c6bf4f6.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a143898-2f74-4415-126c-08d7e85a95c6
x-ms-traffictypediagnostic: SN1PR12MB2445:
x-microsoft-antispam-prvs: 
 <SN1PR12MB244509F8A40996DE13FEF7228BD00@SN1PR12MB2445.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 03838E948C
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(366004)(346002)(39860400002)(136003)(396003)(376002)(29502001)(5660300002)(110136005)(71200400001)(26005)(8936002)(6506007)(81156014)(8676002)(2906002)(316002)(64756008)(52536014)(9686003)(86362001)(186003)(33656002)(66446008)(55016002)(76116006)(66946007)(4744005)(478600001)(66476007)(66556008)(7696005);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: agilent.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0da7Xozl+7lLbXwW5ry/c7w0gzr40SRZbA4fivWltwy/zFw3byNr4vFd7LPi6u4MURN27DGjdKCn+kxiZrJLzNMqbLIW9nXph0ojjBQAPhn8XUUfYotZ2K7v7DKR+DIKHcxbPVGFanky3OohHzfUXq6uqrYdcLHArtVobkVUvEpRef3w7SrWcrud6ZyXzCWQBI9blCtSxiZTrcLkRQn/bAeKahyuJa+NjpCpKUoFs5XT6ijwZ2lNkEN/aYlzWihX2Y6JclQa5u//VOQeEfzrYemcuqX/HqWlmckIC92BPIkHdAaLAfyIMMM8MuRjZjsjBBiMDJTLkm20jUYneTwxXmha4ionTpwMrAD9b3EBckMHF6JyVyPt0nhFnVwKJSsMI6xnA1khrWfRBnp9FZcLSKgGlOcJCkFlpa6iWEXDcma6qIg+1EICYsbKOxeBx+YOE7cHYnFfEx+uR1v9htHVtmphGpVnELABDLhKoFHd/0TAA1eTlVU1Ui9ykCpC/x1C
x-ms-exchange-antispam-messagedata: 
 8j920+3TSV19/cvjKnRmnrfk/E24zSt6QUMgXeactNUkMNk7/Qt6aVPsI2j/bMycXeVZTORxE/b3qb7kn+9/VLKvyg/iVSTuRP2KuVy2Y8juiriEYQrcOlE9KrS9MASc6fdAtFd7E/g90+z1PgGBlw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a143898-2f74-4415-126c-08d7e85a95c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2020 14:20:05.2381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBQl8HsesmCPrGw0vw5yD77dMB7+w9a+7wahwxwxXpAdkb36tqD+I7AxrFYOg/githdS76Jn9/ca4IeTe4M62A62AIke0IreLDsbCi8QNZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2445
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAiY29udGFpbnMiIGhhcyBzcGVjaWFsIG1hZ2ljIHdoZXJlIGl0IGNhY2hlcyB0aGUgc3BlY2lm
aWMgdmFsdWUgcHJlc2VuY2UNCj4gcmF0aGVyIHRoYW4gdGhlIHdob2xlIHN0cmluZy4gSSdkIHRo
ZXJlZm9yZSByZWNvbW1lbmQgdXNpbmcgdGhlIGNvbnRhaW5zDQo+IGZ1bmN0aW9ucyB3aGVyZSBh
dCBhbGwgcG9zc2libGUgZm9yIHRoYXQgcmVhc29uLg0KDQpTbyB0aGVuIHJlZ2FyZGluZyBteSBv
dGhlciBwb2ludHMsIGl0IGlzIGNvcnJlY3RseSBoYW5kbGVkIGJ5IHRoZSBzaWduYXR1cmUgY29k
ZT8gSWYgc28sIHdoeSBkb2VzbuKAmXQgaXQgc2hvdyB1cCBpbiB0YXNrIGRlcGVuZGVuY2llcz8N
Cg0KVGhhbmtzLA0KQ2hyaXMgDQo=
