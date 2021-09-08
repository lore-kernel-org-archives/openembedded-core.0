Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.73])
 by mx.groups.io with SMTP id smtpd.web09.8350.1631087358981186527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 00:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=fbptypV+;
 spf=pass (domain: siemens.com, ip: 40.107.5.73, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+WaB2bBvzgwF5iH0j+dZoeTwlzuBRQQ/OnDyEGGnGFt8UIlzvxavqWqrmuy1I14kkjrs+WTR4ENj1nZwA6XM425nO1QHsPeDspRKnzg1lv8ay+RfePQQdjmDejymWINClbYT1W9sUh6aC/YRO5r2QvHXR4yiZjivmADP13BQiDDXxXsCSgxVuvS53Qw4nKnSB3+vUYJp83x1l6y1MKv1wrbSaFY2uCk4j2eDpjXW49MhLN0rx8rZod6xPu/UbsXl/ieODzc8nzNZUjfAO1ZhqErb1kbGk+VDbSr7kDXjCSO90i4y5bGt+hcxQzB+kv7bel55CR1nK5fYtWNorYwvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=x5oQEinN5BEBb2T3nl6pTq8sMpmqlTA+ujiVeku/RlM=;
 b=jODZk1pSOkr8UJdbHIRofZ/eAj7lktvOAxdcOfLB3u2K3J0DuYHucMkFDPCLlY7mBKgRPdKJ2phmsT+OxhCWon1q8pMYCPUC3e+YMP1OrWWcZJfmUvZxP27EzcUu3QrAbqGadkZVMoqDHXfrQhkaTRSxJ8nOI4YlkdBRylU3CA+yUmqlnzcM7jDf9UvT8Fn1T4IgcRczCY/pSxau7jFSLbl9xlkWcI6f2FbORRH/fwgzqptqN0nzkz24N+4HNgPE1JNR9HagxgW3brfZIkPXq5SL+ts1VBZv2c4PDnRYdGHmsrxB7ZbDxB7miwPSzl7UjwRruFSNDxGqy4hXSFdAsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5oQEinN5BEBb2T3nl6pTq8sMpmqlTA+ujiVeku/RlM=;
 b=fbptypV+3+loWiMUeIc4+0vOqVkK7Gh57gIl6yNXsZRxcbTNUALUB/ooZ0/MoZc5OarMnZTexJUg7gCIDtDL5khCOeFp5I14fCf1eHnT3P0E5UwASbb2ABJV/nN7xtIF+nZi2WeMxMjvmRXQEuEdcckDF9wYsKpzE9Eq7UHvoeo=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DBAPR10MB4233.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1c9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Wed, 8 Sep
 2021 07:49:16 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac%9]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 07:49:16 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: "sakoman@gmail.com" <sakoman@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v2] vim: add option to disable NLS support
Thread-Topic: [OE-core][PATCH v2] vim: add option to disable NLS support
Thread-Index: AQHXmnyJE/lubZVXjUOOdINcrbAjhKuPk1SAgAA6+gCACgjDgA==
Date: Wed, 8 Sep 2021 07:49:16 +0000
Message-ID: <67be0df323696c2822d8cb010a44631cb6c3e217.camel@siemens.com>
References: <20210823101205.29267-1-andrej.valek@siemens.com>
	 <20210826131549.2349482-1-andrej.valek@siemens.com>
	 <3f9e5142ddd2b90cc3e150287d0f88456188d56b.camel@siemens.com>
	 <CAGDS+n=1TESUosknrqcO2NePBtufzL+QwAp40zpq6MzH0mju2w@mail.gmail.com>
In-Reply-To: 
 <CAGDS+n=1TESUosknrqcO2NePBtufzL+QwAp40zpq6MzH0mju2w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33422ef6-c9cb-42ca-aaac-08d9729d2873
x-ms-traffictypediagnostic: DBAPR10MB4233:
x-microsoft-antispam-prvs: 
 <DBAPR10MB423306849C105DAB6972310492D49@DBAPR10MB4233.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Ot8snXAZnLwUeuCRSBQ7frKYVj7cXH8rQOc370t3k6grihphSGd++IVF7IBZkY9VdRx/dmhHOkGIn+iQsmoj/zCe8msgZqgxe7s8Q7ZFkHsdgKbO02CVVU6GLLe645FJJNry+lvRT17vEiNjVzcP96pFRLgoBXJzBVVY6jSnZf21/tGuFh26JnCwjFMHY5RERRKfHqDzGnBp87KxQ6KJnhwG2w31bsxi3kL+81Nmdu82ofDXFdMocq+QsSVLIZX4zCkpKPq0IUQNzVhYNxqHQVs7W1ELzj6j8egqmEqonRv2b6ZmZyJvvYVxWxPOj6zxr7J4fDIxTH1P8INBgx+yDLgbxasJsVAzLvv+PAUuoDOFoG6XkoUOd4KAJvx98GTP6y9xkZPkg1d+FD34qNI4Q5FDMJpOszM+OzuBn9G6eA9mzkvINvu9mLCHXIVIR9FaNZymawSzXF2dgSyF5PLmlT/VxUrmVrqZI/rdjM+StMu8ZEXVCoN8aodvof4XIOd3WYcYrZNRq9jx6SvXVM5rElE3tLwsRz3JiaKReTpblOIC9vmmXOO/juphiZN5aQMHQ3DhJfy4iHVQ0Xrmeg4GoqLSR7jfOdqTqsb5z/o6j7b1sgST0f2gt2CCcBBpjK6fm/SFggJJF6nEWN6u42JTA1Aq2gChdOliQhvdKpG6MD6mcFVP7OQIVhuGgB3ywEXtnP11eEMmTzcatkFtWII4TQM8p3iGJdxFeOxGb2NHmn9iAEBGGGSskHFeyFeGB5HKfseS5rrnXc3040YWIaxoNqjUfgjWyDQnoun4mAWLId4b25AwTNYu5mX0BAdE/x5gmJhe9gXsJozB+wTWUhxuOQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(8936002)(26005)(6486002)(5660300002)(6512007)(6506007)(86362001)(966005)(54906003)(71200400001)(478600001)(316002)(2906002)(53546011)(8676002)(83380400001)(4326008)(38100700002)(76116006)(91956017)(122000001)(66556008)(66946007)(66476007)(2616005)(6916009)(186003)(38070700005)(66446008)(36756003)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OG9Sd3YvOEFTdGh0bnkyNytOZ3N6Z1EyYkhGVTB4ZXgrYkhGTUZoZEVJTmlt?=
 =?utf-8?B?Y0RkazVUSnBXMVZsMXlUVTVjK1ZLMHZaRHAxQzR2Rk1CY2NVVkF4bkF5RDJ4?=
 =?utf-8?B?aVgwSEE1aHZObTRxMDBsaGhrbjNmVEFhMSsyYjRGQjBNdHNZRlRaWDUwM1Vv?=
 =?utf-8?B?VW1Ua3Q4SmJjT2dNaGZQQ20yYWVrcVhlUlY5STlGalhhMmY1Q01OK1pOdTdV?=
 =?utf-8?B?N3NucS92cHVYQ0pqZkpFYUJKTklSNitaNlJEZFdhWHp4clBmek9kUTF3TkUz?=
 =?utf-8?B?QTB2dzFta2ZLTnJhaUpEcTQrSGtUdWhtWDhndzJrSjNTVUxKeXFwWXRlWjFI?=
 =?utf-8?B?SmJCVXV6V3l4QUJtTlU4LzdIM2pGOXdTUW5raEtRYjl0UnZrV0p0TlhXKzli?=
 =?utf-8?B?UVVFYjVQQVluSGxKNHJTdkZPblRmZXdJQU1PY21ZWlZ4aE5UdVA5NGQ2R2VY?=
 =?utf-8?B?WitmaDhxRlBBMFQyRWJ1VHZ4UDBpdjJ3YlI0bkJqZFlZZEh1b1JhL3EyUUFQ?=
 =?utf-8?B?NVoxTmdqaDY5OGdCK0NFaVFoL2lzY0dGejlUNWxPLzVOd3ZhaFE4amQrRDBY?=
 =?utf-8?B?dFR5Skd1dGFTMVdTZ210RUNkaURnN1Q3WEdIMElxSHpZSkdOcWZZdEU2R1hV?=
 =?utf-8?B?b0MzM1U2RE4zZUZBVi9lSll0V2xnWXEwTzVyRjJHSDBvQWVWTWlXRUkrZEZJ?=
 =?utf-8?B?WE1PaGhUcU5ydktpWEZKVlJSeTNzelE0UmRHV2xpQ1hrdjBuNGU5bjI0Y1o3?=
 =?utf-8?B?YmV4eS82Zkd5bU16WFJ3UUMzdXNhRVJNbnZxZFU5NTBHbGdiZWtneVdvUmU4?=
 =?utf-8?B?UzRFRkt2MGV1aXRjSE16OFc1OGJ4NEhENzVEcGZxeTNNdjdnSllGTDl6Vld2?=
 =?utf-8?B?eEExRWVmUHpHMWxvc094WmtKSEM1alJjYy8xelU4WENMaG1NSU9PUEVJVjdk?=
 =?utf-8?B?Y2N1eVFOaktrbDdtYTdySGJzLzFlRGJneXhGdU9lOEhQNWZlaXlvQklrSFR3?=
 =?utf-8?B?azdKSTNhc3dmM1hVaVdnMXB5VUhmWTJ1WWVEVTFMNVgyVjM0bENhS1VYZU9V?=
 =?utf-8?B?eFdLN0hLSmgxeGRQcVMzdnlLcnB3WFM5ZjZFWnNqcUwvMytIQVo5dGdVbW13?=
 =?utf-8?B?YnVZMzRwSDJDaXpqOWtLZHdrZk5QcTZ3cy93ZU1WYk9lVmpyR2NmbVJUQXRH?=
 =?utf-8?B?TFlWVWhPbENkc0YzQkVqaHNETGdFWFViWUVKUlFwZ3E0Q0dOeXhmMGh2TEll?=
 =?utf-8?B?TkovcUNxUkRDL1VXUDBaQTV1VWNkTVFiUGpMSEFvWFBUMXNUR0Q1b094L1hh?=
 =?utf-8?B?WUNobW1XWGdpRUtFU1Vpc3Jid1k5WWw3djhFc0VvSVBkRGZoU3MzWWROc2RO?=
 =?utf-8?B?M0VLUlJWd0N0aXVPVnp2V05wRW80TTRaSXU1RUJpUlVkb3Y0ZFNnSm1aQjNO?=
 =?utf-8?B?UGJaN0JjcEY3Sk5pdVdMbklqWmpBcmN4V1BqenNPaHRlSGFpTklaTFVSY3ov?=
 =?utf-8?B?RkVUTVdENFNoQVVabFVxN0c5MVBXUHNRT2xZQS85OTluTUphQis0SEd2cWlz?=
 =?utf-8?B?TlRpQ0VFN3NXL2pJTzBYSFBPSlQ4RHR1cXVnaFFYY0greUhCOGg0NFhYbW44?=
 =?utf-8?B?aDBjVGNTMVFjQ0E2cnhOeVBnMGN0bExkSkU3U1Q0djF6UUJoZWZMSmVhUzVH?=
 =?utf-8?B?K0ZOWDZ5eXZWYXRjYTg4KzZVSkU2eHdFaS9YYkFhNjQydzJYTEY0QzB1ckRo?=
 =?utf-8?B?MndXUnlSWmhwQ1d6akI5Y09xT2NFVnU3b3U0Y3JZZldwL1lZZkxKcncrMWZ1?=
 =?utf-8?B?N2pEYkt4QlpVZ1N2bkJTZz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 33422ef6-c9cb-42ca-aaac-08d9729d2873
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 07:49:16.2153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PfEbZqb5IQTitONTDINnEyR16obdoAmUyURkDM2JxzWrr/Q2klcXiX6a/KFiDJAlIkDLisblq1eG5DGzy3gpHj6f8Rw22r0ftleTP5nB1Xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4233
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCE2B7A1A4905B42888C8B9EF9B3E196@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

SGVsbG8gU3RldmUsDQoNCldoYXQncyB0aGUgY3VycmVudCBzdGF0dXMgaW4gdGhpcyBjYXNlPw0K
DQpJIHNlZSwgdGhhdCBjaGFuZ2VzIGFyZSBpbiBkdW5mZWxsLW51dCBicmFuY2gNCmh0dHA6Ly9n
aXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3Bva3ktY29udHJpYi9sb2cvP2g9c3Rh
YmxlL2R1bmZlbGwtbnV0DQouIEJ1dCB5b3UgYnVtcGVkIHRoZSAzLjEuMTEgdmVyc2lvbiBhbHJl
YWR5DQooaHR0cDovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kvcG9reS9sb2cv
P2g9ZHVuZmVsbCApIHdoZXJlDQp0aGUgY2hhbmdlcyBhcmUgbm90IHRoZXJlLg0KDQpSZWdhcmRz
LA0KQW5kcmVqDQoNCk9uIFdlZCwgMjAyMS0wOS0wMSBhdCAxMjozNSAtMTAwMCwgU3RldmUgU2Fr
b21hbiB3cm90ZToNCj4gT24gV2VkLCBTZXAgMSwgMjAyMSBhdCA5OjA0IEFNIEFuZHJlaiBWYWxl
ayA8YW5kcmVqLnZhbGVrQHNpZW1lbnMuY29tPg0KPiB3cm90ZToNCj4gPiANCj4gPiBIZWxsbyBT
dGV2ZSwNCj4gPiANCj4gPiBDb3VsZCB5b3UgcGxlYXNlIGNoZXJyeS1waWNrIHRoaXMgcGF0Y2gg
aW50byBkdW5mZWxsIGJyYW5jaCB0b28/DQo+IA0KPiBPSywgd2lsbCBhZGQgdGhpcyB0byBteSB0
ZXN0IHF1ZXVlLg0KPiANCj4gU3RldmUNCj4gDQo+ID4gDQo+ID4gVGhhbmsgeW91LA0KPiA+IEFu
ZHJlag0KPiA+IA0KPiA+IE9uIFRodSwgMjAyMS0wOC0yNiBhdCAxNToxNSArMDIwMCwgQW5kcmVq
IFZhbGVrIHdyb3RlOg0KPiA+ID4gLSBTb21lIGRpc3RyaWJ1dGlvbnMgd2l0aCBVVEYtOCBsb2Nh
bGUgaGF2ZSBwcm9ibGVtIHdoZW4gTmF0aW9uYWwNCj4gPiA+IExhbmd1YWdlDQo+ID4gPiBTdXBw
b3J0IGlzIGVuYWJsZWQuIEFkZCB0aGVyZSBhbiBvcHRpb24gdG8gZGlzYWJsZSBpdC4NCj4gPiA+
IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmVqIFZhbGVrIDxhbmRyZWoudmFsZWtAc2llbWVu
cy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IMKgbWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS5p
bmMgfCA0ICsrKy0NCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvdmltL3ZpbS5pbmMgYi9tZXRhL3JlY2lwZXMtDQo+ID4gPiBzdXBwb3J0L3ZpbS92aW0uaW5j
DQo+ID4gPiBpbmRleCAxN2QxYzI0YTdjLi44NjBmZDI0ODYzIDEwMDY0NA0KPiA+ID4gLS0tIGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS5pbmMNCj4gPiA+ICsrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3ZpbS92aW0uaW5jDQo+ID4gPiBAQCAtNTQsMTEgKzU0LDEyIEBAIGRvX2NvbXBp
bGUoKSB7DQo+ID4gPiDCoMKgwqDCoCBhdXRvdG9vbHNfZG9fY29tcGlsZQ0KPiA+ID4gwqB9DQo+
ID4gPiANCj4gPiA+IC0jQXZhaWxhYmxlIFBBQ0tBR0VDT05GSUcgb3B0aW9ucyBhcmUgZ3RrZ3Vp
LCBhY2wsIHgxMSwgdGlueQ0KPiA+ID4gKyNBdmFpbGFibGUgUEFDS0FHRUNPTkZJRyBvcHRpb25z
IGFyZSBndGtndWksIGFjbCwgeDExLCB0aW55DQo+ID4gPiBzZWxpbnV4LA0KPiA+ID4gZWxmdXRp
bHMsIG5scw0KPiA+ID4gwqBQQUNLQUdFQ09ORklHID8/PSAiIg0KPiA+ID4gwqBQQUNLQUdFQ09O
RklHICs9ICIgXA0KPiA+ID4gwqDCoMKgwqAgJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVB
VFVSRVMnLCAnYWNsIHNlbGludXgnLCBkKX0gXA0KPiA+ID4gwqDCoMKgwqAgJHtAYmIudXRpbHMu
Y29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICd4MTEnLCAneDExIGd0a2d1aScsDQo+ID4gPiAn
JywNCj4gPiA+IGQpfSBcDQo+ID4gPiArwqDCoMKgIG5scyBcDQo+ID4gPiDCoCINCj4gPiA+IA0K
PiA+ID4gwqBQQUNLQUdFQ09ORklHW2d0a2d1aV0gPSAiLS1lbmFibGUtZ3VpPWd0azMsLS1lbmFi
bGUtZ3VpPW5vLGd0ayszIg0KPiA+ID4gQEAgLTY3LDYgKzY4LDcgQEAgUEFDS0FHRUNPTkZJR1t4
MTFdID0gIi0td2l0aC14LC0td2l0aG91dC14LHh0LCINCj4gPiA+IMKgUEFDS0FHRUNPTkZJR1t0
aW55XSA9ICItLXdpdGgtZmVhdHVyZXM9dGlueSwtLXdpdGgtZmVhdHVyZXM9YmlnLCwiDQo+ID4g
PiDCoFBBQ0tBR0VDT05GSUdbc2VsaW51eF0gPSAiLS1lbmFibGUtc2VsaW51eCwtLWRpc2FibGUt
DQo+ID4gPiBzZWxpbnV4LGxpYnNlbGludXgsIg0KPiA+ID4gwqBQQUNLQUdFQ09ORklHW2VsZnV0
aWxzXSA9ICItLWVuYWJsZS1lbGYtY2hlY2ssLGVsZnV0aWxzLCINCj4gPiA+ICtQQUNLQUdFQ09O
RklHW25sc10gPSAiLS1lbmFibGUtbmxzLC0tZGlzYWJsZS1ubHMsLCINCj4gPiA+IA0KPiA+ID4g
wqBFWFRSQV9PRUNPTkYgPSAiIFwNCj4gPiA+IMKgwqDCoMKgIC0tZGlzYWJsZS1ncG0gXA0KPiA+
IA0KPiA+IA0KPiA+IA0KPiA+IA0KDQo=
