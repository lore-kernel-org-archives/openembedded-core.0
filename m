Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.36353.1629792901819090780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 01:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=aXEPY3wa;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="302843441"
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; 
   d="scan'208";a="302843441"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 01:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; 
   d="scan'208";a="426029773"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP; 24 Aug 2021 01:14:59 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 24 Aug 2021 01:14:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 24 Aug 2021 01:14:59 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 24 Aug 2021 01:14:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CU1O7gAJhJ+jqMWVYNBzZaJT15rL4m0RuoH8+b+pQC+wtogxjorIhZn1A/AAysS/9lEhc1nQ/RbQH/+Ub41491Mc4vl6lzhinMwhWnUvCJfKmvDaZB0xitAnnwkhn1QH9mQnQfA0onGDrlFNqtMn6jl0c2+FkzJ0wpDIXpg4N/J5dlbormmNXLHgDCNn8Nf+hUtqKkQTKcW5RWfdpvCoI3s3oopmwnh+ZL0atxvXJJop+Hg8YizM/f5D0i6pc2NkM+350SXSm0BXIcjZ9kSbwBqZynLGUDJAdhd2WAA5VR5mnVV0hbfHDjM84kqGFJ8pCVMJ4bFKDxonXcpvty3NEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MyR/iSQmx9TqCHAHfxXfcEVPJrpWFawRZxWIG11okE=;
 b=bJn6yKHTSKpXQsJ8c5BOBnRM4UpAyiHDjaKMeQiB9/bR3bTzaOL8BTBsxaBJzZhEGgLxMyvZMSujWhBbxxFWrmy14CI4zKsW1/IMrs2tEW13FNp9rA3yFzLMOCK4/feFw/uzwUl9t3WiSVNiplY5tutN2AjY6tPxSAy9KOf62YTHpRvJTfayZteSLaQFYoy8HvrTBr4JahYgND8R6WTv7QMqo+5dl3ExlRQwWbZeP9FPwm6m78sJrG1Lnfgs+F7Ti4abxeOUfb7zINNaf7VWG4ISCOGCUHoAGTiB1dLYmDoft3JRbGreM4Vr7EuX0MvXfOFDsmGonOKproj9O6SQAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MyR/iSQmx9TqCHAHfxXfcEVPJrpWFawRZxWIG11okE=;
 b=aXEPY3wanCfp/Wj1ngaqaNDyE0Dn29RRaqnn8fCRHRwsh+sa6xA72szCgs7y/zKGy8LFuDXIaqBq3O2LYQX59m2Sm7Tu37xqi2lUKKHYtnhvYETqtcCCgSFlPRZliY2xBhRIirja3eZNw1WoQ2oZAzB1x5vODqzTold2kFOeAyQ=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB3896.namprd11.prod.outlook.com (2603:10b6:a03:187::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:14:58 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::d7c:227b:e92b:611c]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::d7c:227b:e92b:611c%8]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 08:14:58 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "sean@geanix.com" <sean@geanix.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] lib/package_manager: Use shutil.copy instead of bb.utils.copyfile for intercepts
Thread-Topic: [OE-core] [PATCH 3/3] lib/package_manager: Use shutil.copy
 instead of bb.utils.copyfile for intercepts
Thread-Index: AQHXQkyTjbqTwyeRiUyw/FBU4jTa5KuBsRcAgAFKkIA=
Date: Tue, 24 Aug 2021 08:14:58 +0000
Message-ID: <c7aeb4413ec3937439e4ceee8a030dc4eb237ec7.camel@intel.com>
References: <20210506075100.1984260-1-richard.purdie@linuxfoundation.org>
	 <20210506075100.1984260-3-richard.purdie@linuxfoundation.org>
	 <20210823123150.4l3pkck4hg3kpi54@skn-laptop>
In-Reply-To: <20210823123150.4l3pkck4hg3kpi54@skn-laptop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: geanix.com; dkim=none (message not signed)
 header.d=none;geanix.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aca5fbdc-f5c2-42ac-060d-08d966d743a2
x-ms-traffictypediagnostic: BY5PR11MB3896:
x-microsoft-antispam-prvs: <BY5PR11MB3896B308D7DB98944FAB16E6F8C59@BY5PR11MB3896.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R4Xwc3mtiVtQE8qEW77fEq1oMrRKPJ6FHCAMPN9Kk/9mKc9A2m9jYczPhfLitOrePXBdKStsF3oBQbFuOt/zslsDO3Bwd7Ee6oWO1jUYUHMPixPiULg2A2CVyD7TgCfMjqWGCgXIGUdeq3q0eD4H1ZA+VNGMM/Tclld1T7qHCIWwIK4KowcBn8SlbX2d9QlesIR7Q9VDs7hoznclhleTrhAjb5rk1+GavUKem0+14ABklOBtOWwa+BbdCMwjO/cbjy1eTBQMPX/AVHi+MqGJXoBVmkKMCblK2wQfFnDPCYA0AgFyxr4W4H2rHgRUi0TMJWDVyXtXOupaIsAJ32pj1S+DXu0sVYHWjNWIO/0xH6eejV7lMcWqDJQDIC53fRTvDYoUwki+zoVJlx8dUY46xvOq+H3iacO2V5gNs4vkVv2N+4KdjH9JBJMCC+Y/BW8uE1JBh0a2aU0CkM5hKSegLdW/7D55dwY9770rpiW3z02ECPqiw1ADcV2eKg73bs+D94JGN5h2fy387WwiyD5EHBCqlzk1nWs+5iFXGlg+RoW31U3s9gpziNektIPv2txDTGDLohCw6sOu6npReIcn01W1vtrRcoc36vsmZE6QPj33oypPKkMXLupRk8g1sAld9mROXOpSbLO4DUyooeEIspw34O2rt66zbnAjoFsuohDZI/QWXx+27iUH4Hm1zrD+ntF7U3WbqDzLpJ5GR6mQaOgYxVqZ1VdutMcLEsuH1sX5fqwlDY+VlZzis92jVCG3k6CcqUuVay5iUMW26DtL6wXN2QWhWPVQcdZDttau8+w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(8936002)(76116006)(6512007)(66476007)(4744005)(64756008)(66446008)(66946007)(66556008)(316002)(4326008)(2906002)(5660300002)(110136005)(91956017)(8676002)(86362001)(966005)(2616005)(6486002)(38100700002)(186003)(122000001)(38070700005)(71200400001)(36756003)(26005)(478600001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2ZlYStPSXg5T1F4MFJFcUlRUkRSQzBlUVA0WXdzOXo5aFhBQWxBaG0xbTJT?=
 =?utf-8?B?ZmpnOHgrRzZIcVB6enFhN2JlN1ZtRjAwVlNZaUxhclIyUmdwbWJlVXlWcHFz?=
 =?utf-8?B?Zmgvb0MzMlluQXBsRVhMUFhuUG1RNGNOYWUyckp5UW5DRXVjQm5rbVNTeWd4?=
 =?utf-8?B?L0JaWVY3M2pwVE1KRkZHYUV6MXJNckR0b1hSa1cwVnZtb2QvNStrZlNqS0Vh?=
 =?utf-8?B?NVhxR2Q3cnl2Wk8rOVFxNnNIdG9IdW9tZHY2ejhlTHlacVdybWRRTFVDenAz?=
 =?utf-8?B?aFBQRWdaU0Zta0tzOXFOclJZWFpGdC9JTGVOaGpGeURsalIweUNaSjRkMzAw?=
 =?utf-8?B?aDN4bjVWMTZUa1Y4WVZSUzBkRy9FT1NJZkhqUG8xdjB4RmpHZkpqZXBqd0tT?=
 =?utf-8?B?VUVaWjJ5V2tvT21JSDBGaTFMeFdsSUF3bE5YVHhZQlRqZjF3emFqVDl6dTMy?=
 =?utf-8?B?TUlnNDlWZUVwcmUzbVVvRGVGYkpQOHlnZzJYWE1lVjBEa3ZZRWxRakZGbzU5?=
 =?utf-8?B?dmo0TG9DOUJFWXQwa2tCbm53bEFwaG9SRXUrRW9mYW1KbTR4UU8yOGc5OVN2?=
 =?utf-8?B?b0F2MEdWbzNMUVVkaVlaUURqYlNjeVFOSEpYTVFTYXNZQ0FJb0tZclFUV3I2?=
 =?utf-8?B?eGVINTFYNEhwdlJNcFZ0QXJaZFRQZlVxNHVVcFVEditRTm5FTDRSaVYyMVlt?=
 =?utf-8?B?TEd1RGgwYzRRSXRWSWVHWDREbkd5MEpGWERzK1oyL3c5R0JRZTNnLzViUzZy?=
 =?utf-8?B?Rnd4Y0FPS0FOQlBEbkgrR3B6VEVNbG5YQ1gxR3d5RnQrQzFDWXdSZS9UMmJD?=
 =?utf-8?B?QVFTUGpVR0I2enNnWDFDcmhQaDQ3a3B1WDIvOE5IWU1VU0VMSDVvQjY2T2ZN?=
 =?utf-8?B?eFJBa1VVVG5ycVZZUzRIRFE5eStaeXpjbnNQQUNIRWcvcHVQeVppVlRWUWJ4?=
 =?utf-8?B?QWJqNWtaNFFYUm13aHIyaTBDOE13a3dqTTc3SCtDSlozUkZtOUl3WG5SMk9y?=
 =?utf-8?B?V3RNUEM1cjdsUndRNGZjQkZDVFIzZC84VzVVUEF1eEtZUUR1bGNZUWpiZkEr?=
 =?utf-8?B?SUFYemZvQ2owM0NySWFpOEpjNE9oZnRQOTF5WEhvcHl5Ti9rSTBFS2JNUTJh?=
 =?utf-8?B?cWd0MDhEQWNEMzU1TXQvWEo1WmlxQ2ZEYmpYNVFIV0xadDJLYVZZQ1Vnbmti?=
 =?utf-8?B?VTFnRHREaE5lb0U0Tzk1MlBUWDFnOXRoejg1U2JKeDJhQ1lrblJLaG43RTFG?=
 =?utf-8?B?Z2dKeS8rL09lMjBjZWJlWUpWMlpBRXhwYWFUWDlaSnRUcDgzY04wNzFib3pX?=
 =?utf-8?B?RndxU2o2VURxVmxaVWk3S1JjWDMwc1gyVGtHT1orc3J0MTRBY2wzOWtRWWtz?=
 =?utf-8?B?STlhWEFRMXdDVXA3U0ZBWDM3eGZqVGZrNVFVQWdYa1JvbVdVU21GUlBBbWNq?=
 =?utf-8?B?MEF3QWN5K2pYWFY1QnF2OVFrcXNtZDVTV0c3RmFKNm1YaFZpcGx6YzZIQ0JZ?=
 =?utf-8?B?bUVzc2dJeFI4MThTM1JhOHJEY0llc0RMTnZWWGNpQkF3dDMwYjVtZDRqWXZM?=
 =?utf-8?B?U0FDQVFWNDZaUnN5djY0eXMrL2lRM1lyOXZ1Mkg2YUZWRG9na3FYQ3VlbnRF?=
 =?utf-8?B?MkhZazVwcmhPU1MyYW1lZkplcXVpMGgzUzZqM1NxVi9DSDhSNTJpS2xKVDFx?=
 =?utf-8?B?bTd5RlFKR1FqSVFlQkUwMWNjVmFXcTY1Nkh3cU5scURsd0FsTTgxMGZwdnFs?=
 =?utf-8?B?ODBWWTEvWjdGZVVYdEh1ZllmVjZ5N0dtOFkrWEIyc1BvTVQxZjZVWVVYTU1C?=
 =?utf-8?B?cVIwcHhDbWFIY0hoTWZ6dz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca5fbdc-f5c2-42ac-060d-08d966d743a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2021 08:14:58.6537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aBfb02XZwqzNTvBQb/Y/yIBgjWX4mv+e2KVIh8GHsuSntGnuJgoUC+tPUBSGGsGe0UzWeyJvoalugK9eFYAM+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3896
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEA6096FA01899478E9DB5300DBBFC31@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCk9uIE1vbiwgMjAyMS0wOC0yMyBhdCAxNDozMSArMDIwMCwgU2VhbiBOeWVramFl
ciB3cm90ZToNCj4gT24gVGh1LCBNYXkgMDYsIDIwMjEgYXQgMDg6NTE6MDBBTSArMDEwMCwgUmlj
aGFyZCBQdXJkaWUgd3JvdGU6DQo+ID4gSWYgdGhlIHNjcmlwdHMvcG9zdGluc3QtaW50ZXJjZXB0
cyBpcyBvd25lZCBieSByb290L3Jvb3QgdGhlbiB0aGUNCj4gPiBjb3B5ZmlsZSgpIGNhbGxzDQo+
ID4gd2lsbCBmYWlsIGR1ZSB0byBjaG93biBpc3N1ZXMuIFdlIGRvbid0IGNhcmUgYWJvdXQgb3du
ZXJzaGlwIG9mIHRoZXNlDQo+ID4gZmlsZXMgc28NCj4gPiB1c2Ugc2h1dGlsLmNvcHkoKSBpbnN0
ZWFkIHdoaWNoIHdvbid0IHBlcmZvcm0gYW55IGNob3duLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0K
PiANCj4gQW51aiB3aWxsIHlvdSBiYWNrcG9ydCB0aGlzIHRvIGdhdGVzZ2FydGg/DQoNCmdhdGVz
Z2FydGggaXNuJ3QgYmVpbmcgbWFpbnRhaW5lZCBhbnkgbW9yZS4NCg0KaHR0cHM6Ly93aWtpLnlv
Y3RvcHJvamVjdC5vcmcvd2lraS9SZWxlYXNlcw0KDQpUaGFua3MsDQoNCkFudWoNCg==
