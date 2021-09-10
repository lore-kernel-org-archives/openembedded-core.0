Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.4728.1631246528315360469
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 21:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=uGV5VMYC;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="217820158"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; 
   d="scan'208";a="217820158"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 21:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; 
   d="scan'208";a="525867419"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga004.fm.intel.com with ESMTP; 09 Sep 2021 21:02:07 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 21:02:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 21:02:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 21:02:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyExdU8AsEwq+QajolXKoZSFUKZl9QpYt0d/vl6V7Yyt+9tzAOcxsl+pOGGk7YTFa0XrfdE68PRgymkRraIBVGdI9y+WANmty0IGATak+jIkLkdBuSnsPZRrYZcYuqyMxFA+12pbHal8OYkcNJg/fz+DxsyogtLEubmCbCDaHFybxHw5bDetCPtG0GR6N7vjdN3jQQOxMc7EuHighwgfDuuD9itZVG8Lepcu4IopNxdP/EQIZBaxvuooqWrOLN3AO0xSrc3BD9yamNunujO34myN7BfZcUo5pklrc051fXoeSIHerhefTUkNaMu8Ff91FrvpfFC2pkHptz91gfCVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bO/+HR3nVpMa5mpch4nTHiKGsetmrjUFb5Q5yfC6jnI=;
 b=h8LuSTEhqoxuUq/MK5c4vCs5l+xYR0eLJnS56pBs6ZuKcqZ730RzApU3iuu2NZ94WagandkWNemufQFvD7WDZ50OQQLHWDHaUbtLyeB+WCs+YIzKqjozydNSpDZHpoemXZDmbqncKrG+xbNLZorddXxxGB6Uyst/W4tQe5IMTty2M/tmxveDbWpfQLFxw8XEdvSyuXAnmGBmvg7mLZ2Vm7UOYJhcE+MGGwnkQFfZckeOOsP34vyDJtMB1YHNwrK4XINcaYKqElUXFv12XSvDIUNJrqosAkBAa7NxrHpmc/Ij5wN/ZALlkQlhmOp4RnbjOU7cEJf/lRdW+mV0ynIk1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bO/+HR3nVpMa5mpch4nTHiKGsetmrjUFb5Q5yfC6jnI=;
 b=uGV5VMYC9q11L4lF2em52UXWefGqOZOl+qWSrqjrVmJEPZh6LooZTONc7Q5jXxvqmGD21G4qNVpD1Z8kZs396D5StemeumnmQTCFoo/nc5n9Z62nbIK2zR+VBNSVSMw0cYpYOQBiJ5v/6T9RMIUv4loK1kzdpX2FH1cmlqL4lvc=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 04:02:02 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::8953:241d:7255:35be%3]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 04:02:02 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "kai.kang@windriver.com" <kai.kang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/1] perl: fix CVE-2021-36770
Thread-Topic: [OE-core] [PATCH v3 1/1] perl: fix CVE-2021-36770
Thread-Index: AQHXpfJBbbUyjpIHdkaYfxAR29Oj56ucpVEA
Date: Fri, 10 Sep 2021 04:02:02 +0000
Message-ID: <72b903727f8cacc1b2d55eb2dd3332582987ae3a.camel@intel.com>
References: <20210910031616.8750-1-kai.kang@windriver.com>
	 <20210910031616.8750-2-kai.kang@windriver.com>
In-Reply-To: <20210910031616.8750-2-kai.kang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3acea6b2-60db-4397-0560-08d9740fbee5
x-ms-traffictypediagnostic: SJ0PR11MB4784:
x-microsoft-antispam-prvs: <SJ0PR11MB4784CBD93E09E9ED050BB330F8D69@SJ0PR11MB4784.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1284;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7+kC+bcGgk8Ca/R19IQNbbs+/BadyJaaE3z51BRY/rOZnBVNqJkRsGGn5jlZ9xi33wYAMlSEpeOFuhLK+H5ociywN3C0El5SUeV4fN2MVOCCJqPoH7CqFYMbzFFsX+4Kz8ue7i5LEeHV6fdmjlH/KHaw9esqs4qNtcz1wAkuERJsiGDnjC3jpnJlFvaX4hskMZ67yvSzpWFEeKStghaLMCjBGToxcge+mXd6UjXnexvvKWY1x2Z7uvPXI95ahWyxJ+CpKySDauy6LiEFgWSxunqlBZlkFCEA+W8eMjp1xD0DeOcIze7uAfLtZRarYVnAZDdsYNxdnk6suqv3DTlrBZIqCzqFDAS9gslag0QwSJvIqQhUDKHaSKYliyA2udDEAl5NyTdCi2qnqL1zSExOp5dBHMWziOnlac6m4dctJPSaFATrzKd3YNFfvjun8An5EX5tpy2MlKz/1pNHfnVszolI6CNu6FvBzZjUABRRGiy+so5bIu7y214YP84rtIdj+4k0/JR6QAcs3dkao4N798BcSQwUBoEnrTPc7zxsO+GIh/mbMcUJsTnrmiclRT6euDdUNrDtGjC3HSod8SlPpixrzqhFSdzoAG4RPpYzIJdjb6CwB6CkSMOu/B4UN04Kwm2Ks3uktTWttYmcMw6B6L5pa9TaDnhZ5UCtRD9U9Y1cjOdONV6sGiKLTRyIvHvwF29PwE75Bc9OE0O1dmA4X7NBAEzRf7Hip23xGcp+7IBC+fyyUEasA26J5V5I0dBz2GjR+gERYDumqB7VrdUTtvaNozA9Ec3oT7K+Nld9jWCyctteWNtK0k7olr6F8d+FHvy8vvPPOqt+NnBWPPhxQA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(83380400001)(478600001)(5660300002)(8936002)(36756003)(6506007)(122000001)(38070700005)(38100700002)(2616005)(966005)(6486002)(66476007)(66556008)(66446008)(2906002)(186003)(8676002)(64756008)(6512007)(71200400001)(110136005)(86362001)(316002)(66946007)(91956017)(76116006)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cndVN1dWeVJHdWE4YnhISG1sMm1Gb3lYRWdaVSt5UXpzQjBCNlpRQnhsdlp1?=
 =?utf-8?B?RUs1ZllpdjlKTnN0WXlaZTFsYlV0a3RSVWdSNlFEOHcwNm0wQmI0MmdRS2pQ?=
 =?utf-8?B?QytqREZvK1RIcUpudGlzMWoxVlZIaFhibldseXNMQk0zQWtMWjArZlozSUpK?=
 =?utf-8?B?Z3E4czNZNko4M1V1VExENTRldmZXaU5weW5XVUl2cmNwT0syKytrK1g2WHpS?=
 =?utf-8?B?b29UWTRWd3dBaDVEU01aeE5Qb0tGenlFbjluS1dtNE5QeWx2L3VmaHJHdUZn?=
 =?utf-8?B?Tk8yc0MyQS9ldEpZMm52blczaWtVYllhSHFlU3lCQ2k5YTBldEVjUGpETVBa?=
 =?utf-8?B?cTBqWDdjTkZWZnBUNCtXalhSSVVnQ1luNTN0dWFBT3gxajd0VmxaZUVzMFV1?=
 =?utf-8?B?VHBwcUo2czhMQy9ramU3M3hNS0p2ZGlNWEdXNmVjbWQrMGJDK2lTU1YvVnlh?=
 =?utf-8?B?dUhneXA1Rm1LbXY5RkN3aEJHVnVKbEVuSVpweFphenluVW1rZ2RNV3pnWDNE?=
 =?utf-8?B?NXVOOGwrMkZRc21HclhLNnJaSklmUSt2WU8yK1ErWFBsOTl0ekJXOGx4T3Ru?=
 =?utf-8?B?K0FOSWNuSVRhaEJsYTFXZ3lXUGdLM0ZzbUVSUmRaSG9hQ1dzU2lLd2VlYm40?=
 =?utf-8?B?MGZZZzNXOFhvVWE0eDN2ZWhQYUc1eDRrYlhad2RWVkNqSldwZVdOK0FWTHBX?=
 =?utf-8?B?QTdFUFRSRFhsNUY2dnFWV3lMSHlGMkZpUjM2TkV0NXh6cnNQRThOR3pzQ3RF?=
 =?utf-8?B?MEVRU3FnSko4VmFDVlJPZXU0WG8rcFJxYjYveks1MlhBek1ReGoyWXBJTzBu?=
 =?utf-8?B?RzI4TnUyN21uclVBclBMaXlQbU9RVEx4SUpwVnNIWTdrWFBIM0ZQOUtwc1JC?=
 =?utf-8?B?dzN5Uld2NkxNaXhXc01DcFovS3pCMlFMcEY1c0haNkkxeWhzZ2FsQVhHZFVO?=
 =?utf-8?B?R2x4cGk3cWJtNFo4M3hLelJ3dThFYkhCa3BtYTB5bGRFKzhOVmVGYi9SaC9Y?=
 =?utf-8?B?NGIxNTRGK2l0YnJnRXhhQVk5b01ERzdsUWpyYzVLa01qakdPYlp3U1FCWnI1?=
 =?utf-8?B?RUczYWc0MkU3Tk5MY25iUEM3OEJMNzlvV0NiWko3V1FqSWdBWWxBZXlZY3dt?=
 =?utf-8?B?bGJObnNCVHZxM1loZEkreS82Q0k0enZ1TFhsTFI1WVZlS05jaGNhSTg5MEht?=
 =?utf-8?B?dmFKU1NqeC9BT21HUlZ5WTY5Um4xUDMvRlV4WnBDYmhKRGFkREdUajNkV0Rl?=
 =?utf-8?B?Znk0SEk0RVBSN29rZUYzODkxbmh0b2M3TkZPaU9ST0tjSDR5bzRxMEJBUUFq?=
 =?utf-8?B?L2xpbkYxMDloWG0zOUtxUlF4VkFoakJ0K1RpSWRXSFh2YXBDMytldWM0MTRu?=
 =?utf-8?B?YWF6cStVbFdCTCtmaUF5Z20zMk02OHp3ZUxkamJnRXhGRVRzODA0T1ZYSE02?=
 =?utf-8?B?aW14OEp1eHk4VXo1Y0FaSERKSW5Wb254TzdSMC9tRER0TkVFTFNBR0RwaWFZ?=
 =?utf-8?B?TkZkL0JhZE1GYnBGbDNWcHhjYVZpalI4QlpkOCtscG5peDVBOGxvUzdBdzd0?=
 =?utf-8?B?NTIxbnFlRS9QQjdCOWJrVnlXTjZORUhJNjlKeTNXS0VRMmt4SHNhZiszM3ds?=
 =?utf-8?B?bWErbndoWngvNENobkt0anU4OVJuWCtHU2dWTUxDRjJ0c3BweGd0NUNVWktv?=
 =?utf-8?B?SHViS3VWMWZPSWN4QVlCTTlMbWJ2cnR1bWpLT1ZkbmQxUGlONXJTNHBWZ2ta?=
 =?utf-8?B?WW5XYW5GdnloUDEvRFdKQmZqZDlRK0FZM2Qwb2dGWWJiMnRVUmVadzA0RG51?=
 =?utf-8?B?MElDVk1FVHAvT2xpU3JUdz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acea6b2-60db-4397-0560-08d9740fbee5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 04:02:02.4532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +E+pCr+DriKdTTHyMUGqY69xiGS175uM0VJs9CZcTcE4WQy5KgERU3fyfpVz/oWilQ4YKeR8+mAEkSYKJSVXKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4784
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F62B5CF370845E47A413BF7D0F13A570@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIxLTA5LTEwIGF0IDExOjE2ICswODAwLCBrYWkgd3JvdGU6DQo+IEZyb206IEth
aSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPg0KPiANCj4gQmFja3BvcnQgcGF0Y2ggdG8g
Zml4IENWRS0yMDIxLTM2NzcwLg0KPiANCj4gQ1ZFOiBDVkUtMjAyMS0zNjc3MA0KPiANCj4gU2ln
bmVkLW9mZi1ieTogS2FpIEthbmcgPGthaS5rYW5nQHdpbmRyaXZlci5jb20+DQo+IC0tLQ0KPiDC
oC4uLi9wZXJsL2ZpbGVzL0NWRS0yMDIxLTM2NzcwLnBhdGNowqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCA0OQ0KPiArKysrKysrKysrKysrKysrKysrDQo+IMKgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bl
cmwvcGVybF81LjM0LjAuYmLCoMKgwqDCoCB8wqAgMSArDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA1
MCBpbnNlcnRpb25zKCspDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9wZXJsL2ZpbGVzL0NWRS0yMDIxLQ0KPiAzNjc3MC5wYXRjaA0KPiANCj4gZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2ZpbGVzL0NWRS0yMDIxLTM2NzcwLnBhdGNo
DQo+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BlcmwvZmlsZXMvQ1ZFLTIwMjEtMzY3NzAucGF0
Y2gNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uMjhiYzQ1N2I4
Ng0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL2Zp
bGVzL0NWRS0yMDIxLTM2NzcwLnBhdGNoDQo+IEBAIC0wLDAgKzEsNDkgQEANCj4gK0JhY2twb3J0
IHBhdGNoIHRvIGZpeCBDVkUtMjAyMS0zNjc3MC4NCj4gKw0KPiArVXBzdHJlYW0tU3RhdHVzOiBC
YWNrcG9ydA0KPiBbaHR0cHM6Ly9naXRodWIuY29tL1BlcmwvcGVybDUvY29tbWl0L2MxYTkzN2Zd
DQo+ICtDVkU6IENWRS0yMDIxLTM2NzcwDQo+ICsNCj4gK1NpZ25lZC1vZmYtYnk6IEthaSBLYW5n
IDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPg0KPiArDQo+ICtGcm9tIGMxYTkzN2ZlZjA3YzA2MTYw
MGEwMDc4ZjRjYjUzZmU5YzIxMzZiYjkgTW9uIFNlcCAxNyAwMDowMDowMA0KPiAyMDAxDQo+ICtG
cm9tOiBSaWNhcmRvIFNpZ25lcyA8cmpic0BzZW1pb3RpYy5zeXN0ZW1zPg0KPiArRGF0ZTogTW9u
LCA5IEF1ZyAyMDIxIDA4OjE0OjA1IC0wNDAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIEVuY29kZS5w
bTogYXBwbHkgYSBsb2NhbCBwYXRjaCBmb3IgQ1ZFLTIwMjEtMzY3NzANCj4gKw0KPiArSSBleHBl
Y3QgRW5jb2RlIHRvIHNlZSBhIG5ldyByZWxlYXNlIHRvZGF5Lg0KPiArDQo+ICtXaXRob3V0IHRo
aXMgZml4LCBFbmNvZGU6OkNvbmZpZ0xvY2FsIGNhbiBiZSBsb2FkZWQgZnJvbSBhIHBhdGgNCj4g
cmVsYXRpdmUNCj4gK3RvIHRoZSBjdXJyZW50IGRpcmVjdG9yeSwgYmVjYXVzZSB0aGUgfHwgb3Bl
cmF0b3Igd2lsbCBldmFsdWF0ZSBASU5DDQo+IGluDQo+ICtzY2FsYXIgY29udGV4dCwgcHV0dGlu
ZyBhbiBpbnRlZ2VyIGFzIHRoZSBvbmx5IHZhbHVlIGluIEBJTkMuDQo+ICstLS0NCj4gKyBjcGFu
L0VuY29kZS9FbmNvZGUucG0gfCA3ICsrKystLS0NCj4gKyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiArDQo+ICtkaWZmIC0tZ2l0IGEvY3Bhbi9FbmNv
ZGUvRW5jb2RlLnBtIGIvY3Bhbi9FbmNvZGUvRW5jb2RlLnBtDQo+ICtpbmRleCBhNTZhOTk5NDdm
Li5iOTZhODUwNDE2IDEwMDY0NA0KPiArLS0tIGEvY3Bhbi9FbmNvZGUvRW5jb2RlLnBtDQo+ICsr
KysgYi9jcGFuL0VuY29kZS9FbmNvZGUucG0NCj4gK0BAIC03LDcgKzcsOCBAQCB1c2Ugd2Fybmlu
Z3M7DQo+ICsgdXNlIGNvbnN0YW50IERFQlVHID0+ICEhJEVOVntQRVJMX0VOQ09ERV9ERUJVR307
DQo+ICsgb3VyICRWRVJTSU9OOw0KPiArIEJFR0lOIHsNCj4gKy3CoMKgwqAgJFZFUlNJT04gPSBz
cHJpbnRmICIlZC4lMDJkIiwgcSRSZXZpc2lvbjogMy4wOCAkID1+IC8oXGQrKS9nOw0KPiArK8Kg
wqDCoCAkVkVSU0lPTiA9ICIzLjEwXzAxIjsNCj4gKyvCoMKgwqAgJFZFUlNJT04gPSBldmFsICRW
RVJTSU9OOw0KDQpUaGlzIGlzIGNoYW5naW5nIHRoZSB2ZXJzaW9uIG9mIEVuY29kZSB3aXRob3V0
IGhhdmluZyB0aGUgY2hhbmdlcy4NClBlcmhhcHMgdGhpcyBwYXJ0IHNob3VsZCBiZSBkcm9wcGVk
IGFzIGl0IGRvZXNuJ3QgbG9vayByZWxldmFudCB0byB0aGUNCmZpeCAuLi4NCg0KVGhhbmtzLA0K
DQpBbnVqDQoNCj4gK8KgwqDCoMKgIHJlcXVpcmUgWFNMb2FkZXI7DQo+ICvCoMKgwqDCoCBYU0xv
YWRlcjo6bG9hZCggX19QQUNLQUdFX18sICRWRVJTSU9OICk7DQo+ICsgfQ0KPiArQEAgLTY1LDgg
KzY2LDggQEAgcmVxdWlyZSBFbmNvZGU6OkNvbmZpZzsNCj4gKyBldmFsIHsNCj4gK8KgwqDCoMKg
IGxvY2FsICRTSUd7X19ESUVfX307DQo+ICvCoMKgwqDCoCBsb2NhbCAkU0lHe19fV0FSTl9ffTsN
Cj4gKy3CoMKgwqAgbG9jYWwgQElOQyA9IEBJTkMgfHwgKCk7DQo+ICstwqDCoMKgIHBvcCBASU5D
IGlmICRJTkNbLTFdIGVxICcuJzsNCj4gKyvCoMKgwqAgbG9jYWwgQElOQyA9IEBJTkM7DQo+ICsr
wqDCoMKgIHBvcCBASU5DIGlmIEBJTkMgJiYgJElOQ1stMV0gZXEgJy4nOw0KPiArwqDCoMKgwqAg
cmVxdWlyZSBFbmNvZGU6OkNvbmZpZ0xvY2FsOw0KPiArIH07DQo+ICsgDQo+ICstLSANCj4gKzIu
MzMuMA0KPiArDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcGVybC9wZXJs
XzUuMzQuMC5iYg0KPiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS4zNC4wLmJi
DQo+IGluZGV4IGFiMTlhOGQwYmUuLjBlMGZlN2Y5ODUgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9wZXJsL3BlcmxfNS4zNC4wLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9wZXJsL3BlcmxfNS4zNC4wLmJiDQo+IEBAIC0xNyw2ICsxNyw3IEBAIFNSQ19VUkkg
PQ0KPiAiaHR0cHM6Ly93d3cuY3Bhbi5vcmcvc3JjLzUuMC9wZXJsLSR7UFZ9LnRhci5nejtuYW1l
PXBlcmzCoFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vcGVybC1keW5sb2FkZXIu
cGF0Y2jCoFwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vMDAwMi1Db25zdGFudC1G
aXgtdXAtc2hlYmFuZy5wYXRjaMKgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9k
ZXRlcm1pbmlzbS5wYXRjaMKgXA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZTovL0NWRS0y
MDIxLTM2NzcwLnBhdGNowqBcDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIg0KPiDCoFNSQ19V
Ukk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgXA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZp
bGU6Ly9wZXJsLWNvbmZpZ3BtLXN3aXRjaC5wYXRjaMKgXA0KPiANCj4gDQo+IA0KDQo=
