Received: from esa5.fujitsucc.c3s2.iphmx.com (esa5.fujitsucc.c3s2.iphmx.com [68.232.159.76])
 by mx.groups.io with SMTP id smtpd.web11.4941.1617666407194717250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 16:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.onmicrosoft.com header.s=selector2-fujitsu-onmicrosoft-com header.b=UJDDvAZq;
 spf=pass (domain: fujitsu.com, ip: 68.232.159.76, mailfrom: wangmy@fujitsu.com)
IronPort-SDR: 26VHeYeJNHJ34/Fw1K8DrRzR/Dd2OPTdGi2an8lVRIUR39PJByjpIHhAmtIi5/OfMD3jkkGhA2
 Cs64HyWu0dDNJFe5l/qLvCB+1JIHE45ZRwfTkdfUMlzYLDEk2FYygP6WBmRua62yxkdEk33lm5
 7WPtzD12ypZ2TZx7f0XnzUMQFvPQrAtj5KzP21+v2K2Lim8Te0IccpDMYpS4MJuUBoVY2PvlGC
 ZAXLPHBvoaaCtIvH9g4FqsGqcnYyGqjLKXLXA1fXDtwRTxu0wAcxzvLKuZFEgnjDln/lkfkHvR
 E+8=
X-IronPort-AV: E=McAfee;i="6000,8403,9945"; a="29127963"
X-IronPort-AV: E=Sophos;i="5.81,308,1610377200"; 
   d="scan'208";a="29127963"
Received: from mail-ty1jpn01lp2054.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.54])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 08:46:37 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDJe78msofuWCSEnHY+8xsuqvNJLkzSKVFrojWaEse2GB108ibsWMs9RnT8SgwFN+ucctyHAXPHCQso3D4yCxxZJgy0KdMnlq5RM8ckUUQYznni7u/huRgsa4Uekwygoifu77tsI5IrcibTGmNTiCayq5xhe4k1dO29rQCbRVWhda0iHPK8YPM9z4hTHWiPu0M9wS6NO0YkgCZm/A7wMvA7tw/BV+zqbsgqfYY0POD57ZkXqs/GKopUzB1rpcova5pe9ld5wrXG3dRF6+/3fRn4N/tWIMan3fkYjwdqFA7WeVKfJ1cTZjYhEp22cwMs5EDOigbg/EBW8OrVUVLBfOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjBYqOxPzMQ6PN44J9JqiesbBqdhs2RlbyRaH2IK9Qc=;
 b=Qup2MrYJ49V1teph9YackDTNE9got3OuLH8BB+n/ACWttv0l5D2isI3vNenqWA2gvZBeL6LMVbZVRHzHVYYNYCf9QBFyYSgtDNCbSNLBRVJBhgz5twKH8MC/oktaNhTVJ3mqNRM3uWL/KQ/2wkEUW7XQ9Lzn0lYLqfqRnnrtGTL5clMudTNaNobd6e/OdNOZuP4brtq8+zYZPZ9c50oHnBU2IXqfMOgs+oNbOvLWzXCTe9PZsSUuYzybIwWWUwXeX55fDyJCLS9pmZAPPiWyOY6nYEdT4TcOZnkIybDnJkyLBdk6Nx9jANSiFaoo8M1KZ0ewY1BjpbY9nnOGzvxFXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjBYqOxPzMQ6PN44J9JqiesbBqdhs2RlbyRaH2IK9Qc=;
 b=UJDDvAZqMv+j9bXOIYBWIvLrVtx7FAq1FnzhgEUoFOVR7Iy/fs8+mqWjVyT0ZOEetVfp2yu2ftsQtyI7fVo96BFQ+wmmxOxwb3Cc8J28E3ltoMW5Xp2jO72secyUG/9Z/EKL4+u0JGrnzBG5UlT66d5T/oOaCDWO7Fq+OKLWxRE=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OSBPR01MB4165.jpnprd01.prod.outlook.com (2603:1096:604:4e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Mon, 5 Apr
 2021 23:46:35 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a19e:1848:1864:bd44]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a19e:1848:1864:bd44%4]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 23:46:35 +0000
From: "wangmy" <wangmy@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ell: upgrade 0.38 -> 0.39
Thread-Topic: [OE-core] [PATCH] ell: upgrade 0.38 -> 0.39
Thread-Index: AQHXJjlomblHwlZE7kuJzXSXYX71zKqldEQAgAEM1YCAAB4uwA==
Date: Mon, 5 Apr 2021 23:46:34 +0000
Message-ID: 
 <OSBPR01MB184599B3D496977F87A79F0FDC779@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1617200547-62088-1-git-send-email-wangmy@fujitsu.com>
 <1617200547-62088-4-git-send-email-wangmy@fujitsu.com>
 <CAMKF1so7TnQm5Ei6oyvFZHpGya8nKJAYunqP2Y1wgopR=OowVw@mail.gmail.com>
 <CAMKF1sqpB-CUzftKDjH32BZ3GnhMJvYLednKDFSVSSX7su0VMw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqpB-CUzftKDjH32BZ3GnhMJvYLednKDFSVSSX7su0VMw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04c1177b-b99b-4fd2-34b0-08d8f88d0c2c
x-ms-traffictypediagnostic: OSBPR01MB4165:
x-microsoft-antispam-prvs: 
 <OSBPR01MB4165E3FEFC160B73269CDBFEDC779@OSBPR01MB4165.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ge0YrfN3BIOCrCnp0/prb7vmr7ZJAcqBXnJqj0lQVThZ6vZANOX5aoupZOPHY5jc7AnN5o8cigtSvOGP66H5RLJw5BHQZOrleKH1c8IpYcgwzJ+OSagI3yH+QmFFLP51XIFeP+J8OzB1PA5kjuSoWvokiVXrLoiW1lDqhg8Jt/07NzB2LzNURW8RXCuqsqWoUmSQ5QZPYQaLnCHHABD9dmxGc+08G09VCG9cDMmsghrxJfboXBNuKFIw0nUZdyMzLl4xVQ6JS+MxgwLZykCNk3BP/LiXvVrIXLqA65gc+yBh8T+SiTP8vtcOCwI+W3G6xJhOVNwC+TQxVF/Z7PkAAhLPlRn3KlIQ8OxdgxuIE1CGjQeWf4zuCF5xEiitDiz0RZY3JZT7RxsP181q3YJlKfp2z7Lj3KSZX8rmDao0FXidXhlshXhjyMx+Ie1JTbGrGU4yZydchXNMsoOro0MUlYj4hvqjJG9f2itdX+azpUnUgWq66moFTSTorNEPgdLgncJizda7rl9gjZDCIyefXopoi0Vli/ZNRPoNlbidKpoisEZvEwNP2ogifwJgHwe6QWHjlHNLLGXZ9+k8rM6SexWaih3aArMDlDlOrXJ/647n7SJXdVmkzsh/SlWrUf19ltaUruf2oxmCAVZowdUOc8/2+nrzrq6nY3MGEstjKVmBULmhg1umSBwkO8ULgUYyqRMztd+pJax/ziynqgqg50Bg4Upa9ZU6aWTFULKKLzo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(316002)(86362001)(71200400001)(8676002)(9686003)(966005)(53546011)(26005)(33656002)(7696005)(83380400001)(4326008)(186003)(38100700001)(52536014)(8936002)(64756008)(66476007)(66446008)(66556008)(76116006)(55016002)(478600001)(6506007)(85182001)(2906002)(66946007)(5660300002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?aEczZCsrV1dFeW5BdDNPL01FeG5kZ3RlYUpGbGJ2Wjc3M2hoeGlLc1ZXMG1l?=
 =?utf-8?B?NmlwWGZKNUZVTXRwVk9RVFJSL05XV3A5ZTlONVk0bW5CQ0Q2c1Y2UktMQ3dp?=
 =?utf-8?B?YlI3aEhZTWl1QitmajQzK0ZYc2JNZ2VodXRsQW9obmVhdE45SEs3cktGTy9u?=
 =?utf-8?B?ZTdzaXlueHR2Z1dITGNqQS9lcUMzT0R5Umh5U0E3dHBNYU9TV05UOFAvaUtS?=
 =?utf-8?B?RCtBRm9lQ1E3NVpRaWM4elUzYTNsUS9LcE5mUmh6VjJxNGVlTTRaV2xTdVdh?=
 =?utf-8?B?SmVCdXlkTU1PbXY2azNveHRPbE14Y2VtRmtUcENOVWlGZEZUQmtFdEgyQ3Vh?=
 =?utf-8?B?N3NvSW1leUNQdzVtd3F6ZzUzVm9vd2kxbDZHTU0wc2dmbENEdW5Cc1R2OStO?=
 =?utf-8?B?MU5NY3ZhaGVBTlZHenA2YzhTa01yc1c0K0dsWlRkTGJXdFFVdS9PQTBJT1Rq?=
 =?utf-8?B?Rk5zMHF5OVlxcFJKOWVDNmRVVjVBRjlhVk84dzFwZzk5eDZuVHQxWTNnNmxq?=
 =?utf-8?B?ekpxTUNYVzlWRFhGQmJOK014T1RWV2NMUWJ4NlpWWnBLRzNXRjJVTUYzT3ZR?=
 =?utf-8?B?VDUxNTRyS1BnMytjUitrOGdzcXB3bXFLV3NLR1Arb09VU1JTazZDdDhTS05i?=
 =?utf-8?B?SHJBcDQxeVh6djVtUVJzSzB5Q3cwVzllOW5nMEZaQXdtaUNrbDhJOHpKSVZk?=
 =?utf-8?B?RVRBWmFjendnVXBnMCt6N0RPU1lMSHlpdG9tMFBJS2dxSFNWK1hCT2dRTDU4?=
 =?utf-8?B?NHM4WjVXb2s4MWdJWFk1RU8yMlA3WXh2OWxWZk5GU0JVUmVCMlArQkZBVGl2?=
 =?utf-8?B?QXlsNWpjRm12UnVzMFFyTy9OcHdLbm9hanJWd3ExeEYycXJIYXIwano0RUlq?=
 =?utf-8?B?dVJjWlJlQ0k3VFIvWFNkMEhvTTJNZFgxd3JkSmo3dUY5bXp1S3pMVWtVRmcx?=
 =?utf-8?B?ZndUdVZHU0xJMlhaR2I2T1VoVGc2aEVHbFNFeVJmKzR1N1pEOXRZekM4MVJO?=
 =?utf-8?B?bGFncEs2ck5wUEcvZEtnU3Y4c0NhWGE1ZDNtUlpqeHJFMjZrY0dlL3MyWkJn?=
 =?utf-8?B?QlRhZ25hZHpXdW04KzJUdmxRanpHQUtCalNDS3VBRzNzYnNWN2NvMmFzaHVJ?=
 =?utf-8?B?cldvV3g4MHVjcXZCNjIrZDJxeTNXcURNNnp3VXp1SjljVzRPUGQvWCsybkFx?=
 =?utf-8?B?YTNHWWppSzlDNXVla1RFWmhmNzJqUHJTM1pncEo5OXljVjJLc0UvTWlBUTB3?=
 =?utf-8?B?WGU0V0dSK0dzZ3JvMWVpZHVwVFZDME02U1hPRlduZWRid0d0MHpsMzUwUlBa?=
 =?utf-8?B?dlREanlGVTBnUzBSTHVXQ2tORHl3ZHQra0F3ZUN0ODJjUW1hR3BwVHBrVDFJ?=
 =?utf-8?B?L21EdG8rUHBSemNnRUtmdXZXMTNQZWNzYXJYdFBCYnFwalRocTdJVjFhVGJh?=
 =?utf-8?B?SmpBVWd2c3NTRjduN2tMZ2ZpdjZGRWZrbGlBaHJ1ZVlKYjg1U1h5NnQ2bDR6?=
 =?utf-8?B?L29QRE91ZTV5RlZJaEJsdlFlTXpNdDJJcTA2U3p3YUpZMVVBZjJFTnpEdXNY?=
 =?utf-8?B?Y2NuaFlIUWhxc3dRQmxoWXBzREkzUHlxZnd6MXk3UnpNRkpGaDZMQnVsOVJl?=
 =?utf-8?B?aVkzdDJHelhMREc1aGhqNHU3dysyaGx6MXN4QVplVSs1ZlloRWloSTFGOWRu?=
 =?utf-8?B?eGlKTThKTFhFZDJLWWxHbk1QeExJaUttS1dRVnpJK3dXdDJKNUZFb21zNnlk?=
 =?utf-8?Q?RejluNku9ntkSYOieM=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c1177b-b99b-4fd2-34b0-08d8f88d0c2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2021 23:46:35.0396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qMVVbUd7Tf1C8Wtiv5m4JqTpGMCTRplF87sj2PdhfWItBNAu6xcZQ5idkOJXFI8hEEOJh9VDMlA15Eu5WlVwxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4165
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U29ycnksIEkgdG9vayBhIGxvbmcgaG9saWRheSBhIGZldyBkYXlzIGFnbywgc28gSSBkaWRuJ3Qg
cmVzcG9uZCB0byB0aGUgZW1haWwgaW4gdGltZS4gDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9y
IHNvbHZpbmcgdGhpcyBwcm9ibGVtLiBJIHdpbGwgY29uc2lkZXIgaXdkIHdoZW4gSSB1cGdyYWRl
IGVsbCBpbiB0aGUgZnV0dXJlDQoNCsKgIC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkRldmVs
b3BtZW50IERlcHQuSQ0KTmFuamluZyBGdWppdHN1IE5hbmRhIFNvZnR3YXJlIFRlY2guIENvLiwg
THRkLihGTlNUKSBOby4gNiBXZW56aHUgUm9hZCwgTmFuamluZywgMjEwMDEyLCBDaGluYQ0KVEVM
OiArODYrMjUtODY2MzA1NjYtODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMx
NzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQpodHRwOi8vd3d3LmZ1aml0c3UuY29tL2Nu
L2Zuc3QvDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEtoZW0gUmFqDQo+IFNlbnQ6IFR1ZXNk
YXksIEFwcmlsIDYsIDIwMjEgNTo1OCBBTQ0KPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwg
PHdhbmdteUBmdWppdHN1LmNvbT4NCj4gQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0
IHRoZSBvZS1jb3JlIGxheWVyDQo+IDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gZWxsOiB1cGdyYWRlIDAu
MzggLT4gMC4zOQ0KPiANCj4gSSBoYXZlIHNlbnQgYSBwYXRjaCB0byBmaXggaXdkIGFzIHdlbGwu
IHNvIHdlIHNob3VsZCBiZSBnb29kIGV4Y2VwdCB0aGF0IHNhZGx5DQo+IHVwc3RyZWFtIGhhcyBp
bnRyb2R1Y2VkIG5lc3RlZCBmdW5jdGlvbnMgaW4gYm90aCBlbGwgYW5kIGl3ZCwgd2hpY2ggbWVh
bnMgd2UNCj4gY2FuIHVzZSBjbGFuZyB0byBjb21waWxlIHRoZW0gYW55bW9yZSA6KCwgSSB3aXNo
IGl0IHJlbWFpbmVkIHBvcnRhYmxlIGFzIGl0IHdhcy4NCj4gaG93ZXZlciB3aGVuIHlvdSB0b3Vj
aCBlbGwsIGl3ZCBpcyB0aWVkIHRvIGl0LCBzbyBhbHdheXMgc2VlIGlmIGl3ZCBpcyBvayB3aGVu
IGVsbCBpcw0KPiB1cGdyYWRlZC4NCj4gDQo+IE9uIFN1biwgQXByIDQsIDIwMjEgYXQgMTA6NTYg
UE0gS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBpd2QgZmFp
bHMgdG8gYnVpbGQgd2l0aCB0aGlzIHVwZ3JhZGUsIGl0cyBleHBlY3Rpbmcgc29tZSBidWx0IHNv
dXJjZXMNCj4gPiBmcm9tIGVsbCBhbmQgdGhleSBkb250IGV4aXN0LiBQbGVhc2UgdGFrZSBhIGxv
b2sNCj4gPg0KPiA+IGh0dHBzOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFp
bHMvNTc1NDQyLw0KPiA+DQo+ID4gZXZlbiAxLjEzIHVwZ3JhZGUgZmFpbHMsDQo+ID4NCj4gPiBP
biBXZWQsIE1hciAzMSwgMjAyMSBhdCA3OjIyIEFNIHdhbmdteSA8d2FuZ215QGZ1aml0c3UuY29t
PiB3cm90ZToNCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215
QGZ1aml0c3UuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tl
bGxfMC4zOC5iYiA9PiBlbGxfMC4zOS5iYn0gfCAyICstDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pICByZW5hbWUNCj4gPiA+IG1ldGEvcmVjaXBl
cy1jb3JlL2VsbC97ZWxsXzAuMzguYmIgPT4gZWxsXzAuMzkuYmJ9ICg5MCUpDQo+ID4gPg0KPiA+
ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC4zOC5iYg0KPiA+ID4g
Yi9tZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuMzkuYmINCj4gPiA+IHNpbWlsYXJpdHkgaW5k
ZXggOTAlDQo+ID4gPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuMzgu
YmIgcmVuYW1lIHRvDQo+ID4gPiBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuMzkuYmIgaW5k
ZXggN2QzYTMzOTk3OC4uNjhlYzRjYjRhNA0KPiA+ID4gMTAwNjQ0DQo+ID4gPiAtLS0gYS9tZXRh
L3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuMzguYmINCj4gPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL2VsbC9lbGxfMC4zOS5iYg0KPiA+ID4gQEAgLTE3LDcgKzE3LDcgQEAgaW5oZXJpdCBhdXRv
dG9vbHMgcGtnY29uZmlnICBTUkNfVVJJID0NCj4gPiA+ICJodHRwczovL21pcnJvcnMuZWRnZS5r
ZXJuZWwub3JnL3B1Yi9saW51eC9saWJzLyR7QlBOfS8ke0JQTn0tJHtQVn0udGFyLnh6IFwNCj4g
PiA+ICAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXBlbS5jLWRvLW5vdC11c2UtcmF3bWVtY2hyLnBh
dGNoIFwNCj4gPiA+ICAgICAgICAgICAgICINCj4gPiA+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0K
PiAiYzFiN2FlNTY3NmVlYzMxMGYwODc1N2IzZDg2NTJiOGU4MTg3NzZiZTE4OTdmYjVkZWI1OWU1
NWYwMmEwMTJhNyINCj4gPiA+ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiNjUzZTJlMTM5ZTIz
ZWQzMWUwM2M1NmMwNWYxNTMyMWE5ZTgxOGUyZGNhMDBhMzE1YzE4ZDJjN2I3MmYxNWQwOCINCj4g
PiA+DQo+ID4gPiAgZG9fY29uZmlndXJlX3ByZXBlbmQgKCkgew0KPiA+ID4gICAgICBta2RpciAt
cCAke1N9L2J1aWxkLWF1eA0KPiA+ID4gLS0NCj4gPiA+IDIuMjUuMQ0KPiA+ID4NCj4gPiA+DQo+
ID4gPg0KPiA+ID4NCg==
