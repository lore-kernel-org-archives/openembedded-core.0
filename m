Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.71])
 by mx.groups.io with SMTP id smtpd.web08.6935.1619167269711375476
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 01:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=P4wTCZxI;
 spf=pass (domain: windriver.com, ip: 40.107.101.71, mailfrom: qiang.zhang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nM2TaJJa1l7LmeXkErDTL+PU9ZXI9erARIus4rSo6wqgWjrRIB+ZtPFPo0RDSkFJSVbPqsJE/dgtp2ZsUP+dWINpqUdMsFELefievcpQr9/tNlG/6SS2SgJgUgyBEyCBSGr9ZXU1a7jsA1z40zkB6EU43l0bH77F7+LTvYoBsT79qegTe34isUJV+eQNr2yJqeodb9UGb1Mp8qUUrHYUlHVPgUSmvORXdXQWzB7VIjQ6NMxEst6UgwfMiMsTwV/De+g4ZXSr9Yin+hl+JBqzSZ1lXEs2gztOJSS7i3xZViIVWqcVCG8NsFVBaLwfHqsE22lJU4fPheQGobfPLu0Zqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYx2b/kOZkfJoLR31S+mB4RCZ2AHVw13t0vNx7soT5k=;
 b=a2EYi272sBdIU5/RbzIh2DQL98XS+X/Im/qjV2+Fyzg9XaciJI5Jmkul4Zd+kg/QbHSBL4HUtNk2l+AIVOQYUQS5nzNVUFuPJ8N0DCVr6HYe9CuQanYXBNl6xWWUPIY3Wo0bHCGJ3tZUYVms5sQeQLAafPrZB0gVOK9Ss3ES4PSOEOdp4yr2NWQVXAMssOWqkfNRsBPiWFQgMDnTdtVE49vWRwgKfb6UMVVeU77nJ5Jyb08wvtWGDKo8NAKU07V8gnV3dnLXTOmg7TEjuNR6MtzGC/9uEROZ5XmsIqbM3VZH4HlNzuOrHOD9UDJLBDW2+7jNCz3vDgQuVrsvzIRVcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYx2b/kOZkfJoLR31S+mB4RCZ2AHVw13t0vNx7soT5k=;
 b=P4wTCZxIFEGBv7SlWsBYdt873ZvktxShvhRDStAGbwx+YaXxnzUruvXYuU7c/77OhX1BAwQYVzH9CrIcG4qP8nrSXgTPqSQRGbYszockXEYpbh7oG16LErNpwXqueTyl374I5t8vUbH2Zu6YB2YwJ2PJxCuldnLAWTO49EQ8xBs=
Received: from DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16)
 by DM5PR1101MB2105.namprd11.prod.outlook.com (2603:10b6:4:51::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 23 Apr
 2021 08:41:07 +0000
Received: from DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274]) by DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274%5]) with mapi id 15.20.4042.024; Fri, 23 Apr 2021
 08:41:07 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: "robert.joslyn@redrectangle.org" <robert.joslyn@redrectangle.org>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"linux-yocto@lists.yoctoproject.org" <linux-yocto@lists.yoctoproject.org>
Subject: =?UTF-8?B?5Zue5aSNOiBbUEFUQ0hdIHJ0LXRlc3RzOiBVcGRhdGUgdGhlIGxhdGVzdCBicmFuY2hlcw==?=
Thread-Topic: [PATCH] rt-tests: Update the latest branches
Thread-Index: AQHXMp+m2ubjKMNKX0OqxmSRqhLT+6rB0fht
Date: Fri, 23 Apr 2021 08:41:07 +0000
Message-ID: 
 <DM6PR11MB4202B29250ACE47E5FB8023BFF459@DM6PR11MB4202.namprd11.prod.outlook.com>
References: <20210416090558.1681-1-qiang.zhang@windriver.com>
In-Reply-To: <20210416090558.1681-1-qiang.zhang@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redrectangle.org; dkim=none (message not signed)
 header.d=none;redrectangle.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc825e5c-0d45-4584-7b4f-08d9063389cc
x-ms-traffictypediagnostic: DM5PR1101MB2105:
x-microsoft-antispam-prvs: 
 <DM5PR1101MB210502F7BD082BCFFD4045CDFF459@DM5PR1101MB2105.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nvYwun8tlCHtaafG/qnPZb+Pwvw1e//n7Fi/NJ3F3FuTHCBDHkmHODrIvnnh5RYB5RLLe7x0gPytEw/8u89mfkzG/XBGPkgnwuKl5dhRvPfMlwos1ovUdwhXdZqABb8EXgbro8ALbWt6JsQeUUpRJIEpPw1Fc5FLBcuR42282bVKCCq4N3Z/tJz8ZI7ydXS2QAqio8eMm6ElX06CKhnKgIFiZ+7TvINQnwymIl1+BI6IR4cD8F4HqazTHqIGyPUd6XOuPrsTtwkXETlzJXdq8X5dxTs1ftZSDlfNXKCp5yfjQpWsPtROAP82jyKZOAD9C87CDv+om6rPAk9XP86jqbBCM3/oGUmliBCwaDyoZ22/Px5DLNYP8bXXPAjhroj4revnzqUp/rGaGAwua1LR5meDQBCHzWRN+2Fe5Xbch+LVv9dIYWyW/5u03tJj8fE5PgxVY90smkt7WUipEDnz/qjELdWPW5vRNLI+74QK1MmVAs6jjAKV1nDdtP7vSRjaRtU7NFtsi5hU5K+UUSqO31mcP1qQHSIx1BfAl2LvEi7xxSwqFdypvUBBngj5rdC5ryKrp2S4QqKFtKHGI0PmmUncq6cVvQkBgQUxnSkmyus=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4202.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39850400004)(396003)(346002)(136003)(8936002)(66446008)(4326008)(64756008)(15650500001)(66946007)(71200400001)(54906003)(55016002)(91956017)(110136005)(5660300002)(122000001)(86362001)(66476007)(83380400001)(316002)(26005)(76116006)(7696005)(478600001)(6506007)(2906002)(33656002)(224303003)(66556008)(186003)(9686003)(52536014)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?gb2312?B?OFhldHdML2dVWjJoRmVtZW5LWVV6eHhPb3RHNmZ4N3lMYmpRc2pBUkRkZHNS?=
 =?gb2312?B?ZHYzczF5U3FEK05NRU81N2svSFNHbC9rdlF1bFFpbERvWlhRRWNPb1NLN1da?=
 =?gb2312?B?bG5xQSthVXBCNXBWVzg2YU1rNTd1VGE1N0drOHRJWlR1WmJOaGMwWUtxWExX?=
 =?gb2312?B?V0J3eDVYOTU3dGNNYVA2cmg2U0ZFbW53R1FoS214L1lOOVhpMFBaVlRRUFMx?=
 =?gb2312?B?OFl4U3EyWGVYeW81N2c4M25ReVhBRnVvZWVVYVFEZi9jb05IS1Z3UndaOUxI?=
 =?gb2312?B?TDYzaXNSSU1iMm5INk5yUTRIRllaM2VTZERad1ZFeEtLS0dsc0J1R1o1V2ZN?=
 =?gb2312?B?ZE1lUE1Wd3U3K0xXL2ZKUlRnbmI2NlRtWDdHckRPVThmUnR3am9BcDhZc1hp?=
 =?gb2312?B?QkkrLzB5N1ZVRG1SZ2NManJHa1pjTEU0cTQ1YStKWjhHWmVzQzllQURNWUtZ?=
 =?gb2312?B?ZEhreHd1Vkc3bkR4NTNlWVE4Zy92Rk93LzE1VUZTa0tJMDRtaklsVnpWVXhF?=
 =?gb2312?B?ZTBBVy81aXBaSUJ3NUlqc3FFZXd5TE1lLzV5YXFEL2pEazlhRlJ1TzRnakZx?=
 =?gb2312?B?TUdBOFlTVEJVVngxeVdRdG1kdTV1b01YdjM1TXRHSUZjQmhLMzgwVHF5Uk8z?=
 =?gb2312?B?S1FQUmt0M0drM0tvY0hTRjlLYzJFYUF0Vk9SakxhRlhWRUQ0R20rZjIyamxo?=
 =?gb2312?B?cHNUMUJjbFIxT3VpcS9XU1ZVVlI0dmt1T3lXS2IvZ0FiT2EyeEJTM3BaN2Vm?=
 =?gb2312?B?empZZ285akxNRFRDQzNobXE2a25vNkdJbGRGS1hxMDlOVUwxR2ZQUVd2aUpH?=
 =?gb2312?B?cTVOR3VDOEZxVi82Z0twakJSUXViRGdra3BKdU9EYlVjVXdBRVFmZGY2eUht?=
 =?gb2312?B?aG5jOE81bDJmU3M0Rlp5bUlnalBna2VJN2R3M0hOOFRFb2JSY2d3d29iV2tY?=
 =?gb2312?B?Q1Y3R05KcG9tOEEwN0hBSFlqdUprYzVvZFV1c014cXFHZTVkaWd4a1ltMmYz?=
 =?gb2312?B?TGc1ZzUreHVCNllWdHdqSHVrOXlHUk9yWmlJUnVBRGl0TWR5bzU2VlBYK3Zm?=
 =?gb2312?B?U21zN1lBdyt2UXV1ZEpXYWllWEc0cFdhTUFtT3kxektWWEZHQ05ZcVRkRkky?=
 =?gb2312?B?R0Vlay8zNmJNOFJvSm05MnIvdEpHR3JMZkh4bEJjeThrT0JIYmg5cjlQZnVs?=
 =?gb2312?B?MUYwQVpOWStibC81dC9jSW04MXg3NXA4a3BtMHJUbGt0eTJ1NysyS3R2aS9p?=
 =?gb2312?B?MnZTbWY1bzUwRVhwMTFQbVVySktQc0s1R2xQeU42RXBTbExoS1NiaGUwRzRh?=
 =?gb2312?B?a1FXSlYxbDhndEx5bk9Fd21oSmdvenB6RlpmN09nc3RKOTdwVzJxSmY4Mk9B?=
 =?gb2312?B?NW9DZVdjUWhpRGcyYXN6SkJBYTc1bGRMbjBuZEQ0anVNeUlkcG4yaGt4aFdh?=
 =?gb2312?B?a2o1dng1TjVwTzFiL0JkUlBMYjJTNVR2QjRBcEJsaHd4WWlnWE9oTVFrSndS?=
 =?gb2312?B?bmZPc1dOVUFtK2Vhanh0Z2Z4OXhMNXZlUlZ6UkxYSVpWWkJhTlBvNkFtc2NP?=
 =?gb2312?B?MTVON3pYSVRPWHhkTkdzWndqVy9Fbkxibkd3TDVYMFBnWW5ma3hjMGdlZERh?=
 =?gb2312?B?TXFYdGQxQWRUVUo0V3VRS0F1eU53eU5ROVZKcVA4YThHM2I1WFNhTnV5NlFS?=
 =?gb2312?B?MjBTVVZsNldQM0IxOFRzQk1LSjdtVlJLV2ZOU2dtdS8rSzJ6anZKVHJsa2tQ?=
 =?gb2312?Q?8CnLdHtRkm1xl44P40=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4202.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc825e5c-0d45-4584-7b4f-08d9063389cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2021 08:41:07.3704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VVIYRg9/T1cMVjyxuhfST50XCPH6cqjQcdAdyaIfMw8IlOdN7ymaNN9/bYNoXMWfo2Fu5g+cN9RvkCJIowXemkN2Mgw43AFvgeBZgI8bzuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2105
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8gcm9iZXJ0DQoNCiBUaGlzIGNoYW5nZSBkaWRuJ3QgcmVzcG9uZCBmb3IgYSBsb25nIHRp
bWUgLA0KIGxvb2sgZm9yd2FyZCB0byB5b3VyIHJlcGx5Lg0KDQpUaGFua3MNClFpYW5nDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7IyzogWmhhbmcsIFFp
YW5nIDxxaWFuZy56aGFuZ0B3aW5kcml2ZXIuY29tPg0Kt6LLzcqxvOQ6IDIwMjHE6jTUwjE2yNUg
MTc6MDUNCsrVvP7Iyzogcm9iZXJ0Lmpvc2x5bkByZWRyZWN0YW5nbGUub3JnOyBicnVjZS5hc2hm
aWVsZEBnbWFpbC5jb20NCrOty806IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc7IGxpbnV4LXlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCtb3zOI6IFtQQVRDSF0g
cnQtdGVzdHM6IFVwZGF0ZSB0aGUgbGF0ZXN0IGJyYW5jaGVzDQoNCkZyb206IFpxaWFuZyA8cWlh
bmcuemhhbmdAd2luZHJpdmVyLmNvbT4NCg0KV2hlbiBydW4gY3ljbGljdGVzdCwgdGhlIHBhcmFt
ZXRlciBlbmFibGUgTlVBTS4gYnV0IGluIHNvbWUgQlNQDQp3aGljaCBub3Qgc3VwcG9ydCBOVU1B
LCB3aWxsIGNhdXNlcyB0aGUgdGVzdCBwcm9ncmFtIHRvIGV4aXQNCmRpcmVjdGx5IGFuZCBkb2Vz
IG5vdCBjYXJyeSBvdXQgc3Vic2VxdWVudCBvcGVyYXRpb25zLCB0aGUNCmxhdGVzdCBjaGFuZ2Vz
IGhhdmUgZml4ZWQgdGhpcyBwcm9ibGVtLg0KDQoiM2FlYzU4MCBydC10ZXN0czogRG9uJ3QgYXNz
dW1lIG51bWEgaXMgYXZhaWxhYmxlIGF0IHJ1bnRpbWUiDQoNClNpZ25lZC1vZmYtYnk6IFpxaWFu
ZyA8cWlhbmcuemhhbmdAd2luZHJpdmVyLmNvbT4NCi0tLQ0KIG1ldGEvcmVjaXBlcy1ydC9ydC10
ZXN0cy9ydC10ZXN0cy5pbmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtcnQvcnQtdGVzdHMv
cnQtdGVzdHMuaW5jIGIvbWV0YS9yZWNpcGVzLXJ0L3J0LXRlc3RzL3J0LXRlc3RzLmluYw0KaW5k
ZXggOTM1OGYxM2QwNi4uMGM4OWJhZDkxZiAxMDA2NDQNCi0tLSBhL21ldGEvcmVjaXBlcy1ydC9y
dC10ZXN0cy9ydC10ZXN0cy5pbmMNCisrKyBiL21ldGEvcmVjaXBlcy1ydC9ydC10ZXN0cy9ydC10
ZXN0cy5pbmMNCkBAIC0xLDUgKzEsNSBAQA0KICMgVmVyc2lvbiAxLjgNCi1TUkNSRVYgPSAiMzI4
MTk1ODFjYzA1MDljOWQ1OGMzM2MzMDYxZjU3YWJlMGM0MGM4OCINCitTUkNSRVYgPSAiNmFmODgw
NjdkYTE2YzZlNjkyNDNiMzc2YzNiNjQ1NGVjNjk0NDYwYiINCiBQRSA9ICIxIg0KDQogU1JDX1VS
SSA9ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3V0aWxzL3J0LXRlc3RzL3J0LXRlc3Rz
LmdpdDticmFuY2g9dW5zdGFibGUvZGV2ZWwvbGF0ZXN0Ig0KLS0NCjIuMjkuMg0KDQo=
