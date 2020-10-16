Received: from EUR03-AM5-obe.outbound.protection.outlook.com (EUR03-AM5-obe.outbound.protection.outlook.com [40.107.3.75])
 by mx.groups.io with SMTP id smtpd.web10.20599.1602866936274032434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 09:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=jd3xRvVW;
 spf=pass (domain: siemens.com, ip: 40.107.3.75, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkW/9M2FegvMFZSJqwIQEJVZ1d8wrVLbNx2KKFzffJcyLxEaPyA2HyUhC/XevAOpRhMGxy4h6AqV1LoCUymvoZbLx3JSlQqOlUJxDtqrUamuwZF7r4JgMp4Ii1avydWEl28xbvLCfP0eKf3mecLzU02CBPBej3VEkJyylFS94vVOuO4GGV+LWPJks4ZyNB48SWsjVKB/JaEwlqK4rNJ+6H5qKglv9zROcDNJdR0I1ne5ChYCMostQU24j+Xuraqz0FG+daWHSQ1DNzJd+YuITQ8XfQMOe5fwJt5um7qUJkFfua/SfSiyy4obGqcDQapFOsXd/TwY7Yw6lzLmXE0m+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO20BS8rRvgpJKau2bxJWoO5HlU8eddsfR4y2K+lKis=;
 b=QnXG8lThcxfevbsS6YI/8em4SG8i1FQMibTQcChazRAg5JA8l5FXNsMksj5ZbmvSkaq45R0nlDVrF2UZQAqqG47GYaKntd6oEghSqzh/X7bsVC4k/FifhSi1Dwv+qd8XC/MKVorNKx3vAkTUSL35juxgAC8XuvaH41iJgU8J8uiqZpKpEZVH9Px55MHfSlJB48azJinu5DcOWQl025b/ohJaG07lyyqaGHKugL4lFD0dIclH7Ppyb4Qp/mc3wuVDkOmzUD0aFbLDOW4JLWMn5xHrmqjpCTZwgXKP4ElxOCN4ro6pgkfph60VjckJmIy61CQOhe0IN7tHNTiRjzJpfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO20BS8rRvgpJKau2bxJWoO5HlU8eddsfR4y2K+lKis=;
 b=jd3xRvVWoJCV8CtEdTGftnT8lqUaAWxNccUbvefF3uUfG4KF37+rvOZy+kWe3/YsJTLVeoDVF7Rf/SebCNEKzyfLf6YtiwJS6+gvxdFOb/EybvaX1nsRUssP/P/n67DkDYkspZbhACsfKvj8vlG8ww6lCPbsqVr82I/LOPbOr38=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB8PR10MB3708.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:137::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Fri, 16 Oct
 2020 16:48:54 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::190f:9fc5:dbb0:a1f4]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::190f:9fc5:dbb0:a1f4%3]) with mapi id 15.20.3455.035; Fri, 16 Oct 2020
 16:48:53 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Diego Sueiro <diego.sueiro@arm.com>
Subject: Re: [OE-core] [PATCH] busybox: add rev and pgrep
Thread-Topic: [OE-core] [PATCH] busybox: add rev and pgrep
Thread-Index: AQHWotLBCKsl0f5nok6GtSsqCDWxiamacmyg
Date: Fri, 16 Oct 2020 16:48:53 +0000
Message-ID: 
 <DB8PR10MB39778008487808091759D8AB92030@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20201015054600.24514-1-akuster808@gmail.com>
 <27107.1602752871157273119@lists.openembedded.org>
In-Reply-To: <27107.1602752871157273119@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2020-10-16T16:48:51Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=f2dc557e-63aa-40ba-86f1-9a642f43bb7d;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 96cc188d-c5a6-43db-a8d9-08d871f35de6
x-ms-traffictypediagnostic: DB8PR10MB3708:
x-microsoft-antispam-prvs: 
 <DB8PR10MB3708AEBA2BED3C43848E673A92030@DB8PR10MB3708.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:191;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xSTj7fYptOvD4i/yIQRSXCs/eHrjrsJlEPAfTDQ7YG42RS1M4ua5klkfMsBFI6s/WAeYHeEET5FeGwFzDxsyCJRG9LcwvNOAWmcSSGsOW0+4gkt1BrsrwK72nkMxDFJxyk0AiTbcfmml45iLZvRj44fqTtWaCIDvL7Zdg5VOVwWRYk96jvzU8yZvKYue7e3+k8+BhxWCZL78sZDqHti/YSpWOd9evgBcfpwW5+/BtpI5j3RQVCpOVDL9uM38A5LgQnPrb1G9T2wJ7x4iY5S4tRH8XGCUqnwbulsRmcyw1Ei3WWwE9iuTepXj2MDivib3z9rE7VegAnXWS/54aHozafVXikCStbeA03vAi1px5knQtZLELwRk5IzK6tmIxbGQ1Y5foBchK9ijOFEtTi76xg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(71200400001)(4326008)(53546011)(52536014)(478600001)(6916009)(86362001)(8676002)(316002)(6506007)(55016002)(7696005)(33656002)(45080400002)(26005)(5660300002)(76116006)(83380400001)(66446008)(66946007)(66476007)(66556008)(9686003)(186003)(55236004)(64756008)(8936002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 ns0tEgg/clgdgmDsEtXMUUmfoO6AkWZ6YvzYYB26lYP3m30zSH2l6urgnsrtddUnHKi1JGejQWpiJRvVkYpWI89eFUwcHOx9y20JHIUBuaqYRlBhw3sAQqZAHg90b8vwkwjx2aqRMaeweGVDRbmqAz6OreUrP64oZLmT1fQLPhAP/+UKw90G+I4U3dJZ6F/pou+CnfDiINrf6mCi8oZolV40v9vUUtOYSzrmow8/ZAczvnuLgtK1Q/nzf20dhcvxOxQ9xqVFr5GwbPX4zVYFJiFfw+6JrGG/Bd3X/McCzegQ3+m3rvgQNctlqqZRieUn7DrDKLn6sY8lz0DHylu1LV0+B8rYRwQetoe6dbhibWo7CvMay+20shXlpToyRFb0CdUM+KTT2u4LW8g8K0CZ0PQp3HrO/A/hswvouUwJMCLYwatltQWF6JJN9zymZEtm1U88qGspsjFPPWz6QgM90QV/EmJQN4mq47pjgtAqnF6wG/xDY5Ymx7UyXZNONN/itFYbjSXYFW+/YkMkpqs+FphRqXeZgkNohuu1gUsradi/Tar7U3oj+RG0kFIgwV0ccKnJvGgHCbWUtl8WjqcDRtAhC2Sg0ZWXAsYyDQyi28l/+t/asDmX5u2Bw5FcCY9+qM7BpO5VxuPP4E85hEhOIA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 96cc188d-c5a6-43db-a8d9-08d871f35de6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 16:48:53.7701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QygFFAu33Y8hldVxP6NlJ+P8sKiznUD6Hkww8EeRmXJOg32yimVg+PlXZoDdT2lDOYq0+44xwwm1sUhqz6aX6dLi99l7ex6dRPoJGKRuESY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3708
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCldoeSBhcmUgeW91IG5vdCBlbmFibGluZyB0aGVzZSBjb25maWdzIGNvcnJlY3Rs
eSB2aWEgZGVmY29uZmlnPw0KDQpSZWdhcmQsDQpBbmRyZWoNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcg
PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBE
aWVnbyBTdWVpcm8NClNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDE1LCAyMDIwIDExOjA4IEFNDQpU
bzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6
IFtPRS1jb3JlXSBbUEFUQ0hdIGJ1c3lib3g6IGFkZCByZXYgYW5kIHBncmVwDQoNCk9uIFRodSwg
T2N0IDE1LCAyMDIwIGF0IDA2OjQ2IEFNLCBha3VzdGVyIHdyb3RlOg0KDQo+DQo+IEZyb206IGFr
dXN0ZXIgPGFrdXN0ZXJAa29uYS5rYW1hLWFpbmEubmV0Pg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
YWt1c3RlciA8YWt1c3RlcjgwOEBnbWFpbC5jb20+DQoNClJldmlld2VkLWJ5OiBEaWVnbyBTdWVp
cm8gPGRpZWdvLnN1ZWlyb0Bhcm0uY29tPg0KDQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLWNvcmUv
YnVzeWJveC9idXN5Ym94L3BncmVwLmNmZyB8IDEgKw0KPiAgbWV0YS9yZWNpcGVzLWNvcmUvYnVz
eWJveC9idXN5Ym94L3Jldi5jZmcgICB8IDEgKw0KPiAgbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJv
eC9idXN5Ym94XzEuMzIuMC5iYiB8IDIgKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJveC9i
dXN5Ym94L3BncmVwLmNmZw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3Jl
L2J1c3lib3gvYnVzeWJveC9yZXYuY2ZnDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvYnVzeWJveC9idXN5Ym94L3BncmVwLmNmZw0KPiBiL21ldGEvcmVjaXBlcy1jb3JlL2J1
c3lib3gvYnVzeWJveC9wZ3JlcC5jZmcNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXgg
MDAwMDAwMDAwMDAuLjc3NWU0ODdkNjAxDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94L3BncmVwLmNmZw0KPiBAQCAtMCwwICsxIEBADQo+
ICtDT05GSUdfUEdSRVA9eQ0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvYnVzeWJv
eC9idXN5Ym94L3Jldi5jZmcNCj4gYi9tZXRhL3JlY2lwZXMtY29yZS9idXN5Ym94L2J1c3lib3gv
cmV2LmNmZw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMC4uZGEw
MDhjMzBjZDMNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9idXN5
Ym94L2J1c3lib3gvcmV2LmNmZw0KPiBAQCAtMCwwICsxIEBADQo+ICtDT05GSUdfUkVWPXkNCj4g
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2J1c3lib3gvYnVzeWJveF8xLjMyLjAuYmIN
Cj4gYi9tZXRhL3JlY2lwZXMtY29yZS9idXN5Ym94L2J1c3lib3hfMS4zMi4wLmJiDQo+IGluZGV4
IGFlZWE0MGZiYzE1Li44ZTIzYjBkNGEyOCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWNv
cmUvYnVzeWJveC9idXN5Ym94XzEuMzIuMC5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9i
dXN5Ym94L2J1c3lib3hfMS4zMi4wLmJiDQo+IEBAIC00NCw2ICs0NCw4IEBAIFNSQ19VUkkgPQ0K
PiAiaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGYnVzeWJveC5uZXQlMkZkb3dubG9hZHMlMkZidXN5Ym94LSUyNCZhbXA7ZGF0
YT0wMiU3QzAxJTdDYW5kcmVqLnZhbGVrJTQwc2llbWVucy5jb20lN0M4MGJhMzlkYWMzMWU0M2Ux
NTQ4ZDA4ZDg3MGU5ZTM2YSU3QzM4YWUzYmNkOTU3OTRmZDRhZGRhYjQyZTE0OTVkNTVhJTdDMSU3
QzAlN0M2MzczODM0OTcxMjY2NzkxMDMmYW1wO3NkYXRhPWxmVDFaUXcxcGwlMkJrbU01eE11Qk1X
WDFrV2xFcWV5emdmaE9YJTJCJTJGRkZIWWclM0QmYW1wO3Jlc2VydmVkPTB7UFZ9LnRhci5iejI7
bmFtZT10YXJiYWxsIFwNCj4gICAgICAgICAgICAgZmlsZTovLzAwMDEtZHUtbC13b3Jrcy1maXgt
dG8tdXNlLTE0NS1pbnN0ZWFkLW9mLTE0NC5wYXRjaCBcDQo+ICAgICAgICAgICAgDQo+IGZpbGU6
Ly8wMDAxLXN5c2N0bC1pZ25vcmUtRUlPLW9mLXN0YWJsZV9zZWNyZXQtYmVsb3ctcHJvYy1zeXMt
bmUucGF0Y2ggXA0KPiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1od2Nsb2NrLW1ha2UtZ2xpYmMt
Mi4zMS1jb21wYXRpYmxlLnBhdGNoIFwNCj4gKyAgICAgICAgICAgZmlsZTovL3Jldi5jZmcgXA0K
PiArICAgICAgICAgICBmaWxlOi8vcGdyZXAuY2ZnIFwNCj4gICINCj4gIFNSQ19VUklfYXBwZW5k
X2xpYmMtbXVzbCA9ICIgZmlsZTovL211c2wuY2ZnICINCj4gIA0KPiAtLSANCj4gMi4xNy4xDQo+
IA0KPg0K
