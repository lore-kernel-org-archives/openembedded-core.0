Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.55814.1629299457245375373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 08:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=BxFuLzhv;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="203489370"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="203489370"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2021 08:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; 
   d="scan'208";a="462748351"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga007.jf.intel.com with ESMTP; 18 Aug 2021 08:10:56 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 18 Aug 2021 08:10:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 18 Aug 2021 08:10:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 18 Aug 2021 08:10:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mk51vVRvNGMVrxqu6W/aNBfYm9L2rklRNo8lQCS0k/ILaxR59IygG/o8nOZSipDt8pHwyaTgi4wRbTEWVNJwRThSOKZ/6a8wrdBFVGhJ1M/HhieZ9ECweiznjH1cVvixct9DFkxaJ6mr8cOS9f6ZblW5ylpkXQguJS8XoBv/cCWTRB3J+VTUkQDv/mC+jed2NemxevmZ1OHJYfwGBNAs664jPLtofHdP6lhJAiTxgJFbKEBdVR+pAXGPP6HEfhl0PXa1TFu3NKJUSWJ981+MbDOaKdrk5VEu0lvgyxn3hvkhCnGDfr4RPm6XvcXFRF2Xg2zPOuCI/7EatU3lR144Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTAy4C79L7ikXOjUkVFx3CYb48Lh7TV2TKY/GGpHovE=;
 b=kDTGIgukU+MLOculmD5xMMAC8I5ZS+GFGOZsKvoV1epLHE1/qC6bBj+3P8GPtRytqyKxzh17HB3sy2rhd2mKvx++pDon6LOqmuNmsK5jEZ/g9JAdG7uc6gtcII5CCLWl8XnCgZUbTKv+WmHAIMjSnVroKh2gWNETVpBaQMtZ1wXuA8g9sWCKYy1evX/7TL8yFFPalxOfcjBIxuHDQW6hdyTpJdmNkoe6ZKCvg+O/d3io4yEYACTMRzt/XN2osuLLYPhU7KW0hUmBSFRkbhYh7qnprPZYnCA60zBpR0+7PMoOfjpTVsRoU31vf4NEOcF7pSQbk54HRba4yki0nGPKNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTAy4C79L7ikXOjUkVFx3CYb48Lh7TV2TKY/GGpHovE=;
 b=BxFuLzhvKumzC1k0P0wmICgXgMl0lpuf37Kq1Xp4OM41eLK/GVkEue5SgYPrxM4Ej9z0GIV2AtrhY9CKxx3h3ew0ZexgtBgEcbinAFcH9pMj851riBYcS+4bpelbe0cch9NlxGAI4+l7tp8PEqg6vprGliBrXx6J1lFKQ1grUbY=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BY5PR11MB3975.namprd11.prod.outlook.com (2603:10b6:a03:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Wed, 18 Aug
 2021 15:10:53 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::d7c:227b:e92b:611c]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::d7c:227b:e92b:611c%9]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 15:10:53 +0000
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "purushottamchoudhary29@gmail.com" <purushottamchoudhary29@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "sakoman@gmail.com"
	<sakoman@gmail.com>
CC: "Mikko.Rapeli@bmw.de" <Mikko.Rapeli@bmw.de>, "nisha.parrakat@kpit.com"
	<nisha.parrakat@kpit.com>
Subject: Re: [OE-core] [poky][dunfell][PATCHv5] lighttpd: Add patch for reuse large memory chunks
Thread-Topic: [OE-core] [poky][dunfell][PATCHv5] lighttpd: Add patch for reuse
 large memory chunks
Thread-Index: AQHXlCKQEH27e8XL4Ee7KsgtxrkC5Kt5XjIA
Date: Wed, 18 Aug 2021 15:10:53 +0000
Message-ID: <d1ddcc6632c56051b6f949e4802b3d5ae55575ce.camel@intel.com>
References: <1629285390-24529-1-git-send-email-purushottamchoudhary29@gmail.com>
In-Reply-To: <1629285390-24529-1-git-send-email-purushottamchoudhary29@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d2a7a90-90aa-4f45-164c-08d9625a5f5c
x-ms-traffictypediagnostic: BY5PR11MB3975:
x-microsoft-antispam-prvs: <BY5PR11MB3975F886B3294D8B6A9EF253F8FF9@BY5PR11MB3975.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: egdZ96jUHeTCVYl4dqummkW7hW1HjL59NGXqDtxjC7YSyggQtx7IS7iC5U881tBDDaI06gXeHQOIPrIT8VP3B87rWr2k9Cw6SLhcSsHVqtq38EHi47Ak9ke8aY68l4dL6Gknfcqb20ZgJpZbwleNfeVgtouofh+ZUFwsAP17SrQvUaePvAhceakkn8ebDou3wS4FkBv1whwljtP2q37lgBThJp8UEZptDJqdEe7BHVoKvivAoem7Om6OwRlDDxHiod4jFWhZ4QfFb7203xCZ37GGOGRuAW/44XuxKIisox5MD+MAeNpN1U7ggK87ym7P4zeM/pMxBmtxzvWl4gUx9PUksgh6wVMTn071tLfmZykZsQJb4iHQp3QIAKRa3VOrZxZykB49UQADcsv1DUF8+R9f7T2NIQdixF6OSvd8LHeVpdNQSziBTX05ZQt+lOwTnMADxPyojN93TmOxVIvm6VnN/HPOvRpK5II++nUftiyIcfF8bfuVfgNny6R+vBoOjpfvBG6B4PKnMlrMuTPK4D9qIZh+R37KEF/Z5cs+zbM2JiZvtvO2u7miULDevwo1G/nQGQnX5BB09U3bpUO+CUVci7lIDu0aZfKzA4a9Uaxk7GDcpmQrcyx3oThTyV8UHn6fUhDjXRzCNuhhZQLTeQRhKR7B858rGVymFFM6zVGHZ5Lx/w5pOTIYqKG35iYawyCsSrpCuaxX69gHwBfglyCLptYAVEqJUiPukF9VVfYXfK5RXXVA/NItmMUJvZJfEIi8Qg1hXt5WrceHzDGydolaZrfC12VM0wzmZ6AJWD0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(5660300002)(8936002)(316002)(54906003)(83380400001)(6512007)(6486002)(2616005)(110136005)(4326008)(508600001)(38100700002)(122000001)(966005)(6506007)(2906002)(86362001)(186003)(66476007)(66446008)(71200400001)(91956017)(76116006)(66556008)(66946007)(64756008)(38070700005)(26005)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHpHY2k5UHBhTTJiRitFT0xiSGg4QzdDak43ODBYR3NwM1hSZkhkUURrWWNj?=
 =?utf-8?B?V3NaMytTcVJUWXErOVVmajRRTHVMM2tncjRPVjFJNnVkL1Jxb2xnY1piWHp3?=
 =?utf-8?B?cVkwVVF2a1psRnhkOStRcnVmSnV4YnMyUndzU1ZjWjZPejV1WGoxQnNSQmVr?=
 =?utf-8?B?MmhyN1Nac2dwZjNCYlFQQ0JLN0VkY2tRdTVvMDkxSHhIdTR5aUhEcFViWEdG?=
 =?utf-8?B?UFFTcjVraXpraFcvT2o3b00rWThxREhWL3g1WDhTV3AxR1FCZWxwRlk2bTVu?=
 =?utf-8?B?ZVV0ZzREZmlQT1JFeW0ySW44NHl0QmxhMnQ3R3NBZzN1eTNRTjlzbk5lZXhi?=
 =?utf-8?B?aVNVZFd3QTZHam45aUlwRVhjdVA0eC9SVUpMd1pzV3QvTS9rZmw2V1cyV1lm?=
 =?utf-8?B?aFZ6ajhqc1AzbXhrLzJVY2U3NytqSzdGK1JhOTk3aVlSV0dWMmJUWkl2QVBX?=
 =?utf-8?B?WG81bEVvN0ZFbVNXRnRtejdKSEtGdEgwSlJMNUZ3L0Y5ZnhqbXE4czhCL0dU?=
 =?utf-8?B?b3MxeHg3RlVZbUJZMjdJalFoT1h0d25RVkcvTDFxVnhTcHV6aUdjTjVWMEtF?=
 =?utf-8?B?ZzFTa092RU95QWIvWmt4TTQvanFPbEEwSWpTcEF1OVd2NmVZNEk3MWlFMUFU?=
 =?utf-8?B?Vmt6aW9ETzJCR1dWV05UTFJVRktrT3IwanZtNXR0WlhqZFJwRlQybmtLTnUz?=
 =?utf-8?B?SElJdEdTY1RzUjFLQzJMVXVGWFJuY3o0RE9YcXJhWDB3d3k0ZXBkQ0c4YXFB?=
 =?utf-8?B?WWR2aDhTWVJ4aUk0Nk95QUQ0L21SL3hsd0kwY2xqV3B1dTZwc1drOEU2NEdk?=
 =?utf-8?B?QVYzR1QwaUZiU05FdDBFbVhhajAxVWZqK3d4aTZpS1A3QTZmMU92cEp6VWc4?=
 =?utf-8?B?UUM1bWpwdThwQUZFdDhtc0l2bEsvMlJQWEdobisvalFlZW5RZjJRdzI5Qytm?=
 =?utf-8?B?RElSNGVTSFpvbFBKZkRyaWx4SlVRNGc2a1FGUUFKcVF6V2ZqSVlWNTZ0ck82?=
 =?utf-8?B?YktidVgxSkJCVW03NXVQcXd5UXlDMlF0T0RsNDdTdGdZbFgxbUFWcFA5YnB2?=
 =?utf-8?B?QzZIbExRQk1IZlYySmhDOHYzOVJEOVc2NFJYczJUdU5xL2M1YTlrTm4rL1NH?=
 =?utf-8?B?MHIrbFhnYTBaTmdFY29DamwyblM5Y2srZHBHMkJIRFRvSXhaNGxUSTZjOXNv?=
 =?utf-8?B?TmNoSXo1R1F3NXNORzNqTE51ZXlsd3U4WkVVN0ZGZDNVR3FhK2xLUkdJckMx?=
 =?utf-8?B?R1VYWlNPckVnWlF6K2k1TDM1dnZRcUpXR1lad29VN2ZpU0J4RVV6MEdrcGZt?=
 =?utf-8?B?SmZuZEtwNkhqU3R1bndhbHE4aHJheklSd2ZKcC9CU0lpbGthUTNvcldjYUU4?=
 =?utf-8?B?eExTMlJhd2dudm5mTkJSNFVLY0kra0dBZ3NIUmk4Z2tYNHJYWWdxVnd5c05o?=
 =?utf-8?B?WHprOHE3MFdmM2tNNVA2b2NFZzZHUDNEZ25mcjc5Q0cveSttOGFDL0pjNVRu?=
 =?utf-8?B?aWhHcGdLOFVaVkJnQUxqUUxOZmJZbytxNW50bTdLdjQwcG51RC9OeWE5RnZ2?=
 =?utf-8?B?WWdNaVNEOENNazdMeG1oUWRCZ0RLNXM0OHkvRGk0S3V2aS8yOXdWbWlNVzY5?=
 =?utf-8?B?Z3VGa3lzdUZHMkFhRE5uWnpGaWRHUWdzZ0hNRkJxb2psK3lnWjZlU2dwTG01?=
 =?utf-8?B?c3RhOCsyaFV2K3hVcUVJa1l3ZUZpRFNack5tMWlLVEpvbEFPbHN4bUcvK09j?=
 =?utf-8?B?YmxFUVNYZEUyOVRSV2JJc2tiVkZkSXdrQ05pTFVQWUs0TUdYemdPalFwL3lK?=
 =?utf-8?B?OS9PQ0lSMFFhTW92aE5UUT09?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2a7a90-90aa-4f45-164c-08d9625a5f5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 15:10:53.4716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8yVqUKDnMskuDJpXCZmtIVDQkH8c7FzXN1oyge/lLp05tLCfZ5E+yYQPep33AUpaF1CPWeRp7GGji5TdJSVrIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3975
Return-Path: anuj.mittal@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <13ABF6E5861244418974ED777AAB6AE5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

SGVsbG8NCg0KT24gV2VkLCAyMDIxLTA4LTE4IGF0IDE2OjQ2ICswNTMwLCBQdXJ1c2hvdHRhbSBD
aG91ZGhhcnkgd3JvdGU6DQo+IEZyb206IEdsZW5uIFN0cmF1c3MgPGdzdHJhdXNzQGdsdWVsb2dp
Yy5jb20+DQo+ICtEYXRlOiBXZWQsIDIzIERlYyAyMDIwIDIzOjE0OjQ3IC0wNTAwDQo+ICtTdWJq
ZWN0OiBbUEFUQ0hdIHJldXNlIGxhcmdlIG1lbSBjaHVua3MgKGZpeCBtZW0gdXNhZ2UpIChmaXhl
cyAjMzAzMykNCj4gKw0KPiArKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21taXQgN2JhNTIxZmZiNDk1
OWY2Zjc0YTYwOWQ1ZDRhY2FmYzI5YTAzODMzNykNCj4gKw0KPiArKHRoeCBmbHlubikNCj4gKw0K
PiArZml4IGxhcmdlIG1lbW9yeSB1c2FnZSBmb3IgbGFyZ2UgZmlsZSBkb3dubG9hZHMgZnJvbSBk
eW5hbWljIGJhY2tlbmRzDQo+ICsNCj4gK3JldXNlIG9yIHJlbGVhc2UgbGFyZ2UgbWVtb3J5IGNo
dW5rcw0KPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KPiArDQo+IGh0dHBzOi8vcmVkbWlu
ZS5saWdodHRwZC5uZXQvcHJvamVjdHMvbGlnaHR0cGQvcmVwb3NpdG9yeS8xNC9yZXZpc2lvbnMv
N2JhNTIxZmZiNDk1OWY2Zjc0YTYwOWQ1ZDRhY2FmYzI5YTAzODMzNw0KPiArU2lnbmVkLW9mZi1i
eTogUHVydXNob3R0YW0gQ2hvdWRoYXJ5IDxQdXJ1c2hvdHRhbS5DaG91ZGhhcnlAa3BpdC5jb20+
DQo+ICt4LXJlZjoNCj4gK8KgICJNZW1vcnkgR3Jvd3RoIHdpdGggUFVUIGFuZCBmdWxsIGJ1ZmZl
cmVkIHN0cmVhbXMiDQo+ICvCoCBodHRwczovL3JlZG1pbmUubGlnaHR0cGQubmV0L2lzc3Vlcy8z
MDMzDQo+ICsNCj4gKy0tLQ0KPiArIHNyYy9jaHVuay5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IDk5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+IC0tLS0tLS0t
LQ0KPiArIHNyYy9jaHVuay5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArDQo+ICsgc3Jj
L2h0dHAtaGVhZGVyLWdsdWUuYyB8wqAgMiArLQ0KPiArIDMgZmlsZXMgY2hhbmdlZCwgODIgaW5z
ZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQo+ICsNCj4gK2RpZmYgLS1naXQgYS9zcmMvY2h1
bmsuYyBiL3NyYy9jaHVuay5jDQo+ICtpbmRleCAwOWRkM2YxLi5mZmIzNzk1IDEwMDY0NA0KPiAr
LS0tIGEvc3JjL2NodW5rLmMNCj4gKysrKyBiL3NyYy9jaHVuay5jDQo+ICtAQCAtMjgsMTYgKzI4
LDIwIEBADQo+ICsgc3RhdGljIHNpemVfdCBjaHVua19idWZfc3ogPSA0MDk2Ow0KPiArIHN0YXRp
YyBjaHVuayAqY2h1bmtzLCAqY2h1bmtzX292ZXJzaXplZDsNCj4gKyBzdGF0aWMgY2h1bmsgKmNo
dW5rX2J1ZmZlcnM7DQo+ICsrc3RhdGljIGludCBjaHVua3Nfb3ZlcnNpemVkX247DQo+ICsgc3Rh
dGljIGFycmF5ICpjaHVua3F1ZXVlX2RlZmF1bHRfdGVtcGRpcnMgPSBOVUxMOw0KPiArIHN0YXRp
YyBvZmZfdCBjaHVua3F1ZXVlX2RlZmF1bHRfdGVtcGZpbGVfc2l6ZSA9DQo+IERFRkFVTFRfVEVN
UEZJTEVfU0laRTsNCj4gKyANCj4gKyB2b2lkIGNodW5rcXVldWVfc2V0X2NodW5rX3NpemUgKHNp
emVfdCBzeikNCj4gKyB7DQo+ICstwqDCoMKgIGNodW5rX2J1Zl9zeiA9IHN6ID4gMCA/ICgoc3og
KyAxMDIzKSAmIH4xMDIzdUwpIDogNDA5NjsNCj4gKyvCoMKgwqAgc2l6ZV90IHggPSAxMDI0Ow0K
PiArK8KgwqDCoCB3aGlsZSAoeCA8IHN6ICYmIHggPCAoMXUgPDwgMzApKSB4IDw8PSAxOw0KPiAr
K8KgwqDCoCBjaHVua19idWZfc3ogPSBzeiA+IDAgPyB4IDogNDA5NjsNCg0KVGhpcyBkb2Vzbid0
IGxvb2sgbGlrZSBhIGNsZWFuIGJhY2twb3J0IGFuZCB5b3Ugc2VlbSB0byBoYXZlIGNoYW5nZWQN
CnRoZSBjaHVuayBzaXplIHRvIDRrIGZyb20gOGsgaW4gdGhlIHBhdGNoLiBUaGlzIHNob3VsZCBi
ZSBtZW50aW9uZWQuDQoNCj4gKyB9DQo+ICsgDQo+ICsgdm9pZCBjaHVua3F1ZXVlX3NldF90ZW1w
ZGlyc19kZWZhdWx0X3Jlc2V0ICh2b2lkKQ0KPiArIHsNCj4gKyvCoMKgwqAgY2h1bmtfYnVmX3N6
ID0gODE5MjsNCg0KV2hpbGUgaGVyZSBpdCdzIGJlaW5nIHJlc2V0IHRvIDhrLiBUaGlzIGxvb2tz
IHdyb25nIC4uLiBQZXJoYXBzIHlvdQ0Kc2hvdWxkIGNvbnNpZGVyIHRha2luZyBhbiBlYXJsaWVy
IGNvbW1pdCBhcyB3ZWxsIHRoYXQncyBjaGFuZ2luZyB0aGUNCnNpemUgdG8gOGsuIEFsc28sIGlz
IHRoZSBhaW0gb2YgdGhpcyBwYXRjaCBpcyB0byBmaXgNCg0KaHR0cHM6Ly9yZWRtaW5lLmxpZ2h0
dHBkLm5ldC9pc3N1ZXMvMzAzMw0KDQo/IElmIHllcywgeW91IHByb2JhYmx5IG5lZWQgc29tZSBv
dGhlciBwYXRjaGVzIGFzIHdlbGw6DQoNCmh0dHBzOi8vcmVkbWluZS5saWdodHRwZC5uZXQvaXNz
dWVzLzMwMzM/dGFiPWNoYW5nZXNldHMNCg0KVGhhbmtzLA0KDQpBbnVqDQo=
