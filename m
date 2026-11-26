Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5741.1795657316412069185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 17:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=HeyR7Xlt;
 spf=pass (domain: axis.com, ip: 40.107.130.13, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pe9usVt34FnnKLjxwB7jNhi+DQtjT/wtSAdcb4ayRuJvJe4YxxZDGa5BCoyNKJyXfWs6E+y9TvZbbiMhJybHzBJ/EkSgYsFfqzQ1Awbrzcm0W1P4eX8COCqTRHZLB7MNlqTJsWe0K2Jsvk+Cj9EkRlaR8ZvK5RmRmrAXszP+Bd5zHN4GT8xL9Fweohm+obkoEo2PdJPL9yFtXc4xkEogRnyvtMpNj+py8IeraP9Qdaj13kbeO91vDZEBOETzDlXDSS7cBaHhkjuBmyA+98QJZ6Qxh91nvTI/C2SkiV9302MScbaz1qoA+Po/65+MwFw55roQ+FIEeKFVAWj4mSftYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKFq5PWJyA9zmWHPDpTUQ0nvEwYuGSi9sA1QzQUL+EM=;
 b=rHbeRvi4bvPphzg+LMBlKToKvA243m8c1exX4jsOxU9kMM2WtliAn2mHG8WG7O1qjyUXoCh6cx+8lgTCnxKdE8cGku/YUVbAn0TorfLLhgn0LsWhXI+NxjMAUYWow/7MLYrWiFWUPEOqEy46MHj0lXyTwmJpbKxRI+6y2ALZndJl7L9fZxAKeQUUF+XRkeljKSnwczJoK/PBT8f8mVEWi/demjl1byG8ucnrmcAW3H8cfDmC1zsVHTmpvZOKxSv60yApalfjUDoiRlVJsonDp843GDutgVOk++wN6QV+LhBYWd+FfD+CYBdsvdvMzzA+KYAb9tMbdFsmFlVhs7DYgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKFq5PWJyA9zmWHPDpTUQ0nvEwYuGSi9sA1QzQUL+EM=;
 b=HeyR7XltJpWa9B2LbNAOJTFYixyA3rvobhY1tQ7w7DOrj8SFqHTPxCZfere6D2iBiG9tqQ5XsnKW4/jmvS8l0Zz1ifmsZvVA5kdPWYXoFiDieAh1wrZoT3Q79+QcYL8CBExS/gnfjTGrKJ0m2p4R+Ue/Smqlxf0vIxCd5JNcU0w=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAXPR02MB8103.eurprd02.prod.outlook.com (2603:10a6:102:24e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 01:41:51 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 01:41:51 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Marco Felsch <m.felsch@pengutronix.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yocto@pengutronix.de" <yocto@pengutronix.de>
Subject: RE: [OE-core] [PATCH v2] classes/cargo-update-recipe-crates: support
 multiple Cargo.lock search directories
Thread-Topic: [OE-core] [PATCH v2] classes/cargo-update-recipe-crates: support
 multiple Cargo.lock search directories
Thread-Index: AQHdfFnt8ORbyY6trEWW+SSCbWR54bc/RESg
Date: Thu, 26 Nov 2026 01:41:51 +0000
Message-ID: <DB5PR02MB10213B2EC40B63599E3F09C4BEF422@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20261124-mfe-multi-cargo-lock-files-v2-1-8fd15cf316aa@pengutronix.de>
In-Reply-To: <20261124-mfe-multi-cargo-lock-files-v2-1-8fd15cf316aa@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAXPR02MB8103:EE_
x-ms-office365-filtering-correlation-id: 5b9ea1ae-ab22-41a5-385a-08df4b5e719c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|38070700021|10067099003|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|261026121527099003|261022105027099003|261026140227099003|261028144727099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: Sz0Pzdw3d8G/fw7I5tKmzyBw81hlbJoljodjnXub9VunNdyhUnBX2Tt0MIh58n7o/VeIMob0d6640FlK2JPQlSBC4KDMiy6Y+ukWJntzRKpeTQrqOpYvnMBK4GSyTmL+BFwBMtGyOle1k/QKg/bkeYMicuHiToQnHTMcCqW1ESH+I+lHcazZlbYU/tWQb9wTT7tvLMvXEQl4BTHBOOt9nmF/pFpAa3pithRB4O4DlXSiXuEWahRP3lRkqp0sSgZR4ZdEdFt5qbB+hYMhPo+zs1Ki3HiAMU6JoDmmhX1xxzliLSaN9mTzfHnAcQKdW3ArOWM69xzP+30t8ASYAPJxNzyNSSigZYoIeLbtTHxFpccwd1NipOXQCGouJ4OoReMukH7a081CiR52S1OOEzFBOvd26eH4UdCeBFh2MxT4RGgKWPOn0zxmPq88OHz6BhHHyGhoXG3y4PhmG2uw6FQmhQpxp7hnUG970HYyiwyZ1xcerGL+uM1PNKnYqFwPCltKP9vf8iLemvdf8Vhq4mSyzaye2zZ+K2IuFCPsMdP/mffAlH8W61KbB+eO+vTPM1qaZgSEh5t1n4fXjHRV4jbhTCLe2ndmgV2D2y9btC9MTmSymcoFo7IlTis4gWXePMs6TPkQfV9XcwusL0IX4sxqDbvQl8VMEdomTYW6O9SKPgb85rt5X6+g0RemndtalcNLNmfgG7MPHD2kYjMLTuozrcWiFzbVy8bZFKpaalvdGW0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(10067099003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sk51aDJZbk4yR1l1L0FldjVNUzFuT0VZNFpDblVlbUV3WEU1cjlzYytyUm03?=
 =?utf-8?B?cUlrbFN0WXV0eCtxWE92bWNvazVibDdEUmNkREF0NjJ5d3pzZ01hSlNzWTJE?=
 =?utf-8?B?ellRTFpURTFLSmJuNExzdWZ3amRTYm9CTFREVWlRR2VGQXNDbG83dzFMdmlo?=
 =?utf-8?B?UDdnVXREREdVYWEyYjhybVNaUGdraHJKZzRVQlYyQ0pLdDN6SlM3eW4zMUla?=
 =?utf-8?B?Z3ZiUExGTFZDVy9sVmVoZVp1Z3J6N2ZUREJDbFpmT0tJTVd0SllHamFrdEdx?=
 =?utf-8?B?TlNPaGwyQ0d6NWhrRGN4elVhOEpkVDJSYXF4dlZuUXAwSk9aYUVXVDZoVEkx?=
 =?utf-8?B?Y3k2M1hMSEE5dUhCSnRoZmNYRFhpUi9adE9kbGtuMmJMZlh5ckdaSG8vYmdS?=
 =?utf-8?B?Q1pQTzYrM1IyMk1Zb3Z6eFBHTzlreFh3ekl2NXI2VkorZDVwRTVFd2d0ZUdu?=
 =?utf-8?B?STM2YlA3MW93M0k4ZmYvOWtRUTF3dVVTNWRqUWVsZnhuNmVtajFCSWJPeE9m?=
 =?utf-8?B?SS9ua0NnTUNURUVKRTU5ZXRYM2VTYjFKWnp5cnR2bHJtdWpQbmRpcFBSUkNZ?=
 =?utf-8?B?WFRRcWVldkgrWmVCaU9xQU13MU0vZXBoMFdoNm9OYjRMWjdOWWFsUjluZHlC?=
 =?utf-8?B?R3RnS0JTN0F1dWUvMnpmTkJ5bGdORG5jZXF6QkJwOFltajQvUGJ3NldMMnp4?=
 =?utf-8?B?TDhFTVFpUVlINFdpeU05c0VVRC9SdGNxcGdET3V5M1NTSjQ1bXRFQzg0ZU9k?=
 =?utf-8?B?Q2dSNExJdzc2eHhUNDN4R0pSU1NEY2RxTlBYTUNQR2hIZTJPTStJUk9iWEZO?=
 =?utf-8?B?eWVBYTR4aDFTdVZ1NjNOSDhlWXY5S2U3U3FzNThiaHZoYlp3V3ZPNkNGbzJl?=
 =?utf-8?B?NnozT2RGUkV1bDRXbnBHSDJ4QUJDcjFsQVZheGZsa3BZZWZIKzBkNVlSRFVt?=
 =?utf-8?B?cnVXeDh1UW5TNUllajJPbHpPcmhkcEEwNzk5ZHdpK1hJWDhYVjZmSGZVZEZw?=
 =?utf-8?B?dWovNmZ4bUkyMWNibWNaY2hZbFl5VUl0WjVzWVZaeWFkYmU1OVdnS3ZsV2xK?=
 =?utf-8?B?cnE4ZlhTdUFWMzNmeDF0MWUvS2lrQ2lqOEpsZEwyYitVZzRuUGlrVGhJV1oy?=
 =?utf-8?B?MWNhd0V6dUtlenJwS3pEN1d0SzV3ZGg5ckdRQU03NHJLZ01TU0hjN3cyREt5?=
 =?utf-8?B?N0M5cGc0Wkp2ai9MdUxVSVlDRTB5a3JmMGJTRGxIbmxZT1RsYlo3dHRSM1NL?=
 =?utf-8?B?TGhzNkFoQTFGNmo2QWtlc2pkM3h4M2FSTXU2a0N5WGtvdTVXUEowN1pNZUl5?=
 =?utf-8?B?MlhPOFkyVDZMUDJJcENyMGtSZlRoV3hhcE10dmZyUFpSRXlBN0JTSnZPaE5n?=
 =?utf-8?B?dWlvUDBtQThwck5CeDFEcHFBZklvUE1OM1JiVW9IUUtjaUlyWGJiQ2VQc0sz?=
 =?utf-8?B?T3VTMERrZm15dWlYQmZjdTRKT01LVlJsaUphQUFLdkt5Q2xmYnVNNGU0TW9T?=
 =?utf-8?B?bU9BSVpNRXN6SFpkUWxZQVVCWnNPZnRtb3lBdU1FdVhJNUNvU2VDSGVSbGNU?=
 =?utf-8?B?S0cwd3BHTXZyekJ3SGk2Y25BY2lBQWFmbkxOSEdvOXNUVHc1SzNRVmNqR05p?=
 =?utf-8?B?c255KytSZjRXQkdaVVZ0OHhwMjdtUTdDRzNwR0U1THJWU2o5MGxOcVFzQmhH?=
 =?utf-8?B?aFo0VEQvbzZWeE4vWkpHaWdOb01obU1EMHoyTkY0VVlTaFRxTG12V3U2V3hR?=
 =?utf-8?B?bHd2cEFFWTUvTHpsL04zN0twMnZYTTd5T3BrWWJ1WGFJRUpUWStlQ0s0cEd3?=
 =?utf-8?B?cE16QS96QTU1Y2VGMlhoNUt3MGlFNS9tOEFEbFV5d3FmZFI4V2tQS1ZXVW1q?=
 =?utf-8?B?ckUwSXJrTFEzaFllMXFydXVSUEVETW12UEtyakFqMktjUnU1bmRMc2hXVDd6?=
 =?utf-8?B?bHVKRGwyWWNMQjB0TGZVZDFUMmlmanNKVGhZdEk5b1JUclVzY0VLMWdhS3pQ?=
 =?utf-8?B?YkgvdTB1TkxYckZlZlZ2MVAyamlDcmV4QVVKREY5a0x3RFRqLzFscW9JZERM?=
 =?utf-8?B?djg5WkhwUU9Ua1RTTGdENWRmTVpWMFNzR0hMV0FlNVRzRVNxbVFWdnJqeTdC?=
 =?utf-8?B?cmp1Z3QrdVRnVTRyamJSS3ZONVgvbFZPR0tVUUMxMkg0dm9UWjlkMnd0MEV6?=
 =?utf-8?B?RTNlUHJsNXZYSlBhSjdlWDY1TmtQR3RZQVBQTmUrSks0MDFlY2F5TEZ0MDBy?=
 =?utf-8?Q?MMTTRGyrt0QbdpNqG+m91CKOMd3uuHkBRB815B7zqA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9ea1ae-ab22-41a5-385a-08df4b5e719c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 01:41:51.4821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AVJ9M4nPEqiE+4txy7r2PAhMEuhY8Kh/SDC6v9VazoFSp7/cGS/+tskpENM2BXHk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB8103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 01:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251270

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgTWFyY28gRmVsc2NoDQo+IFNlbnQ6IGRlbiAyNCBub3ZlbWJl
ciAyMDI2IDIyOjIyDQo+IFRvOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IENjOiB5b2N0b0BwZW5ndXRyb25peC5kZTsgTWFyY28gRmVsc2NoIDxtLmZlbHNjaEBw
ZW5ndXRyb25peC5kZT4NCj4gU3ViamVjdDogW09FLWNvcmVdIFtQQVRDSCB2Ml0gY2xhc3Nlcy9j
YXJnby11cGRhdGUtcmVjaXBlLWNyYXRlczogc3VwcG9ydCBtdWx0aXBsZSBDYXJnby5sb2NrIHNl
YXJjaCBkaXJlY3Rvcmllcw0KPiANCj4gUmVjaXBlcyB1c2luZyBjYXJnbydzIC1aIGJ1aWxkLXN0
ZCBtdXN0IGFsc28gdmVuZG9yIHRoZSBzdGFuZGFyZA0KPiBsaWJyYXJ5J3MgZGVwZW5kZW5jaWVz
LiBUaGUgc3RkIHNvdXJjZXMgc3RhZ2VkIGJ5IHJ1c3QtbmF0aXZlDQo+ICguLi4vcnVzdGxpYi9z
cmMvcnVzdC9saWJyYXJ5KSBzaGlwIGEgQ2FyZ28ubG9jayBidXQgbm8gdmVuZG9yDQo+IGRpcmVj
dG9yeSwgc28gdGhvc2UgY3JhdGVzIG5lZWQgY3JhdGU6Ly8gZW50cmllcyBpbiBTUkNfVVJJIGFz
IHdlbGwuDQo+IFVudGlsIG5vdyBvbmx5IGEgc2luZ2xlIGRpcmVjdG9yeSBjb3VsZCBiZSBzY2Fu
bmVkIChDQVJHT19MT0NLX1NSQ19ESVIpLA0KPiB3aGljaCBmb3JjZWQgdGhlIHN0ZCBjcmF0ZSBs
aXN0IHRvIGJlIG1haW50YWluZWQgYnkgaGFuZCBhbmQgZ28gc3RhbGUgb24NCj4gdG9vbGNoYWlu
IHVwZ3JhZGVzLCBicmVha2luZyBkb19jb21waWxlIHdpdGg6DQo+IA0KPiAgIGVycm9yOiBmYWls
ZWQgdG8gc2VsZWN0IGEgdmVyc2lvbiBmb3IgdGhlIHJlcXVpcmVtZW50DQo+ICAgYGNmZy1pZiA9
ICJeMS4wImAgKGxvY2tlZCB0byAxLjAuNCkNCj4gDQo+IEtlZXAgdGhlIGV4aXN0aW5nIENBUkdP
X0xPQ0tfU1JDX0RJUiBhbmQgZXh0ZW5kIGl0IHRvIHN1cHBvcnQgYQ0KPiBjb21tYS1zZXBhcmF0
ZWQgbGlzdCBvZiBkaXJlY3RvcmllcywgdG8gYWxsb3c6DQoNCldoeSBjb21tYS1zZXBhcmF0ZWQ/
IEZyb20gYSBiaXRiYWtlIHBlcnNwZWN0aXZlLCB3b3JraW5nIHdpdGggd2hpdGVzcGFjZS0NCnNl
cGFyYXRlZCBsaXN0cyBpcyBwcmVmZXJyZWQgYXMgaXQsIGUuZy4sIGFsbG93cyA6cmVtb3ZlIHRv
IHdvcmsuDQoNCj4gDQo+ICAgQ0FSR09fTE9DS19TUkNfRElSID0gIiR7U30sJHtTVEFHSU5HX0xJ
QkRJUl9OQVRJVkV9L3J1c3RsaWIvc3JjL3J1c3QvbGlicmFyeSINCj4gDQo+IFRoaXMgd2F5IHRo
ZSBiZWhhdmlvciBjYW4gYmUgYmFja3BvcnRlZC4NCj4gDQo+IENyYXRlcyBmb3VuZCBpbiBtdWx0
aXBsZSBsb2NrZmlsZXMgYXJlIGxpc3RlZCBvbmx5IG9uY2UsIGluIHRoZSBzZWN0aW9uDQo+IG9m
IHRoZSBmaXJzdCBDYXJnby5sb2NrIGNvbnRhaW5pbmcgdGhlbTsgY29uZmxpY3RpbmcgY2hlY2tz
dW1zIGZvciB0aGUNCj4gc2FtZSBjcmF0ZSB2ZXJzaW9uIG5vdyBmYWlsIHRoZSB0YXNrLiBUaGUg
Y3JhdGVzLmlvIHdhcm5pbmcgbm93IG5hbWVzIHRoZQ0KPiBsb2NrZmlsZSBpdCBjYW1lIGZyb20u
IE91dHB1dCBmb3IgcmVjaXBlcyB3aXRoIGEgc2luZ2xlIGxvY2tmaWxlIGlzDQo+IHVuY2hhbmdl
ZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmNvIEZlbHNjaCA8bS5mZWxzY2hAcGVuZ3V0cm9u
aXguZGU+DQoNCi8vUGV0ZXINCg0K
