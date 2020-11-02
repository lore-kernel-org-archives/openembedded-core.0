Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.73])
 by mx.groups.io with SMTP id smtpd.web08.384.1604332875456431289
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:01:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=VhhQZ22r;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.75.73, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVsxwdBEobslUDHQuKeqOtz/0/2Glrsocvv0HUbGAXKBAB5/u3L881eY/4uodbU0Z8nsCPs2Ogxzk+8Jy/mxm0FuH3+KGpKetyxP1RiQNSPPQDSEJ3bQpZzWdbYSGYZavf8wWRg7yMt/kUprtvCKaqxyXWgL465e3kKsHpjvhWEGfmb7Pq700HS43NChMxgNwTFZpmCwRHMA2MhygcxMXPoiBU2/lFel32diEXZ4giJ4Ni5QqSkfy66NoVM5hE6TY8RobiTiuCsNt9URw/C5Nz6xsoxEIIxda9EdL9zJSgFxtiHI84hhTUSyf745ZsYDn39b2BAE6mBwyRpgFuJJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5K3Huk7t7FDjBbwg0TRV+QSjdBB25EpJYK9dNGKHpyQ=;
 b=Rrf/6L+mmrEo14rfaBDhGhISiKmsruKdvNGHQ+Tc9mPA80d9L79c2gRAGQtngRMdPoId+Sub4ScLbzT5vGparjnq/Yb29dV9iAc7zm3OpeOMrtpqIzbC5/penbQPzx8HtvH2HjYnaDOl096o5yJ9oB9Reedue7sn2xchrz2FhTlIoxPJw/Klpem2AYjTmQuGxXBkE3lR7YW0D5dhvXJsyPeRqMgxOCf9kdetKs271zbWSWG68d33ystWqHkDV+9x34BnBtT7vV3PFnfbF1rJ7MYeLn1ulTYJdsCf2Cp4jcf+4KXK1P+FAaTqF/zJQx4SoW+iXJJ7bJA7F55B8GHHBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5K3Huk7t7FDjBbwg0TRV+QSjdBB25EpJYK9dNGKHpyQ=;
 b=VhhQZ22r+Z6efWu0oMd1Pk07zroRXMuYPq6Xwy9EAMRpei43jPL1aJ+nN/pQwRlju2ANj57rXJfq4qa5d/3jMIu7WcnzVAhE+2Nj2RAMlxMk2V2assHEJkPK9d7JDkSWMi82WV3l2oRuWknSIaWRFhA2HZ1seN95ErgxKdnorquJNumUKG7T4s2b+hXU9mmNxJAIgZuyaY0aq831A5/FQs7Fz8k3TNYEBV9IYQl+h548m66mXlqzaIFojYqqBkU/V9RpVgyOMgwHbFzUY8wrT7vaPB0GxwJbatkc5hQ96V/aCHmNJLBQTr3YdPFIe97n+mwUCaUtDTTOCG741ZMqNg==
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SA0PR12MB4493.namprd12.prod.outlook.com (2603:10b6:806:72::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 16:00:59 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::5dc7:be80:e39f:5be1]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::5dc7:be80:e39f:5be1%3]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 16:00:59 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: Joshua Watt <jpewhacker@gmail.com>, "paul.eggleton@microsoft.com"
	<paul.eggleton@microsoft.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meson: ensure out-of-tree build when under externalsrc/devtool
Thread-Topic: [OE-core] [PATCH] meson: ensure out-of-tree build when under
 externalsrc/devtool
Thread-Index: AQHWnMlMgJs8aNiUwUauCVp48BLudamMihCAgAFqNoCAAAMhgIAAAJlggCcw5EA=
Date: Mon, 2 Nov 2020 16:00:59 +0000
Message-ID: 
 <SN1PR12MB248092FF4115041E2F0E745B8B100@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20201007164534.123373-1-chris.laplante@agilent.com>
 <15be7caa-aa27-1776-6f41-6ef0bd64a9fb@gmail.com>
 <SN1PR12MB2480E9CCDB9E862AA6A3700E8B0B0@SN1PR12MB2480.namprd12.prod.outlook.com>
 <CAJdd5GZ1q4RaoJeU=omX5kJ2f5OTgJZ3D6Y24aGY+94XMt-8-w@mail.gmail.com>
 <SN1PR12MB2480AD9F30904A09A615B80F8B0B0@SN1PR12MB2480.namprd12.prod.outlook.com>
In-Reply-To: 
 <SN1PR12MB2480AD9F30904A09A615B80F8B0B0@SN1PR12MB2480.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=agilent.com;
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 068de889-00c2-40a0-f264-08d87f487d8b
x-ms-traffictypediagnostic: SA0PR12MB4493:
x-microsoft-antispam-prvs: 
 <SA0PR12MB449349E64D520D09101D626A8B100@SA0PR12MB4493.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UPTNYYh+5jq/F3irSH2iuVV0P5CrDINbxzk48agLTGs4gZ5h5ry2vvufkfWrdO85WQOkGsJJjWkDHCy9BNhs27/6wvAEVu9rbcHlJczvDqAf0Wzy/+dirBy/mvrz3ODXHnTbxMnw8m9wfyQ5ZKvGeymtwa+2QaJIcT9hGeLSLFmzkiyopiK+bkJPBfieuA5X0GsbZ8kmMXUf56Co3w7LN/Ara3eH0A6QpQKra/NlurmRxlbKGdSsVwwUw4Tn6pq0u0A4JaVIM5/5C1SVdLJ2Qr2oiAD2TQEU/qR0W64qGa7LgcP0u/Ww/34gWTuHL54XjeCKv1c9c7CL720lSqF7JmvOAIWp5nG/o01TBKrC88AaWdCA4qxqWkSOPOKUtxY5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(29502001)(33656002)(9686003)(86362001)(7696005)(6506007)(26005)(71200400001)(316002)(52536014)(186003)(2906002)(478600001)(66946007)(66446008)(64756008)(8936002)(8676002)(110136005)(5660300002)(55016002)(76116006)(66556008)(66476007)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 qrB3+eUQHTXKDI8T5lVbIGf3W0rrNGG6/G1o67Q6gh9jSXjmhKT4i6mS85e5i+HdpAjsFrV1iaFy64cAJBPITPNYY3XnYFggJMa8CTA/m6oeBXcSDAo8f99zQkhHddkMbf1FgdNtklPOQQPX9dl3MfbUGcts0Nv0P+RdIVzDBs/tH5Uux/lWcntnQdK5R/CESxPba88ZKmjLP33b+rkrYvAhDXkFgIt9JIjcNwX0PeF8hzzGI+dX+yxECNFMYZDJkUR3goYC578mvcA+g5sJhIL1V+CneAK8ka3kT89TOtgzX1Pv4ysA185q46grWYffLjWg0DgxAhMfES2TH3tgJsKuwx0YzI99LjSlif06Fkc+75uBTr9QaV/t0zOkNybvyZe71EQ8/jdKEkLl39Prcb9yrkCnc0Lp+tyk8MS3RYTvkXMlBDwAIN4LLuaQKoYz48z4oq6YmoAYNH/qXNqK+/1p0LxiGFzEnZDQgmBSO6LYYd7ariErJYbcIG75QbbCyALgDxsDd4K4RmPAfBRVnUDn8fpk8nZHL4anMscQ0c66Y5VSubwRcIm7z+p7/IwPTUAN0Z/1150xGRRbisIqvqJ5+HrpcnurCzJncJelUUDlMoKzlqy9UW1/iaUWhPkwquc1K7BC6WlKEdZn2wRuHg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068de889-00c2-40a0-f264-08d87f487d8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 16:00:59.2302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T2PsevoWWN79eQG+POVwSURNJZYr2Qg+gq0DI1SclS5HjPxsDdCi68rNkM/zMFPQc1TQ6TMIxDiekCNtn5z9SJ+TettKCT8CdWpd5SoXV/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4493
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+ID4gSSBoYXZlIG5vIGlkZWEgd2h5IGRldnRvb2wgZG9lcyBpdCAoaW4gZ2VuZXJhbCksIGJ1
dCBpdCBkb2VzIChzZWUNCj4gPiBwb2t5L3NjcmlwdHMvbGliL2RldnRvb2wvX19pbml0X18ucHks
IHRoZSAidXNlX2V4dGVybmFsX2J1aWxkIiBtZXRob2QpLg0KPiA+IEdyYW50ZWQgSSdtIHVzaW5n
IHpldXMsIGJ1dCBteSBleHBlcmllbmNlIGlzIG5vdCB0aGUgc2FtZSBhcyB5b3VycyBzbw0KPiA+
IGZhciAtIG15IG1lc29uIHJlY2lwZSB0cmllcyB0byBidWlsZCBpbiB0aGUgc291cmNlIGRpcmVj
dG9yeS4NCj4gPg0KPiA+IEFoLCBzb3JyeS4gSSB3YXNuJ3QgcXVpdGUgY2xlYXIgaW4gd2hhdCBJ
IHdhcyBhc2tpbmcgOikgWWVzLCB3aGF0IHlvdQ0KPiA+IGFyZSBzZWVpbmcgaXMgdGhlIGV4cGVj
dGVkIGJlaGF2aW9yIGJlY2F1c2UgZGV2b3RvbCBpcyBzZXR0aW5nDQo+ID4gRVhURVJOQUxTUkNf
QlVJTEQgZm9yIHRoZSByZWNpcGUuIE15IHF1ZXN0aW9uIGlzIHdoeSBkZXZ0b29sIGlzIGRvaW5n
DQo+ID4gdGhhdCBhdCBhbGw/IFRoZSBkZWZhdWx0IGJlaGF2aW9yIGluIGV4dGVybmFsc3JjLmJi
Y2xhc3MgKGFuZCB0aHVzLA0KPiA+IHdoYXQgeW91IHdvdWxkIGdldCBpZiBkZXZ0b29sDQo+ID4g
KmRpZG4ndCogc2V0IEVYVEVSTkFMU1JDX0JVSUxEKSwgaXMgdG8gZm9yY2UgYW4gb3V0IG9mIHRy
ZWUgYnVpbGQgYnkNCj4gPiBzZXR0aW5nIEIgdG8gYSBzdWJkaXJlY3Rvcnkgb2YgJHtXT1JLRElS
fS4gSXQgc2VlbXMgbW9yZSBhbmQgbW9yZSBsaWtlDQo+ID4gb3V0LW9mLXRyZWUgYnVpbGRzIGFy
ZSB0aGUgbm9ybSwgc28gaW5zdGVhZCBvZiBjaGFuZ2luZyBldmVyeXdoZXJlDQo+ID4gKHdhZiwg
bWVzb24sIGV0IGFsLikgdG8gd29yayBhcm91bmQgZGV2dG9vbCBkb2luZyBhbiBpbi10cmVlIGJ1
aWxkLA0KPiA+IGNhbiB3ZSByZW1vdmUgZGV2dG9vbCBzZXR0aW5nIEVYVEVSTkFMU1JDX0JVSUxE
IHNvIHRoYXQgaXQgZGVmYXVsdHMgdG8gYW4NCj4gb3V0LW9mLXRyZWUgYnVpbGQ/DQo+IA0KPiBO
byBwcm9ibGVtLCBJIHVuZGVyc3RhbmQgbm93IDopLiBZZXMsIEknZCBjZXJ0YWlubHkgYmUgaW4g
ZmF2b3Igb2YgZGVmYXVsdGluZyB0bw0KPiBvdXQtb2YtdHJlZSBidWlsZHMuIEknbGwgcHVsbCBQ
YXVsIGluIGhlcmUgdG8gc2VlIGlmIGhlIGhhcyBhbnkgb2JqZWN0aW9ucy4NCg0KSSB0aGluayBJ
IGdvdCBQYXVsJ3MgZW1haWwgd3Jvbmcgd2hlbiBJIHNlbnQgdGhpcyBpbiBPY3RvYmVyLiBMZXQn
cyB0cnkgdGhpcyBvbmUuLi4NCg0KQ2hyaXMNCg==
