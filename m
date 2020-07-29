Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.76])
 by mx.groups.io with SMTP id smtpd.web10.5704.1596056135570959935
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 13:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=AM9NXjG0;
 spf=pass (domain: agilent.com, ip: 40.107.220.76, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aosfYqWBhAfXK+F8nsr5oF7SkYsVDcrjSi7RcVjbtE7rVvZHbZVcX2wlAKgfbu9SOLYkELu25CWzjrZbH+LSrt7/3qkDH4PcYpMIj+hWcAdFRqJs6XlwKIw3O4fnWXtFXwqgcTebxw92FPflxEewyHuMnjjECrIYSHiTwGqjKXK4OPmrE//zyfOEHXwgsN35uGKrPByp/aVfmlVzDpoyyuk2AnA2fm+nOIonsakx2x99KK7fhCfWWFfocbbAvzqY+n6+SN9suXfjHxf5qMqaNmfrwTFHxis/plBMf3+LQARe16zSg5rnkaG6Q345AGS45VXdJxrhCl1W1fHEs43jhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lOSqgRoBDvZCcIEfIWRrJTxmHPPFNIEOt8nUAHj5mI=;
 b=PtxgiPdHYMuc7rRmZpm8phRsUXMwDXFGTQ/LN6x77/bzhld69OvLarhwWXN4N+fp0vQrqjIjbgLYh/Ax8+5405LyuNNijKguKUTJ097oLD0xHP7LcGR5M6/JyjJwUqhsiA06NPp5dE44BUtpEnkgIVwmGA6stYdY/8EBL+ijoP2GPNlO8s7tcIJiA9xm9WuVKlthnjEBL5B7HfF2epzXuEws3nwOzrA9IRTuxHuNthlUYrzg0bz1P/RSK2Rx4RXo3pyw+KTbn++hOybYTCmGA2Nnkg5kzvCRh3HETGqGkXFcmcbzkXXa+Lg4r9Zmc8ijiorIr2TjiYhjZR/vkkN81Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lOSqgRoBDvZCcIEfIWRrJTxmHPPFNIEOt8nUAHj5mI=;
 b=AM9NXjG08V11Mi4SVBvNJvQ2+2eOBTNjCrOiAtPIhUCg/RiioM5FdFBK3cPf2Fyc3v2c6R/tdYnUcB3GgAjbVfXScy4YKhQ+xOt0qFqmrmwkjTX3fdMZubWugVOEZsgZ4vibqi4HOAU0woVT/dPpBbd2J+vixKubogu4nb0hqR4eyyq6H7JVO+d3GZiCWo4iOMuRMaUrjHog+pOdMFTRuGKm9YUCfMp/7jQh3E5YaMfxIGnQwKkZh5BmYyJLTLtiOKw4lGGp5ZJZoWUyfJOLde4ufc4CWbPjkRzuTgsM86XxXDA4b/TGPSMT43FdF0B3JJmFQc+xE4sn53a6YoGXNQ==
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SN6PR12MB2704.namprd12.prod.outlook.com (2603:10b6:805:72::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.25; Wed, 29 Jul
 2020 20:55:34 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::4c4f:2633:b1bc:c164]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::4c4f:2633:b1bc:c164%6]) with mapi id 15.20.3216.034; Wed, 29 Jul 2020
 20:55:33 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe][PATCH 0/3] Log colorizer
Thread-Topic: [OE-core] [meta-oe][PATCH 0/3] Log colorizer
Thread-Index: AQHWZH+X/5T0YEzquE+9VTefFwGSvakdJImAgAHgNwA=
Date: Wed, 29 Jul 2020 20:55:33 +0000
Message-ID: 
 <SN1PR12MB2480AF36B2683F26D1D4777C8B700@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20200728013557.111830-1-chris.laplante@agilent.com>
 <edc83a1a101292425dce9dd1c9df51d6b8db8e7a.camel@linuxfoundation.org>
In-Reply-To: 
 <edc83a1a101292425dce9dd1c9df51d6b8db8e7a.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=agilent.com;
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1ddd52a-cb6b-418e-47e2-08d83401bcc4
x-ms-traffictypediagnostic: SN6PR12MB2704:
x-microsoft-antispam-prvs: 
 <SN6PR12MB2704C0A2C60825954733009D8B700@SN6PR12MB2704.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 I0ppBA2df2dch8W2++4ZGr2CaH4OwKIg9kPfSH36Us6x4wZ2LW1Ct/VU9LGj9MDVnm4pu2zJHh+4cQVnXPq11Q7ru5GWkTCwg7nVPvU04HhThVSBLuwfRvBeX+GF81bOFXL6ASzuBACMTw1AWUmkiZ7q8ahj5I/KwiY/bOBnRDzGbDolcj9JuwA2l4nDEpHuECvNi6KPEFdueXkA9KhOOC1/AIti/nzH/Chnd96w5VtRrljUt/O5iu60k/n9iZ+9c+iY1rJmY4kbREfZNqeIaOzcQsTH1I9mgfRtuikT3k+Ww8iHBck50IFO2iCYbBnM8QSmjW48GFvuXImGP2A4lqFgPp+tcCsFEjCcb7tf4bnewemUcn1X54sStlq4w5ER
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39860400002)(366004)(396003)(346002)(376002)(29502001)(55016002)(316002)(9686003)(8936002)(7696005)(2906002)(110136005)(8676002)(5660300002)(33656002)(6506007)(83380400001)(66946007)(64756008)(76116006)(66476007)(66556008)(26005)(478600001)(186003)(52536014)(66446008)(86362001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 Pvyy8+gNTyYd5gKxL3a75W5PzqjVRyk0VA8nRt8kGV1wHpdzHk+EunPTy8pNDYj8I1CTyb27Emyy6xB+3bwobTa/50OKzXjrpClmZRLLDVzYdS8MAtTAWmbfJ/4wgRrdl0fag19nVx6k2C2YtOubh5Fh1GT/DB0UOaHALzhOR05RkHSCWucV8DB9PPOfhePCIWmizf8tiEQMC+CtgspGp2t1YEnL9CkH7tCsiHd9b/KDX/IgEGh74f5VH7m8vGVkpEXdReyVwIFh6vREqKJMfLXXLdTHqLaVSzw2OXFTLOgV1sXsbzcRr9jced62QjdXXgxYJVEukjUl7Fix1tKq3M4GEjyByfs+LJKWsnCzTMT0JoCrpevWLFs9hDpLQFQ5LFXCP3uuAUgl/T4uNVTI66nq35OWGkdv8f7ykrCdCe7MQ8jaTu9rBQaUY+iOmMrHQlqS/VeK/JoGRiWPBWW5QdbMDWof6ceOgxhL6oGkBLA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ddd52a-cb6b-418e-47e2-08d83401bcc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 20:55:33.8257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y7vsWXJ8LdxJ6y3nTt39v2/Ey/2xMS+puGeRA9thlttrDpXy5Ve+tx9lPOcDQmR4MH5VfPQPbwzGIZEra9HRhRHHPF5mJSaK36N4rTNNyTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2704
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KPiBUaGlzIGxvb2tzIGludGVyZXN0aW5nLiBDb3VsZCB3ZSBhZGQgc29t
ZXRoaW5nIHRvIHRoZSBtYW51YWwgYWJvdXQgaG93IHRvDQo+IHVzZSBpdCBhbmQgbWF5YmUgYSB0
ZXN0IGZvciBpdCBhcyB3ZWxsIHBsZWFzZT8NCg0KDQpIYWxmd2F5IHRocm91Z2ggd3JpdGluZyB0
aGUgdGVzdHMsIGFuZCBJIHJlYWxpemVkIExPR19DT0xPUklaRVJfU1VQUFJFU1NfQ09MT1JJWkVE
X09VVFBVVCBkb2VzbuKAmXQgcXVpdGUgd29yay4gSSB3cm90ZSBhIHRlc3QgcmVjaXBlIHdpdGgg
YSBkb19jb21waWxlIHRoYXQgcHVycG9zZWx5IGZhaWxzIHdpdGggYSBjb21waWxlIGVycm9yLCB0
byBjaGVjayB3aGV0aGVyIGNvbG9yIGRpYWdub3N0aWNzIHdvcmsuDQoNCkJ1dCBJJ20gZ2V0dGlu
ZyBjb2xvciB0ZXh0IHByaW50ZWQgb3V0IGFmdGVyICJMb2cgZGF0YSBmb2xsb3dzOiAiIHdoaWNo
IGlzIGtub3R0eSdzIHJlc3BvbnNlIHRvIHRoZSBiYi5idWlsZC5UYXNrRmFpbGVkLiANCg0KVGhp
cyBpcyBiZWNhdXNlIG9mIHNvbWUgY29kZSBvZiBfZXhlY190YXNrIGluIGJ1aWxkLnB5LiANCg0K
DQo1ODEgICAgICAgICB0cnk6DQo1ODIgICAgICAgICAgICAgZm9yIGZ1bmMgaW4gKHByZWZ1bmNz
IG9yICcnKS5zcGxpdCgpOg0KNTgzICAgICAgICAgICAgICAgICBleGVjX2Z1bmMoZnVuYywgbG9j
YWxkYXRhKQ0KNTg0ICAgICAgICAgICAgIGV4ZWNfZnVuYyh0YXNrLCBsb2NhbGRhdGEpDQo1ODUg
ICAgICAgICAgICAgZm9yIGZ1bmMgaW4gKHBvc3RmdW5jcyBvciAnJykuc3BsaXQoKToNCjU4NiAg
ICAgICAgICAgICAgICAgZXhlY19mdW5jKGZ1bmMsIGxvY2FsZGF0YSkNCjU4NyAgICAgICAgIGV4
Y2VwdCBiYi5CQkhhbmRsZWRFeGNlcHRpb246DQo1ODggICAgICAgICAgICAgZXZlbnQuZmlyZShU
YXNrRmFpbGVkKHRhc2ssIGZuLCBsb2dmbiwgbG9jYWxkYXRhLCBUcnVlKSwgbG9jYWxkYXRhKQ0K
NTg5ICAgICAgICAgICAgIHJldHVybiAxDQo1OTAgICAgICAgICBleGNlcHQgRXhjZXB0aW9uIGFz
IGV4YzoNCjU5MSAgICAgICAgICAgICBpZiBxdWlldGVycjoNCjU5MiAgICAgICAgICAgICAgICAg
ZXZlbnQuZmlyZShUYXNrRmFpbGVkU2lsZW50KHRhc2ssIGZuLCBsb2dmbiwgbG9jYWxkYXRhKSwg
bG9jYWxkYXRhKQ0KNTkzICAgICAgICAgICAgIGVsc2U6DQo1OTQgICAgICAgICAgICAgICAgIGVy
cnByaW50ZWQgPSBlcnJjaGsudHJpZ2dlcmVkDQo1OTUgICAgICAgICAgICAgICAgIGxvZ2dlci5l
cnJvcihzdHIoZXhjKSkNCjU5NiAgICAgICAgICAgICAgICAgZXZlbnQuZmlyZShUYXNrRmFpbGVk
KHRhc2ssIGZuLCBsb2dmbiwgbG9jYWxkYXRhLCBlcnJwcmludGVkKSwgbG9jYWxkYXRhKQ0KNTk3
ICAgICAgICAgICAgIHJldHVybiAxDQoNCg0KVGhlIGNvbG9yIG91dHB1dCBpcyBjb21pbmcgZnJv
bSBsaW5lIDU5NS4gVGhlIENvbW1hbmRGYWlsZWQgZXhjZXB0aW9uIGZyb20gYmIucHJvY2Vzcy5y
dW4gY2FycmllcyB3aXRoIGl0IHRoZSBzdGRvdXQgb2YgdGhlIHByb2Nlc3MsIHdoaWNoIGluIHRo
aXMgY2FzZSBoYXMgY29sb3IgdGV4dC4gDQoNCkkgdGhpbmsgYXQgdGhpcyBwb2ludCwgSSBxdWVz
dGlvbiB3aGV0aGVyIEkgc2hvdWxkIGp1c3QgaW50ZWdyYXRlIHdpdGggYml0IEJpdEJha2UgYmFr
ZSBkaXJlY3RseS4gSWYgSSB3ZXJlIHRvIGRvIHRoYXQsIEkgY291bGQgYWxzbyBmaXggdGhlIGxp
bWl0YXRpb24gb2YgLmNvbG9yIGFuZCAubm9jb2xvciBsb2dzIG5vdCBoYXZpbmcgb3V0cHV0IGZy
b20gcHJlL3Bvc3RmdW5jcy4gSSBwcm9wb3NlIHRoaXM6DQoNCmxvZy1jb2xvcml6ZXIuYmJjbGFz
czoNCgkxLiBSZXNwb25zaWJsZSBmb3Igc2V0dGluZyB1cCBDRkxBR1MNCgkyLiBSZXNwb25zaWJs
ZSBmb3IgcGFzc2luZyB0aGUgYXBwcm9wcmlhdGUgZmxhZ3MvZW52aXJvbm1lbnQgdmFyaWFibGVz
IGRlcGVuZGluZyBvbiBidWlsZCBzeXN0ZW0gaW4gdXNlIChmb3IgZXhhbXBsZSwgdGhlIGxpdHRs
ZSBiaXQgb2YgY29kZSBJIGhhdmUgdGFyZ2V0aW5nIENNYWtlKS4NCg0KQml0QmFrZToNCgkxLiBF
bnN1cmUgcHJvZ3Jlc3MgaGFuZGxlcnMgb25seSBzZWUgZmlsdGVyZWQgb3V0cHV0LiBBdCB0aGUg
Qml0QmFrZSBsZXZlbCBJIGNhbiBqdXN0IGRvIHRoaXMgZGlyZWN0bHkgYW5kIG5vdCBtZXNzIGFy
b3VuZCB3aXRoIHByb3h5IHByb2dyZXNzIGhhbmRsZXJzLg0KCTIuIENyZWF0ZSBhICItLXN1cHBy
ZXNzLWNvbG9yIiBmbGFnIHRoYXQgZmlsdGVycyBvdXQgQU5TSSBlc2NhcGUgc2VxdWVuY2VzIGZy
b20gdGhlIGNvbnNvbGUgYW5kIHRoZSB0YXNrIGxvZyANCgkzLiBNYWludGFpbiB0aGUgLm5vY29s
b3IgYW5kIC5jb2xvciB2ZXJzaW9ucyBvZiB0aGUgbG9ncy4gVGhvdWdoIEknbSBub3Qgc3VyZSBo
b3cgSSdkIGtlZXAgTE9HX0NPTE9SSVpFUl9UQVNLUy1saWtlIGZ1bmN0aW9uYWxpdHkgKHdoaWNo
IG9ubHkgd3JpdGVzIC5ub2NvbG9yLy5jb2xvciBsb2dzIGZvciB0YXNrcyB3ZSBhY3R1YWxseSBl
eHBlY3QgdG8gcHJvZHVjZSBjb2xvciBvdXRwdXQpLiBNYXliZSBJIHNob3VsZCBkbyBpdCBhdXRv
bWF0aWNhbGx5IGJhc2VkIG9uIHdoZXRoZXIgYW55IGVzY2FwZSBzZXF1ZW5jZXMgYXJlIGRldGVj
dGVkLg0KDQpUaGUgdXNlciB3b3VsZCBzdGlsbCBiZSByZXNwb25zaWJsZSBmb3IgSU5IRVJJVCdp
bmcgbG9nLWNvbG9yaXplciBnbG9iYWxseSBvciBwZXItcmVjaXBlLiANCg0KV2hhdCBkbyB5b3Ug
dGhpbms/DQoNClRoYW5rcywNCkNocmlzDQo=
