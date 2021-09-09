Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web08.1621.1631150204552425621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 18:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=n62M14fZ;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="220323974"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; 
   d="scan'208";a="220323974"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2021 18:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; 
   d="scan'208";a="466090861"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP; 08 Sep 2021 18:16:43 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 8 Sep 2021 18:16:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 8 Sep 2021 18:16:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 8 Sep 2021 18:16:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZFvPklR/GT5fM7CICcviVBoQ0uw3y5vrwyKEz6CmYPBzpQa9wJHX33TDEfGjfAkmyEwIouDoEKiOtNvaDvXiQizK9CpVMd4EzQ9BOsJam2QFpx8D0z0hG1lbcfJ+DmwGH2VyBDPN+aQC7h9THtm5BF9yq3oUtv0TF2FyMaUmmT5b+vuG3bL4PDfyLxkOnCes0MF1+CIoX41LgpaxYjSf3yxojuiBskXRABw3+UWQMlt9ecv/jq+31nsmCvDAxyxHJRYNwP34+ZGHC3oBJpubyMthCTXTACW603Ib7XJpNQdsi3hFsKqy9WGccO58jpFIC2oW+b/gB2oMpFbkf1Aqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OGLaKV1/NtXivKbg/eNpRL9n9FfHwhfl7CQs9H+Pbc8=;
 b=aosPMHgIARw0AOE+HH2klUoJ7obzYUrKPgI8V8fmsTczi3X5ZgFXxW25Ci44KRg0oVKRsvw8Mhj3vN73rfv2vtSzJ3BvrD9+bryauZQ1tdWEW+u+IFt4nnB3xBz1eEH8Lv3uaU2KnRxVypKHd8cdl7Mpmqo8wqCOoyc86n/YHGEPltxlEbKaBAoadNIQCiwH9kbAyIUox/gOuXknufq5LaH8+RMFBpMVhByPrXqsTex0D8msyJpYxJZ6QXv4YxTISXSikGZqy2dybrsw22V4YNmJTe1SfLoFSfIN0ddRCIue1NJACyY3FJucHvLigxzwQ1H+BeswKI5BXTCUXb/jIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGLaKV1/NtXivKbg/eNpRL9n9FfHwhfl7CQs9H+Pbc8=;
 b=n62M14fZ99w3Jk+XKkQnDjg0gu1Fpq8gkvvpiEpabcJmuN5kGkvAFLpj/Fm08T1/xAT7gl46+87skfYG56GQTY8p8B5J1V/K/y58q+9kR5vZB55jt8jDHJw31X0/c0CvCAYvJVpn1hcMUm5L8rEyyNqCRHRvfNdURLUHVUWCO0E=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by SJ0PR11MB5005.namprd11.prod.outlook.com (2603:10b6:a03:2d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 01:16:40 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be%3]) with mapi id 15.20.4478.027; Thu, 9 Sep 2021
 01:16:40 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "chris.laplante@agilent.com"
	<chris.laplante@agilent.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"JPEWhacker@gmail.com" <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] bitbake: server: Fix early parsing errors preventing zombie bitbake
Thread-Topic: [OE-core] [hardknott][PATCH] bitbake: server: Fix early parsing
 errors preventing zombie bitbake
Thread-Index: AQHXnbcbeGibdJcGcUmBl4RSKZFfAauacc6wgACDcoA=
Date: Thu, 9 Sep 2021 01:16:40 +0000
Message-ID: <5d91d5ef858723a85e9460cfeb62e251052e321e.camel@intel.com>
References: <16A0207AC2905018.25648@lists.openembedded.org>
	 <DM8PR12MB543089FBA26942E145A386568BD49@DM8PR12MB5430.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB543089FBA26942E145A386568BD49@DM8PR12MB5430.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50e4e7e8-0e6f-401d-81c4-08d9732f7a73
x-ms-traffictypediagnostic: SJ0PR11MB5005:
x-microsoft-antispam-prvs: <SJ0PR11MB5005927337EDBB51389138CAF8D59@SJ0PR11MB5005.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: thSBmY6pNsUb7dEfPDIGCfr1mGdXnwyZ2+NduYV7t56wXbXbRtYVC7r+SKnCPpPYSbgcJqkr+XenH1eqfpwGwHlwE0y7Atolf7F3GvhCvTSbC0jBO5R/DbnqYeiOmjK07fO5lF8+DFojxH8JQ2yoz79DKVdIZ/oznShVdTp8mt4OYSSOmT5t0EMUx3CZzNl8IQcbnr88aE4J0R2poiXaOAZdOdH4aDxaLcLypJ66Os66In96Jnhn6yb9tiNlwS+qzuHksO1LRCpk5nqRLW0QpZYeMzyCXnsU+mecKjwSE/lHDYe2Voz7k+oD6V2biqPRU7XW3dXUFNl5nCy2Mqe1Ne24f3Xa5pbvfj2pv4vu4jPd/eR+yYL0K57EPW5P9lr9gLL5VgYK9YOs2eXqYLV2Lf8eNasNqs+MBf4sqjIa4RRrzf0HnTHjbCYx/K2kx1ecNM7gddpUI29DpA3fk++GMPheWkFlNVoCmz4GPqxuPQ8+2gVMDoQ+DzmQjgMNlsW3rjUQDdcLdB4yztsVs0+GItahvzp4wkkQ76xgWDM81tzvqkw4wjz775y8qd5vOn72tNWdZewe7K0FkQdFmFcOiHWb/16WUBadK/JNHoCeAjjP4pUtLDaODunLUDsx5tCHOtRLqpK1ouCHz1JP6T3IpkYzWIyE893MDhk1Ra03SGp/1ad34sBJdcsu91kXAbGm1HkcjIqDq/yObmHgnn2j/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(86362001)(186003)(64756008)(66446008)(316002)(71200400001)(6506007)(122000001)(26005)(38070700005)(2616005)(6486002)(6512007)(66946007)(5660300002)(2906002)(91956017)(4326008)(76116006)(478600001)(66556008)(8676002)(66476007)(54906003)(36756003)(110136005)(83380400001)(8936002)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djExb3V1ZXllYy9NTitPRFJNUDdRVTdxTjlhNk8zYkVvOStwcjdvc01MbkNz?=
 =?utf-8?B?T2JMSjRLT1F2T1lQZFE5QUN0MXB2cWZadWEwU0NqRHZoWjVSd1VsSjZlSWFu?=
 =?utf-8?B?SFVpa0JZWHNFZjliclNzcElOWEZRMW5oUEFGVllxZjIzV1BFMHNRU2NTR0lQ?=
 =?utf-8?B?eUJUSnVIQytKeVFQT3dpOHFYWUR1TDJSKzhmbStDclB2ajBDK09peXNxa1E4?=
 =?utf-8?B?Y1BUcE92NjZtUC85TFQvd282cENwSm1PWTNTaEUzRDZpTUVyZ3BwWUo3YWpy?=
 =?utf-8?B?by9YMGlmV1NzQ01kZ04yNGdNZ3JjcjB4NHdLSmtoaWtiZ1ZaZjdHa3ZQR2ky?=
 =?utf-8?B?OGtaNWVVMERZbGFvOFV3ZS9nZzNDemJ0OHM1OXV1bmpWTW9HdllqaWZWekpI?=
 =?utf-8?B?MXdldUdYOCtRMzVRQzJjODBNVHh6UGFkWHNiVlVNNVA3eWV4a2cwNGpPOXN2?=
 =?utf-8?B?dzZza1JhRW50N0xjZTd1MG5RTE9Nd3lQM3VnMFo5Rythd0NjZnZSUWgzL0tl?=
 =?utf-8?B?L05OVkx5MjRud1BVemRUdjJiZElSdXEzZG1YRFpRZGsyS2hCRU04Q0s1QW10?=
 =?utf-8?B?NmN0VUE2NWZmY01rL0pVUzJNNUYyb29wclJnbjZIK1FrQWY3NDRjZnFjcGFj?=
 =?utf-8?B?OFJhOXFrK3ZBZy9ydWNvSFA4aStDS3VKakcwVjVKTEtXdUdFbzcrV3lpT2Vq?=
 =?utf-8?B?UFJQM1lBZllsUXo0ODFSdFBxRFhieWZrb1drbjhFOGJIOWdueGdpdU1zRWox?=
 =?utf-8?B?Z3RxMytZVFJlaXdRK0c2NW5PMm9pSk5ndmJkWU1BNVBlRTdQWlNkY3dpVzBi?=
 =?utf-8?B?K294SmxMb1k5TlBGNS90cHFmNnJid3RORGRvZEVTc3NvbTRzRzNxa2R4Y3gz?=
 =?utf-8?B?enBsVTZHODZaNlBoRi9ZWVMwTW56UEIrbUtJMzZWUU5lSnZrT1lCM2hxWnE5?=
 =?utf-8?B?QmhwWnlYcFYzZkJieUJZQXAwejBnbjl1U2x4NEdtR2dsNjhoVVNnQ0FFdzVU?=
 =?utf-8?B?Q0hKZlBaT0IyWE5KeU03dlM2Zjd5bUYreHJLaHA1SlBDZGhGdlhVeERlL0w4?=
 =?utf-8?B?MjFXU1JpaWNYVEdoWlBIdGcxUGU4QWxJL1AyTVdUbTlFOXgzaWZtNVg1NTU2?=
 =?utf-8?B?bHQ2TjkzeWxRU1ZlZ21OL1loMUlMRHJwb3NqWS93WXMzdEIxUjhvMnlUdHNC?=
 =?utf-8?B?bXNKSmxVS1ErOHZPUFVDdnFmcVo5MjRmZ1lRb3pTbXV3QlcrTUwxL2dxeVc1?=
 =?utf-8?B?ZHRKbTNEc0hRVnA5Tk1Yck4vOVBYQkloZDRWQUNxWUYvZDVBQ1daWXYwL0kw?=
 =?utf-8?B?cGt1cnp6TkdiWW4xZlVXaWJGWU1BVGR4TDFiTXVDZ0lCaWJQa3crc25oZzlV?=
 =?utf-8?B?QWkzNWZmWEZVYUdjTWhrQ29LdFJpR3dtNU9kUXJqdDJKbmJ2TE1PNTRRUmhj?=
 =?utf-8?B?LzFwM1laaGMzZUpKVm44MTF3empOSkhER1p0NVpONEl6S3R5YlFxUHJCM1lT?=
 =?utf-8?B?SkowakVHTnJEeG9ZcUZFbmUwRnRYbFh1R2ZwU3Uwd3Vqc2VsUlhVTDlUM0M0?=
 =?utf-8?B?TlZMaTBRaUZmdzIyUWxsRGp3ek1BS2diNUNOUThkZ0kyeGN5Z081bEp1Nzhj?=
 =?utf-8?B?RW1PK1kyTkhWL2ZlOGdacFVDVEJVa1VhU2xDdGN3bG1SUnFCNVRpSkpPV1F1?=
 =?utf-8?B?K2xGMDJ4ZzBWYkhYYnJScE1SQS9qUG9HU1lSZkhHdXR5dEkyYVZ0LysrRk9T?=
 =?utf-8?B?Mms1RW52bGtuVkZsbnhGT0hUNHN6WUtoVVNTSGtpNjRwd3JlcUxqMDNBWExJ?=
 =?utf-8?B?L09IV1ltM1o4d0xEMjZrdz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e4e7e8-0e6f-401d-81c4-08d9732f7a73
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 01:16:40.4006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nKjOZUdu8OSGhitn8OlSWzOknmhb+1A/2OYVWVtbXUWH2VpmRSQXZMVsIIWqigK/STqywtFYpHJ8ac9P16uLbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5005
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECC929BC4798674E8AE5C1BA9495CAA9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIxLTA5LTA4IGF0IDE3OjI3ICswMDAwLCBDaHJpcyBMYXBsYW50ZSB2aWENCmxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IEhlbGxvLA0KPiANCj4gPiBJZiB0aGUgY2xp
ZW50IHByb2Nlc3MgbmV2ZXIgc2VuZHMgY29va2VyIGRhdGEsIHRoZSBzZXJ2ZXIgdGltZW91dA0K
PiA+IHdpbGwgYmUgMC4wLA0KPiA+IG5vdCBOb25lLiBUaGlzIHdpbGwgcHJldmVudCB0aGUgc2Vy
dmVyIGZyb20gZXhpdGluZywgYXMgaXQgaXMNCj4gPiB3YWl0aW5nIGZvciBhIG5ldw0KPiA+IGNs
aWVudC4gSW4gcGFydGljdWxhciwgdGhlIGNsaWVudCB3aWxsIGRpc2Nvbm5lY3Qgd2l0aCBhIGJh
ZA0KPiA+ICJJTkhFUklUIiBsaW5lLCBzdWNoDQo+ID4gYXM6DQo+ID4gDQo+ID4gwqDCoMKgIElO
SEVSSVQgKz0gInRoaXMtY2xhc3MtZG9lcy1ub3QtZXhpc3QiDQo+ID4gDQo+ID4gSW5zdGVhZCBv
ZiBjaGVja2luZyBleHBsaWNpdGx5IGZvciBOb25lLCBjaGVjayBmb3IgYSBmYWxzZSB2YWx1ZSwN
Cj4gPiB3aGljaCBtZWFucw0KPiA+IGVpdGhlciAwLjAgb3IgTm9uZS4NCj4gPiANCj4gPiAoQml0
YmFrZSByZXY6IDc2NjgwNTdmODU2NTY1NTYxMWRlMjNkMTQzNDMyZDFjMDVkYWUzY2UpDQo+ID4g
DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9zaHVhIFdhdHQgPEpQRVdoYWNrZXJAZ21haWwuY29tPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnPg0KPiA+IChjaGVycnkgcGlja2VkIGZyb20gY29tbWl0DQo+ID4gODgxMDA1
ZWM0MDVmMjZiOGY3ZjRiNDE1MDVkNjk1NzllODNiNjljNCkNCj4gDQo+IFdhcyB0aGlzIHRoZSBj
b3JyZWN0IGZvciBtZSB0byByZXF1ZXN0IGFwcGxpY2F0aW9uIG9mIHRoaXMgcGF0Y2ggdG8NCj4g
aGFyZGtub3R0IGJyYW5jaD8gSSd2ZSBuZXZlciB0cmllZCB0byBzdWJtaXQgYSBwYXRjaCB0byBz
b21ldGhpbmcNCj4gb3RoZXIgdGhhbiBtYXN0ZXIuDQo+IA0KPiBObyBydXNoIG9idmlvdXNseSwg
anVzdCB3YW50ZWQgdG8gY2hlY2sgdGhhdCBJIHdhcyBkb2luZyBpdCByaWdodC4NCg0KVGhhbmtz
LCB0aGlzIGlzIHRoZSByaWdodCB3YXkgdG8gcmVxdWVzdCBhIGJhY2twb3J0LiBCdXQgc2luY2Ug
dGhpcyBpcw0KYSBiaXRiYWtlIGNoYW5nZSwgc2hvdWxkIGhhdmUgYmVlbiBzZW50IHRvIHRoZSBi
aXRiYWtlIGxpc3QuIEkgaGFkDQpwaWNrZWQgdGhpcyB0aG91Z2ggc28gbm8gbmVlZCB0byByZS1z
ZW5kLg0KDQpUaGFua3MsDQoNCkFudWoNCg==
