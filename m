Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.82])
 by mx.groups.io with SMTP id smtpd.web10.36069.1629788195248308973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 23:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=ONSXY8Yl;
 spf=pass (domain: siemens.com, ip: 40.107.1.82, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCXr36rvOVSnye7YCcBWQJlRZs3pndsxF6UTyE+bE3TDFUM3FC2H/VzT92LsbYZFt9IEsAKrqL4jwpKrJQS3FEB6OxFnuckVpm42iyQRHKlbaawT64p+c6JOBaEqdHrN7a4ccBdSbUyjOsgjd3QRwjp5mxusnWN/IQDQ+dH2P0jUC9f16meg57Sd9yENFyAifE2cKuHaNQpjtuXD9sGn41DdsjY8K2sFexHcG7WG8yHmeQKhQ7mIbKuM/NNVqejdVdXaV7mb3KS0MpSbfNKBlO6Yp13Mk95uvD92mIuNvJ4B9Xn2Dhz2AHYaZCf21eWjMY3LQ27PKyU7vZeoYcNMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8/hiMUEHQgIJbyh7KagCASHUd+sm6fouIWgBjk3fnw=;
 b=N9HrFlFY6iHFxj0/Jc6hNu9luNuYHBeH9QL9nifeiUnpB8F7f8HuwzFH8mJ4fHhWnBoiatTec4bdjsGwJRbb2+MuASxXDTqKlPS1KTiQjE2lz85rQQfsItA4iXqNBJIcj6BYXm2yQL5t86hh3XSTgTv8vj2h2dwNNthn/IMNMuSB+Vf2D7uIlyF06cIRSKC25CgDPDktHk2IebUJaUZRaiTog65FUgpa4B4VldvEj+w3gw9RAUImjzIErVTJFIPK7YDW+stYbwNdp3BFPrWIPDzwI3nnMNMty9kO9Gq+Rt2gsChFvKZT1QTL5CsQklaM+HvxwsbZN5yeEkqnhLhTSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8/hiMUEHQgIJbyh7KagCASHUd+sm6fouIWgBjk3fnw=;
 b=ONSXY8Yl3LiVD5YkTht/k2tU6ET6tPW89tAGn9IesRyqXowIb/1mDdXakdx/qSlgJHERgCXdUUkn3N1yPjQOrsdToQJm3l4wlenMoooKD8JjYipl29KqDUJe58Fagno8g7KpL7lLkLhv8/dtXFO/ZEKWTCaOp6HF1OaEfHTaapo=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB9PR10MB4894.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:2cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 06:56:32 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a95f:bc47:e21e:adac%9]) with mapi id 15.20.4436.022; Tue, 24 Aug 2021
 06:56:32 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Andre McCurdy <armccurdy@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] vim: add option to disable NLS support
Thread-Topic: [OE-core][PATCH] vim: add option to disable NLS support
Thread-Index: AQHXmDmyq6OWCTGY0EC5q1c7gKrRnKuBUePwgABWRoCAAI+9kA==
Date: Tue, 24 Aug 2021 06:56:32 +0000
Message-ID: 
 <DB8PR10MB3977DC6B069FA94E5EB4399992C59@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20210823101205.29267-1-andrej.valek@siemens.com>
 <ce3005b3-6213-9528-2c82-c4f612f3b549@gmail.com>
 <DB8PR10MB3977E6C2E704FF73707CA62492C49@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
 <CAJ86T=V2zSGf3ebYWFh-2-QZ1w55Xsz+6nbkcR9jayh9ANyraQ@mail.gmail.com>
In-Reply-To: 
 <CAJ86T=V2zSGf3ebYWFh-2-QZ1w55Xsz+6nbkcR9jayh9ANyraQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-08-24T06:56:30Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=6aab7010-2a11-47a1-b5f8-09b2ce62bec6;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e21cb96c-b73b-4b5d-313b-08d966cc4e5b
x-ms-traffictypediagnostic: DB9PR10MB4894:
x-microsoft-antispam-prvs: 
 <DB9PR10MB4894AF1F20EFFEFAF55B5C7C92C59@DB9PR10MB4894.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:363;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /BA5nA5C0hPWEApFxGA2QPRvYMtGqSH3TB1Zj7LvMsk+jOtl0JQ2+pEfk9DaElQPO3CBaPWalKeWk1VHnaRtq2U7uSGm7jH+yoeehg8k5TkMXD7QGL6VY7CRE4gt250hysQ+01JC7n/y01PpD+Lr6vmseRNRxWLgPci/ThC0luozAw/UZZhNGWMEXl/L7zobyMfKrxy07vu3yoMFKNgMdBFQ7Hv11l4SmJ3GAu4m9YVM+MJicH0eRrAcVqEMBkVfzKpjELlcBTEBO1lUPBI0GLH5MEJ9JhbmmZIs1lpYFLEq0Usonbn1jaIkOc1t0Enoq+mOGy2eXL6BsnbEuJ73Ekxpwk++mjAHjDO8ehQmqaUjc+c2pSq15LV/Y7QsS6+Np9kEIBCV3uB4oEYuF0p6O+7woBHYtckWyJplwImaM1enJOp+fpN+1Wz1XvNTILTKJD+aaZzDfUyuGxn8j+pRPXGHE1QB9nIltNqVPniTbT7yRofy7XWpkQHk++bRH6oZ8lTyYtAJiH3Sc7d9wxyCSNoq9WIj+y7rUWqklEeNxwlNta5CEcw2/LJ+VL8xGJ89PRdjZClOtJrQA1xSmP6VA2B/5o0EseysevTBtZMtUDxijrOiumUZOJfqybGPS3Hu3v/SUxhFNCwo7TqKsYpRMQjuXH28FnaNzAV+IfqkpOgyAXsScULXlOqLOYu5zJISl16RqkUhR6j0phvLs6ZbF56v/2hmIyoB2ilZcgQbUsGN/4q1KTyY2qAzjuA4GdRVSXg8bRxE0Rd1EmXFcQfOHWu+mS8XGXRU7tIk8GL+iFc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(33656002)(2906002)(4326008)(186003)(38070700005)(64756008)(76116006)(86362001)(66446008)(66556008)(478600001)(316002)(9686003)(38100700002)(71200400001)(122000001)(7696005)(83380400001)(54906003)(26005)(52536014)(66476007)(8676002)(6916009)(8936002)(966005)(55016002)(66946007)(45080400002)(53546011)(6506007)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UkVWOWNrY3c4a3Z3SzZ6MUVuVjdZTC9USktpanJ0dSsxWnZpZVFVOEtvT0ps?=
 =?utf-8?B?amRuY0pFVk95T3BNb3BiSEVoOEZvWlAySlYvbDI3TzU1QmNQRHdhQWxVZ3Rx?=
 =?utf-8?B?U0lLVkk4OWZWMGRGSkhiMEhkRm01eGlVWmoxeFlMZUwwVlY3dloxcGVBWTM4?=
 =?utf-8?B?RDZBVnZUMkE1WXpkWU40VXBWNm5EYUNkY1FVdERveTl6ak0rM3N0K2pJN2Ur?=
 =?utf-8?B?Q1VQM1lyRlZrS3htVXAyTkx5dW9qVEk3cFZqRnRNSTNlcTVDd3R3eDZSYk9W?=
 =?utf-8?B?dGlkeGhuOWtrSmJ5d2ppMmtqRDc3VGZDSXJqOFY4UjAwRElXVzZyV0dsbXI1?=
 =?utf-8?B?bEJ4bllMdnRuenc0enNIb0tVdDB6SE42cVExR04weFNSMmRYZ2ZkZGtLeTVF?=
 =?utf-8?B?Zk4rOUxWYzZyT0E2VmEwbTFEK3ppOFkzcTY1c2JBUGRsQXVKMkhvVExodlNE?=
 =?utf-8?B?S2tQOTRzc0tqQUZWWW5aWGhJWmQyKzYyMmxpRzdWQTFQZ0F0ZUdRQk4vYU54?=
 =?utf-8?B?QlEyZjRSa1lDUGxFWHVzNU1ZbW1sb01DY2YyR2xOZjd2ZCt2WE9PeXFzeklX?=
 =?utf-8?B?MXNBbWMzSTBvWUx2NWxOeWtMQlVKQjcyOUc0ekExV0hpay9sdTVRbzI2TmEy?=
 =?utf-8?B?dW5ObkF2bE4wZVBlK3Y1aFNlY05ybVY1TlBJb2E3dCs1MktOTmxyaEF2aW1i?=
 =?utf-8?B?djkxbmswcDVrdVo4aXlzVUl1UFYxSHdHa3NtNzdNRFF0RU4xd2ZXbXpxc0Zv?=
 =?utf-8?B?ZEJTRTZjWkNuQXFKNzBtdmlMcjhxRjZNQ0d6MGhrNGwxNUxIQ1JqYWdLK25q?=
 =?utf-8?B?bXpRT0FaamZTTFVmOEQrZmhyVWpCcWtsSXlhd1M0Z3RyQm8vbVVWQ3AxY2Rn?=
 =?utf-8?B?UjhLTWhyeWo4Umo5dllMSHBIQTJscDZuSjlRNGtCMnd5dk4vNjJvVmszSFFa?=
 =?utf-8?B?dGgyUXBFL3EzQzRmU3dNZ05id1I3MXZ5OWpIZzYrekhranE4WkNpM3p1cVEz?=
 =?utf-8?B?dWQ2Y1g3WWRYbVczZ0wrbUNiSzZQMUVZUlY2ampyMjNHVjJ6QXJHVFhmcUIv?=
 =?utf-8?B?cW16TXo3OFhJdmFyTHlFWmE4RE1RdDc5NHVMSGJMTGRGU3RodTRyd0tzaTRq?=
 =?utf-8?B?SERqdTdOazZQdDB0bTY1bFI3OW0yKzNpODRZNUlsam5weTNuc0xiNWpsRmxH?=
 =?utf-8?B?WVl1N0s1YkZMb3g4dFNGVTFIdGx3cmRkd1F1UFgvN0dtNXB3ZVhleGdOZGpu?=
 =?utf-8?B?TlRZRmxwbWxOWm1qMUF6VnpERStDaDhmTmdZOS9VM0JPL2oxNkcvMGRvUzUy?=
 =?utf-8?B?MC9RRmdGVnBNUzFma21wRldrc1pJVTV3ZWViTWg5VmhScWo1V2kzRkFRZnZV?=
 =?utf-8?B?R1RNR1lrcFIzQUNMQmNlV0VyKy8zL2lQMklkNkUyM01OZ0RVWjhQS0E5c0NU?=
 =?utf-8?B?amJPRy9qMW41RUNhN1J2eWRCcTRMaVBHTkVLamlxQ2NDTzI2OE9KanBlcnd1?=
 =?utf-8?B?aWRncGxSWElwNEhwMG9DU0dySWc5LzRUTVhuRUFKK25GalA1Q0FWSDY2MXMx?=
 =?utf-8?B?b293YXdxZ2xWc2thNjFFWVQ3bHNYOXJXc1N6cjRTN1RMMFlySDY0UWd1ME9x?=
 =?utf-8?B?TWNKeVQzeG4ySWthZGd6WkhMREVCZ1lrZlNJV01malFrMDlNQWdJR2p1Mm9Z?=
 =?utf-8?B?ZU1OczBVVW5OZWIrWTNWN1FmNEs4N3hia3E0a3NtQXRRZHdtb1J1WkJLY2lz?=
 =?utf-8?Q?2j2jR57uIulNiELff14GtNbfxUDY3Eat1vMhRRK?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e21cb96c-b73b-4b5d-313b-08d966cc4e5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2021 06:56:32.2202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KoVkNiX0LjEN6lseM3/6XXXMNI9Nwc6tYES8XlF8kssLLR78joO3IqaBYURY9p3mEK9cEMqSlEhB3CxoMKJbR//+UssskId0wLcZvL+WyvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4894
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgYWxsLA0KDQpPZiBjb3Vyc2UsIHRoYXQgSSB0cmllZCBpdCBhbmQgaXQgd29ya3MuDQouLi4N
CmNvbmZpZ3VyZS5hYzo0NTE3OiBZb3Ugc2hvdWxkIHJ1biBhdXRvdXBkYXRlLg0KTk9URTogUnVu
bmluZyAuL2NvbmZpZ3VyZSAgLS1idWlsZD14ODZfNjQtbGludXggLS1ob3N0PXg4Nl82NC1wb2t5
LWxpbnV4IC4uLiAtLWRpc2FibGUtc3RhdGljICBlbmFibGVfYWNsPXllcyAtLWVuYWJsZS1ndWk9
Z3RrMyBlbmFibGVfbmxzPXllcyAtLWRpc2FibGUtc2VsaW51eCAtLXdpdGgtZmVhdHVyZXM9Ymln
IC0td2l0aC14IA0KY29uZmlndXJlOiBXQVJOSU5HOiB1bnJlY29nbml6ZWQgb3B0aW9uczogLS1k
aXNhYmxlLXNpbGVudC1ydWxlcywgLS1kaXNhYmxlLWRlcGVuZGVuY3ktdHJhY2tpbmcsIC0td2l0
aC1saWJ0b29sLXN5c3Jvb3QsIC0tZGlzYWJsZS1zdGF0aWMNCmNvbmZpZ3VyZTogbG9hZGluZyBz
aXRlIHNjcmlwdCAvaG9tZS9wcm9qZWN0cy95b2N0by9xZW11eDg2LTY0L2xheWVycy9idWlsZC9t
ZXRhL3NpdGUvZW5kaWFuLWxpdHRsZQ0KY29uZmlndXJlOiBsb2FkaW5nIHNpdGUgc2NyaXB0IC9o
b21lL3Byb2plY3RzL3lvY3RvL3FlbXV4ODYtNjQvbGF5ZXJzL2J1aWxkL21ldGEvc2l0ZS9jb21t
b24tbGludXgNCi4uLg0KY2hlY2tpbmcgaG93IHRvIHJ1biBtYW4gd2l0aCBhIHNlY3Rpb24gbnIu
Li4gbWFuDQpjaGVja2luZyAtLWRpc2FibGUtbmxzIGFyZ3VtZW50Li4uIG5vDQpjaGVja2luZyBm
b3IgbXNnZm10Li4uIG1zZ2ZtdA0KY2hlY2tpbmcgZm9yIE5MUy4uLiBnZXR0ZXh0KCkgd29ya3MN
CmNoZWNraW5nIGZvciBiaW5kX3RleHRkb21haW5fY29kZXNldC4uLiB5ZXMNCi4uLg0KDQpTbyBk
b2VzIGl0IG1lYW4sIHRoYXQgSSBzaG91bGQgdXNlIHRoZSAtLWVuYWJsZSBpbnN0ZWFkIGFueXdh
eT8NCg0KQW5kcmVqDQoNCj4gT24gTW9uLCBBdWcgMjMsIDIwMjEgYXQgMTA6MTIgQU0gQW5kcmVq
IFZhbGVrIDxhbmRyZWoudmFsZWtAc2llbWVucy5jb20+IHdyb3RlOg0KPj4NCj4+IEhlbGxvIEto
ZW0sDQo+Pg0KPj4gSSBsb29rZWQgZXhhY3RseSBpbnRvIGNvbmZpZ3VyZS5hYyB3aGljaCBhcmd1
bWVudHMgYXJlIGV4cGVjdGluZyBmb3IgdGhvc2Ugb3B0aW9ucy4gU28gSSB0aGluaywgaXQgaGFz
IHRvIGJlIG1lbnRpb25lZCBleHBsaWNpdGx5Lg0KPg0KPiBBc3N1bWluZyBjb25maWd1cmUuYWMg
aXMgYmFzZWQgYXJvdW5kIEFDX0FSR19FTkFCTEUgLyBBQ19BUkdfV0lUSCB0aGVuIGFuIGV4cGxp
Y2l0IG9wdGlvbiBpcyBub3QgcmVxdWlyZWQuIEEgZGVmYXVsdCB2YWx1ZSBvZiAieWVzIiB3aWxs
IGJlIHNldCBmb3IgLS1lbmFibGUtZm9vIC8gLS13aXRoLWZvbyBhbmQgYSBkZWZhdWx0IHZhbHVl
IG9mICJubyIgd2lsbCBiZSBzZXQgZm9yIC0tZGlzYWJsZS1mb28gLyAtLXdpdGhvdXQtZm9vLg0K
Pg0KPiBIb3dldmVyLCBhcGFydCBmcm9tIHRoYXQsIHlvdSd2ZSBhbHNvIGRyb3BwZWQgdGhlIGxl
YXZpbmcgIi0tIiBmcm9tIHZhcmlvdXMgLS1lbmFibGUtZm9vIG9wdGlvbnMgYW5kIGNvbnZlcnRl
ZCBkYXNoZXMgdG8gdW5kZXJzY29yZXMsIGFsbCBvZiB3aGljaCBsb29rcyB3cm9uZy4gSG93IHdl
cmUgdGhlIGNoYW5nZXMgdGVzdGVkPw0KPg0KPj4gUmVnYXJkcywNCj4+IEFuZHJlag0KPj4NCj4+
ID4gT24gOC8yMy8yMSAzOjEyIEFNLCBBbmRyZWogVmFsZWsgd3JvdGU6DQo+PiA+PiAtIFNvbWUg
ZGlzdHJpYnV0aW9ucyB3aXRoIFVURi04IGxvY2FsZSBoYXZlIHByb2JsZW0gd2hlbiBOYXRpb25h
bCBMYW5ndWFnZQ0KPj4gPj4gICBTdXBwb3J0IGlzIGVuYWJsZWQuIEFkZCB0aGVyZSBhbiBvcHRp
b24gdG8gZGlzYWJsZSBpdC4NCj4+ID4+IC0gcmVmcmVzaCBvcHRpb25zIGJhc2VkIG9uIGNvbmZp
Z3VyZS5hYw0KPj4gPj4NCj4+ID4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlaiBWYWxlayA8YW5kcmVq
LnZhbGVrQHNpZW1lbnMuY29tPg0KPj4gPj4gLS0tDQo+PiA+PiAgIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L3ZpbS92aW0uaW5jIHwgOCArKysrKy0tLQ0KPj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4gPj4NCj4+ID4+IGRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltLmluYw0KPj4gPj4gYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC92aW0vdmltLmluYw0KPj4gPj4gaW5kZXggMTdkMWMyNGE3Yy4uN2NjNDc4ODRmMiAxMDA2
NDQNCj4+ID4+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0uaW5jDQo+PiA+PiAr
KysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltLmluYw0KPj4gPj4gQEAgLTU0LDE5ICs1
NCwyMSBAQCBkb19jb21waWxlKCkgew0KPj4gPj4gICAgICAgYXV0b3Rvb2xzX2RvX2NvbXBpbGUN
Cj4+ID4+ICAgfQ0KPj4gPj4NCj4+ID4+IC0jQXZhaWxhYmxlIFBBQ0tBR0VDT05GSUcgb3B0aW9u
cyBhcmUgZ3RrZ3VpLCBhY2wsIHgxMSwgdGlueQ0KPj4gPj4gKyNBdmFpbGFibGUgUEFDS0FHRUNP
TkZJRyBvcHRpb25zIGFyZSBndGtndWksIGFjbCwgeDExLCB0aW55LCANCj4+ID4+ICtzZWxpbnV4
LCBlbGZ1dGlscywgbmxzDQo+PiA+PiAgIFBBQ0tBR0VDT05GSUcgPz89ICIiDQo+PiA+PiAgIFBB
Q0tBR0VDT05GSUcgKz0gIiBcDQo+PiA+PiAgICAgICAke0BiYi51dGlscy5maWx0ZXIoJ0RJU1RS
T19GRUFUVVJFUycsICdhY2wgc2VsaW51eCcsIGQpfSBcDQo+PiA+PiAgICAgICAke0BiYi51dGls
cy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3gxMScsICd4MTEgZ3RrZ3VpJywgDQo+PiA+
PiAnJywgZCl9IFwNCj4+ID4+ICsgICAgbmxzIFwNCj4+ID4+ICAgIg0KPj4gPj4NCj4+ID4+ICAg
UEFDS0FHRUNPTkZJR1tndGtndWldID0gIi0tZW5hYmxlLWd1aT1ndGszLC0tZW5hYmxlLWd1aT1u
byxndGsrMyINCj4+ID4+IC1QQUNLQUdFQ09ORklHW2FjbF0gPSAiLS1lbmFibGUtYWNsLC0tZGlz
YWJsZS1hY2wsYWNsLCINCj4+ID4+ICtQQUNLQUdFQ09ORklHW2FjbF0gPSAiZW5hYmxlX2FjbD0i
eWVzIiwtLWRpc2FibGUtYWNsLGFjbCwiDQo+PiA+DQo+PiA+aXMgJ3llcycgbmVlZGVkIHRvIGJl
IGV4cGxpY2l0ID8gSSB0aG91Z2h0IC0tZW5hYmxlLVhZWiBtZWFudCBpdCANCj4+ID5pbXBsaWNp
dGx5DQo+PiA+DQo+PiA+PiAgIFBBQ0tBR0VDT05GSUdbeDExXSA9ICItLXdpdGgteCwtLXdpdGhv
dXQteCx4dCwiDQo+PiA+PiAgIFBBQ0tBR0VDT05GSUdbdGlueV0gPSAiLS13aXRoLWZlYXR1cmVz
PXRpbnksLS13aXRoLWZlYXR1cmVzPWJpZywsIg0KPj4gPj4gLVBBQ0tBR0VDT05GSUdbc2VsaW51
eF0gPSAiLS1lbmFibGUtc2VsaW51eCwtLWRpc2FibGUtc2VsaW51eCxsaWJzZWxpbnV4LCINCj4+
ID4+ICtQQUNLQUdFQ09ORklHW3NlbGludXhdID0gImVuYWJsZV9zZWxpbnV4PSJ5ZXMiLC0tZGlz
YWJsZS1zZWxpbnV4LGxpYnNlbGludXgsIg0KPj4gPj4gICBQQUNLQUdFQ09ORklHW2VsZnV0aWxz
XSA9ICItLWVuYWJsZS1lbGYtY2hlY2ssLGVsZnV0aWxzLCINCj4+ID4+ICtQQUNLQUdFQ09ORklH
W25sc10gPSAiZW5hYmxlX25scz0ieWVzIiwtLWRpc2FibGUtbmxzLCwiDQo+PiA+Pg0KPj4gPj4g
ICBFWFRSQV9PRUNPTkYgPSAiIFwNCj4+ID4+ICAgICAgIC0tZGlzYWJsZS1ncG0gXA0KPj4NCj4+
IA0KPj4NCg==
