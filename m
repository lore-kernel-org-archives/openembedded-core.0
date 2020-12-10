Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.129])
 by mx.groups.io with SMTP id smtpd.web10.17872.1607623273623190966
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 10:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@microsoft.com header.s=selector2 header.b=FBOl1F+k;
 spf=pass (domain: microsoft.com, ip: 40.107.20.129, mailfrom: luca.boccassi@microsoft.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XkiPgvv/eiNDvn9M2DvG/Ec8klXOEXG1+1xI++GdQHsKDkpk9U77Z8wOnAjHPu4ViX9qUsMj+rguvwVbwaTkogoffJZM4w91VGLYqDrurKPF37wzRIyuokbjtzx5+fQ87RBgneGhNjQkd0h+evh3UgTnuF2j20RzzjM9fM3+Bne+82eaMlBM3ddaqD8vJ+uuFQkwnqI93T7yxtSCxx99LjXfHqpJ57Vwx63PgzBhnpYck1yL7P8EYFg7anhSt1GU9aDwHLVQ1kccaAfu+9mIYnwctXac8+6TFSe0G3VMQ/9IzMdyVvTn1cjO7ZULWxFmj+IQhqj1H2Pb+x/e4YJXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Q2XQHjbAXjWC9M2ZdXx4TgjalEsL1Grlpq+jyqSMz4=;
 b=NNWcQoSEL1VEfkHTafmkG8kXb5369nIkJrg4UQj8CaobShmnGXCLBLaHbMXaZ5MXDpRa/N9HrfuaGWfI8GsO5OYGr60cfwNS+mXWwyq0Y5nhqhifykFc3XVTlB5mQ4rgK9JD7xOC2q0K7Io0/8dfDAPnsGbK7OaoA074hZCJ/QiKpfCs+A3fIE1eG+qJCAt2/GOm0qI7KL82kNj4LmWw/IeACALgZpZ8eoV2yl5xGE5smeZObP6RZGB6CE4BIR1Qx7uL1EnNs7k9XDyHX7KdqQpPU1kX4n2TGbvNRXDE5StbA9P3HCo5tF1IoI4PUu4kqyzffGUvOSst6ZUEpcAGFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Q2XQHjbAXjWC9M2ZdXx4TgjalEsL1Grlpq+jyqSMz4=;
 b=FBOl1F+keqM6KCiB3PDNtWf4szCXNMgkd0c7aap4OrTnIJK9lu3Iakq66Vk6M2drO2pnJaKo2SPlmcfb9DnYzQIE9KH3NaV9466cW+vmjzD0zIovtFCsah8s+C0CnTn+tWHgCD541KUIEghPfWF34A29zN1I2TLOpiAXXtgC+s4=
Received: from (2603:10a6:206:25::31) by
 AM7PR83MB0468.EURPRD83.prod.outlook.com (2603:10a6:20b:1b6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.5; Thu, 10 Dec
 2020 18:01:11 +0000
Received: from AM5PR83MB0178.EURPRD83.prod.outlook.com
 ([fe80::90da:f9ec:91f0:285b]) by AM5PR83MB0178.EURPRD83.prod.outlook.com
 ([fe80::90da:f9ec:91f0:285b%3]) with mapi id 15.20.3676.006; Thu, 10 Dec 2020
 18:01:11 +0000
From: "Luca Boccassi" <luca.boccassi@microsoft.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] systemd: add package config for systemd-oomd
Thread-Topic: [OE-core] [PATCH 2/5] systemd: add package config for
 systemd-oomd
Thread-Index: AQHWzx5xaff8vQBqOUGBaojW/w4tYQ==
Date: Thu, 10 Dec 2020 18:01:10 +0000
Message-ID: <d31368db6ea97a56c0c0162ae5adda863b26373e.camel@microsoft.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <20201210125312.3302065-2-luca.boccassi@gmail.com>
	 <184a087d-adf6-5a7f-a615-be41030e3648@gmail.com>
In-Reply-To: <184a087d-adf6-5a7f-a615-be41030e3648@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.2 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [88.98.246.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d4aee8d6-9be0-4685-fe04-08d89d3593c8
x-ms-traffictypediagnostic: AM7PR83MB0468:
x-microsoft-antispam-prvs: 
 <AM7PR83MB046834BE9321E14749778401F1CB1@AM7PR83MB0468.EURPRD83.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:446;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MCn9K5nMCLiQzC25aSeXIjr1bB6gKfyNAH6Uyw2SBNH5imiu8bfsCWM7KlAbFAzkLpsy41G7MNKIJ65fDaUDAphm4UIbYy6jUYXhOOXuser54JEZkUweC+zhYMx36Y94ujnKWmXD1UE6iigUSTmMRfk71B1QprbfJ1giE0LYFIvk0H2rydAaWRDx8h2KOZnUb6dzfxgc8ydy5D6+r/tAhtOUyNcC3SF8dvO1NobqbRvqfvSD0h9+SqBuRLOC0qBbEm1RQxiT15bZHq6IHWkLbd6Xpynw5bAPNoBM4rAgOM8gDx9VK1Y9ujlcWP5E3R2jUc0mO8hI3iwb6CNmYNYgeP0Prph1QT84g2pbN6hm1TfAOj5dPb/qkqxWHoJqOxYqoikqTtBVANxNjwa2AsVz7A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR83MB0178.EURPRD83.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(36756003)(5660300002)(86362001)(2616005)(4001150100001)(10290500003)(316002)(186003)(66556008)(66476007)(64756008)(66446008)(110136005)(71200400001)(478600001)(26005)(82960400001)(6506007)(53546011)(66946007)(82950400001)(83380400001)(6512007)(6486002)(8676002)(8936002)(76116006)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?ZDFOTm9VV0drc0FVeFZpUU1nNlJualVvT2VSQlUvUVNoUXdoZ0ZTZzdGRDZR?=
 =?utf-8?B?enZ0NW9lcHZhUVJiZ1EzSktGOWg4bW5NbkhqSzM0VU44NEVhQUJaakMvVWQy?=
 =?utf-8?B?Yms2dEw3bTRKZkViWUVNdXQ2bzdRQVhlbnFuSEFjSnFzVkdYZjF5ZXlyOG5o?=
 =?utf-8?B?ZnRiSy9MOVJZV2kxOHVseVRYdmhFUXlkaGgrK1NONWc0U24xeUErSW9jdm5K?=
 =?utf-8?B?TU56aFMxbmtZenZ2QmlCaGd5ZnAvM0pwVy80dDk1N2RORFNQb2ZsQVZvOXhk?=
 =?utf-8?B?VzVzNloyME5NeEhsYU1UNU96SjFLVmpVMStwTE9oV1hSZGpyK2lwd2hLWE5F?=
 =?utf-8?B?MzM4dXF0a2RjVUM2Tk9mN1FKbEtEc0hwd3FtL2J4MzJHWERUb2VNTlhySHdn?=
 =?utf-8?B?OVlBVE01anBOQWM3d3FHMERlZCtpN1V1UjVkczBnT3FJckVqcnhKYThQRkRi?=
 =?utf-8?B?aVJtcU1QKyt3MzJZcDdYclQ5R3c0R1JVWHJYMmRmWDB6R29STVUyc0tNbXo1?=
 =?utf-8?B?WUlhQ2FENWExUmdKeWFSN2FpUFAvY2NEeENBb29zeEpST1NmQzY4ZHJaSEdn?=
 =?utf-8?B?bUJqZlYxYVQveHEwUUpwZWNMRGpvcDJDc0pWcUY2U1dvdVJGM1pmVVdXUDNw?=
 =?utf-8?B?cGtGeXBQTUhodmlvcWVYWEIzTUhjM2dZT0JhMDNGcXl3VEUrMDVvTUtNWUVI?=
 =?utf-8?B?LzJCM1c2cmRhVUMzaVkrb1BrcnYzM1NTY1RiakJHa29RdzFnSk55QkhROHVE?=
 =?utf-8?B?U3AvVmdyOThWUW1vaVdBYlpIZTh0YnQ3Zk84MXZLUFBZM21hRWVzdkxZdGpS?=
 =?utf-8?B?T2ZVY2VUQ0luZHNiWXlIa0lxTHZaWFNqZk12TGlUdHdkMlI0a3d2bUxSNHR4?=
 =?utf-8?B?aW1UTmVLdjhTLys1bk1XbmFPK3dQcmk3Zit3VFVRNURyRmV2RFkwZGVVWTVu?=
 =?utf-8?B?VHVlR0IvUUFIbU11WjdGZTAyZUdHMnBJVnJiREJCOGo5NTdJdThRZ1Rtdm00?=
 =?utf-8?B?TkNxWlFZSW9xZ0VQcUZYQWYzbWplR0ZQY2h5c3JRVk1Nd2F2QlFYZSt0c2Zu?=
 =?utf-8?B?NzlOdlh4ZlJQYWpPajB4MjZRcXhYblNpR3BvN3B2bGM4QnRsUzFic09wUTNO?=
 =?utf-8?B?Z1RrakUwQmZlSHRxNVZSMktzTDBJWjNFRkZmS21keVB2c3pEbXpBRElKNmdU?=
 =?utf-8?B?MUcrZ0YySHBLZEdGeHN0Z2xKS2FqV1lxVlRHMmRrSlNXVzB3dzl3akJaU3JJ?=
 =?utf-8?B?MlpybXpUQUpLeGsvblE2K2wxbmw0MW1NQndkTThweXI3RU4wVm15VFlrRHhZ?=
 =?utf-8?Q?OYOBSXJHY378dAhdYbcN8Ayd3S0Nt2MG8m?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR83MB0178.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4aee8d6-9be0-4685-fe04-08d89d3593c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 18:01:10.9476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HIDaQTb4BrAFIFvjt/TxtEeMCryvcdOtM2IZWP9zAPhPVVZLn2fvn8JemxzPrDafpn3mM1XBbTNuMLT8ZjBWYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR83MB0468
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <60A6A2555EB0F2489A5A5733BD4ED694@EURPRD83.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTEyLTEwIGF0IDA5OjA1IC0wODAwLCBLaGVtIFJhaiB3cm90ZToNCj4gDQo+
IE9uIDEyLzEwLzIwIDQ6NTMgQU0sIEx1Y2EgQm9jYXNzaSB3cm90ZToNCj4gPiBGcm9tOiBMdWNh
IEJvY2Nhc3NpIDxsdWNhLmJvY2Nhc3NpQG1pY3Jvc29mdC5jb20+DQo+ID4gDQo+ID4gRGlzYWJs
ZWQgYnkgZGVmYXVsdA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgQm9jY2Fzc2kgPGx1
Y2EuYm9jY2Fzc2lAbWljcm9zb2Z0LmNvbT4NCj4gPiAtLS0NCj4gPiAgIG1ldGEvcmVjaXBlcy1j
b3JlL3N5c3RlbWQvc3lzdGVtZF8yNDcuMS5iYiB8IDIgKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kXzI0Ny4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9z
eXN0ZW1kXzI0Ny4xLmJiDQo+ID4gaW5kZXggYmY3MzYzMDU2OS4uZjIwYzJjZmZiNyAxMDA2NDQN
Cj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWRfMjQ3LjEuYmINCj4g
PiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWRfMjQ3LjEuYmINCj4gPiBA
QCAtMTU3LDYgKzE1Nyw3IEBAIFBBQ0tBR0VDT05GSUdbbmV0d29ya2RdID0gIi1EbmV0d29ya2Q9
dHJ1ZSwtRG5ldHdvcmtkPWZhbHNlIg0KPiA+ICAgUEFDS0FHRUNPTkZJR1tuc3NdID0gIi1EbnNz
LXN5c3RlbWQ9dHJ1ZSwtRG5zcy1zeXN0ZW1kPWZhbHNlIg0KPiA+ICAgUEFDS0FHRUNPTkZJR1tu
c3MtbXltYWNoaW5lc10gPSAiLURuc3MtbXltYWNoaW5lcz10cnVlLC1EbnNzLW15bWFjaGluZXM9
ZmFsc2UiDQo+ID4gICBQQUNLQUdFQ09ORklHW25zcy1yZXNvbHZlXSA9ICItRG5zcy1yZXNvbHZl
PXRydWUsLURuc3MtcmVzb2x2ZT1mYWxzZSINCj4gPiArUEFDS0FHRUNPTkZJR1tvb21kXSA9ICIt
RG9vbWQ9dHJ1ZSwtRG9vbWQ9ZmFsc2UiDQo+IA0KPiBJIHdvbmRlciBpZiBpdCBzaG91bGQgYmUg
cGFja2FnZWQgaW50byBpdHMgb3duIHBhY2thZ2UgYW5kIGJ1aWx0IGFsd2F5cyANCj4gc28gc29t
ZW9uZSBpbnRlcmVzdGVkIGNhbiBqdXN0IGFkZCBpdCB0aGVpciBpbWFnZXMgaW5zdGVhZCBvZiBt
b2RpZnlpbmcgDQo+IHBhY2thZ2Vjb25maWcgaWYgaXRzIGFuIGluZGVwZW5kZW50IGZlYXR1cmUu
DQoNCkkgZG9uJ3QgbWluZCBlaXRoZXIgd2F5LiBXb3VsZCB5b3UgbGlrZSBtZSB0byBkbyB0aGF0
IGNoYW5nZT8NCg0KLS0gDQpLaW5kIHJlZ2FyZHMsDQpMdWNhIEJvY2Nhc3NpDQo=
