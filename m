Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.465.1616092284677507395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Mar 2021 11:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=iDcNWOYP;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: iVR382Wn1HDlKwqNDFGaPtg/UwxlaTYthekbfu3CtSLQ9/mqoHsurjxovYx9GqbA4Hq+6T1RDa
 u306cSgORWng==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="189787375"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="scan'208";a="189787375"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2021 11:31:23 -0700
IronPort-SDR: Ss+aIYeaHaRk23bONaTQwBxREmseR40Dor0Bwbvyo+ctazvD5jlqENjNRTpcu123KeQi5FruvH
 RPRQs/eXzNHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; 
   d="scan'208";a="412001699"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga007.jf.intel.com with ESMTP; 18 Mar 2021 11:31:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 11:31:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 18 Mar 2021 11:31:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 18 Mar 2021 11:31:19 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (104.47.38.56) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 18 Mar 2021 11:31:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7JFPkH8w4c+3MRhM5Bcda/9Q2CAAqApTo20jKyKOCChJCEdBR6GXWNSLc16lx/aFZFPlfEAhq6eUSRPWYzWg+oDHDeUyTv8h9CmHb4ZNDdHVNuppQ7Qo+pmaUr5oK8rdRe4iCupNPQHeJti+qKqm+m9yXifdf0SKwrcWR/oNrdtPXjnLvmtamn7TYrvGgB8/6n9VDZT6IBScF2FGMV31NGEgDm3JgC2FoqCmLyxQIH8gcobbg7gHo6P1nKd4G9YdMKs1Rjq2AI1grxyxq8fF1NHg1jBFP+2twBFz/+CXGObj8L77MwjSCP7e+EvuWIm6bPrL4gSNXjKdtdcJ+yLzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UictMYrLbl1QTgaOMgNQdOqLwojRLh7bmFn0JEiCZns=;
 b=DI7QmQ9BlqlX3b8W7hUaK9sVTdYqoTQnyECHRhgoyQiDGo8gTtoGJYU5j8SiFNnSmhNR7ULBHr4SDHwARDr7YJhtM7DIPaUyo6AQdNVK3tBgTVgsYGI0ej7TT53EfL1XUOkIHt83PJTBqL+bvQpNLrCuBbt+NuAKjvUOWWlZxf2zs8wr0OiGE2lvw/1YBgF+w2ZIELILYLOLuOYfkkqpMdnT7xY9m+0WhHfA1yEreX8vedcqKyh1o4fmA5SVfp207/LZ7eAZGUd86Vo8j3Cp91aH58wxVK24wbqWWgN9XJI5kN8DPJ2c7HH2wrv2EtIvrr9zMgW4ZvMNuGMpfTlwYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UictMYrLbl1QTgaOMgNQdOqLwojRLh7bmFn0JEiCZns=;
 b=iDcNWOYPvwMZEGbmXXQIg8D+fPZRJ/kbPXyO/MP916t5SkdMyths940x3Y71lTO1iknJS2tq1mxI/IOYy2KKE6UwVu6HUVTiEHgxTeRPjnsMAKp70vq9lSQeBof32YTsX2H3lsQK2Y3pK5qXzdKLi8hqH88KwdcQbrmqA+easyQ=
Received: from MWHPR11MB1326.namprd11.prod.outlook.com (2603:10b6:300:21::7)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Thu, 18 Mar
 2021 18:31:17 +0000
Received: from MWHPR11MB1326.namprd11.prod.outlook.com
 ([fe80::e1c6:f0ea:ea3b:56ca]) by MWHPR11MB1326.namprd11.prod.outlook.com
 ([fe80::e1c6:f0ea:ea3b:56ca%11]) with mapi id 15.20.3955.018; Thu, 18 Mar
 2021 18:31:17 +0000
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: Anatol Belski <anbelski@linux.microsoft.com>, Steve Sakoman
	<steve@sakoman.com>
CC: Denys Dmytriyenko <denis@denix.org>, Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
Thread-Topic: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
Thread-Index: AQHXFoo+3Jx9lAFlFU2WCuYh10gx96p/dvgAgAFImACAAD2n0IABlHsAgAMHogCAAQE4gIAALyEAgABNtICAAwMC8A==
Date: Thu, 18 Mar 2021 18:31:17 +0000
Message-ID: <MWHPR11MB1326409A4E80D7DB446A0B6CDE699@MWHPR11MB1326.namprd11.prod.outlook.com>
References: <20210311152128.41215-1-khairul.rohaizzat.jamaluddin@intel.com>
 <CAMKF1spX6z9vvv7QNbWhkapX-Z1=FWZVh0W2+OM2qSbxPqQgkQ@mail.gmail.com>
 <DM5PR11MB1322590C6E8F9272ECC912CFDE6F9@DM5PR11MB1322.namprd11.prod.outlook.com>
 <MWHPR11MB1326447A6A6AA12D09952A56DE6F9@MWHPR11MB1326.namprd11.prod.outlook.com>
 <f2d269853c88992f528419d5d20139a42728cada.camel@linux.microsoft.com>
 <20210315213606.GP4892@denix.org>
 <dd23f3e8-0db6-3f8b-466a-e9c9207c6604@linux.microsoft.com>
 <CAOSpxdbSVPDC9hDcyYhjvSwdbRnaPJ_VbaLscMLNhiwrVN6u-A@mail.gmail.com>
 <c115a501-d7ce-3c30-7964-6e0afc373305@linux.microsoft.com>
In-Reply-To: <c115a501-d7ce-3c30-7964-6e0afc373305@linux.microsoft.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.microsoft.com; dkim=none (message not signed)
 header.d=none;linux.microsoft.com; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [113.210.106.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f3d59ab-a737-4187-9224-08d8ea3c04f7
x-ms-traffictypediagnostic: CO1PR11MB5041:
x-microsoft-antispam-prvs: <CO1PR11MB50411A2F3B743762E625D691DE699@CO1PR11MB5041.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xjodArheynI35Em6AahjhX2kaS27JmkU6xjTNMqFZxKD7j7Sj73dVgFhDfo0v3INAmj7yHh+fHmFw5SekT0IrSvTAgGzwmfj+o49Yf83+cOFF+V4SVrf/+OPujkmJwn7ryu9wFEXOTbm4Liu1ZZaI9O4OoJLwB1o+YZ4skUWB6Cr1FCG8mC0IN10EPmt8T2jMoZxvdpGWN1k0y4hz32clIkvr+utqitrcFxMaB1KFAVjXODabd1LjpN5gXdmvvMjHGw9YzbtkqGuzUvnrGZ5JR4nsNHMcVZ4P0l84vHMF4+6ApAa0hcq51YmS/OQMkYdKZ7Xby2E0oafF9VY0ZalRV2MCiRHc20uZk3HibL6STbHAJ4/06qlXluIDD1BNz2Nf/OjLyaEgH/ESGTdtgdVSUvQCHwjZPEztlTBtPnq+vCtox96Ibc9OtiDxWYx8Yfyfa3uGS3AZ6NaDJIYSw+gtZFL9kRGYwAaNJP4XOL4cLCIdX8OYf1RF38Y0YJaFQftB5BBzTpR1NaIpJ7hp/rwqvGcBJr6vdR1W8VXAezXWtsiynI3GiHSnCxojmHASmX03K1z8ujl8U9x6Vm2/6PIImGFWROQu+eVAy5elgFuIHkCZMc1rAMLVBd4tuh3cBmA+YqBvplz6HD7f6FWlfpHn8PeAKnjgaE72lSPRcsaJo9WgYvTxmB/OLkqm+A5XQMc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1326.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(39860400002)(366004)(136003)(52536014)(64756008)(316002)(71200400001)(66946007)(4326008)(6506007)(38100700001)(76116006)(966005)(66446008)(110136005)(54906003)(66556008)(66476007)(5660300002)(8936002)(7696005)(55016002)(2906002)(86362001)(26005)(186003)(478600001)(53546011)(33656002)(8676002)(9686003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TmM2cGMzTTl0SVkwTGMrRWIvS256ckQ5YUp4ckcvUEwxZUozYldrU3JnTURP?=
 =?utf-8?B?a25VenUwYkZBZzBZY25kMnhPRjZyTG4yMUFwMHRhV0I2ME9WODFxTjlRcVhu?=
 =?utf-8?B?bGpIT0dxUGtRL1JsMU5VTzZQMlg3WU1melprdjRFMHE5NzIyWHJGVEFBemZo?=
 =?utf-8?B?NUwrY3ZDMWhVLzN6amd6NGJxZXVwUWk2VFVZNU1Rakk4N0tsdkpKYUppUU14?=
 =?utf-8?B?b3FQODAranNwZldXS1hWOWVwdERNWHV2aG5rM3ZMRTBlLzF5UmVJUTZ6RlpN?=
 =?utf-8?B?K2VGWFplWE1aazVFT1ZTeHBrdjU1QlVpaTl6QVNYbVlpVkUxTElsaFJiTmtk?=
 =?utf-8?B?TW1PR1did1F5Qzl4eUJUZE9OUVJtb0Mzb2QvRHZ3cElRVGJHYURGczFzNmJr?=
 =?utf-8?B?dTlSdUFYZTRYMzNaangydTFSc3hpM0xaaDQrM01LUHVuYmgxcmxWWGlKbERn?=
 =?utf-8?B?Tkt6ckpGRWRhTUQ3M1BoOXZsYTFCVkYvV2V0ZU1KdjViV0QzTjlKU3pVU3lU?=
 =?utf-8?B?Z29GRUUveHFZeTFMSW4rd1JKNitiWmdCeU1YTzRmTTBJcGZObndISW1LVHpI?=
 =?utf-8?B?MFAwODQwa1lQZ2REdnFvSDRtbXpGa1FJeDJJTDAzQnM0K28wK1phL3k1YVoz?=
 =?utf-8?B?NVBPc2R4cVZaNkI4dmtPa095M3JLeDBhYUM0c2JyaGUwUEZ1M0NFV0Izb0Ro?=
 =?utf-8?B?bEFXTUkvRGZnOW9IVUgxZ3dCZC9UcS9wR3IxaU9pc250TmVpNGYyYXQ5V1Y3?=
 =?utf-8?B?aEs2QkV2VkJwVUhWUjZ2MitJTTlvVjZBYk1TMDJXeUVoSitHNWV3Tnl1eTZ1?=
 =?utf-8?B?TnFSYmVIRGJaUHRMU1FMZkF5WGZKcE1BeGlqSTFNaS9Oa1RST09RcTBNYlVT?=
 =?utf-8?B?RnoyOStVcFlPQ01zdUNDL0NlNnVNV0k0L0VFa0oxSmx1cmxUd3BxZCtsWFBR?=
 =?utf-8?B?UGhmaVViRnNmSUFtd3owTXRyZ2xFTEplL05MckdUUWdTbWpnZ3hvaGhTenlt?=
 =?utf-8?B?Z0NXWjV3QmJxVWhSYWxEeGs3QWFlY3pBTVN6WTh3NWtQZDdhYWZMZHJFWDZy?=
 =?utf-8?B?V01KazJvUUZjbWd2U1lxQWRDV1NEaVpXeTFINlpub0pvZXYwWlJoV3UyVmQz?=
 =?utf-8?B?Y1hYS2ZrQ05NM3lxUzVZN2lnZjhHV0p5cmdiVUNVR3Y0N0g4NjVNdGlJSEg3?=
 =?utf-8?B?Q1RaYllxaXkxMGtKcmgwZXZWSHZGZkxsYllGdHQvMmtERENnQ0xnUXorZDlv?=
 =?utf-8?B?cStRTE82YlM4cUVwbWU5c0h6RmRtbHZFblZ4c1pLeGNZTWhLdldPZlpvazA0?=
 =?utf-8?B?OXZmUUZXQ3NBUkhrMTZhb2Z4aE8zK3ExN1NPT2dqQXlhZkRkYzRFbVdDdUd3?=
 =?utf-8?B?Y1FKZTFSRk5xQjdMakRNVVFmTU5YYytWZFFjUGNDRWxQMjRpbjQyOStTUTZB?=
 =?utf-8?B?MEd3cjYxUjZmVzFwbDdIbG1OeW5XY3g5RmQwSjI3Q3cwdy91aDF1S3QzSHd0?=
 =?utf-8?B?Q1pzV21BY0grTXl1azBmUFplNXpNRXBUa0NTNkdtdEtoREU4TnlINVdEWE00?=
 =?utf-8?B?emY4NkNoOUJJU3Q2elBhWEgzaFV3Y1JtdW45Q1Z4UnJ3ZUpqRWFZQU9tSmJM?=
 =?utf-8?B?eFY0M1JPZ29uUUtNNk5GaE54bVZob3UzN2VpdXg5NmsrY1kvU3ZnNGkrV1pM?=
 =?utf-8?B?cXlTVllXckhmQmg0ZVpDQWU5N0VHZnBBSWRJVExEaUpJQTRYeUQ0TDMvWEcr?=
 =?utf-8?Q?aRA6EenKa3Bp0GfWMg=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1326.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3d59ab-a737-4187-9224-08d8ea3c04f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 18:31:17.3676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +60iv8tFc2HX2cdugvjJ0DVqsM6o3D3YCGLPKPiu6tWGjiQelUgBmvW4HNX6+veWmUKtiDsuHcN1YUVEARGhrhafoCKsH3FWJeVj1KYrQj4nuzHoe+Eh11wxkgV+Y3iR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
Return-Path: khairul.rohaizzat.jamaluddin@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNClBsZWFzZSBkbyBjb3JyZWN0IG1lIGlmIEknbSB3cm9uZywgaXMgdGhlIGZpbmFsIHZl
cmRpY3QgZm9yIGdsaWJjIG9uIGR1bmZlbGwgaXMgdG8gd2hpdGVsaXN0IGFsbCB0aGUgQ1ZFcyB0
aGF0IHdlcmUgYXBwbGllZCBiZWZvcmUgdGhlIGNvbW1pdCB1c2VkIGluIFNSQ1JFVj8NCkknbSBu
b3QgcmVhbGx5IHN1cmUgd2hhdCBuZWVkcyB0byBiZSBkb25lIGhlcmUuLg0KDQoNClRoYW5rIHlv
dSAmIEtpbmQgcmVnYXJkcywNCktoYWlydWwNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IEFuYXRvbCBCZWxza2kgPGFuYmVsc2tpQGxpbnV4Lm1pY3Jvc29mdC5jb20+IA0KU2Vu
dDogV2VkbmVzZGF5LCBNYXJjaCAxNywgMjAyMSA0OjI0IEFNDQpUbzogU3RldmUgU2Frb21hbiA8
c3RldmVAc2Frb21hbi5jb20+DQpDYzogRGVueXMgRG15dHJpeWVua28gPGRlbmlzQGRlbml4Lm9y
Zz47IEphbWFsdWRkaW4sIEtoYWlydWwgUm9oYWl6emF0IDxraGFpcnVsLnJvaGFpenphdC5qYW1h
bHVkZGluQGludGVsLmNvbT47IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+OyBQYXRjaGVz
IGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29yZSBsYXllciA8b3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
XSBnbGliYzogRml4IENWRS0yMDIxLTI3NjQ1DQoNCkhpLA0KDQpPbiAzLzE2LzIwMjEgNDo0NSBQ
TSwgU3RldmUgU2Frb21hbiB3cm90ZToNCj4gT24gVHVlLCBNYXIgMTYsIDIwMjEgYXQgMjo1NiBB
TSBBbmF0b2wgQmVsc2tpIA0KPiA8YW5iZWxza2lAbGludXgubWljcm9zb2Z0LmNvbT4gd3JvdGU6
DQo+PiBIaSwNCj4+DQo+PiBPbiAzLzE1LzIwMjEgMTA6MzYgUE0sIERlbnlzIERteXRyaXllbmtv
IHdyb3RlOg0KPj4+IGh0dHBzOi8vd2lraS55b2N0b3Byb2plY3Qub3JnL3dpa2kvU3RhYmxlX1Jl
bGVhc2VfYW5kX0xUUyNTdGFibGUuMkZMDQo+Pj4gVFNfUGF0Y2hfQWNjZXB0YW5jZV9Qb2xpY2ll
cw0KPj4+DQo+Pj4gU3RhYmxlL0xUUyBQYXRjaCBBY2NlcHRhbmNlIFBvbGljaWVzDQo+Pj4NCj4+
PiBQb3RlbnRpYWxseSBBY2NlcHRhYmxlOg0KPj4+ICogQnVnIGZpeCBvbmx5IHZlcnNpb24gdXBn
cmFkZXMgZm9yIHVwc3RyZWFtcyB3aXRoIGEgZ29vZCBzdGFibGUgDQo+Pj4gcHJvY2Vzcw0KPj4+
DQo+Pj4gVW5hY2NlcHRhYmxlOg0KPj4+ICogR2VuZXJhbCB2ZXJzaW9uIHVwZ3JhZGVzDQo+Pj4N
Cj4+Pg0KPj4+IFNvLCB1bmxlc3MgdGhlcmUncyBhIGJ1Z2ZpeC1vbmx5IG1pbm9yIHJlbGVhc2Ug
b2YgZ2xpYmMsIGUuZy4gDQo+Pj4gMi4zMS4xLCB1cGdyYWRpbmcgdG8gMi4zMiBvciAyLjMzIGlu
IHN0YWJsZSBicmFuY2hlcyBpcyBoaWdobHkgDQo+Pj4gdW5saWtlbHksIGFzIGJvdGgNCj4+PiAy
LjMyIGFuZCAyLjMzIGhhdmUgbG9uZyBsaXN0cyBvZiBtYWpvciBjaGFuZ2VzOg0KPj4+DQo+Pj4g
aHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9waXBlcm1haWwvbGliYy1hbm5vdW5jZS8yMDIwLzAwMDAy
OS5odG1sDQo+Pj4gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9waXBlcm1haWwvbGliYy1hbm5vdW5j
ZS8yMDIxLzAwMDAzMC5odG1sDQo+PiB0aGFua3MgZm9yIGxpbmtpbmcgdGhlIExUUyBkb2MuDQo+
Pg0KPj4gTXkgc3VnZ2VzdGlvbiB3YXMgdG8gcHVsbCB0aGUgbGF0ZXN0IHVwc3RyZWFtIGZyb20g
Mi4zMSBhY3R1YWxseSwgbm90IA0KPj4gdXBncmFkaW5nIHRoZSBnbGliYyB2ZXJzaW9uLiBBcyBw
ZXINCj4+DQo+PiBodHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2xlYW4vY2dpdC5jZ2kvcG9r
eS90cmVlL21ldGEvcmVjaXBlcy1jb3INCj4+IGUvZ2xpYmMvZ2xpYmMtdmVyc2lvbi5pbmM/aD1k
dW5mZWxsDQo+Pg0KPj4gd2UgY29uc3VtZSBmcm9tIHRoZSBicmFuY2ggcmVsZWFzZS8yLjMxL21h
c3Rlci4gSXQgYWxyZWFkeSBjb250YWlucyANCj4+IHRoZSBiYWNrcG9ydGVkIHBhdGNoIGZpeGlu
ZyB0aGlzIENWRS4NCj4+DQo+PiBUaGVyZSBkb2Vzbid0IHNlZW0gdG8gYmUgYSByZWxlYXNlIHBy
b2Nlc3MgaW4gdGVybXMgb2YgdmVyc2lvbnMsIGJ1dCANCj4+IGl0IHJlZ3VsYXJseSByZWNlaXZl
cyBiYWNrcG9ydHMuIEluIGZhY3QsDQo+Pg0KPj4gdGhlcmUgYXJlIGFscmVhZHkgc29tZSBidWcg
YW5kIENWRSBmaXhlcyBiZXR3ZWVuIHRoZSBjdXJyZW50IFNSQ1JFViANCj4+IHVzZWQgYW5kIEhF
QUQuDQo+IEknZCBiZSBoYXBweSB0byB0YWtlIHN1Y2ggYSBwYXRjaCBmb3IgZHVuZmVsbC4NCj4N
Cj4gSSdsbCBhZGQgaXQgdG8gbXkgdG8gZG8gbGlzdCB0byBsb29rIGludG8gdGhpcywgYnV0IGlm
IHNvbWVvbmUgaGFzIHRoZSANCj4gdGltZS9pbmNsaW5hdGlvbiB0byB0YWNrbGUgdGhpcyBpdCBt
aWdodCBnZXQgZG9uZSBzb29uZXIgOi0pDQo+DQo+IFNpbmNlIHRoZXJlIGlzIG5vIHZlcnNpb25p
bmcgZnJvbSB1cHN0cmVhbSBpdCB3aWxsIGJlIGltcG9ydGFudCBpbiANCj4gdGhpcyBwYXRjaCB0
byBtYWtlIHN1cmUgdGhhdCB3ZSB3aGl0ZWxpc3QgYWxsIG9mIHRoZSBDVkUncyB0aGF0IGFyZSAN
Cj4gZml4ZWQgd2l0aCB0aGUgYnVtcCBpbiBTUkNSRVYuDQo+DQpJJ2QgYmUgYWJsZSB0byBkbyBh
IHJ1biBvbiB0aGlzIGNsb3NlciB0byB0aGUgZW5kIG9mIHRoaXMgd2VlaywgaWYgbm8gb25lIGJl
YXRzIG1lIHRvIGl0IChwZXJoYXBzIEtoYWlydWwsIHRoZSBpbml0aWFsIHBhdGNoIGNvbnRyaWJ1
dG9yIDspKS4NCg0KUmVnYXJkcw0KDQpBbmF0b2wNCg0K
