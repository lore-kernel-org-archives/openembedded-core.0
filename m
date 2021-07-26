Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.26883.1627283895743710453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jul 2021 00:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=hM3RRXJ1;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: sangeeta.jain@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="199365994"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="199365994"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2021 00:18:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="661751884"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
  by fmsmga006.fm.intel.com with ESMTP; 26 Jul 2021 00:18:14 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 26 Jul 2021 00:18:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 26 Jul 2021 00:18:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 26 Jul 2021 00:18:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUEJWQHVv9T5HrIyJaSSnQR8OY0Gcsdc//FEEEqaNeuIYcRcteo/fL+CHEN+KuPc91V1+FXkk/3loS902pw8ePn2J4+1qgfxJzUwR+JXJ9yDfdBWmkCiA6C2GK9L0bTllTowxdytm4NVxjNIm8DJKDg6vXLYKtUcW0l8qGlIhG95xg3urxcYs5hdFM9vBZeiCa11Yexrmx04+TAeahYBpDZ1JBul24Jc06AAFFm1xEYNQqOsOnZxcSLR6Hjynl8lMs/20WeVqK95t0Skz/fxfl9srioC5ff/sdXn/oBnSipbDI+2g3NgwT5KxbzxgUk+IEkgWls6nkdHtxPxgU5guw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZKxa48WyniendnbGVSf+V6YXf2avrkG7yg+zefkHdM=;
 b=CXwMo7hqGSnSwiMq1dD5kd0R2gnddw0i9YxDo3qX4uo1sIzhQeqiJp5oqrvvKTwxG5UcNrxO3xSYBBAth6r/vcvZjFueXIzBhaOz/eu6y9IFHflYSCVV2F+mI8zdaDVdiDosINlgIZ3rmoAGakI1FbCtKWKSFfX3KL8qbX2cFE4wpgf1kD83xcyDyrfo/W7vszb/zdY7T0ukRxaCmaF0ZlvWXD/8G7YeqwzKuhS3VJHsBaNDJYgwzUoKM6nz4ifnGXwTQVljLyIo3fwXJ+snw69Jhfl9xeI7u+eJtY9G7wGBXF9XHFnAaG7G2AZ2jq4UFrgvDpVNhp5X6gHWUNd+aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZKxa48WyniendnbGVSf+V6YXf2avrkG7yg+zefkHdM=;
 b=hM3RRXJ1+sJyCiEl5ksBMYhXfF1ToN+JHad9qPzD2niojhV+zXCXKBJWRp4yJk8QrY5ZfXobbeb+a7vEPgTdW9kD+LESIYRA3/UUUqEie+GHsT5vGJrYH9yiuivheX0xhJ7lqsgsgM0CWO0AXDXSc+zcaom8YpbjQ6levoQzWb4=
Received: from DM8PR11MB5608.namprd11.prod.outlook.com (2603:10b6:8:35::5) by
 DM8PR11MB5637.namprd11.prod.outlook.com (2603:10b6:8:33::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.29; Mon, 26 Jul 2021 07:18:13 +0000
Received: from DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::419f:4e95:48ef:398d]) by DM8PR11MB5608.namprd11.prod.outlook.com
 ([fe80::419f:4e95:48ef:398d%3]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 07:18:13 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.4_M2.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.4_M2.rc1)
Thread-Index: AQHXfhHSHxBhFFyECkWTXZclnPZ59qtU4D5A
Date: Mon, 26 Jul 2021 07:18:12 +0000
Message-ID: <DM8PR11MB5608D1B571AE656808EC8BBCE3E89@DM8PR11MB5608.namprd11.prod.outlook.com>
References: <0d1daf3f2a96b7268274674ea37e310b90255312.camel@linuxfoundation.org>
In-Reply-To: <0d1daf3f2a96b7268274674ea37e310b90255312.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.0.76
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38c01265-37e6-46da-ecd5-08d9500587b0
x-ms-traffictypediagnostic: DM8PR11MB5637:
x-microsoft-antispam-prvs: <DM8PR11MB5637280E2E84B07CFE92483EE3E89@DM8PR11MB5637.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ai29PLCq3GU7aZ457rsdBuNYgeoW/wtiW+Yr6uoFu9G3F8rhhxPBuTVDqH8z2BASKk5N2raiOw506NQJo0SJu/k+mRuFb//4KUnp4Ln+HR+miTTpadAKlZc+sa2j47dJBZLe93VHp1x8kFI7e8aOXozsFtHW3BjPaLnwwiPZusVgA88cKu68xPtzLUoWZstqdt/ThbSWcyD8D6yKrU1f3zdr8awFls+t2G6t+CwL0Etrlo2pry3MPiE5dkP1A8la5xuLcolGgydWKYOgi3fKrfRdlCMlHMlUxPNBC9swZDlfewWIgtlVwazwHjrKtIw1fqfMtw3VhGpzzspCU+wqu40ySMOFOoOGOzl+lBwQsX1o/MiHPZLS4x65+RZ9THMVSBb4rAytircV+pEZFk1ua/oVp5M77Uu//kOaWmfRYetln59RkBIjyi5AhZ+NViXKPEoQkn8Xth2QNwepYv9XrV6D390y+cYsvNQ8J31/zUbHzASRVxy/AQuGoiNKU0y7dxI4tMtJlI0DfWZw6zgkpKpcaGd5h5qRGdSVaMCL2lK0EYo6SWviCq3Tj5sHaTsRGp5hBY8Ho/ZSJy2CpTj+9BXA21GpQkN0Fl/3JZ7QX5bpVdkV/6fERyezivz/hLpXL3zB/yf7oph2lMKA+gdMZ6Zac9OOkmIIDY89Zk+U/HOI7h4V1NhvyCe0eeo851nRnrlwvcRd6k3bSOL7X+6P4HL3yzWrc0Gg4/Hm5U1Su77UZdqklJADhLMpM6OYSts5aTmEAr/hfTlGb8Jy1lCU0UUtM9XzSWlFXixksYT8xeVIeQxZ9bbzSta9bl3SyvYYwuVZ5eW3x5MG9eCTEzxh+mT4xygy97svyUCG/zaRuxA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(55016002)(38100700002)(5660300002)(64756008)(66476007)(66946007)(66446008)(66556008)(53546011)(33656002)(186003)(8676002)(122000001)(508600001)(966005)(52536014)(86362001)(8936002)(15650500001)(316002)(9686003)(6506007)(76116006)(110136005)(26005)(83380400001)(2906002)(71200400001)(38070700004)(491001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TElhODBralNSY3NJZk53TVlESlo4VUx2MnlYbEk3U1hmT1ZFRmRldmFtRkJ1?=
 =?utf-8?B?aEFveUZmS08xU3E2RUVwYkwyOTVRTkRHalVVTkFuT2FGclpHYVFXd2lVTzhh?=
 =?utf-8?B?U1dNTVJSOU5IVW9SRnBOSnh5VElFRUdPKzdDYmtKbkJuRkFuSitxdXlLZVlk?=
 =?utf-8?B?UVZIb3J5NDdEeFFWUks4RVNsWVlYbVhlQU9NMEUxOHM1SGZaRVJZS2VoeWRP?=
 =?utf-8?B?Tks0ZDRhemx6TkI1ZlR4eGkyTFlzNmJvRHJZQXhKMXVhTkliendGK0tNZXJC?=
 =?utf-8?B?M2ZLQnl0S2FJR2FEeXFsVG9NQTlVS1l0eGV0c1FBZjUxVGZGTkd2ZUlDTjJo?=
 =?utf-8?B?RTR4S3NVakNldzhuV0w5OEdWOThheGNmRjIvOTZzLzlteGRlY0ZXcThjc25J?=
 =?utf-8?B?dS9FdUVNU096Zlcwbm55Y3ZvbHB6TU9Nc3RNN2FGMnVETFpYeElCL3hGNDkv?=
 =?utf-8?B?b0RSb2xLbEg5b3ZwSFFuOXN4QnV5QnludjIvNCt1Ym1LSXF4cTJyZUpzRFFj?=
 =?utf-8?B?TThvTUYrNzdkMmFZQndmTnBKTytBa1FNU1ZFNlZLWVFXZDlhMTZ4R2pSNTJy?=
 =?utf-8?B?OUJzbUtJUkExQTNlVFdnWEtTK0loYnVlalZYQXdiQW1LdGlMVER3UnRZRy9M?=
 =?utf-8?B?cTM5Z3FnQmhFNElZNlV6ejNFc2pLOWwyTHQya0VUUDE1Z3pWL0c2d1pReGEy?=
 =?utf-8?B?VUtBM29XekxQNFJ1Q2l5dkMvNVZBTVJ5d3RWZ2NVSHFFTVowTUVIcUcva05v?=
 =?utf-8?B?eHRmS1B6QmRUYzhmdFlXU2R4eU40ZUo0WTRGMlo1ZUxrSTh1cjNEK0kwWVpp?=
 =?utf-8?B?RUhZTE1VOFJCbGFPRzBkRHpuS1pxMGhWc3Z5OUttSkZYdTJ6amdibndzeHNC?=
 =?utf-8?B?MjljTjNMS0xzMm5mVjV3V1VvbjljY3MweS93MWNGNmRFei83RUUwdE4vSDF4?=
 =?utf-8?B?V3lrVTRodjJ1RzVOOVFFK2lNSFRRaWJWbHFTSS9yOExPcTNJRU9NNkp1MjdE?=
 =?utf-8?B?UWYvRkI5ODRPSGNlUlNRL09NRXVReTFGS0pGZEdESjdMdXBYVjNacDM5eHFa?=
 =?utf-8?B?enJDUW1lbkZyWFZxTk5aSXliazFkU3NaMzRiZjNibVNxQkk5MFArOG5rYnQv?=
 =?utf-8?B?SmVWR29WU2N5aUg5NWg0MnJLREovbzZzODZBeXN5RjQyTTFsNFMxMzlzUWNB?=
 =?utf-8?B?WlROOVgxTEk2cWJ1Mzc3cEdWQzNHRi9hRTA1ekV0MytPck9BbUpLbFBlVngr?=
 =?utf-8?B?bC94aWRCQzZuQXpnTGQxbkZyZzJxb2xnaytrWlhTcGNvUGViZGI5OXZYTnQ4?=
 =?utf-8?B?VFlwaTkydzQva3FsR0ZrejhXNGVoSGdwcGlXVW0zN3haUlMyUVdGMDYyOUdF?=
 =?utf-8?B?YmhZU3BwVVptTjlYRlExSWtKOVd1OVlBMEUxMitWdG9tdWRHN1dQZzJEUmxQ?=
 =?utf-8?B?dVpjaldmWDNDbG9ZNG0wM2RtenZUbnZhOWtuVlcrbHB5eUF1YVZwMEpJK0s3?=
 =?utf-8?B?TldHc1dSZjBnOW1NclFmaVo0RnlsQVloTXh1Rm5Eb3VHUkNiVVdwRG5PSThO?=
 =?utf-8?B?OFFaR1dDWVFpYlFLOUJRWWtwb05ENmdCalVFdnk5aG0yU2xqUC80THJyUjA1?=
 =?utf-8?B?ek1iRDJBVXZmSjU3bzU2VEx1WHBaejNvbVZ4cUduK2xPV010dllPNTc2TVRi?=
 =?utf-8?B?UGVCYVNaZVp0MEIwdHo1TkN3cFJCb0V4YlpHUkFmZlpoMlN2WG1IN1FTbnY3?=
 =?utf-8?Q?wCLcGRCRvUZucKVzHjqicPld8LRNbCvAiS0D0ZI?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c01265-37e6-46da-ecd5-08d9500587b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 07:18:13.0417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QpJdtf2INw2Qojf4IPhiFWHoRbpRggli0f8ll2+ZCirjmxDvoe6myzOGCDjOtIg6cvqQgGFfnVpMDMpOi8m1Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5637
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gYWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy40X00yLnJj
MTogIA0KaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3lvY3RvLXRl
c3RyZXN1bHRzLWNvbnRyaWIvdHJlZS8/aD1pbnRlbC15b2N0by10ZXN0cmVzdWx0cw0KDQo9PT09
PT09IFN1bW1hcnkgPT09PT09PT0NCk5vIGhpZ2ggbWlsZXN0b25lIGRlZmVjdHMuIA0KDQoyIG5l
dyBpc3N1ZSBmb3VuZCANCg0KQlVHIGlkOjE0NDg5IC0gWzMuNCBNMiBiZWFnbGVib25lXSBUaGVy
ZSBhcmUgc29tZSB3YXJuaW5ncyBmb3IgeGtiY29tcCBvbiBib290DQogICANCkJVRyBpZDoxNDQ5
MSAtIFtRQSAzLjRfTTIucmMxXSAtIHN0YXAuU3RhcFRlc3QudGVzdF9zdGFwIGZhaWx1cmUNCiAg
DQogIA0KPT09PT09PSBCdWdzID09PT09PT09DQpodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVj
dC5vcmcvc2hvd19idWcuY2dpPzE0NDg5DQpodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5v
cmcvc2hvd19idWcuY2dpP2lkPTE0NDkxDQoNClRoYW5rcywNClNhbmdlZXRhDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogcWEtYnVpbGQtbm90aWZpY2F0aW9uQGxpc3Rz
LnlvY3RvcHJvamVjdC5vcmcgPHFhLWJ1aWxkLQ0KPiBub3RpZmljYXRpb25AbGlzdHMueW9jdG9w
cm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgMjEgSnVseSwgMjAyMSA1OjIyIFBNDQo+IFRvOiA8eW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0
Lm9yZz4gPHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+DQo+IENjOiBxYS1idWlsZC1ub3Rp
ZmljYXRpb24gPHFhLWJ1aWxkLW5vdGlmaWNhdGlvbkBsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0K
PiBTdWJqZWN0OiBbcWEtYnVpbGQtbm90aWZpY2F0aW9uXSBRQSBub3RpZmljYXRpb24gZm9yIGNv
bXBsZXRlZCBhdXRvYnVpbGRlciBidWlsZA0KPiAoeW9jdG8tMy40X00yLnJjMSkNCj4gDQo+IEEg
YnVpbGQgZmxhZ2dlZCBmb3IgUUEgKHlvY3RvLTMuNF9NMi5yYzEpIHdhcyBjb21wbGV0ZWQgb24g
dGhlIGF1dG9idWlsZGVyDQo+IGFuZCBpcyBhdmFpbGFibGUgYXQ6DQo+IA0KPiANCj4gICAgIGh0
dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vcHViL3JlbGVhc2VzL3lvY3RvLTMuNF9NMi5yYzEN
Cj4gDQo+IA0KPiBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOg0KPiANCj4gYml0YmFrZTogMTNlMjg1
NWJmZjZhNmVhZDZkYmQzM2M1YmU0Yjk4OGFhZmNkNGFmYQ0KPiBtZXRhLWFybTogOWVmYTNiNTY4
M2E1ZGQ3ZWJiZjYzZmYzMWI4ODllZDU4OWZmN2E5YQ0KPiBtZXRhLWdwbHYyOiBiM2ZhMjZiYzc3
N2VjMDEzNmNlMTg5ZDkwMTIzYjUwZjZlZTU2N2I5DQo+IG1ldGEtaW50ZWw6IDk0YzA5N2E4MmNm
OTE2N2ZhNTY3YzJhZjgwZDVlMzlhM2ZiYmMxMWYNCj4gbWV0YS1taW5ndzogOGYzYjZlMzc3Mjg3
OWRjMmNhZWM4ZmUyNDljZTI3N2ZiYjFhYTU1Zg0KPiBvZWNvcmU6IGM0ZmMyMjZjMmUzODU2Yjk0
MmJiNGY1N2VhZDIxYTY0YzNkYzhjMGQNCj4gcG9reTogMWFkNzkzMTNhNWMzZTZhNDUzZmJlYjQ0
Y2FhYzVjNWJiYWQ0NmQzYw0KPiANCj4gDQo+IFtSUCBzZW5kaW5nIG1hbnVhbGx5IGFzIHRoZSBv
cmlnaW5hbCBmYWlsZWQgdG8gZ2V0IHRocm91Z2hdIFRoaXMgaXMgYW4gYXV0b21hdGVkDQo+IG1l
c3NhZ2UgZnJvbSB0aGUgWW9jdG8gUHJvamVjdCBBdXRvYnVpbGRlcg0KPiBHaXQ6IGdpdDovL2dp
dC55b2N0b3Byb2plY3Qub3JnL3lvY3RvLWF1dG9idWlsZGVyMg0KPiBFbWFpbDogcmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZw0KPiANCj4gDQo+IA0KPiANCj4gDQo+IA0KDQo=
