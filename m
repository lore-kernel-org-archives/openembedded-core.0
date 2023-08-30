Return-Path: <emkan@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF10BC6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 09:47:31 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.134])
 by mx.groups.io with SMTP id smtpd.web10.10319.1693388850447771326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 02:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=Wrh2cKFn;
 spf=pass (domain: prevas.dk, ip: 40.107.13.134, mailfrom: emkan@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4URJHFr0HzVy5iUybtf5DJHS+Kyoy6SaD+kIzqLs+uo29zsqbVxdXaKX29g0xXQYPCvXCW/BlxITkJ6p4EQDLitRz0rXROm4O6ZkQZKmBAgHqISDefpyfRSYzoG7sAeWcOMehLbcLGCuAkZ/3/kwag4bwbGdWE6+gFeEkf2VXhJzQASUCKznYRuSLRSeTzxp0FTaqBgTsv47IE3bwJ3crjy1scLoNbVNPqIyvB1wgtQ53uFKVpe7B/5a3haxH010Rj2mcpq+SmvfkmrN0BzhZuYri9I05njQkK0pX0lkTG6XNLkltssVq+rdZ8+DJsduA0DgrclLmxa3pChMxGsKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOtKt25RVf1H5mpMWEe11hpeeuEBxFyaZDFvUoZKOmU=;
 b=n6OxQowqb0URlZFTCVmUe+vZecSz6KlJgaIJ70ngsswumpTtZ+1yTbJikXh9tztJrvfnrjn99YljZzyoueZEB1pKL2Vs5QyEjsrft5HlnVC1WQOGhU5uLksMawp8IHYpWFA3Jp1VMMjsGuCwyVsOl5JJoQL4+jmYM+OUl4z3tgyGx65iACaW9rESjpN2EbZXPVPGiQtKeCp3D7EwzHKgQX2dKlT2g2K+i3Q7+A0EuVv9qtdvFTZbcXX1pk1+VBTVgIIyAj2FymWqecqLDCEOffK6Sg/jPnsjOUktrzpSNRTJZ0itq+qsabGKHauAa82R/AqG0/mwwoUj8Od8V/JNUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOtKt25RVf1H5mpMWEe11hpeeuEBxFyaZDFvUoZKOmU=;
 b=Wrh2cKFnqoUH4mkZWudwlbjCvn7Ht60/RiEaZbgn9sNMVoI6sxyRBhxzP052cPia8jR/HsF26LUZhSg46zy3sosSF6LS0Dtca13LBw/4MKtCFTV/xhM3MY11nrtvbJ9vD0nfBIRtMC3UvlA6eREWh2kZTXBP45GBdZY7Ae8IcWQ=
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:10a::24)
 by PAXPR10MB5349.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:289::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 09:47:23 +0000
Received: from PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126]) by PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6def:6be3:e407:5126%7]) with mapi id 15.20.6699.034; Wed, 30 Aug 2023
 09:47:23 +0000
From: Emil Kronborg Andersen <emkan@prevas.dk>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH 3/3] libx11-compose-data: add CVE_PRODUCT
Thread-Index: 
 AQHZ1pCnD8HIvlN4GE2Gd3/khZMp+q/7ISmAgAQw64KAAbvKAIABXWQqgAAv/QCAAAUQJA==
Date: Wed, 30 Aug 2023 09:47:23 +0000
Message-ID: 
 <PA4PR10MB45766E4F12461E4BE5816BBAFFE6A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
References: <20230824134101.41906-1-emkan@prevas.dk>
 <20230824134101.41906-4-emkan@prevas.dk>
 <7263B0AD-E44B-4E8E-A7E5-567E67DEEC10@arm.com>
 <PA4PR10MB4576FA7369BA0C5437C8F9EEFFE0A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
 <DD619F8E-B1D5-462B-A4E7-008A6F8E181E@arm.com>
 <PA4PR10MB45762B6CDBDBB062BE4C5326FFE6A@PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM>
 <46B1A25C-EF15-4C95-A9C4-425B706F6DE5@arm.com>
In-Reply-To: <46B1A25C-EF15-4C95-A9C4-425B706F6DE5@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB4576:EE_|PAXPR10MB5349:EE_
x-ms-office365-filtering-correlation-id: 20ea5c54-63b7-4f8e-a1f0-08dba93e1cc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Vw3ohEeVkcJC0qDv/sC/TI8IrVUljoK2BhdUpMFIypgYo9IrViRAbyjnN3Qhpdn4a85Rrud/dOC3ACem6je6aFISVXtHFWWt2H03NNq7i5PaOKO3NC43voBUCR1uGQc/lOqmmyhrdXgpnSt3iHhNtmPTQD3BrD3WgqQMMOsbUM+ba1xQ2eZaVTx0EptWMGW6rtPjTsfv3Wz6adey9X1+XCssRY0qUQ56JwbA76bP8rlBD62cxdIocYBpxJqbshS7cosQX9gNniBbaoeH7LJOnvKyjMEXp82TTdXYWTXwVjORKhSLgACTvP2j3lCwg9hZF/nU6S4q/ix4JHTDt3FApAGEiwxfM5TXnQ4Q0ceuxpChOOmjyfFn/ugNPsiho7wdUg31DChM/FiQsIcIxfkmNSEXWZ22O0pWzGaAJbYgkLGmvW6eHyjSUsR//QsZIudYHIaP4TMDSAPxUQto+J6GZGomQgQ0iyzwwVoD0+YA5OvkgnUR63WmF1Gaiu1tjAwqxRu3LzTX0qaBUk1j5wMKCsCdNaOjH6oAwxQl4OmcTiAY7efVU1adm4yIPY0UPvXJLb5TjTilWUHFNCOhlkVGO33UFm67MOV0pYjoNMUNnCw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(136003)(366004)(376002)(346002)(186009)(451199024)(1800799009)(19627405001)(166002)(71200400001)(6506007)(9686003)(7696005)(4326008)(38100700002)(86362001)(33656002)(38070700005)(122000001)(55016003)(2906002)(76116006)(4744005)(26005)(478600001)(91956017)(53546011)(8676002)(66556008)(8936002)(52536014)(41300700001)(5660300002)(66476007)(6916009)(66946007)(64756008)(66446008)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?akh4RVFIc3V3QzREbWxGWnJodGI0YkxxSHExeW8yK2dWTzh4UDdJUmhkc2RD?=
 =?utf-8?B?WWZHYkVucHh1SGEyNGpGMzNvUjEyNzJJZENJSFRQR25uVGp0QjB6bkIrZCsw?=
 =?utf-8?B?NllibVlaZ0pUNXpFR0hCeCt3SVN2eWQ3bkdoTFZlOUdjT2ZlTDBEZUhDN2Vu?=
 =?utf-8?B?YTdXZDBrc0FhK1A2RGVsYnpDTFo2OS9Ra0tsdDdvMDlZR1h5L21DK2JYYnhF?=
 =?utf-8?B?dnU3Y0tMMThmMEFtZkxiVzhrTUtPOWxsR2VuaU9aVUoyNjF1a1l3ZHlFT0tQ?=
 =?utf-8?B?eEZyN0QvU3N3YnRRZkJrNmw2ZjdVVzJuVW4xdGFwaEtlMnkwVzJOeEJ4aWdK?=
 =?utf-8?B?RkxCVlJ5NWdtYWRuVjFoMXFYbllJNVRyUEJGTldaNlhubFlQN1Zuek1WSzdI?=
 =?utf-8?B?WHRlN3A0MzZPWmFkdFFCSFQzbWFxVVZsdFljMHRjTHdOaUpJYVZQV0hBQzM1?=
 =?utf-8?B?YWJKU3FTOVA1cnhsVEtSTmdwWWhRUEpWZ2hSV09ja2ljci9OTFZMSDQ2UTF2?=
 =?utf-8?B?R1dtN3duZnFZcXFUMFY3ZzBJcTBkRlpZWXI3Qm9iS011TnJFT2l0VSsyZkpK?=
 =?utf-8?B?eThjVUlqWTQ4c1pWNjVEQ1ExZ2sxWTNtVVhXV25SK2NWTlh0TVN5QURqTmdH?=
 =?utf-8?B?ajJLSmhpQ2xQaFpTK1NUZUNCWGtzVXpHUTNJOXdrbGlyNVR5UHJVY2NlZHU3?=
 =?utf-8?B?aG90UUREOXBuSFczY0cyY2o5c3UxazNTWk5pYzQ2bTFoTTBoYlhwQnE3c01a?=
 =?utf-8?B?MHdBTUY1bnN1aGZhU0VUZkcrQzRkSlNZSlBmWjN2MTd2VGcwWm9ycUNQd1cy?=
 =?utf-8?B?VzNDOVFSVm9kWFEyQjBXbThNK29UTHk5WUJBWUFBenNVSEVzZS9zVG5XLzhP?=
 =?utf-8?B?cnVGWXUrVkd5L1JVZUV0TlIrbEpTN3BoczVzNlJURWNhUjBWTTZtL05wcXRB?=
 =?utf-8?B?ODVNbjNJcGJFYlhNYlMwMGpMdGVVeUpYT2dJaVZOS0NiOXB1bFdoMnZTQVNt?=
 =?utf-8?B?RFB1dTJNTDl2d1V0ZnVLWWdueVphdXB5NGVEeFlFMDJscXMweVNncHRaVy90?=
 =?utf-8?B?RldvS0hiM0JRaS81L1VnZldKTkV3OGpBUXJSYXVFYmpJVEdNNFNrS0NMaWtu?=
 =?utf-8?B?eS92WkhFLzlWenZkR2pvUFY3cXdaSzdoR3Z1Sk4yb0VRSm5seUJuRzN1bmlE?=
 =?utf-8?B?bFVGa3ExbllPOGwvNm81cWRhR25HazRjQmx5U1hDcDhUUmZoL0Y2WWNBTzBC?=
 =?utf-8?B?L04ycVovbGE1T1l0QlZTWU55dzZjai9qWkRXYzFQR3U1bFhBa05MK2J4dTVx?=
 =?utf-8?B?aWhhMDlsbWVQWjhKTi9PL0NybS9sSUtwTEd3MmlqZVJjN0x3K05CNVZrYUNl?=
 =?utf-8?B?elpxWFNLKzN3aHBrRUJQZU5Vb1JNSHBRSnhBc2ZFNEdwTVBySlcwSXlGU0JI?=
 =?utf-8?B?VmY3cmZpOEYyVkxEc0w2Sk52dUs4TFFpSVl5Mnc2SjVwWWU0TnhhR1E4MXox?=
 =?utf-8?B?bG16cUVodmlSQ05FVWFiaVlqdmJuRitVZmxHZE9rSjJBNmVCWDV3SVFSc0ZE?=
 =?utf-8?B?U2o4MFBEMlRkaURJYlFBOGFmSUxIUUlPNGlzNmNJemgxek1WNDl4UjJBZ3oy?=
 =?utf-8?B?bXZiNm1ZdllXaFdvTDVHcjIxN1dwN1RORXQ1TUdxVXNpUVdEUWVGK1dteS9W?=
 =?utf-8?B?OENES3lzY0lGVytkQnF3RXRoYk5heHJWNmF3SmFvSytLM2dQdVFPLzErOW1a?=
 =?utf-8?B?aFNhQ2tneWI2T052THFSUENZTXJ6NUN4d0dETkozaVNkSEIvaGlGNjVGTldz?=
 =?utf-8?B?U3BIeWt2b0RaWHZENzRoQVlVTVdlcHEzRzJYYjduZXdWWmh0UXNPTFFwcVMy?=
 =?utf-8?B?VitCczhsYVZRL2NoRytkVDM0Vnl6RkZOaUwwRWsvS2VSWllyd1p3NmVQa2xv?=
 =?utf-8?B?aStMcGNYVEJxTjdDRzhTa3pIV2ZXOHNRUUYwZ1l5RC9jeDFlbU01QzAxTjhM?=
 =?utf-8?B?ZkdTeUlhdEVER1dZMWEvUnRvbytRNEQ4NlRRdGxTWUNqNXY4KzdlUG5nVm5D?=
 =?utf-8?B?NFIzZ1lHOEJJQ3dvNGVtMUlRRzlwZ2tqcEJEV3VCM1p0REdZT0R3U3dwUDJm?=
 =?utf-8?Q?9vuRRklXnqSeKAA7talbE5BaS?=
Content-Type: multipart/alternative;
	boundary="_000_PA4PR10MB45766E4F12461E4BE5816BBAFFE6APA4PR10MB4576EURP_"
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB4576.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ea5c54-63b7-4f8e-a1f0-08dba93e1cc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 09:47:23.8247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iz1iV8B+J935QhywxCcUNH1sLj7k2nhemKO0SYgfa84qRnrgWu2vVy/LW+Ucj7rs1NIxj1MNm63uMiSV1xN8Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5349
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 09:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186877

--_000_PA4PR10MB45766E4F12461E4BE5816BBAFFE6APA4PR10MB4576EURP_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWxyaWdodC4gSSB0aG91Z2h0IGxpYngxMeKAiyB3YXMgYSBkZXBlbmRlbmN5IG9mIHRoZSBwYWNr
YWdlcyB0aGF0IGluY2x1ZGUgeG9yZy1saWItY29tbW9uLmluY+KAiywgd2hpY2ggaXMgd2h5IEkg
YXNrZWQuDQoNClNvIEkgZ3Vlc3MgdGhpcyBwYXRjaCBjYW4ganVzdCBiZSBkcm9wcGVkIHRoZW4/
IERvIHlvdSBuZWVkIG1lIHRvIGRvIGFueXRoaW5nIGZ1cnRoZXI/DQoNCkVtaWwNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25A
YXJtLmNvbT4NClNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDMwLCAyMDIzIDExOjI3DQpUbzogRW1p
bCBLcm9uYm9yZyBBbmRlcnNlbiA8ZW1rYW5AcHJldmFzLmRrPg0KQ2M6IG9wZW5lbWJlZGRlZC1j
b3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+DQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAzLzNdIGxpYngxMS1j
b21wb3NlLWRhdGE6IGFkZCBDVkVfUFJPRFVDVA0KDQpPbiAzMCBBdWcgMjAyMywgYXQgMDc6Mzcs
IEVtaWwgS3JvbmJvcmcgQW5kZXJzZW4gPGVta2FuQHByZXZhcy5kaz4gd3JvdGU6DQo+DQo+IFRo
YXQgaXMgd2h5IEkgd2FudCB0byBpbmNsdWRlIGl0IGluIHRoYXQgZmlsZS4gRG9lc24ndCBpdCBt
YWtlIHNlbnNlIHRvIGNhcHR1cmUgQ1ZFcyBmb3IgeC5vcmc6bGlieDEx4oCLIGlmIHlvdSB1c2Ug
YW55IG9mIHRoZSBsaWJyYXJpZXM/DQoNCk5vLCB4Lm9yZyA8aHR0cDovL3gub3JnLz46bGlieDEx
IHJlZmVycyB0byBsaWJ4MTEsIG5vdCBlZyBsaWJ4dm1jLg0KDQpSb3NzDQoNCg==

--_000_PA4PR10MB45766E4F12461E4BE5816BBAFFE6APA4PR10MB4576EURP_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBD
YWxpYnJpLCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNv
bG9yOiByZ2IoMCwgMCwgMCk7IiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPg0KQWxyaWdodC4gSSB0
aG91Z2h0IDxjb2RlPmxpYngxMTwvY29kZT7igIsgd2FzIGEgZGVwZW5kZW5jeSBvZiB0aGUgcGFj
a2FnZXMgdGhhdCBpbmNsdWRlDQo8Y29kZT54b3JnLWxpYi1jb21tb24uaW5jPC9jb2RlPuKAiywg
d2hpY2ggaXMgd2h5IEkgYXNrZWQuPC9kaXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2Fs
aWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xv
cjogcmdiKDAsIDAsIDApOyIgY2xhc3M9ImVsZW1lbnRUb1Byb29mIj4NCjxicj4NCjwvZGl2Pg0K
PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2ZXRpY2EsIHNhbnMt
c2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsiIGNsYXNzPSJlbGVt
ZW50VG9Qcm9vZiI+DQpTbyBJIGd1ZXNzIHRoaXMgcGF0Y2ggY2FuIGp1c3QgYmUgZHJvcHBlZCB0
aGVuPyBEbyB5b3UgbmVlZCBtZSB0byBkbyBhbnl0aGluZyBmdXJ0aGVyPzxicj4NCjxicj4NCkVt
aWw8L2Rpdj4NCjxkaXYgaWQ9ImFwcGVuZG9uc2VuZCI+PC9kaXY+DQo8aHIgc3R5bGU9ImRpc3Bs
YXk6aW5saW5lLWJsb2NrO3dpZHRoOjk4JSIgdGFiaW5kZXg9Ii0xIj4NCjxkaXYgaWQ9ImRpdlJw
bHlGd2RNc2ciIGRpcj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBzdHls
ZT0iZm9udC1zaXplOjExcHQiIGNvbG9yPSIjMDAwMDAwIj48Yj5Gcm9tOjwvYj4gUm9zcyBCdXJ0
b24gJmx0O1Jvc3MuQnVydG9uQGFybS5jb20mZ3Q7PGJyPg0KPGI+U2VudDo8L2I+IFdlZG5lc2Rh
eSwgQXVndXN0IDMwLCAyMDIzIDExOjI3PGJyPg0KPGI+VG86PC9iPiBFbWlsIEtyb25ib3JnIEFu
ZGVyc2VuICZsdDtlbWthbkBwcmV2YXMuZGsmZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnICZsdDtvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnJmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogW09FLWNvcmVd
IFtQQVRDSCAzLzNdIGxpYngxMS1jb21wb3NlLWRhdGE6IGFkZCBDVkVfUFJPRFVDVDwvZm9udD4N
CjxkaXY+Jm5ic3A7PC9kaXY+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9IkJvZHlGcmFnbWVudCI+PGZv
bnQgc2l6ZT0iMiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMXB0OyI+DQo8ZGl2IGNsYXNzPSJQ
bGFpblRleHQiPk9uIDMwIEF1ZyAyMDIzLCBhdCAwNzozNywgRW1pbCBLcm9uYm9yZyBBbmRlcnNl
biAmbHQ7ZW1rYW5AcHJldmFzLmRrJmd0OyB3cm90ZTo8YnI+DQomZ3Q7IDxicj4NCiZndDsgVGhh
dCBpcyB3aHkgSSB3YW50IHRvIGluY2x1ZGUgaXQgaW4gdGhhdCBmaWxlLiBEb2Vzbid0IGl0IG1h
a2Ugc2Vuc2UgdG8gY2FwdHVyZSBDVkVzIGZvciB4Lm9yZzpsaWJ4MTHigIsgaWYgeW91IHVzZSBh
bnkgb2YgdGhlIGxpYnJhcmllcz88YnI+DQo8YnI+DQpObywgeC5vcmcgJmx0OzxhIGhyZWY9Imh0
dHA6Ly94Lm9yZy8iPmh0dHA6Ly94Lm9yZy88L2E+Jmd0OzpsaWJ4MTEgcmVmZXJzIHRvIGxpYngx
MSwgbm90IGVnIGxpYnh2bWMuPGJyPg0KPGJyPg0KUm9zczxicj4NCjxicj4NCjwvZGl2Pg0KPC9z
cGFuPjwvZm9udD48L2Rpdj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_PA4PR10MB45766E4F12461E4BE5816BBAFFE6APA4PR10MB4576EURP_--

