Received: from EUR03-DB5-obe.outbound.protection.outlook.com (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.111])
 by mx.groups.io with SMTP id smtpd.web09.4372.1607679143988128695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Dec 2020 01:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=KVM+96Bq;
 spf=pass (domain: microsoft.com, ip: 40.107.4.111, mailfrom: luca.boccassi@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mf2l006m34r5CkyoYp+wFJNNv2sKGBJtsuQo7cXeD5n1myV9P/iWFWVb13UQpKaEv1/RyDvjPn1F9rxZnr41f5QPC/n+ekep/liRvJ/93sWJW1SNt0NlOChiMnzqYz5MjSftjMEYdT0rY/Kg7cVebOTsQV9OmQWesXl8yk0aymxHS2BxMPaFNXZpb7pCdMutfl5lsjaDNQrI9nGt1NH2XXxjPqIrPdCzpOL90ejFgl0OPM78EOx7fXT4yP1zFcnt+oUHMx55tFCbsZ6U5K4kIFwS+w7iL75WQ6NeC1Rcn0XlpcwfvrX4oZ72woSkqYXkSL3aluvciMRwyCpRHVGc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbYk5eChtgxb75Hu6mhUoEsn7+7TKIfGkCYnX0kNXkE=;
 b=Iw7PpNnxlwDkzPdalv0u9XqxNFhrjNCSBClxxafApU0mzNQwJuo8eyav58N5t0db6MJxU1n86WdptfYi1RQkUNrhuyZfSR++fGGK3EZXPAHZMZ4NooeauaC7usnFxxpjkhG7+DLYYmJM7cvmySONUpLzbxEgogxig8kklMbOVH58QPKIULxaAiyQEfUfQDZKWg3w5yWWZ5rO/JAbUpxLd8CUDXOslhSQwpQ4yiiY/IpoNYHZXIsfnnrVrhAeHf9zrWlMHNxW+mEisDjrY5FJr2vKQ4LCJxP4B3pq/1iWrB+hCvvRIinzPwqkjdoU7O01L+I/R4Qn4FNeHpHrVtO41Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbYk5eChtgxb75Hu6mhUoEsn7+7TKIfGkCYnX0kNXkE=;
 b=KVM+96Bq6RiO6rukyf99JSK5su2c3irEFpCi7E4AIhkQbCN5waIMWjZ9Wi+e9H7OOcu3giB122T1+FFajJRZRi1KtNuXJ8vBOblHmzA5NxBdaDPuDWFwQboJ8LQGxsTyoWhJH+pCbFhBKEtGKxc2oOmwWVDFd175iEXBsrdhR5g=
Received: from (2603:10a6:206:25::31) by
 AM7PR83MB0449.EURPRD83.prod.outlook.com (2603:10a6:20b:1b5::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.5; Fri, 11 Dec 2020 09:32:21 +0000
Received: from AM5PR83MB0178.EURPRD83.prod.outlook.com
 ([fe80::90da:f9ec:91f0:285b]) by AM5PR83MB0178.EURPRD83.prod.outlook.com
 ([fe80::90da:f9ec:91f0:285b%3]) with mapi id 15.20.3676.006; Fri, 11 Dec 2020
 09:32:21 +0000
From: "Luca Boccassi" <luca.boccassi@microsoft.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/5] systemd: update 246 -> 247
Thread-Topic: [OE-core] [PATCH 1/5] systemd: update 246 -> 247
Thread-Index: AQHWzx8ZtS4geH7rYUiROqxtGwVsAKnwy0gAgADXhoA=
Date: Fri, 11 Dec 2020 09:32:21 +0000
Message-ID: <122e93194688da60d85431ddf66491dfa914878b.camel@microsoft.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <4b5b304d-9cff-4a61-16b9-6dd8fba58626@gmail.com>
	 <22ce46324e27aacc8cddee2c3f716adae091fbfb.camel@microsoft.com>
	 <CAMKF1sq05u5zXapFPL15RH7rk4JiDEw90-2oSg2cKqLTmtyrUQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq05u5zXapFPL15RH7rk4JiDEw90-2oSg2cKqLTmtyrUQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.2 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [88.98.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 05c113d3-29c3-42d5-18a9-08d89db7a960
x-ms-traffictypediagnostic: AM7PR83MB0449:
x-microsoft-antispam-prvs: 
 <AM7PR83MB04497EE55AED4A16B426EFCFF1CA1@AM7PR83MB0449.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 k2ODO5czcyWBED6BJmK8lrtTs5cYdm9NXvNSbpwyb2nZuWKRQi4CrbXaDc78yGVLoXM+6STeZzcZmd+Ln52uvS7YG1KnGo3XeBiQdPsTs1TRWFU9LcxbX4YlJoXWSmkscNGyf6uoAlTfUE4kZSB+GpsKPqdCMKqoHQr11ntLqnE/XUvQLVC6NmlEVKoVnovBcKNapSl81L8CugZE5ohJGgYdQFRv1GlM9xEs/TS92kM+AT0ww0rM95syaZ3qPg1PTpkZGf6OTmkadJS946Nm9Ex4dw1wh7aSjKTztq/TFXA2k1wZpOlaTHGGSlnRG7hgFDn7JEAVp4QIlVM234EM6SAWRmIWYf3JfXGN1J4tORE7X2s23srx6DzFBF9UFrXhwcKzbs0bOBL6lcn5/avQkg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR83MB0178.EURPRD83.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(316002)(86362001)(2906002)(66946007)(83380400001)(8936002)(82960400001)(71200400001)(478600001)(2616005)(6916009)(76116006)(15650500001)(186003)(5660300002)(8676002)(6506007)(6486002)(82950400001)(26005)(36756003)(66446008)(66476007)(53546011)(64756008)(66556008)(10290500003)(6512007)(4326008)(4001150100001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?OEc0NDRNQU9EaUJsMVg0aDJ4cSszb2pyYVFyZHg0VGJDaVZRN3RMUkF1RzRl?=
 =?utf-8?B?THRsRmVzYy96ZlpvaUdaUEUvOTVUbjJ5RzhXVmlYckM1NkFYaTlzQ0NyaXFq?=
 =?utf-8?B?amg1RWlQZ1lyYjRGTWZWSkZtSlU5WUN3VGUwTXRHUFlDV1F5d1VEYzlqT2dk?=
 =?utf-8?B?UWJ5d0x0cUlFRlk1ZE5lTWdCMjdqbTYwaENvZ3BjUm94NzdKZWhmUXVvcjhr?=
 =?utf-8?B?MWdNN2FxaE00Y3laMW1oSGl6UngycDZrL1NZUi9OcVEvSUNSSG9vakt2N2F6?=
 =?utf-8?B?SDh5RVU1MDBpNUt0OUQ2cTFhWkRrSEgzOW1aQktwVkNiNFVrdTdDc2dsWmdh?=
 =?utf-8?B?MUhMcmwySEdSRlNyNnhNV2ptbUVPT2NiamJWcmVHY1d5NjNxMVlJVmpGRUdU?=
 =?utf-8?B?a0dZYWt5d1haaDZzMlJEVU11QWlXcWJhbllLa0pwY2hBM3pYL0hPNVoyR2Ra?=
 =?utf-8?B?QUFCTnpFRittRTlkZEM1d3JIU0Z1MDRjUjJFT080Z2FDbTdRMnF6NlNCVUlB?=
 =?utf-8?B?WjBtaFNuVWZDU3FLMWJkdlJqdW5kWHNDbXB2UlY3U2dZdE13bk1BQVgxNnU3?=
 =?utf-8?B?YWdXSnlrV25EeUpCR3I2SEcrb2ZDZGphUHZucDlWWmRIcSswYVpwSy9IKzVx?=
 =?utf-8?B?cGxVdjJxSDlkdjlLcXRBZDFOTWw1NlVVNHlwQU5NNVNoVnA2c2UrNnExejJw?=
 =?utf-8?B?QWNjS2xUZmJEY1g0RjhRQ0ZJWUNOZk1MN3hVTnRNMVJ4WVN0UXhaa0ZOblFI?=
 =?utf-8?B?NlRmdkxkcG1sbHlhYWRRMENSbE03N0RqM1FJSmsrT2ZQeUtNT2Z3SWxITi9R?=
 =?utf-8?B?LzU0bHhGeDlKVExXeTNLeTlEV3k1TytCdmpnOEZzTTZrZXBVUkZJWnpzQnpo?=
 =?utf-8?B?cG4vWkFmRFg4VzdIelhUMTZRbHRIYlNQaFlCOXRlTXlJOUhxbk12Z1RlRXBw?=
 =?utf-8?B?RnlDQXlteVNtME5uaXQrRlZOeVFwWmgzaGI2ZktQNUFmU2ZWV0ZxcGQvWk9F?=
 =?utf-8?B?eDFxQ1h3OHBHeDE1ZnNQVjdFNS9UbVFXQWx1N1J3UDc5bDhuMmxpaWxoUlJS?=
 =?utf-8?B?WHNlMmlheTNHbllhREpSbzczUnB2K1lwakhkWWd1VlRXc3pYejdRdWRESVZj?=
 =?utf-8?B?UkJNNEduUEJPSEhLYnVRc0xVU1F2MEtMSXJyZjluY2NJa2xjMENvRGhhRWkr?=
 =?utf-8?B?eVZzSkhsMytXVTVGZlBkK3RiSWZQWjdNUUYyeDVtWVYrTXFCc1A3Mm9BS0Jw?=
 =?utf-8?B?N1hSNHFiR1kvZmdCem9XcWdyQm9lOHh5bmIwMFJoa0ZQL1dnajZTSW5vSXhG?=
 =?utf-8?Q?8Rl7JCWnOQ9D72CJmYrUFIizP1CMkHdfau?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR83MB0178.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c113d3-29c3-42d5-18a9-08d89db7a960
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 09:32:21.7599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KeA1Y4hepeO4yoQUZqIC2aP5XW51moAqBUj1M11RBicLprKw8ho7hzJ+ONfVPuHUYIPuJdJUHngCFzqOLXn+sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR83MB0449
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DAB4CB4C02C294E837EF097B728CB44@EURPRD83.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTEyLTEwIGF0IDEyOjQwIC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
VGh1LCBEZWMgMTAsIDIwMjAgYXQgMTA6MDUgQU0gTHVjYSBCb2NjYXNzaQ0KPiA8THVjYS5Cb2Nj
YXNzaUBtaWNyb3NvZnQuY29tPiB3cm90ZToNCj4gPiBPbiBUaHUsIDIwMjAtMTItMTAgYXQgMDk6
MDggLTA4MDAsIEtoZW0gUmFqIHdyb3RlOg0KPiA+ID4gT24gMTIvMTAvMjAgNDo1MyBBTSwgTHVj
YSBCb2Nhc3NpIHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBMdWNhIEJvY2Nhc3NpIDxsdWNhLmJvY2Nh
c3NpQG1pY3Jvc29mdC5jb20+DQo+ID4gPiA+IA0KPiA+ID4gPiBVcGRhdGUgc3lzdGVtZCB0byB2
MjQ3LjEuDQo+ID4gPiA+IEFkZCBydWxlIGZvciBuZXcgb29tZCBkYnVzIGNvbmYgYW5kIGZvciBu
ZXcgcGFtLmQNCj4gPiA+ID4gY29uZiBkaXJlY3RvcnkgaW4gL3Vzci9saWIuDQo+ID4gPiA+IERy
b3Agc2VsaW51eC1ob29rLWhhbmRsaW5nLXRvLWVudW1lcmF0ZS1uZXh0aG9wLnBhdGNoLA0KPiA+
ID4gPiBtZXJnZWQgdXBzdHJlYW0uDQo+ID4gPiA+IEJhY2twb3J0IDAwMDEtbWVzb24tc2V0LWN4
eC12YXJpYWJsZS1iZWZvcmUtdXNpbmctaXQucGF0Y2gNCj4gPiA+ID4gZnJvbSB2MjQ3LXN0YWJs
ZSB0byBmaXggYnVpbGRzIHdpdGhvdXQgQysrLg0KPiA+ID4gPiBSZWZyZXNoIG11c2wgcGF0Y2hl
cy4NCj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IHBlcmhhcHMgd2UgbmVlZCB0byB1cGRhdGUgc3lz
dGVtZC1jb25mIGFuZCBzeXN0ZW1kLWJvb3QgcmVjaXBlcyBhcyB3ZWxsIGhlcmUNCj4gPiANCj4g
PiBzeXN0ZW1kLWJvb3QgaXMgdXBkYXRlZCB0byB1c2UgdGhlIG5ldyBtZXNvbiBwYXRjaC4gc3lz
dGVtZC1jb25mIGRpZG4ndA0KPiA+IG5lZWQgaXQsIGF0IGxlYXN0IGZvciBtZT8gRG9lcyBpdCBm
YWlsIHRvIGJ1aWxkIGZvciB5b3U/DQo+IA0KPiBubyB0aGV5IGRvbnQgYnV0IEkgdGhvdWdodCB0
aGV5IHNob3VsZCBiZSByZWZsZWN0aW5nIHN5c3RlbWQgdmVyc2lvbiBJDQo+IHdvdWxkIHRoaW5r
DQoNClNvcnJ5LCBJIGRvbid0IGZvbGxvdyAtIHRoZSBwYXRjaCBkb2VzIHJlbmFtZSBzeXN0ZW1k
LWJvb3QgYW5kDQpzeXN0ZW1kLWNvbmZpZyBmcm9tIF8yNDYueC5iYiB0byBfMjQ3LjEuYmIgdG9n
ZXRoZXIgd2l0aCB0aGUgbWFpbg0KcmVjaXBlLiBXaGF0IGlzIG1pc3Npbmc/DQoNCi0tIA0KS2lu
ZCByZWdhcmRzLA0KTHVjYSBCb2NjYXNzaQ0K
