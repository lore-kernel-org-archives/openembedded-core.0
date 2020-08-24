Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.79])
 by mx.groups.io with SMTP id smtpd.web11.997.1598292807995761067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 11:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VrSxw9Og;
 spf=pass (domain: windriver.com, ip: 40.107.223.79, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwTiGbINEPHXXZP4xlVyppZbci/Nxl5waP7tjiaB+dxafysFPRkdc6/YQ/a9IFoF5JYZKZwdTxj2yBdI+BpfWLQWcS7fC/tInC8AGv6yCZJ0SkssfydgrHlns8WKwaMjW8lY6oqTBrQwqdFt4D1UXDN+9qtsqN6g7U15WcykSASIcRCJB/RrEBAw0qKd094NFtn2OsL4wUFgLwgILGkVFp/UWGkVdq+5YE6Fji5S26cDzuqS/3KvxbwCaBlGlclYIFUEF0TKqx56DR4dWFyjEk3X6k/GrtXVllzj0B/k9v3QryihX52PAbt7v7s4ihu7+4TfM82sG78BTSU1FdgdSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrmBt2At96fZxC2UkDipTJTL5jv2vpM0PKg8qeDHVAk=;
 b=nC+Vu7Hje1JWwUipJZ77lLnKo1Clxlbtpdy9YBQSfKpOXfOt0+OghOXF9CnSOpZVH34PqWj3dDNar+7wjJ1BtqZN1Wty0p02mfm3j0j/6M1gEzFUR9cUuhQYJkGSo1LPsuLEufUEH7c/44kRRgX/T6w3tSAkORp6GskJ+IgliuBkuF3HZMT6Om5LOVKun+sR6XQS4ZaEmXExGWT2V5HNsxnzi0CM9JM+uJu3IxD9YucpzUgZu3/AjvsvvmncerecHa5EgT+qaEgVIjgaFhafatGWxeypbk0SmURN6yL2TlPj9AlJojouP+gxHhHlqgFI4TYGSNv3NJcxFRXDe/afQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrmBt2At96fZxC2UkDipTJTL5jv2vpM0PKg8qeDHVAk=;
 b=VrSxw9Og4wvbAEhc4ysZusTJt6ZpazaNX4/Scej/xo4XimHO0SmXqNu3hIxz0ByaF4Ctt6i/oqS0ppD1TZCJvvhmHH9Ofg5WnhuO1jV1csaZBepT5kjZJlxGM126KSkrEAa2IZI0VupW/NjCdfHxSZsyijoGNM/9nOU1iIawG3g=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB3176.namprd11.prod.outlook.com (2603:10b6:a03:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 18:13:26 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::d93e:4c0f:e4a9:dfc6]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::d93e:4c0f:e4a9:dfc6%2]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 18:13:26 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Tom King
	<ka6sox@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] cleansstate
Thread-Topic: [OE-core] cleansstate
Thread-Index: AdZ2f++6TJw6HumXThCCKg2pI169VQBTcbmAABODBQAADn1/AAB69c0A
Date: Mon, 24 Aug 2020 18:13:26 +0000
Message-ID: 
 <BY5PR11MB3992C64DE3DF02C21AFD31DE88560@BY5PR11MB3992.namprd11.prod.outlook.com>
References: 
 <BY5PR11MB3992C1180C5A53CCD612FD47885D0@BY5PR11MB3992.namprd11.prod.outlook.com>
	 <92644e498d7a7ab6cbd2dba763d7c0900309c31b.camel@linuxfoundation.org>
	 <CAHQecY4KmaTb6W_r88fRaqTVCsGDmiQMqk5pZvckAraHBLu+_A@mail.gmail.com>
 <4e07ca8b282abc62ede7969bc7c7dd6bd34014fb.camel@linuxfoundation.org>
In-Reply-To: 
 <4e07ca8b282abc62ede7969bc7c7dd6bd34014fb.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [24.4.218.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c34570b9-8620-44ce-91f5-08d84859654c
x-ms-traffictypediagnostic: BYAPR11MB3176:
x-microsoft-antispam-prvs: 
 <BYAPR11MB3176302B71376E4CBDF824BD88560@BYAPR11MB3176.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 h520CzntMDA9qbf6pEnV+lULQ1gJTEkg7RWMYolROVZjDW4zz+cUJHhE9E1ndcTHWpEANYUcygz8NQF2wf8qtPEF8YvjhZz19wSaCvX2gwxmrBp5YqN4AQU1wiOQAJhW8XZbsHRQWicSsvnGgSWcM0N5wjM7silXzqm8mzfcg1cPAHicqXC8FIrOF2Mqs7lvNNlVzBolnOC6rmK/e9LRe7KTpUHXMrD6IzqSY4pvRQKYzA0h3nVbdT2QcGIZUUIQnk1KGzIGRYBZucRGeJw+wNroaUOqfzaUHc9ka5z2r9EukK+BKT+Z+hFG+BHFTAIRpT9kSUOgH3WC94Rje+eesQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39850400004)(136003)(396003)(8676002)(6506007)(53546011)(186003)(8936002)(83380400001)(2906002)(26005)(7696005)(86362001)(76116006)(66556008)(478600001)(66446008)(66476007)(66946007)(64756008)(110136005)(4326008)(52536014)(316002)(33656002)(55016002)(9686003)(71200400001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 On7zvEzJ9Svv5eBaGcbzgI+aPu51aAl8V15gXllGwZ9nU86GedAku8uroGnclgkuzA1qLVDNds6YJUQVjLUsupT9vlLGeq6E1xXV6HqWmYmoyPcFPBV7XiDmzCLlfJyo0Qn0A/ifa2xLxQW0JQJq22MnFj3CzVWdO2lu5oesTjQQD+5DZpFol1sVKmdSIxKHj9yqKEezQpGGVk8JIPEH07nfkgpNqoTMNlXBrVtKc8MTOIO3Kz1raM9BKO2t4yhsor1NAYvYe3whktcY0HE9XGHfDkygdYcJ8+GSd8htbs25eEouHyvTRxuaaiAF/ZzIvTFm/hjo44oCOOpEBUVJt/Eq4P8qTSKUEOj6S27ykU1WSx/yZQ0GTNWKApLQ5vf5jpmFZTszotg3XKMnEfhk2iLlEWgILvtIN0yvDLuqjLwADLNskEbNPT8BaUP3DW1Ye2YdJZjkusUCN9RhP9yTdI8zkG8JJJyq6PavNlf4h9clvc61RW0ItjhNZrVhtr1COJe6hw/e1BX+l3U9DtQo/73q70c1cqo9Mxu7vO4NLumgDTMhO2hIq1pFMlKdP+g7ONK87er4Jtbjyu4Lc9gWSaqmxzo0+AmZ07dmSAwsIkvmi5Lad6AErC2qQXJCtpfxKkGmyultfH776xWzjunIpw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c34570b9-8620-44ce-91f5-08d84859654c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 18:13:26.0282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XJWffcrn5ckcDPaIcTKLsFbCJv9I0q4m+H9FtdpQtrg086pQcflnMsqUTNKrDaeR9yHOOGiU0e6K49HcKc4gLVcY/T2cWGECe05av6V7vlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3176
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSB1c2UgaXQgdmlhIGNsZWFuYWxsIHRvIGJlIHN1cmUgSSdtIGJ1aWxkaW5nIHNvbWV0aGluZyBh
cyBpZiBpdCBoYWQgbmV2ZXIgYmVlbiBidWlsdCBiZWZvcmUuICBJIHNoYXJlIHNzdGF0ZSBiZXR3
ZWVuIGEgbnVtYmVyIG9mIHByb2plY3RzIChJJ20gY2FsbGluZyB3aGVyZSB5b3UgcnVuIGJpdGJh
a2UgZnJvbSBhIHByb2plY3QpLCBhbmQgc29tZXRpbWVzIGp1c3Qgd2FudCB0byBiZSBzdXJlIHRo
ZXJlJ3Mgbm8gImNvbnRhbWluYXRpb24iLg0KDQpKb2UNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnPiANClNlbnQ6IFNhdHVyZGF5LCBBdWd1c3QgMjIsIDIwMjAgMTI6MjggQU0NClRvOiBU
b20gS2luZyA8a2E2c294QGdtYWlsLmNvbT4NCkNjOiBTbGF0ZXIsIEpvc2VwaCA8am9lLnNsYXRl
ckB3aW5kcml2ZXIuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBjbGVhbnNzdGF0ZQ0KDQpPbiBGcmksIDIwMjAtMDgt
MjEgYXQgMTc6MzIgLTA3MDAsIFRvbSBLaW5nIHdyb3RlOg0KPiBXaGF0IHdvdWxkIGJlIGEgdXNl
IGNhc2UgZm9yIGNsZWFuc3RhdGU/DQoNCkkgbmV2ZXIgcmVhbGx5IHdhbnRlZCB0byBhZGQgaXQg
YXQgYWxsLiBUaGVyZSBpcy93YXMgc29tZSBjYXNlIGZvciB3YW50aW5nIHRvIHJlbW92ZSBzc3Rh
dGUgb2JqZWN0cyBhbmQgZW5zdXJlIHNvbWV0aGluZyByZWFsbHkgZG9lcyByZWJ1aWxkIGZyb20g
c291cmNlLiBXaGVuIHNzdGF0ZSB3YXMgbmV3IGFuZCBoYWQgbW9yZSBpc3N1ZXMsIHBlb3BsZSBy
ZWFsbHkgd2FudGVkIGl0IGFuZCBJIHdhcyBwdXNoZWQgaW50byBoYXZpbmcgaXQgZXhpc3QuDQoN
CkkgdW5kZXJzdGFuZCB3aHkgcGVvcGxlIHdhbnQgaXQgYWx0aG91Z2ggaXQgc2hvdWxkIG5ldmVy
IHJlYWxseSBuZWVkIHRvIGJlIHVzZWQuDQoNClRoZXJlIGFyZSBzb21lIHVzZXJzIHdobyBkbyB1
c2UgaXQgcmVndWxhcmx5IGFuZCB0aGV5IHJlYWxseSBuZWVkIHRvIHRoaW5rIGFib3V0IHdoeSBh
bmQgd2hldGhlciB0aGV5IG5lZWQgdG8uIFBlcnNvbmFsbHksIEkgZG9uJ3QgdXNlIGl0Lg0KDQpD
aGVlcnMsDQoNClJpY2hhcmQNCg0K
