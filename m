Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.672.1615577666375136385
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 11:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=YPwJzQvp;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: WMBtHE0lg2dCTIiAxdQJdCLoKGNN3dFjKuUTLHww3K+jLUl6mWI2wxBo5AAMo1czQJ8ZETQK7f
 CBovVNLV5VHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="188245016"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="188245016"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2021 11:34:25 -0800
IronPort-SDR: yA1599U1Wl+KpSH5xpEBdRI4xAVWbf8RSuMtMX9H3CbilE3SEH1y//IZuNNno6Ca7tc/qdmQFy
 0hR+P93+pDhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; 
   d="scan'208";a="521523632"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP; 12 Mar 2021 11:34:25 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Mar 2021 11:34:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Fri, 12 Mar 2021 11:34:24 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Fri, 12 Mar 2021 11:34:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIflpyl9RA/DxpGN02OTY7ODf4CJo9Tdy0CT3Rxi4xQM5RRvOBbSsfWe17vrmoz5/EG8Ya1zu9FbTf00atlilvmE2+5qMHmb3oUO7Y0dKUBw3h7M3yTKaLg+XpORzZvKTomkjug4EO59WcUBEdVDBxNUX0MtTgXLrHr09AqXu+9TOyxESWDoa/aALZj0RIf8yq0KR/4fsw5bB8e3UNWJjsDx8bPVQQ20ige0Qv7Zdx4GowGGw7tPoxrTwnvHh/wCgL2A7SXvzpQqBwhm2ZKbVtfCWz2C5Y02TrhEXGuDbT0j1g5sy6RXsjLIS+V6jg0D5w0ZCjCrwyKe6nKykubOcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaFG4ZR9Z2+O5iGlAjACbp3v1PunQt0lTqOjkDj2yuk=;
 b=HDchSxq2rDOlRdlHQjqSD6mWevt0vd3p/FN6M/eeR/yK55jn8skDQJfGQhLDy4UIIXjs9VhESUY1SPd2qV/jyBPDYnn0lTdUn9tpUHgHg2b7CvomO2MciWkz31d0wIsidz1y5hniM24B+YON3OA1xxWhVOcHb6hyB5jIeB2jqzSyH1aCq3WuLse42lKi9kVzaIRjbRc6W1rn6eWMpeT14WdeXOVQ8HR6eil//Rq9E2TuqC03BRPwkdAEiPNZ4ez14XGHOvWDy4iHCaFY3YEEcaAD9taAdVsEhV1uoMmxOQIsEJhQm8vsVn0waoUcmMr2h3q7ioneC3KNV1CSCamx3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaFG4ZR9Z2+O5iGlAjACbp3v1PunQt0lTqOjkDj2yuk=;
 b=YPwJzQvpKH76EskmZlB0HEmnNZ+75mSUQ4h0fPgGJ9MiqqNoFxYFponVHCYrJLIuoD527t/aBf7tfIJmoVsn4esSLNfZ9oRS4t1FFZTU+IrPtdiiUU6Z3ceOPOMJaNWnC4MXv9X3DAy4Bo1KwdZcd6iGTKwPRBJDZ86Lkpa7OL0=
Received: from DM5PR11MB1322.namprd11.prod.outlook.com (2603:10b6:3:d::12) by
 DM6PR11MB3036.namprd11.prod.outlook.com (2603:10b6:5:6f::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.30; Fri, 12 Mar 2021 19:34:22 +0000
Received: from DM5PR11MB1322.namprd11.prod.outlook.com
 ([fe80::39ba:6925:3208:f38e]) by DM5PR11MB1322.namprd11.prod.outlook.com
 ([fe80::39ba:6925:3208:f38e%4]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 19:34:22 +0000
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
Thread-Topic: [OE-core] [PATCH] glibc: Fix CVE-2021-27645
Thread-Index: AQHXFoo+3Jx9lAFlFU2WCuYh10gx96p/dvgAgAFImAA=
Date: Fri, 12 Mar 2021 19:34:21 +0000
Message-ID: <DM5PR11MB1322590C6E8F9272ECC912CFDE6F9@DM5PR11MB1322.namprd11.prod.outlook.com>
References: <20210311152128.41215-1-khairul.rohaizzat.jamaluddin@intel.com>
 <CAMKF1spX6z9vvv7QNbWhkapX-Z1=FWZVh0W2+OM2qSbxPqQgkQ@mail.gmail.com>
In-Reply-To: <CAMKF1spX6z9vvv7QNbWhkapX-Z1=FWZVh0W2+OM2qSbxPqQgkQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [113.210.54.148]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a81d7be6-8965-42e4-f3b1-08d8e58dd639
x-ms-traffictypediagnostic: DM6PR11MB3036:
x-microsoft-antispam-prvs: <DM6PR11MB303681425CCD834EF50EE1B6DE6F9@DM6PR11MB3036.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fa/aSkYiqkbI9oIOZBgarVy5c4lp4cmrwW+Yzzzg69Ag+74V7G1P98W11YI0Ze7Ru0/dOZl1NvZfpdG2KfR9yjOYKvfS95d7uubJM1YJ+Ewxuf6EmqZA6MqaGTgjydXHC+7qsPOWd0EGehncyU67nvJf7DYUHoNfV0XC6Igvp5DOXZleZtIfWguH5zfZ2INUPSS8hh4tqR/jQMR5BkcubVW1KMAmgm6vweFKJvMyQ4jErZUpQS6Ayu6Zz7AZIjBRzGNkz3dN9Aob3gW4+NhN4JuGaRDyC7VB3TPHbTHO+X5LHvJRZb6JfoBuClJilfuiQlnB4yglrsRLRzEzyC3YQEpB7E2ZChwZF/2pebwEZkJ1iPx9Lek4Qogzo125ezpDp0w0XXUwf3qgsqnleecnbTgZAlA2IjzDqDmtNfj2LCu5dbQWjSazaHYk/WfENmPVdEqZAK4IaVN1ol/ezGv5x4TbXCgGiqZBqO8n6GLCc1mBDQ8CRDrS2ILOFfS0Du3qF+sQXL/KjkMVEwY7X2GNdUqcWBq+hZ5lNCesg8RjT7oZF1hvnQ7InUbdQD82x0AYFqqAHs/bnFXA1QIq3oS8ZM3cPEjB59ZCY87B6PK9U88=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1322.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(346002)(136003)(39860400002)(376002)(478600001)(186003)(33656002)(2906002)(53546011)(8936002)(71200400001)(83380400001)(52536014)(4326008)(26005)(66556008)(66446008)(7696005)(64756008)(6916009)(55016002)(66476007)(316002)(6506007)(76116006)(8676002)(66946007)(5660300002)(9686003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TmlvM1V6d2NKUXRuWm5RK0R4WEdqdTRReFhTeUNYZndqcUlSVENqY0xTV3JU?=
 =?utf-8?B?YkhrQzU0YUowMUF6ZDRqYjkyd2QyZ252bnhiMzhveVdhbEJoSFQ4OVNKUWJH?=
 =?utf-8?B?N043a1ptNm13aDJSMDNzU1lKZ3NJQ3B3NWJQWFFaSVltQm93NjVyZ1VkdzA2?=
 =?utf-8?B?VS9wNG5laWlYUWxVY1l6RVJuakI1RDZLT0Z4KzVLOXVPV1NPNytHT0N0VTY3?=
 =?utf-8?B?VytMQWFWYjl0OEwvTTMyV2VUTWsrTUVWb1ZibWdlcmhqaFRrdzcxRWJMWVZO?=
 =?utf-8?B?d0F0QVFJWWUvWWUweHZaekhPUEx1dWgzMWVsY3VpTno3T3gxeGpBNWVKZTBO?=
 =?utf-8?B?eVU5SXNnejZ3RW9uQTRPMkpxenYyb2d1VEhqM1NaSEtiQlhMWmtiSm5YTy9m?=
 =?utf-8?B?WkhFNHUxSG1DL0lIMkdSdTQ0dkJ0d0d0TWZIQmlyck5DL2xNZTNOVnUyNlg2?=
 =?utf-8?B?Y1VQVDdaNEt0aHJhRlplL1F4VitKQlR5cytJVUo2Nlk3V3FOQXZMR3VsK2Za?=
 =?utf-8?B?WTVDUkc0bDREWUJIUk5HaFlRWXJ0ZE9waHNrVVFhSGNCMDlVMXRHZDV0SFVv?=
 =?utf-8?B?R3plUTRBMndhM3ZkTS9hOU0vT1BuTGpDdXp6amowREsyRDhPaXlHSFh5NUZj?=
 =?utf-8?B?OHFPNVRrZjJpcDhUR29wWThXazM0Tk55UW9TQzFzQjV3VEc3ZG9FN0cydzJF?=
 =?utf-8?B?SjlxZU5Lcm5ZMHVoVkZLN2dhVlhqdXA2ZDA3RGFDa0FrQWNxbU5IelRoeTFU?=
 =?utf-8?B?Y2JyM2krOEdQTGpqc1ZZVlY3TEdLL1ZReWNLRmZPYm9qemZxWHlNNGErVTds?=
 =?utf-8?B?NDd5djlaT1A1RTdzdmxOZ3pOMEY5TWtMTFBzYUc1TUs4WHdWdEE2NU1jZWcy?=
 =?utf-8?B?NGhMY3BmeVZ0ejYvM29QZlNueGNXYmJiTjBQd3dyMEdGSDdPL2FERDg3cmY4?=
 =?utf-8?B?RzZJaWozVHVDNy96dzBkb1JCYktxYTg3dDJXd2V1YjNyQm5hd3FncWpKRVZF?=
 =?utf-8?B?Y0pvRGt2dHRtZkFxbEQ2SkRFTUlBNDNMMXBMemJZYUxhZkFHUURFcTdjdVMw?=
 =?utf-8?B?Yzh3SHgwd1ZQSEVxamFSbStRdE00Y1RYTXcrd3JUamdqclFoZHRSa01mMjFU?=
 =?utf-8?B?ZGU0SkYzREhiZWJsTTlUSUVvUThmWnlubVgraWpWMGFzQ3R1dmFMMjdSeWdj?=
 =?utf-8?B?aFgrRXNvRzRHTkpOMHVZU0lid0RHQ3JodVBndmsvSDFlKzFENmJ0TE9xdVVW?=
 =?utf-8?B?REt3K2RzL29nalE2QytSRGZaelhmeXpFT1JzSUE0OTQvOEtuN3JjMCtaSXJF?=
 =?utf-8?B?TjdXeHJ6cmFnMVUwTkZPamcvTDl1ejJiWllsdm05azY1VWRGZGRyelQ3ZzJk?=
 =?utf-8?B?MkllcDFMalJOMThQckM4SWlpVHdjaE9QMVRja1ZHTzF6UC91a2s5MDN6dnNu?=
 =?utf-8?B?QUgvSU5CRTRHRjgwZjRLanA0ZmdZNkpaaDBJYnIwcVp4ZmRLZDBveFpTQ1dR?=
 =?utf-8?B?RzhqTi9VOXJwZzEyM0tGSE1pYjY2Q2YydE5JV1d2Q3lvRFR0VzJESytnd3pm?=
 =?utf-8?B?L1VDRG9TbVhpZldkeVhjcEtXeUtDQnBzVXdLRkZtNHlaejJKelBQb1NCb3Fh?=
 =?utf-8?B?cDBlNk5OMVg0WGI3M0xQazhnTS9kbFd3ZVQvQjhlM01FV1d4QWVhN0dmZGRp?=
 =?utf-8?B?Zm5jTnZ4VDlaRzh4MGVZenVmZEYvb01RcXM1aUpZMmdyZ3JySTlnRmRpdnox?=
 =?utf-8?Q?WLv4lZzrorq7zKGkbk=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1322.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81d7be6-8965-42e4-f3b1-08d8e58dd639
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 19:34:21.8977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qAahbDf89SyJ4KDZG7+8Q+peBD65X5HTzUY6BfqxkZbz/gRIkXYUXtdHLs9pbIO5pBjiWIh+d86FREmWYI6oeD24Pass1WTuvXIgfzpRVIH3uosQBgck4arXvsYyhhOU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3036
Return-Path: khairul.rohaizzat.jamaluddin@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLCBzZWVtcyB0byBiZSBpbiB0aGUgbGlzdCBhcyB3ZWxsLi4NClRoZSB2ZXJzaW9uIGZvciBi
b3RoIGJyYW5jaCBpcyB3aXRoaW4gdGhlIHZlcnNpb25zIG1lbnRpb25lZCBpbiB0aGUgQ1ZFIHRv
by4NCg0KDQpUaGFuayB5b3UgJiBLaW5kIHJlZ2FyZHMsDQpLaGFpcnVsDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhh
bGYgT2YgS2hlbSBSYWoNClNlbnQ6IEZyaWRheSwgTWFyY2ggMTIsIDIwMjEgNzo1NiBBTQ0KVG86
IEphbWFsdWRkaW4sIEtoYWlydWwgUm9oYWl6emF0IDxraGFpcnVsLnJvaGFpenphdC5qYW1hbHVk
ZGluQGludGVsLmNvbT4NCkNjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2Ut
Y29yZSBsYXllciA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBnbGliYzogRml4IENWRS0yMDIxLTI3NjQ1DQoN
Ck9uIFRodSwgTWFyIDExLCAyMDIxIGF0IDc6MjEgQU0gSmFtYWx1ZGRpbiwgS2hhaXJ1bCBSb2hh
aXp6YXQgPGtoYWlydWwucm9oYWl6emF0LmphbWFsdWRkaW5AaW50ZWwuY29tPiB3cm90ZToNCj4N
Cj4gRnJvbTogS2hhaXJ1bCBSb2hhaXp6YXQgSmFtYWx1ZGRpbiANCj4gPGtoYWlydWwucm9oYWl6
emF0LmphbWFsdWRkaW5AaW50ZWwuY29tPg0KPg0KPiBDVkU6DQo+IENWRS0yMDIxLTI3NjQ1DQo+
DQoNCmxndG0uIERvIHdlIG5lZWQgaXQgZm9yIGR1bmZlbGwgYW5kIGdhdGVzZ2FydGggYXMgd2Vs
bCA/DQoNCj4gU2lnbmVkLW9mZi1ieTogS2hhaXJ1bCBSb2hhaXp6YXQgSmFtYWx1ZGRpbiANCj4g
PGtoYWlydWwucm9oYWl6emF0LmphbWFsdWRkaW5AaW50ZWwuY29tPg0KPiAtLS0NCj4gIC4uLi9n
bGliYy9nbGliYy9DVkUtMjAyMS0yNzY0NS5wYXRjaCAgICAgICAgICB8IDUxICsrKysrKysrKysr
KysrKysrKysNCj4gIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuMzMuYmIgICAgICAg
ICB8ICAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjL0NWRS0yMDIxLTI3NjQ1
LnBhdGNoDQo+DQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy9D
VkUtMjAyMS0yNzY0NS5wYXRjaCANCj4gYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliYy9nbGliYy9D
VkUtMjAyMS0yNzY0NS5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAw
MDAwMDAwLi4yNmM1YzBkMmE5DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYmMvZ2xpYmMvQ1ZFLTIwMjEtMjc2NDUucGF0Y2gNCj4gQEAgLTAsMCArMSw1MSBA
QA0KPiArRnJvbSBkY2E1NjU4ODZiNWU4YmQ3OTY2ZTE1ZjBjYTQyZWU1Y2ZmNjg2NjczIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgDQo+ICsyMDAxDQo+ICtGcm9tOiBESiBEZWxvcmllIDxkakByZWRoYXQu
Y29tPg0KPiArRGF0ZTogVGh1LCAyNSBGZWIgMjAyMSAxNjowODoyMSAtMDUwMA0KPiArU3ViamVj
dDogW1BBVENIXSBuc2NkOiBGaXggZG91YmxlIGZyZWUgaW4gbmV0Z3JvdXBjYWNoZSBbQlogIzI3
NDYyXQ0KPiArDQo+ICtJbiBjb21taXQgNzQ1NjY0YmQ3OThlYzhmZDUwNDM4NjA1OTQ4ZWVhNTk0
MTc5ZmJhMSBhIHVzZS1hZnRlci1mcmVlIA0KPiArd2FzIGZpeGVkLCBidXQgdGhpcyBsZWQgdG8g
YW4gb2NjYXNpb25hbCBkb3VibGUtZnJlZS4gIFRoaXMgcGF0Y2ggDQo+ICt0cmFja3MgdGhlICJs
aXZlIiBhbGxvY2F0aW9uIGJldHRlci4NCj4gKw0KPiArVGVzdGVkIG1hbnVhbGx5IGJ5IGEgdGhp
cmQgcGFydHkuDQo+ICsNCj4gK1JlbGF0ZWQ6IFJIQlogMTkyNzg3Nw0KPiArDQo+ICtSZXZpZXdl
ZC1ieTogU2lkZGhlc2ggUG95YXJla2FyIDxzaWRkaGVzaEBzb3VyY2V3YXJlLm9yZz4NCj4gK1Jl
dmlld2VkLWJ5OiBDYXJsb3MgTydEb25lbGwgPGNhcmxvc0ByZWRoYXQuY29tPg0KPiArDQo+ICtV
cHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IA0KPiArW2h0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0
Lz9wPWdsaWJjLmdpdDthPWNvbW1pdDtoPWRjYTU2NTg4NmI1ZThiZDc5DQo+ICs2NmUxNWYwY2E0
MmVlNWNmZjY4NjY3M10NCj4gKw0KPiArQ1ZFOiBDVkUtMjAyMS0yNzY0NQ0KPiArDQo+ICtSZXZp
ZXdlZC1ieTogQ2FybG9zIE8nRG9uZWxsIDxjYXJsb3NAcmVkaGF0LmNvbT4NCj4gK1NpZ25lZC1v
ZmYtYnk6IEtoYWlydWwgUm9oYWl6emF0IEphbWFsdWRkaW4gDQo+ICs8a2hhaXJ1bC5yb2hhaXp6
YXQuamFtYWx1ZGRpbkBpbnRlbC5jb20+DQo+ICstLS0NCj4gKyBuc2NkL25ldGdyb3VwY2FjaGUu
YyB8IDQgKystLQ0KPiArIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pDQo+ICsNCj4gK2RpZmYgLS1naXQgYS9uc2NkL25ldGdyb3VwY2FjaGUuYyBiL25zY2Qv
bmV0Z3JvdXBjYWNoZS5jIGluZGV4IA0KPiArZGJhNmNlZWMxYi4uYWQyZGFkZGFmZCAxMDA2NDQN
Cj4gKy0tLSBhL25zY2QvbmV0Z3JvdXBjYWNoZS5jDQo+ICsrKysgYi9uc2NkL25ldGdyb3VwY2Fj
aGUuYw0KPiArQEAgLTI0OCw3ICsyNDgsNyBAQCBhZGRnZXRuZXRncmVudFggKHN0cnVjdCBkYXRh
YmFzZV9keW4gKmRiLCBpbnQgZmQsIHJlcXVlc3RfaGVhZGVyICpyZXEsDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogTlVMTCk7DQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG5kb21haW4gPSAobmRvbWFpbiA/IG5ld2J1ZiArIG5k
b21haW5kaWZmDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgOiBOVUxMKTsNCj4gKy0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnVmZmVy
ID0gbmV3YnVmOw0KPiArKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqdG9mcmVl
cCA9IGJ1ZmZlciA9IG5ld2J1ZjsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IH0NCj4gKw0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5ob3N0ID0gbWVtY3B5
IChidWZmZXIgKyBidWZ1c2VkLCBAQCANCj4gKy0zMTksNyArMzE5LDcgQEAgYWRkZ2V0bmV0Z3Jl
bnRYIChzdHJ1Y3QgZGF0YWJhc2VfZHluICpkYiwgaW50IGZkLCByZXF1ZXN0X2hlYWRlciAqcmVx
LA0KPiArICAgICAgICAgICAgICAgICAgIGVsc2UgaWYgKHN0YXR1cyA9PSBOU1NfU1RBVFVTX1RS
WUFHQUlOICYmIGUgPT0gRVJBTkdFKQ0KPiArICAgICAgICAgICAgICAgICAgICAgew0KPiArICAg
ICAgICAgICAgICAgICAgICAgICBidWZsZW4gKj0gMjsNCj4gKy0gICAgICAgICAgICAgICAgICAg
ICAgYnVmZmVyID0geHJlYWxsb2MgKGJ1ZmZlciwgYnVmbGVuKTsNCj4gKysgICAgICAgICAgICAg
ICAgICAgICAgKnRvZnJlZXAgPSBidWZmZXIgPSB4cmVhbGxvYyAoYnVmZmVyLCBidWZsZW4pOw0K
PiArICAgICAgICAgICAgICAgICAgICAgfQ0KPiArICAgICAgICAgICAgICAgICAgIGVsc2UgaWYg
KHN0YXR1cyA9PSBOU1NfU1RBVFVTX1JFVFVSTg0KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHx8IHN0YXR1cyA9PSBOU1NfU1RBVFVTX05PVEZPVU5EDQo+ICstLQ0KPiArMi4yNy4wDQo+
ICsNCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuMzMuYmIg
DQo+IGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4zMy5iYg0KPiBpbmRleCBjNDc4
MjZhNTFlLi5kMGEyOTA4MjJiIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGli
Yy9nbGliY18yLjMzLmJiDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIu
MzMuYmINCj4gQEAgLTQ1LDYgKzQ1LDcgQEAgU1JDX1VSSSA9ICAiJHtHTElCQ19HSVRfVVJJfTti
cmFuY2g9JHtTUkNCUkFOQ0h9O25hbWU9Z2xpYmMgXA0KPiAgICAgICAgICAgICBmaWxlOi8vMDAz
MC1wb3dlcnBjLURvLW5vdC1hc2stY29tcGlsZXItZm9yLWZpbmRpbmctYXJjaC5wYXRjaCBcDQo+
ICAgICAgICAgICAgIGZpbGU6Ly8wMDMxLXg4Ni1SZXF1aXJlLWZ1bGwtSVNBLXN1cHBvcnQtZm9y
LXg4Ni02NC1sZXZlbC1tYXJrZXIucGF0Y2ggXA0KPiAgICAgICAgICAgICANCj4gZmlsZTovLzAw
MzItc3RyaW5nLVdvcmstYXJvdW5kLUdDQy1QUi05ODUxMi1pbi1yYXdtZW1jaHIucGF0Y2ggXA0K
PiArICAgICAgICAgICBmaWxlOi8vQ1ZFLTIwMjEtMjc2NDUucGF0Y2ggXA0KPiAgICAgICAgICAg
ICAiDQo+ICBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiAgQiA9ICIke1dPUktESVJ9L2J1aWxkLSR7
VEFSR0VUX1NZU30iDQo+IC0tDQo+IDIuMjkuMA0KPg0KPg0KPiANCj4NCg==
