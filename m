Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.840.1627712554099754705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 23:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=vIjeyMCH;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="210100655"
X-IronPort-AV: E=Sophos;i="5.84,284,1620716400"; 
   d="scan'208";a="210100655"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2021 23:22:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,284,1620716400"; 
   d="scan'208";a="667553406"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jul 2021 23:22:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 30 Jul 2021 23:22:32 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 30 Jul 2021 23:22:31 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 30 Jul 2021 23:22:30 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 30 Jul 2021 23:22:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdTkUnG9TeaLXRJZ1L1On1chAFAVtxMuksVkuoChU1gLyXiHkKhg1CJR3Qr2zhR4WtWquH/Q5ga5mY0o/GBndGysj/UTrmvXp9PV7L6i5DJeT9EThlUZP3iabb2B+7hlxlIyPuXQ+menjcj3ZPkdo/0rLr7u3qSRnGnAPHPNxkkoDIWR2FyAtQq3zjxFiJwWlNnQhVdsmlRFrrwGaT2YJbHV1JkLlOs2KWd6vwQYNy+o0yC3QYaiKTf4EWaCacdwIiKfH2ZO22FKdj/NeAcGnTKxazk/z9NPLiomc0+pCM89u8kZtBit5lrYMHYS9Upxww1ga/vntTvkEljo85Rq5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7YlJWmqFClYyKfi/o/KegRU7/Rd3U/TwDn8ALdHENE=;
 b=Xxxu9vuCPjLxngDGES2BBjBihwxiW+dIXlYJixjHTd4tl128TBNWGTjsRMiHkFws/kYJAjOFVZAjHClRJvTpApl70oJIAk65rCHKzsB254miuF2UWQkImMTDlD7nocWovpd/qiAESZjroEJCLHSrlCruzHaQZAhQXegyGS9SFtCGXhFR9aqAArX6+YyPvz4cKvetyp/DaHSx72ar3niGwx2YTlbegPvnHp9X8MiJ+xVz2viIRr7ilmf3uFLEW8VwhRN5N7j2X48nu09wouluXlAbmtcRuWnYDXMcAWwGNcoPottEBuOj/XNEvhJz+B7jCC314ChBeubCzgFvMTOYKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7YlJWmqFClYyKfi/o/KegRU7/Rd3U/TwDn8ALdHENE=;
 b=vIjeyMCHzOUHIzPWykrk9PWbavFosicOO3MWC/cIsdO1ITQGm4hcoQe9oEqyEF5ROmjCTpn0f2anuHGMiw+TFAKfVm4lcoOEiMmFf4pz0mcS9a6mFp0MU0G0+KRW6uP7EDrojD2Oh353xo7jkW9tctyC/z81Tn21qsG8vc6OwGo=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB4008.namprd11.prod.outlook.com (2603:10b6:a03:186::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Sat, 31 Jul
 2021 06:22:26 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::91cb:cf5c:1dab:30cb]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::91cb:cf5c:1dab:30cb%8]) with mapi id 15.20.4373.025; Sat, 31 Jul 2021
 06:22:26 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "vinay.m.engg@gmail.com"
	<vinay.m.engg@gmail.com>
CC: "vinay.kumar@blackfigtech.com" <vinay.kumar@blackfigtech.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com"
	<umesh.kalappa0@gmail.com>
Subject: Re: [PATCH] glibc: Fix CVE-2021-33574
Thread-Topic: [PATCH] glibc: Fix CVE-2021-33574
Thread-Index: AQHXgxawSji6PA7od0qNHTC+CiAm3KtcoqwA
Date: Sat, 31 Jul 2021 06:22:26 +0000
Message-ID: <a3e9bd964546a48124dddfb13008e2bc1e467163.camel@intel.com>
References: <20210727183831.100545-1-vinay.m.engg@gmail.com>
In-Reply-To: <20210727183831.100545-1-vinay.m.engg@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9430f22e-ccf5-4dca-a4a9-08d953eb90ee
x-ms-traffictypediagnostic: BY5PR11MB4008:
x-microsoft-antispam-prvs: <BY5PR11MB4008BC3EDAF5EE0A3D8834C7F8ED9@BY5PR11MB4008.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:568;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S0XplJ41jO+7K4Rug912Pxz75oISCuxOyyW4sXwpDD4IaIoepXnh25siQtXOWrD4CegEmzzLwuXiu7Xavz0f25COr1Z2rNtx+CRdFtNbF/kzP2zs/Zt0KCA+XGwpURXWDZR6kwz/34qSeynp2zHTO4+wa58R0pssjLk2Lq00rKp56Hziu2qqiADE4/ALwKDJR2YBV0Ugua1Fzr6PTLJNPLCUF57DQFUBt1ewAGY3ACvbAnOnp+aBfZ82hhjMlnbn5eI6w2FGqHuN+7l7XrXZRqeCbDu6NjYOkZuJjsHC9g+cLS5QtLJOWzM24jjsrVxTbXtdkOSGTB8/m4vfGJxUt2iy+RDKYFHdsr6rUBnLustk8pIaD5EWSWRgifhOQnUeI49A0oIJQAT9zeqHcNVcs9Qr/YPCSa0l8wj7WMxEtdVRgpNnraO9Bw0tHUmexMy0WtHcWjvm7EvkQaHTjOi2jjIgCoJq461Rb9A+ptJGvEI9hmyc7W8BLkFnppq9vgZx2AhziblARbLxgdXBGtywYQYeZPhFvji4SGLqxmjqiPri95hKTZT4pnD2W92bZGAXJRldOKepbSaUCnR6ebFz4nhWta/9LJBIfQI8D3Y1AQAzZ8sPBlqopvLq0pkCvV/Wipad406PqJFHyFzgyNvgLzoneiaECEGibo9AnHJRKYNwVphoti/Lsp2Lwf3+aUW+jt+CUBC4oeaDrZZrfMu8Eeqql/ta3lwpxvyt4g/HKMrmDj57thNqukv2TxVKdBcJt4fjZwDzknBV210AH02byFz5oPiOIVa+loE/quFm5+e8EpJ+4BsoUHjC6Yo85jTv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(966005)(4326008)(86362001)(83380400001)(76116006)(6506007)(66446008)(64756008)(66476007)(66946007)(66556008)(91956017)(36756003)(5660300002)(186003)(2616005)(316002)(478600001)(6512007)(71200400001)(8936002)(8676002)(2906002)(6486002)(110136005)(54906003)(26005)(38100700002)(122000001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnBEendZVllwUG1zK0kvRHVyRDl2U1R3M3ZCTWtsYWhmdS9scWlrODBCNm5I?=
 =?utf-8?B?UGNnRFF2dnNzMW9HWHBSems2REJHZWlJZ3FIb2FhMGFucG1wTTBTc2gzcHdt?=
 =?utf-8?B?OGMwZ040QzNNejk0WFN5bnhHNlFsalZQVEFWdytpWHV2SVBDakc4eWk2cDVT?=
 =?utf-8?B?cWM0ZFZrVi8zWHBZVERUT1dDQmhvdFcrK1hHZWlxQTJ3bjZ5RE9oMkZHYmV1?=
 =?utf-8?B?aWRxamx1K1JBemI4c2Q2K2tWZkcwTURROW5CTTFQdHBncUh3ei83VVRLUEJk?=
 =?utf-8?B?dTZ1QW94VitXOWhFRDk2Qzc3ZFk5b2tCS295TEdqTU5xRE5wanl2ZHk2bFVK?=
 =?utf-8?B?UXBtUFNmblRZckc5WGU0UTIyL1B2NERUaGFaTEQvZktyaEgxVWFDZWlHRjNK?=
 =?utf-8?B?czNZRDRBUDgwSFJ1Z1FJdm5KWC9OK1c3ekZVK0F5RnZyYVBlbStHT25sZ2FE?=
 =?utf-8?B?OXNQQnlWUGN1bk1HQnJiYnIxTUI0Uy9rUGdFZjZmV0tuMFU3N2xORmovdUpz?=
 =?utf-8?B?R3I3dVFmek5TWjEzVmlMTUdEcDlua2xCNUkva29DYzVMbzJBVDlEN2FabStN?=
 =?utf-8?B?bEl6YUY2OEhCRmIxeStYNHB6aEdJN01xOXJGcjI0ZnN2eDFSRzVDTy8yS0k2?=
 =?utf-8?B?OUx1OHVVaWhpOWUycjRzWWRUTnZ6cVBTTVdqMHBMcTlHbS9VbEhFS3hpSVAr?=
 =?utf-8?B?MlV5UTZpUDhSUDFZMVJlNTRJWTNoeW9uUmw4Y3p1dElIK0NKODJVZDBXMm4x?=
 =?utf-8?B?N05VZVRkeUJrN3V4Rk1vb1RaSmg4d0dKYmpiTzh2dldSeFo5aytzVzdrRzRU?=
 =?utf-8?B?WWhTaG9hT3RZQnZwT2hXWVhqT2pXamZrckZqL1JsajladjlraXQ4ZmQyUGk2?=
 =?utf-8?B?anRRaEczSFdOQXFJQmVrQjFaODR0bWpyZTB2WG1Ld1ZFUWs0WkpQRjFmT21M?=
 =?utf-8?B?T2FKSm9Vand6QXNRTzloUTdIc2U5dWhnKzcyY3h4N1dNSExPSDdpeHRyZTNO?=
 =?utf-8?B?TmpVbDdCdHNTOTAyUm83S2VoR09kYnpvcXNINHcxNjZLN1FxaWtMdU93MEdC?=
 =?utf-8?B?OS9oSHp3SkJlNDBPUHIzQUNoOWFGK2phVlNlbytFSU9Qa1J1UmFxQjVyK3BF?=
 =?utf-8?B?OHY0OUlYQkZaa1Ira1NFdFBqMWluRkRWWDBXb1poWlJnOVQ4Q1hIdTZaeHpS?=
 =?utf-8?B?blgybGo4SUx3anU3clljc1JiRjhGNmRjTm5FTElhSytLQjA1UUtIOWVyS251?=
 =?utf-8?B?bEhSK3FYV1B4dTVUNXF5bU4zWmprdTFUV1lka2prRTNWQ3hERjdqZlc1ejZh?=
 =?utf-8?B?UUVVc3daam84S3VlMlprMzlwaFk3RlhhLzhXV2RTeDUwL0w0QVppTVVYdzZG?=
 =?utf-8?B?eDhIRmtBKzdTUWFibUsyQTZITmw2ZE5NbkVLUU9HV0thVjdSVythZVBkQ3VY?=
 =?utf-8?B?NEEvTE8wQTR6aTBmMGxLUERiVkdkYWdXa002V29Fa25xL1drd2JGeXNuMXJH?=
 =?utf-8?B?TnltNkx5Z1VWeHhwaUM5bzMxVzdTMkU1S3JwRVhISnBVK3NFdjh1S3ZZSW4z?=
 =?utf-8?B?TjAyTEJOU0pYbTUvSVR6bmZRWCtvdE1mOWRKQWZ5ZjBlZWQySU9hQnMxaFdR?=
 =?utf-8?B?TVQ1akRVMExrVGVoVGs1WDRQWkN1SVVFc0hmZmVrbDBPRVpWY1FkUVBPL01o?=
 =?utf-8?B?ei9FYTZYRHl5U2I5UGFORUo5UlZscmFJSFg5NG1GNlNicGV1S0lYa3cxWVd4?=
 =?utf-8?Q?jBY4xmujYRBeQIDVGzoXMLbH4pBK5oxkplDjqQp?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9430f22e-ccf5-4dca-a4a9-08d953eb90ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2021 06:22:26.2330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b/E8lSbxoDTTRdOzXImGChoU48MSjoDkla/m+ipdONtadPRwGVl1me1fYyLCBAQhgERu794NAZ/t4mBwCRacmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4008
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A6D3D9BE4B1834BA36E31AA3A394290@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIxLTA3LTI3IGF0IDExOjM4IC0wNzAwLCBWaW5heSBLdW1hciB3cm90ZToNCj4g
U291cmNlOiBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC9nbGliYy5naXQNCj4gVHJhY2tpbmcg
LS0gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9Mjc4OTYN
Cj4gDQo+IEJhY2twb3J0ZWQgdXBzdHJlYW0gY29tbWl0IDQyZDM1OTM1MDUxMDUwNmI4NzEwMWNm
NzcyMDJmZWZjYmZjNzkwY2IgdG8NCj4gZ2xpYmMtMi4zMyBzb3VyY2Ugd2l0aCBkZXBlbmRlbnQg
Y29tbWl0IGlkDQo+IDIxN2I2ZGMyOTgxNTZiZGIwZDZhZWE5ZWE5M2U3ZTM5NGE1ZmYwOTEuDQo+
IA0KPiBVcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0DQo+IFtodHRwczovL3NvdXJjZXdhcmUub3Jn
L2dpdC8/cD1nbGliYy5naXQ7YT1jb21taXQ7aD00MmQzNTkzNTA1MTA1MDZiODcxMDFjZjc3MjAy
ZmVmY2JmYzc5MGNiDQo+IF0NCg0KSXQgbG9va3MgbGlrZSB5b3UnZCBuZWVkIHRvIGJhY2twb3J0
IHRoaXMgb25lIHRvbzoNCg0KaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9Z2xpYmMuZ2l0
O2E9Y29tbWl0O2g9MjE3YjZkYzI5ODE1NmJkYjBkNmFlYTllYTkzZTdlMzk0YTVmZjA5MQ0KDQo/
DQoNClRoYW5rcywNCg0KQW51ag0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBWaW5heSBLdW1hciA8
dmluYXkubS5lbmdnQGdtYWlsLmNvbT4NCj4gLS0tDQo+IMKgLi4uL2dsaWJjL2dsaWJjL0NWRS0y
MDIxLTMzNTc0LnBhdGNowqDCoMKgwqDCoMKgwqDCoMKgIHwgNjEgKysrKysrKysrKysrKysrKysr
Kw0KPiDCoG1ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuMzMuYmLCoMKgwqDCoMKgwqDC
oMKgIHzCoCAxICsNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykNCj4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMvQ1ZFLTIwMjEt
MzM1NzQucGF0Y2gNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9n
bGliYy9DVkUtMjAyMS0zMzU3NC5wYXRjaA0KPiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2ds
aWJjL0NWRS0yMDIxLTMzNTc0LnBhdGNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4
IDAwMDAwMDAwMDAuLmZkNzNiMjNjODgNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliYy9nbGliYy9DVkUtMjAyMS0zMzU3NC5wYXRjaA0KPiBAQCAtMCwwICsx
LDYxIEBADQo+ICtGcm9tIDQyZDM1OTM1MDUxMDUwNmI4NzEwMWNmNzcyMDJmZWZjYmZjNzkwY2Ig
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQo+ICtGcm9tOiBBbmRyZWFzIFNjaHdhYiA8c2Nod2Fi
QGxpbnV4LW02OGsub3JnPg0KPiArRGF0ZTogVGh1LCAyNyBNYXkgMjAyMSAxMjo0OTo0NyArMDIw
MA0KPiArU3ViamVjdDogW1BBVENIXSBVc2UgX19wdGhyZWFkX2F0dHJfY29weSBpbiBtcV9ub3Rp
ZnkgKGJ1ZyAyNzg5NikNCj4gKw0KPiArTWFrZSBhIGRlZXAgY29weSBvZiB0aGUgcHRocmVhZCBh
dHRyaWJ1dGUgb2JqZWN0IHRvIHJlbW92ZSBhIHBvdGVudGlhbA0KPiArdXNlLWFmdGVyLWZyZWUg
aXNzdWUuDQo+ICsNCj4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQNCj4gW2h0dHBzOi8vc291
cmNld2FyZS5vcmcvZ2l0Lz9wPWdsaWJjLmdpdDthPWNvbW1pdDtoPTQyZDM1OTM1MDUxMDUwNmI4
NzEwMWNmNzcyMDJmZWZjYmZjNzkwY2INCj4gXQ0KPiArQ1ZFOiBDVkUtMjAyMS0zMzU3NA0KPiAr
U2lnbmVkLW9mZi1ieTogVmluYXkgS3VtYXIgPHZpbmF5Lm0uZW5nZ0BnbWFpbC5jb20+DQo+ICst
LS0NCj4gK2RpZmYgLS1naXQgYS9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC9tcV9ub3RpZnkuYw0K
PiBiL3N5c2RlcHMvdW5peC9zeXN2L2xpbnV4L21xX25vdGlmeS5jDQo+ICtpbmRleCBjYzU3NWEw
Y2RkOC4uNmY0NmQyOWQxZGMgMTAwNjQ0DQo+ICstLS0gYS9zeXNkZXBzL3VuaXgvc3lzdi9saW51
eC9tcV9ub3RpZnkuYw0KPiArKysrIGIvc3lzZGVwcy91bml4L3N5c3YvbGludXgvbXFfbm90aWZ5
LmMNCj4gK0BAIC0xMzMsOCArMTMzLDExIEBAIGhlbHBlcl90aHJlYWQgKHZvaWQgKmFyZykNCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgICh2b2lkKSBfX3B0aHJlYWRfYmFycmllcl93YWl0ICgmbm90
aWZ5X2JhcnJpZXIpOw0KPiArwqDCoMKgwqDCoMKgwqB9DQo+ICvCoMKgwqDCoMKgwqAgZWxzZSBp
ZiAoZGF0YS5yYXdbTk9USUZZX0NPT0tJRV9MRU4gLSAxXSA9PSBOT1RJRllfUkVNT1ZFRCkNCj4g
Ky3CoMKgwqDCoMKgwqAvKiBUaGUgb25seSBzdGF0ZSB3ZSBrZWVwIGlzIHRoZSBjb3B5IG9mIHRo
ZSB0aHJlYWQNCj4gYXR0cmlidXRlcy7CoCAqLw0KPiArLcKgwqDCoMKgwqDCoGZyZWUgKGRhdGEu
YXR0cik7DQo+ICsrwqDCoMKgwqDCoMKgew0KPiArK8KgwqDCoMKgwqDCoMKgIC8qIFRoZSBvbmx5
IHN0YXRlIHdlIGtlZXAgaXMgdGhlIGNvcHkgb2YgdGhlIHRocmVhZA0KPiBhdHRyaWJ1dGVzLsKg
ICovDQo+ICsrwqDCoMKgwqDCoMKgwqAgcHRocmVhZF9hdHRyX2Rlc3Ryb3kgKGRhdGEuYXR0cik7
DQo+ICsrwqDCoMKgwqDCoMKgwqAgZnJlZSAoZGF0YS5hdHRyKTsNCj4gKyvCoMKgwqDCoMKgwqB9
DQo+ICvCoMKgwqDCoCB9DQo+ICvCoMKgIHJldHVybiBOVUxMOw0KPiArIH0NCj4gK0BAIC0yNTUs
OCArMjU4LDE0IEBAIG1xX25vdGlmeSAobXFkX3QgbXFkZXMsIGNvbnN0IHN0cnVjdCBzaWdldmVu
dA0KPiAqbm90aWZpY2F0aW9uKQ0KPiArwqDCoMKgwqDCoMKgIGlmIChkYXRhLmF0dHIgPT0gTlVM
TCkNCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIC0xOw0KPiArIA0KPiArLcKgwqDCoMKgwqAgbWVt
Y3B5IChkYXRhLmF0dHIsIG5vdGlmaWNhdGlvbi0+c2lnZXZfbm90aWZ5X2F0dHJpYnV0ZXMsDQo+
ICstwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplb2YgKHB0aHJlYWRfYXR0cl90KSk7DQo+ICsr
wqDCoMKgwqDCoCBpbnQgcmV0ID0gX19wdGhyZWFkX2F0dHJfY29weSAoZGF0YS5hdHRyLA0KPiAr
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG5vdGlmaWNhdGlvbi0NCj4gPnNpZ2V2X25vdGlmeV9hdHRyaWJ1dGVzKTsN
Cj4gKyvCoMKgwqDCoMKgIGlmIChyZXQgIT0gMCkNCj4gKyvCoMKgwqDCoMKgwqB7DQo+ICsrwqDC
oMKgwqDCoMKgwqAgZnJlZSAoZGF0YS5hdHRyKTsNCj4gKyvCoMKgwqDCoMKgwqDCoCBfX3NldF9l
cnJubyAocmV0KTsNCj4gKyvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLTE7DQo+ICsrwqDCoMKgwqDC
oMKgfQ0KPiArwqDCoMKgwqAgfQ0KPiArIA0KPiArwqDCoCAvKiBDb25zdHJ1Y3QgdGhlIG5ldyBy
ZXF1ZXN0LsKgICovDQo+ICtAQCAtMjY5LDggKzI3OCwxMSBAQCBtcV9ub3RpZnkgKG1xZF90IG1x
ZGVzLCBjb25zdCBzdHJ1Y3Qgc2lnZXZlbnQNCj4gKm5vdGlmaWNhdGlvbikNCj4gK8KgwqAgaW50
IHJldHZhbCA9IElOTElORV9TWVNDQUxMIChtcV9ub3RpZnksIDIsIG1xZGVzLCAmc2UpOw0KPiAr
IA0KPiArwqDCoCAvKiBJZiBpdCBmYWlsZWQsIGZyZWUgdGhlIGFsbG9jYXRlZCBtZW1vcnkuwqAg
Ki8NCj4gKy3CoCBpZiAoX19nbGliY191bmxpa2VseSAocmV0dmFsICE9IDApKQ0KPiArLcKgwqDC
oCBmcmVlIChkYXRhLmF0dHIpOw0KPiArK8KgIGlmIChyZXR2YWwgIT0gMCAmJiBkYXRhLmF0dHIg
IT0gTlVMTCkNCj4gKyvCoMKgwqAgew0KPiArK8KgwqDCoMKgwqAgcHRocmVhZF9hdHRyX2Rlc3Ry
b3kgKGRhdGEuYXR0cik7DQo+ICsrwqDCoMKgwqDCoCBmcmVlIChkYXRhLmF0dHIpOw0KPiArK8Kg
wqDCoCB9DQo+ICsgDQo+ICvCoMKgIHJldHVybiByZXR2YWw7DQo+ICsgfQ0KPiBkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4zMy5iYiBiL21ldGEvcmVjaXBlcy0N
Cj4gY29yZS9nbGliYy9nbGliY18yLjMzLmJiDQo+IGluZGV4IDkyNWVmZThjYzYuLmU5ZjAxYTE0
YzUgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuMzMuYmIN
Cj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4zMy5iYg0KPiBAQCAtNTcs
NiArNTcsNyBAQCBTUkNfVVJJID3CoA0KPiAiJHtHTElCQ19HSVRfVVJJfTticmFuY2g9JHtTUkNC
UkFOQ0h9O25hbWU9Z2xpYmMgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+IGZpbGU6Ly8w
MDI5LXdvcmRzaXplLmgtVW5pZnktdGhlLWhlYWRlci1iZXR3ZWVuLWFybS1hbmQtYWFyY2g2NC5w
YXRjaMKgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+IGZpbGU6Ly8wMDMwLXBvd2VycGMt
RG8tbm90LWFzay1jb21waWxlci1mb3ItZmluZGluZy1hcmNoLnBhdGNowqBcDQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZmlsZTovL210ZS1iYWNrcG9ydHMucGF0Y2jCoFwNCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgIGZpbGU6Ly9DVkUtMjAyMS0zMzU3NC5wYXRjaMKgXA0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICINCj4gwqBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiDCoEIgPSAiJHtXT1JL
RElSfS9idWlsZC0ke1RBUkdFVF9TWVN9Ig0KDQo=
