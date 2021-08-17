Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web08.34267.1629168240363858457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 19:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=tftdlGx8;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="279724153"
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="279724153"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 19:43:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="441342772"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga002.jf.intel.com with ESMTP; 16 Aug 2021 19:43:59 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 16 Aug 2021 19:43:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 16 Aug 2021 19:43:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 16 Aug 2021 19:43:58 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 16 Aug 2021 19:43:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AV/+s8JvZVAfOIyhiPYDJQ7znBs3S/kdQtlHOH3MHlHBezTr1DEcC7vVucPAaErcK8pob08al/gXC7+UAc4qio6F8QNwPmfY3/rP6qjqXUlPPngrCgGwJfLdufhYmuhbq1mIrW8LsvLjYtfv3HttkHkJ7prC4//zBRVahQwa4Ea/vTBsYmie0Q6lBypQqQ99N+xSBF1jPPbGBwp3O/LHdXxWe4N1LwpUSddcY7J1H1Wmdur8MMj0NLzPilFOrwivZxEZi9UU3MvoGT8HCgjm+y9uLFsyvGSw9qhPzHdY2TnqhaNzVmQefqGs4L1Zxc0MYdRk+MRe4iiZIorFl+5EVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AZ5qPoLDcsxENl9JxGxyjlvApwuHrXCtBoo8mWH4OU=;
 b=cEiYJiLYPhwG+fnkjvXPwceqV1r+2WR4uXPTOjfvFSDrxJCNmZ5kUf5MPgOwCKEsttAuDc5CSdB+0bjQ/ZVK1BSGEnDzjJ5yFjAzPh9rLwtjb61AjwM30OvII/YFsMfdDOrbAQi3BSeRQAaBV29z1qGtwoWbCcB+oE4phaPIqdfVSH43CMs4D8kKaAwOnWp1vpiPB7gvBA46bN5Feh0GcIseppJ0agY3/4/N+ZreVlNuXJ/b1WiORIMptGfcY1bIkLFXQB1n5hK2O4sXOGPeGm8C1kz7pKCstPrMosfsm4kYjCqglr5kZCerd3cJg6++16egfkF39q8cZqS12zfqMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AZ5qPoLDcsxENl9JxGxyjlvApwuHrXCtBoo8mWH4OU=;
 b=tftdlGx8UY24xqkL1rrweGlU2fqtGWn8VAHI2COoWlwYXJBQf1NTIcC4cn4G7POlbzm5hV9gEZDbkGfQNX4Krq8vL4hMGiXXlkniHzhW5gd3/FSDDr52AqQr32AJPvQo2uOwgEFxHZC6eNTxNR59ArHEVet2zDqc8NyntQQi8kc=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB2727.namprd11.prod.outlook.com (2603:10b6:a02:c7::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Tue, 17 Aug
 2021 02:43:54 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::d7c:227b:e92b:611c]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::d7c:227b:e92b:611c%9]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 02:43:54 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/7] embree: upgrade 3.13.0 -> 3.13.1
Thread-Topic: [OE-core] [PATCH 1/7] embree: upgrade 3.13.0 -> 3.13.1
Thread-Index: AQHXkxGEHSI2YlaNlEehk8elWRHcqat2/UuA
Date: Tue, 17 Aug 2021 02:43:54 +0000
Message-ID: <caa21d67a81a09e2d563e89963438159799735a9.camel@intel.com>
References: <169BF7C9B3F6A9BC.22901@lists.openembedded.org>
In-Reply-To: <169BF7C9B3F6A9BC.22901@lists.openembedded.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e732916f-9d23-4463-957b-08d96128da7d
x-ms-traffictypediagnostic: BYAPR11MB2727:
x-microsoft-antispam-prvs: <BYAPR11MB27275A901A5B29808A728E1EF8FE9@BYAPR11MB2727.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mg2NMvxh8rFzbj2KGDPlShQYZI5UjyRa4bqscVIehqDPG3Gd1Cq+FY5qyTnQ7AT8kyV5mvLIBc6LB3uhiYYxjQPJSAtdzqV1upgvNr7X0EbmM74XceRRMkkL6ORAjvhQL49n1RQT25C2hHNRT1zcxfrkZ2pOwop0wpF8vyYMjkPcY/mBMXYR9QxQF+TGTfd1mVfnDC2TBx4L27lW83oEQatT6nIPtN62c0OtTBKw6avbl9PcDBM4+/ki4KOaGIP6Bpq99dL548ZEd9U1Q0xen8QkNf91hOLpXrocle0lYUtMMeM6pnVhhkkRs2/4NNYzqiy+F6yVjLBibp2fsBGZeY6PiD/Qs58mg+ioNb0/ZxSZYEZByijXyHOZ0KHNhPWV6PJjStp2SRnQnYIjaojNiYol0kAGpHPdEzXvQDReNlPHgOLr4P/vDsE44/lYA9Zmtz5mcWNnhyuM2fwv2bPfgd/iy3aWsw7CtoSjJN66iAKTXJ9/yP2SH9vjp7C15P6Ylc9LnJ1DNSMjyyXO3jN9tHvIuOqFJEv7BnILdpG/D9rE3E+aai4dUkYCPl7KrRvx/zhnMI5Ah+X9kMDsnETAHawTqtjELo6/alE/ttwpjH5Qy7MXuUL2n8PyXOPu0FaUDbRHtKu1B2vbMydTtVsYyJ2R+vWNbc2EJ55NSbr/BFOwgm9e57TQKX5L+lV8pyy5CDBSUZVLKZg/LMttv+4mdVB2Aj4stM6XhNdn/sAY7jRlRB3G907mrlZ0jBvMx+17bOUWxHUY0yYxib5YoL4CvBJIYwvEeukckouFZlcS44dhqN/bJz3jsi/AXGvcTG9yFHYIDhcyKr2DvBlZR0vytg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(76116006)(91956017)(6486002)(38100700002)(316002)(2616005)(2906002)(6512007)(6916009)(122000001)(71200400001)(26005)(5660300002)(38070700005)(478600001)(966005)(6506007)(83380400001)(66476007)(64756008)(66446008)(66556008)(66946007)(186003)(86362001)(8676002)(8936002)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eElkYUtTbHpiK0pOSmNKaVc4eGcySE5xd0h5Q2ZEckFKMVllYkZkcDRvRnZG?=
 =?utf-8?B?T2pENnpFRnhqSmlERHcraUlDQm1RRk9sUExyeDgveFl1QW1JNWlGZ2VBVWda?=
 =?utf-8?B?QTNZUGZVYTR6K1g4YjFLZGJqamZacnBHalA0UE9UOVVBYlp1WWFESWZMaFBM?=
 =?utf-8?B?VGpTbXIxcit3bHpYQU1URjBnNnBHUFhldEVyNlY4QkVlTEN5NGNzcWVTUDdX?=
 =?utf-8?B?cjBTdEhvdEdLcXozbmVFbytSQ2tLaFRDeUxUYjZzd3JLdzFrcnRLNVREVHdi?=
 =?utf-8?B?T0V0Rys1ekZhVUU1dXdmdVRweE5QV05hYTlIc3VqdUNrS2RGa1lOcnNRT3p1?=
 =?utf-8?B?ekFmajZsTHZ6N2V5MXkwWHR2S2hpZVlwMWNOeHB6SkxlRmoraVhLN2wxaTBK?=
 =?utf-8?B?Vmw5UHhTZDhVSUlPbFpVWGd3T2dZZXhHWGdEN1VCaTFZQlVqQkRrK0RJZGNF?=
 =?utf-8?B?VXVnMTJsN2NhVWQ2S3hiSW53MVNLUTRrZWhydnlQaHB5akdXeUdnME1jRHc2?=
 =?utf-8?B?NWI0dGRSUjhVNmY1NzlmQmgzTzBJZ0ZyQUhqUnFiTXlXYnFXKzBiSWpSOVVN?=
 =?utf-8?B?UHdSSjN5VDRjYXptNnlLb1YwUVh2ajdJRXlIL0hIMDMvR09tU3lzTzdlU0Rr?=
 =?utf-8?B?ZEdZUGpYTzJOU1h4MXZDZ25IaGt6TjNDdGVxZExCOFJDdForbnBMaXRUL2Vh?=
 =?utf-8?B?S3M0M0xMOGJSK2hhT2RIZEJEdStrUGc1OXdDUVR6OUhwdFF6dkF5RG9OVTNj?=
 =?utf-8?B?bUd0MzBEK0xHUEdzS3ZCMDhHaHhwZ3Z2NEV6N3MzRXB4SGlOT29uNXVOUVpp?=
 =?utf-8?B?Ti9ZVm0vTnRyemQ5QXZtZmZUQm5oaHJXWXEwMzF3T3J1aVJ4bzlBRWhlcHRq?=
 =?utf-8?B?clFUUDNLK3U3UGh3czBlQmdUVzd2Mkc3YUtGWTlKQ0NyaU9pTzJzQWJYOHdY?=
 =?utf-8?B?dURhMGRIb0l0Q2lZVXdZN1R1ZUQvOVBHU010QnpUTzRER3g0NWh3N2lwVUk3?=
 =?utf-8?B?UDEzUncvMVlacG9sRHRiMThDVm82Y0ZXMForS3JVYjhBN2xkZkpHSlJLNXg4?=
 =?utf-8?B?Z29lcEFFRkt4OXFrUGpDZEtPSGxRZjN5bzRYZDNGdTVzWW5pcks2RHlib1V0?=
 =?utf-8?B?dS9VQUJHdmFxRkx3dnJ6OEd0QnE4TENUNHBJWVhFYUdBbThvcjlyc0ZUK1Bk?=
 =?utf-8?B?TFl1ZXRNcFV3RDd3bHNsNkJXYUFLRTdnUEkyQTF3TmZac0IxOGZOV0Z0dHhj?=
 =?utf-8?B?dEVaUWtoYnJkaEZpS2J2aGtwb2FEQnE0L3B2RXppcHdwZ0lQeEtlUFpsSTIw?=
 =?utf-8?B?YVJqS2xuUkFMMVJrVStISG5XOFlzb3hlQnlhcnBaeUsvTGEvSEdPcWwyVkox?=
 =?utf-8?B?dFN2UlVvN0pHMkd3T0NHb0RKdXJZUUFyUnphQkpIbG1CK1B6aTZRK2swL0k4?=
 =?utf-8?B?dlRpRzRCcCtPdFJqOVRpOGdBdUhlT2VUM3d4bEFvbUtMOGFJRS9ZQnNseS9w?=
 =?utf-8?B?cGUyanl0c2VtWURvdDZGcnhIOUtmc2dWSTUzVTUxWHJoRXVmNXNSaHM4ZXVh?=
 =?utf-8?B?Q1Z1aCtvYzNtcDJNOG9tck9GVmphVlR4WFh4MEFrMlhBMUg2ZHFNeDl6d0Nl?=
 =?utf-8?B?SzNMeldhL0h1dUVJcEltMENlTHQ4d2hkNE1RUzBUTE9GMWNRVWlTVnZuTytU?=
 =?utf-8?B?YURYQ2IxeDY1REdXT1p4cXhTUGxjYWRFbXphOVN4YUlMc0ZRL3NmZDQrNE5L?=
 =?utf-8?B?L3Q2dVNlOGc5QW5uWXhRbzRkdUJ4NDZRMXNabmNuNjRjNjVLRGZWOTJUaHBX?=
 =?utf-8?B?VnJpNXdCREZscHc0cG5PZz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e732916f-9d23-4463-957b-08d96128da7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 02:43:54.0242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DU7/1Nvg4ycyGVo8CI5oXV00Zmn9es7eaf/0zeVtIXzCqa3/q1XV6ZYgXLTRzVQTepzfCd0vIONYEbVGmoir8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2727
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C7F8ADE4713FE4EBC806347DE5675F3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

U29ycnksIGlnbm9yZSB0aGlzIHNlcmllcy4gU2VudCB0byB0aGUgd3JvbmcgbGlzdC4NCg0KVGhh
bmtzLA0KDQpBbnVqDQoNCk9uIFR1ZSwgMjAyMS0wOC0xNyBhdCAxMDo0MiArMDgwMCwgQW51aiBN
aXR0YWwgd3JvdGU6DQo+IFNpZ25lZC1vZmYtYnk6IEFudWogTWl0dGFsIDxhbnVqLm1pdHRhbEBp
bnRlbC5jb20+DQo+IC0tLQ0KPiDCoC4uLi9lbWJyZWUve2VtYnJlZV8zLjEzLjAuYmIgPT4gZW1i
cmVlXzMuMTMuMS5iYn3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiArLQ0KPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiDCoHJlbmFtZSBk
eW5hbWljLWxheWVycy9vcGVuZW1iZWRkZWQtbGF5ZXIvcmVjaXBlcy0NCj4gb25lYXBpL2VtYnJl
ZS97ZW1icmVlXzMuMTMuMC5iYiA9PiBlbWJyZWVfMy4xMy4xLmJifSAoOTUlKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2R5bmFtaWMtbGF5ZXJzL29wZW5lbWJlZGRlZC1sYXllci9yZWNpcGVzLQ0KPiBv
bmVhcGkvZW1icmVlL2VtYnJlZV8zLjEzLjAuYmIgYi9keW5hbWljLWxheWVycy9vcGVuZW1iZWRk
ZWQtDQo+IGxheWVyL3JlY2lwZXMtb25lYXBpL2VtYnJlZS9lbWJyZWVfMy4xMy4xLmJiDQo+IHNp
bWlsYXJpdHkgaW5kZXggOTUlDQo+IHJlbmFtZSBmcm9tIGR5bmFtaWMtbGF5ZXJzL29wZW5lbWJl
ZGRlZC1sYXllci9yZWNpcGVzLQ0KPiBvbmVhcGkvZW1icmVlL2VtYnJlZV8zLjEzLjAuYmINCj4g
cmVuYW1lIHRvIGR5bmFtaWMtbGF5ZXJzL29wZW5lbWJlZGRlZC1sYXllci9yZWNpcGVzLQ0KPiBv
bmVhcGkvZW1icmVlL2VtYnJlZV8zLjEzLjEuYmINCj4gaW5kZXggMjQ2MWVlZWIuLjY5ZTBlN2Ez
IDEwMDY0NA0KPiAtLS0gYS9keW5hbWljLWxheWVycy9vcGVuZW1iZWRkZWQtbGF5ZXIvcmVjaXBl
cy0NCj4gb25lYXBpL2VtYnJlZS9lbWJyZWVfMy4xMy4wLmJiDQo+ICsrKyBiL2R5bmFtaWMtbGF5
ZXJzL29wZW5lbWJlZGRlZC1sYXllci9yZWNpcGVzLQ0KPiBvbmVhcGkvZW1icmVlL2VtYnJlZV8z
LjEzLjEuYmINCj4gQEAgLTE1LDcgKzE1LDcgQEAgUyA9ICIke1dPUktESVJ9L2dpdCINCj4gwqAN
Cj4gwqBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vZW1icmVlL2VtYnJlZS5naXQ7cHJvdG9j
b2w9aHR0cHMgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIg0KPiAtU1JDUkVWID0gIjdj
NTMxMzNlYjIxNDI0ZjdmMGFlMWUyNWJmMzU3ZTM1OGZlYWY2YWIiDQo+ICtTUkNSRVYgPSAiMTJi
OTkzOTM0MzhhNGNjOWU0NzhlMzM0NTllZWQ3OGJlYzYyMzNmZCINCj4gwqANCj4gwqBDT01QQVRJ
QkxFX0hPU1QgPSAnKHg4Nl82NCkuKi1saW51eCcNCj4gwqANCj4gDQo+IA0KPiANCg0K
