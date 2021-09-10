Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.5756.1631255948840838215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 23:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=uDWPalUI;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: jay.shen.teoh@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="220681947"
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; 
   d="scan'208";a="220681947"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 23:39:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,282,1624345200"; 
   d="scan'208";a="694579656"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga006.fm.intel.com with ESMTP; 09 Sep 2021 23:39:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 23:39:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 23:39:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 23:39:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 23:39:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l60i6Ne6Ji3MdqIDi+MIcyY4YzGsery8mJWkXlb6fbgDI1SDBCAA2uNMLedAVD7U6CkaUcst+NnwXv9f9UnqbQS1cXHfepqxrHdSOOQX9E8DM7vtVCeQcjLVfRwIZSsju3MgbIcLd5OhovRixFy2JUsWShsThElYBZJhvviuUvHIyJvR0nxtnq7aP3XWyjJJAx6wtMTWc97rBi0eoYNq+cFDPKfagOtyGooWdStuDK2d248y5LEumdg7jYRk7PW83bZhFnkWZPqO59ISxeG2z8iBoAAwPH+fdThqyetgvc11ScwmbKYGV87e9gvzt5FP3JxRbqk9X/P3wXEacVqiSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=v6V8LAfddRoIq0kjylixEuaaxWTyzNKUCsfapCJrUQQ=;
 b=bYPSwkOZiegQhTlEnzLP7DcFTZdAwqL4A6FDb8EywQ78l65dgM1aA6MvAiHZniqwa6Yixl9gpUHcHCghwbDQYH2IWoC3cUb9LA9faWZG5PymIsmTGzhiZMlPKb1KWidRIBQ1UITGMgDw0d/5M7CJpjvCeRAPNuAxd1PrN/6uSn0rgjp9d4j4VJ6/jy0Ymb/mRMRSz0/D5D2MjrpYv2HnPG8j2dRMCLgTp3E6CEyuAJ/OwpBKrlMuezK2AasH4sAzzWN84bZJvb9UNRkgRx3odEqvJ4EVx3Ug+P7twaunDW5ej3nf9UYc8dYtGrPNjjMwkaZf9D0obQLKefeQNl8G2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6V8LAfddRoIq0kjylixEuaaxWTyzNKUCsfapCJrUQQ=;
 b=uDWPalUIl50vHx4t62DB6W+se05vOOodAJPTfq7TFGPRkLg3UeZg0lun5amsJHRBdSKMLSUyyVruXymrUCDEvnB9D9sBNaGFGDoI8L9dAy6zdFP9GDALq0VtV6pAEAQiD5bM1Uv+LeW3rgdcXvHMdY51bJfNfxn0cgGJDGiP9yo=
Received: from BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5)
 by BN9PR11MB5498.namprd11.prod.outlook.com (2603:10b6:408:103::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 10 Sep
 2021 06:39:05 +0000
Received: from BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::9ef:5965:3a7e:7b8c]) by BN9PR11MB5372.namprd11.prod.outlook.com
 ([fe80::9ef:5965:3a7e:7b8c%8]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 06:39:05 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Jain, Sangeeta" <sangeeta.jain@intel.com>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.3.3.rc2)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.3.3.rc2)
Thread-Index: AQHXpbVH6sWIQWJtO0yz1L11rcG/qKuc0Mow
Date: Fri, 10 Sep 2021 06:39:05 +0000
Message-ID: <BN9PR11MB53728D00D9321AE9BECCB725BBD69@BN9PR11MB5372.namprd11.prod.outlook.com>
References: <32334a100a5bd0c20239e42a463e5604f00345ec.camel@linuxfoundation.org>
In-Reply-To: <32334a100a5bd0c20239e42a463e5604f00345ec.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f96e2e7c-0fb5-4c7d-1279-08d97425afa5
x-ms-traffictypediagnostic: BN9PR11MB5498:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR11MB5498469F91A6E42D78445B8BBBD69@BN9PR11MB5498.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: baLZtK5JomtbRPQ4QRap1vw/jOPDwlXKmUyxy4eYIqif4vy+Nc5ur8KFIlf262xdP2E8Bf+Y16PnHivALITmPsl43D3xKYYcqMvnrpc//eXPMDkEZc5iaY5WE2J6g9pEUXpIZB+gWA5B4OszCJizmqQ0WdIKQRtnLZciO7Mivl18xiP03Usx8WjZ3d1rdDakle4Qg3WTasVAx9gxDMs7svb3SbTSwb8Z0Ydndd6y9n4XVihtvtaLVyU5Awp/jqr0Xeegx/KvJLYlD6JT/wN1hoDE+YkZoz4TJRwW24mUPaXS+GpZxwk2hKCvSYX9cxJPG4mfALAcyWRVAtRJSRYSruAG0f+kpDGW6hdj7mpkk0T5PsLKv8YmWuVtUhOtmUsh2oyMpZwPBiyQbFHgJHUMdAnDkGq7sbhLXE7ShDmItTGSewtwdza+p9cQqvzRCOmNAMFiaay5uJYc5tP3ZdZu7vTP4smuAGrY4wl3s85OjGbpwK+GoCrMKu+qSRQc1CnK1jqLaiXiI+/FlJ2vGiRSzwXB7D+ZPrI2IMumXnQOFSShWBE9KgzOy8x9ybJXfvZ3LUZSc68+AqiKUM2KFenD2Nu8d9BhhRa2BesvO8At/PcXjva8ORBY48YFVvZv2YpT4locTklObevYB8/pgRDW5s6tuunME3bgIbDkzzuKuGYH4acnX4bUFWtevBDZpXqRjkBZPMW3OrsUPKHpcvDoMu3GcEEA21k8dZNy6HiH+GzSq+NYmBaliU+P/+VxEUMtOs3O13NGqsNfZQDdF1b2mdVwPSqUvZO2qP8gaqz1knMpHg5mKpzwvDSZIW4CKXRiUf+bBiKvQKkLcxqf6VakKQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5372.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(376002)(346002)(396003)(55016002)(8936002)(9686003)(64756008)(38100700002)(66446008)(316002)(2906002)(33656002)(6506007)(66556008)(66476007)(76116006)(71200400001)(83380400001)(7696005)(38070700005)(5660300002)(52536014)(53546011)(8676002)(186003)(110136005)(966005)(107886003)(15650500001)(4326008)(478600001)(86362001)(122000001)(66946007)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEcxeUZidnVnUG1SMFNSSStGeXozV2crSTlRYlBVY0pNSDU0SDVYQWRJU0tC?=
 =?utf-8?B?NGNWTEtDZE1nQzBYNDlIR1pkWVBFazRJYURIdFZ5NVZTRElCT0loa1pVd1VI?=
 =?utf-8?B?aDlkQStLdTJIZisxS3JhT1NqVXlQT0lCUVhqQllETFRFMllhNUVwNzMrSG53?=
 =?utf-8?B?QzI4djljUWg3bk84ME5jQXhBd2FJa2dFajVsbVBEaEJtalF2b051RWZwR1ph?=
 =?utf-8?B?YWFMVkQwS21OVWQ0allTRE5iZXl6R05PdDUzRjJPZnQ2QlkwWlZQTldEbjBQ?=
 =?utf-8?B?RVY5NHhKYXpUUmJuQy8rQ2hVYmdMVG9iSVdoY0M5NGlFL0c3Sm9iMENSQ3d3?=
 =?utf-8?B?SDNnaHBKMlZObnN3V3J3bFpUdkFhYXlhblpJWVE1RE5tYnZLekQ3cXNsSmxa?=
 =?utf-8?B?Ym9DUXlHQWUwbHNUamVBbVNJWlNDaWpwVk9BMmZtZ01TRnRIMEl0WWs0bHZK?=
 =?utf-8?B?VWJtdG13UmJ0bXAvUGZPZkZJZ0tWbEtJT1AwL2krdHFiYzFMTWZ4TndHcVlz?=
 =?utf-8?B?WGNJSUlTZGhzaFY0anZyR2lPSGV5aFJ1VlRRTnZwSk5hc1JObG9MWVVzbk1w?=
 =?utf-8?B?TkVYbWJpZytaQTRlNXMyRDhUZDY5aDY2bmsxZmIwb2xPMzV3czFaMzhSYmZa?=
 =?utf-8?B?dUZ1SUdPTjlCY0h6T2JraXdsU2VOZU1SQXJhcG5tMytjRkZzcVF2b3ByL3ZI?=
 =?utf-8?B?b0puRWhtamh0UFJIY2FHNVpVU005SWkxOWdZb2JLMG02N0RrLzg5Sm5FcjRq?=
 =?utf-8?B?T1dJV1JGZUN3b2YzYWNGczVnbCtibzRkTmpUbWlIRG9ZUS9ieVBaNkl1L0RE?=
 =?utf-8?B?WlFtck5FcFBma0tZTW5OS3NXZzdGNC9tSGJaQVMvTVMwblZ3ekVNZEdyNVZM?=
 =?utf-8?B?TU9rckRrTTZDbDhacUxFVDNwMzdRTzRHbVRtcFJQalJqVERoZ3NhMXJsTjFn?=
 =?utf-8?B?SnJTR0wvakM3QWhoVUhiNWpIbGFuOC9jZnhPL2tuZ1F4VmZxb1ZKN0NDMFNL?=
 =?utf-8?B?d0d1UkhJUGVWWk1XSlRxNDAyM3huTXRNNlE2MEdKN0U0WUUvWG04MWNSOEZ3?=
 =?utf-8?B?cVo5bEo1NFFELzhzN0laU0xNcTkyWEYxU0sydXFTNkhMUndqa3ZQZ2pmMFJa?=
 =?utf-8?B?QWw3NmVzWTFnczJ4bHNJU2ZTQ0V6SHN0WUI1dldIQi9Jb25GbWU4T2pmUVFH?=
 =?utf-8?B?TnJueE1mc2hNanI0RHBiNXdCa2hQOTBEa2o1WjAxZGNabTMwUGNYTVNXTTdk?=
 =?utf-8?B?eWNlN3dPYjhDaFJ3SnRpWE9pM3N4eU5IWmVGOVpNNTYrekd0Qk5yYjVzb1RK?=
 =?utf-8?B?R0I2WjdvNXpwTVVrc1puN2JLZHAzdEJJNE1Pc3NpMGNyOTRzb1Z0Q0swc2FV?=
 =?utf-8?B?VTBjNlovVDBHSTdlbjFud0RjK01udDl0QVF3OFJTclkxQThxLzBkc1N3cVUr?=
 =?utf-8?B?YlgrVWVpeE1oN09zN0tLTUlzd1Ric3NGNXpUNE83eEVyUGxOY3FIdkdnNjVv?=
 =?utf-8?B?QjF0dTN1ZzVXS0t3QWYyZm1IUkplMzhTV29MZ0lrSno5WHFvdE1zMUZDOExQ?=
 =?utf-8?B?K280SjBqRnNxNkMxME5GNGlXSnp5U3VKWUwvcFBVa1YxRUdQaGV4aGd6d2hs?=
 =?utf-8?B?MGdKcnE3TVZtVlMwWjRLQ05iZ25kOFRNN0QwUEFoUTVQSnVRY25HUU53TlQ5?=
 =?utf-8?B?dzZ1WC8vemF0dTE0WkYxS3lXS0gvRGg0S01jQTRRQWtDTm1ld1VTdHZoa3No?=
 =?utf-8?B?UnVUVklheXZZUDdBL05KdmJRYU5ubjFkZ1BGU2dEWHlCUnc1em4xWXRiUFlm?=
 =?utf-8?B?SWExeHkveWk3WVhUclFteTI4QjJIWlhTbWlnSDUvT1k0RU1ONzk4RXhTK3RF?=
 =?utf-8?Q?W6MwaO4qvCvQf?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f96e2e7c-0fb5-4c7d-1279-08d97425afa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 06:39:05.8282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l3oR5qR0g2h2h8skUmbhsVW0xfsbLYLWYYOYlyjiFkkDwDDqa4IjrwHTyMHSr459AZgC+/Dd0xJzCC9aHh6Kpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5498
Return-Path: jay.shen.teoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gYWxsLA0KDQpJbnRlbCBhbmQgV1IgWVAgUUEgaXMgcGxhbm5pbmcgZm9yIFFBIGV4ZWN1
dGlvbiBmb3IgWVAgYnVpbGQgeW9jdG8tMy4zLjMucmMyIFdlIGFyZSBwbGFubmluZyB0byBleGVj
dXRlIGZvbGxvd2luZyB0ZXN0cyBmb3IgdGhpcyBjeWNsZToNCg0KT0VRQS1tYW51YWwgdGVzdHMg
Zm9yIGZvbGxvd2luZyBtb2R1bGU6DQoxLiBPRS1Db3JlDQoyLiBCU1AtaHcNCg0KUnVudGltZSBh
dXRvIHRlc3QgZm9yIGZvbGxvd2luZyBwbGF0Zm9ybXM6DQoxLiBNaW5ub3dUdXJib3QgMzItYml0
DQoyLiBDb2ZmZWUgTGFrZQ0KMy4gTlVDIDcNCjQuIE5VQyA2DQo1LiBFZGdlcm91dGVyDQo2LiBC
ZWFnbGVib25lDQoNCkVUQSBmb3IgY29tcGxldGlvbiBpcyBuZXh0IFdlZG5lc2RheSwgMTUgU2Vw
dGVtYmVyLg0KDQpUaGFua3MsDQpKYXkNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogcWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgPHFhLWJ1
aWxkLQ0KPiBub3RpZmljYXRpb25AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9m
IFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IEZyaWRheSwgMTAgU2VwdGVtYmVyLCAyMDIxIDQ6MDAg
QU0NCj4gVG86IDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPiA8eW9jdG9AbGlzdHMueW9j
dG9wcm9qZWN0Lm9yZz4NCj4gQ2M6IHFhLWJ1aWxkLW5vdGlmaWNhdGlvbiA8cWEtYnVpbGQtbm90
aWZpY2F0aW9uQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+IFN1YmplY3Q6IFtxYS1idWlsZC1u
b3RpZmljYXRpb25dIFFBIG5vdGlmaWNhdGlvbiBmb3IgY29tcGxldGVkIGF1dG9idWlsZGVyIGJ1
aWxkDQo+ICh5b2N0by0zLjMuMy5yYzIpDQo+IA0KPiBBIGJ1aWxkIGZsYWdnZWQgZm9yIFFBICh5
b2N0by0zLjMuMy5yYzIpIHdhcyBjb21wbGV0ZWQgb24gdGhlIGF1dG9idWlsZGVyIGFuZCBpcw0K
PiBhdmFpbGFibGUgYXQ6DQo+IA0KPiANCj4gICAgIGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8u
aW8vcHViL3JlbGVhc2VzL3lvY3RvLTMuMy4zLnJjMg0KPiANCj4gDQo+IEJ1aWxkIGhhc2ggaW5m
b3JtYXRpb246DQo+IA0KPiBiaXRiYWtlOiBjN2I1MDZkMTFkZjc4Y2ZjNDYxMGRiNjU3ODc0NWVh
YTYyMjBiMTNhDQo+IG1ldGEtYWdsOiA2MDM0NGVmYTdhNTBkYzI1NDhmYzRiNWQ2OGI1YWQ0ZDYw
YzQwMjNhDQo+IG1ldGEtYXJtOiBiYTgyZWE5MjBhM2E0MzI0NGEwYTcyYmQ3NDgxN2UyZjAwZjRh
MWFmDQo+IG1ldGEtYXdzOiAxNzFhYTJjZjRkMTJmZjQ4NzdlOTEwNGI2ZWM0NmJlNTQxMjhlM2Q4
DQo+IG1ldGEtZ3BsdjI6IDllMTE5ZjMzM2NjOGY1M2JkM2NmNjQzMjZmODI2ZGJjNmNlM2RiMGYN
Cj4gbWV0YS1pbnRlbDogNWM0YTZiMDJmNjUwYTk5YTVlYzU1NTYxNDQzZmNmODgwYTg2M2QxOQ0K
PiBtZXRhLW1pbmd3OiA0MjJiOTZjYjJiNjExNjQ0MmJlMWY0MGRmYjViZDc3NDQ3ZDEyMTllDQo+
IG1ldGEtb3BlbmVtYmVkZGVkOiA3YmQ3ZTFkYTkwMzRlNzJjYTQyNjJkYmE1NWY3MGIyYjIzNDk5
YWFlDQo+IG9lY29yZTogNTY3ZGQzNWQ4OTNjNWQ4OTY5ZDQxZjI2M2EyNGRhOGZiYWUzZmMyZg0K
PiBwb2t5OiAwYTJjYTlkNjBmMzg1MTUxNWE3OWQ1YWE5ZGRkOGI0MDY5YjVhMjA2DQo+IA0KPiAN
Cj4gDQo+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJvbSB0aGUgWW9jdG8gUHJvamVj
dCBBdXRvYnVpbGRlcg0KPiBHaXQ6IGdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3lvY3RvLWF1
dG9idWlsZGVyMg0KPiBFbWFpbDogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZw0K
PiANCj4gDQo+IA0KPiANCj4gDQo+IA0KPiANCg0K
