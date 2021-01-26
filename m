Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.7628.1611633303268158291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 19:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=CFI//SLs;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: H+fKj47fZFeMeaYTFPOWoumEFdW5L4/DwTwJf1jw5oQfRq5NbV8oH/wGKZamlKvjcajLH8Rncv
 lMMYSgolnxoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="179925889"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="179925889"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 19:55:02 -0800
IronPort-SDR: XkZr458K9mmMLFo+WrU4AVo09YdQ5HeIx35dDzS9nJfmT5IwN8knWyWUOBu1IX7SkZm1N10K/o
 vZ0t4bYaM6iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="504394018"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by orsmga004.jf.intel.com with ESMTP; 25 Jan 2021 19:55:01 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 25 Jan 2021 19:55:01 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 25 Jan 2021 19:55:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 25 Jan 2021 19:55:01 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 25 Jan 2021 19:55:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xjhf082o0u/659SYkhI9I0qd4pbGBPEQpxPhLsrEJ9SX1KcHBHS9dAm7fSzSoggZc/UOzy1JI01lMgVP+96jF97+GUjvxR4B1sUqQhw4SC+t2LAy3A5Ns46GnCTxQELEymrOcc1jBy55WV0ZtfsSXTYrb1SePIvP8SK2XxA/+rRQ8vwPbSGX3NH2QEzrjkAD7UxhTJvtrj3RCWzvU5OOyevf3ZqqVqiChvc27FFl8GkjMpcyetiXvBrvzJkSoVotefIuEVgOMoZGfCah5fC9MyNHKKkzBTYUwYsvr/djdsb5LYdM9on7cRkB4dXec3IcZjBECr16MLmyPfmxkCMzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSQ5q4Rq0yHyZ/2QpAFOU03g2o+7uuzUXCMciZDCOVg=;
 b=dr9xehJMtPNg8hwvziR4GBPdTOVPMVhNedmS7lTG4aFfx5zx+4Mvuxc29h031Amj6tfVqpGwQK5aX+XHR1IcGccDwv7wYbZzgmY0sKV0omkNIuW6uFSKdC3qHvYUoDcVMp2rIXSj0jaQH04OP5ZULLrp4WJVe1Xcs8IUcs8LiZ0s9wWbmqkxq9ZOlu0LOv4iTocqe3i0aS5keF+l7x8QfUxeVmOjfSQTHVs1lczWBnLTv1s21gRzgoRPErPXoJ8uzHwNgXXXzuOz4+zEJD88Exwi37j4Gn1Ws3I2DYw+IsDRypzrTuDYWVGp4W2uS9rOS5agoSD57qk0BrmxTHftWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSQ5q4Rq0yHyZ/2QpAFOU03g2o+7uuzUXCMciZDCOVg=;
 b=CFI//SLsYVfENT9IB5MxdWbagGO+RfrhWA9ixmx2n7t3evJR9mrHbLwQneV95188h/aOKNDGfNvzjgZa8tIeSCGsFQcAZehpuGqxwPCwquSXkmGutTMqDOYIuLurYHyKTWm09P3Y9ukjVxE4cjKyoPJV/2QE/vKheQ2LeRV/zPo=
Received: from MWHPR11MB2000.namprd11.prod.outlook.com (2603:10b6:300:2b::23)
 by CO1PR11MB5138.namprd11.prod.outlook.com (2603:10b6:303:94::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 26 Jan
 2021 03:54:59 +0000
Received: from MWHPR11MB2000.namprd11.prod.outlook.com
 ([fe80::68d5:9f61:8df6:9a36]) by MWHPR11MB2000.namprd11.prod.outlook.com
 ([fe80::68d5:9f61:8df6:9a36%5]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 03:54:59 +0000
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman
	<steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24 Jan 2021 07:15:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 24 Jan
 2021 07:15:01 AM HST
Thread-Index: AQHW8qeVVGI7k19FiUOLS537Ba5Krao3fTwAgAFrLoCAAC6ZMA==
Date: Tue, 26 Jan 2021 03:54:59 +0000
Message-ID: <MWHPR11MB2000D61465E2D74D9209E7DDB9BC9@MWHPR11MB2000.namprd11.prod.outlook.com>
References: <20210124171809.D838F960256@nuc.router0800d9.com>
	 <cc80f8541aeef99a4625420fbf7d27dcc6abf341.camel@linuxfoundation.org>
	 <MWHPR11MB20005F089BE21737CFA246E7B9BD9@MWHPR11MB2000.namprd11.prod.outlook.com>
 <0d314728a5aceabe78e9d61bfe257d69396b23e3.camel@linuxfoundation.org>
In-Reply-To: <0d314728a5aceabe78e9d61bfe257d69396b23e3.camel@linuxfoundation.org>
Accept-Language: en-SG, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [115.133.6.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c3e9da8-003d-47e7-5eb3-08d8c1ae272f
x-ms-traffictypediagnostic: CO1PR11MB5138:
x-microsoft-antispam-prvs: <CO1PR11MB5138360773CC4C2C363E7F7CB9BC9@CO1PR11MB5138.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jCVwA/nykwmWUfat2WEnU2IP+zCf5gTnaDjYPIvJ7ucFWFi/weF7iFTy4DZbRPVtKB9SZ6Jc1XMlfCuaza9OzA4oozbgxuwioqEaJKiRryi4zie2cAszE4QlZO9GOD5/8pZcKotlhccqEcp9O5RNEnkWABw2gi4hLDCFYxGkXDov5nM2L9eW8GdGM69ttl4X7jmP2XvZ+3jqlmoECtrhvEpM98LqMaIWpbILaNskJhmPO1p+zTaLGCwTJy1VRUNa5wN1DSV11AaFSgQHgeI76EP8/vPD9F84FaUGrWjzsSfRjLi2EaCiFX06rb9t2Sxx8RHoFXdcA4lH3lqA5H234nIbkY2lNgE0SokTbwm58/+Y1nQbCXXGXCwZfQMpU5Er5yL6pAaDT1GjbqphdyQDuS8agfwmx5P1xKVFgNWdQBYEMAXYEvaVSAYMbOxdb1/l0TmOq2q3nfgzsyYTC4ZreFMGBR6dLgyZ2frRLbyNtEqeBx3WKOMMTX6bwDDAVDlDTr+deFeyGaK3XLOHnYVEJeI8Y0vovMrYGguOQ/MjQ1r5khWU4aT5wDt62kbnYm89gDoJ3yVK+w3ZgTAa27H9+SAQL9m72lk0cDlusBaZ5ig60FJbLqAlo+KaUu3FU42hj05Ok6XN+33zRju+D69Usw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB2000.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(66946007)(66556008)(66476007)(52536014)(5660300002)(7696005)(66446008)(64756008)(76116006)(33656002)(6506007)(53546011)(71200400001)(8676002)(110136005)(186003)(316002)(26005)(966005)(478600001)(86362001)(8936002)(15650500001)(83380400001)(2906002)(9686003)(83080400002)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aVpBVGd3cUhoZmd2Nmtpbkl1czcvaWhlaHA5WmJ2MitJWk1vcmQ5UlJKTmJB?=
 =?utf-8?B?WFV6SGw4MUdteCtEak4zYzF1Tmw5UUhVbTQzakdQMExqNzFCbjl5ZHU5SXZQ?=
 =?utf-8?B?RURlWW5SQWpMR2k5U2YxK3RGZVI3Nlc3NHRpYVVJVFdnU2VBbkt3N0I0a3RO?=
 =?utf-8?B?Z0hjOGFBZGZkaHBEellWQjlhNlMrT0ZVR2EyZ3cvSnBESVJ4Ritqb2plTXBQ?=
 =?utf-8?B?cmhNQ0lKY3RNeGZsdFV5bWlXL081WlVXYWkzOGRITm9oaiswZFluaHhEd2Rq?=
 =?utf-8?B?SjBzakdtcUFJR01WSTl4YWlnVzJtWFROTzFESXBoS3NZOTJBRUJyNUJxRnZI?=
 =?utf-8?B?alZHRFNId3RnbjdpQnIzUnZ6ckVoYlRWUm96cGZWS2o4VEU3eTlFTEpjam81?=
 =?utf-8?B?amFoT1Nwa0hYUWo0a3QzOVhhRHc5UC9pUVFVa0lIeUFHdFlpcnhaTnU5MmtS?=
 =?utf-8?B?NjFYUFVWNEdvb3h0c1I0MXY0S2JiSGxEdCtZRzVSa09YbU9NcTVJZ1VIR3Zv?=
 =?utf-8?B?UE5WQWZlNzlzeVppekdvWjlsWVg0UFRPTXhFT1BlQ2xhYWNoa2VwZFFiK0Nr?=
 =?utf-8?B?em9SUXBZQVhwUWZGdEtLd2lpckVMWFFSTk5DU000c2tPRXhzMW1SaWxkV1pK?=
 =?utf-8?B?RU1zNGlPQTkrOUcxZ28vZ1J2WGdmUE9DYXZHcFVRbGkwcWlYWlVXNlFZYU9T?=
 =?utf-8?B?aS9lRHoxWW9jVjJwT0FqK29sbmxWeDB0enU5MEFkampCOExzSUFjNFBXaVlY?=
 =?utf-8?B?UURkWk9sQm4vd3hpNHNwQS9TY0dLWFRGNllUTThYVXJuSXhSaHdXbFB1Z21X?=
 =?utf-8?B?b2tiODBUYlpWM0pMK0dHbEt1Z1o0MW5RUml4V2hWaVVBajBodEdJQmpaMGkv?=
 =?utf-8?B?bW1jWFRVcGwxZHdsdG1IY2wyclltZnVoUzcwcGFpVGY2bkFZWm1yTlRvcUd1?=
 =?utf-8?B?dlRvMS85NEt5ZGlTVXNUNG1UWGtjUFd3THlVdHB2MGpxTnF5bzBDdFpIZDhp?=
 =?utf-8?B?aUF3Q0VJR29ZZ2ZhNjN6RS9pRUFFcEV0b0VvUWdLVWtzZVFSNWxRdDBBcWd0?=
 =?utf-8?B?NVpSQlJKYTlyMWVuTXR2NnZjaExGVU9NNHJrZE0yekJZRnFuYmpzNlBlQkhx?=
 =?utf-8?B?Zm5Xd2YrUi9hRDRUREh0ME5ZdTJQcWNPenpsbVcxL2loMEQ2TEQ0cG9ZSkJH?=
 =?utf-8?B?cGh1TU5XRVd5MUEwd1M3NUNEdkdFSVpWWE1YeGI2Q0FtVzJvY2VLNkdOTElo?=
 =?utf-8?B?anNRZnR4OEdNcndzeVNvYlY0alB3M0VlZzQzRUZrLzBUL1J0bjRIWHZncTY2?=
 =?utf-8?B?N0pMUDY3aDEzUi9vWGk3WHV5REZoUHdqUWt2TTJMSm00TzFQcUY5YWVQWFNm?=
 =?utf-8?B?Wlg5dTc4YUxadTNNQjluN1YxMjZseVBLTkNaYm5NOXVaZW84Z0ExNWhCQ2tm?=
 =?utf-8?Q?dJgwgBXx?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB2000.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3e9da8-003d-47e7-5eb3-08d8c1ae272f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 03:54:59.8161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LxquiVeH/RHsvlTxqIK1juSIOOkr7Aa0No//ZsnwNSW+bmjkWGgBz/OXoM/vlCyU5otMchrGtmbQ9chUzS8dzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5138
Return-Path: chee.yang.lee@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Zm9yIHRoaXMgY2FzZSB0aGUgbmV3IGNoYW5nZXMgb25seSBjb25zaWRlciAxLjEuMSBmcm9tIGJv
dGggMS4xLjFpICBhbmQgMS4xLjFiICwgZG8gbm90IHRha2VzIHRoZSB0cmFpbGluZyAiaSIgYW5k
ICJiIiB3aGVuIGNvbXBhcmluZyB0aGVtICwgc28gdGhlc2UgMiB2ZXJzaW9uIGFyZSB0cmVhdGVk
IGFzIHNhbWUgdmVyc2lvbiAoIDEuMS4xICkgd2hlbiBjb21wYXJpbmcgdGhlbS4gDQoNCkkgZXhw
ZWN0ZWQgdGhpcyBhbHRob3VnaCBrbm93aW5nIHRoYXQgY29tcGFyZSB2ZXJzaW9uIGluIHRoaXMg
d2F5IGNhbiBmYWxzZWx5IHJlcG9ydCBtb3JlIENWRSwgYnV0IHRoaXMgY2FuIGNhcHR1cmUgc29t
ZSBjb3JuZXIgY2FzZS4NCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogUmlj
aGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+U2VudDog
VHVlc2RheSwgMjYgSmFudWFyeSwgMjAyMSA2OjEwIEFNDQo+VG86IExlZSwgQ2hlZSBZYW5nIDxj
aGVlLnlhbmcubGVlQGludGVsLmNvbT47IFN0ZXZlIFNha29tYW4NCj48c3RldmVAc2Frb21hbi5j
b20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyB5b2N0by0NCj5z
ZWN1cml0eUBsaXN0cy55b2N0b3Byb2plY3Qub3JnDQo+U3ViamVjdDogUmU6IFt5b2N0by1zZWN1
cml0eV0gT0UtY29yZSBDVkUgbWV0cmljcyBmb3IgbWFzdGVyIG9uIFN1biAyNCBKYW4gMjAyMQ0K
PjA3OjE1OjAxIEFNIEhTVA0KPg0KPkknbSBub3Qgc3VyZSBpdHMgd29ya2luZy4gRm9yIGV4YW1w
bGU6DQo+DQo+aHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMTktMTU0Mw0K
Pg0KPndoaWNoIHNheXMgaXQgYXBwbGllcyB0bzoNCj4NCj4xLjEuMCB0byAxLjEuMGoNCj5hbmQN
Cj4xLjEuMSB0byAxLjEuMWINCj4NCj5NYXN0ZXIgaGFzIDEuMS4xaSB3aGljaCBpcyBncmVhdGVy
IHRoYW4gMS4xLjFiIHNvIHdlIHNob3VsZG4ndCBiZSBzaG93biBhcyBhdCByaXNrDQo+eWV0IHRo
ZSBDVkUgaXMgbGlzdGVkLg0KPg0KPkNoZWVycywNCj4NCj5SaWNoYXJkDQo+DQo+T24gTW9uLCAy
MDIxLTAxLTI1IGF0IDAyOjM5ICswMDAwLCBMZWUsIENoZWUgWWFuZyB3cm90ZToNCj4+IFRoZSBj
aGFuZ2VzIGV4cG9zZSB0aGVzZSwgaXQgaWdub3JlZCB0cmFpbGluZyBjaGFyYWN0ZXIgaW4gdGhp
cw0KPj4gdmVyc2lvbiBjb21wYXJlICggImkiIGluIHRoaXMgY2FzZSBmb3Igb3BlbnNzbF8xLjEu
MWkgKQ0KPj4gKENWRS0yMDE5LTE1NDMsIENWRS0yMDE5LTE1NDcsIENWRS0yMDE5LTE1NDksIENW
RS0yMDE5LTE1NTEsDQo+PiBDVkUtMjAxOS0xNTUyLCBDVkUtMjAxOS0xNTYzLCBDVkUtMjAyMC0x
OTY3LCBDVkUtMjAyMC0xOTcxKSBiZWhhdmUNCj4+IHRoaXMgd2F5IGJlY2F1c2UgaXRzIGRpZmZp
Y3VsdCB0byBkZWZpbmUgdGhlIHRyYWlsaW5nIGNoYXJhY3RlcnMgKGxpa2UNCj4+IHZlcnNpb24g
MS4xYiBjYW4gYmUgMS4xIGJldGEgb3IgcGF0Y2hlZCByZWxlYXNlIDEuMWIpDQo+Pg0KPj4NCj4+
IE5WRCBqdXN0IHVwZGF0ZWQgdGhlc2UgcmVjZW50bHkNCj4+IENWRS0yMDEzLTA4MDAsIENWRS0y
MDIwLTE0NDA5LCBDVkUtMjAyMC0xNDQxMA0KPj4NCj4+DQo+Pg0KPj4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPj4gPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4NCj4+ID4gU2VudDogTW9uZGF5LCAyNSBKYW51YXJ5LCAyMDIx
IDc6MjEgQU0NCj4+ID4gVG86IFN0ZXZlIFNha29tYW4gPHN0ZXZlQHNha29tYW4uY29tPjsgb3Bl
bmVtYmVkZGVkLQ0KPj4gPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IHlvY3RvLXNlY3Vy
aXR5QGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4+ID4gQ2M6IExlZSwgQ2hlZSBZYW5nIDxjaGVl
LnlhbmcubGVlQGludGVsLmNvbT4NCj4+ID4gU3ViamVjdDogUmU6IFt5b2N0by1zZWN1cml0eV0g
T0UtY29yZSBDVkUgbWV0cmljcyBmb3IgbWFzdGVyIG9uIFN1bg0KPj4gPiAyNCBKYW4gMjAyMQ0K
Pj4gPiAwNzoxNTowMSBBTSBIU1QNCj4+ID4NCj4+ID4gT24gU3VuLCAyMDIxLTAxLTI0IGF0IDA3
OjE4IC0xMDAwLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0KPj4gPiA+IEJyYW5jaDogbWFzdGVyDQo+
PiA+ID4NCj4+ID4gPiBOZXcgdGhpcyB3ZWVrOg0KPj4gPiA+IENWRS0yMDEzLTA4MDA6IHBpeG1h
bg0KPj4gPiA+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5J
ZD1DVkUtMjAxMy0wODAwICoNCj4+ID4gPiBDVkUtMjAxOS0xNTQzOiBvcGVuc3NsDQo+PiA+ID4g
aHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDE5
LTE1NDMgKg0KPj4gPiA+IENWRS0yMDE5LTE1NDc6IG9wZW5zc2wNCj4+ID4gPiBodHRwczovL3dl
Yi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMTktMTU0NyAqDQo+
PiA+ID4gQ1ZFLTIwMTktMTU0OTogb3BlbnNzbA0KPj4gPiA+IGh0dHBzOi8vd2ViLm52ZC5uaXN0
Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAxOS0xNTQ5ICoNCj4+ID4gPiBDVkUt
MjAxOS0xNTUxOiBvcGVuc3NsDQo+PiA+ID4gaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcv
dnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDE5LTE1NTEgKg0KPj4gPiA+IENWRS0yMDE5LTE1NTI6
IG9wZW5zc2wNCj4+ID4gPiBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFp
bD92dWxuSWQ9Q1ZFLTIwMTktMTU1MiAqDQo+PiA+ID4gQ1ZFLTIwMTktMTU2Mzogb3BlbnNzbA0K
Pj4gPiA+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1D
VkUtMjAxOS0xNTYzICoNCj4+ID4gPiBDVkUtMjAyMC0xNDQwOTogbGlic2RsMg0KPj4gPiA+IGh0
dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMC0x
NDQwOSAqDQo+PiA+ID4gQ1ZFLTIwMjAtMTQ0MTA6IGxpYnNkbDINCj4+ID4gPiBodHRwczovL3dl
Yi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjAtMTQ0MTAgKg0K
Pj4gPiA+IENWRS0yMDIwLTE5Njc6IG9wZW5zc2wNCj4+ID4gPiBodHRwczovL3dlYi5udmQubmlz
dC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjAtMTk2NyAqDQo+PiA+ID4gQ1ZF
LTIwMjAtMTk3MTogb3BlbnNzbA0KPj4gPiA+IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3
L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMC0xOTcxICoNCj4+ID4NCj4+ID4gQWRkaW5nIENo
ZWUgWWFuZywgZGlkIHRoZSByZWNlbnQgY3ZlLWNoZWNrIGNoYW5nZSBtZWFuIHNvbWUgdmVyc2lv
bg0KPj4gPiBjb21wYXJpc29ucyByZWdyZXNzZWQgYW5kIGV4cG9zZWQgQ1ZFcyB0aGF0IHNob3Vs
ZG4ndCBiZSBpbiB0aGlzDQo+PiA+IGxpc3QsIG9yIHdlcmUgd2UgbWFraW5nIHNvbWUgd2UgbmVl
ZCB0byBmaXg/IE9yIGRpZCBzb21lIG90aGVyIGNoYW5nZQ0KPmV4cG9zZSB0aGVzZT8NCj4+ID4N
Cj4+ID4gQ2hlZXJzLA0KPj4gPg0KPj4gPiBSaWNoYXJkDQo+PiA+DQo+PiA+DQo+Pg0KPj4NCj4N
Cg0K
