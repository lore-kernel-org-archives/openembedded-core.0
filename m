Received: from esa8.fujitsucc.c3s2.iphmx.com (esa8.fujitsucc.c3s2.iphmx.com [68.232.159.88])
 by mx.groups.io with SMTP id smtpd.web08.3702.1616112224443806018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 17:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.onmicrosoft.com header.s=selector2-fujitsu-onmicrosoft-com header.b=Elc1QfWA;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.88, mailfrom: wangmy@fujitsu.com)
IronPort-SDR: HibpMVRzVOFu5v7QVqyTvygKDEY2M5tEqIo0uKqUOg0zQgk6vR8ZLzeyKEtqZjrd0oc2nqm+bY
 gsOcKcOkOcn/+4jhol4Rk7cLy8QufiBqE+E3nyOzS9382rcx0IC+sLnjpPQQVfrbm/h7Ruj94/
 2xqqbQEqu+Poue9eoh3DmFIuh9tggUj1GjU6hVGBqL9wtKiBThi+WF1ht/NcoX5cvmXBtusOVr
 q7L2q8CwerFONYZ15Z5JuG9AUITwhR2+UX9j9fW+Rn5U42ysKTHgonVVv9H0xPhv1InoWo4K28
 3h0=
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="28154695"
X-IronPort-AV: E=Sophos;i="5.81,259,1610377200"; 
   d="scan'208";a="28154695"
Received: from mail-os2jpn01lp2058.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.58])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 09:03:41 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcwWsNw7mpD3dJ+rhBlCjnZWqqrNE4YxZLReZzw8nIj7UgFOtMzwYdaBgRd/Z3kcYzEvOw86Zl0G+LHHhmdVleo8QYTY6uJePa1lpZ7Q3e0KQlZZZYYLRVdU9WaraYUHyHitpwn5fz40yWaoDJum3rivsR4DeW5SxfQVS67LA4uek3BQTOTW/pQSgUcP0AVCCUdfJyS9mxSYSZY7ORuL/GjpO1qA/wdJmKwDKH2dCEwW8TOX1rOCOLcuyadPP6+TFeWYG+Fxd92yw41+QYz8BzWuG9xG7/3cZfsTi6DvQPMG24X3U691haaWI1AUTVWyST4FHVj5WllO8oR+EHQZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWHVRdXTkEpwhFU8chvp6nTi3Gv6/DH0E+FOuiao9y4=;
 b=Y9TN5d7miXDCbiLU242zyKeJ3bireWr+RYtCNjFZtvRDl7MOzxD3kVSyboPHAK75MCBEHcqIALREJvfgNmh2P/SMWgo9Ur0pg3yYqnutDmfnj9zq2snyO2qral6bfFhM++9c8r4cb/6fZy5ovQkBPtnxsANxx4eoULRyYo3NR9EHqHcURToXQUS2waTu6BUGx2tXPIc8lqlF3FPAZbKPEdArP11NZbK3+V4SjtX0d9YdN04oaH1kL9Pw5mtOQtGJprYZ9aPhqeahMJMER0R90+HAh6/ep+9kDo8s5cnlIg6gDVZAImEOhmB8USw+vmdIa3ztVDgYKMyVjHZPVTJs9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWHVRdXTkEpwhFU8chvp6nTi3Gv6/DH0E+FOuiao9y4=;
 b=Elc1QfWArjBQJHlzD3+hJ37cbTbYbQqDrMcYZn5qB+TWVBHbs8+776M50L7oY1aWc4uhIPs1s+BjHitzvYhFx2jgGNSOWR3Q0xHITWW2KIYyg7LAkxwVtvtta6QbsKm0CTLLsSxEIHC0lglElD3F/l2104Lmvz+Bz+bEYrQzDWo=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OS0PR01MB6498.jpnprd01.prod.outlook.com (2603:1096:604:106::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 00:03:38 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a19e:1848:1864:bd44]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a19e:1848:1864:bd44%4]) with mapi id 15.20.3933.033; Fri, 19 Mar 2021
 00:03:38 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 8.4p1 -> 8.5p1
Thread-Topic: [OE-core] [PATCH] openssh: upgrade 8.4p1 -> 8.5p1
Thread-Index: AQHXGwkxnTH+FPdTck2M0saVgTg3E6qIGmCAgAEvAgCAAP22gIAAJ2hA
Date: Fri, 19 Mar 2021 00:03:38 +0000
Message-ID: 
 <OSBPR01MB1845649EA478FC756B4890C1DC689@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1615970397-22583-1-git-send-email-wangmy@cn.fujitsu.com>
	 <9e26a86873a0828bff2ce96a0ecfadc53a99d3f6.camel@linuxfoundation.org>
	 <OSBPR01MB18452F81CFCC79059919C38ADC699@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <68064030f43d8c490dad012568af8c5662085aa4.camel@linuxfoundation.org>
In-Reply-To: 
 <68064030f43d8c490dad012568af8c5662085aa4.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3f0e1a6-8a03-4ff1-1405-08d8ea6a72d5
x-ms-traffictypediagnostic: OS0PR01MB6498:
x-microsoft-antispam-prvs: 
 <OS0PR01MB6498F5785D164A982E3F92C0DC689@OS0PR01MB6498.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5OH8hVTVB9sP60WlBrpjy6q7hwW/uvLm/t9qD00Mx0z6NAvfcxV+sbafqIMdSKrY67MlU3T4458b0+F477vCLpeQrw8ZYTpWO4dxtA1dR2L6uikaxztg9XSW14Q5hFwximT4uzG/P0Y8cnqjoiPD7DLy4YcHYCSAzk0mmDvIHqZAJameVNtjYbfqFhWtr6neRoD0I2NGa+lPaaOCxUip5eh+kYbO987IkuRESDnvb1K/lrKaF+rkA4Vt1W2H0nV6s7Gg54wwuOnBLadClBokv5SnNikxeV3jT2HVUITWPG6hY0PAsZIzCQjnEi4Zgz2G/mTwysbmV7oNmjlwQWG+J3FoL82s+mEmRnsqcbxQn7hfBuxsmysTkHSATyS0PoB5r4MVhNTVObLVXGcNvGo8KJouyinYfzgUHdzYDb1NoET6Ks7Xn7Su6+uMDoY8D6vuydH+ghKMXYX9UxrGDrk5X7ysKqGczXpLwNYO1+w0mujOE/Zt5/7IxlBq9Gs7Bc+KulOfpx/tFESh/P4ZkjiUhdpkywTeX+8NTiXePr2TCcF4jm1zlvZBeon7BEJ1XwDrHlsF6dsFHDHbC0VXz8VE5m4FKfZVIpXH1ZsxyCdZMTOPlLqTW53QkE3KKUXbR/v/wprHV1zBkrZ3KUT/o9GjxhLxAYFxr+2Y3KGQYNUZ2AaOX0cd5+OlDvIEiPsMnDV031DXPcDgn7yaDPrR8mxyliLEq5m7h7PMAyXVJRfa/Yo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(26005)(8936002)(316002)(6506007)(38100700001)(478600001)(76116006)(8676002)(9686003)(71200400001)(55016002)(110136005)(53546011)(86362001)(33656002)(966005)(2906002)(66476007)(66946007)(66446008)(83380400001)(64756008)(66556008)(7696005)(186003)(5660300002)(52536014)(85182001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?V0J1ZWNiWklMZ1BPQ2hFaFR1a29laUxCdkdTRFJlS2EvREZObnk1RGVtVWJJ?=
 =?utf-8?B?QWlPaDBXTzR3SG9WaFZESlR3bXlzLzl5K29ZbEdwUGMrWkRqVEhYTjJyTXk1?=
 =?utf-8?B?azMrRWJsMytkbzhPalJOV0E1Rk95QVl2VStsakI3b1dxYzJUV2M2SmNOcWda?=
 =?utf-8?B?a1Y5OHM3ZGc2b0cyeHp1b1RGOFlrbWJ5T2E5VXhTalFaSDg3ZFhGUWZ1NmNJ?=
 =?utf-8?B?T1NnUS8yb1dzQVRMQzNJWkVxd0xTN2ptS3hKNzBtU0xHTC81MitnL2FFVnhS?=
 =?utf-8?B?WGF3QlI0dlBrcmhya24xY1RNUHczNjZsMWtCTDJPekpReXc3SEQ0SzN6bHly?=
 =?utf-8?B?dHV0WGtxMWliNlhZd2tuYmJYZFlKZU4xRnpvR0FXMWFkd09tWmJVVFJtZDlI?=
 =?utf-8?B?UUdWOU1aNXYxR3NLdTE3bmtmYTVXelgzWGJ2RHZtcXJjUDB2SnFHOGdvTGV5?=
 =?utf-8?B?VTJJaUxwS2hrQjdLb1NXcld5QVdzQ25wbEJqR04vU3hqNlhDMlF1NmlLZ2NM?=
 =?utf-8?B?K2xnZmdJUERjMHhlK2k0UGtaclZrR0VHVTJ0WlBST01VOXZxYmxmUUdGQzNZ?=
 =?utf-8?B?TmxCeEJBK3BhOE1oUDRzOU9wNVoxalF4amYvRm4za3dyZzZGYUcvdXVjNHpv?=
 =?utf-8?B?cUM3NmZpNXIxSWJpeG1JTHhMUjNITU9JaGY4SG5XZVl4RUVEMEM4K2FnNmNU?=
 =?utf-8?B?NFhXY2lMQ2NlQU1CSlY2dThwK3E4Z3R0THBIU2lGTUttTVJmTjIwY3RxTThP?=
 =?utf-8?B?K2loMWVPOUVQWVRjeDFVYnEzUEZYRW04T3ZsVWVHaDdVeG15ckFKWUY1c3Ir?=
 =?utf-8?B?Q3VPdGhhdUhVem4wdXJ2SDF0OExRNmYzMVJVNWFnTmNUeHFsUVd4WkE5aFZk?=
 =?utf-8?B?akxYQk1rTWFZNjRwMFRTTzVHb29kMlB0L0VWNlNKdVpLeHdVbDN0MGFMOHY4?=
 =?utf-8?B?MVcrd1pZZlJncUptR01vZnZKY1ZJVGlqMTBrakNyTFVUdXJQbTY0cnVlN0dL?=
 =?utf-8?B?ckZPZldSbVhRZ3dGak94ZU5Dd1VCdzNhWkZ6Z0FZSTNzakY1RHJ4cFUram5S?=
 =?utf-8?B?eHRYbG92T21EcHpFejhOT20vYlJSSk5NNlV4Y2g1ZW1QdFJPejRYTnZDR0k2?=
 =?utf-8?B?cVN0MWgxSUw4V2FDQWNTZFdQWmdNT0s4d1FwRkI4MHRPU2lkNEt0a1JzWWsz?=
 =?utf-8?B?bnQ1RnhJUzZod2tLZkFTYW5ZTVg5aUFGanNXT0k5ZDg3UlV3a3dCUzdxbXMw?=
 =?utf-8?B?bUZLay9EdEMvL0dBYlNwV2FCWDg3VnpYV2xTeURyZUUraktOQkNWb3pwODA5?=
 =?utf-8?B?US9zRUZ6RmtKSVg0NWxSaTdvSlY3REFVV2JXbFlDcnJQYmVBbGNldTFJZm92?=
 =?utf-8?B?M1A4VHJrL2l2cDhvVCt2Ty9DRVFpQWtGS2Z2dWxPRXo5cW5yZGlDVUlVWWN0?=
 =?utf-8?B?UUQxdTZTVjZUQXduRW13WmtZdnFQcmptYlZNd3RpWnRzMGowTHlyTUV4a2I1?=
 =?utf-8?B?YmFtVlFPMVMzcUpaTEdXakpuNDQrYlFkNEV1bkFqZFhzT0ppcG5iVnRHREFF?=
 =?utf-8?B?UVQ4SHpTaTJuelpEUG1kamhFa3ErL2RleG51ZnpvcFRuN3VJakU4dTRxckJj?=
 =?utf-8?B?N2ViT3hPUUpicDVyaHVITnNES3dlT0hxNWNnbG1jVitjeUJHVGhER2d0OFlx?=
 =?utf-8?B?QTdVMDA5M0d3UEN1cWZqZnFwK04ybzZZLzY4ajhJYXcxWHo1N2tBSnBzVmhO?=
 =?utf-8?Q?lItdbCCxcnNMRs9J7V4+3tZc+/o0Hw+mQ1P2v76?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f0e1a6-8a03-4ff1-1405-08d8ea6a72d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 00:03:38.6335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ykku8LIwffhIuqDSMc9fNwKRSXOxkhTMLQAXCMgazyiwQFg/S37EJmP0O7HzO0IzEsrrZJhCp05zQ5dolZSWcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6498
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBpbnRlbmQgdG8gbWFrZSB0aGUgZm9sbG93aW5nIGNoYW5nZXMgdG8gc3BlY2lmeSBCU0QsIGlz
IGl0IE9LPw0KDQpCZWZvcmU6DQpCU0QgJiBJU0MgJiBNSVQNCg0KQWZ0ZXI6DQpCU0QtMi1DbGF1
c2UgJiBCU0QtMy1DbGF1c2UgJiBCU0QtNC1DbGF1c2UgJiBCU0QgJiBJU0MgJiBNSVQNCg0KwqAg
LS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRGV2ZWxvcG1lbnQgRGVwdC5JDQpOYW5qaW5nIEZ1
aml0c3UgTmFuZGEgU29mdHdhcmUgVGVjaC4gQ28uLCBMdGQuKEZOU1QpIE5vLiA2IFdlbnpodSBS
b2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpURUw6ICs4NisyNS04NjYzMDU2Ni04NTY4DQpD
T0lOUzogNzk5ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRz
dS5jb20NCmh0dHA6Ly93d3cuZnVqaXRzdS5jb20vY24vZm5zdC8NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGlu
dXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogRnJpZGF5LCBNYXJjaCAxOSwgMjAyMSA1OjM1IEFN
DQo+IFRvOiBXYW5nLCBNaW5neXUv546LIOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29tPjsNCj4g
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtQQVRDSF0gb3BlbnNzaDogdXBncmFkZSA4LjRwMSAtPiA4LjVwMQ0KPiANCj4g
T24gVGh1LCAyMDIxLTAzLTE4IGF0IDA2OjI3ICswMDAwLCB3YW5nbXlAZnVqaXRzdS5jb20gd3Jv
dGU6DQo+ID4gPiBEb2Vzbid0IHRoYXQgbWVhbiB3ZSBzaG91bGQgY2xhcmlmeSAiQlNEIiBpbiB0
aGUgTElDRU5TRSBmaWVsZCB0aGVuPw0KPiA+DQo+ID4gSSB1c2Ugc3BkeC10b29sIHRvIGZpbmQg
b3V0IHRoZSBmb2xsb3dpbmcgbGljZW5zZXMuIERvIEkgbmVlZCB0byBjbGFyaWZ5IHRoZW0gYWxs
Og0KPiA+DQo+ID4gQlNEDQo+ID4gQlNELTItQ2xhdXNlDQo+ID4gQlNELTMtQ2xhdXNlDQo+ID4g
QlNELTQtQ2xhdXNlDQo+ID4gU1NILU9wZW5TU0gNCj4gPiBCZWVyd2FyZQ0KPiA+IE1JVA0KPiA+
IE1JVC1zdHlsZQ0KPiA+IElTQw0KPiANCj4gSSBmb3VuZCBpdCBoYXJkIHRvIGFuc3dlciB0aGlz
IHdpdGhvdXQga25vd2luZyB3aGF0IGhhZCBjaGFuZ2VkLiBJIHdlbnQgYW5kDQo+IGxvb2tlZCBh
dCB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBsaWNlbnNlIGZpbGUgaW4gOC40cDEgYW5kIDgu
NXAxIGFuZCB0aGUNCj4gZGlmZmVyZW5jZSBpcyBhbiBhbGdvcml0aG0gd2FzIHJlbW92ZWQgaW4g
OC41IGFuZCB0aGUgYXNzb2NpYXRlZCBsaWNlbnNlIHNlY3Rpb24NCj4gd2FzIGRyb3BwZWQuIFRo
aXMgZG9lc24ndCBjaGFuZ2UgdGhlIGxpY2Vuc2Ugc2l0dWF0aW9uIHNvIExJQ0VOU0UgaXMgdW5j
aGFuZ2VkLg0KPiANCj4gV2UgcHJvYmFibHkgZG8gc2VwYXJhdGVseSBuZWVkIHRvIHVwZGF0ZSBM
SUNFTlNFIHNvIHNob3cgdGhhdCBCU0QtMi1DbGF1c2UsDQo+IEJTRC0zLUNsYXVzZSBhbmQgQlNE
LTQtQ2xhdXNlIGFyZSBhbGwgcHJlc2VudC4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQN
Cj4gDQo+IA0KPiANCj4gDQo+IA0KPiANCg0K
