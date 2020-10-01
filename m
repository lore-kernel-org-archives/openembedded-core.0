Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.6907.1601536669992967356
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 00:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=fxJ5S6W6;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: F5VS/d1I7cjxP7Lab8beuO5FBWtQ4O+bR74KIzEEgk+6vH3WAzBiYV3cpNUegR+OMRblPIrgn0
 1dPoOaTsnWGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="226774489"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="226774489"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 00:17:47 -0700
IronPort-SDR: Li5dYjY64SMalsnYKGmSx8VBzQEWRSWVrMyqL74LzQerlIy+g3ZL89kF08vZpwfKI4o5Q5xxHk
 Bp/uTmlpaANA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="351006294"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Oct 2020 00:17:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 00:17:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 1 Oct 2020 00:17:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 1 Oct 2020 00:17:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 1 Oct 2020 00:17:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObR2k2k6NoEAA8XFSPm9PD8w+IMmuM5VL82mqWnpgRr/wnKNIJOcMmXop67rQEjGo6VB9i5JlFzlzsTEQnMPqE0L9WnqrcWNhPHrkZTb3BQVtk+1c/0IZqgSSTEyR5hvVDoNIi9GMpKZl+3EyjqjWDcX93fGxkrAucFgg43ZCQp4qmu0de8dcUN9QwpEzvcwkfzVsvR5/USCBCAKLqLg0jeh1iWcFHPzOV1Fyy84WITh9D3mW731TYs/WOuyj40QWUrdIwWFmxopzquernBasXOURQPICEs/S9lSGCS+9zMFWEbqrV2H8vOB57PFAaTo8+hapsGk539lSpcxge/n4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSjgOhaCnfteL/CTRc398w8XTrojQyxm6rsxJ222hmw=;
 b=P1ApI5RH00S18gO4viM4BDw75NyDAptQ9XPhABuggMr/RnkvWePhGQltJqjnhXM9+ubFL68nth2iuPeUqPmM5WJOoG2m3NGB2zh/dsQAhFNWXJSUDCp7XWsSulxvBT/gOUewCdDcw4dSUBfhOGFACJARjs2L6bWS5P02zsaNAaqRtiEf47PAABgvep8yqQmtuyJsv7Z5HibkMXYqbfMocz7I5r/8dtVlqkrbSw/pHYsMHldUpoyqFc8GLFAqH/q9KPBhZKp5JAuoQUS4KdAgX2k9rDEO+WKIDoEvR6pMv2J5IcU2XjGUoKPeIoNUbJVoHGSjoeu8ckgULqa6KGn6GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSjgOhaCnfteL/CTRc398w8XTrojQyxm6rsxJ222hmw=;
 b=fxJ5S6W687sjZocyIJ8uTzOIgq4jmab0xyORtcEjuf2EhXgIW8RmTUSJ1wwPXAO8sJ3fEjSq5g+tA3LFkEhAZmPuRkkLg+IN5EWZimH531MylEfR+/KFSZ7eNKyZ7Q/ebchVVLaINJYeaBdMiCZDFieB4EoT+tDw7dSfST812g0=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by BY5PR11MB4306.namprd11.prod.outlook.com (2603:10b6:a03:1bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36; Thu, 1 Oct
 2020 07:17:43 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::406e:4a1b:25b8:da3f]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::406e:4a1b:25b8:da3f%7]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 07:17:43 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Yocto Project
	<yocto@lists.yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
CC: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"yi.zhao@windriver.com" <yi.zhao@windriver.com>, "Sangal, Apoorv"
	<apoorv.sangal@intel.com>, "Chan, Aaron Chun Yew"
	<aaron.chun.yew.chan@intel.com>, "akuster808@gmail.com"
	<akuster808@gmail.com>, "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>,
	Steve Sakoman <steve@sakoman.com>, "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Subject: Re: QA notification for completed autobuilder build (yocto-3.1.3.rc1)
Thread-Topic: QA notification for completed autobuilder build
 (yocto-3.1.3.rc1)
Thread-Index: AQHWk0lI7KSPn8kdfkaK9GnZFRt7KqmCXphg
Date: Thu, 1 Oct 2020 07:17:43 +0000
Message-ID: <BYAPR11MB3624450DA1C599EFE37175F9E3300@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20200924111808.4B9ED1A00A2@debian8-ty-1.yocto.io>
 <032da6fc700a4018bc7e8d86fd188ad6b40fce36.camel@linuxfoundation.org>
In-Reply-To: <032da6fc700a4018bc7e8d86fd188ad6b40fce36.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [115.133.103.117]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eed4f82d-18f4-4f40-a9b9-08d865da172e
x-ms-traffictypediagnostic: BY5PR11MB4306:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB43065B53A35EB4162E424E60E3300@BY5PR11MB4306.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iRwAjKF43aTfHZFoD/wIBtM3OSthKAkXuP5PIatB1Zhbv8UYyIACEG3Oe0BPT8anXPe3uphC1mMdPuoc/sqYEm78LVtPw33P/OxrsZSo2fHlhH+0BCER73nG/6J/AAxqSRPMY89DtwFOIwFu1Q2MmRnDRlXSz1fvug52KBn4kPHJVtdc8HXsk5hB7G/7L0e5JWIWtM8ogBNN5AcNR9PKhqsS4JD2k9cuEICze8mWq2jdSAZkloja0uaXRHUf3UT+dMCryA2GahVkh0UD4WAfPQ9C0GXA3Blc3WdGfGjIEra/nQ3XeVh6GseYnhQiwP+hGCAeFsQqrIk5e1my2ErZMrmgqb714QwZ0cz4z1kL8oRcIri1OKqwGizFSheiddkcKabMSj8PXMhmM8lPaXS0tg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(8676002)(110136005)(316002)(54906003)(66946007)(76116006)(9686003)(66446008)(64756008)(7696005)(5660300002)(6506007)(186003)(66556008)(26005)(53546011)(52536014)(83380400001)(966005)(66476007)(55016002)(71200400001)(107886003)(8936002)(33656002)(15650500001)(2906002)(478600001)(86362001)(83080400001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: a4RdZSkJlgAi5tZz3AG565Y2F3EMxtHAPVxAoKQqQbqeGnFY13D+ojDq01/FY2Vf0WzYED/j/g1r9pNOoHDXxAzyY8DHABuHtdV6ADTUYhhXuTGVy2F3RnBfRbryjSHGBdAFDNuIpFVpUADgzk6odru9SJ56oB5sNG7lJEy9+DnXrToQAbZgIKL12gGhuxWpGareJLuctxJOf6C7EyKWGB8usUKStvJpC0OA6776JosRULgY6S1pKqHl7RTF3om4t+Dbq4TomkAHYwKSLzKUkliamRTf2/CUnsmeHjYujkyu88uc+ygv+DaiOH8NGHciMRZKG43mpU7HKOqTBK/t487kHFrX12Ct0sm5pkuEyhgq0zpVilq7ScES/ou9x/gCiX6gmCDrdzkftnKt+dbpnXENN4k3RY1eyjVuSsExXHRHunXinHRtlY0048ElG5+pTjxCMgxBorPU1QmNhh6ej3QN+Y+a6BhVWXQtKowzY+gh4GOUThW8Rpik3417zWoBTnKDqETQ/6a55ECihmYtg7wWBnMzByoMOwYoiIZEoU+qHZpLb7KHQDRzkUAuPOaRonWkBt8Y3gs68GxkQ6UxayRQmCgEM6f7retVCZJHlRMQ39ezeJv6poMObB6nSYPqNd4fzxdYCNbHWwGnno/Vtg==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eed4f82d-18f4-4f40-a9b9-08d865da172e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 07:17:43.7386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tCfBfGLyK+44cuSPW8hw0b+6Zk83REPBL74+vvyBsEktIGWxI5hw7RLf96UYnohU+GzdrR5OJHVP6aso1r6zxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4306
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gYWxsLA0KDQpUaGlzIGlzIHRoZSBmdWxsIHJlcG9ydCBmb3IgeW9jdG8tMy4xLjMucmMx
OiAgDQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL2NnaXQvY2dpdC5jZ2kveW9jdG8tdGVz
dHJlc3VsdHMtY29udHJpYi90cmVlLz9oPWludGVsLXlvY3RvLXRlc3RyZXN1bHRzDQoNCj09PT09
PT0gU3VtbWFyeSA9PT09PT09PQ0KTm8gaGlnaCBtaWxlc3RvbmUgZGVmZWN0cy4gIA0KTm8gbmV3
IGRlZmVjdHMgYXJlIGZvdW5kIGluIHRoaXMgY3ljbGUuDQoNCnBlcmwgcHRlc3QgZmFpbGVkIChC
VUcgaWQ6MTQwNzEpDQoNCj09PT09PT0gQnVncyA9PT09PT09PQ0KaHR0cHM6Ly9idWd6aWxsYS55
b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xNDA3MQ0KDQpUaGFua3MsDQpTYW5nZWV0
YQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IEZyaWRheSwg
MjUgU2VwdGVtYmVyLCAyMDIwIDEwOjM2IFBNDQo+IFRvOiBZb2N0byBQcm9qZWN0IDx5b2N0b0Bs
aXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBDYzogb3RhdmlvQG9zc3lzdGVtcy5jb20uYnI7IHlp
LnpoYW9Ad2luZHJpdmVyLmNvbTsgU2FuZ2FsLCBBcG9vcnYNCj4gPGFwb29ydi5zYW5nYWxAaW50
ZWwuY29tPjsgWWVvaCwgRWUgUGVuZyA8ZWUucGVuZy55ZW9oQGludGVsLmNvbT47IENoYW4sDQo+
IEFhcm9uIENodW4gWWV3IDxhYXJvbi5jaHVuLnlldy5jaGFuQGludGVsLmNvbT47DQo+IHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGFrdXN0ZXI4MDhAZ21haWwuY29tOw0KPiBz
am9sbGV5LnlwLnBtQGdtYWlsLmNvbTsgSmFpbiwgU2FuZ2VldGEgPHNhbmdlZXRhLmphaW5AaW50
ZWwuY29tPjsgU3RldmUNCj4gU2Frb21hbiA8c3RldmVAc2Frb21hbi5jb20+DQo+IFN1YmplY3Q6
IEZ3ZDogUUEgbm90aWZpY2F0aW9uIGZvciBjb21wbGV0ZWQgYXV0b2J1aWxkZXIgYnVpbGQgKHlv
Y3RvLTMuMS4zLnJjMSkNCj4gDQo+IFt0aGUgb3JpZ2luYWwgZW1haWwgYm91bmNlZCBmb3Igc29t
ZSByZWFzb24sIHJlc2VuZGluZyB0byB0aGUgbGlzdF0NCj4gDQo+IEEgYnVpbGQgZmxhZ2dlZCBm
b3IgUUEgKHlvY3RvLTMuMS4zLnJjMSkgd2FzIGNvbXBsZXRlZCBvbiB0aGUgYXV0b2J1aWxkZXIg
YW5kIGlzDQo+IGF2YWlsYWJsZSBhdDoNCj4gDQo+IA0KPiAgICAgaHR0cHM6Ly9hdXRvYnVpbGRl
ci55b2N0by5pby9wdWIvcmVsZWFzZXMveW9jdG8tMy4xLjMucmMxDQo+IA0KPiANCj4gQnVpbGQg
aGFzaCBpbmZvcm1hdGlvbjoNCj4gDQo+IGJpdGJha2U6IDE4ZTE5NTczMzdmZDlmMDZiYzY3M2Qy
OGRkNGY4Mjc3MzIxZDA3YmMNCj4gbWV0YS1hcm06IGM3YTFhNWY5ZmQ0MTVlM2FlMTA3OGMyYTFk
NmFmOWMyNWU5ZTY0OTgNCj4gbWV0YS1ncGx2MjogNjBiMjUxYzI1YmE4N2U5NDZhMGNhNGNkYzhk
MTdiMWNiMDkyOTJhYw0KPiBtZXRhLWludGVsOiBkNzEzNGU4NjU3NDE3Mjc4NGY5MDExN2MwM2Ew
MTJlMDA0OGQ4YmNiDQo+IG1ldGEta2VybmVsOiBjYjdmMGRjNWJiMWVhMDk5OGM4ZDRmY2I0ODYx
NDhkNGNhYjU3NWY0DQo+IG1ldGEtbWluZ3c6IDUyNGRlNjg2MjA1YjVkNjczNjY2MWQ0NTMyZjVm
OThmZWU4NTg5YjcNCj4gb2Vjb3JlOiBiMzliZGE0Y2M2MmRiMTJjMGVkZmJlNDg5ZDVhN2Y1OTg4
ZWRlNmE5DQo+IHBva3k6IDAxMmFkMTBhODlhODg5YzIxZTY3YzI3ZGMzN2QyMjUyMDIxMjU0OGYN
Cj4gDQo+IA0KPiANCj4gVGhpcyBpcyBhbiBhdXRvbWF0ZWQgbWVzc2FnZSBmcm9tIHRoZSBZb2N0
byBQcm9qZWN0IEF1dG9idWlsZGVyDQo+IEdpdDogZ2l0Oi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcv
eW9jdG8tYXV0b2J1aWxkZXIyDQo+IEVtYWlsOiByaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRp
b24ub3JnDQo+IA0KDQo=
