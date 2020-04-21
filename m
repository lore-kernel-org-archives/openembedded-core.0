Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.589.1587430583863763271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 17:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=q9HE1AoO;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: Zjj7zIhfHLQQPYSr3z6/8InGGqe/NZyGUWAS8TPIlBW+JDyx7wHO+lAwix+P87pUtJ4i68Y11f
 AV+wBDo1Y1CA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 17:56:23 -0700
IronPort-SDR: zJmQ6Rezz25YRYk8W42/Q6I22cnc7jxIFEW0CVIYlh4bTm8PRv5fwhy9x2oDZfzfOI6jkOIGlV
 8YaZR0bFvSVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,408,1580803200"; 
   d="scan'208";a="455893465"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
  by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2020 17:56:23 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Apr 2020 17:56:22 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX153.amr.corp.intel.com (10.22.226.247) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Apr 2020 17:56:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Apr 2020 17:56:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvC69y2WZxA2RLkQwFKtCToYxs5xhEm+ZspJbBJZ4z6Tyx56PHP79nRj5g/IwW1RxbhDhUy34cwebeVzfPII1bl5aZS2oXoH30WlR4/QqCy/kv/u0EdzRx8uLFpYN3iZ+0LZRFUjgXIBy/gRapMXyF5EGGALeH9t/1ZByUVK+nWH24MIxJSGKzJ10qxuZ30eN0w7CqUCcTkLvkvuI0s3nJWdWVale6Q7TPw62ldfDLvW43Ju4+TD4TPJJxLm7xsUdT4aRRNY9cXwBaghS9PzaXF3SAlVv6MPvvu1nq/JPcZ5HaqNNRkSBte9dEU8kxwLv6y45kc4rEpE/YmM5L8xyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqrUqoATfMGGznaL24yO06vHc4sjalWsOIs/C85u5jc=;
 b=QvoZMnuO2r0WHkNC09tbVnJO+Gk84SPXoiXPA2HrlyKqbW9j/ZCcHSSrkzdN/elyOoOZP81ZhAqaNpcixwo24AuEUCc0fDzLaUsRovmPva4qIzfmcxzolCP2s758LQy0ggbrZN+/k+UAQMy8Q0GqMZWeNk8LMwBVCp/5jYDnzw6v63H/51zARwdeiP1DiPnzLgoPJwd5WdBN+RAYYI/MCmeq7QBgCCsmAuUX1dUnYzvio6T1rlTAjv+lqu3+LPB+8g+baT2Gvtx18wohFK4Az7J3x2E2/IcZ1/xOwP9H8Snclpl3EzlWDkV6vfQ0XBSwvxv5oiR73kJScpCSgNzJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqrUqoATfMGGznaL24yO06vHc4sjalWsOIs/C85u5jc=;
 b=q9HE1AoOwZSiGmJBzIbYl/nskSN2byAwXBpT4q7mIdqg4Yu3cL7cKZGx4deVtNBdMAtMhUrvWQtD0HV6Yc9aOzvTs+6d+mQfZa7BNO0LensHvPbe45Pw15pzoSMc7wm4HiVqi+t1dg6J/HL3fJsclGHRjUXyQpZNx1oLJkBgAYQ=
Received: from BL0PR11MB3251.namprd11.prod.outlook.com (2603:10b6:208:64::23)
 by BL0PR11MB3089.namprd11.prod.outlook.com (2603:10b6:208:79::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 00:56:19 +0000
Received: from BL0PR11MB3251.namprd11.prod.outlook.com
 ([fe80::d836:ec26:d73a:7b4c]) by BL0PR11MB3251.namprd11.prod.outlook.com
 ([fe80::d836:ec26:d73a:7b4c%6]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 00:56:19 +0000
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa/runtime/weston: Enhance weston tests
Thread-Topic: [OE-core] [PATCH] oeqa/runtime/weston: Enhance weston tests
Thread-Index: AQHWEXB3YxMStz/FpUOJrndYsRE9Aqh8W7yAgAA2h1CAANJogIAFZvRw
Date: Tue, 21 Apr 2020 00:56:19 +0000
Message-ID: <BL0PR11MB3251FF00AC48D52C81AD57D5C8D50@BL0PR11MB3251.namprd11.prod.outlook.com>
References: <1586767753-29252-1-git-send-email-ee.peng.yeoh@intel.com>
	 <e8c932bc18840d681befb3606076563ea5fbde84.camel@linuxfoundation.org>
	 <BL0PR11MB3251695A651506BDAEC39943C8D90@BL0PR11MB3251.namprd11.prod.outlook.com>
 <32628e313368db285b51d04b8278dfcdace4c7c7.camel@linuxfoundation.org>
In-Reply-To: <32628e313368db285b51d04b8278dfcdace4c7c7.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ee.peng.yeoh@intel.com; 
x-originating-ip: [192.198.147.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36e847fe-8f33-49a4-3d2b-08d7e58ecdb3
x-ms-traffictypediagnostic: BL0PR11MB3089:
x-microsoft-antispam-prvs: <BL0PR11MB3089244096B281C391A9E95DC8D50@BL0PR11MB3089.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3251.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(366004)(39860400002)(346002)(396003)(136003)(376002)(9686003)(55016002)(76116006)(66446008)(66556008)(66476007)(66946007)(52536014)(81156014)(8676002)(2906002)(5660300002)(8936002)(64756008)(86362001)(33656002)(966005)(478600001)(186003)(71200400001)(26005)(7696005)(6506007)(110136005)(53546011)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hYL1cBLQ1HDLmIFWmXI8M3hGf0u6A0eA7djIwo8aH64KZmucUV4zvQ/avButWFzu0qX+AfbOI/L5iMTKfWdJaCG+KqsPRRGXHNxGwXiZT7GjOU+GGOgk+p3cab4KaAm4O/n7A7Ubw4Wb9J5whToJaKN6FJ5rLj4EtI7ZzEF41Xh+4Mte+mBjZXu2kSAyMwhteonRM0xJFsqqL7vhle6sY24ELBbi32Vk8Csi9ik+vAkXqms8PW/x/KnaeT/WUQ6z6X9ISAnaXbeVQglIDyBD1BG961SX/ZdIxBdVIOcySvv2ZhMfR2ekA2OtriEEDYx1l6bO4tK7VUrDqmd2zhLcladuNtREvFGCRJTn7YPu2YnRy5sR0ZKaYiAM/KaCaS9jyWAR4F2YEHFFLuS23A7xKvj6EJsoStQbkoBoMC93FneXgHOCCzCxxDKZKaxQnWB+olZiopayqTp0GgL6F9hVSlsIt61t5mXGNtgGJlKsKck5hcBLjfpZjRsFNB83ICbwaZzZIaVDg17JdcdCay9+nw==
x-ms-exchange-antispam-messagedata: yqyeQQ8IjHwYo2aW9vZCJicX4OChcahYMvNU8EV3gtun5k5UjVuPRLaa4gu5mdBahjKhhAAge90xff7C2O2GmC1N1sThPbanu7aNETL/LiH42bxF3eDa8Q/oGWvulyOFCgrnwlvkkenyTq+0vJ1A5w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e847fe-8f33-49a4-3d2b-08d7e58ecdb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 00:56:19.4177
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AUTyy2uyOL92U8vUZSXOeRL5gruvBAvyWfuXrneLmVNR/DOyUujUaFp90aMVGpHfXXjiXTcFyH4OheBL/YFoVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3089
Return-Path: ee.peng.yeoh@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KSSBmb3VuZCB0aGF0IEkgaGFkIG1pc3NlZCB0aGUgRElTVFJPX0ZFQVRV
UkVTX3JlbW92ZSA9ICJ4MTEiIGNvbmZpZ3VyYXRpb24gZHVyaW5nIHByZXZpb3VzIGRldmVsb3Bt
ZW50IGFuZCB0ZXN0aW5nLCBJIGhhZCBzdWNjZXNzZnVsbHkgcmVwcm9kdWNlIHRoZSBpc3N1ZSBh
ZnRlciBpbmNvcnBvcmF0ZSB0aGUgRElTVFJPX0ZFQVRVUkVTX3JlbW92ZSA9ICJ4MTEiLiBJIGhh
ZCB0ZXN0ZWQgdGhlIHYwMyBwYXRjaCBhbmQgc3VibWl0dGVkIHRoZSBwYXRjaC4gDQpTb3JyeSBm
b3IgbXkgbWlzdGFrZS4gDQoNCmh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1jb3JlL21lc3NhZ2UvMTM3MzMyDQpodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzEzNzMzMw0KDQp2MDM6DQogLSBwcmV2aW91
cyBwYXRjaCBtaXNzZWQgdGhlIERJU1RST19GRUFUVVJFU19yZW1vdmUgPSAieDExIg0KICAgY29u
ZmlndXJhdGlvbiBpbiB0aGUgYnVpbGRpbmcgb2YgY29yZS1pbWFnZS13ZXN0b24sIHdoZXJlDQog
ICB0aGUgdGVzdCB3YXMgdXNpbmcgeDExIERJU1BMQVkgZm9yIGluaXRpYWxpemluZyBuZXcgDQog
ICB3YXlsYW5kIGNvbXBvc2l0b3INCiAtIHJlcGxhY2UgdGhlIGVudmlyb25tZW50IHNldHVwICdl
eHBvcnQgRElTUExBWT06MCcgd2hpY2ggDQogICB1c2UgeDExIHdpdGggJ2V4cG9ydCBXQVlMQU5E
X0RJU1BMQVk9d2F5bGFuZC0wJyBzaW5jZSB0aGUNCiAgIHRhcmdldCBjb3JlLWltYWdlLXdlc3Rv
biBoYWQgcmVtb3ZlZCB4MTEgDQogLSBpbmNsdWRlIGxvZ2dpbmcgZm9yIHdheWxhbmQgY29tcG9z
aXRvciBpbml0aWFsaXphdGlvbiANCiAgIHRvIHRyYWNrIGRldGFpbCBmb3IgZGVidWdnaW5nIGlu
IGNhc2UgdGVzdCBmYWlsDQoNClRoYW5rcywNCkVlIFBlbmcNCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPiANClNlbnQ6IEZyaWRheSwgQXByaWwgMTcsIDIwMjAgMTA6MjQgUE0NClRvOiBZ
ZW9oLCBFZSBQZW5nIDxlZS5wZW5nLnllb2hAaW50ZWwuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIG9l
cWEvcnVudGltZS93ZXN0b246IEVuaGFuY2Ugd2VzdG9uIHRlc3RzDQoNCkhpIEVlIFBlbmcsDQoN
Ck9uIEZyaSwgMjAyMC0wNC0xNyBhdCAwMTo1MyArMDAwMCwgWWVvaCwgRWUgUGVuZyB3cm90ZToN
Cj4gSGkgUmljaGFyZCwNCj4gDQo+IEFmdGVyIG1vcmUgdGVzdGluZywgSSByZWFsaXplZCB0aGF0
IGl0IHdpbGwgdGFrZSBkaWZmZXJlbnQgYW1vdW50IG9mIA0KPiB0aW1lIGZvciBlYWNoIGhvc3Qg
bWFjaGluZSB0byBpbml0aWFsaXplIG5ldyB3YXlsYW5kIGNvbXBvc2l0b3IuIEkgaGFkIA0KPiBh
ZGRlZCB0aGUgbG9naWMgdG8gcmV0cnkgdGhlIGNoZWNraW5nIG9mIG5ldyB3YXlsYW5kIGNvbXBv
c2l0b3IgdG8gDQo+IGNvbXByZWhlbmQgdGhpcyBob3N0IG1hY2hpbmUgZGlmZmVyZW5jZXMuIEkg
aGFkIHN1Ym1pdHRlZCB0aGUgdjAyIA0KPiBwYXRjaC4NCj4gDQo+IFRoYW5rIHlvdSB2ZXJ5IG11
Y2ghDQoNCkkgZGlkIHRyeSB0aGUgdjIgcGF0Y2ggYnV0IGl0IHN0aWxsIGZhaWxlZCB1bmZvcnR1
bmF0ZWx5Og0KDQpodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8j
L2J1aWxkZXJzLzQwL2J1aWxkcy8xNzg4DQoNCkNoZWVycywNCg0KUmljaGFyZA0KDQo=
