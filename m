Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.120])
 by mx.groups.io with SMTP id smtpd.web12.54932.1594031692217302319
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 03:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@here.com header.s=selector2 header.b=YDqQYLBF;
 spf=pass (domain: here.com, ip: 40.107.22.120, mailfrom: patrick.vacek@here.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLHjhw0DOeUJcjp2Jd3JkGkAOFQj8fjl6qQI3B+4HHA2qwVJud+6ZwpnFCIxbmibWHgXUtm94cCG5yMGaktKwy0dSHVplfJXK+XMjf80xdq4EDnzp3DV91l6l6fLWsVfe1m/bY0KPf6IbMFuulVOBhe7mKK/swiY/UnVJX65HrU0bBIPI5pQcQogm/RvagfxkuXXPp94ltLOdFD4N6A3Axd5CkaCbpWRkIPGhRSHv/VERsbHuDOxS9YgcXInxuQCm5kZD8QqrbKlfimu7vexofc4cRdo9YlV8tnRLAQRFH1RVLGLqniFBxBpTuKgd+W012I95IQ/KCvW8ZYc3K4V0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1+iWyMWKTJ+WBuffV0w5FTx6G04quV29ZcT0I16MV0=;
 b=V9DritFqcFcWRzxkNdyylMnbPK+4vx0FApR/J4OdJDt5UV6KRbvyoszVUYrbl45q+LqbxudsggDVOL62MxR5F6W0ihSoMInQl9+bCcjyXUZROGfIFycpQbk9lebg5ORNkWYJTerrJtE9sGh3VNDuxVZsSiOJuzbaqGXZqv5KLnvlWduxYwpyaAi83GEwkMm3zA6gr6z3Sa7N7LUWzLxFC6tk/HEAf+YmoRTNupllubUrGy6xQ8ydbfpxmzJSiFyWaJSpjxPTmec2l+oK2SXcOf+tmbHDwaipBM07d/UKuiQkushkItL2n/4mpfI9ByR+w212+HOl5HO4KpFJkwq40Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=here.com; dmarc=pass action=none header.from=here.com;
 dkim=pass header.d=here.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=here.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1+iWyMWKTJ+WBuffV0w5FTx6G04quV29ZcT0I16MV0=;
 b=YDqQYLBFYu4NAyk8Reo6C9+5w9pHTo8TXmVhEYqQn0lz3M9onu+cu7X2ME87fX7f0WBZQ5+KX+/6TBi52Q1fT8CrS/CUl51DhQdZw6UjoaUdnL4L7MYS/1IOGZmSb2eb3s0kBpwva9hfQLB6pQivaOzLzBvtdQe69XjlCZ3Idwg=
Received: from VE1PR04MB6431.eurprd04.prod.outlook.com (2603:10a6:803:12a::13)
 by VE1PR04MB6432.eurprd04.prod.outlook.com (2603:10a6:803:122::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Mon, 6 Jul
 2020 10:34:46 +0000
Received: from VE1PR04MB6431.eurprd04.prod.outlook.com
 ([fe80::1427:13eb:c506:99dd]) by VE1PR04MB6431.eurprd04.prod.outlook.com
 ([fe80::1427:13eb:c506:99dd%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 10:34:46 +0000
From: "Vacek, Patrick" <patrick.vacek@here.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] oeqa/core/loader: fix regex to include numbers
Thread-Topic: [PATCH] oeqa/core/loader: fix regex to include numbers
Thread-Index: AQHWU4ERSqwFNX2CJUaNOMuZkKitVQ==
Date: Mon, 6 Jul 2020 10:34:46 +0000
Message-ID: <dcf024f45cbf15b5cda297569fdd35f260b6bf5e.camel@here.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=here.com;
x-originating-ip: [2003:fc:d700:d000:40fb:1437:ccb1:8ab3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1cd5088b-aa89-4807-e081-08d82198342a
x-ms-traffictypediagnostic: VE1PR04MB6432:
x-microsoft-antispam-prvs: 
 <VE1PR04MB6432E7A28FB61F5CCEF39B528D690@VE1PR04MB6432.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 04569283F9
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Ykw5eDTTHUGbLBSGAr+aRBhmraMExHW04lTBtrHgT1X9PJmX190gD7pvOsbHFi6ZX0bIB7SwErlhhinFx3UHnaVuErdawq4eUpRzEJWz5pzLv4AYXTHJ5NLTE2EwyC8mOBqz4humZ7abL18Vc8vcC80GqVew0VyTFk+7cU3CYEfBE+WuSB5I1HfPLB63QKc16iRYBoFSvhxqdr3s/ZfT5pEEROuGDh2g3x2P8aqqyeJv45FsGsaN8w0OrZh7UdxliS00kPR308axW4aKmXKJcWZBC1n69q8hFNg5TsFpl6RAuLe3I3SyAlfdSfcjuG4zNt1iT+Hk1WcPoJEWSm8nCA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6431.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39850400004)(346002)(376002)(136003)(396003)(6916009)(91956017)(316002)(76116006)(8676002)(66946007)(66556008)(66446008)(71200400001)(66476007)(64756008)(478600001)(4744005)(6512007)(36756003)(6506007)(6486002)(5660300002)(83380400001)(86362001)(8936002)(2906002)(186003)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 XaDKtGKsjvX5Hhh1xTvgRGpkHhnNsylTzQf8vyjD1AxhsuNyjK3HigEHf6OlvYmhLgpL9rFFqNooDF8NNC40bbMY7abCWdEo3tItfLTfluhF7T/MMrg+yjU1RoCXKVbSNQiIveVftJki/SFe8e52Xzk2DuOXblL2xE5ZGtH0L0WFUnZZEiFPPON8Dwj7tdOpGHnNzdfcAETUH5GtiKOPmANfd/FbMwz9K1bB5fIRqz9Wo1hqxq32QmofkyeTfriO5pmwygFA3Ek7Dd/R+Fo40Lbu6pkpXCXPFtaKJE64PuZ9XQExBSKk3uEJdUDxWeNk+e4neQhZdtki6YIJAbjOQIi2ZTK+ammXrZmxinH3F65ij3mASXU8Z2M6uCd9pmhEvQtHRu5yn1grMqXkpuCtrn2FFjLHnmEyBK2WVMvwXT+JEHzvuD+dK0ByNQC7CZI5WohTXM+o3t3dtO3wR77GVTDY/w9uJdgoI2s8PwI29XbGM1rKG2Gg9oijSLG13OcXCRM7a8LPFo6j4gnciQgbdkpTDFlF3Xwux709er9aBrw=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: here.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6431.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd5088b-aa89-4807-e081-08d82198342a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2020 10:34:46.5726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d4034cd-7225-4f72-b853-91feaea64919
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eaJFczpaWJYZBSpLOdtMkmHG0MGYEQ3Zzbm7rrOJg1GPUu/o+JVCH1+zV3MUCh1dOgkmIAXvTwnpj/5kYT8zAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6432
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6815C7571E50CD408530D6AA9CE7D960@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

VGhlIHByZXZpb3VzIHZlcnNpb24gb25seSBpbmNsdWRlZCB0aGUgbnVtYmVycyAxIGFuZCAyIGlu
IHRoZSBhbGxvd2VkIGNoYXJhY3RlcnMNCmZvciB0aGUgbW9kdWxlIG5hbWUuIEluIHRoZSBwYXN0
LCB0aGlzIHdhcyAoXHcrKSBzbyBhbGwgbnVtYmVycyB3ZXJlIGFsbG93ZWQuDQpOb3cgaXQgZXhw
bGljaXRseSBpbmNsdWRlcyBhbGwgbnVtYmVycyBhZ2Fpbi4NCg0KU2lnbmVkLW9mZi1ieTogUGF0
cmljayBWYWNlayA8cGF0cmlja3ZhY2VrQGdtYWlsLmNvbT4NCi0tLQ0KIG1ldGEvbGliL29lcWEv
Y29yZS9sb2FkZXIucHkgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9tZXRhL2xpYi9vZXFhL2NvcmUvbG9hZGVyLnB5
IGIvbWV0YS9saWIvb2VxYS9jb3JlL2xvYWRlci5weQ0KaW5kZXggNzNjNTc4ODUwOC4uMTE5Nzgy
MTNiOCAxMDA2NDQNCi0tLSBhL21ldGEvbGliL29lcWEvY29yZS9sb2FkZXIucHkNCisrKyBiL21l
dGEvbGliL29lcWEvY29yZS9sb2FkZXIucHkNCkBAIC00Niw3ICs0Niw3IEBAIGRlZiBfYnVpbHRf
bW9kdWxlc19kaWN0KG1vZHVsZXMpOg0KICAgICBmb3IgbW9kdWxlIGluIG1vZHVsZXM6DQogICAg
ICAgICAjIEFzc3VtcHRpb246IHBhY2thZ2UgYW5kIG1vZHVsZSBuYW1lcyBkbyBub3QgY29udGFp
biB1cHBlciBjYXNlDQogICAgICAgICAjIGNoYXJhY3RlcnMsIHdoZXJlYXMgY2xhc3MgbmFtZXMg
ZG8NCi0gICAgICAgIG0gPSByZS5tYXRjaChyJ14oWzEtMmEtel8uXSspKD86XC4oXHdbXi5dKiko
PzpcLihbXi5dKykpPyk/JCcsIG1vZHVsZSwgZmxhZ3M9cmUuQVNDSUkpDQorICAgICAgICBtID0g
cmUubWF0Y2gocideKFswLTlhLXpfLl0rKSg/OlwuKFx3W14uXSopKD86XC4oW14uXSspKT8pPyQn
LCBtb2R1bGUsIGZsYWdzPXJlLkFTQ0lJKQ0KICAgICAgICAgaWYgbm90IG06DQogICAgICAgICAg
ICAgY29udGludWUNCiANCi0tIA0KMi4yNy4wDQo=
