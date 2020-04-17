Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.2564.1587088417053344139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2020 18:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=UwZJ4leG;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: I6tvtoPA3kG8bGRmRh38he2NuaZpq0VyNApaochIA3DEE9E8jgUKUaPVD9oDWa2oTcUN2BxFLs
 jggIon9lwxkA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 18:53:36 -0700
IronPort-SDR: 7/97emJCU46kg9vnZmmOwSvZitujiomSZ4McNcfQOm8goyUgbwRazRZuvYRY1Nv6816WgLRD0d
 7IKiptjfSsoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,393,1580803200"; 
   d="scan'208";a="333049107"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
  by orsmga001.jf.intel.com with ESMTP; 16 Apr 2020 18:53:36 -0700
Received: from orsmsx116.amr.corp.intel.com (10.22.240.14) by
 ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Apr 2020 18:53:36 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX116.amr.corp.intel.com (10.22.240.14) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Apr 2020 18:53:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Apr 2020 18:53:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSdicwiSczU+XsPfFDiEaGmo4LqRd8/XPBET8oZXwsjJ65Pe2w3WOEo+hZDydogAYx2xSn3v7pteV+xL58NfrRIiCfA8qKVyjIrzGwFQvCIJp5GsnMlJcoMM57dnft212rEQOGWlKS5iXICWgFjhzfqJ8cYeZ7mpWslJAVgXquyAR9jna98AWldcdSVC2zyK27+R2geP0z3chIodDyAMqGwjXLgG4psMkktintiT9fYWguHEJO1E5Y3oQYDb1bIL5Y+e01yrSfCK1WTuQGoO3xisIi0PkOrtR/73GWvesEc3rad1Sb5ySY7CAQxmeCR+5NJ303I2lyglemxAWOzUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aP0M71deKAQ5V7heDHhKlhP+yRZBE7fivwNnW0KpmQ=;
 b=G4p8r0XeCRLc/O3JZmRbS8+Ho8D3KT3Dr3AOOBTKT23zELs1S+Up+fdxWBplCqiDZvp7saUMF8Kxq13GbvEjI7IRVYNR/lhi/yggRgzygNgOx1tO/cj1ocmjTOPlPnnhb7ZH5n2RhgJlrP9RP2tlGDDk/PRZzwXldGK8N6MbJZYLjC6cx87CI2kUcYSAqGFsNnLCFpjcFwKZQtDUFBJwCXF8tfWk+1qj9XTNGgFpQhmGzOGAIgZvZLnY2gUvLOi4Dj1awolmEL8TePCw20LR9pIytrlf3/nAI5dOjymy56z/Gsuxn28bMkiZPuN8xhYlhFqajx0GOXagzl4y6RcY6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aP0M71deKAQ5V7heDHhKlhP+yRZBE7fivwNnW0KpmQ=;
 b=UwZJ4leGQrHRJPMWthMk5HMR36QAyoVVbVulbQxc8m+fasXk0jF1cjuCZC5DMHG6C62GYCcKLwFmqmO96u0ny0HMgOHBBU7lQxDjBIaGTOQY8QbZnxvw/b4/mHChdyd2SOl8i7KbDTKJ0lnmv4/0IH/mcbRs9PoeAYErttjnWFc=
Received: from BL0PR11MB3251.namprd11.prod.outlook.com (2603:10b6:208:64::23)
 by BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17; Fri, 17 Apr
 2020 01:53:22 +0000
Received: from BL0PR11MB3251.namprd11.prod.outlook.com
 ([fe80::d836:ec26:d73a:7b4c]) by BL0PR11MB3251.namprd11.prod.outlook.com
 ([fe80::d836:ec26:d73a:7b4c%6]) with mapi id 15.20.2900.028; Fri, 17 Apr 2020
 01:53:22 +0000
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa/runtime/weston: Enhance weston tests
Thread-Topic: [OE-core] [PATCH] oeqa/runtime/weston: Enhance weston tests
Thread-Index: AQHWEXB3YxMStz/FpUOJrndYsRE9Aqh8W7yAgAA2h1A=
Date: Fri, 17 Apr 2020 01:53:22 +0000
Message-ID: <BL0PR11MB3251695A651506BDAEC39943C8D90@BL0PR11MB3251.namprd11.prod.outlook.com>
References: <1586767753-29252-1-git-send-email-ee.peng.yeoh@intel.com>
 <e8c932bc18840d681befb3606076563ea5fbde84.camel@linuxfoundation.org>
In-Reply-To: <e8c932bc18840d681befb3606076563ea5fbde84.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ee.peng.yeoh@intel.com; 
x-originating-ip: [192.198.147.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c079a638-9b73-4496-3138-08d7e2721c3a
x-ms-traffictypediagnostic: BL0PR11MB3282:
x-microsoft-antispam-prvs: <BL0PR11MB32827F6584E325F10D614133C8D90@BL0PR11MB3282.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3251.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(366004)(396003)(136003)(376002)(346002)(39860400002)(81156014)(8676002)(55016002)(9686003)(186003)(6506007)(76116006)(86362001)(52536014)(66946007)(66476007)(316002)(64756008)(2906002)(66446008)(66556008)(8936002)(7696005)(53546011)(33656002)(5660300002)(110136005)(966005)(478600001)(71200400001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /GK0+Iq2WYL13mOekPy1q00BfhukutpUPZmfmxMNc2KfLW5pozkR8uCLgQs6vRauHI3Kje8pFWoDu3r/WeMdSyFf+4WNnvVLZa6ZBAD1myT3/iIJF3m5itdAi7So3QeX1j2Qokd76UThUo51h+F6ZivtJQnQi7yvbD4FmY/97RVq1feSeOqcL2j9SempJGOumAJk6jf572NWiKuS/NM3vOwzZf5vh5drYy6JOkzjss0hmoaxAX/sg7ex5cofNx9uklpf2Q+QWSmqxR75I9XQspv5AxADa/p5vZAzNU2c6PbiodTnD4CulR28vCemNIEtVxbWHnMS3Hci8wcQOxkk4FzPtovbdiJN4P4pC74m/Is7sKd1SpKUPtiRazJq4E4BwlH23nHglKR/1fRc6E6mUKxwhqT8wHVqum+WExJ4Lzi51jqhLUjSsVCyNj1OBpIHBu6py7EVAmw9J87FNd570t1NehPLDIdxfR7sy/ILg3wzvpnhqpaY6DGo97rSGfbR9RfAmYOfSH9lIH5BuCp0Zg==
x-ms-exchange-antispam-messagedata: x/vBy/qQhxuUOnnFIa/FKbS3y15NoJykjg7gLJmKBZhc/WEbi1odGHGpBmXoJ0RKIc/9xGvtoOeKnytvDpAg/qT7Xq4UE4lbcD+3GhaIymW3gmI+wgtuwN/k26HpcdRDTYWTU9meKaUe+2cot1KlZQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c079a638-9b73-4496-3138-08d7e2721c3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 01:53:22.2380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zsc0AeFmYJB/rhMatjTw5p5MfDE6cIrtyaaqWWt/LXpWvISqZGQSHPjDmi9NSih3/pKt2ryPaAjLWxD1dC8uwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3282
Return-Path: ee.peng.yeoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KQWZ0ZXIgbW9yZSB0ZXN0aW5nLCBJIHJlYWxpemVkIHRoYXQgaXQgd2ls
bCB0YWtlIGRpZmZlcmVudCBhbW91bnQgb2YgdGltZSBmb3IgZWFjaCBob3N0IG1hY2hpbmUgdG8g
aW5pdGlhbGl6ZSBuZXcgd2F5bGFuZCBjb21wb3NpdG9yLiBJIGhhZCBhZGRlZCB0aGUgbG9naWMg
dG8gcmV0cnkgdGhlIGNoZWNraW5nIG9mIG5ldyB3YXlsYW5kIGNvbXBvc2l0b3IgdG8gY29tcHJl
aGVuZCB0aGlzIGhvc3QgbWFjaGluZSBkaWZmZXJlbmNlcy4gSSBoYWQgc3VibWl0dGVkIHRoZSB2
MDIgcGF0Y2guIA0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIQ0KDQpUaGFua3MsDQpZZW9oIEVlIFBl
bmcgDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFB1cmRpZSA8
cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gDQpTZW50OiBGcmlkYXksIEFwcmls
IDE3LCAyMDIwIDY6MzUgQU0NClRvOiBZZW9oLCBFZSBQZW5nIDxlZS5wZW5nLnllb2hAaW50ZWwu
Y29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0hdIG9lcWEvcnVudGltZS93ZXN0b246IEVuaGFuY2Ugd2VzdG9u
IHRlc3RzDQoNCk9uIE1vbiwgMjAyMC0wNC0xMyBhdCAxNjo0OSArMDgwMCwgWWVvaCBFZSBQZW5n
IHdyb3RlOg0KPiBFeGlzdGluZyB3ZXN0b24gdGVzdCBhdmFpbGFibGUgbWFrZSBzdXJlIHRoYXQg
YSBwcm9jZXNzIGZvciANCj4gd2VzdG9uLWRlc2t0b3Atc2hlbGwgZXhpc3Qgd2hlbiBpbWFnZSBi
b290IHVwLg0KPiANCj4gRW5oYW5jZSB3ZXN0b24gdGVzdHMgYnk6DQo+ICAtIGV4ZWN1dGUgd2Vz
dG9uLWluZm8gdG8gbWFrZSBzdXJlIHdlc3RvbiBpbnRlcmZhY2UocykNCj4gICAgYXJlIGluaXRp
YWxpemVkDQo+ICAtIGV4ZWN1dGUgd2VzdG9uIGFuZCBtYWtlIHN1cmUgaXQgY2FuIGluaXRpYWxp
emUgYQ0KPiAgICBuZXcgd2F5bGFuZCBjb21wb3NpdG9yDQo+IA0KPiBbWU9DVE8jIDEwNjkwXQ0K
PiANCj4gU2lnbmVkLW9mZi1ieTogWWVvaCBFZSBQZW5nIDxlZS5wZW5nLnllb2hAaW50ZWwuY29t
Pg0KDQpJIHRoaW5rIHRoaXMgZmFpbHMgdW5kZXIgdGVzdGluZzoNCg0KaHR0cHM6Ly9hdXRvYnVp
bGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhvb24vIy9idWlsZGVycy80MC9idWlsZHMvMTc4NQ0K
DQpDaGVlcnMsDQoNClJpY2hhcmQNCg0K
