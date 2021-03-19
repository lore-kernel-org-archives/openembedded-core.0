Received: from esa18.fujitsucc.c3s2.iphmx.com (esa18.fujitsucc.c3s2.iphmx.com [216.71.158.38])
 by mx.groups.io with SMTP id smtpd.web08.335.1616116985786343072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 18:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.onmicrosoft.com header.s=selector2-fujitsu-onmicrosoft-com header.b=fwjZOQHw;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.38, mailfrom: wangmy@fujitsu.com)
IronPort-SDR: NsW7k1drjNbEXmRvG2FK7xm+/s0q0WGtWKvEawhqOVA4gzN6ooziSrdfiuZ1mj4y1d9pVdWsCj
 6rSuww7tx3uTt1naKPsrWdDIdmwBH5NnXRRTACfvSrecpWBM521379HLgWnLniX/2KMa7fm/8t
 9vzjtSTt5ot26/fQCAeVwt01HQ5zi3pI2sWzoN9XtUJ0tXDEAtoszPM8saChhnFkxj48/5IUit
 86cbk/czE2uzTTjjv3Cluo0rMqUvkfK+2Qkz/gsCBaPLOr4PgAn52hJo4VRm+IaB6oHI6kcEJx
 m4E=
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="28491355"
X-IronPort-AV: E=Sophos;i="5.81,259,1610377200"; 
   d="scan'208";a="28491355"
Received: from mail-ty1jpn01lp2051.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.51])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2021 10:23:03 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFVSutlpUQEHY7Ym35bh3GtWI34lmh+wL5yxqaiAU9ZWemEUgDrkaDTevg9FsHAgT4fjlWbNXHRtsBNg123sifO+XFermqpDo7S29rkX9FwQ76QWVAiw35yxBCJfeCBNzBgOWQuy8n15fgP/6vT3R5ffk9YhSdNYkWW41nIAzqbAYQ190brvCyyFHDipb5idTLB8B6ianxVMKOOo5vm5GakeYHcPaD+xwqDl3sjjFQdE/+kiiYxHQ0YA+d5YxAZ25WAakcX/41688vqRSsE4fR+wbmdfR6xSOFwJ9NhZ0SbgPJO6gUeTGfD/jdxfi4VwxUIqmgU5qxEMYhWwh4ZBfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9bqYsxZcGtvrV/IQG9GHJMH8dow848o4SIxvEslA1o=;
 b=DDponxyL55Yf+t9ON4V8vV01p1yDvvJ7oIPX4d5ligaMkkj1XgHW1rPknCC6FL8qv1d2HfUd02oW2q1gMNvGHMwMbxnywzuYqArqCcr89nWoYZ2xtzrBr7ha55wc/hR8EhzG/R9NRbLfT3EWuA5yi5pD/8c9PNW+hJpTixBhqaqFy+wUZwcM25G/kZXuMGcJR9j64ha5QXQZdl8a66u9wOQlG9Oi1q58nFT811PhICvIura20vasAYchjJr4auRICm6FYXSIPEkKhTESg4xIAfkbv/XwTjL6VNgoPDinjrUHEfbf+3r3XkqdcIpi67I8o71CWjhJCiJEHC+BR7piaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9bqYsxZcGtvrV/IQG9GHJMH8dow848o4SIxvEslA1o=;
 b=fwjZOQHwiHAaAaFbxeAnor3wCZOZytQw6taUudxQEpAVg8tUVhik1/Yb2jDgeU3JGeToWKZmJInnEd8kdBGBdH+axjTJBv7KFwtVRsA7XkIisj3PEtojhHIKetr2jjqjcjpT56/UBUUxQ5OOzB/RTwFCur3fp6s50lCALZDRbOI=
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com (2603:1096:603:5::13)
 by OS0PR01MB6019.jpnprd01.prod.outlook.com (2603:1096:604:c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 01:23:00 +0000
Received: from OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a19e:1848:1864:bd44]) by OSBPR01MB1845.jpnprd01.prod.outlook.com
 ([fe80::a19e:1848:1864:bd44%4]) with mapi id 15.20.3933.033; Fri, 19 Mar 2021
 01:23:00 +0000
From: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 8.4p1 -> 8.5p1
Thread-Topic: [OE-core] [PATCH] openssh: upgrade 8.4p1 -> 8.5p1
Thread-Index: 
 AQHXGwkxnTH+FPdTck2M0saVgTg3E6qIGmCAgAEvAgCAAP22gIAAJ2hAgAAD3YCAABL0UA==
Date: Fri, 19 Mar 2021 01:23:00 +0000
Message-ID: 
 <OSBPR01MB1845A2D042567562800D9C5EDC689@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1615970397-22583-1-git-send-email-wangmy@cn.fujitsu.com>
	 <9e26a86873a0828bff2ce96a0ecfadc53a99d3f6.camel@linuxfoundation.org>
	 <OSBPR01MB18452F81CFCC79059919C38ADC699@OSBPR01MB1845.jpnprd01.prod.outlook.com>
	 <68064030f43d8c490dad012568af8c5662085aa4.camel@linuxfoundation.org>
	 <OSBPR01MB1845649EA478FC756B4890C1DC689@OSBPR01MB1845.jpnprd01.prod.outlook.com>
 <0e6c640aef43ca95e19962068023b57cfc061479.camel@linuxfoundation.org>
In-Reply-To: 
 <0e6c640aef43ca95e19962068023b57cfc061479.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef50fe92-87a3-4703-d65d-08d8ea7588eb
x-ms-traffictypediagnostic: OS0PR01MB6019:
x-microsoft-antispam-prvs: 
 <OS0PR01MB6019B40D8C758FFA46143587DC689@OS0PR01MB6019.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Hjy/bk8EfsbJX3o2SaQerykHA3ha7C4URnRIwilXy3skuCgpiOw1sdzkaYZm4ffMrbvoh9S7PIoNW/P3ZpTSkTbukpPRRPsYxwQaUqVwwgLVdQ3UUerh0TQKg26dvJkUDjrwneT7h3ZHTAv54bt8tTtBIEDiEb/y1tlqtI/v5BT0GOY4d1V9GVjSluDb/zXZqZn+1VPnyrN0k+HsOfuyWIXuaPtC5Fkj7pa9QKvDIR8i/nLVpHsKSemh/otR+nY+32AFpKqXfiqQs4BUNTCKq/qKv5wshu5qIvvt6igUPh3VzvJBTqjsL50xVRaJd8KpnMLpmR8xUcd3JhOmNKsDZhV+gRWZrt/nYiJ8vBkbojh4lSr0jpKowYY0zAoEAoU2yNog6rdPpfaWfmsYcdGlM2jxe5cltnN0FvBA8dqzCmOvcduwxIC+b51dQQfHb8uNDTg38qFnVvw8IiBqdMjzLIUrl3FnUDFKwEvwn1Ot/Ffwbj25pJXcjR2FGNFbPwFxu3Xgivey1qj0mF4AUtrAJ03QRJofcKcPZ2x/g5PVbd6y/Rj/KxnlQczrc7Dt+hjfcPHIj1BKpwyjyFBlEvVsYpFs5JhLgo+nbiQY6YbmznafDN9Cpv+gth6ENEmbb/jgMD5EuEZY0BpJVN4QnS5/+N+RAOy7UJZKt4ABVsIUAmc53/PKMYKgYJmo6EDyRro0Zi0eCzNBn815+dqPdcprIVLc95s54M85O3Et5wMn3jgrIM2CmyFdIQizEFFG2FKh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1845.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(66556008)(478600001)(66446008)(52536014)(76116006)(86362001)(38100700001)(85182001)(53546011)(6506007)(8936002)(316002)(5660300002)(55016002)(26005)(33656002)(7696005)(66946007)(8676002)(64756008)(66476007)(186003)(9686003)(71200400001)(966005)(2906002)(110136005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?aVZONWFPYjliN1NUdW84NGx1bWxtaDBtYzRsd1pFWFFKZ3gxRzk5ZzBwblEx?=
 =?utf-8?B?Qk1FbFlnVXIwUC9MOWF0aFZ3NE1EN2JNdlB5Zi9PUXlyUGRrbGhZYktVM3J6?=
 =?utf-8?B?Vm9md3oyRjFLTk1OdkJMUVFIWkx0WHV4UWpoREs1KzRXS2dRcUxxSjFLbitm?=
 =?utf-8?B?QjVPOWc3K0JIV2xFVjM1ek9QWXBWb0tsTUV3QS9MOVdlc0dHMFBuR3ZWRHRN?=
 =?utf-8?B?b2kzL09qc2ZOUDZLNk9mT1VWK0JzNFJYVitpR0xQTldwT2NKYU9oeUJ0ZmxE?=
 =?utf-8?B?R2VFWjdlcHRHNFFoVllQTW51NGp4ZjJFTXcxNkxwVFJTQjRKRkZyZzNUYkhE?=
 =?utf-8?B?UGpmUGtuaXUwRktmb3JvTUUwZ1d5ZnhxbXJWT2gvYit1Z1pWZU56WDRhK0pI?=
 =?utf-8?B?Z3VDR01QSzZHdWRWOStZUUhUQlRVT25qZzhkbHlUcjVKZjZBREZ0enAyekU3?=
 =?utf-8?B?UXN4MFlnblUxd0NaVTlYQ3pFZ2tUQVV1NkxvT2ovaHlGTEM2M0t1ZVIyTXZa?=
 =?utf-8?B?MlJBeXY4SzVTVkZHbVNycUVSMlZCWHY5UFd2b3Q2dEU5REVna0MyejRZdUwz?=
 =?utf-8?B?YUEvdUxiajR6VkZOY2QzTEROeU9VSTB5WTN6L3BiUnlLdUIzdGFTVWc1YnQ4?=
 =?utf-8?B?WUd3R0tyUTZaVklTRjk3ZDNIYmwydzErRDgvUndnSkpBVlBQUFpmYjJOZHlz?=
 =?utf-8?B?aVhMSHF2V3FVTUUzWkJBamJtM2Q4czFyUnQyQTh4dDhtRjlBc0tjVEQ5Y1hr?=
 =?utf-8?B?RVFMbjJTM2dydHhkc1Z5N0dLSmYvMG8xOWE2ZkdwMTlPMEpDSTZaZUI2MC82?=
 =?utf-8?B?RWFvN2tiRlB2QlpmLzl5T1phN3FDWVFHbHRlZitHQXFNQ0JqRXRiOGxta3Jn?=
 =?utf-8?B?VEFFZStFSG95RzR1WkpPS2szOWlyM2ltZDJtNWJCNDFDc2lScWRUbjhDVzBY?=
 =?utf-8?B?V3NZbklVUmpVeVQ1UTU1Ny9ERnZoeXZFWEZraDhBNytEZUdnYlZFQmw0c1cr?=
 =?utf-8?B?dUVHSitHcUl1SWJPK3YxZ2VXWGRiZGFvdGVkdTMyTDh5VndJWGh2eElUZTMw?=
 =?utf-8?B?emJBZGhUUXorRUV4NkJuSlIrQjEwSml1MTFpL1dXZWdlZE1qZnQ3L0gwazk4?=
 =?utf-8?B?U0llTzArWDBwMFdLZHVUUU12R2JRb0N3YXg0Tm81QXhESUR6RS9IMFhnYVlM?=
 =?utf-8?B?RitjRUZMT29PQXV3STh5MldyMWJzb0ZPaDFrdHlrU2xXeFBsRExFVkdwNjNw?=
 =?utf-8?B?TENkRktlbVFSb1BUb2NaWlZjQkkzVkgvb0xtSStoUktYcUpzTWtERHp4QmtM?=
 =?utf-8?B?V2R4VVl0QlJOR2NTdUhUclF0TVNhSGxvRkhpd1BHSGNKVTlmN21iUVBZK08w?=
 =?utf-8?B?K0J3RVdRY0V4eUN0TUdhRDkwTXpoVGd4QXdrRXUweTV4QnpWcTRtY0N5QlFk?=
 =?utf-8?B?c1g4Q1lMQm9WalE1SEFlcG1WS2xVVTJCZFZZVnBqd2F6RHZqYmw5cFYwbmhV?=
 =?utf-8?B?K2NNSDZsUTh2SVNsWkVJQ0ZwOUZEaW5OQitJdzF1d1FTY01CMXlWMkkybDN1?=
 =?utf-8?B?ZWNpMzNFaThBbWZJZFhqbjcvVEJpRlVQdnp4Q0dvbElHSDlCMmRtRGhuS012?=
 =?utf-8?B?UkFGVUhLWUNKOWZ3dU9pc1B0OERtSk52dHhIU2s4UERwWHhOeit3eGRJQ1h5?=
 =?utf-8?B?M1E5RUNBYWRZRm1XdmE3TllkRVMzcmU0cGNzVUdFakdKbzU0YTFaaFNlYTYy?=
 =?utf-8?Q?B0FLllTEUVRkdCS4iHkjVtm+HlkLWiay4kG5MQp?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1845.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef50fe92-87a3-4703-d65d-08d8ea7588eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 01:23:00.1156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IyixXER74R9yWpJIj6nSES1Xf2tlICMEU5fxd/DBs8B3AbKIdAD9+u/FCoIlnwfbI5ymbLlPEsZzjFKaUYFirA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6019
Content-Language: zh-CN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBhbSBnb2luZyB0byBtYWtlIGEgcGF0Y2ggZ3JvdXAuDQpUaGUgZmlyc3QgcGF0Y2ggd2lsbCB1
cGRhdGUgdGhlIHZlcnNpb24gb2Ygb3BlbnNzaCwgDQp0aGUgc2Vjb25kIG9uZSB3aWxsIHVwZGF0
ZSBMSUNFTlNFIHNvIHNob3cgdGhhdCBCU0QtMi1DbGF1c2UsIEJTRC0zLUNsYXVzZSBhbmQgQlNE
LTQtQ2xhdXNlIGFuZCBleHBsYWluIHRoZSByZWFzb24gZm9yIHRoZSBtb2RpZmljYXRpb24uIA0K
SXMgaXQgT0s/DQoNCk9yLCBtYWtlIHRoZSB2ZXJzaW9uIHVwZGF0ZSB0b2dldGhlciB3aXRoIHRo
ZSBjaGFuZ2Ugb2YgbGljZW5zZS4NCg0KwqAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRGV2
ZWxvcG1lbnQgRGVwdC5JDQpOYW5qaW5nIEZ1aml0c3UgTmFuZGEgU29mdHdhcmUgVGVjaC4gQ28u
LCBMdGQuKEZOU1QpIE5vLiA2IFdlbnpodSBSb2FkLCBOYW5qaW5nLCAyMTAwMTIsIENoaW5hDQpU
RUw6ICs4NisyNS04NjYzMDU2Ni04NTY4DQpDT0lOUzogNzk5ODg1NDgNCkZBWDogKzg2KzI1LTgz
MzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20NCmh0dHA6Ly93d3cuZnVqaXRzdS5jb20v
Y24vZm5zdC8NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gU2Vu
dDogRnJpZGF5LCBNYXJjaCAxOSwgMjAyMSA4OjEwIEFNDQo+IFRvOiBXYW5nLCBNaW5neXUv546L
IOm4o+eRnCA8d2FuZ215QGZ1aml0c3UuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gb3BlbnNz
aDogdXBncmFkZSA4LjRwMSAtPiA4LjVwMQ0KPiANCj4gT24gRnJpLCAyMDIxLTAzLTE5IGF0IDAw
OjAzICswMDAwLCB3YW5nbXlAZnVqaXRzdS5jb20gd3JvdGU6DQo+ID4gSSBpbnRlbmQgdG8gbWFr
ZSB0aGUgZm9sbG93aW5nIGNoYW5nZXMgdG8gc3BlY2lmeSBCU0QsIGlzIGl0IE9LPw0KPiA+DQo+
ID4gQmVmb3JlOg0KPiA+IEJTRCAmIElTQyAmIE1JVA0KPiA+DQo+ID4gQWZ0ZXI6DQo+ID4gQlNE
LTItQ2xhdXNlICYgQlNELTMtQ2xhdXNlICYgQlNELTQtQ2xhdXNlICYgQlNEICYgSVNDICYgTUlU
DQo+IA0KPiBZZXMsIGFzIGEgc2VwYXJhdGUgY2hhbmdlIHRvIHRoZSB2ZXJzaW9uIHVwZ3JhZGUg
d2hpY2ggbmVlZHMgYW1lbmRpbmcgdG8NCj4gZXhwbGFpbiB0aGUgbGljZW5zZSBjaGFuZ2UuDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCg==
