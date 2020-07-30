Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web10.5497.1596074013608112813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 18:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=RNVg0LtS;
 spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: 2ueV0Rg46V6ANbjH99cl8mB6o9Sw8uuMVXWVL4tRyBJxH9nsxLSy/g4exSfnj3dhvDEy/r2Apz
 Kebw4+xiwSTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="148988633"
X-IronPort-AV: E=Sophos;i="5.75,412,1589266800"; 
   d="scan'208";a="148988633"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2020 18:53:32 -0700
IronPort-SDR: 6JeOJcMIK218S2ivDrxP/H2pajqjYeQTlmiRKEBN4BNX2Qn6HvtinV/kbRcJ/+qf71FssasGxo
 PFqGUhxWfkmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,412,1589266800"; 
   d="scan'208";a="394831364"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
  by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2020 18:53:32 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 29 Jul 2020 18:53:32 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 29 Jul 2020 18:53:32 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 29 Jul 2020 18:53:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knKyZRoRuvmo0HURgp5tiJ+RT0lE0q9624t+leFKMGyiwFgocH0mqPyv8+R+gdMKtJsD1zC3/YZ10W/1fjKFPaIfb4n364PuYnuX0NbvxbLsAs3c9YV5g0wS50AzdQp0TEB6ASxKpKc/eg1yzPcLucFP/jiX+dC3gvHh6kEe7GD2+EGxxxA3Fk7n0XfgEGfgN5roWFR4t0haMMl0Tyj8UW8CnnttIY5STo/yAiq/iq5VwXn08gCSA+l9jiwq+ipK5xMlumkrXK7vbb9blwfPQ4H7Ibxfg7enw5OjVvHKnkGp/+DACzBJC5Lq7CNR2dYKpTldUv39+dSshCpi1p+E4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOZ93B9R/0s21TUveOmnuZUTl4lnTeCM6CLyasdPxG4=;
 b=S0xvF2xONZ1jKX+iDvekKOtc2B+tpR2adGN4qdvD0HPiOxEidY78mIaxpX/z2/TM3Pllgxxv/Ba+BIhayjbN/BoCtlR2ZJgyvIngXoWUwoysnFjOiuW3AsGdkh+hfngToSXXVweFb7bVeUlSUevY73GYqRgecBtWEzCH6rKwL6Oi0rA+bD+VtkHDu1PK2pve6FXFbRj8ycDGR+NLbMp+gnFPk4TrFhL2qtaZIxGJj0+w3c7ujIGrZU4ix4gc+uBxTDMggiU1kmoR8KQFM692AyR5uZhMeo8IGRwC+A0ougXIBv2lHnssiRMAFWoZSOTNXQtzLuG1UE2EJIfOycXX7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOZ93B9R/0s21TUveOmnuZUTl4lnTeCM6CLyasdPxG4=;
 b=RNVg0LtSHmdFuVNrjhd/ZrHgK6axWkTmwzWM3SOUDfGQga1nLPSr+5vdqVOptV7XZwYmK/0XlHs7Or2I87qq5u/ph7YamcZYmG4NvevfHK2V22rWR3I9n78QKAQqo3wPABJO0jQRAs5xn/Mc0FKyifu4cqcP0ovK3m/leR1S1Uc=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 01:53:30 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::341a:eb30:746f:e614]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::341a:eb30:746f:e614%7]) with mapi id 15.20.3239.018; Thu, 30 Jul 2020
 01:53:30 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: akuster808 <akuster808@gmail.com>, "yocto@lists.yoctoproject.org"
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
	<apoorv.sangal@intel.com>, "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, "Chan,
 Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>, "steve@sakoman.com"
	<steve@sakoman.com>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.1.2.rc1)
Thread-Topic: [yocto] QA notification for completed autobuilder build
 (yocto-3.1.2.rc1)
Thread-Index: AQHWYZA1MMfE3iel5kWpkbIYRDRksKkeHX9ggAElhgCAAABfcA==
Date: Thu, 30 Jul 2020 01:53:30 +0000
Message-ID: <BYAPR11MB362488151541D4CD0BB8B734E3710@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20200724075804.747FD280D94@debian10-ty-1.yocto.io>
 <BYAPR11MB36243A6E3626563BFF30D22CE3700@BYAPR11MB3624.namprd11.prod.outlook.com>
 <d975f34c-7b15-e552-31b4-6e21ac959f33@gmail.com>
In-Reply-To: <d975f34c-7b15-e552-31b4-6e21ac959f33@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [60.48.233.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f290cab0-3bd8-486b-4bde-08d8342b5c1c
x-ms-traffictypediagnostic: BYAPR11MB3816:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB381658138C7699053E397EDDE3710@BYAPR11MB3816.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mRKUGZwa4MF/qEBu+hUYQ4C7k87dnIp58d0OZmP9/tGfuwPqOxcPmkVovm6AkN7FcPSWenrDWqq6oKmox8dS2fYqt4T/3w1L7SmA99hf6poeJU2UTEReRvz8oE2eUiwYP06qVoJC+mblBTriyyV2n8QeHVSvy70Vupw2KDLnOK5zEbmFKIfyKV/6sAhpl6eGu+y8uZd/RltLB9Nlp74PUVR4TiuPWKOtFfDnbVmoUUE6E5CGqug9DSsJQLEov0G1PR628v0u/awms4jHLKoy7kqTW+iIPY9SHs5PfTGie6TaI6gJRuwWZSqpQDXNqUkGuaOolRM3gC+PjlQ6S0gS516H1/SForr7XW4UEhjiSyKLh2bCKqpIKlPh/l+D4z4F4yzuc1ahT1QWaUEKmWMW2A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(52536014)(478600001)(316002)(966005)(55016002)(83380400001)(9686003)(110136005)(8936002)(4326008)(53546011)(54906003)(6506007)(64756008)(8676002)(76116006)(7696005)(66556008)(66476007)(33656002)(66946007)(66446008)(186003)(2906002)(86362001)(26005)(15650500001)(71200400001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: fwXLMAudCvD4prSjjctfAeDCNq8GnYEULRyheTwxJvCQJCnp5kxCuLh46gk9PQ8NY4fd+0rmDILu826ZWJrNykmkoLBIoB4eIGZH42pE+Ux+W21SoiX8XfGJ1+flTNcG07fYqQTIYX+mPNs+Tio9LJchLBtlBGGoLaLozoQzM9QmoXOWU5xdLQZ6hQo2fBTp3QV8TSsnZZp/lp5nSmaUVvw2xNzZUCW7Mau1ztAgUy7zzxrWS3SlWsnSFjh4xPKu1q043pKG63wRUB1O+sN8sJuujSc/iDxbBoCMa4OcIyzyoL6RtKsv4kBEVwf3DEQqOtL+c9IHUPGSdca2IVp7LWMmYtpLo2tY0BVOz3NlP4r+5/5OVpigpgcw1I9RqckEOQFHiCmTWbLa/En5huWGAxgo5XnuarmhBu3/ZCzcPbd/HxFhE2msXLa43YkMJhFqaEO4g4cD3jKbm/HouCyTv2Oy4iqq0b0xevshX8zG9MhnCPxJK+VH0Vf+0M1n5vAQ
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f290cab0-3bd8-486b-4bde-08d8342b5c1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 01:53:30.5442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 44/GUe4hTysRk+rdFHYlLhwefCL98oIe5K7/rO8INN1Kr4OxW3OmO+MlxHuw33o+XJ8Wtg7eTbF1menNHwJvdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzLA0Kc2FuZ2VldGENCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBha3VzdGVyODA4IDxha3VzdGVyODA4QGdtYWlsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIDMw
IEp1bHksIDIwMjAgNzo1MSBBTQ0KPiBUbzogSmFpbiwgU2FuZ2VldGEgPHNhbmdlZXRhLmphaW5A
aW50ZWwuY29tPjsgeW9jdG9AbGlzdHMueW9jdG9wcm9qZWN0Lm9yZzsNCj4gb3BlbmVtYmVkZGVk
LWNvcmUgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IENjOiBv
dGF2aW9Ab3NzeXN0ZW1zLmNvbS5icjsgeWkuemhhb0B3aW5kcml2ZXIuY29tOyBTYW5nYWwsIEFw
b29ydg0KPiA8YXBvb3J2LnNhbmdhbEBpbnRlbC5jb20+OyBZZW9oLCBFZSBQZW5nIDxlZS5wZW5n
Lnllb2hAaW50ZWwuY29tPjsgQ2hhbiwNCj4gQWFyb24gQ2h1biBZZXcgPGFhcm9uLmNodW4ueWV3
LmNoYW5AaW50ZWwuY29tPjsNCj4gcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZzsg
c2pvbGxleS55cC5wbUBnbWFpbC5jb207DQo+IHN0ZXZlQHNha29tYW4uY29tDQo+IFN1YmplY3Q6
IFJlOiBbeW9jdG9dIFFBIG5vdGlmaWNhdGlvbiBmb3IgY29tcGxldGVkIGF1dG9idWlsZGVyIGJ1
aWxkICh5b2N0by0NCj4gMy4xLjIucmMxKQ0KPiANCj4gDQo+IA0KPiBPbiA3LzI4LzIwIDExOjIy
IFBNLCBKYWluLCBTYW5nZWV0YSB3cm90ZToNCj4gPiBIaSBBbGwsDQo+ID4NCj4gPiBUaGlzIGlz
IHRoZSBRQSByZXBvcnQgZm9yIHlvY3RvLTMuMS4yLnJjMToNCj4gPiBodHRwczovL2dpdC55b2N0
b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kveW9jdG8tdGVzdHJlc3VsdHMtY29udHJpYi90DQo+
ID4gcmVlLz9oPWludGVsLXlvY3RvLXRlc3RyZXN1bHRzDQo+IA0KPiBJcyBRQSBzdGlsbCBoYXZp
bmcgdG8gcGVyZm9ybSB0aGUgTWFudWFsIHRlc3QgcmVtb3RlbHk/DQoNCldlIGNhbiBhY2Nlc3Mg
aGFyZHdhcmUgbm93Lg0KIA0KPiANCj4gLWFybWluDQo+ID4NCj4gPiA9PT09PT09IFN1bW1hcnkg
PT09PT09PT0NCj4gPiBObyBoaWdoIG1pbGVzdG9uZSBkZWZlY3RzLg0KPiA+IE5vIG5ldyBkZWZl
Y3RzIGFyZSBmb3VuZCBpbiB0aGlzIGN5Y2xlLg0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IFNhbmdl
ZXRhDQo+ID4NCg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiB5
b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3JnIDx5b2N0b0BsaXN0cy55b2N0b3Byb2plY3Qub3Jn
PiBPbg0KPiA+PiBCZWhhbGYgT2YgUG9reWJ1aWxkIFVzZXINCj4gPj4gU2VudDogRnJpZGF5LCAy
NCBKdWx5LCAyMDIwIDM6NTggUE0NCj4gPj4gVG86IHlvY3RvQGxpc3RzLnlvY3RvcHJvamVjdC5v
cmcNCj4gPj4gQ2M6IG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyOyB5aS56aGFvQHdpbmRyaXZlci5j
b207IFNhbmdhbCwgQXBvb3J2DQo+ID4+IDxhcG9vcnYuc2FuZ2FsQGludGVsLmNvbT47IFllb2gs
IEVlIFBlbmcgPGVlLnBlbmcueWVvaEBpbnRlbC5jb20+Ow0KPiA+PiBDaGFuLCBBYXJvbiBDaHVu
IFlldyA8YWFyb24uY2h1bi55ZXcuY2hhbkBpbnRlbC5jb20+Ow0KPiA+PiByaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnOyBha3VzdGVyODA4QGdtYWlsLmNvbTsNCj4gPj4gc2pvbGxl
eS55cC5wbUBnbWFpbC5jb207IEphaW4sIFNhbmdlZXRhIDxzYW5nZWV0YS5qYWluQGludGVsLmNv
bT47DQo+ID4+IHN0ZXZlQHNha29tYW4uY29tDQo+ID4+IFN1YmplY3Q6IFt5b2N0b10gUUEgbm90
aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQNCj4gPj4gKHlvY3RvLQ0K
PiA+PiAzLjEuMi5yYzEpDQo+ID4+DQo+ID4+DQo+ID4+IEEgYnVpbGQgZmxhZ2dlZCBmb3IgUUEg
KHlvY3RvLTMuMS4yLnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUNCj4gPj4gYXV0b2J1aWxkZXIg
YW5kIGlzIGF2YWlsYWJsZSBhdDoNCj4gPj4NCj4gPj4NCj4gPj4gICAgIGh0dHBzOi8vYXV0b2J1
aWxkZXIueW9jdG8uaW8vcHViL3JlbGVhc2VzL3lvY3RvLTMuMS4yLnJjMQ0KPiA+Pg0KPiA+Pg0K
PiA+PiBCdWlsZCBoYXNoIGluZm9ybWF0aW9uOg0KPiA+Pg0KPiA+PiBiaXRiYWtlOiBjYzExZGZh
NGViMzYxNjU0N2E4YTM5MDlmODlkYTBjYzRmMzVkYzU3DQo+ID4+IG1ldGEtYXJtOiA0ODEyYTY2
NTI3ZTg4ZWJkYzUzNTFkNWRiZDYzNzY1YWJlNGFiZjYyDQo+ID4+IG1ldGEtZ3BsdjI6IDYwYjI1
MWMyNWJhODdlOTQ2YTBjYTRjZGM4ZDE3YjFjYjA5MjkyYWMNCj4gPj4gbWV0YS1pbnRlbDogNzc4
MzE0NDM3Mzg4ODVkMzNiZmEzYTczOGZlNmM0ZjAzNjFlNDg5Mg0KPiA+PiBtZXRhLWtlcm5lbDog
NThhNTg5YzVhYWQ1NDE3YWJkMDk5YTk2MWUzYzFhNWIwODNjZGI5MA0KPiA+PiBtZXRhLW1pbmd3
OiA1MjRkZTY4NjIwNWI1ZDY3MzY2NjFkNDUzMmY1Zjk4ZmVlODU4OWI3DQo+ID4+IG9lY29yZTog
ZWE4ODZkNTdkYjkxN2E0MWEwZDEwNmExNWUxZTk2YzcyZDY0MDdiMA0KPiA+PiBwb2t5OiA1Njli
MWY1ZDY3YzU3ZGU5NTdlMjQzOTk3YzUzZWMyZjgxZGM4ZGZlDQo+ID4+DQo+ID4+DQo+ID4+DQo+
ID4+IFRoaXMgaXMgYW4gYXV0b21hdGVkIG1lc3NhZ2UgZnJvbSB0aGUgWW9jdG8gUHJvamVjdCBB
dXRvYnVpbGRlcg0KPiA+PiBHaXQ6IGdpdDovL2dpdC55b2N0b3Byb2plY3Qub3JnL3lvY3RvLWF1
dG9idWlsZGVyMg0KPiA+PiBFbWFpbDogcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
Zw0KPiA+Pg0KPiA+Pg0KPiA+Pg0KDQo=
