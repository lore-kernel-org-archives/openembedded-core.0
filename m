Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12505.1629042582013854134
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=HxysYEwY;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="215479320"
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="215479320"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="440847191"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga002.jf.intel.com with ESMTP; 15 Aug 2021 08:49:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 15 Aug 2021 08:49:39 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 15 Aug 2021 08:49:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Sun, 15 Aug 2021 08:49:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Sun, 15 Aug 2021 08:49:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mt0MplAMb3HtTrFs8eHjj0yU1sZ7CFhYlso8CV4/qMDLz8jYjgpG6BcP2FKmbHu4hnf5LS+Z6DiG1lRlm260HGU76eBgAJm1AL939w+PQJfG5CKmVO+yUG4vbI3CxCwmRxnKWTg4ZySshT3bYUT5AeZwkPRe5BgvJM3vya+pWpFahnY4IJeUTLoTbxy+/l1vnXpDeixoHf+ESRwf8u76Z6JGl65BCo4YSsNzXjgMsylW7ODzNb2XDbezJjUXwnSb/N9bFM2JWdq1mg1FVB5AwLq9TmrXbxk0K+pygBsuQy6Ab12sBFBaOghalh0MNrwMxtRwS5atTEia9VbdsXgdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pODlVhixEK6wD1g4ncSZ8xOXgxz+Kyd95liVW8eDPi0=;
 b=dCA/pI3sJQwlAhcW83l8wjWvaR7ds+1I5X4BhiClVa3/hxZNvBAUf/Sp5hnnGZWsk/xMwG3kbSCE92wnJqMZhbH4Hi0A0W9K7nE3nm+EAjb2HqSRrFq79jYK/2bPFWtNrO4ZNEz4bjv6MA8/esGApMr/wdxxE+1Lcs1a1kpxyTUd9Ujz+5RvzDCcoTPdiK8HmQq50bs85JOb99Q917cocPbq/rmneAYClxqXsh8uYQ/JdCyVPUOTXagcfO06eJ17t8BtgNykjS9H35oyzB/SgOlDs+26jPaALygSCsFRW2F5ztRBVVXsn1WbZjrohTTeMuOFzB5qkwOwLMhU/aejEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pODlVhixEK6wD1g4ncSZ8xOXgxz+Kyd95liVW8eDPi0=;
 b=HxysYEwYjUnOp+K7qS8Gozhh3bozjm8bDwMl4ttU/VvPnQBwwafgHraOWrufXi9dZxnUslhmlcG2W/xxXvBeF7R0Qg5NgQyY6Q1k/wYtX6ITWoaL9DN7i6g0T8mGozrtBYTkZiLEiRTj2KNdUzc1Fn2nz9BYibMY27qUsSge7EM=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by SJ0PR11MB4815.namprd11.prod.outlook.com (2603:10b6:a03:2dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Sun, 15 Aug
 2021 15:49:37 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::d7c:227b:e92b:611c]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::d7c:227b:e92b:611c%9]) with mapi id 15.20.4415.022; Sun, 15 Aug 2021
 15:49:31 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "vinay.m.engg@gmail.com" <vinay.m.engg@gmail.com>
CC: "vinay.kumar@blackfigtech.com" <vinay.kumar@blackfigtech.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "rwmacleod@gmail.com"
	<rwmacleod@gmail.com>, "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH v2] glibc: Fix CVE-2021-35942
Thread-Topic: [OE-core] [hardknott][PATCH v2] glibc: Fix CVE-2021-35942
Thread-Index: AQHXjPo0SaYC5sfwgEyFG+3vqlcsCqt0O0EAgACFDoA=
Date: Sun, 15 Aug 2021 15:49:31 +0000
Message-ID: <85c9b0492f1631448360803535203af9d508c6fc.camel@intel.com>
References: <20210809083931.100208-1-vinay.m.engg@gmail.com>
	 <CANUMPcV7nZHOuHbmJzsn6PSDJgXfX=+Y75jiEeVSL6SeDJexPw@mail.gmail.com>
In-Reply-To: <CANUMPcV7nZHOuHbmJzsn6PSDJgXfX=+Y75jiEeVSL6SeDJexPw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1ed95fe-16ba-4b4e-236b-08d960044578
x-ms-traffictypediagnostic: SJ0PR11MB4815:
x-microsoft-antispam-prvs: <SJ0PR11MB48154227DC1266ED02470BA8F8FC9@SJ0PR11MB4815.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D3hsk5JAqcPSNEhIuqM96wu3jLibXDbxyTZY5QO9gQlOMdQxnynizUSTP5lGtm/rsz94kzNnfBYWfRYB30f4sl2UJMIUeP2ankdzwUl6t0GaLqZHbB3e6vDUR7cNcH51qNA/f5wxx3qbK4tlfRD2Vn32mwfKAwvhJDytPg7PzfEaIexAOGcSUUHiFgy2XPMVNxUSNDUw8QnqN2eZIeQXQ1Mbv6pKHhOFQgBJAC/Xkm22m3u+68ntGBq/I2iMwasvEkfl8z2Y1UdOgnCOWPjECt4sVrc350UhUQTTCANXiKuN4SXJAW+pdPzd2lFVthD9D5a0f92MlCUo7h3qLRvTjuRd02WVZel8AlfWWJtpvGReXU42xdsA1cc9AZSXulRSRxwYLyM7UOkCNZp8yZWaZqq/ZQY6vF0hdnFiaL5JLFMY+tLuxdgYoaSiRLzCAS/i9LcFO4y/+2T6nwjRlgKDp4MDdDR6Omjvw9vuS5j5rBErsmKQXWNPbC+283OCmZAGt+hkWhFMJa0F+njitiQjS8NfaHEW2Q8rV57ecaAtLdRshptJtvwZAeftJ9kmGUQxx0czKRihXIkpGqsR8Q8D1D88aWDGC9BdXpqThsT5PE2xsnJ2YHEG1lmciD834sNYkkHp2C9NMNYUUxjo4eiCRL0zuegZc3JhQRRQd6BxEtCvRMq4XmOeFe/B3W/itKjYf6eM6ZV9RlhklD/qsXeNG4IyOv/cloTdQ+68DJ4hi/B5VTnNL/tLeMJObB6OJXjDYxDitcYlx5/X+oZgOHf9sLd917x0pMMl4+M1OhuJf6z8bHw8KTRhb3uYDrhfOiky
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(38100700002)(38070700005)(76116006)(2616005)(4326008)(66556008)(64756008)(186003)(8936002)(8676002)(6506007)(2906002)(316002)(36756003)(26005)(83380400001)(122000001)(54906003)(86362001)(66946007)(66446008)(66476007)(6916009)(6486002)(966005)(53546011)(478600001)(5660300002)(91956017)(6512007)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3ZubjdKMkJUdTdhYXEvUmlUdktxTG00bXhOVlFjMkcvbGFCRlcrY0h0UGFa?=
 =?utf-8?B?ZDF1R3ZUdEpuTDZrOWwxUzZCRVI4T0U3cS9aT0JqTys2RjJjcm1Rdkt2RkFa?=
 =?utf-8?B?WnlhVUJqbEl1aUxMRFBBZFUzcU9PK0ZhdTNVbGxIaTBENE5Yc203QlZjMERn?=
 =?utf-8?B?dVhiYU1zRzFkZWppeGVMNm9NWmFBUG9UNWJMNmg0M3ZOcVBqZWlLSmJKTE0w?=
 =?utf-8?B?d3R5cFpjdG15TUFiSzVpQmFBM3hXQWpkcnowN1c0cjNpeDNUSkxpdHZVQXdt?=
 =?utf-8?B?WldCaGVCWWpYNUF4RHdyeFNsa3JaMHR2dGFOLzBhempaRi82Q2NzeWI4SHVk?=
 =?utf-8?B?cjVxdzNHRnZyUC8wTjVsdmZJT2RXMjN5Q1dISnNvZUJvckZJeVJWREFPeFVY?=
 =?utf-8?B?MGx1RXZHeEsya01oTjdMd3hvMEZ3T2FlUG5qa2tORkdLWlJqRUpKUEl2Qnp4?=
 =?utf-8?B?ckRCNTVILzJHbVdqV0pSaDJDVVFUNTRzZm5PWm1pRC9BVG1IK2YzZ3plU3ZE?=
 =?utf-8?B?THI0TWQvZW9BWTBKL1h0TVRtOW80UzlPbEdXV2FZRWRIUndFdDFnQjc3T25a?=
 =?utf-8?B?dTJ2aDk2cU02U0F6Q3AxVFZuSHdYZzkrUmFOWWl1T0JrNm43WGpiOVlEblIr?=
 =?utf-8?B?cHhBeldsckFENGZnLzIweWM0WWQwVEhlYzJhbjJvZXlNWlA4Yk9lQ0M3MmVO?=
 =?utf-8?B?OUpxOElndTMzaW9WU3ZrTGlJTmEyY3ZOY1h0UWZZL3E1MW1CN2dwTzUrb1lV?=
 =?utf-8?B?bVNsUHFLSlYyTnc0TnJpUVZxV2F3czBxV1h5alRUU3dXZktLMDNncVhlZmEx?=
 =?utf-8?B?TmMvU2JNbkFidXBCVDkrMlZ0QnVQRjBiQWRZb1RtUWdWbnhxejlIZ1ZsRExx?=
 =?utf-8?B?N205Vm5hd0FTdXlEKzZJdE1LanBDZWFWMklZZ3oxa2hiOEozeW9WQVhUYWZQ?=
 =?utf-8?B?VG4wNzVxMXBWU1hpcXE5QjVDOGpNQmRQMkU5ak9lTFJMREtLS25iejArSHMz?=
 =?utf-8?B?eWxyOU0vckpUeTZQT2dmUkJOSTN4RTR5NldFWjNMTFBIekQxcmY5NVp4aGx4?=
 =?utf-8?B?N1hnNjVMNUxydmhjUko3KzRLM0NzTFBIY252eWF6RGEvZjA0RUVUeGlCSndJ?=
 =?utf-8?B?RjUzc2VqekRqNzZ1bGowb2k4NG9qNzRVYVJnOVNaRDZBM1NPd0hDNTdOY3By?=
 =?utf-8?B?ZzFINnBNenhCVEduUlpnd29CY2VXc2g1NW1GNUpUd2E0ZmN6Q05mZ1VMbVE5?=
 =?utf-8?B?R1NTUGsxak5PR3FGK21oMFVESlk4QmJqU0dwOUtSdFAvS2JLVzlUM05nZU5k?=
 =?utf-8?B?NWJRcElKY2QxbVFrRjRmb0lYbzMyQkFBWDB2aWZxOWFwT0JIb3dxNDdDMUlz?=
 =?utf-8?B?ZDZIOHZicVlBWlRJWWFpWC9LamxGMDNjYzRjQ21ZcS9WUUtzWS9tcldXMC9O?=
 =?utf-8?B?Ny9EU1ZOMy9zV2hDSjZQS1FZbHJIbHV1RWE1SlE5eVRsQWdwVWhtZ1lvc3Z4?=
 =?utf-8?B?YXhIdjBuVjBaNGc5K1IvcGpPSXRxY2RuU1hFSWE2djA5TTM1b2tQelBqZEhG?=
 =?utf-8?B?QWUvWGZEVCsyRk4vdU5GTldyd01OZ3BMZWNMU3ltUUNzNFlVMHBMQjZWSFFZ?=
 =?utf-8?B?ZURaODZ6UW9SeGhZWnd6U1RucGVFNkU5S01zeFFoMFcrR3MvSVpUSnMyMWti?=
 =?utf-8?B?dC94aVVJQ1psbmNyWVNXOE5OWWdjWXRHLzZjaDZJMmh6aXo2elEvSWdJVHRK?=
 =?utf-8?B?L2NvQ3pMRXFjR051YzB1cFpzbjlsV1VNUGtZdWtuTy84alNCZ2dmRjV3S1Yx?=
 =?utf-8?B?eXpuZVpEZkZRRXNBV09rdz09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ed95fe-16ba-4b4e-236b-08d960044578
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2021 15:49:31.0655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k2fQfiTtcwil8vn2WqEqghJ6CPQRiGqq9LTTKIEhATE8qC2gOkRjgCQCDYeOzprHOR9FBT/N5LhWN+Ew621rdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4815
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <993FEC33F26E0340BAEE90D95AD63215@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCk9uIFN1biwgMjAyMS0wOC0xNSBhdCAxMzoyMyArMDUzMCwgVmluYXkgS3VtYXIg
d3JvdGU6DQo+IEhpIEFudWosDQo+IA0KPiBQbGVhc2UgbGV0IG1lIGtub3cgaW4gY2FzZSBhbnkg
Y29ycmVjdGlvbnMgYXJlIG5lZWRlZC4NCg0KSSBoYXZlIHRha2VuIHRoaXMgcGF0Y2ggYW5kIGl0
IHdpbGwgYmUgaW4gdGhlIG5leHQgcHVsbCByZXF1ZXN0Lg0KDQpUaGFua3MsDQoNCkFudWoNCg0K
PiANCj4gUmVnYXJkcywNCj4gVmluYXkNCj4gDQo+IE9uIE1vbiwgQXVnIDksIDIwMjEgYXQgMjox
MCBQTSBWaW5heSBLdW1hciA8dmluYXkubS5lbmdnQGdtYWlsLmNvbT4NCj4gd3JvdGU6DQo+ID4g
DQo+ID4gU291cmNlOiBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC9nbGliYy5naXQNCj4gPiBU
cmFja2luZyAtLSBodHRwczovL3NvdXJjZXdhcmUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9p
ZD0yODAxMQ0KPiA+IA0KPiA+IEJhY2twb3J0ZWQgdXBzdHJlYW0gY29tbWl0IDVhZGRhNjFmNjJi
NzczODQ3MThiNGMwZDgzMzZhZGU4ZjJiNGIzNWMNCj4gPiB0bw0KPiA+IGdsaWJjLTIuMzMgc291
cmNlLg0KPiA+IA0KPiA+IFVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQNCj4gPiBbaHR0cHM6Ly9z
b3VyY2V3YXJlLm9yZy9naXQvP3A9Z2xpYmMuZ2l0O2E9Y29tbWl0O2g9NWFkZGE2MWY2MmI3NzM4
NDcxOGI0YzBkODMzNmFkZThmMmI0YjM1Yw0KPiA+IF0NCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5h
eSBLdW1hciA8dmluYXkubS5lbmdnQGdtYWlsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoC4uLi9nbGli
Yy9nbGliYy9DVkUtMjAyMS0zNTk0Mi5wYXRjaMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQ0DQo+ID4g
KysrKysrKysrKysrKysrKysrKw0KPiA+IMKgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNf
Mi4zMy5iYsKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKw0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0
NSBpbnNlcnRpb25zKCspDQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNv
cmUvZ2xpYmMvZ2xpYmMvQ1ZFLTIwMjEtDQo+ID4gMzU5NDIucGF0Y2gNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmMvQ1ZFLTIwMjEtMzU5NDIucGF0
Y2gNCj4gPiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjL0NWRS0yMDIxLTM1OTQyLnBh
dGNoDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwLi41Y2Fl
MWJjOTFjDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2ds
aWJjL2dsaWJjL0NWRS0yMDIxLTM1OTQyLnBhdGNoDQo+ID4gQEAgLTAsMCArMSw0NCBAQA0KPiA+
ICtGcm9tIDVhZGRhNjFmNjJiNzczODQ3MThiNGMwZDgzMzZhZGU4ZjJiNGIzNWMgTW9uIFNlcCAx
NyAwMDowMDowMA0KPiA+IDIwMDENCj4gPiArRnJvbTogQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBs
aW51eC1tNjhrLm9yZz4NCj4gPiArRGF0ZTogRnJpLCAyNSBKdW4gMjAyMSAxNTowMjo0NyArMDIw
MA0KPiA+ICtTdWJqZWN0OiBbUEFUQ0hdIHdvcmRleHA6IGhhbmRsZSBvdmVyZmxvdyBpbiBwb3Np
dGlvbmFsIHBhcmFtZXRlcg0KPiA+IG51bWJlciAoYnVnDQo+ID4gKyAyODAxMSkNCj4gPiArDQo+
ID4gK1VzZSBzdHJ0b3VsIGluc3RlYWQgb2YgYXRvaSBzbyB0aGF0IG92ZXJmbG93IGNhbiBiZSBk
ZXRlY3RlZC4NCj4gPiArDQo+ID4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQNCj4gPiBbaHR0
cHM6Ly9zb3VyY2V3YXJlLm9yZy9naXQvP3A9Z2xpYmMuZ2l0O2E9Y29tbWl0O2g9NWFkZGE2MWY2
MmI3NzM4NDcxOGI0YzBkODMzNmFkZThmMmI0YjM1Yw0KPiA+IF0NCj4gPiArQ1ZFOiBDVkUtMjAy
MS0zNTk0Mg0KPiA+ICtTaWduZWQtb2ZmLWJ5OiBWaW5heSBLdW1hciA8dmluYXkubS5lbmdnQGdt
YWlsLmNvbT4NCj4gPiArLS0tDQo+ID4gKyBwb3NpeC93b3JkZXhwLXRlc3QuYyB8IDEgKw0KPiA+
ICsgcG9zaXgvd29yZGV4cC5jwqDCoMKgwqDCoCB8IDIgKy0NCj4gPiArIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gKw0KPiA+ICtkaWZmIC0tZ2l0
IGEvcG9zaXgvd29yZGV4cC10ZXN0LmMgYi9wb3NpeC93b3JkZXhwLXRlc3QuYw0KPiA+ICtpbmRl
eCBmOTNhNTQ2ZDdlLi45ZGYwMmRiYmIzIDEwMDY0NA0KPiA+ICstLS0gYS9wb3NpeC93b3JkZXhw
LXRlc3QuYw0KPiA+ICsrKysgYi9wb3NpeC93b3JkZXhwLXRlc3QuYw0KPiA+ICtAQCAtMTgzLDYg
KzE4Myw3IEBAIHN0cnVjdCB0ZXN0X2Nhc2Vfc3RydWN0DQo+ID4gK8KgwqDCoMKgIHsgMCwgTlVM
TCwgIiR2YXIiLCAwLCAwLCB7IE5VTEwsIH0sIElGUyB9LA0KPiA+ICvCoMKgwqDCoCB7IDAsIE5V
TEwsICJcIlxcblwiIiwgMCwgMSwgeyAiXFxuIiwgfSwgSUZTIH0sDQo+ID4gK8KgwqDCoMKgIHsg
MCwgTlVMTCwgIiIsIDAsIDAsIHsgTlVMTCwgfSwgSUZTIH0sDQo+ID4gKyvCoMKgwqAgeyAwLCBO
VUxMLCAiJHsxMjM0NTY3ODkwMTIzNDU2Nzg5MDEyfSIsIDAsIDAsIHsgTlVMTCwgfSwgSUZTDQo+
ID4gfSwNCj4gPiArDQo+ID4gK8KgwqDCoMKgIC8qIEZsYWdzIG5vdCBhbHJlYWR5IGNvdmVyZWQg
KHRlc3RpdCgpIGhhcyBzcGVjaWFsIGhhbmRsaW5nDQo+ID4gZm9yIHRoZXNlKSAqLw0KPiA+ICvC
oMKgwqDCoCB7IDAsIE5VTEwsICJvbmUgdHdvIiwgV1JERV9ET09GRlMsIDIsIHsgIm9uZSIsICJ0
d28iLCB9LCBJRlMNCj4gPiB9LA0KPiA+ICtkaWZmIC0tZ2l0IGEvcG9zaXgvd29yZGV4cC5jIGIv
cG9zaXgvd29yZGV4cC5jDQo+ID4gK2luZGV4IGJjYmU5NmU0OGQuLjFmM2IwOWY3MjEgMTAwNjQ0
DQo+ID4gKy0tLSBhL3Bvc2l4L3dvcmRleHAuYw0KPiA+ICsrKysgYi9wb3NpeC93b3JkZXhwLmMN
Cj4gPiArQEAgLTEzOTksNyArMTM5OSw3IEBAIGVudnN1YnN0Og0KPiA+ICvCoMKgIC8qIElzIGl0
IGEgbnVtZXJpYyBwYXJhbWV0ZXI/ICovDQo+ID4gK8KgwqAgZWxzZSBpZiAoaXNkaWdpdCAoZW52
WzBdKSkNCj4gPiArwqDCoMKgwqAgew0KPiA+ICstwqDCoMKgwqDCoCBpbnQgbiA9IGF0b2kgKGVu
dik7DQo+ID4gKyvCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgbiA9IHN0cnRvdWwgKGVudiwgTlVM
TCwgMTApOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgIGlmIChuID49IF9fbGliY19hcmdjKQ0K
PiA+ICvCoMKgwqDCoMKgwqAgLyogU3Vic3RpdHV0ZSBOVUxMLiAqLw0KPiA+ICstLQ0KPiA+ICsy
LjE3LjENCj4gPiArDQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2ds
aWJjXzIuMzMuYmIgYi9tZXRhL3JlY2lwZXMtDQo+ID4gY29yZS9nbGliYy9nbGliY18yLjMzLmJi
DQo+ID4gaW5kZXggYmIzNWM1MGM5OC4uN2Y1MTZkMmJiZSAxMDA2NDQNCj4gPiAtLS0gYS9tZXRh
L3JlY2lwZXMtY29yZS9nbGliYy9nbGliY18yLjMzLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYmMvZ2xpYmNfMi4zMy5iYg0KPiA+IEBAIC02Myw2ICs2Myw3IEBAIFNSQ19VUkkg
PcKgDQo+ID4gIiR7R0xJQkNfR0lUX1VSSX07YnJhbmNoPSR7U1JDQlJBTkNIfTtuYW1lPWdsaWJj
IFwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgDQo+ID4gZmlsZTovLzAwMDEtbnB0bC1SZW1v
dmUtcHJpdmF0ZS1mdXRleC1vcHRpbWl6YXRpb24tQlotMjczMDQucGF0Y2jCoFwNCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGZpbGU6Ly9DVkUtMjAyMS0zMzU3NF8xLnBhdGNowqBcDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMjEtMzM1NzRfMi5wYXRjaMKgXA0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaWxlOi8vQ1ZFLTIwMjEtMzU5NDIucGF0Y2jCoFwN
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICINCj4gPiDCoFMgPSAiJHtXT1JLRElSfS9naXQi
DQo+ID4gwqBCID0gIiR7V09SS0RJUn0vYnVpbGQtJHtUQVJHRVRfU1lTfSINCj4gPiAtLQ0KPiA+
IDIuMzEuMQ0KPiA+IA0KPiANCj4gDQo+IA0KDQo=
