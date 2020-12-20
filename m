Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.31884.1608507847152029182
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 15:44:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=r2aaPxdc;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: jay.shen.teoh@intel.com)
IronPort-SDR: /3RVCJFdtankVp3ZLCK7o1FFgE8YZDWzFlTzZG3OeSrPxii17yIyPBpT4fW4teCYfdRT/pslf3
 rgkHjo5ey2ZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9841"; a="154876306"
X-IronPort-AV: E=Sophos;i="5.78,435,1599548400"; 
   d="scan'208";a="154876306"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2020 15:44:06 -0800
IronPort-SDR: +DFLFrJqe6lNCqhbnJjOrNNE70/2jZbh7nVHAUomtQbAI8VVJ2ah93SyqciezkJO3E5m+V+Den
 ngqKm8ZFevug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,435,1599548400"; 
   d="scan'208";a="388491543"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga004.fm.intel.com with ESMTP; 20 Dec 2020 15:44:05 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 20 Dec 2020 15:44:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 20 Dec 2020 15:44:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 20 Dec 2020 15:44:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cujV/3AmcyKN+z8oxqGDiRYl6WzM4J2yMgJpYZkZgb8T3ZDRJSeWrjm5ISclbY2JBPlD6GZUwZ6o6S1PwTYKl1/rCRkMkGnrkLSdfJMNOUMQH0UbRcBmusinTURZbD4dwvKNpK6yyoJUFeo0YwY4p/vgaD6i3TDMM+z7Ur4MvKSWR+YULrYKWXjyNniaRtAjL0eqWQye6sU7NBozfU0gLiVeQbbWA6b4qNrHvn3meZsTTbW0WykOtCoQGYyQDxRMmJwlk4zTEco+XjEIXpQfHTNgJb1ztM34pjJSytCgVjXS5E6fEx9HEPue19LeyxzmcuKfWAmxPyp/uZ3HoQCuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZxvZ8KqYCuU6so3VM9poicogd1V+VeHIvnxAQA6UBg=;
 b=GvSnuJK0JDrKNFWXOaz1vz/ZVjTUV1+C8/11K8qFhQPRYqkcjG9WXoyMTnThNJqTgh2IV7GwTu8lS8JIZpkJC04X2FAqPADgK9nWFUMLvexcSzNXZXJGzgbfv1Fiu3Et7eSFIoEEZ2hPLVNG29y9swPIdZkgTH56gMomdq2iuDwruCnWseipVumupSZNshnKytcD9KxqhV+o6odNd8UnjFiVBqTns3swFaxJzpi1mOAOMlh+dLmn+9kXlJ29WQWWu+Gye2xO5MxkAtvRXu4LzpRWwIRD7+D/3IiDDjwiV+aKpnv7M7l0uWF6FuJW7Iz3LaOackw+Fp/3eXuFLmn3fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZxvZ8KqYCuU6so3VM9poicogd1V+VeHIvnxAQA6UBg=;
 b=r2aaPxdcSIrGHtvbMazBOkj0KpGRFsjXx/8+0Bf4MxDYXmBSkGE8edYoSVHKZPiAX5AuCg8h6//STxjWJUAMEHcybRNz9Isq9iTUp/LiIS9ezmdskhC93/4N0PZUdd/H+AhGSVddDiitgwa13y0ByCew8ukahLjsO6F4T38WKiA=
Received: from MWHPR11MB1376.namprd11.prod.outlook.com (2603:10b6:300:1d::12)
 by MWHPR11MB1309.namprd11.prod.outlook.com (2603:10b6:300:20::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Sun, 20 Dec
 2020 23:44:02 +0000
Received: from MWHPR11MB1376.namprd11.prod.outlook.com
 ([fe80::3998:756e:a150:623d]) by MWHPR11MB1376.namprd11.prod.outlook.com
 ([fe80::3998:756e:a150:623d%3]) with mapi id 15.20.3676.033; Sun, 20 Dec 2020
 23:44:01 +0000
From: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] oeqa/terminal : improve the test case
Thread-Topic: [OE-core] [PATCH v2] oeqa/terminal : improve the test case
Thread-Index: AQHW1ZJ2M2XB9P3veEWteS0jN2ntwKoAqFBg
Date: Sun, 20 Dec 2020 23:44:01 +0000
Message-ID: <MWHPR11MB1376455875F5DFBB67165E4EBBC10@MWHPR11MB1376.namprd11.prod.outlook.com>
References: <16460429C740485C.10479@lists.openembedded.org>
	 <1608183270-6229-1-git-send-email-jay.shen.teoh@intel.com>
 <f9ea5dc14572073d8844aecb81331c4a169077ba.camel@linuxfoundation.org>
In-Reply-To: <f9ea5dc14572073d8844aecb81331c4a169077ba.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [42.189.6.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bfed699-d611-450e-dc46-08d8a541211b
x-ms-traffictypediagnostic: MWHPR11MB1309:
x-microsoft-antispam-prvs: <MWHPR11MB1309674C4160D26E06D8C692BBC10@MWHPR11MB1309.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:459;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L2sRMJS0D/Rk4znpY+CsrUHwsotH5WK045Xm5uzqZUJCrFgVh6YtaynKQltuezoPVvXASpTWXAmqOpLtAMRHDqy9YDDaakBoPQy37MeWuxjUiVfykqecGBN3tv846CfLcSrkdHZ2Sms9OVHDArwjILNp3mQ8gR6/wLGhcf0C9vxZFuuiM9/U5ywsy83Y2+luuCBQoousD/bpKxDOX0fWG3WkUF0Sk0KMV5JOnP/v7kznZvpuqClvr7jHOj6zrpGVCvoOBuqd5emtc5T/oh8dv1ZXO3f3BOSVk8/tMAPMdPMtJrCuxCnEniMO6LLnaDfNMIdxeWp+CG8jg48HO5tp9PUibDXTVYofTPx7pc4FlIdyVFHJAZjDySnMh6C+UEw6PTyA3mzZQdl8mwhmKNwzFQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1376.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(66476007)(8676002)(66946007)(8936002)(52536014)(55016002)(26005)(110136005)(83380400001)(66446008)(66556008)(64756008)(316002)(53546011)(9686003)(7696005)(33656002)(6506007)(71200400001)(5660300002)(966005)(76116006)(2906002)(86362001)(4001150100001)(478600001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dnpucmNqMnlGem1EcTdwOTkrY1R3R1FMS0pEUk9EZGFLTHBZM2oxUWxmaXYy?=
 =?utf-8?B?Um5tNDZUNE9jQjl4Z2V0NjR5emVqMmFWUDdWcis2RjBvQmsyc1ZIblRQVVdD?=
 =?utf-8?B?d2dqQzYrWnVlYi9rR0xaVDVZZEduMUEzcjlUcTVIVDNTeDBpTTNhbjdYSVpG?=
 =?utf-8?B?bmU3WEJ2c0tlNXk4MklFaEZGRXdsUEgxTWFyeDhuQURxV3lNdXJKZ2JkWEZC?=
 =?utf-8?B?QUllZm9pam9LQ1hpNEs5SVliU09Vd0drbmJ4SUpUQTBYQUlST2phbUNlWlRk?=
 =?utf-8?B?WXFhdVlGUGl1Szd6bEx6VzNNM3FyVkNvdmlTK2JZREo0N2kzUXhMc1o3eWNk?=
 =?utf-8?B?ei9QM1FwOUlyU3BxbGFhN0JDYVdZMWRpSGM2MVZxblRnSERWK1M4SmhidSta?=
 =?utf-8?B?UnAyTm1NbHZpaktWRk9YNVFiTmRrMFVlVk5sS1pseDgySVpVVExBWURYdTAw?=
 =?utf-8?B?MzlJZnFpK1lFcVBtbkpjaitsN25zRUNrczBaZ216ZTYwQWYrSm1XZzg0Nlcr?=
 =?utf-8?B?M29rOE9xRENodGRSZ1RTMUZ4eU05amZoY0hISUx5UTBlMzdyclFBQlQvOWxj?=
 =?utf-8?B?SUN1U2lGWlNQdThkeTk2TGFTekJBZWUzYU1XUXNVemNHM2FBak1Vb3p2QkVn?=
 =?utf-8?B?UTAxRDVWajQ5TjBGWUJrZ1JzN044V3cwSFdaZ2F2d1crY2NsUkxMVFNzdk1E?=
 =?utf-8?B?S0RVNjVDeHcxVFpvWTY2UTMrQUk0WFoxWGFJU0dlNG5uODM3WVlHYVV2ZWFZ?=
 =?utf-8?B?L3RhNVpodmJ2NURoMkFSSTFOOXlYRHZMNHdIN0lVd0NqQWFUbHlJdy9LaFlp?=
 =?utf-8?B?OUo3a2dKc0txbkVjMGdEMWMxSXo4VDByRjBmVk9jV09xZHhubkN1THl6c1Na?=
 =?utf-8?B?SXVXdzBwVW56Q0xScDhyLzhvbVF6cVVIUTBHMW95MTludnpRUWFEc2w5cVFB?=
 =?utf-8?B?YkQrNHdybWluTGVad0pzcUljRU04R2ZnUk81MDFGMXM0bmtiZFd2TzM5Mzln?=
 =?utf-8?B?QmdHWlFWaDlWTER5YjA5bWloZ01SUUpGQkwwZWVoSGJFY1lZNnphTUNFQXdl?=
 =?utf-8?B?ZjNPdXdOQ1hpUG1RbkVOeHM2eUJuMmg4dWNWQ2x5QUt4RUt1NzFGZDEyL2pS?=
 =?utf-8?B?YUZIVHpkcGhMQ0o0d1RnWXREeDkya2l1Qm9MMjRSRUc2UFFEMGppL3dGVlh6?=
 =?utf-8?B?bzJCeXg3UTRxaHZmK3NaaU94bTVLbGpNK1k2d3Q5ZGt3eXIzWkFKZ0lQbEpK?=
 =?utf-8?B?NU9uMEk3eGlOUkpaSlUzNFN2cHlRSkZUZ1NLZWFPRStLdzUrM0RDeklGNmhh?=
 =?utf-8?Q?sNqj6RL61xsec=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1376.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bfed699-d611-450e-dc46-08d8a541211b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2020 23:44:01.8796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +dZnDUNy9YNhRSUmUE5Wlr64hkV+lm22b08KvxMxaUzuQksJD67Ontv6TI07t/qz6RSwwk2Rw64kq+AVAHZXqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1309
Return-Path: jay.shen.teoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwgDQoNClRoaXMgcGF0Y2ggaXMgaW4gcmVwbHkgdG8gdGhlIHBhdGNoIGJlbG93
IDogDQoNCkxpbmsgOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRk
ZWQtY29yZS9tZXNzYWdlLzE0NDQzMj9wPSwsLDIwLDAsMCwwOjpDcmVhdGVkLCxvZXFhJTJGdGVy
bWluYWwsMjAsMiwwLDc4MTMxNjY0DQoNClRoYW5rcywNCkpheQ0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91
bmRhdGlvbi5vcmc+IA0KU2VudDogU2F0dXJkYXksIDE5IERlY2VtYmVyLCAyMDIwIDc6MDcgQU0N
ClRvOiBUZW9oLCBKYXkgU2hlbiA8amF5LnNoZW4udGVvaEBpbnRlbC5jb20+OyBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQ
QVRDSCB2Ml0gb2VxYS90ZXJtaW5hbCA6IGltcHJvdmUgdGhlIHRlc3QgY2FzZQ0KDQpPbiBUaHUs
IDIwMjAtMTItMTcgYXQgMTM6MzQgKzA4MDAsIFRlb2gsIEpheSBTaGVuIHdyb3RlOg0KPiBGcm9t
OiBUZW9oIEpheSBTaGVuIDxqYXkuc2hlbi50ZW9oQGludGVsLmNvbT4NCj4gDQo+IC1JbXByb3Zl
IHRoaXMgdGVzdCBjYXNlIHRvIGZ1bGZpbGwgdGhlIHJlcXVpcmVtZW50cyBvZiByZXBsYWNpbmcg
dGhlIGNsaWNrX3Rlcm1pbmFsX2ljb25fb25fWF9kZXNrdG9wIG1hbnVhbCB0ZXN0IGNhc2UgZnJv
bSBvZXFhL21hbnVhbC9ic3AtaHcgOg0KPiAxKSB2ZXJpZnkgdGhhdCB0aGUgdGVybWluYWwgd2lu
ZG93IGlzIHdvcmtpbmcgd2l0aG91dCBwcm9ibGVtDQo+IDIpIHZlcmlmeSB0aGF0IHRoZXJlJ3Mg
b25seSAxIHRlcm1pbmFsIHdpbmRvdyBpcyBsYXVuY2hlZA0KPiAzKSByZWR1Y2UgdGVzdCBjYXNl
IHJ1biB0aW1lDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUZW9oIEpheSBTaGVuIDxqYXkuc2hlbi50
ZW9oQGludGVsLmNvbT4NCj4gLS0tDQo+ICBtZXRhL2xpYi9vZXFhL3J1bnRpbWUvY2FzZXMvdGVy
bWluYWwucHkgfCAxNyArKysrKysrKy0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5z
ZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL2xpYi9v
ZXFhL3J1bnRpbWUvY2FzZXMvdGVybWluYWwucHkgDQo+IGIvbWV0YS9saWIvb2VxYS9ydW50aW1l
L2Nhc2VzL3Rlcm1pbmFsLnB5DQo+IGluZGV4IGVhNGVmMDIuLmMzMzAwNTQgMTAwNjQ0DQo+IC0t
LSBhL21ldGEvbGliL29lcWEvcnVudGltZS9jYXNlcy90ZXJtaW5hbC5weQ0KPiArKysgYi9tZXRh
L2xpYi9vZXFhL3J1bnRpbWUvY2FzZXMvdGVybWluYWwucHkNCj4gQEAgLTIsMjEgKzIsMjAgQEAg
ZnJvbSBvZXFhLnJ1bnRpbWUuY2FzZSBpbXBvcnQgT0VSdW50aW1lVGVzdENhc2UgIA0KPiBmcm9t
IG9lcWEuY29yZS5kZWNvcmF0b3IuZGVwZW5kcyBpbXBvcnQgT0VUZXN0RGVwZW5kcyAgZnJvbSAN
Cj4gb2VxYS5ydW50aW1lLmRlY29yYXRvci5wYWNrYWdlIGltcG9ydCBPRUhhc1BhY2thZ2UNCj4g
IA0KPiAtaW1wb3J0IHJlDQo+ICtpbXBvcnQgdGhyZWFkaW5nDQo+ICtpbXBvcnQgdGltZQ0KPiAg
DQo+ICBjbGFzcyBUZXJtaW5hbFRlc3QoT0VSdW50aW1lVGVzdENhc2UpOg0KPiAgDQo+ICAgICAg
QE9FSGFzUGFja2FnZShbJ21hdGNoYm94LXRlcm1pbmFsJ10pDQo+ICAgICAgQE9FVGVzdERlcGVu
ZHMoWydzc2guU1NIVGVzdC50ZXN0X3NzaCddKQ0KPiAgICAgIGRlZiB0ZXN0X3Rlcm1pbmFsX3J1
bm5pbmcoc2VsZik6DQo+IC0gICAgICAgIHN0YXR1cywgb3V0cHV0ID0gc2VsZi50YXJnZXQucnVu
KCJleHBvcnQgRElTUExBWT06MCAmJiBtYXRjaGJveC10ZXJtaW5hbCIsKQ0KPiAtICAgICAgICBj
aGVja190ZXJtaW5hbCA9IHJlLnNlYXJjaCgiUHJvY2VzcyBraWxsZWQgLSBubyBvdXRwdXQgZm9y
IDMwMCBzZWNvbmRzLiIsIG91dHB1dCkNCj4gLSAgICAgICAgc2VsZi5hc3NlcnRUcnVlKGNoZWNr
X3Rlcm1pbmFsLCBtc2c9J1Rlcm1pbmFsIHdpbmRvdyBzaG91bGQgYmUgbGF1bmNoZWQgd2l0aG91
dCBhbnkgcHJvYmxlbScpICANCj4gLSAgICAgICAgDQo+IC0gICAgICAgIHN0YXR1cywgb3V0cHV0
ID0gc2VsZi50YXJnZXQucnVuKCdwaWRvZiBtYXRjaGJveC10ZXJtaW5hbCB8IHdjIC13JykNCj4g
LSAgICAgICAgb3V0cHV0ID0gaW50KG91dHB1dCkNCj4gLSAgICAgICAgc2VsZi5hc3NlcnRFcXVh
bChvdXRwdXQsIDEsICdUaGVyZSBzaG91bGQgYmUgb25seSBvbmUgdGVybWluYWwgd2luZG93IGJl
aW5nIGxhdW5jaGVkLiBUZXJtaW5hbCB3aW5kb3cgbGF1bmNoZWQgOiAlcycgJSBvdXRwdXQpDQo+
ICsgICAgICAgIHRfdGhyZWFkID0gdGhyZWFkaW5nLlRocmVhZCh0YXJnZXQ9c2VsZi50YXJnZXQu
cnVuLCBhcmdzPSgiZXhwb3J0IERJU1BMQVk9OjAgJiYgbWF0Y2hib3gtdGVybWluYWwgLWUgJ3No
IC1jIFwidW5hbWUgLWEgJiYgZXhlYyBzaFwiJyIsKSkNCj4gKyAgICAgICAgdF90aHJlYWQuc3Rh
cnQoKQ0KPiArICAgICAgICB0aW1lLnNsZWVwKDIpDQo+ICAgICAgICAgIA0KPiAgICAgICAgICBz
dGF0dXMsIG91dHB1dCA9IHNlbGYudGFyZ2V0LnJ1bigncGlkb2YgbWF0Y2hib3gtdGVybWluYWwn
KQ0KPiArICAgICAgICBudW1iZXJfb2ZfdGVybWluYWwgPSBsZW4ob3V0cHV0LnNwbGl0KCkpDQo+
ICsgICAgICAgIHNlbGYuYXNzZXJ0RXF1YWwobnVtYmVyX29mX3Rlcm1pbmFsLCAxLCBtc2c9J1Ro
ZXJlIHNob3VsZCBiZSANCj4gKyBvbmx5IG9uZSB0ZXJtaW5hbCBiZWluZyBsYXVuY2hlZC4gTnVt
YmVyIG9mIHRlcm1pbmFsIGxhdW5jaGVkIDogJXMnIA0KPiArICUgbnVtYmVyX29mX3Rlcm1pbmFs
KQ0KPiAgICAgICAgICBzZWxmLnRhcmdldC5ydW4oJ2tpbGwgLTkgJXMnICUgb3V0cHV0KQ0KPiAt
ICAgICAgICBzZWxmLmFzc2VydEVxdWFsKHN0YXR1cywgMCwgbXNnPSdOb3QgYWJsZSB0byBmaW5k
IHByb2Nlc3MgdGhhdCBydW5zIHRlcm1pbmFsLicpICAgDQo+ICsgICAgICAgIHNlbGYuYXNzZXJ0
RXF1YWwoc3RhdHVzLCAwLCBtc2c9J05vdCBhYmxlIHRvIGZpbmQgcHJvY2VzcyANCj4gKyB0aGF0
IHJ1bnMgdGVybWluYWwuJykNCj4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlDQo+IA0KDQpU
aGlzIHBhdGNoIGRvZXNuJ3Qgc2VlbSB0byBhcHBseSBhZ2FpbnN0IG1hc3Rlcj8NCg0KQ2hlZXJz
LA0KDQpSaWNoYXJkDQoNCg==
