Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com [68.232.152.245])
 by mx.groups.io with SMTP id smtpd.web09.5535.1617952057491890987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 00:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.onmicrosoft.com header.s=selector2-fujitsu-onmicrosoft-com header.b=KnGf1tzo;
 spf=neutral (domain: fujitsu.com, ip: 68.232.152.245, mailfrom: wangmy@fujitsu.com)
IronPort-SDR: 5DOV24dy0RnIToK2QkgXXjS9xHM2SH4s3FocOFf/6wV4MrLHvTOwMiUdyX8YrYMyiVGWn6Y/qr
 yodD4YF3KHnT2XuYiKJJtgCV/+kuTixhmy6KVaIR143p1n90jv9gk/4vNf+EFaovF3a75RbI5P
 bSoNkg027USe8t6BcE3TtFoSSqTdw3/fyBmsML3Hk6SK0qnUTnhcv21obDGo98XDIOZhnDv5QR
 yknu8goL1djieOCUGDHALrvChzkCSl4LWc8d7cdI6eicsoFebGXMj0eaZQgthRjJzEYmZFdHo3
 DWg=
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="37551984"
X-IronPort-AV: E=Sophos;i="5.82,208,1613401200"; 
   d="scan'208";a="37551984"
Received: from mail-ty1jpn01lp2051.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.51])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 16:07:31 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7YLdSzIBlpsZmO8C1vwiLsaN/6EqE79V5EOdYFmRc8SoCPsGthmCHtPvTcyric0DpEedQC9HMg6Vcn1mF0EE4eEsV+FnPbqEB9ehk9gY60Smy/bahGodzlmx1kYpuWkYIJRaUqMJm1M74wVhIRZpm5PUIDeF6Di8OUpdep3LAhjIowr70P4IvIOFDli3Tho6z6PRckc/v4pq6m+5sfoYfWSDvi2TTOEU3ctqpGL8r66YSQLMYdKWXH0/Dves3EA3ifPQdKBGN0unsHtmRxE3ds1/2p3eJFDwXk7dZjs2PJtPQ1JCAehiV44YJiKZuc5o+hcyCbZyagANK/GJmcf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xSmVBoflbBH6mau5nfE0x4Ry9aJD833LV5ZcAzOuIQ=;
 b=JlG/B5RaG9Erf3+RohA5N0tubwVzQR1wUN1wfjnr6E/XxIRpwBJ3r6Vw9loafm+05TcdwgjwOtemi3R5nLayeDDZO5PUe+ZFsi9xtxPjYqC5+2dwG96MvIinlaOuoK2yJa5XDNHOwRG76LqSIirtYQ2qw/gXf7tP5Dpun0KwSYiyYsGNPRDxsz9OJs8+g2IlJtYD3HZBpMM4n3/Bw7QYXB9tUVnhV2OkMpZj25KN7wFN50hWyaQmSO7x5KVehGueDI//0JHoQ472wT7ph37hy96Wj4HRsiOZpQ3U1LFvp+NuDRU1C+Xm1hc4WaGiNL3gMdUsqDipD7N+KD7q0WhXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xSmVBoflbBH6mau5nfE0x4Ry9aJD833LV5ZcAzOuIQ=;
 b=KnGf1tzozjqeyEwULhmTQeE7XvXsMzy/xUl4zEjgP1Ar6N5/bDljXvK78QX4WLf9xiXH5kEI9zoN1N3e/MIRiM5dIoCX9cwD72Q3oflRzxJ/aHllNmepDUnxvstmhYfMaS8FoFljV7DqL/CpjW7Z9NVOXxP+MBHUtW0MVLHwNtg=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OS3PR01MB6721.jpnprd01.prod.outlook.com (2603:1096:604:10f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 9 Apr
 2021 07:07:28 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a19e:1848:1864:bd44]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a19e:1848:1864:bd44%4]) with mapi id 15.20.3999.035; Fri, 9 Apr 2021
 07:07:28 +0000
From: "wangmy" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Trevor Gamblin <trevor.gamblin@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] curl: upgrade 7.75.0 -> 7.76.0
Thread-Topic: [OE-core] [PATCH] curl: upgrade 7.75.0 -> 7.76.0
Thread-Index: AQHXLDnZST0OFozXs0+NuWqSRJFyE6qrCGSAgABVPKCAABAZAIAAV3dQ
Date: Fri, 9 Apr 2021 07:07:28 +0000
Message-ID: 
 <OSBPR01MB18456A7EF732C1328517655CDC739@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1617860454-5064-1-git-send-email-wangmy@fujitsu.com>
 <1617860454-5064-2-git-send-email-wangmy@fujitsu.com>
 <b26851b2-e3ce-f702-aae7-8b5615514927@windriver.com>
 <OSBPR01MB18454482F7055674EBCE1C46DC739@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <CAMKF1sqAEvnkGrhizqm=1UgcjK6zU7Kof2OtuauOGUW6zA9V5Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqAEvnkGrhizqm=1UgcjK6zU7Kof2OtuauOGUW6zA9V5Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa4b9b7b-2edf-40df-5fea-08d8fb2622e7
x-ms-traffictypediagnostic: OS3PR01MB6721:
x-microsoft-antispam-prvs: 
 <OS3PR01MB6721C87E8C232C8456D8F347DC739@OS3PR01MB6721.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Y0SAUINDjro1lbR/B7/QPTcRphKm/ihLWsGsqGESP6e08IXnsKWYKfVYlDJx0sENxwBwbNTNRZedJ++CcnUgavAHQMkj/jHTm2W8+1GYGvA1hQDYZyvQA/NogF8tdR56MvND9N2mSAdWaz3HJndBsISM6JEidH9VoUqhlYkg+qid8G7tr3xA0sUwyKyI45jsjAm0s0OvjFQh7oF5nb24zfDxpdhe0JnA+5Gez6Jff9xKNTOp86N68cqVOD3jaHdv8A89mJGpH6o9uM1B69xKgmZVG8OD+FBtPmra5trAc62UfwObdZkUwmCqfwaTljRt7sE5mTxD+ZU0wbZpFbfbcBIH85+ToX+j20wXO+1vANvfGfcoxiufUt6S2DPq5e16CH61bWANQXPPkolNWKDJUhjldqs1ivZzJ3GKYblIGYka0pedXPSbyicfCIGE2Cvc2Nboza/fiVMoQGNhaK8NGyvB/+mdtywETV76JKVx3Wr+Dj4fVm6Kd8QPFvkyZzjpI8JbgEa88hnaW2J/n46FqZSYVwE5tCU3W9pYmDGS0daMha4XpIpBGRsrDJ1X1x9PPN23EtOiUQjJBUjFP94i2iRb6JYRHvzKWJdPNCzD3/VZuIXWA+0/tv5qAFC3Fgy7j9tDdPj3XzmJwY2cc48AYMkygFJ4/BoqTGbVtJhoPXwh308LxkGXt7KRND0fHKVPkXAjvGNIX6b4diNLzixqusDolywJJJUdn7yec38Y+dc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(66476007)(64756008)(6916009)(26005)(478600001)(76116006)(66946007)(186003)(33656002)(83380400001)(66556008)(7696005)(966005)(6506007)(4326008)(53546011)(38100700001)(2906002)(71200400001)(54906003)(85182001)(5660300002)(52536014)(66446008)(9686003)(86362001)(8676002)(8936002)(316002)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?d2xJamwrd2Y2cittekM4L0s3R2J4dXVYNmpJVFJaY1B2ZWNUMlducERNWGpY?=
 =?utf-8?B?ekpqK3Z3enAxVTVhZ2QzTW9hOUpJMnVzWkt5R3BzbDloUFMyczVyMVJhRDNG?=
 =?utf-8?B?YmdKUDlHZkloRWpOL0xhNFd5S1RqUkRpVFB2Q0Z2NldIb0NBc3VUWXM2bXVN?=
 =?utf-8?B?N2R5TnJjcTdhMTVVaWFvMERUQWx6Z0pMMThCSlp5cVRTajF3MWYzNStGSURq?=
 =?utf-8?B?VWZsTC9Vbk5oc2lJQk5FbkNhVTk2WUZDS0M5dzMrVWJjWFcxUExQRHpWWWdz?=
 =?utf-8?B?NFMxY2dXd1A4cnV1NmZKL0RQdVllZkFqZWxJU0t4WVZMdjJLS0VGQkRneGlk?=
 =?utf-8?B?Y3pXcUlFeUJtTmxjTkJva2VlVXVzQW03OEM1UUJadTBHenhraTFTdEhEZDh0?=
 =?utf-8?B?Q2JOeS9sUVVjRDRFNFpxZ3BFV3dENVZjRytObDIrcmplaDFWcUJqbFhVVXBF?=
 =?utf-8?B?aHZGM21TY0F5VC9rcE1NcXRXRTVuRGhPZktZV1I2UWxqZmRHUXlkS0ZBOG9Y?=
 =?utf-8?B?d1doaUpQY3kyRy9NSkJTWStaTENwbHpyRXc2L0paQ1BtSTlrVFBHMTVqZUFX?=
 =?utf-8?B?TDUycS96b0QrUXdLQ0ZJUEN4UnJKK2g2cFhqSWhhck05bFF3MmkyT2Y3WWlG?=
 =?utf-8?B?MGcyRGU1RHdVWGVUSmtBa2JuM1VzSm9NTEF4Y0JSRFpVS2txUENzUWNmKzRt?=
 =?utf-8?B?RVg4a0ZTN0Z2Vmt5ZnJXZU5zQ0ZrbVk1OStKNFlZenpHbFlkOUM0RkxMUGVQ?=
 =?utf-8?B?a1UvZ2xKMXM0YzNWd0xKY1JVczRMU29MVG1ET01lRmpGYkprTG11bGRBbUxj?=
 =?utf-8?B?K3RQeEN5cFZnWTBrU3NQUmk4TVRqQVhvVVVlNjVEcHlWOWFsN1F5ZlhhQitO?=
 =?utf-8?B?OTlxWkJTT1prQ0g5eFkybzBOVmFtTEhKN2NBa0JZUnJnMTZraXpCMDBGQkp5?=
 =?utf-8?B?YXFTVktsRHlGa1dVVHBMT0luZHVWdnJqUXF3VWRJWkRzME5ScUJOSlhHSjdG?=
 =?utf-8?B?VFZTc0JmUUJIcmFvOFpheWk0NjkvNzNTR1lzNXJmZGd1ZzA4VEo0clF2VGFK?=
 =?utf-8?B?T2ZiNURSYkxDazNuSG1hVnBlKzA5d08vRDZucnp3ZDVaWnNSNUdxQnJnMXdl?=
 =?utf-8?B?Zldra2lHV0lFa3g1NFJSTDhROFQyUlI4NUdBRXUxNEJzZTBNamt1ZVlERUJT?=
 =?utf-8?B?dHpyK1hOVzJsY3NDNWtuQmJQYlVKNmFWU1h5djh1eVBjSk9GYVdOamJZM2c2?=
 =?utf-8?B?M3VDRmRNN09saWhmRmhUcGtvd2taUWd5SlpNNVBQWkJGcHRVVzNwQ2VCam5v?=
 =?utf-8?B?TjU2T0ZkTzkzZU4wU0QyN0R4TlBpTkNCZmY5U1J1QytDOHMwdjlwOGVXYzFG?=
 =?utf-8?B?ZEgrbUoyQURyM3NGNHdORDlFUmdCL0p1SGlsaXRrM0lGeFFEc1JENno3VjNT?=
 =?utf-8?B?cVRxS01tRTJrMEZzTFBYRmhoODNKYlJDRlNvOWRVU2ticDJBYzdLdDFwbnRO?=
 =?utf-8?B?Tyt6RGVFY1dSTXY3MGJLcDZJV0dZNlI0dWFjdG0wU1pBeHpBQlh5NEV0Q0lO?=
 =?utf-8?B?YXRjNXdIZzhBNngyb04rLzJvWUFKRjQrUmQ1cVZGUFhKRkx5Qnc0TE1iOXNl?=
 =?utf-8?B?SVR2enhtbXd2S1d2S0Q2dU5KemlKSGFmR1dweDhtZll5VUlTOFhDLzZGTmVT?=
 =?utf-8?B?ZGFucUsxUDNTOHBaUUE2WFBxcFJZT0IzTmFRTTdlYXpYK0Q5MlNvWEdjNndD?=
 =?utf-8?Q?3Uxqz/PcQAndWzrAGg=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4b9b7b-2edf-40df-5fea-08d8fb2622e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 07:07:28.5163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CTAfbUSSxYj7Xv1DCSpEczTuDdZNZQONSoogfFs3gweX5ZlgpcCtxGiXFi6JIdoFqHkp35QELGiO/JIldejFDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6721
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSdtIGdvaW5nIHRvIHJldmlzZSBpdCBsaWtlIHRoaXMuIFBsZWFzZSBzZWUgaWYgaXQncyBPSzoN
Cg0KQEAgLTU0LDYgKzU0LDcgQEANCiBQQUNLQUdFQ09ORklHW3RocmVhZGVkLXJlc29sdmVyXSA9
ICItLWVuYWJsZS10aHJlYWRlZC1yZXNvbHZlciwtLWRpc2FibGUtdGhyZWFkZWQtcmVzb2x2ZXIs
LCwsYXJlcyINCiBQQUNLQUdFQ09ORklHW3ZlcmJvc2VdID0gIi0tZW5hYmxlLXZlcmJvc2UsLS1k
aXNhYmxlLXZlcmJvc2UiDQogUEFDS0FHRUNPTkZJR1t6bGliXSA9ICItLXdpdGgtemxpYj0ke1NU
QUdJTkdfTElCRElSfS8uLi8sLS13aXRob3V0LXpsaWIsemxpYiINCitQQUNLQUdFQ09ORklHW2xp
YmdzYXNsXSA9ICItLXdpdGgtbGliZ3Nhc2wsLS13aXRob3V0LWxpYmdzYXNsLGxpYmdzYXNsIg0K
DQogRVhUUkFfT0VDT05GID0gIiBcDQogICAgIC0tZGlzYWJsZS1saWJjdXJsLW9wdGlvbiBcDQpA
QCAtNjUsNiArNjYsNyBAQA0KICAgICAtLWVuYWJsZS1kZWJ1ZyBcDQogICAgIC0tZW5hYmxlLW9w
dGltaXplIFwNCiAgICAgLS1kaXNhYmxlLWN1cmxkZWJ1ZyBcDQorICAgIC0td2l0aG91dC1saWJn
c2FzbCBcDQogIg0KDQogZG9faW5zdGFsbF9hcHBlbmRfY2xhc3MtdGFyZ2V0KCkgew0KDQrCoCAt
LQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpEZXZlbG9wbWVudCBEZXB0LkkNCk5hbmppbmcgRnVq
aXRzdSBOYW5kYSBTb2Z0d2FyZSBUZWNoLiBDby4sIEx0ZC4oRk5TVCkgTm8uIDYgV2Vuemh1IFJv
YWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTDogKzg2KzI1LTg2NjMwNTY2LTg1NjgNCkNP
SU5TOiA3OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1
LmNvbQ0KaHR0cDovL3d3dy5mdWppdHN1LmNvbS9jbi9mbnN0Lw0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IFNl
bnQ6IEZyaWRheSwgQXByaWwgOSwgMjAyMSA5OjUzIEFNDQo+IFRvOiBXYW5nLCBNaW5neXUv546L
IOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiBDYzogVHJldm9yIEdhbWJsaW4gPHRyZXZv
ci5nYW1ibGluQHdpbmRyaXZlci5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBjdXJsOiB1cGdy
YWRlIDcuNzUuMCAtPiA3Ljc2LjANCj4gDQo+IE9uIFRodSwgQXByIDgsIDIwMjEgYXQgNTo1OCBQ
TSB3YW5nbXkgPHdhbmdteUBmdWppdHN1LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBJIGZvdW5kIGxp
YmdzYXNsIGluIG1ldGEtdGl6ZW4sIGJ1dCB0aGlzIHJlcG9zaXRvcnkgaXMgdmVyeSBvbGQgYW5k
IGhhcyBiZWVuDQo+IGRlbGV0ZWQgZnJvbSBsYXllcnMuDQo+ID4NCj4gPg0KPiA+DQo+ID4gQ2Fu
IEkgc3BlY2lmeSAgLS13aXRob3V0LWxpYmdzYXNsIGluIGN1cmwgdG8gc29sdmUgdGhlIHByb2Js
ZW0/DQo+IA0KPiBJIHRoaW5rIGlkZWFsbHkgeW91IGNhbiBhZGQgYSBwYWNrYWdlY29uZmlnIGtu
b2IgZm9yIGl0IGFuZCBrZWVwIGl0IGRpc2FibGVkIGJ5DQo+IGRlZmF1bHQuDQo+IA0KPiA+DQo+
ID4NCj4gPg0KPiA+ICAgLS0NCj4gPg0KPiA+IEJlc3QgUmVnYXJkcw0KPiA+DQo+ID4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiBX
YW5nIE1pbmd5dQ0KPiA+DQo+ID4gRGV2ZWxvcG1lbnQgRGVwdC5JDQo+ID4NCj4gPiBOYW5qaW5n
IEZ1aml0c3UgTmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpIE5vLiA2IFdlbnpo
dQ0KPiA+IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENCj4gPg0KPiA+IFRFTDogKzg2KzI1
LTg2NjMwNTY2LTg1NjgNCj4gPg0KPiA+IENPSU5TOiA3OTk4ODU0OA0KPiA+DQo+ID4gRkFYOiAr
ODYrMjUtODMzMTc2ODUNCj4gPg0KPiA+IE1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0KPiA+DQo+
ID4gaHR0cDovL3d3dy5mdWppdHN1LmNvbS9jbi9mbnN0Lw0KPiA+DQo+ID4NCj4gPg0KPiA+IEZy
b206IFRyZXZvciBHYW1ibGluIDx0cmV2b3IuZ2FtYmxpbkB3aW5kcml2ZXIuY29tPg0KPiA+IFNl
bnQ6IEZyaWRheSwgQXByaWwgOSwgMjAyMSAzOjUwIEFNDQo+ID4gVG86IFdhbmcsIE1pbmd5dS/n
josg6bij55GcIDx3YW5nbXlAZnVqaXRzdS5jb20+Ow0KPiA+IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0g
Y3VybDogdXBncmFkZSA3Ljc1LjAgLT4gNy43Ni4wDQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPg0K
PiA+IE9uIDIwMjEtMDQtMDggMTo0MCBhLm0uLCB3YW5nbXkgd3JvdGU6DQo+ID4NCj4gPiBbUGxl
YXNlIG5vdGU6IFRoaXMgZS1tYWlsIGlzIGZyb20gYW4gRVhURVJOQUwgZS1tYWlsIGFkZHJlc3Nd
DQo+ID4NCj4gPg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBm
dWppdHN1LmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+DQo+ID4gIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L2N1cmwve2N1cmxfNy43NS4wLmJiID0+IGN1cmxfNy43Ni4wLmJifSB8IDIgKy0NCj4gPg0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+
ICByZW5hbWUgbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC97Y3VybF83Ljc1LjAuYmIgPT4gY3Vy
bF83Ljc2LjAuYmJ9DQo+ID4gKDk3JSkNCj4gPg0KPiA+DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzcuNzUuMC5iYg0KPiA+IGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvY3VybC9jdXJsXzcuNzYuMC5iYg0KPiA+DQo+ID4gc2ltaWxhcml0eSBpbmRl
eCA5NyUNCj4gPg0KPiA+IHJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3Vy
bF83Ljc1LjAuYmINCj4gPg0KPiA+IHJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJs
L2N1cmxfNy43Ni4wLmJiDQo+ID4NCj4gPiBpbmRleCA3NjY2YzdiNjA4Li42ODMxNWQ5Zjc3IDEw
MDY0NA0KPiA+DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzcuNzUu
MC5iYg0KPiA+DQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzcuNzYu
MC5iYg0KPiA+DQo+ID4gQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9DQo+ID4gImh0dHBzOi8v
Y3VybC5oYXh4LnNlL2Rvd25sb2FkL2N1cmwtJHtQVn0udGFyLmJ6MiBcDQo+ID4NCj4gPiAgICAg
ICAgICAgICBmaWxlOi8vMDAwMS1yZXBsYWNlLWtyYjUtY29uZmlnLXdpdGgtcGtnLWNvbmZpZy5w
YXRjaCBcDQo+ID4NCj4gPiAgIg0KPiA+DQo+ID4NCj4gPg0KPiA+IC1TUkNfVVJJW3NoYTI1NnN1
bV0gPQ0KPiAiNTA1NTJkNDUwMWMxNzhlNGNjNjhiYWFlY2M0ODdmNDY2YTNkNmQxOWJiZjRlNTBh
MDE4NjllZmZiMzE2ZDAyNiINCj4gPg0KPiA+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiZTI5
YmZlMzYzMzcwMTU5MGQ3NWIwMDcxYmJiNjQ5ZWU1Y2E0Y2E3M2YwMDY0OTI2OGJkMzg5NjM5NTMx
YzQ5YQ0KPiAiDQo+ID4NCj4gPiBUaGlzIGNoYW5nZSBmYWlscyBvbiB0aGUgY3VybC1uYXRpdmUg
ZG9fY29uZmlndXJlIHN0ZXA6DQo+ID4NCj4gPiB8IGNoZWNraW5nIGZvciB0aW1lLmguLi4gKGNh
Y2hlZCkgeWVzDQo+ID4gfCBjaGVja2luZyBmb3Igc3lzL3NvY2tldC5oLi4uIChjYWNoZWQpIHll
cyBjaGVja2luZyBmb3Igc3RydWN0DQo+ID4gfCB0aW1ldmFsLi4uIHllcyBjaGVja2luZyBydW4t
dGltZSBsaWJzIGF2YWlsYWJpbGl0eS4uLiBmYWlsZWQNCj4gPiB8IGNvbmZpZ3VyZTogZXJyb3I6
IG9uZSBvciBtb3JlIGxpYnMgYXZhaWxhYmxlIGF0IGxpbmstdGltZSBhcmUgbm90DQo+ID4gfCBh
dmFpbGFibGUgcnVuLXRpbWUuIExpYnMgdXNlZCBhdCBsaW5rLXRpbWU6IC1saWRuMiAtbGdzYXNs
IC1sc3NsDQo+ID4gfCAtbGNyeXB0byAtbHNzbCAtbGNyeXB0byAtbHoNCj4gPg0KPiA+IEFmdGVy
IGEgbG9vayBhdCB0aGUgcmVjaXBlIGl0IGFwcGVhcnMgdGhhdCB0aGlzIG1heSBiZSBhIGRlcGVu
ZGVuY3kgb24gbGliZ3Nhc2wuDQo+IENvdWxkIHlvdSBpbnZlc3RpZ2F0ZSB0aGlzIGFuZCBzZW5k
IGEgdjIgd2l0aCB0aGUgYXBwcm9wcmlhdGUgUEFDS0FHRUNPTkZJRw0KPiBhZGRlZD8gWW91IHNo
b3VsZCBhbHNvIGluY2x1ZGUgcmVsZWFzZSBub3RlcyBpbiB0aGUgcGF0Y2ggc3VtbWFyeSB3aGVy
ZQ0KPiBwb3NzaWJsZS4NCj4gPg0KPiA+IC0gVHJldm9yDQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4g
Pg0KPiA+ICAjIEN1cmwgaGFzIHVzZWQgbWFueSBuYW1lcyBvdmVyIHRoZSB5ZWFycy4uLg0KPiA+
DQo+ID4gIENWRV9QUk9EVUNUID0gImhheHg6Y3VybCBoYXh4OmxpYmN1cmwgY3VybDpjdXJsIGN1
cmw6bGliY3VybCBsaWJjdXJsOmxpYmN1cmwNCj4gZGFuaWVsX3N0ZW5iZXJnOmN1cmwiDQo+ID4N
Cj4gPiAtLQ0KPiA+DQo+ID4gMi4yNS4xDQo+ID4NCj4gPg0KPiA+DQo+ID4NCj4gPg0KPiA+DQo+
ID4NCj4gPg0KPiA+DQo+ID4NCj4gPiANCj4gPg0K
