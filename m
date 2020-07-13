Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.128])
 by mx.groups.io with SMTP id smtpd.web10.14383.1594624202865599788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 00:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@here.com header.s=selector2 header.b=raZ5fn6Y;
 spf=pass (domain: here.com, ip: 40.107.6.128, mailfrom: patrick.vacek@here.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSEQjxvDTF7fdYUnkpACi1XLDwJ3mNEULeROyX6EfPUKTkcFvsMo2SADHw38a+OHGyyJmJ9H3imFWAn0seVo761c8RHwvufMHzV6vODNKdvwdhHkWz2QFD+rcc6XnRglHb9c0zUuX2J/0P/HeORIn+I4n36o5w+rio+wzB3EpcGgpPG898oguvhMWg0QiX7e61Ia1JLMLQUgTVINdzMS5NPf9+Fjw6Rms1G+WPABdL4bsz9brFX90zxGl6Ij55VuqVupUH0NrN1aibS1IPHfCsCwO3rvn7AVpewDO9x1ow7apeDQ2V/IJRUoWoXbeaaLDOWCEhMirVnFLPPZk4I7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGdOSY0627vMtp+tI0mU6ToYQuKQPqjzOwkTkUJOIYw=;
 b=UOcf/lc1cDjaK6bINP4RdvQEgU61OEdCn5KXDOahePiStqg+d3oKV8fjysg4acJB6BvWH/jAGLKKgDuCz5MNUQVowCOdzX5LROQVkbqdUeyKfbr8lpChI7uiRTpXfif6Vv7rfIr99GmZz93mKK7q5FSNf8P5TvnHlfP3gmRmRBf4sn1igsrcJnzPXHgd4lrigKqc37+Fs1GYUpu/K8evK4UCmIi9EefvjCIgYmZEdz2cQmhlmmtZDb7b16/a2+veO5GbOpjX24e9MVwcaBAiuDkC30//4ujyyNhXVm10af2VXc1TtZer2/6yo32uBfSL0c4VYuL3zvV4sPz8M6vc5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=here.com; dmarc=pass action=none header.from=here.com;
 dkim=pass header.d=here.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=here.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGdOSY0627vMtp+tI0mU6ToYQuKQPqjzOwkTkUJOIYw=;
 b=raZ5fn6Y4MEUqI1syd5jTVhkP4AFW40uLDgkUTkplQiFgAb9WMOBj6pYkbL9pPbzPGGYFQzfAxj/cDUyVZfbWYXD+4bHj7LJE5wsXlNGOzzbQEg8L3Z4so8a8FHBtlvFG5Yi40aKjKafQOki7Gt1DU93zAXikcrldCSNrDdg550=
Received: from VE1PR04MB6431.eurprd04.prod.outlook.com (2603:10a6:803:12a::13)
 by VI1PR04MB6845.eurprd04.prod.outlook.com (2603:10a6:803:138::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Mon, 13 Jul
 2020 07:09:59 +0000
Received: from VE1PR04MB6431.eurprd04.prod.outlook.com
 ([fe80::1427:13eb:c506:99dd]) by VE1PR04MB6431.eurprd04.prod.outlook.com
 ([fe80::1427:13eb:c506:99dd%5]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 07:09:59 +0000
From: "Vacek, Patrick" <patrick.vacek@here.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [dunfell][PATCH] oeqa/core/loader: fix regex to include numbers
Thread-Topic: [dunfell][PATCH] oeqa/core/loader: fix regex to include numbers
Thread-Index: AQHWWOSeesQV8DC5EEyzVs7CrsJQcg==
Date: Mon, 13 Jul 2020 07:09:59 +0000
Message-ID: <7568cbf70de113b3804b38bfd79ba4437d282833.camel@here.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=here.com;
x-originating-ip: [2003:fc:d701:3000:b083:e1e4:ea3b:ed58]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 05ce74b0-edbb-4d41-5205-08d826fbc191
x-ms-traffictypediagnostic: VI1PR04MB6845:
x-microsoft-antispam-prvs: 
 <VI1PR04MB68450DE4FC2B775392DD81FB8D600@VI1PR04MB6845.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Tf6jLJXnrHbDpfRsVY03QDR4uMQgJNBvqTM0jnKKOvF2+X4aW6y61f3UFPz6FxxxVreWF1e6MrDC3qjMGcaVnrGDSZJb+WCxi+vkOQ9pPDBmbGQM5DlArEJcZCS6Z6W1+rVQBQcjau1JNN1wmLCclYuPHhqqO4C4zG/LDHknfIxTwfguIrl27n9O6Zv659Wmx1AgWf8Lqc++exGJZ9sBQwSZdSfWAM6EwBvrKRyZzNiK9I7m4HW/xB7/VU91tjrOwQ9JO5fW007a6Bo6d0aPwi4zPUTTGgW7SaTMpRE7j57iV9cCyPcfOlchqmklQf0cZEy5iyp8UQCX3Wau9Q2nGg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6431.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39850400004)(346002)(366004)(396003)(136003)(86362001)(6916009)(8676002)(6486002)(2616005)(316002)(8936002)(186003)(83380400001)(478600001)(64756008)(66446008)(71200400001)(4744005)(66476007)(66946007)(6506007)(5660300002)(76116006)(6512007)(91956017)(66556008)(2906002)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 INuLGZMK5LQn+70f/Ran0HFlRrxAkspyF7HYLWOUzIq7lDtTOXRjttolhVTvoRfg6sXC3ja37YHpulB7DGNLyybiqNmudgWjpP7MJa5mvCA4KjA48x8a7rJ4j3Jn/9w2cmzacnSSRfZvKoZ3yhQOuMYTg6yh22eKQ0rV5/eHIb6FQlAkQQFXyKNJDfkfjisCIWqGmssSzVn0MdOWF6VicwXkyUzHA+YQavqZw5z5g/394StwFpLRajXSyulNrcHV1NuNEWIYgv8tQarPlD6xZKkTTUfPkzmRbq8RMKUXRj1CY8i7G6tOAw0vELY+nDRevbaRfRXObDT1b39m1GhZCl82r2V0lXIhjyqtY8XJjwcdphwFsIslpy8lyxSIcQBGDFBujB8w8lSfJnh9f7IMlRQhkekseXw0KDOviyImTinaGVFnVy8Cs6t2PBFbfjQUBcSPZKBhD0wq0hNmwS9wH/kjvms7tZ3SvhmDnVkVkHpSLAcX9jrNmbBKyVnFBpEszhr5rXkxKeKwMXna/O1KAk8pkuVsHlCSTWBVTXbU1tc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: here.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6431.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ce74b0-edbb-4d41-5205-08d826fbc191
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 07:09:59.8338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d4034cd-7225-4f72-b853-91feaea64919
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EIlAxiHPVMYtVFneOBgP0mQwA2Oauj00puZIzCTUDy3D+EId3GIjQ9ExlosQMX00AtcFf1QTeIcGBgTGyp2HKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6845
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C15E226FF4AA34A9E89AA8E213310DD@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

VGhlIHByZXZpb3VzIHZlcnNpb24gb25seSBpbmNsdWRlZCB0aGUgbnVtYmVycyAxIGFuZCAyIGlu
IHRoZSBhbGxvd2VkIGNoYXJhY3RlcnMNCmZvciB0aGUgbW9kdWxlIG5hbWUuIEluIHRoZSBwYXN0
LCB0aGlzIHdhcyAoXHcrKSBzbyBhbGwgbnVtYmVycyB3ZXJlIGFsbG93ZWQuDQpOb3cNCml0IGV4
cGxpY2l0bHkgaW5jbHVkZXMgYWxsIG51bWJlcnMgYWdhaW4uDQoNCihGcm9tIE9FLUNvcmUgcmV2
OiBmMjQxZmE0OTM1MzZhYzk1M2MxZGFjMzAzOTE3YzZlNzViNDU5ZTI4KQ0KDQpTaWduZWQtb2Zm
LWJ5OiBQYXRyaWNrIFZhY2VrIDxwYXRyaWNrdmFjZWtAZ21haWwuY29tPg0KU2lnbmVkLW9mZi1i
eTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQot
LS0NCiBtZXRhL2xpYi9vZXFhL2NvcmUvbG9hZGVyLnB5IHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS9saWIv
b2VxYS9jb3JlL2xvYWRlci5weSBiL21ldGEvbGliL29lcWEvY29yZS9sb2FkZXIucHkNCmluZGV4
IDczYzU3ODg1MDguLjExOTc4MjEzYjggMTAwNjQ0DQotLS0gYS9tZXRhL2xpYi9vZXFhL2NvcmUv
bG9hZGVyLnB5DQorKysgYi9tZXRhL2xpYi9vZXFhL2NvcmUvbG9hZGVyLnB5DQpAQCAtNDYsNyAr
NDYsNyBAQCBkZWYgX2J1aWx0X21vZHVsZXNfZGljdChtb2R1bGVzKToNCiAgICAgZm9yIG1vZHVs
ZSBpbiBtb2R1bGVzOg0KICAgICAgICAgIyBBc3N1bXB0aW9uOiBwYWNrYWdlIGFuZCBtb2R1bGUg
bmFtZXMgZG8gbm90IGNvbnRhaW4gdXBwZXIgY2FzZQ0KICAgICAgICAgIyBjaGFyYWN0ZXJzLCB3
aGVyZWFzIGNsYXNzIG5hbWVzIGRvDQotICAgICAgICBtID0gcmUubWF0Y2gocideKFsxLTJhLXpf
Ll0rKSg/OlwuKFx3W14uXSopKD86XC4oW14uXSspKT8pPyQnLCBtb2R1bGUsIGZsYWdzPXJlLkFT
Q0lJKQ0KKyAgICAgICAgbSA9IHJlLm1hdGNoKHInXihbMC05YS16Xy5dKykoPzpcLihcd1teLl0q
KSg/OlwuKFteLl0rKSk/KT8kJywgbW9kdWxlLCBmbGFncz1yZS5BU0NJSSkNCiAgICAgICAgIGlm
IG5vdCBtOg0KICAgICAgICAgICAgIGNvbnRpbnVlDQoNCi0tIA0KMi4xNy4xDQo=
